From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 15:24:54 +0100
Subject: [Buildroot] [git commit branch/next] apache: new package
Message-ID: <20150222142659.6B13A80448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0da6bcf85e594fbca70726d9e2c6189e08700cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
 - Don't explicitly pass CC_FOR_BUILD and CFLAGS_FOR_BUILD, those are
   already part of the default environment passed by the
   autotools-package infrastructure.
 - Explicitly disable Lua and LuaJIT support to avoid mis-detection of
   host installation.
 - Explicitly handle the optional support of libxml2, OpenSSL and
   zlib. Especially, the absence of explicit handling for libxml2 was
   causing a build failure due to the host libxml2 being detected.
 - Remove /usr/manual and /usr/build from the target. This saves 20+
   MB of target space.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                       |    1 +
 package/apache/0001-cross-compile.patch |   63 +++++++++++++++++++++++
 package/apache/Config.in                |   19 +++++++
 package/apache/apache.hash              |    2 +
 package/apache/apache.mk                |   85 +++++++++++++++++++++++++++++++
 5 files changed, 170 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 222ea38..09d49d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1053,6 +1053,7 @@ endmenu
 menu "Networking applications"
 	source "package/aiccu/Config.in"
 	source "package/aircrack-ng/Config.in"
+	source "package/apache/Config.in"
 	source "package/argus/Config.in"
 	source "package/arptables/Config.in"
 	source "package/atftp/Config.in"
