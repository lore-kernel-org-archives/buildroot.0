Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A83C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 23:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D838C8125D;
	Wed, 14 Sep 2022 23:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D838C8125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ks792SIh_LaU; Wed, 14 Sep 2022 23:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0477080E46;
	Wed, 14 Sep 2022 23:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0477080E46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03B9F1BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 23:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0EDA60671
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 23:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EDA60671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9L4S_bNrY2kp for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 23:03:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33836059A
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E33836059A
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 23:03:38 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11e9a7135easo44997503fac.6
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 16:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=cQRHkGhbaFWDnsYpW+7WaoU894HPukQIRLN8WWDNSzc=;
 b=oekzdT8+z42I9Q6D/L73Wl3+2J/1yB4HQOmF44yauEwAFUmQKUiUdIstj5MfZIlr8o
 oM7tob451+FqLpD4C3lUBhWYnE9Lg8dgk2L3lFLOLkol2mjsMKsPT7a0+4Pm+jxwWYdY
 +cEPZNvHMrBppyOOsEHE8TzClaLeFf92nBUsC6ucCJAdGsrudj44+dLFstEwXvlDocsg
 ZzGUUE5a4M/ipSSSw+uRCNFTvwwM1wVTDOhkURiADuTZJQh4a7MdN4SsqqlvC6fnUExJ
 s3bwCfbNfYDp1JagbbWZL8bH0jUYV3UJUaZTBlSkeTHxkc3ahRIgT1Cupny++XycMeNE
 E0cQ==
X-Gm-Message-State: ACgBeo0CmAAj6jt4fXSIC+DI1hjC7Yu7stapj0gK45/Bx/UQ14BQwjYm
 WgDQ1BWx2MPGVjgtUbheXHzCLkYqD50=
X-Google-Smtp-Source: AA6agR4yQYCJ8PAaAIYVVYaGp+aDBx1lfXnpZ7KKngX7Lun1KNUpYQEW2FR6PU8aJkySiw0nfziG4w==
X-Received: by 2002:a05:6870:a90e:b0:11d:f581:954a with SMTP id
 eq14-20020a056870a90e00b0011df581954amr3921208oab.249.1663196617718; 
 Wed, 14 Sep 2022 16:03:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 l10-20020a0568302b0a00b0063711d42df5sm4615657otv.30.2022.09.14.16.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 16:03:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 17:03:34 -0600
Message-Id: <20220914230334.4001572-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=cQRHkGhbaFWDnsYpW+7WaoU894HPukQIRLN8WWDNSzc=;
 b=mDKrEDFZZcCktj6aPL7rNDSqGOZdWW3mdrsodEkyPj827790Ehf6cCMdPs1v4Hlomh
 VRTbK0mXWlpNUS4//tOmISghx1wgLbKrNVw+L+SrzLUDsDZpuOhfWNc//hKTezuznxSc
 mfF7/w96bVlgRKLFxf7n7dpKJZMmgZ8l2CUtCobqNB5QpESrrDvo4sC8ENdW2osAol6S
 rcRhkRK9O29cXuh9ee/E+xgfI+s62P9vMRc1rLWGOGR2kGOt62haONtr53FJplDw8p9M
 /WbB/ja+UVJkwAgnLd7+35n5n5gSVTdC444xNcrn9TqyZA4R7KoVqmDVVYONbDGpl4VC
 PN5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mDKrEDFZ
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: set cpp_rtti option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.

Fixes:
 - http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - move rtti option under BR2_PACKAGE_MESA3D_LLVM
---
 package/mesa3d/mesa3d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0630f43df1..daefd6f6d5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -48,6 +48,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
 MESA3D_CONF_OPTS += -Dllvm=enabled
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
 else
 # Avoid automatic search of llvm-config
 MESA3D_CONF_OPTS += -Dllvm=disabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
