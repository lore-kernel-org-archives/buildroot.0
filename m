Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F09C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 19:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C786414CA;
	Tue, 19 Jul 2022 19:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C786414CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LBHoDweMtHH; Tue, 19 Jul 2022 19:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC34C40921;
	Tue, 19 Jul 2022 19:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC34C40921
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586501BF580
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32C7E81297
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C7E81297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDYf366gGBXu for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 19:02:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC748128C
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC748128C
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 19:02:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ez10so28916545ejc.13
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 12:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5ps6DuAMMoafwNvV7ektfvZRcKVRvPgWG6COfl6+gM=;
 b=MxSMGxLFLPnJLarMm3NX9/wSoHu44pHcES5WxyTX6oayOEC/KWgbURuB47Va5WEjax
 NyrXdZh7pODaKdYLrZkDmgEV2k8mfPjTDCJqjUGVqqz1H8FYmi9nw8Njz5igl70PRQ9j
 oa69utGZ4LnunqLeaYFmaOZc6HbFz4EC12RmrPDDQE2cCg9ZUY20L48WT/KUxgqyujPj
 JeN/sq3PoPZbgcMY7uNluiK/zz43saNjKlQyLztzrMFiWrYlJN3W6Pt2JgHnL344+fGc
 RkVMGismTr/15suS154ZrapZSq5OJsRfEbmk0oBVaCnqI7Tq7IiF7YB3JHWwnzSZha2I
 mCsg==
X-Gm-Message-State: AJIora/VsNred7DOLHmoYeshHHWILCc+s4YIkMybpa8Fsx6ZtPGg+sOy
 627OnDFWdN6hAfDo7maYNolP8mRyEys=
X-Google-Smtp-Source: AGRyM1vyaMJwwbhmLjgXhIPRDburSMD2DTheSZRNsSKMq2wfD/qpRATcUeXjMGYlPWY8OlfZs6crQg==
X-Received: by 2002:a17:906:c152:b0:72f:3a21:7c35 with SMTP id
 dp18-20020a170906c15200b0072f3a217c35mr9406453ejc.476.1658257329911; 
 Tue, 19 Jul 2022 12:02:09 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 kb1-20020a170907924100b0072b1bc9b37fsm6967010ejb.22.2022.07.19.12.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 12:02:09 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 21:00:52 +0200
Message-Id: <20220719190051.555180-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719190051.555180-1-heiko.thiery@gmail.com>
References: <20220719190051.555180-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5ps6DuAMMoafwNvV7ektfvZRcKVRvPgWG6COfl6+gM=;
 b=FpFCJDr67SEP3OdbQlOs4xCFF1Fe2BSloNE8e4W/rf8835/vkcDXiyincmcE09Ffhc
 TKFACpTxPTEJLfH5hUptSrlQizk9wiSb0YUORy1eVL66eObrswsfMJnhLkKJvyXK7W5B
 U2NgYK4EPlu/k9KmM2k8x5Y2g6dLaoooxVtS6UGHs9npUUs/hsBHlXYliNPb7H09s/WQ
 pZSoRYbOTBkBV21xFLqRriVTrDlBoowAH0WR5PjbTX5/lQhy4SoGZPgEkxkqXPH5aUAw
 75Jlv1KsGzTVTN4H6S21kpCJg2u7FiJX/U/EmbKPlhHUDzivS9cpReV1aNZOjT6WwnbB
 7vGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FpFCJDr6
Subject: [Buildroot] [PATCH 2/3] configs/kontron_pitx_imx8m_defconfig: add
 BR2_TARGET_UBOOT_NEEDS_GNUTLS
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With U-Boot 2022.04 libuuid is required for building the host tool
mkeficapsule. The lib is included in the util-linux package. Thus the
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX config is needed.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_pitx_imx8m_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 7448f27980..ac03871682 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
