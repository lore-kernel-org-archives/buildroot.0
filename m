From: Rodrigo Rebello <rprebello@gmail.com>
Date: Fri, 30 Oct 2015 23:56:21 -0200
Subject: [Buildroot] [PATCH 1/1] irssi: new package
Message-ID: <1446256581-3010-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Irssi is a terminal based IRC client for UNIX systems.

http://irssi.org/

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/Config.in                                  |  1 +
 .../0001-Fix-quote-around-macro-argument.patch     | 46 +++++++++++++++++++
 package/irssi/Config.in                            | 30 +++++++++++++
 package/irssi/irssi.hash                           |  2 +
 package/irssi/irssi.mk                             | 52 ++++++++++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 package/irssi/0001-Fix-quote-around-macro-argument.patch
 create mode 100644 package/irssi/Config.in
 create mode 100644 package/irssi/irssi.hash
 create mode 100644 package/irssi/irssi.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..47bf7e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1280,6 +1280,7 @@ endif
 	source "package/iptables/Config.in"
 	source "package/iptraf-ng/Config.in"
 	source "package/iputils/Config.in"
+	source "package/irssi/Config.in"
 	source "package/iw/Config.in"
 	source "package/janus-gateway/Config.in"
 	source "package/kismet/Config.in"
diff --git a/package/irssi/0001-Fix-quote-around-macro-argument.patch b/package/irssi/0001-Fix-quote-around-macro-argument.patch
new file mode 100644
index 0000000..d0509d5
--- /dev/null
+++ b/package/irssi/0001-Fix-quote-around-macro-argument.patch
@@ -0,0 +1,46 @@
+From a9d2f9ca6edb7a958ecb606f7db2055caad26a1e Mon Sep 17 00:00:00 2001
+From: Rodrigo Rebello <rprebello@gmail.com>
+Date: Wed, 28 Oct 2015 13:38:21 -0200
+Subject: [PATCH 1/1] Fix quote around macro argument
+
+In m4/curses.m4, line 134, the 5th argument passed to AC_NCURSES was
+surrounded by '"' instead of '[' and ']'. Because of that, the expansion
+of AC_NCURSES in that case would produce the following line inside the
+configure script (note the repeated double quotes):
+
+  screen_manager=""ncurses on $withval/include""
+
+That would cause the following error when configure was executed with
+the "--with-ncurses=dir" argument:
+
+  ./configure: line 13468: on: command not found
+
+Although in the case above the error doesn't actually influence the
+build process ('screen_manager' isn't used anywhere in the script),
+trying to execute 'on' might be harmful if it corresponded to an
+existing command in the user's environment.
+
+Upstream-status: accepted, not yet released.
+https://github.com/irssi/irssi/pull/344
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ m4/curses.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/curses.m4 b/m4/curses.m4
+index 82b110f..41c0e6c 100644
+--- a/m4/curses.m4
++++ b/m4/curses.m4
+@@ -131,7 +131,7 @@ AC_DEFUN([AC_CHECK_CURSES],[
+ 	  if test x$withval = xno ; then
+ 		search_ncurses=false
+ 	  elif test x$withval != xyes ; then
+-		AC_NCURSES($withval/include, ncurses.h, -L$withval/lib -lncurses, -I$withval/include, "ncurses on $withval/include")
++		AC_NCURSES($withval/include, ncurses.h, -L$withval/lib -lncurses, -I$withval/include, [ncurses on $withval/include])
+ 	  fi
+ 	)
+ 
+-- 
+2.1.4
+
diff --git a/package/irssi/Config.in b/package/irssi/Config.in
new file mode 100644
index 0000000..7d29201
--- /dev/null
+++ b/package/irssi/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_IRSSI
+	bool "irssi"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # fork()
+	help
+	  Irssi is a terminal based IRC client for UNIX systems.
+
+	  http://irssi.org/
+
+if BR2_PACKAGE_IRSSI
+
+config BR2_PACKAGE_IRSSI_PROXY
+	bool "proxy module"
+	help
+	  Build the irssi proxy module, which allows an IRC connection
+	  to be shared among multiple clients.
+
+config BR2_PACKAGE_IRSSI_TRUE_COLOR
+	bool "true color support"
+	help
+	  Build with true color support in terminal.
+
+endif
+
+comment "irssi needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
new file mode 100644
index 0000000..0bfafe6
--- /dev/null
+++ b/package/irssi/irssi.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	3c9600cad2edf58f1d012febc1a0ba844274df6e331c01a9e935467705166807	irssi-0.8.17.tar.bz2
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
new file mode 100644
index 0000000..c76fe6f
--- /dev/null
+++ b/package/irssi/irssi.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# irssi
+#
+################################################################################
+
+IRSSI_VERSION = 0.8.17
+IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
+IRSSI_SITE = http://irssi.org/files
+IRSSI_LICENSE = GPLv2+
+IRSSI_LICENSE_FILES = COPYING
+IRSSI_DEPENDENCIES = libglib2 ncurses
+IRSSI_AUTORECONF = YES
+
+IRSSI_CONF_OPTS = \
+	--disable-glibtest \
+	--with-ncurses=$(STAGING_DIR)/usr \
+	--without-perl
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+IRSSI_CONF_OPTS += --enable-ssl
+IRSSI_DEPENDENCIES += openssl
+else
+IRSSI_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_IRSSI_PROXY),y)
+IRSSI_CONF_OPTS += --with-proxy
+# If shared libs are disabled, 'proxy' has to go in the list of built-in
+# modules.
+ifeq ($(BR2_STATIC_LIBS),y)
+IRSSI_CONF_OPTS += --with-modules=proxy
+endif
+else
+IRSSI_CONF_OPTS += --without-proxy
+endif # proxy
+
+ifeq ($(BR2_PACKAGE_IRSSI_TRUE_COLOR),y)
+IRSSI_CONF_OPTS += --enable-true-color
+else
+IRSSI_CONF_OPTS += --disable-true-color
+endif
+
+# Cross-compiling irssi with the perl interpreter enabled doesn't work
+# yet. So, remove scripts as they are useless in that case.
+define IRSSI_REMOVE_SCRIPTS
+	rm -rf $(TARGET_DIR)/usr/share/irssi/scripts/
+endef
+
+IRSSI_POST_INSTALL_TARGET_HOOKS += IRSSI_REMOVE_SCRIPTS
+
+$(eval $(autotools-package))
-- 
2.1.4
