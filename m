From: Diekema, Jon (GE Aviation, US) <Jon.Diekema@ge.com>
Date: Mon, 15 Oct 2012 09:59:33 -0400
Subject: [Buildroot] Buildroot patch for adding Tokyo Cabinet
Message-ID: <0B3FAF466948654CB218059DFE15DF23BBC000@CINMLVEM24.e2k.ad.ge.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jon Diekema <jon.diekema@ge.com>	

diff --git a/package/Config.in b/package/Config.in index
e129522..8f519b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -331,6 +331,7 @@ source "package/berkeleydb/Config.in"
 source "package/mysql_client/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
+source "package/tokyocabinet/Config.in"
 endmenu
 
 menu "Filesystem"
diff --git a/package/tokyocabinet/Config.in
b/package/tokyocabinet/Config.in new file mode 100644 index
0000000..66ff02e
--- /dev/null
+++ b/package/tokyocabinet/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TOKYOCABINET
+        bool "Tokyo Cabinet"
+        help
+	  A modern reimplementation of QDBM, also released under the
LGPL
+	  by Mikio Hirabayashi in 2007.
+
+
http://www.igvita.com/2009/02/13/tokyo-cabinet-beyond-key-value-store/
diff --git a/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
b/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
new file mode 100644
index 0000000..340008c
--- /dev/null
+++ b/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
@@ -0,0 +1,19 @@
+Signed-off-by: Jon Diekema <jon.diekema@ge.com>
+
+Removing /usr/include, ~/include, and /usr/local/include from the 
+include search path.  Other than the current directory, use the 
+defaults from the toolchain.
+
+diff --git a/configure.in b/configure.in index 8db195e..60cad20 100644
+--- a/configure.in
++++ b/configure.in
+@@ -32,7 +32,7 @@ MYPCFILES="tokyocabinet.pc"
+
+ # Building flags
+ MYCFLAGS="-std=c99 -Wall -fPIC -fsigned-char -O2"
+-MYCPPFLAGS="-I. -I\$(INCLUDEDIR) -I$HOME/include -I/usr/local/include"
++MYCPPFLAGS="-I."
+ MYCPPFLAGS="$MYCPPFLAGS -DNDEBUG -D_GNU_SOURCE=1 -D_REENTRANT
-D__EXTENSIONS__"
+ MYLDFLAGS="-L. -L\$(LIBDIR) -L$HOME/lib -L/usr/local/lib"
+ MYCMDLDFLAGS=""
diff --git a/package/tokyocabinet/tokyocabinet.mk
b/package/tokyocabinet/tokyocabinet.mk
new file mode 100644
index 0000000..df3762c
--- /dev/null
+++ b/package/tokyocabinet/tokyocabinet.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# Tokyo Cabinet
+#
+#############################################################
+
+#
+# Generic Infrastructure
+#
+TOKYOCABINET_VERSION = 1.4.47
+TOKYOCABINET_SOURCE = tokyocabinet-$(TOKYOCABINET_VERSION).tar.gz
+TOKYOCABINET_SITE = http://httpsqs.googlecode.com/files
+# TOKYOCABINET_PATCH =
+# TOKYOCABINET_SUBDIR =
+TOKYOCABINET_DEPENDENCIES =
+TOKYOCABINET_INSTALL_STAGING = YES
+TOKYOCABINET_INSTALL_TARGET = YES
+TOKYOCABINET_LICENSE = LGPLv2.1
+TOKYOCABINET_LICENSE_FILES = COPYING
+
+#
+# Autotools Infrastructure
+#
+TOKYOCABINET_CONF_ENV =
+TOKYOCABINET_CONF_OPT = --disable-zlib --disable-bzip --enable-pthread 
+TOKYOCABINET_MAKE = $(MAKE) TOKYOCABINET_MAKE_ENV = 
+TOKYOCABINET_MAKE_OPT = TOKYOCABINET_AUTORECONF = YES 
+TOKYOCABINET_AUTORECONF_OPT = TOKYOCABINET_LIBTOOL_PATCH = YES 
+TOKYOCABINET_CLEAN_OPT = clean
+
+define TOKYOCABINET_REMOVE_TARGET_FILES
+	rm -rf $(TARGET_DIR)/usr/share/tokyocabinet
+endef
+
+TOKYOCABINET_POST_INSTALL_TARGET_HOOKS +=
TOKYOCABINET_REMOVE_TARGET_FILES
+
+$(eval $(autotools-package))
