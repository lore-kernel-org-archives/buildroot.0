From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Nov 2015 16:24:59 +0100
Subject: [Buildroot] [PATCH] quagga: fix static linking
Message-ID: <1448551499-24162-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to quagga's configure.ac to fix a library
ordering problem that is causing a build failure in static linking
scenario.

Fixes:

  http://autobuild.buildroot.org/results/c08/c086f3128232af70d24fd5faf9282ce91d6488ef/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-fix-static-linking-with-readline.patch | 41 ++++++++++++++++++++++
 package/quagga/quagga.mk                           |  2 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/quagga/0002-configure-fix-static-linking-with-readline.patch

diff --git a/package/quagga/0002-configure-fix-static-linking-with-readline.patch b/package/quagga/0002-configure-fix-static-linking-with-readline.patch
new file mode 100644
index 0000000..243dfaf
--- /dev/null
+++ b/package/quagga/0002-configure-fix-static-linking-with-readline.patch
@@ -0,0 +1,41 @@
+From 62ede7482da15d276b880f6d8540dce400dc50a7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 26 Nov 2015 15:59:07 +0100
+Subject: [PATCH] configure: fix static linking with readline
+
+When static linking is used, the order of the libraries is important,
+and the libraries using a symbol from another library should be listed
+*before* the library providing that symbol (see
+http://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking)
+for details.
+
+When vtysh is linked statically, the command line contains "-lcurses
+-lreadline", which causes a build failure due to unresolved
+symbols. This is because readline is using symbols from the curses
+library: the order should be the opposite.
+
+This patch fixes that problem by putting the -lreadline at the
+beginning of the LIBREADLINE variable calcualted by the configure
+script.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3003e62..290953d 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -652,7 +652,7 @@ dnl	 [TODO] on Linux, and in [TODO] on Solaris.
+ 	      )]
+ 	    )]
+ 	  )
+-         AC_CHECK_LIB(readline, main, LIBREADLINE="$LIBREADLINE -lreadline",,
++         AC_CHECK_LIB(readline, main, LIBREADLINE="-lreadline $LIBREADLINE",,
+                       "$LIBREADLINE")
+          if test $ac_cv_lib_readline_main = no; then
+            AC_MSG_ERROR([vtysh needs libreadline but was not found and usable on your system.])
+-- 
+2.6.3
+
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index ce1d34b..c5dd2ba 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -11,6 +11,8 @@ QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CONF_OPTS = --program-transform-name=''
+# 0002-configure-fix-static-linking-with-readline.patch
+QUAGGA_AUTORECONF = YES
 
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
-- 
2.6.3
