From: David GOUARIN <dgouarin@gmail.com>
Date: Tue, 13 Oct 2020 16:37:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/freeradius-server: new package
In-Reply-To: <20201013143707.11678-1-dgouarin@gmail.com>
References: <20201013143707.11678-1-dgouarin@gmail.com>
Message-ID: <20201013143707.11678-2-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FreeRADIUS is an open source server which implements
a protocol for remote user Authorization, Authentication
and Accounting.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-host-jlibtool.patch                  | 17 +++++++++
 ...thread-support-while-cross-compiling.patch | 15 ++++++++
 package/freeradius-server/Config.in           | 20 ++++++++++
 .../freeradius-server-config.cache            |  4 ++
 .../freeradius-server/freeradius-server.hash  |  3 ++
 .../freeradius-server/freeradius-server.mk    | 37 +++++++++++++++++++
 8 files changed, 98 insertions(+)
 create mode 100644 package/freeradius-server/0001-host-jlibtool.patch
 create mode 100644 package/freeradius-server/0002-thread-support-while-cross-compiling.patch
 create mode 100644 package/freeradius-server/Config.in
 create mode 100644 package/freeradius-server/freeradius-server-config.cache
 create mode 100644 package/freeradius-server/freeradius-server.hash
 create mode 100644 package/freeradius-server/freeradius-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c856d7ad45..ae688a85c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -711,6 +711,7 @@ N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
+F:	package/freeradius-server/
 F:	package/librelp/
 F:	package/libtalloc/
 
diff --git a/package/Config.in b/package/Config.in
index a4d6fe02ae..8e3ce4fe20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ menu "Networking applications"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeradius-server/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/frr/Config.in"
diff --git a/package/freeradius-server/0001-host-jlibtool.patch b/package/freeradius-server/0001-host-jlibtool.patch
new file mode 100644
index 0000000000..18cebcb4e5
--- /dev/null
+++ b/package/freeradius-server/0001-host-jlibtool.patch
@@ -0,0 +1,17 @@
+jlibtool.c: while cross compiling, use host CC instead of target CC to build jlibtool
+
+Signed-off-by: David Gouarin <dgouarin@gmail.com>
+
+--- a/scripts/libtool.mk 2018-10-08 09:22:59.032031858 -0600
++++ b/scripts/libtool.mk 2018-10-08 15:04:18.406661484 -0600
+@@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+    # binary!
+	${JLIBTOOL}: ${top_makedir}/jlibtool.c
+	$(Q)mkdir -p $(dir $@)
+-	$(Q)echo CC jlibtool.c
+-	$(Q)${CC} $< -o $@
++	$(Q)echo HOSTCC jlibtool.c
++	$(Q)${HOSTCC} $< -o $@
+
+    clean: jlibtool_clean
+
diff --git a/package/freeradius-server/0002-thread-support-while-cross-compiling.patch b/package/freeradius-server/0002-thread-support-while-cross-compiling.patch
new file mode 100644
index 0000000000..464bcf9aa6
--- /dev/null
+++ b/package/freeradius-server/0002-thread-support-while-cross-compiling.patch
@@ -0,0 +1,15 @@
+configure: enable __thread attribute compiler support by default when cross compiling to avoid a bug in some freeradius macros
+
+Signed-off-by: David Gouarin <dgouarin@gmail.com>
+
+--- a/configure
++++ b/configure
+@@ -11309,7 +11309,7 @@ fi
+   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for __thread support in compiler" >&5
+ $as_echo_n "checking for __thread support in compiler... " >&6; }
+   if test "$cross_compiling" = yes; then :
+-  have_tls=no
++  have_tls=yes
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
new file mode 100644
index 0000000000..3c2d9af5da
--- /dev/null
+++ b/package/freeradius-server/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_FREERADIUS_SERVER
+	bool "freeradius-server"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH
+	select BR2_PACKAGE_LIBTALLOC
+	select BR2_PACKAGE_PCRE
+	help
+	  FreeRADIUS is an open source server which implements
+	  a protocol for remote user Authorization, Authentication
+	  and Accounting.
+
+	  http://wiki.freeradius.org/
+
+comment "freeradius-server needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "freeradius-server needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC ||?BR2_COMPILER_PARANOID_UNSAFE_PATH
+
diff --git a/package/freeradius-server/freeradius-server-config.cache b/package/freeradius-server/freeradius-server-config.cache
new file mode 100644
index 0000000000..b0e582afc9
--- /dev/null
+++ b/package/freeradius-server/freeradius-server-config.cache
@@ -0,0 +1,4 @@
+ax_cv_cc_bounded_attribute=no
+ax_cv_cc_builtin_bswap64=yes
+ax_cv_cc_builtin_choose_expr=yes
+ax_cv_cc_builtin_types_compatible_p=yes
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
new file mode 100644
index 0000000000..ba338d8b7f
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2bf914d471d4409fd72e708e308fa32ca8d01d698c518497a1d4b867d50132ae  freeradius-server-3.0.21.tar.gz
+sha256  8b9cc1e5d41938be45a368f126a6d1fda03d60a3d622dc75e776be4e90c2d2c6  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
new file mode 100644
index 0000000000..d04f453c60
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# freeradius-server
+#
+################################################################################
+
+FREERADIUS_SERVER_VERSION = 3.0.21
+FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
+FREERADIUS_SERVER_LICENSE = GPL-2.0
+FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
+FREERADIUS_SERVER_INSTALL_HOST = NO
+
+FREERADIUS_SERVER_DEPENDENCIES = libtalloc pcre
+
+ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+FREERADIUS_SERVER_DEPENDENCIES += openssl
+FREERADIUS_SERVER_CONF_OPTS += --with-openssl
+else
+FREERADIUS_CONF_OPTS += --without-openssl
+endif
+
+define FREERADIUS_SERVER_CACHE_FOR_CROSS_COMPILE
+	$(INSTALL) -m 0644 package/freeradius-server/freeradius-server-config.cache $(@D)/freeradius-server-config.cache
+endef
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_CACHE_FOR_CROSS_COMPILE
+
+# --cache-file= : some compiler checks are not supported while cross compiling.
+#   instead of removing those checks, we use a config.cache file
+FREERADIUS_SERVER_CONF_OPTS += \
+	--cache-file=freeradius-server-config.cache
+
+FREERADIUS_SERVER_MAKE_ENV = R=$(TARGET_DIR) TARGET_DIR=""
+ 
+# make install does not support parallel build
+FREERADIUS_SERVER_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
-- 
2.17.1
