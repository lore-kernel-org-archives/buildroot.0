Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56404C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:13:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9508A6101E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9508A6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D7B831A9;
	Thu, 14 Oct 2021 16:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnDCzvJUVSqc; Thu, 14 Oct 2021 16:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1BF6831A7;
	Thu, 14 Oct 2021 16:13:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE32A1BF575
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5BDA403BA
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyFcsIomimLK for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 16:13:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9ED8402AC
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 16:13:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v17so21091277wrv.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdycw4JWA45BwvGGscqVCu3nDC8FLeSuKYcSY+nYT/w=;
 b=FwaVYK8zoGuSmfqQRQ2OVBtLjO30iHydgJSwfRQszupn+P6XJuDAGX1bo3BN5+EJlB
 UQSlCBb4Abau8HXgFmu58NcwWP6NY+NQ1B1f2nbOW1mFujh3ujTbQZqDwqFmrcfYMn2g
 JpNzfmkka2PD67Uk8VYSJq9QGUaehLOhbxbUHnRhj2gVJjlwg0c3G8MnylKsaasXh+Xa
 xWvnoWSdNjn2vTOINmDM+MaufQh0zLpqUEMi4zLQ/8B6S/hgGjx9A6OfKR3oyMnh5ZCZ
 Xp3aY9ZRpOgoewZW1P/0PP03xB1Cw2WiHxCxcJvXoc3MUvNtAfjHIz8QMrZFu6i0QFE1
 BZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdycw4JWA45BwvGGscqVCu3nDC8FLeSuKYcSY+nYT/w=;
 b=Pmk6KQe7t6NlX7ZKOxTPjCy/+KmnbfyocTVKq3DGv2CHeBO8GWQrsrmveTfXjrxxbr
 flcQLdc74HLXfexYxh3z8K/25dX+WI9+ztdiVFMWHKemqwd3oAxmJRaSTEmEZkUVQoCx
 idHOfphHn/GoeEJtIeA7M5TfCg20N8XH/cDDF+KeQfLZSH2borP0bwiX2sBS2QbgfbPI
 zxvfBxQZ2Gon/4QNtpCmPOOIBTTBtwPcdFoP1vDzTDXicUrrb1lzvIE3SoUEzwJkfqXw
 lxLojHmVet6VztHnJ7+7/vpxCa1aL8Op0ntHMXRyvnr+UtRvxk6G2PI+wfFciUhMfl9I
 pgvw==
X-Gm-Message-State: AOAM530pswd0OIDL9LQPJdxBdTV7LTDXB76SPfsNxRAfeu0L+kIVT/Ul
 +5VM0m+RkK28HRDlRYoLplwqBD4K8rk=
X-Google-Smtp-Source: ABdhPJy08M8HEV5jHg7z2zw6uwDPRRGqTvDkO3omYX0tC+mSTDaG/LdmCgKrL7OrrzM2sKe/4ev5SQ==
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr7737437wrr.22.1634227997705;
 Thu, 14 Oct 2021 09:13:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id v10sm2947347wri.29.2021.10.14.09.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:13:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 18:12:14 +0200
Message-Id: <20211014161214.2154818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu-hantro-vc:
 fix check-package
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following check-package warning raised since commit
219822da9034a0e280f55447b6e297e9a9acf3db:

package/freescale-imx/imx-vpu-hantro-vc/Config.in:13: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freescale-imx/imx-vpu-hantro-vc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/Config.in b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
index 9ae139550a..9a0f448bc9 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/Config.in
+++ b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_IMX_VPU_HANTRO_VC
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	help
-	  i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus processor.
+	  i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus
+	  processor.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
