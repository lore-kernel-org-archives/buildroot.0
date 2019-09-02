From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:36:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/giflib: add two
 upstream security fixes
Message-ID: <20190902161352.91C048A2F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1639bb364d1682d536ed712fbbb1abd03daef778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2018-11490: The DGifDecompressLine function in dgif_lib.c in
  GIFLIB (possibly version 3.0.x), as later shipped in cgif.c in sam2p
  0.49.4, has a heap-based buffer overflow because a certain
  "Private->RunningCode - 2" array index is not checked. This will lead
  to a denial of service or possibly unspecified other impact.

- Fix CVE-2019-15133: In GIFLIB before 2019-02-16, a malformed GIF file
  triggers a divide-by-zero exception in the decoder function DGifSlurp
  in dgif_lib.c if the height field of the ImageSize data structure is
  equal to zero.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d7926d7cb5f9b2c820cb4b4e8576012b24a50064)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bug-113-Heap-Buffer-Overflow-2-in-functio.patch | 31 ++++++++++++++++++++++
 ...bug-119-MemorySanitizer-FPE-on-unknown-ad.patch | 28 +++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch b/package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch
new file mode 100644
index 0000000000..9c6f344be8
--- /dev/null
+++ b/package/giflib/0001-Address-SF-bug-113-Heap-Buffer-Overflow-2-in-functio.patch
@@ -0,0 +1,31 @@
+From 08438a5098f3bb1de23a29334af55eba663f75bd Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Sat, 9 Feb 2019 10:52:21 -0500
+Subject: [PATCH] Address SF bug #113: Heap Buffer Overflow-2 in function
+ DGifDecompressLine()...
+
+This was CVE-2018-11490
+
+[Retrieved from:
+https://sourceforge.net/p/giflib/code/ci/08438a5098f3bb1de23a29334af55eba663f75bd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/dgif_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dgif_lib.c b/lib/dgif_lib.c
+index 15c1460..c4aee5f 100644
+--- a/lib/dgif_lib.c
++++ b/lib/dgif_lib.c
+@@ -930,7 +930,7 @@ DGifDecompressLine(GifFileType *GifFile, GifPixelType *Line, int LineLen)
+                 while (StackPtr != 0 && i < LineLen)
+                     Line[i++] = Stack[--StackPtr];
+             }
+-            if (LastCode != NO_SUCH_CODE && Prefix[Private->RunningCode - 2] == NO_SUCH_CODE) {
++            if (LastCode != NO_SUCH_CODE && Private->RunningCode - 2 < LZ_MAX_CODE && Prefix[Private->RunningCode - 2] == NO_SUCH_CODE) {
+                 Prefix[Private->RunningCode - 2] = LastCode;
+ 
+                 if (CrntCode == Private->RunningCode - 2) {
+-- 
+2.20.1
+
diff --git a/package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch b/package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch
new file mode 100644
index 0000000000..60e9a324a2
--- /dev/null
+++ b/package/giflib/0002-Address-SF-bug-119-MemorySanitizer-FPE-on-unknown-ad.patch
@@ -0,0 +1,28 @@
+From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Sun, 17 Mar 2019 12:37:21 -0400
+Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/giflib/code/ci/08438a5098f3bb1de23a29334af55eba663f75bd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dgif_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dgif_lib.c b/lib/dgif_lib.c
+index 3a52467..179bd84 100644
+--- a/lib/dgif_lib.c
++++ b/lib/dgif_lib.c
+@@ -1143,7 +1143,7 @@ DGifSlurp(GifFileType *GifFile)
+ 
+               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
+               /* Allocate memory for the image */
+-              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
++              if (sp->ImageDesc.Width <= 0 || sp->ImageDesc.Height <= 0 ||
+                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
+                   return GIF_ERROR;
+               }
+-- 
+2.20.1
+
