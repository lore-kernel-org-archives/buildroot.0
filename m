From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:50:13 +0200
Subject: [Buildroot] [git commit] package/cups-filters: Add patch to fix
 build when using poppler 0.69.0
Message-ID: <20181006135104.5D8BC8DEFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41b944f231968cfe6adb41bd7c430925cadaf5fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch lets cups-filters only use gMemReport and memCheck functions
if poppler version less than 0.69.0

The poppler project removed the memCheck and gMemReport functions in
commits c362ab1b97f20c5b73b3bad8d52015f679178748 - Remove DEBUG_MEM
from Object since this uses RAII now and hence cannot leak.
(The existing tracking also is not thread-safe and hence unreliable.)

and

f89446f6917a869b0f1a80fcc8ce81a7213dade4 - Remove generic heap debugging
from gmem since external tools and compiler instrumentation achieve the
same effect.

The patch has been applied upstream:
https://github.com/OpenPrinting/cups-filters/commit/50d984a621524c2e2857ad84eb4b71933c8821be.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...removed-memCheck-and-gMemReport-functions.patch | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch b/package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch
new file mode 100644
index 0000000000..3eb2d35c3e
--- /dev/null
+++ b/package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch
@@ -0,0 +1,79 @@
+From 6b0747c1630dd973acd138f927dbded4ea45e360 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Fri, 5 Oct 2018 12:05:31 +0200
+Subject: [PATCH] Poppler removed memCheck and gMemReport functions
+
+Only use gMemReport and memCheck functions if poppler version less
+than 0.69.0
+
+The poppler project removed the memCheck and gMemReport functions in
+commits c362ab1b97f20c5b73b3bad8d52015f679178748 - Remove DEBUG_MEM
+from Object since this uses RAII now and hence cannot leak.
+(The existing tracking also is not thread-safe and hence unreliable.)
+
+and
+
+f89446f6917a869b0f1a80fcc8ce81a7213dade4 - Remove generic heap debugging
+from gmem since external tools and compiler instrumentation achieve the
+same effect.
+
+This commit solves https://github.com/OpenPrinting/cups-filters/issues/62
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ filter/pdftoijs.cxx            | 2 ++
+ filter/pdftoopvp/pdftoopvp.cxx | 2 ++
+ filter/pdftoraster.cxx         | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/filter/pdftoijs.cxx b/filter/pdftoijs.cxx
+index 22bc33f4..dd6b6fa0 100644
+--- a/filter/pdftoijs.cxx
++++ b/filter/pdftoijs.cxx
+@@ -503,9 +503,11 @@ err1:
+   ppdClose(ppd);
+   free(outputfile);
+ 
++#if POPPLER_VERSION_MAJOR == 0 && POPPLER_VERSION_MINOR < 69
+   // Check for memory leaks
+   Object::memCheck(stderr);
+   gMemReport(stderr);
++#endif
+ 
+   return exitCode;
+ }
+diff --git a/filter/pdftoopvp/pdftoopvp.cxx b/filter/pdftoopvp/pdftoopvp.cxx
+index 024941ab..bf25983b 100644
+--- a/filter/pdftoopvp/pdftoopvp.cxx
++++ b/filter/pdftoopvp/pdftoopvp.cxx
+@@ -763,9 +763,11 @@ err2:
+  err0:
+   delete globalParams;
+ 
++#if POPPLER_VERSION_MAJOR == 0 && POPPLER_VERSION_MINOR < 69
+   // check for memory leaks
+   Object::memCheck(stderr);
+   gMemReport(stderr);
++#endif
+ 
+ }
+ /* muntrace(); */
+diff --git a/filter/pdftoraster.cxx b/filter/pdftoraster.cxx
+index 0c63ab8d..4ebf02b0 100644
+--- a/filter/pdftoraster.cxx
++++ b/filter/pdftoraster.cxx
+@@ -2162,9 +2162,11 @@ err1:
+     cmsDeleteTransform(colorTransform);
+   }
+ 
++#if POPPLER_VERSION_MAJOR == 0 && POPPLER_VERSION_MINOR < 69
+   // Check for memory leaks
+   Object::memCheck(stderr);
+   gMemReport(stderr);
++#endif
+ 
+   return exitCode;
+ }
+-- 
+2.17.1
+
