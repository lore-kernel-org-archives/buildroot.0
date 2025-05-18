Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C9DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 737B28200D;
	Sun, 18 May 2025 14:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osHEtvI4DK6Z; Sun, 18 May 2025 14:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A31881FAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A31881FAB;
	Sun, 18 May 2025 14:47:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 053DCDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7D460BB7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7rqOgZvAEdk for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2EB960BEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2EB960BEF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0EB287141; Sun, 18 May 2025 14:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:05:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2133c1998b8e968046aee8fbd15b004b6a94b1ba
X-Git-Newrev: cadc95d94c9c5b8a60b3c13af479748528109003
X-Patchwork-Hint: ignore
Message-Id: <20250518144710.A0EB287141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ffmpeg: bump to
 latest commit in 6.1.x branch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9170558492796543278=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9170558492796543278==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cadc95d94c9c5b8a60b3c13af479748528109003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Version 6.1.2 of ffmpeg fails to build with GCC 14.x due to the V4L2
ioctl code:

libavdevice/v4l2.c:137:17: error: assignment to ‘int (*)(int,  long unsigned int, ...)’ from incompatible pointer type ‘int (*)(int,  int, ...)’ [-W
incompatible-pointer-types]
  137 |     s->ioctl_f  = prefix ## ioctl;      \
      |                 ^
libavdevice/v4l2.c:151:9: note: in expansion of macro ‘SET_WRAPPERS’
  151 |         SET_WRAPPERS();
      |         ^~~~~~~~~~~~

This has been fixed upstream in the release/6.1 branch, which has 27
fixes on top of 6.1.2. The commits necessary to fix our issue are:

f71076c009f84917e7a0f2f1ece86b718de2d8d3 configure: improve check for POSIX ioctl
60593d6c06c9b610359bd6af26a268feff1293eb configure: restore autodetection of v4l2 and fbdev

However, since all other commits are fixes, we believe bumping to the
latest commit in the release/6.1 branch is a better idea.

This allows to drop
0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch, which
is upstream as of:

4c688845a50f7dce3af9afebe60f0f7a493c4f07 libavcodec/arm/mlpdsp_armv5te: fix label format to work with binutils 2.43

Note that we set FFMPEG_CPE_ID_VERSION to get proper CVE matching even
with FFMPEG_VERSION being set to n6.1.2-27-ge16ff06adb. One who have
ideally set FFMPEG_VERSION to n$(FFMPEG_CPE_ID_VERSION)-ge16ff06adb,
but that makes check-package unhappy with:

WARNING: package/ffmpeg/ffmpeg.mk:7: expecting package version to be set before CPE_ID_VERSION

Fixes:

  https://autobuild.buildroot.net/results/fe1574443acd50ca7e576bb4beb24467be1713e3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 32df543fa3c61c922296d79b9304d6cb730f93b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...arm-mlpdsp_armv5te-fix-label-format-to-wo.patch | 63 ----------------------
 package/ffmpeg/ffmpeg.hash                         |  2 +-
 package/ffmpeg/ffmpeg.mk                           |  8 +--
 3 files changed, 6 insertions(+), 67 deletions(-)

diff --git a/package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch b/package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
deleted file mode 100644
index 178ffbc33b..0000000000
--- a/package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 4c688845a50f7dce3af9afebe60f0f7a493c4f07 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 9 Aug 2024 11:32:00 +0100
-Subject: [PATCH] libavcodec/arm/mlpdsp_armv5te: fix label format to work with
- binutils 2.43
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-binutils 2.43 has stricter validation for labels[1] and results in errors
-when building ffmpeg for armv5:
-
-src/libavcodec/arm/mlpdsp_armv5te.S:232: Error: junk at end of line, first unrecognized character is `0'
-
-Remove the leading zero in the "01" label to resolve this error.
-
-[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Martin StorsjÃ¶ <martin@martin.st>
-(cherry picked from commit 654bd47716c4f36719fb0f3f7fd8386d5ed0b916)
-
-Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commit;h=4c688845a50f7dce3af9afebe60f0f7a493c4f07
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libavcodec/arm/mlpdsp_armv5te.S | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libavcodec/arm/mlpdsp_armv5te.S b/libavcodec/arm/mlpdsp_armv5te.S
-index 4f9aa485fd..d31568611c 100644
---- a/libavcodec/arm/mlpdsp_armv5te.S
-+++ b/libavcodec/arm/mlpdsp_armv5te.S
-@@ -229,7 +229,7 @@ A .endif
-   .endif
- 
-         // Begin loop
--01:
-+1:
-   .if TOTAL_TAPS == 0
-         // Things simplify a lot in this case
-         // In fact this could be pipelined further if it's worth it...
-@@ -241,7 +241,7 @@ A .endif
-         str     ST0, [PST, #-4]!
-         str     ST0, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
-         str     ST0, [PSAMP], #4 * MAX_CHANNELS
--        bne     01b
-+        bne     1b
-   .else
-     .if \fir_taps & 1
-       .set LOAD_REG, 1
-@@ -333,7 +333,7 @@ T       orr     AC0, AC0, AC1
-         str     ST3, [PST, #-4]!
-         str     ST2, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
-         str     ST3, [PSAMP], #4 * MAX_CHANNELS
--        bne     01b
-+        bne     1b
-   .endif
-         b       99f
- 
--- 
-2.30.2
-
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 630bd70c56..50498a6ba9 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38  ffmpeg-6.1.2.tar.xz
+sha256  f0b2b07c7014b7aa8c4689095b83a49a85d41887049fc5302543aec0bef7d066  ffmpeg-n6.1.2-27-ge16ff06adb-git4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 799201c820..5c00ba2dff 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.2
-FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
-FFMPEG_SITE = https://ffmpeg.org/releases
+# Update FFMPEG_CPE_ID_VERSION if needed
+FFMPEG_VERSION = n6.1.2-27-ge16ff06adb
+FFMPEG_SITE = https://git.ffmpeg.org/ffmpeg.git
+FFMPEG_SITE_METHOD = git
 FFMPEG_INSTALL_STAGING = YES
+FFMPEG_CPE_ID_VERSION = 6.1.2
 
 FFMPEG_LICENSE = LGPL-2.1+, libjpeg license
 FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1

--===============9170558492796543278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9170558492796543278==--
