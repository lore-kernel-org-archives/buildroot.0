From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Apr 2020 20:40:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.0.0
Message-ID: <20200410184059.5302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the ChangeLog:
- Fix multiple CVEs: CVE-2020-11521 CVE-2020-11522 CVE-2020-11523
  CVE-2020-11524 CVE-2020-11525 CVE-2020-11526
- Fix multiple other security related issues (#6005, #6006, #6007,
  #6008, #6009, #6010, #6011, #6012, #6013)

- Retrieve official tarball
- Drop patch (already in version)
- libusb is needed for urbdrc channel since
  https://github.com/FreeRDP/FreeRDP/commit/0927d7aa50c76b671b55c33e0f06c950d1f08e9a
- Add a patch to fix build on uclibc
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uwac-uwac-os.c-fix-build-with-uclibc.patch | 44 +++++++++++++++++++
 ..._floatbar.c-fix-build-without-Xfixes.patch | 32 --------------
 package/freerdp/freerdp.hash                  |  6 ++-
 package/freerdp/freerdp.mk                    | 11 ++++-
 4 files changed, 57 insertions(+), 36 deletions(-)
 create mode 100644 package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch
 delete mode 100644 package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch

diff --git a/package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch b/package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..5b78920eba
--- /dev/null
+++ b/package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch
@@ -0,0 +1,44 @@
+From 39292268308a3fd6233c2863df22232725d22b3a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 10 Apr 2020 08:49:22 +0200
+Subject: [PATCH] src/libuwac/uwac-os.c: fix build with uclibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+O_TMPFILE is used since version 2.0.0 and
+https://github.com/FreeRDP/FreeRDP/commit/52ef8079eae74dfe89e6779c873101843b8cc42b
+
+However, this will result in the following build failure on uclibc or
+uclibc-ng:
+
+/home/fabrice/buildroot/output/build/freerdp-2.0.0/uwac/libuwac/uwac-os.c:228:18: error: ?O_TMPFILE? undeclared (first use in this function); did you mean ?EMFILE??
+  fd = open(path, O_TMPFILE | O_RDWR | O_EXCL, 0600);
+                  ^~~~~~~~~
+                  EMFILE
+
+To fix this build failure, define O_TMPFILE if needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/FreeRDP/FreeRDP/commit/39292268308a3fd6233c2863df22232725d22b3a]
+---
+ uwac/libuwac/uwac-os.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/uwac/libuwac/uwac-os.c b/uwac/libuwac/uwac-os.c
+index 799cdce9a5..4f8c8f5161 100644
+--- a/uwac/libuwac/uwac-os.c
++++ b/uwac/libuwac/uwac-os.c
+@@ -33,6 +33,11 @@
+ #define USE_SHM
+ #endif
+ 
++/* uClibc and uClibc-ng don't provide O_TMPFILE */
++#ifndef O_TMPFILE
++#define O_TMPFILE (020000000 | O_DIRECTORY)
++#endif
++
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #ifdef USE_SHM
diff --git a/package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch b/package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch
deleted file mode 100644
index c0b4195883..0000000000
--- a/package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7dbb64cb62049159d9d71b9be39f469bbd116f41 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 18 Apr 2019 23:40:52 +0200
-Subject: [PATCH] xf_floatbar.c: fix build without Xfixes
-
-Remove unneeded include on Xfixes.h as it is not always available and
-not used in xf_floatbar.c
-
-Fixes:
- - http://autobuild.buildroot.org/results/69245e574787bada718c52c805ec137041dc233d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/5354]
----
- client/X11/xf_floatbar.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/client/X11/xf_floatbar.c b/client/X11/xf_floatbar.c
-index 3643b6052..04912aa79 100644
---- a/client/X11/xf_floatbar.c
-+++ b/client/X11/xf_floatbar.c
-@@ -19,7 +19,6 @@
- #include <X11/Xutil.h>
- #include <X11/Xatom.h>
- #include <X11/extensions/shape.h>
--#include <X11/extensions/Xfixes.h>
- #include <X11/cursorfont.h>
- 
- #include "xf_floatbar.h"
--- 
-2.20.1
-
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 7a6859551f..346e4f1481 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,5 @@
+# From https://pub.freerdp.com/releases/freerdp-2.0.0.tar.gz.sha256
+sha256  4ee064e87486cb6fea85d5b6b606add9f02df25ce73f9818b49de75cebd7fedf  freerdp-2.0.0.tar.gz
+
 # Locally calculated
-sha256 3406f3bfab63f81c1533029a5bf73949ff60f22f6e155c5a08005b8b8afe6d49 freerdp-2.0.0-rc4.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index a477e74cb7..83383c66a7 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.0.0-rc4
-FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
+FREERDP_VERSION = 2.0.0
+FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
@@ -42,6 +42,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_ALSA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+FREERDP_CONF_OPTS += -DCHANNEL_URBDRC=ON
+FREERDP_DEPENDENCIES += libusb
+else
+FREERDP_CONF_OPTS += -DCHANNEL_URBDRC=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 FREERDP_CONF_OPTS += -DWITH_PULSE=ON
 FREERDP_DEPENDENCIES += pulseaudio
-- 
2.25.1
