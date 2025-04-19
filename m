Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8BFC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35FB84385;
	Mon, 19 May 2025 10:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsK3oq_ZtlUZ; Mon, 19 May 2025 10:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E05B484382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05B484382;
	Mon, 19 May 2025 10:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14EB4193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D3842398
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdFqQkqPTwxh for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6899411FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6899411FB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D49F9872E7; Mon, 19 May 2025 10:39:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:21:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 028bdac7edf02820209c82f134744f0138f1da5b
X-Git-Newrev: 3913cebc51f547fed924f51d1df2999696d71122
X-Patchwork-Hint: ignore
Message-Id: <20250519103952.D49F9872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera: add support
 for Arm Mali-C55 ISP pipeline
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3913cebc51f547fed924f51d1df2999696d71122
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support was added in v0.4.0 so let's add the knobs for building the
pipeline.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 086a5b3758..92361bbade 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
 	help
 	  Pipeline for Rockchip ISP1.
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55
+	bool "mali-c55 pipeline"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	help
+	  Pipeline for Arm Mali-C55 ISP.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index b5b17a5c94..449f66ee36 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -58,6 +58,7 @@ endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55) += mali-c55
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4) += rpi/vc4
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
