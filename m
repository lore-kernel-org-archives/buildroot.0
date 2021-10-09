Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E57C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D0F60F9C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6D0F60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CAE6081F;
	Sat,  9 Oct 2021 20:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57Zu4gt92Gvt; Sat,  9 Oct 2021 20:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB00A607D5;
	Sat,  9 Oct 2021 20:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83E8E1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E60405F7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWWvzhaCR5Fn for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8358240012
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:29 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so10380105pjb.5
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJIqk3B9Z6cqQtOLXILDhZ9MZ82cZX1KZkRl74ml0U4=;
 b=jmb5ND92MvQhX8vny50yE0s09ufUqwRSkxIWxRsWqe4y/OnqmYHaB0cHVdMmq9B2aU
 eGP3zTm40LoCejuVOrcxoj64zaimxTUnquSiSyR2rEafVmi/YHNZoruaoIZGSjfouo0Z
 7QorfI29dOVeHHvdrvEXLk7F1Cy5y1h0b4ruy1GRoy+z/C3bW2PmlTtIqkKbnmTy/n7C
 EX5njmRFso8dwMVW6S3/t7gjHpIlZYe0I2UuJoSesJPaNyHVzVVp68m7vLek0PDeUCka
 fki7eAtqUQzZe6WlGjIQESLbpDQ5HIE1WxTJJ4qlqclwHvSbjb6J3LxjxoihT74ofRrA
 Fjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJIqk3B9Z6cqQtOLXILDhZ9MZ82cZX1KZkRl74ml0U4=;
 b=10dphJWmFFqTSvm3LXoIxM+HpedlLR9ligbV32AWblTfVlDnpv6FVvt8jOzJLAt56V
 1LKPqVcIbSqvnOnwh3VH40StXGSnDeWqWhIWYHnRls2Bbu5pK8TSxZxyE1O8U5Lw44O5
 EmapQBt3nIhFWIsYuz1hV04PO1rOqOpvIz+f/lB6UN4GNKpYwAmb4Aj4Nha+e2fw5z7D
 bhCMMoBUu4B7mZFzpveAU1uwls89OItSU9ltmGC9L/BrbOdUKbcWiEO2WhGco45ILDr8
 YC3QnqjwDJhK52Fsb28fpcgtZVwaxfRXAktmn+/Pvr8iAZcnnwDe97PJ6tW6ZddEOTsm
 AHqw==
X-Gm-Message-State: AOAM533GdEF+kNHifxIlxkBCSv/fj+uWZ1WVflFaGCm5l9EyWzaFPmSn
 VfvYdMYF2abQ0sCnX1J3RwPIuLuOWclV4w==
X-Google-Smtp-Source: ABdhPJyorRNyw0WrqXGAEwXVExl2ufOAr2zTX5uQ8n8p+xJyMDrqMMFRfakusHuNnYxM0SNzwNCUXQ==
X-Received: by 2002:a17:90a:181:: with SMTP id
 1mr20261246pjc.214.1633812928872; 
 Sat, 09 Oct 2021 13:55:28 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:28 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:05 -0700
Message-Id: <20211009205523.3137859-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/20] package/kmod: bump to version 29
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index f0bd436dc8..c68e41f1b6 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  3969fc0f13daa98084256337081c442f8749310089e48aa695c9b4dfe1b3a26c  kmod-28.tar.xz
+sha256  0b80eea7aa184ac6fd20cafa2a1fdf290ffecc70869a797079e2cc5c6225a52a  kmod-29.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7c5d200b0f..c7f510ec0f 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 28
+KMOD_VERSION = 29
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
