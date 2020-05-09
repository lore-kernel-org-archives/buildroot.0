From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:43:50 +0200
Subject: [Buildroot] [git commit] package/freerdp: security bump to version
 2.1.0
Message-ID: <20200509112811.DA0F890ED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c26ce8539a9786a505aaf8efe8ab69856b51659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Fix multiple CVEs: CVE-2020-11039, CVE-2020-11038, CVE-2020-11043,
  CVE-2020-11040, CVE-2020-11041, CVE-2020-11019, CVE-2020-11017,
  CVE-2020-11018
- Fix multiple leak and crash issues (#6129, #6128, #6127, #6110, #6081,
  #6077)

Extracted from:
https://github.com/FreeRDP/FreeRDP/commit/65d3ff44617c5a343f726985ed45e3a0a35dfaf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-libuwac-uwac-os.c-fix-build-with-uclibc.patch | 44 ----------------------
 package/freerdp/freerdp.hash                       |  4 +-
 package/freerdp/freerdp.mk                         |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch b/package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch
deleted file mode 100644
index 5b78920eba..0000000000
--- a/package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 39292268308a3fd6233c2863df22232725d22b3a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 10 Apr 2020 08:49:22 +0200
-Subject: [PATCH] src/libuwac/uwac-os.c: fix build with uclibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-O_TMPFILE is used since version 2.0.0 and
-https://github.com/FreeRDP/FreeRDP/commit/52ef8079eae74dfe89e6779c873101843b8cc42b
-
-However, this will result in the following build failure on uclibc or
-uclibc-ng:
-
-/home/fabrice/buildroot/output/build/freerdp-2.0.0/uwac/libuwac/uwac-os.c:228:18: error: ???O_TMPFILE??? undeclared (first use in this function); did you mean ???EMFILE????
-  fd = open(path, O_TMPFILE | O_RDWR | O_EXCL, 0600);
-                  ^~~~~~~~~
-                  EMFILE
-
-To fix this build failure, define O_TMPFILE if needed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/FreeRDP/FreeRDP/commit/39292268308a3fd6233c2863df22232725d22b3a]
----
- uwac/libuwac/uwac-os.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/uwac/libuwac/uwac-os.c b/uwac/libuwac/uwac-os.c
-index 799cdce9a5..4f8c8f5161 100644
---- a/uwac/libuwac/uwac-os.c
-+++ b/uwac/libuwac/uwac-os.c
-@@ -33,6 +33,11 @@
- #define USE_SHM
- #endif
- 
-+/* uClibc and uClibc-ng don't provide O_TMPFILE */
-+#ifndef O_TMPFILE
-+#define O_TMPFILE (020000000 | O_DIRECTORY)
-+#endif
-+
- #include <sys/types.h>
- #include <sys/socket.h>
- #ifdef USE_SHM
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 346e4f1481..b94ca10533 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.0.0.tar.gz.sha256
-sha256  4ee064e87486cb6fea85d5b6b606add9f02df25ce73f9818b49de75cebd7fedf  freerdp-2.0.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.0.1.tar.gz.sha256
+sha256  2c4841c6a52fb153346436447708cbae7b479a7d8112d093e95d8c98f084be1b  freerdp-2.1.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 83383c66a7..d3038bd5c2 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.0.0
+FREERDP_VERSION = 2.1.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
