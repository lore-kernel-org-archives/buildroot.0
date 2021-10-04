Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B7AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:17:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABE461206
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ABE461206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA6440557;
	Mon,  4 Oct 2021 20:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0HspAmyFGPz; Mon,  4 Oct 2021 20:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 943F040553;
	Mon,  4 Oct 2021 20:17:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95A4A1BF2BA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834AA400F1
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbKIL4KfxaG7 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:17:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B38540017
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:17:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m22so27552646wrb.0
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 13:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDKIfY1pyairRR7bgtzTWcjGac3BLbPwNQGcsMvKtBI=;
 b=dikyF9V4Trexrcgva81Cc6SFUVKAdRGpraZwLM8NEJKTGeJM0z4pl3jGXMy1NxSIVR
 wAzHJzrqGigJ4zG+zc4I5Q2MMKj7zRDSO9EWI6ycQe4WsPZE6Iis/LvZAmx5w1xjZ0S3
 u5Rhv2M/ZfsDze0ZJKPFcYxCmbMigRSAFztjauRGF6cLoYLY92uz2pCcDimLob5eItRH
 63cCrpvKUGQBKNuyjfGHxvzxYCwoNMgPbtITKK4BHXCh2sgfYM4EjKBGe22C331pUISu
 nO1tfTRa00R/2v1aPyt0muhuv+Tet7ICbpXXKKwV8fVXyw2INfOPhzVCH/1q1FSXUq8V
 U26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bDKIfY1pyairRR7bgtzTWcjGac3BLbPwNQGcsMvKtBI=;
 b=08kCzP+lC/zYrJAvQ7h5KpoKB8XS+h9pwpbJE1/ANkrL3B8r6O8g8YSIwP2Xu25V6e
 j3pbkssgU5sI32q5j4Ve1BFoB+M6GMrMkVZ5CnrIN/2AGiE1Pb6GnrV2RihCA42/is0+
 UMDyMb452rAYeMDz8MelJYNedQgRRZds5rI3GPX/cX04mkkhZcaAltj2UcH81Egv8H46
 XHqcfqvMJx/1qHEutKyyOW4CPJFdeR6x19Yo0m3E92Q4k1BRFSzxsTSRYI3/HUYOiaBg
 +GdApMxx15Iw/TDjwmRd6PI+HXQuWtdHafeN5C03pmxccuoymv01riuiCTjZwFkHSxie
 2BLg==
X-Gm-Message-State: AOAM533yMtQqnqazPBh1a+lm5RPVCA3XVg94crPVvT5JAvA0jhV16wA6
 6oDPozO2J6czwkguQiugZ+YeduaS6qo=
X-Google-Smtp-Source: ABdhPJzMc6lNP/z+CiETeEyuf1v+ICbxBTZtuRrH8BpX1RKUpip2oSAnG5+PUdHOZIaBERTEKjiy7Q==
X-Received: by 2002:adf:a50f:: with SMTP id i15mr16918060wrb.276.1633378665893; 
 Mon, 04 Oct 2021 13:17:45 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:19f9:cbe2:8053:b89b])
 by smtp.gmail.com with ESMTPSA id z16sm1458347wmk.6.2021.10.04.13.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 13:17:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 22:17:37 +0200
Message-Id: <20211004201737.1976547-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/edk2-platforms: fix installation
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are currently three issues with the installation step:

 1. it does not ensure the parent destination directory exists before
    copying into it, so if /usr/share has not been created in the
    dependency chain of edk2-platforms, the installation fails, which
    may very well happen easily as edk2-plaforms has nothing in its
    dependency chain (except the toolchain et al.);

 2. all our dot-stampfiles and .files-list are also copied, as well as
    the Readme, license files, and maintainers file. All of those are
    useless on the target (and the .files-list introduce
    non-reproduciiblity);

 3. of a lesser importance, the construct to install, and specifically
    to reinstall, does not match what we usually do in Buildroot
    (removal of the directory to copy).

We fix all three in one fell swoop:

 1. create the destination directory if needed;
 2. copy just the directories with the actual platform descriptions

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Kory Maincent <kory.maincent@bootlin.com>
---
 package/edk2-platforms/edk2-platforms.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 47e6b1c51d..430791ae3e 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -15,8 +15,8 @@ EDK2_PLATFORMS_INSTALL_STAGING = YES
 # There is nothing to build for edk2-platforms. All we need to do is to copy
 # all description files to staging, for other packages to build with.
 define EDK2_PLATFORMS_INSTALL_STAGING_CMDS
-	rm -rf $(STAGING_DIR)/usr/share/edk2-platforms
-	cp -rf $(@D) $(STAGING_DIR)/usr/share/edk2-platforms
+	mkdir -p $(STAGING_DIR)/usr/share/edk2-platforms
+	cp -rf $(@D)/*/ $(STAGING_DIR)/usr/share/edk2-platforms/
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
