From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Sep 2019 18:57:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: drop unneeded patches
Message-ID: <20190903165749.19930-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches which are already included in version 5.2.1

Fixes:
 - http://autobuild.buildroot.org/results/a558f21cb1d9ad8618a1c64464e0cf1ccba7608b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...13-Heap-Buffer-Overflow-2-in-functio.patch | 31 -------------------
 ...19-MemorySanitizer-FPE-on-unknown-ad.patch | 28 -----------------
 2 files changed, 59 deletions(-)
 delete mode 100644 package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch
 delete mode 100644 package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch

diff --git a/package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch b/package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch
deleted file mode 100644
index 9c6f344be8..0000000000
--- a/package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 08438a5098f3bb1de23a29334af55eba663f75bd Mon Sep 17 00:00:00 2001
-From: "Eric S. Raymond" <esr@thyrsus.com>
-Date: Sat, 9 Feb 2019 10:52:21 -0500
-Subject: [PATCH] Address SF bug #113: Heap Buffer Overflow-2 in function
- DGifDecompressLine()...
-
-This was CVE-2018-11490
-
-[Retrieved from:
-https://sourceforge.net/p/giflib/code/ci/08438a5098f3bb1de23a29334af55eba663f75bd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/dgif_lib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/dgif_lib.c b/lib/dgif_lib.c
-index 15c1460..c4aee5f 100644
---- a/lib/dgif_lib.c
-+++ b/lib/dgif_lib.c
-@@ -930,7 +930,7 @@ DGifDecompressLine(GifFileType *GifFile, GifPixelType *Line, int LineLen)
-                 while (StackPtr != 0 && i < LineLen)
-                     Line[i++] = Stack[--StackPtr];
-             }
--            if (LastCode != NO_SUCH_CODE && Prefix[Private->RunningCode - 2] == NO_SUCH_CODE) {
-+            if (LastCode != NO_SUCH_CODE && Private->RunningCode - 2 < LZ_MAX_CODE && Prefix[Private->RunningCode - 2] == NO_SUCH_CODE) {
-                 Prefix[Private->RunningCode - 2] = LastCode;
- 
-                 if (CrntCode == Private->RunningCode - 2) {
--- 
-2.20.1
-
diff --git a/package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch b/package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch
deleted file mode 100644
index 60e9a324a2..0000000000
--- a/package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
-From: "Eric S. Raymond" <esr@thyrsus.com>
-Date: Sun, 17 Mar 2019 12:37:21 -0400
-Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
-
-[Retrieved (and backported) from:
-https://sourceforge.net/p/giflib/code/ci/08438a5098f3bb1de23a29334af55eba663f75bd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dgif_lib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/dgif_lib.c b/lib/dgif_lib.c
-index 3a52467..179bd84 100644
---- a/lib/dgif_lib.c
-+++ b/lib/dgif_lib.c
-@@ -1143,7 +1143,7 @@ DGifSlurp(GifFileType *GifFile)
- 
-               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
-               /* Allocate memory for the image */
--              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
-+              if (sp->ImageDesc.Width <= 0 || sp->ImageDesc.Height <= 0 ||
-                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
-                   return GIF_ERROR;
-               }
--- 
-2.20.1
-
-- 
2.23.0.rc1
