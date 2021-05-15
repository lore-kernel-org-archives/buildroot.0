From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 May 2021 08:30:26 +0200
Subject: [Buildroot] [git commit] package/libxslt: fix build with latest
 libxml2
Message-ID: <20210515060225.A1A538188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7320e5dd6269149869b542aa9d0db62bae31709b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build is broken since bump of libxml2 to version 2.9.11 in commit
a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04 because libxslt calls the
following command "${XML_CONFIG} --libs print" which will return an
error code since
https://github.com/GNOME/libxml2/commit/2a357ab99e6f5c9196384b11cd91dd993f93014c

Fixes:
 - http://autobuild.buildroot.org/results/47ceb8c24c9ead8a450b7fea3266f760d6b77b4f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-xml2-config-check-in-configure-script.patch | 31 ++++++++++++++++++++++
 package/libxslt/libxslt.mk                         |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
new file mode 100644
index 0000000000..3848dcb235
--- /dev/null
+++ b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
@@ -0,0 +1,31 @@
+From 90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 15 Nov 2019 11:53:11 +0100
+Subject: [PATCH] Fix xml2-config check in configure script
+
+A 'print' option has never been supported. After a recent change to
+libxml2, invalid options cause xml2-config to fail.
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/libxslt/-/commit/90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3da57b18..585b9d7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -548,7 +548,7 @@ dnl make sure xml2-config is executable,
+ dnl test version and init our variables
+ dnl
+ 
+-if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs print > /dev/null 2>&1
++if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs > /dev/null 2>&1
+ then
+     AC_MSG_CHECKING(for libxml libraries >= $LIBXML_REQUIRED_VERSION)
+     XMLVERS=`$XML_CONFIG --version`
+-- 
+GitLab
+
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 3c603ad9f6..d0f79d2521 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -10,6 +10,8 @@ LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
 LIBXSLT_CPE_ID_VENDOR = xmlsoft
+# We're patching configure.ac
+LIBXSLT_AUTORECONF = YES
 
 LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
