Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E133CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE38040259;
	Mon,  2 Sep 2024 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXc-UpoGGnxx; Mon,  2 Sep 2024 20:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E14DF40322
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E14DF40322;
	Mon,  2 Sep 2024 20:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 185F61BF8B4
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 062A0606E2
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eICRykP5t9c for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3103760622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3103760622
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3103760622
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:57:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bbdf7f860so29579805e9.3
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 13:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725310637; x=1725915437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/jewXA46NT379vX/04F2vKWuXZrs/sWhgv5fUKIfGU=;
 b=GBIUR21o3X0b0xA6lf+YTFlewgSVdpaT8Lej0Lv7a0KiTL5G2ud6Y/GPA+68/EzB5V
 E54ZLGuORVQdut69tGYbVPKvn67n6x1Sze0h8uWKg/7f8GD39fJ3o9PBn92VCUpnapPF
 Ur70TN0xsqXVQ6ztNDitRK9KwaNWlM8/9ayunfBWV/TlaDoAWCZbj99+DtKee2UjOFFX
 735qqNFty8BHtdm4nhxrLwFg1gv3DIZrN9dU12zb/JKsJtbGks59bv0g9Q9dNkD8ss0h
 ObtBTVDGN5VT5l4wmw43+hfJAG95X/Uh503itkcN8JRhEX3T2U6JI/KFeuHPrvRn00t1
 bSHg==
X-Gm-Message-State: AOJu0YzAHFLbqn9M7rUSW0lSPXN2U/ob5UDvPTSyRH3HALgCXrGxmSP9
 dlKsGe5d0kL1VA6RKnuaeQZl3jMdkeXj0pMBt5e90IbBoVYxsr5Wd20MxWO0d/cuENF3RJVHKWE
 uH9E=
X-Google-Smtp-Source: AGHT+IHpIPYqB7qJBima3praqf2iIWqQt0w8JVk6ZMNKH+ZOCBwzrCHKXyZN9pTe3vShM/elQXTB5w==
X-Received: by 2002:a05:600c:1d8f:b0:426:6158:962d with SMTP id
 5b1f17b1804b1-42bb01e6e03mr108641775e9.23.1725310637042; 
 Mon, 02 Sep 2024 13:57:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb43esm149733725e9.7.2024.09.02.13.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:57:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 22:57:07 +0200
Message-ID: <20240902205707.239163-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
References: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725310637; x=1725915437;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/jewXA46NT379vX/04F2vKWuXZrs/sWhgv5fUKIfGU=;
 b=JDnMISNNoTk9KBXtVgSMmYLq61Q4wh11E+fVLi2oo6AWNP46bZT+7mhozH6P9aHYHX
 vY5xkkt7p7Cz07W7wA3+YQoYZu1ASxGJt0x0lCX8X91jWJxVBfDmdwOsi+7CiJwnFCMB
 bQrXwz+lmBIADdewDcsdSn/syIqNjvpdefjy0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JDnMISNN
Subject: [Buildroot] [PATCH v4 2/2] DEVELOPERS: add Dario Binacchi for babeld
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59f3b0320244..919a91dd2591 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -790,6 +790,7 @@ F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	package/babeld/
 F:	package/sscep/
 F:	package/uuu/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
