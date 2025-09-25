Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AE6CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA836163D;
	Thu, 25 Sep 2025 20:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_JGeZpBXO6f; Thu, 25 Sep 2025 20:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C13A61631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C13A61631;
	Thu, 25 Sep 2025 20:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0683212D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6FCA61524
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iYeliYcTVMj for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9ED261529
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9ED261529
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C80FE86449; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1319b99257d689a629f7aece1a59880cee51a62f
X-Git-Newrev: 762dd2d6d75867a307df05b68a053391f678e1a1
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.C80FE86449@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libfreeimage: fix
 build with GCC 14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1181289118474911224=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1181289118474911224==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=762dd2d6d75867a307df05b68a053391f678e1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Take two patches from the Debian jxrlib package, and integrate them to
fix the build of the bundled jxrlib library found in the libfreeimage
package.

libfreeimage isn't exactly well maintained: its last version 3.18.0 is
quite old (July 2018), there's a fairly large number of tickets in the
bug tracker claiming to be CVE
reports (https://sourceforge.net/p/freeimage/bugs/), it is still using
SVN as the version control system.

However, it is used as an optional dependency for CEGUI, and a
mandatory dependency for Ogre. However, it no longer seems to be a
dependency for more recent versions of Ogre. But in any case it cannot
simply be dropped.

Fixes:

  https://autobuild.buildroot.net/results/452462285bf93b13f092fb41696952f415e75b2f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 21ea33c764b212f84adb01289998c788fbfac04c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0005-jxrlib-ftbfs-with-GCC-14.patch            | 40 ++++++++++++++++++++++
 ...06-FTBFS-fix-for-function-prototype-error.patch | 29 ++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch b/package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch
new file mode 100644
index 0000000000..c13a8dc26f
--- /dev/null
+++ b/package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch
@@ -0,0 +1,40 @@
+From 11383a017e8d040f1376c964d2b8769108204f0b Mon Sep 17 00:00:00 2001
+From: YOKOTA Hiroshi <yokota.hgml@gmail.com>
+Date: Thu, 25 Jul 2024 15:03:31 +0900
+Subject: [PATCH] jxrlib: ftbfs with GCC-14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Bug-Debian: https://bugs.debian.org/1075105
+
+_byteswap_ulong() is defined in image/sys/strcodec.c
+
+Upstream: Bug submitted at https://sourceforge.net/p/freeimage/bugs/389/
+[Thomas: patch taken from https://sources.debian.org/patches/jxrlib/1.2~git20170615.f752187-5.3/0013-jxrlib-ftbfs-with-GCC-14.patch/]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+----
+/usr/bin/cc -DDISABLE_PERF_MEASUREMENT -D__ANSI__ -Djpegxr_EXPORTS -I"/<<PKGBUILDDIR>>/common/include" -I"/<<PKGBUILDDIR>>/image/sys" -I"/<<PKGBUILDDIR>>/jxrgluelib" -I"/<<PKGBUILDDIR>>/jxrtestlib" -g -O2 -Werror=implicit-function-declaration -ffile-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -Wall -Wextra -Wdate-time -D_FORTIFY_SOURCE=2 -fPIC -w -MD -MT CMakeFiles/jpegxr.dir/image/encode/strenc.c.o -MF CMakeFiles/jpegxr.dir/image/encode/strenc.c.o.d -o CMakeFiles/jpegxr.dir/image/encode/strenc.c.o -c "/<<PKGBUILDDIR>>/image/encode/strenc.c"
+/<<PKGBUILDDIR>>/image/decode/segdec.c: In function ‘_load4’:
+/<<PKGBUILDDIR>>/image/decode/segdec.c:68:12: error: implicit declaration of function ‘_byteswap_ulong’ [-Wimplicit-function-declaration]
+   68 |     return _byteswap_ulong(v);
+      |            ^~~~~~~~~~~~~~~
+---
+ Source/LibJXR/image/decode/segdec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/LibJXR/image/decode/segdec.c b/Source/LibJXR/image/decode/segdec.c
+index 1299458..8050355 100644
+--- a/Source/LibJXR/image/decode/segdec.c
++++ b/Source/LibJXR/image/decode/segdec.c
+@@ -63,6 +63,7 @@ static U32 _FORCEINLINE _load4(void* pv)
+     v |= ((U32)((U16 *) pv)[1]) << 16;
+     return _byteswap_ulong(v);
+ #else // _M_IA64
++    U32 _byteswap_ulong(U32 bits); // from image/sys/strcodec.c
+     return _byteswap_ulong(*(U32*)pv);
+ #endif // _M_IA64
+ #endif // _BIG__ENDIAN_
+-- 
+2.51.0
+
diff --git a/package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch b/package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch
new file mode 100644
index 0000000000..bdda376467
--- /dev/null
+++ b/package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch
@@ -0,0 +1,29 @@
+From 7b59b3757521d82406771cc47127aa70ffb26f3f Mon Sep 17 00:00:00 2001
+From: YOKOTA Hiroshi <yokota.hgml@gmail.com>
+Date: Thu, 25 Jul 2024 16:01:01 +0900
+Subject: [PATCH] FTBFS fix for function prototype error
+
+Bug-Debian: https://bugs.debian.org/1075105
+
+Upstream: Bug submitted at https://sourceforge.net/p/freeimage/bugs/389/
+[Thomas: patch taken from https://sources.debian.org/patches/jxrlib/1.2~git20170615.f752187-5.3/0015-FTBFS-fix-for-function-prototype-error.patch/]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/LibJXR/jxrgluelib/JXRGlueJxr.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/LibJXR/jxrgluelib/JXRGlueJxr.c b/Source/LibJXR/jxrgluelib/JXRGlueJxr.c
+index 2bf085a..182fc7f 100644
+--- a/Source/LibJXR/jxrgluelib/JXRGlueJxr.c
++++ b/Source/LibJXR/jxrgluelib/JXRGlueJxr.c
+@@ -28,6 +28,7 @@
+ //*@@@---@@@@******************************************************************
+ #include <limits.h>
+ #include <JXRGlue.h>
++#include <wchar.h>
+ 
+ 
+ static const char szHDPhotoFormat[] = "<dc:format>image/vnd.ms-photo</dc:format>";
+-- 
+2.51.0
+

--===============1181289118474911224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1181289118474911224==--
