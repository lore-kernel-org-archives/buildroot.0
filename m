Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A181C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352496008E
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 352496008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039FF401EF;
	Wed,  3 Nov 2021 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eA10-byPDyaJ; Wed,  3 Nov 2021 19:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E66DF401C0;
	Wed,  3 Nov 2021 19:56:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 207DB1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C367401C0
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83hN7pzgb9PG for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4CD840146
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:55:29 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id u7so2076315qtc.1
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjNANnuOWMmqf5RgkupHu8FH/ejjtKEXs1rBfHvgYBE=;
 b=my76hU0B0HdVENSfxIeEmIDkr8NG8z+3QwKTIDPcfYZAcV9DMLiTTiz++oPJdq7lNR
 Ycs5dK3clgdkJOi3dG868LYVjMZX8pVY8q2hJudLZ2CH2r++IZQBQUnudxM4FqhoOGQk
 XDyOj4rYNhZwOww/4eDotl7Pirb/j34ipiezY187dZQXAt3pAKKGyoDXQU2O+piIP/bt
 /irnAp0naIxjl+Thk/disE+JLn8HGEm2YI09AUcftq1QTlH+dqmJsFWdPPYQfipYiLo6
 skkCV2fDN+F7PE4CYMNukOm4VQDYQXKzwqy5GVBsPYID4Di+jIG117pYALORrpgs2NLx
 ajKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjNANnuOWMmqf5RgkupHu8FH/ejjtKEXs1rBfHvgYBE=;
 b=5X/snzyPuN01EfNzwm5O39wB1wQgVDJSaBz9ErdSESCbHKQTHOWUCVdOXGCKk1fyAa
 uCq73+tBXg/B/EI6ltcuB8ufTGP0SzDT5n7Pv5jrpq/DitMKoClAt09lWpJZgR2gvLQn
 VS4Jpcd71E29jBZtxx7IXTI5cDuP9UXHEJFMnXniv6PdgXYvrXHU25TUvvRVXy8yrGyL
 b/RPm1LYeMd+7kVLPGrOXldADr9VrIlH0SfYhxuhSk/nhfKmP/I2dQKq82GQEOt7lL+H
 F0L25FcnKfLSj7BHPoG/Tyv2kek7mW5/4tK/2MzHyQT3+VE6I3ONDeT0jrWmhqdWzKBT
 q7IQ==
X-Gm-Message-State: AOAM5310QZ94VUayDWbgDBvV3KHu9soeChynDdoKLqK1s/uFAFgpI1hr
 gXhnJ1ZDBAGw6K05Ybt+VDicGdIj5hs=
X-Google-Smtp-Source: ABdhPJwIp2AchZcaCEgJneDcEyvlhnho3VgiEVrCz63ayYQ6TN8VZYhZJ678OOnJ7EXLtKwmfbtE8w==
X-Received: by 2002:a05:622a:11d1:: with SMTP id
 n17mr31887832qtk.357.1635969328330; 
 Wed, 03 Nov 2021 12:55:28 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e14sm2449335qty.59.2021.11.03.12.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:55:28 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 12:55:20 -0700
Message-Id: <20211103195520.147558-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211103195520.147558-1-aduskett@gmail.com>
References: <20211103195520.147558-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender_grubenv: bump to version
 1a7db967495bbe8be53b7a69dcb42822f39d9a74
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

Other changes:
  - Drop depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV as mender-grubenv no
    longer uses fw_printenv and fw_setenv and instead provides
    grub-mender-grubenv-print and grub-mender-grubenv-set

  - Update the LICENSE hash as the year has changed.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-grubenv/Config.in           | 7 -------
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index 28b4bb7074..97f785ad3f 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	bool "mender-grubenv"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER # runtime
-	# grubenv provides it's own fw_printenv.
-	depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	depends on BR2_TARGET_GRUB2
 	help
 	  Contains the boot scripts and tools used by Mender to
@@ -36,8 +34,3 @@ comment "mender-grubenv needs a grub2 bootloader"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER
 	depends on !BR2_TARGET_GRUB2
-
-comment "mender-grubenv does not work with uboot-tools fw_printenv"
-	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_MENDER
-	depends on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index b6b9db72a7..fcc4e02cbe 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5be4222a6934813da431ae472a633e766b73f4614020745b777c15c65bcfd032 mender-grubenv-f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b.tar.gz
-sha256 32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99 LICENSE
+sha256 00a574d2bed8d54ba6739700da789a420a02de900df56dd2cfbe0df460a98dca mender-grubenv-1a7db967495bbe8be53b7a69dcb42822f39d9a74.tar.gz
+sha256 b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 1be722233c..08c6a5f240 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b
+MENDER_GRUBENV_VERSION = 1a7db967495bbe8be53b7a69dcb42822f39d9a74
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
