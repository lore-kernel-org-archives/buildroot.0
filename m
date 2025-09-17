Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25711CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D1F8148D;
	Wed, 17 Sep 2025 20:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Yk9oZJirVZm; Wed, 17 Sep 2025 20:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4085812C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4085812C0;
	Wed, 17 Sep 2025 20:59:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D261AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E7314172E
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFqJ93zc4w2i for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 20:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A55CD415CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A55CD415CD
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:59:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FA7C85BD4; Wed, 17 Sep 2025 20:59:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 22:51:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be466c265ba09ed47ec1eb40f006dd17753e69d1
X-Git-Newrev: 21ea33c764b212f84adb01289998c788fbfac04c
X-Patchwork-Hint: ignore
Message-Id: <20250917205939.9FA7C85BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeimage: fix build with GCC
 14.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5526031965559918229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5526031965559918229==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=21ea33c764b212f84adb01289998c788fbfac04c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============5526031965559918229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5526031965559918229==--
