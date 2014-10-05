From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:17 +0200
Subject: [Buildroot] [PATCH 7/8] Apache: New package
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412516718-12597-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                              |    1 +
 package/apache/Config.in                       |   19 ++++++++
 package/apache/apache-0001-cross-compile.patch |   58 ++++++++++++++++++++++++
 package/apache/apache.mk                       |   42 +++++++++++++++++
 4 files changed, 120 insertions(+)
 create mode 100644 package/apache/Config.in
 create mode 100644 package/apache/apache-0001-cross-compile.patch
 create mode 100644 package/apache/apache.mk

diff --git a/package/Config.in b/package/Config.in
index 318b743..3b22d25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -945,6 +945,7 @@ endmenu
 menu "Networking applications"
 	source "package/aiccu/Config.in"
 	source "package/aircrack-ng/Config.in"
+	source "package/apache/Config.in"
 	source "package/argus/Config.in"
 	source "package/arptables/Config.in"
 	source "package/atftp/Config.in"
diff --git a/package/apache/Config.in b/package/apache/Config.in
new file mode 100644
index 0000000..172346c
--- /dev/null
+++ b/package/apache/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_APACHE
+	bool "apache"
+	select BR2_PACKAGE_APR_UTIL
+	select BR2_PACKAGE_PCRE
+	depends on !BR2_PREFER_STATIC_LIB
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
+	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/apache/apache-0001-cross-compile.patch b/package/apache/apache-0001-cross-compile.patch
new file mode 100644
index 0000000..05e99dd
--- /dev/null
+++ b/package/apache/apache-0001-cross-compile.patch
@@ -0,0 +1,58 @@
+Fix cross-compilation
+
+Fetched httpd-2.4.x-cross_compile.diff from upstream bugtracker:
+https://issues.apache.org/bugzilla/show_bug.cgi?id=51257#c6
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
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
new file mode 100644
index 0000000..d525024
--- /dev/null
+++ b/package/apache/apache.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# apache
+#
+################################################################################
+
+APACHE_VERSION = 2.4.10
+APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
+APACHE_SITE = http://archive.apache.org/dist/httpd
+APACHE_LICENSE = Apache-2.0
+APACHE_LICENSE_FILES = LICENSE
+APACHE_INSTALL_STAGING = YES
+APACHE_AUTORECONF = YES
+APACHE_DEPENDENCIES = apr-util pcre
+
+APACHE_CONF_ENV= \
+	CC_FOR_BUILD="$(HOSTCC)" \
+	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
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
+	--enable-nonportable-atomics=yes
+
+define APACHE_FIX_STAGING_APACHE_CONFIG
+	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
+endef
+APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
+
+$(eval $(autotools-package))
-- 
1.7.10.4
