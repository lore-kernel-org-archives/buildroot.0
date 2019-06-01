From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 22:35:26 +0200
Subject: [Buildroot] [git commit] package/cups-filters: bump to version
 1.23.0
Message-ID: <20190602201238.72845811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e28cc000614c87480290e8535878dc9f4b4fbab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump is necessary to be compatible with poppler 0.77.0.

Patch 0002-Poppler-removed-memCheck-and-gMemReport-functions.patch is
removed, because it was merged upstream in commit
6b0747c1630dd973acd138f927dbded4ea45e360.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...removed-memCheck-and-gMemReport-functions.patch | 79 ----------------------
 package/cups-filters/cups-filters.hash             |  2 +-
 package/cups-filters/cups-filters.mk               |  2 +-
 3 files changed, 2 insertions(+), 81 deletions(-)

diff --git a/package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch b/package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch
deleted file mode 100644
index 3eb2d35c3e..0000000000
--- a/package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 6b0747c1630dd973acd138f927dbded4ea45e360 Mon Sep 17 00:00:00 2001
-From: Olivier Schonken <olivier.schonken@gmail.com>
-Date: Fri, 5 Oct 2018 12:05:31 +0200
-Subject: [PATCH] Poppler removed memCheck and gMemReport functions
-
-Only use gMemReport and memCheck functions if poppler version less
-than 0.69.0
-
-The poppler project removed the memCheck and gMemReport functions in
-commits c362ab1b97f20c5b73b3bad8d52015f679178748 - Remove DEBUG_MEM
-from Object since this uses RAII now and hence cannot leak.
-(The existing tracking also is not thread-safe and hence unreliable.)
-
-and
-
-f89446f6917a869b0f1a80fcc8ce81a7213dade4 - Remove generic heap debugging
-from gmem since external tools and compiler instrumentation achieve the
-same effect.
-
-This commit solves https://github.com/OpenPrinting/cups-filters/issues/62
-
-Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
----
- filter/pdftoijs.cxx            | 2 ++
- filter/pdftoopvp/pdftoopvp.cxx | 2 ++
- filter/pdftoraster.cxx         | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/filter/pdftoijs.cxx b/filter/pdftoijs.cxx
-index 22bc33f4..dd6b6fa0 100644
---- a/filter/pdftoijs.cxx
-+++ b/filter/pdftoijs.cxx
-@@ -503,9 +503,11 @@ err1:
-   ppdClose(ppd);
-   free(outputfile);
- 
-+#if POPPLER_VERSION_MAJOR == 0 && POPPLER_VERSION_MINOR < 69
-   // Check for memory leaks
-   Object::memCheck(stderr);
-   gMemReport(stderr);
-+#endif
- 
-   return exitCode;
- }
-diff --git a/filter/pdftoopvp/pdftoopvp.cxx b/filter/pdftoopvp/pdftoopvp.cxx
-index 024941ab..bf25983b 100644
---- a/filter/pdftoopvp/pdftoopvp.cxx
-+++ b/filter/pdftoopvp/pdftoopvp.cxx
-@@ -763,9 +763,11 @@ err2:
-  err0:
-   delete globalParams;
- 
-+#if POPPLER_VERSION_MAJOR == 0 && POPPLER_VERSION_MINOR < 69
-   // check for memory leaks
-   Object::memCheck(stderr);
-   gMemReport(stderr);
-+#endif
- 
- }
- /* muntrace(); */
-diff --git a/filter/pdftoraster.cxx b/filter/pdftoraster.cxx
-index 0c63ab8d..4ebf02b0 100644
---- a/filter/pdftoraster.cxx
-+++ b/filter/pdftoraster.cxx
-@@ -2162,9 +2162,11 @@ err1:
-     cmsDeleteTransform(colorTransform);
-   }
- 
-+#if POPPLER_VERSION_MAJOR == 0 && POPPLER_VERSION_MINOR < 69
-   // Check for memory leaks
-   Object::memCheck(stderr);
-   gMemReport(stderr);
-+#endif
- 
-   return exitCode;
- }
--- 
-2.17.1
-
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index e426ad8b86..c4e0a40e43 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 981b280bc5275a21c6f436aff6207e03cab36dc304c119bbac507db940e7421c  cups-filters-1.21.3.tar.gz
+sha256 3c03ab7dbfe3642b6cd279a0b63edc8274b7d9740cb087f68d3186c9144988a6  cups-filters-1.23.0.tar.gz
 sha256 8e697cf4681ebbca716bf8cc30dde51c264e32ceee41fa63ceb5213334204b83  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 81d9195652..214647a90e 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.21.3
+CUPS_FILTERS_VERSION = 1.23.0
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
