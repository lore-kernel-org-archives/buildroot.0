From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Tue,  4 Feb 2020 11:07:31 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200129172618.16966-1-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
Message-ID: <20200204100733.22106-1-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The issue fixed by 0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch (ERL-529)
has been fixed since OTP20.3 (a5cbcbdb85) and is no longer required.

OTP provides wrapper scripts (otp_build and configure) which perform tasks
previously handled directly by autotools i.e. autoreconf.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
Changes v1 -> v2:
 - nothing

My motivation for this version bump is that I want to bump RabbitMQ to the
latest version (3.8.2) which depends on Erlang 21.x or later. There are 2
packages which depend on Erlang that I tested. The test consisted of booting and
ensuring the daemon is running.

- ejabberd:
  daemon starts without issue
- RabbitMQ:
  I encountered an issue where the binaries are installed in
  rabbitmq-0.0.0 but the symlink in /usr/sbin expects them to be in
  rabbitmq-3.6.6. After manually fixing the symlink the daemon started without
  issue. The symlink issue is unrelated to Erlang and does not show up with
  3.8.2 so I did not investigate this further.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 ...-with-LDLIBS-instead-of-LIBS-for-DED.patch | 42 -------------------
 package/erlang/erlang.hash                    |  4 +-
 package/erlang/erlang.mk                      | 19 ++++++---
 3 files changed, 16 insertions(+), 49 deletions(-)
 delete mode 100644 package/erlang/0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch

diff --git a/package/erlang/0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch b/package/erlang/0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
deleted file mode 100644
index ad0bb6b453..0000000000
--- a/package/erlang/0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 011752ec7b31e3dde376270fc65c7ee70644f6e7 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Wed, 6 Dec 2017 15:01:17 +0100
-Subject: [PATCH] Link with LDLIBS instead of LIBS for DED
-
-Fix ERL-529 by avoiding to link with libz for no reason.
-
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- lib/asn1/c_src/Makefile             | 2 +-
- lib/runtime_tools/c_src/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/asn1/c_src/Makefile b/lib/asn1/c_src/Makefile
-index 1f714df357..f7c6b8b9bc 100644
---- a/lib/asn1/c_src/Makefile
-+++ b/lib/asn1/c_src/Makefile
-@@ -126,7 +126,7 @@ $(NIF_LIB_FILE): $(NIF_STATIC_OBJ_FILES)
- 	$(V_RANLIB) $@
- 
- $(NIF_SHARED_OBJ_FILE): $(NIF_OBJ_FILES)
--	$(V_LD) $(LDFLAGS) -o $(NIF_SHARED_OBJ_FILE) $(NIF_OBJ_FILES) $(CLIB_FLAGS) $(LIBS)
-+	$(V_LD) $(LDFLAGS) -o $(NIF_SHARED_OBJ_FILE) $(NIF_OBJ_FILES) $(CLIB_FLAGS) $(LDLIBS)
- 
- # ----------------------------------------------------
- # Release Target
-diff --git a/lib/runtime_tools/c_src/Makefile.in b/lib/runtime_tools/c_src/Makefile.in
-index 4530a83aee..4e13e0d789 100644
---- a/lib/runtime_tools/c_src/Makefile.in
-+++ b/lib/runtime_tools/c_src/Makefile.in
-@@ -95,7 +95,7 @@ $(OBJDIR)/%$(TYPEMARKER).o: %.c dyntrace_lttng.h
- 	$(V_CC) -c -o $@ $(ALL_CFLAGS) $<
- 
- $(LIBDIR)/%$(TYPEMARKER).@DED_EXT@: $(OBJDIR)/%$(TYPEMARKER).o
--	$(V_LD) $(LDFLAGS) -o $@ $^ $(LIBS)
-+	$(V_LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)
- 
- clean:
- 	rm -f $(TRACE_LIBS)
--- 
-2.14.1
-
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index 616c85e9ae..3c2f039496 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,4 +1,4 @@
 # md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5 350988f024f88e9839c3715b35e7e27a  otp_src_21.0.tar.gz
-sha256 c7d247c0cad2d2e718eaca2e2dff051136a1347a92097abf19ebf65ea2870131  otp_src_21.0.tar.gz
+md5 b2b48dad6e69c1e882843edbf2abcfd3  otp_src_22.2.tar.gz
+sha256 89c2480cdac566065577c82704a48e10f89cf2e6ca5ab99e1cf80027784c678f  otp_src_22.2.tar.gz
 sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index ca0aa0b770..fb26d6589f 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 21.0
+ERLANG_VERSION = 22.2
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
@@ -15,11 +15,20 @@ ERLANG_LICENSE_FILES = LICENSE.txt
 ERLANG_INSTALL_STAGING = YES
 
 # Patched erts/aclocal.m4
-ERLANG_AUTORECONF = YES
+define ERLANG_RUN_AUTOCONF
+	cd $(@D) && PATH=$(BR_PATH) ./otp_build autoconf
+endef
+HOST_ERLANG_DEPENDENCIES = host-autoconf
+ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
+
+define ERLANG_RUN_SAVE_BOOTSTRAP
+	cd $(@D) && PATH=$(BR_PATH) ./otp_build save_bootstrap
+endef
+ERLANG_POST_CONFIGURE_HOOKS += ERLANG_RUN_SAVE_BOOTSTRAP
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.10.3
+ERLANG_EI_VSN = 3.13.1
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
@@ -38,7 +47,7 @@ HOST_ERLANG_CONF_ENV += ERL_TOP=$(@D)
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
-HOST_ERLANG_DEPENDENCIES = host-openssl
+HOST_ERLANG_DEPENDENCIES += host-openssl
 HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)
 
 HOST_ERLANG_CONF_OPTS += --without-termcap
@@ -65,7 +74,7 @@ ERLANG_CONF_OPTS += --without-odbc
 endif
 
 # Always use Buildroot's zlib
-ERLANG_CONF_OPTS += --enable-shared-zlib
+ERLANG_CONF_OPTS += --disable-builtin-zlib
 ERLANG_DEPENDENCIES += zlib
 
 # Remove source, example, gs and wx files from staging and target.
-- 
2.20.1
