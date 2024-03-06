Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AEBC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 11:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7EE607FC;
	Wed,  6 Mar 2024 11:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNy305oAaPpJ; Wed,  6 Mar 2024 11:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C560360829
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C560360829;
	Wed,  6 Mar 2024 11:12:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6B1A1BF284
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 11:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9325F40154
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 11:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEjmNcMZS8uM for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 11:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD291400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD291400A4
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD291400A4
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 11:12:23 +0000 (UTC)
Received: from wslxew206.ultratronik.de
 (ipb21bd56e.dynamic.kabel-deutschland.de [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id 56E2852407A8;
 Wed,  6 Mar 2024 12:12:20 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 12:12:12 +0100
Message-Id: <20240306111212.1331451-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=ultratronik.de
Subject: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: fix masking fb option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Andreas Naumann <anaumann@ultratronik.de>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Only the 32bit ARM blob provides the framebuffer backend. This is
apparently independent of which imx8 derivate is used, so changed
the condition for the config option accordingly.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 3e095b730cf..b8dff8f9ab6 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -45,8 +45,8 @@ choice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
-	# The i.MX8 blob doesn't support FB output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	# The i.MX8 aarch64 blob doesn't support FB output
+	depends on BR2_arm
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