diff --git a/package/apache/0001-cross-compile.patch b/package/apache/0001-cross-compile.patch
new file mode 100644
index 0000000..790b7a0
--- /dev/null
+++ b/package/apache/0001-cross-compile.patch
@@ -0,0 +1,63 @@
+Fix cross-compilation
+
+Fetched httpd-2.4.x-cross_compile.diff from upstream bugtracker:
+https://issues.apache.org/bugzilla/show_bug.cgi?id=51257#c6
+
+which is a bundle of upstream revisions:
+    http://svn.apache.org/viewvc?view=revision&revision=1327907
+    http://svn.apache.org/viewvc?view=revision&revision=1328390
+    http://svn.apache.org/viewvc?view=revision&revision=1328714
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: server/Makefile.in
+===================================================================
+--- a/server/Makefile.in	(revision 1328714)
++++ b/server/Makefile.in	(working copy)
+@@ -22,9 +22,14 @@
+ include $(top_builddir)/build/rules.mk
+ include $(top_srcdir)/build/library.mk
+ 
++ifdef CC_FOR_BUILD
++gen_test_char: gen_test_char.c
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -DCROSS_COMPILE -o $@ $<
++else
+ gen_test_char_OBJECTS = gen_test_char.lo
+ gen_test_char: $(gen_test_char_OBJECTS)
+ 	$(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
++endif
+ 
+ test_char.h: gen_test_char
+ 	./gen_test_char > test_char.h
+Index: configure.in
+===================================================================
+--- a/configure.in	(revision 1328714)
++++ b/configure.in	(working copy)
+@@ -193,6 +193,14 @@
+ dnl Try to get c99 support for variadic macros
+ ifdef([AC_PROG_CC_C99], [AC_PROG_CC_C99])
+ 
++dnl In case of cross compilation we set CC_FOR_BUILD to cc unless
++dnl we got already CC_FOR_BUILD from environment.
++if test "x${build_alias}" != "x${host_alias}"; then
++  if test "x${CC_FOR_BUILD}" = "x"; then
++    CC_FOR_BUILD=cc
++  fi
++fi
++
+ if test "x${cache_file}" = "x/dev/null"; then
+   # Likewise, ensure that CC and CPP are passed through to the pcre
+   # configure script iff caching is disabled (the autoconf 2.5x default).
+Index: acinclude.m4
+===================================================================
+--- a/acinclude.m4	(revision 1328714)
++++ ab/cinclude.m4	(working copy)
+@@ -53,6 +53,8 @@
+   APACHE_SUBST(CPPFLAGS)
+   APACHE_SUBST(CFLAGS)
+   APACHE_SUBST(CXXFLAGS)
++  APACHE_SUBST(CC_FOR_BUILD)
++  APACHE_SUBST(CFLAGS_FOR_BUILD)
+   APACHE_SUBST(LTFLAGS)
+   APACHE_SUBST(LDFLAGS)
+   APACHE_SUBST(LT_LDFLAGS)
diff --git a/package/apache/Config.in b/package/apache/Config.in
new file mode 100644
index 0000000..0814a17
--- /dev/null
+++ b/package/apache/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_APACHE
+	bool "apache"
+	select BR2_PACKAGE_APR_UTIL
+	select BR2_PACKAGE_PCRE
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr
+	help
+	  The Apache HTTP Server Project is an effort to develop and maintain an
+	  open-source HTTP server for modern operating systems including UNIX
+	  and Windows NT. The goal of this project is to provide a secure,
+	  efficient and extensible server that provides HTTP services in sync
+	  with the current HTTP standards.
+
+	  http://httpd.apache.org
+
+comment "apache needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/apache/apache.hash b/package/apache/apache.hash
new file mode 100644
index 0000000..51fd3ca
--- /dev/null
+++ b/package/apache/apache.hash
@@ -0,0 +1,2 @@
+# From http://www.apache.org/dist/httpd/httpd-2.4.12.tar.bz2.sha1
+sha1	bc4681bfd63accec8d82d3cc440fbc8264ce0f17	httpd-2.4.12.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
new file mode 100644
index 0000000..296e27e
--- /dev/null
+++ b/package/apache/apache.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# apache
+#
+################################################################################
+
+APACHE_VERSION = 2.4.12
+APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
+APACHE_SITE = http://archive.apache.org/dist/httpd
+APACHE_LICENSE = Apache-2.0
+APACHE_LICENSE_FILES = LICENSE
+# Needed for mod_php
+APACHE_INSTALL_STAGING = YES
+# We have a patch touching configure.in and Makefile.in,
+# so we need to autoreconf:
+APACHE_AUTORECONF = YES
+APACHE_DEPENDENCIES = apr apr-util pcre
+
+APACHE_CONF_ENV= \
+	ap_cv_void_ptr_lt_long=no \
+	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
+
+APACHE_CONF_OPTS = \
+	--sysconfdir=/etc/apache2 \
+	--with-apr=$(STAGING_DIR)/usr \
+	--with-apr-util=$(STAGING_DIR)/usr \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
+	--enable-http \
+	--enable-dbd \
+	--enable-proxy \
+	--enable-mime-magic \
+	--without-suexec-bin \
+	--enable-mods-shared=all \
+	--with-mpm=worker \
+	--disable-lua \
+	--disable-luajit
+
+ifeq ($(BR2_ARCH_HAS_ATOMICS),y)
+APACHE_CONF_OPTS += --enable-nonportable-atomics=yes
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+APACHE_DEPENDENCIES += libxml2
+# Apache wants the path to the header file, where it can find
+# <libxml/parser.h>.
+APACHE_CONF_OPTS += \
+	--enable-xml2enc \
+	--enable-proxy-html \
+	--with-libxml2=$(STAGING_DIR)/usr/include/libxml2
+else
+APACHE_CONF_OPTS += \
+	--disable-xml2enc \
+	--disable-proxy-html
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+APACHE_DEPENDENCIES += openssl
+APACHE_CONF_OPTS += \
+	--enable-ssl \
+	--with-ssl=$(STAGING_DIR)/usr
+else
+APACHE_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+APACHE_DEPENDENCIES += zlib
+APACHE_CONF_OPTS += \
+	--enable-deflate \
+	--with-z=$(STAGING_DIR)/usr
+else
+APACHE_CONF_OPTS += --disable-deflate
+endif
+
+define APACHE_FIX_STAGING_APACHE_CONFIG
+	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
+endef
+APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
+
+define APACHE_CLEANUP_TARGET
+	$(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build
+endef
+APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_CLEANUP_TARGET
+
+$(eval $(autotools-package))
