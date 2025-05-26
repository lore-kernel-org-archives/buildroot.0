Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D5C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2859083BE8;
	Sat, 31 May 2025 17:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gbgg8U4MedGs; Sat, 31 May 2025 17:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369B083BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 369B083BC3;
	Sat, 31 May 2025 17:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 114EC117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0339183BE8
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pzpj-D-ahj_D for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4785E83BA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4785E83BA7
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3833187802; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:50:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 65ca143c5ca0f96445e94f885767841db3aac30a
X-Git-Newrev: 9b7d8eb75e499d81fca36a835eff99988d496c80
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.3833187802@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/qt6/qt6multimedia: ffmpeg support needs headers >= 5.2
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
Content-Type: multipart/mixed; boundary="===============1309036819058751653=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1309036819058751653==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9b7d8eb75e499d81fca36a835eff99988d496c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The V4L2 code in the ffmpeg plugin uses V4L2_PIX_FMT_BGRA32 which was
only introduced in kernel headers 5.2, in upstream kernel commit
e25ec9141114c7124eeba09385e272dd76fbe617.

Fixes:

/home/thomas/buildroot/buildroot/outputs/qt/build/qt6multimedia-6.8.1/src/plugins/multimedia/ffmpeg/qv4l2camera.cpp:36:43: error: ‘V4L2_PIX_FMT_BGRA
32’ was not declared in this scope; did you mean ‘V4L2_PIX_FMT_BGR32’?
   36 |     { QVideoFrameFormat::Format_BGRA8888, V4L2_PIX_FMT_BGRA32  },
      |                                           ^~~~~~~~~~~~~~~~~~~
      |                                           V4L2_PIX_FMT_BGR32

when building:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
 BR2_PACKAGE_QT6=y
 BR2_PACKAGE_QT6BASE_XCB=y
 BR2_PACKAGE_QT6MULTIMEDIA=y
 BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
 BR2_PACKAGE_XORG7=y

at a time when the Bootlin stable toolchain was using Linux 4.19
headers.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit fe783b16b362e4d739ad8583ad6c5c02d626f13a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6multimedia/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index 3107caa597..f64f60a004 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -28,10 +28,17 @@ config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
 	help
 	  This option enables the Qt6 Multimedia examples.
 
+comment "ffmpeg plugin needs kernel headers >= 5.2"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+
 config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	bool "ffmpeg plugin"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	# V4L2_PIX_FMT_BGRA32
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	# qt6-multimedia ffmpeg plugin needs
 	# qt6base-concurrent, PulseAudio and ffmpeg-swcale.
 	select BR2_PACKAGE_FFMPEG

--===============1309036819058751653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1309036819058751653==--
