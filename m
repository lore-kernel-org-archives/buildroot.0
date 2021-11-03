Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB9FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:55:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03AB66008E
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03AB66008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81126063A;
	Wed,  3 Nov 2021 19:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIw5OdFUrjge; Wed,  3 Nov 2021 19:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F1B56063D;
	Wed,  3 Nov 2021 19:55:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C31FF1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B088280E3B
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYZmQXGzUGKL for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0AEB80DF4
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:55:24 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id bp7so3490375qkb.10
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZmaG8Brv0ce7w3isavizgWMXlt6RfNIRkRWwEy5cf44=;
 b=K9wcTPGnmlXpCBZQ5o+wpH0q+7AAyyQkhxDW6yc4RIIRcIT+3epEtv3Mxf9z0UCU32
 oyUIe6VSVlzfirKpj0DPvQETi81T3p9GJVrfMJ2FECkYt8CRfNCUh0e9IAMG+1iUQoFA
 sJSweT4PNZy3FrYcJy1saJRov9OduKV3kb/540Oe8I9Z2bn5tzEZKSz0yE2wwalbynD5
 j0KfBudz2fKsFF2h3NEhrCrxAnp0qDIdF39FBHjQaBIameLsyPSCkpqAri+iBnHtsn2i
 hkXyavG6z4JNfFfwLWBQVngAOxuoJKedD7Z9sl9IBCTvdbCXxP4YVjAt1z5JoSbA2md0
 /ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZmaG8Brv0ce7w3isavizgWMXlt6RfNIRkRWwEy5cf44=;
 b=AnYFEolU8xbLY110ZIwXVTV6OvCngDBbV/kj+KwsXxqdxS0YvASU1VbqYN/xHlksuE
 Ug/ZmLVjP1R81yMVPBsN1eESgI1p0MpEDahabH/M3QRlzjgqwW9z5+TPEyjGp4iggySk
 HRWz/UuOX08AcjdU/cFnB4UpNrKWD13jSJNAGcNM9um5s4SUGKcfXA9/MkJBHcv9Ld5C
 pLuvY6KbbMdjJWqmbtbJeoh85vvJXkXacJ1ojWZ6cxH83hrTRuamqOHHq/wuaqTTUmL6
 1GM15WbIPsxNYUCDfsQAx5t0Oh8x+Ivlc0xnJ/x5yQqHarM2T1FtSlNOrigk7KZP+VpR
 OD/g==
X-Gm-Message-State: AOAM533btA/wBAlbdCwznajSePwN6DezjnIxQ83U/OY7r01YAVLpzAuI
 VRXmXHxR4N9J9EPPEtu6jwzgS7ZPhi8=
X-Google-Smtp-Source: ABdhPJyFNRSOaqLH386B7y9qn7siB0JOVXciEp/a5HhUPBe0aFpWTgmwL0OesaJboH+k9rPsxSZJTg==
X-Received: by 2002:a05:620a:2a0c:: with SMTP id
 o12mr20733381qkp.380.1635969323510; 
 Wed, 03 Nov 2021 12:55:23 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e14sm2449335qty.59.2021.11.03.12.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:55:23 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 12:55:16 -0700
Message-Id: <20211103195520.147558-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender: bump to version 3.1.0
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
Cc: Mirza Krak <mirza.krak@northern.tech>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.hash | 2 +-
 package/mender/mender.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index c2bbbe5fc1..40d82f072f 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d68839eb493175a05371eec8e6ec8691ccc22c999614b9954923a0b5ebe56840  2.6.0.tar.gz
+sha256  716ba7110dd68cdafc5caa989706ff67bbac0617c284d666aa81605850be5763  3.1.0.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index a110caf551..ec48a716ed 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.6.0
+MENDER_VERSION = 3.1.0
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
