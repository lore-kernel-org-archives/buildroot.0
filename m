From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 25 Apr 2012 11:53:55 +0200
Subject: [Buildroot] [PATCH v3] Add new package apr-util
Message-ID: <1335347635-3937-1-git-send-email-bachmann@tofwerk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package apr-util

Add the package apr-util to buildroot and adding a patch to
avoid the failing test APU_FIND_APR

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
---
v1: Add package apr-util
    Add patch to remove check for apr
    because check for apr search for ./apr and not for defined folder
v2: Change spaces to tab in *.mk
v3: Add Signed-off-by and comments to package-patch

 package/Config.in                                  |    1 +
 package/apr-util/Config.in                         |    7 +++++++
 .../apr-util/apr-util-1.4.1-remove-checkapr.patch  |   17 +++++++++++++++++
 package/apr-util/apr-util.mk                       |   14 ++++++++++++++
 4 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/apr-util/Config.in
 create mode 100644 package/apr-util/apr-util-1.4.1-remove-checkapr.patch
 create mode 100644 package/apr-util/apr-util.mk

diff --git a/package/Config.in b/package/Config.in
index 5ae1c81..805f56a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ endmenu
 
 menu "Other"
 source "package/apr/Config.in"
+source "package/apr-util/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
new file mode 100644
index 0000000..a4411ba
--- /dev/null
+++ b/package/apr-util/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_APR_UTIL
+	bool "apr-util"
+	select BR2_PACKAGE_APR
+	help
+	  The utility library for the apache runtime project
+
+	  http://apr.apache.org/
diff --git a/package/apr-util/apr-util-1.4.1-remove-checkapr.patch b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
new file mode 100644
index 0000000..128a1b0
--- /dev/null
+++ b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
@@ -0,0 +1,17 @@
+Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
+---
+disable the check for APU_FIND_APR because the check only looks into folders
+named apr, and our source-tree is called apr-versionnumber (e.g. apr-1.4.6)
+---
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
index 0000000..f5f4d80
--- /dev/null
+++ b/package/apr-util/apr-util.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# apr-util
+#
+#############################################################
+APR_UTIL_VERSION = 1.4.1
+APR_UTIL_SITE = http://archive.apache.org/dist/apr
+APR_UTIL_INSTALL_STAGING = YES
+APR_UTIL_DEPENDENCIES = apr
+APR_UTIL_CONF_OPT = \
+	--prefix=/usr \
+	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION)
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.2.5
