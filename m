Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EA0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C478560FC3
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C478560FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80736830A8;
	Sat,  9 Oct 2021 20:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdqdUHbBqKEO; Sat,  9 Oct 2021 20:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF7C983004;
	Sat,  9 Oct 2021 20:56:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 053401BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E98736075D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oc-D0OS_JTlt for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFD806073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:34 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id h125so1197931pfe.0
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GrbA0GkxW8e8JB3EW6WEWS+S3V5w+JseqsDPntG0Pks=;
 b=XNPXIZR6e8BjtamtlsYw2u7ZuEgGsyiIxaza6uSsyeWqh8H8pXSmUrL4PKr0BbhaqD
 zJU4lqfNbvqmDx5ImS8rOTm8QDEI7PLGBIaL2mTGSqNsPJAmLw21H6KsASATrAf/Yr61
 xybW1Hg18aYU3+aCRnb3EKQxTZFMGjBM2Nel55pgUUOxpnD/Flbvq0FUN0MMiFc6c55m
 jSfZuM4aj7z+t9p49F46xICoBNqtm7pJDGJ6hm3LaaxS44EO7nFYHZYrBvrl+OchTuCe
 H9P/umrwy6o2Klwfyblde8RYjIcIRhVCPChbxAHN4oAXn6/IB/vjWNbPyeHWyCWWe6yn
 4awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrbA0GkxW8e8JB3EW6WEWS+S3V5w+JseqsDPntG0Pks=;
 b=VGumnP0vlPNRlkCuZ606wxVUN9dxP1XVI8Ko38nPiDCymQ7xFrZzsajSBuJg5HZRPP
 mShoh8R9mxy3cwDfypTLWVRmPXs3A2C7es6LkXN9dDBnKvhBULrxzkTSd9YJlYzSJC6j
 zcrJ6A7WOuPqtQ3VHkMjLrSKfTQhEd37gSKsQ2xaA4P4HopCbfZjviOjuAe5sPi6H1QI
 2FRtUQEa3Pjof8Bu/uFeFZ8AUnwKLa4g7A6WLFsk5V6lTVr+YDSQ1SDMI4AcfJrFfLy4
 7Zh0BNOQ/xncpekM83EjiBFik/wKdNEbpqzCevWoC96ASQjzYMk6g8ZLCqeocK/7JY0c
 DnqQ==
X-Gm-Message-State: AOAM533Sf1ttLUU8yVYFvkJSm/nZnGiE3CoqP2fZuH4Oh+F/cfug+rKW
 DxoWIvTKOFHPDSHnpPLjNmxImzScchW3Rg==
X-Google-Smtp-Source: ABdhPJxLBgAywwWteFTJoPjyqqyF9NBI8ow1NoXD5bjcWvNfbpJGZ9hY/VPK1HlS7S8hcr6sHNtLeQ==
X-Received: by 2002:a05:6a00:15d6:b0:44c:238e:8269 with SMTP id
 o22-20020a056a0015d600b0044c238e8269mr16952438pfu.15.1633812934216; 
 Sat, 09 Oct 2021 13:55:34 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:34 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:10 -0700
Message-Id: <20211009205523.3137859-8-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/20] package/python-libusb1: bump to version
 2.0.1
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
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index 21f4840601..bbbc6e0a74 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/libusb1/json, sha256 locally computed
-md5	cb4073182fef4cee6ab9c6666b48d1a1  libusb1-1.7.1.tar.gz
-sha256	adf64a4f3f5c94643a1286f8153bcf4bc787c348b38934aacd7fe17fbeebc571  libusb1-1.7.1.tar.gz
+md5  b087646fb0c8c4cf7e8123af72f885b9  libusb1-2.0.1.tar.gz
+sha256  d3ba82ecf7ab6a48d21dac6697e26504670cc3522b8e5941bd28fb56cf3f6c46  libusb1-2.0.1.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 075f50f418..40a64141af 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 1.7.1
+PYTHON_LIBUSB1_VERSION = 2.0.1
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/80/bb/4ee9d760dd29499d877ee384f1d2bc6bb9923defd4c69843aef5e729972d
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a9/97/e8afa2af12b6de608ec86c8c4ad57f1248d98946d1b5e1aa0bff926755e9
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
