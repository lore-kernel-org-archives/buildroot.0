From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 23:53:24 +0200
Subject: [Buildroot] [git commit] Add new package apr-util
Message-ID: <20120503215452.DCA3C96C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4205dbd9f665556cc56a36c0e11a5f845c73a57a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: BR2_PACKAGE_NEON not LIBNEON]
Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/apr-util/Config.in                         |   11 ++++++++++
 .../apr-util/apr-util-1.4.1-remove-checkapr.patch  |   21 ++++++++++++++++++++
 package/apr-util/apr-util.mk                       |   13 ++++++++++++
 4 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ed66c05..caa618b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ endmenu
 
 menu "Other"
 source "package/apr/Config.in"
+source "package/apr-util/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
new file mode 100644
index 0000000..99b32f2
--- /dev/null
+++ b/package/apr-util/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_APR_UTIL
+	bool "apr-util"
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_ZLIB
+	select BR2_PACKAGE_ZLIB
+	help
+	  The utility library for the apache runtime project
+
+	  http://apr.apache.org/
diff --git a/package/apr-util/apr-util-1.4.1-remove-checkapr.patch b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
new file mode 100644
index 0000000..42ad12f
--- /dev/null
+++ b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
@@ -0,0 +1,21 @@
+remove check apr
+
+this patch removes the check of apr which fails the build
+
+Signed-off-by: Rico Bachmann <bachmann-ahF9wiJNQgNBDgjK7y7TUQ@public.gmane.org>
+---
+v1: disable the check for APU_FIND_APR because the check only looks into folders
+named apr, and our source-tree is called apr-versionnumber (e.g. apr-1.4.6)
+
+diff -rupN apr-util-1.4.1/configure.in apr-util-1.4.1-fix/configure.in
+--- apr-util-1.4.1/configure.in	2009-12-17 20:15:19.000000000 +0100
++++ apr-util-1.4.1-fix/configure.in	2012-04-24 10:10:32.000000000 +0200
+@@ -99,7 +99,7 @@ fi
+ dnl
+ dnl Find the APR includes directory and (possibly) the source (base) dir.
+ dnl
+-APU_FIND_APR
++dnl APU_FIND_APR
+ 
+ dnl
+ dnl even though we use apr_rules.mk for building apr-util, we need
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
new file mode 100644
index 0000000..564b1bb
--- /dev/null
+++ b/package/apr-util/apr-util.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# apr-util
+#
+#############################################################
+APR_UTIL_VERSION = 1.4.1
+APR_UTIL_SITE = http://archive.apache.org/dist/apr
+APR_UTIL_INSTALL_STAGING = YES
+APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
+APR_UTIL_CONF_OPT = \
+	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION) \
+
+$(eval $(call AUTOTARGETS))
