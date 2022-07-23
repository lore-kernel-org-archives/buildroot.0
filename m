Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED29EC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F6C60FDD;
	Sat, 23 Jul 2022 12:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F6C60FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f9GNN9cjE9K; Sat, 23 Jul 2022 12:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E3FD60FE0;
	Sat, 23 Jul 2022 12:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E3FD60FE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4547E1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 176FA401A4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 176FA401A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZyuKajdnFql for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:32:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 663CD40155
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 663CD40155
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:32:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ss3so12707824ejc.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=M377WcPpgf3s5C5I1418CKES77InZErqR5FPS11sUKI=;
 b=Ue8hc58IQHKasA2Vlrti1KmRnm4kLVYPbPTlIKYGPeJuZi/5xpsjuCQZbxLM+rl173
 g8SSNPzMu7N71tS46TevDNb01usLejFxI/m4ejwCIL0UsAuPXYXEvWBaaG823zVKIAHo
 PHTAPf7FebffYZj4hYZ8HCHu6/SbCEN9fwSyz2MkB7a4U+ppEwE48un0iW1WTlJjCnlF
 18vQNrRGdK9krfk2S889f2YnvxX/ULKD7I1bN1vd92DdSpgH+IG9uS9hdSi3DeNi7/fh
 t3rk5gYo4tmIkTIuuzq82L15uqUpMxgNmj6tesHlUkxrfJcCgV62a/n4xf6VzwgJcPuw
 bu3A==
X-Gm-Message-State: AJIora9pn7LRzmj5376TAoj0yE0IQK6gwgxz2Eb8PZPKYuIP4qGplRse
 aH+nRh1G9wxAjoigP81nNhKqr905hhTejQ==
X-Google-Smtp-Source: AGRyM1tMQ7afbZOj5C/+qgT21DDRCIpsXaEV86iHkKwYzBiCchunQBrXyZkV4to8eD7aE3E65ypu+g==
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id
 s16-20020a1709060c1000b006f46c70b00fmr3341931ejf.660.1658579529730; 
 Sat, 23 Jul 2022 05:32:09 -0700 (PDT)
Received: from t450s.mch2022.camp ([151.217.111.208])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a056402079200b0043a253973aasm3938299edy.10.2022.07.23.05.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 05:32:09 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 14:32:03 +0200
Message-Id: <20220723123202.17977-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=M377WcPpgf3s5C5I1418CKES77InZErqR5FPS11sUKI=;
 b=Enf4fCsGb/v29291qFGDjO690lG3laIelMh8sWJdwvODUvTmbOdR0tpZyAK2+IoYK2
 cymetguSyAArvkM/8yi262udMy18XKobpzWQ0FA+rR3WScn8dA4KArewV61DOuzd+8qD
 t+Rljp0xcksyNLzcPOax5FXc3SZIKSi+eGZ16mWq2LbmhSNOYxM/4bX6YkSolxIvwDsm
 b/usofzIqAYXkJQXe5xnO3oBJLUPnMcYtlTjiG5lQ/YyfKaBQhHjjf267eQMBitPl8pO
 wUq/x5DWJmBn5OHvlrkZg6td185WKrcBf4/jQYBJpqw8LjXFrnVaQsDWqMqOvwk3b601
 TsPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Enf4fCsG
Subject: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: add
 BR2_GLOBAL_PATCH_DIR
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add config option to set the board specific GLOBAL_PATCH_DIR.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360083

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_pitx_imx8m_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index ac03871682..460f1a97e9 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -6,6 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/pitx-imx8m/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_GLOBAL_PATCH_DIR="board/kontron/pitx-imx8m/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
