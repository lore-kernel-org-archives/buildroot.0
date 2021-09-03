Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC68C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:52:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725416101A
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 725416101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41AF983F10;
	Fri,  3 Sep 2021 19:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhodxBKgklgd; Fri,  3 Sep 2021 19:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E00C83F34;
	Fri,  3 Sep 2021 19:52:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 998D71BF2F7
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89948426A6
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gY6nBK_ZEd1J for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 19:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E491442559
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 19:51:39 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.165.52.250])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ADCC5B0053F;
 Fri,  3 Sep 2021 21:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630698698;
 bh=QK/CZvigcDd5UzC173ZEmWCTfXwqtwTXtgG1YTzCWsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ogAmOzRlgSzElcK1cWIDWpX9UvHuUK7BiB6knj6PD/x/PR7ONt3rCWHw9g3ThvXwx
 ExJNEexxAeoHv8tMkFR3ufqOimuv5f1LgUQduhjdLC7+negXj27EMSY6U1Tw39zuLb
 SvgUHgK2Dxv9l5UAHY5f6wUgrddOGilh2MYy4TwZQAymClO2idI6d7PIpKHWi1B8V7
 GwPya/+HwaVB7CgfJASq0lLxmwvSR2WoxWoz4cxAS2fmh+PiQPE7sA6GyqlyEbRLEC
 MWKeSeqgGpEnx6vnguwdVEqGpLldWZJzcU8uvV1uG/NWS8JkJv12+vuToWiywRAIDy
 LwV65c/PHySzg==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 21:50:21 +0200
Message-Id: <20210903195021.11686-3-ju.o@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903195021.11686-1-ju.o@free.fr>
References: <20210903195021.11686-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/glslsandbox-player: add vivante fb
 default
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

When BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB is selected, the native windowing
will be set to vivante frame buffer.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glslsandbox-player/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 8ab668d260..02d4c442ed 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -60,6 +60,7 @@ choice
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL    if BR2_PACKAGE_WAYLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11   if BR2_PACKAGE_XORG7
 	help
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
