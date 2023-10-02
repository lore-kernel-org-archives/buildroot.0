Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D6BE748FC
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 16:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9599B40994;
	Mon,  2 Oct 2023 16:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9599B40994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhpco4chqmiJ; Mon,  2 Oct 2023 16:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B75E41A49;
	Mon,  2 Oct 2023 16:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B75E41A49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96E921BF2B7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B29582192
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B29582192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syQC4uT3ck3a for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 16:53:09 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 858C382295
 for <buildroot@busybox.net>; Mon,  2 Oct 2023 16:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 858C382295
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99c136ee106so2354333766b.1
 for <buildroot@busybox.net>; Mon, 02 Oct 2023 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265587; x=1696870387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBsPl/yN35dF26DxHzO/+0ZCz7do+N2vx5vQyfoYwNA=;
 b=YvDiC6Qlv03vLMFDA7Oz++nsDyk/f4d2FQVr+bwyR8uvLOmPHdBK+vg6IqlRC393W9
 3lLcNOSwUdsB565sPpxKmX8PVCyuX6ESX9uhwr7sy55yVG0zrJHVrPsbu1tzyvPsoSL+
 gyteyJ5/2PwlDQ01ZE4lbdGNV8t23j04O5Em252Ik1TdfVnrzhjgY7+M/EOjM0vvgsYe
 CWC0TTnfSnw3g1Ui2fmowiI7YpMwSvk1SHD3wul8NaVVMsGFlI3cBwJxLI6ktT2nlIiv
 KgUtLq5NWZQPvaMnjcz3WL34KuOWa+O6Hxt7OdoaLQsPVVFrma6IV3zXWCVvnFtMTY/H
 u9BA==
X-Gm-Message-State: AOJu0Yy/mIpzL7rsETdzhNUCMf5hhWu9U2Pe0Yw4jnBn+A5UmcDhuY+r
 HBQCSX/T/gbxAumoGbAVQVve5n0A0ug=
X-Google-Smtp-Source: AGHT+IHjOI+AEWptbT4+tnVZar3KhpH6CP3JPdIwfDRkoqHzwuyMgEFhOjHdvJpWPC2C4yXTfcsPOw==
X-Received: by 2002:a17:907:d13:b0:9b2:6c37:22ee with SMTP id
 gn19-20020a1709070d1300b009b26c3722eemr11755961ejc.21.1696265587549; 
 Mon, 02 Oct 2023 09:53:07 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709061f1700b0098921e1b064sm17294148ejj.181.2023.10.02.09.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 09:53:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Oct 2023 18:53:02 +0200
Message-Id: <20231002165302.3341402-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002165302.3341402-1-francois.perrad@gadz.org>
References: <20231002165302.3341402-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696265587; x=1696870387; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBsPl/yN35dF26DxHzO/+0ZCz7do+N2vx5vQyfoYwNA=;
 b=FVu600HAgjxl6cI+5ms3dXE6idGpDTkhKGdUCLGI4Wpvrrhi/AlvILWV3mEZ6U0Op5
 rrih3oF2tEGiXvrH7jatgS8oOGcNY3IMGY5y5D/Sq3L3bKCBqh+E2XAJsngfm+W3Mf3r
 Kc/CBNIkrXRGp1VKrnvBcukawmhfuL6NuFMjdzBZhDO23m1etvUmsuC9l8Mhuqf8Uz9G
 4iz0dCMYT7wgzts0XmqF98hzLDJWWGm5kCAJVWND6djbxGcmiX4Mnire1d4osaZmOTLm
 XyRH8o/Dkjt/y1ewA1ls2KTP7Hdn3CmT5mY7HnEAhyYahDWBR/KzfCakFiDDbBnKR7t6
 nE/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FVu600HA
Subject: [Buildroot] [PATCH 2/2] package/perl-module-build: bump to version
 0.4234
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE: now filled with a real content
see https://metacpan.org/release/LEONT/Module-Build-0.4234/diff/LEONT/Module-Build-0.4232#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.hash | 8 ++++----
 package/perl-module-build/perl-module-build.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index a2181290e..590307e78 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  144885f1cbaf9420017bbed696ec6b83  Module-Build-0.4232.tar.gz
-sha256  67c82ee245d94ba06decfa25572ab75fdcd26a9009094289d8f45bc54041771b  Module-Build-0.4232.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0032d0c0bc36a3b68ef41c947829d5e3  Module-Build-0.4234.tar.gz
+sha256  66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f  Module-Build-0.4234.tar.gz
 
 # computed by scancpan
-sha256  f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e  LICENSE
+sha256  af1570e8af55af52b4e86d040e2a993cb684566275c43c4d7a8b0cc5a90e08a4  LICENSE
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index d95a30647..972902e04 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4232
+PERL_MODULE_BUILD_VERSION = 0.4234
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
