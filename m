From: Jon Diekema <jon.diekema@gmail.com>
Date: Fri, 21 Dec 2012 09:45:16 -0500
Subject: [Buildroot] tokyocabinet: new package
Message-ID: <CALvuzg5L=Hjzm3p0p1gYUE7GNeiFxwLiApO92YOt_fGAk7n95Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tokyocabinet: new package

Signed-off-by: Jon Diekema <jon.diekema@gmail.com>

Change Summary:
---------------

 package/Config.in                                  |    2 +
 package/tokyocabinet/Config.in                     |    7 ++++
 .../tokyocabinet/tokyocabinet-1.4.47-include.patch |   19 +++++++++
 package/tokyocabinet/tokyocabinet.mk               |   42 ++++++++++++++++++++
 4 files changed, 70 insertions(+)

M package/Config.in
A package/tokyocabinet/Config.in
A package/tokyocabinet/tokyocabinet-1.4.47-include.patch
A package/tokyocabinet/tokyocabinet.mk

Patch (ignoring white space changes):
-------------------------------------

diff --git a/package/Config.in b/package/Config.in
index 15d7ad6..06efdd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -359,6 +360,7 @@ source "package/gdbm/Config.in"
 source "package/mysql_client/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
+source "package/tokyocabinet/Config.in"
 endmenu

 menu "Filesystem"
diff --git a/package/tokyocabinet/Config.in b/package/tokyocabinet/Config.in
new file mode 100644
index 0000000..66ff02e
--- /dev/null
+++ b/package/tokyocabinet/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TOKYOCABINET
+        bool "Tokyo Cabinet"
+        help
+  A modern reimplementation of QDBM, also released under the LGPL
+  by Mikio Hirabayashi in 2007.
+
+  http://www.igvita.com/2009/02/13/tokyo-cabinet-beyond-key-value-store/
diff --git a/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
b/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
new file mode 100644
index 0000000..cdfc234
--- /dev/null
+++ b/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
@@ -0,0 +1,19 @@
+Remove /usr/include, ~/include, and /usr/local/include from the
+include search path.  Other than the current directory, use the
+include defaults from the toolchain.
+
+Signed-off-by: Jon Diekema <jon.diekema@gmail.com>
+
+diff --git a/configure.in b/configure.in
+index 8db195e..60cad20 100644
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
index 0000000..a5fa21d
--- /dev/null
+++ b/package/tokyocabinet/tokyocabinet.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# Tokyo Cabinet
+#
+#############################################################
+
+TOKYOCABINET_VERSION = 1.4.47
+TOKYOCABINET_SOURCE = tokyocabinet-$(TOKYOCABINET_VERSION).tar.gz
+TOKYOCABINET_SITE = http://httpsqs.googlecode.com/files
+TOKYOCABINET_INSTALL_STAGING = YES
+TOKYOCABINET_LICENSE = LGPLv2.1
+TOKYOCABINET_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ TOKYOCABINET_CONF_OPT += --enable-pthread
+else
+ TOKYOCABINET_CONF_OPT += --disable-pthread
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ TOKYOCABINET_DEPENDENCIES += zlib
+ TOKYOCABINET_CONF_OPT += --enable-zlib
+else
+ TOKYOCABINET_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+ TOKYOCABINET_DEPENDENCIES += bzip2
+ TOKYOCABINET_CONF_OPT += --enable-bzip
+else
+ TOKYOCABINET_CONF_OPT += --disable-bzip
+endif
+
+TOKYOCABINET_AUTORECONF = YES
+
+define TOKYOCABINET_REMOVE_TARGET_FILES
+ rm -rf $(TARGET_DIR)/usr/share/tokyocabinet
+endef
+
+TOKYOCABINET_POST_INSTALL_TARGET_HOOKS += TOKYOCABINET_REMOVE_TARGET_FILES
+
+$(eval $(autotools-package))
