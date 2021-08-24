Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2709C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:01:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958A361181
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 958A361181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6153E4022F;
	Tue, 24 Aug 2021 07:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mghoIXHLDk0R; Tue, 24 Aug 2021 07:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A721D40494;
	Tue, 24 Aug 2021 07:01:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 779FD1BF340
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6063740494
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HLUvh7YEn0i for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 07:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26A744022F
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 07:01:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b8so413677wrn.7
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 00:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GS/LR3/mF8DV0Ca5EhB2d4xFqQn3gV7F6knEx0Ghzjo=;
 b=UBemvLFP8vuSzoKP7BJ0dnaNeB79wHPE6shy0bswqd9MAbelcAeE3+1+M0v+oLOgvo
 j21CaxzKM+xjBeyZQNF3j6QEnhH2S5MbQaYA7SnXrtTwtiBSZ9oMBJasxpG4ShbcgeMd
 p6qC+IWCVU94FaBCY7YZNmNrLCIUo2kljiChoqS3SrQ4/mlMZf/BgRWeidiZSRhsxktW
 cZCiVSYNGIt/akd8ew2bkzm3JGaPLJ9xrlUH+FOsE0HjxL0zekgSSxsabhHcC57MJVKR
 M9zlgA3Mx6EB2Jo1kr5GufrJVX6z81UNqVifTXDVaV3XzDqM7hMP9eSQN1gpKAi5EJyZ
 8OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GS/LR3/mF8DV0Ca5EhB2d4xFqQn3gV7F6knEx0Ghzjo=;
 b=J3JTyhRrVzJQOWMtpUujCNXWYaS+RSvbdX8cvoYfUAZuyIBaXSxde9+xErtN1M0HOx
 fLVtk+KgWWdKADX290ZSrKcQC8mvifNiBp29bWXi5bcoxMFUEMePhZgtsF6EOVu0YybE
 rUt2A1raahESkBemsc0Y/YKSurBhyuxgam68MtdgIumAXykuRssHVwkJ4CehYYhDTG/8
 yCgIOcMmXuWYoYVGeSZWIAYO61KKa1PKN/h3orARMawURKUd2N7FhOpqDAnhOKF3U+ow
 dgFsa3/N/qu4dp2OvXVzvd+/pLpzO9o7X219QWcz3A59JmJsFD/B3uMw3NSTqSNkNVhY
 3M0Q==
X-Gm-Message-State: AOAM531/8M47g7vgxYvvzNpqOL5XY6JgB4UWTFjVw4nkktPrgrgOXNag
 Iy4lzRHVkHiJThs6gnHWKzzubPi+N9UqgA==
X-Google-Smtp-Source: ABdhPJy1ZlyD9GRT9M8mNelbVNsO6NSg2HgieF53d/JqcsioIC2PJaIbhzMNtp6TC2V+XSi1tJtr0w==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr18107931wrk.235.1629788504233; 
 Tue, 24 Aug 2021 00:01:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id l12sm1364449wms.24.2021.08.24.00.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 00:01:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 09:01:41 +0200
Message-Id: <20210824070141.94164-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-demos: use
 BR2_PACKAGE_MESA3D_GBM
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Use BR2_PACKAGE_MESA3D_GBM introduced by commit
b6c051acf787c804e732bc58ba8d7e440701a168

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d-demos/mesa3d-demos.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 4289acfffb..6b5262a2e9 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -43,7 +43,7 @@ else
 MESA3D_DEMOS_CONF_OPTS += --disable-vg
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MESA3D_DEMOS_DEPENDENCIES += mesa3d
 MESA3D_DEMOS_CONF_OPTS += --enable-gbm
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
