Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2C6C38142
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 12:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81A1B40B75;
	Wed, 24 Aug 2022 12:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A1B40B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWaXkAEPTwQN; Wed, 24 Aug 2022 12:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D25040B6E;
	Wed, 24 Aug 2022 12:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D25040B6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F2A81BF37A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 12:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 576C381AA7
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 12:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 576C381AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1NCGYeMP3Fv for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 12:49:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C3481A73
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99C3481A73
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 12:49:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso792306wmb.2
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hc35GQ5c6Ch9np2pKNdF1v3V9GkTh3rhcjFWQq5qDKA=;
 b=MYCiwc8jq6psH4XzggoymoP+nMxg5C3gruhJ3BprB2qq2x0bN3kZPyQQ68HaBsv9Nx
 OUSKW+2KPY7HU9amYLSpKr9RCJqlMFLYEWjwANTz3uE5aJhpj6UH2TxnLU2yfSpZyFqZ
 a3CzbcnZFL1RWZc64SZ6FfN8RZchvJ/bv3/0gbE1leJiqi0EOBKZlj0K8aEkTHTnGTY4
 Jn9PqTEgpfrwwrPsGseNSi3iVQSEsxJveiX0rDc3CgrFWWX+epQJxPwWTv1039cpNgJI
 uTzGF4UPjuJwN6egz+N6OKtwlItcyI3aocAlmz4EpuQ6Bbp0qCX9F7ZLHCCeGUbntddY
 L8zw==
X-Gm-Message-State: ACgBeo3vE08i+XrtxTiHmoEuBMrIKvUTO1GX6iTk2JWj5QwrKzB9u8a3
 gKHpqJokARR0qoNvaesTOEZIVVdnTsQ=
X-Google-Smtp-Source: AA6agR63bWdSjeTvKjtXo1mQ3EtQSwK4ysgU/65pr+6gdI4gNm9jH1j2SDePOrdxGFUHwbxf121skw==
X-Received: by 2002:a05:600c:358f:b0:3a6:145:3500 with SMTP id
 p15-20020a05600c358f00b003a601453500mr5401256wmq.64.1661345387735; 
 Wed, 24 Aug 2022 05:49:47 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l68-20020a1c2547000000b003a60edc3a44sm2174228wml.5.2022.08.24.05.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 05:48:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Aug 2022 14:48:16 +0200
Message-Id: <20220824124816.1697526-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hc35GQ5c6Ch9np2pKNdF1v3V9GkTh3rhcjFWQq5qDKA=;
 b=dgZMTVfvIEVdGHOhaCgPSK85JFE0vNI9OVKerCPPWmlmDlbiZelfw81jjGR8hb0ncH
 Iz2URqgOOY3zT1p8DausgJwFRPxFipXgKjlQLT/Os0Y81XXpPWerq19ZfXUtINfX4Oti
 NGhSsideI3DVXXY1VacZASe22Z1E/rC0073ovbH71U/itLOSHm7noY4oxN2YAmt6k3/i
 Napso5s+scoLXpX5JJT9OAGYxg8EY9Ggh8Zzmxvq6Lnrdu5uNPtr6qtKjKSd+D7gJvk/
 H90O+eXYmfzpRt3iZEzyHD0PFEMhEAyM3IkM7MiqCNVN1q1iXk+CHjYUwhUSZU3fBeXt
 WQyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dgZMTVfv
Subject: [Buildroot] [PATCH] package/freescale-imx: add layerscape platform
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

layerscape is not strictly a member of the IMX family,
but the NXP layerscape family uses some of components of the IMX family,
especially the IMX GPU Vivante.

this change allows to use imx-gpu_viv firmware with a layerscape SoC.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/freescale-imx/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 4a4237fb4..18c65d743 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -57,6 +57,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
+
+config BR2_PACKAGE_FREESCALE_LAYERSCAPE_PLATFORM
+	bool "layerscape"
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
@@ -76,6 +79,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "LAYERSCAPE" if BR2_PACKAGE_FREESCALE_LAYERSCAPE_PLATFORM
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
@@ -100,7 +104,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_LAYERSCAPE_PLATFORM
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
