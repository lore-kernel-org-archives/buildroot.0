Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF72CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19E3040610;
	Sat, 16 Sep 2023 15:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19E3040610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEi0mIgwOKAb; Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6446B40AEB;
	Sat, 16 Sep 2023 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6446B40AEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B58441BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F96C81CC3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F96C81CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDTmeIWlFdBn for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:11 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95C8781CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C8781CA3
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so2948137f8f.0
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879050; x=1695483850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pbaErTrVkV2mRBEtaJo9TxeQpqUmEAeEs4NGO7o9pjU=;
 b=eD8OZfYurkQcKx8VNiMYSFtzEQ27w6kamDjhLE+HZvHgGhTzPV+62JE8xd/gWIc5In
 dsfV0lxQU6qJ2wh1GJnU0bZ7DN3i28+25CeWv9D+38fir+rkolMF3+mReRQ8KJmQo5Db
 PIJw3uAyMsqnQ9YQqzgdaVftTcxtGfKQPnM4S2gaYOIPmcSq1RsMTCz0PjoFLIu5voUx
 7Yfo5x3RCN9e8N0tM3U8hbhGH40CLFY6xDYljkT8kmY/oxEpe8msWT+pSvlVNBTAcerq
 fDMjaZafXdZ4kK0T0KryfDBFFu5eP3AwiBsGNnqsHTbBhJPfyI6FFm4q0O0Yuu22PXrt
 nVqQ==
X-Gm-Message-State: AOJu0Yylh6/iIvTT1dGWs1OK9ymsMQqtYq0qy6JfEllv3f85koy6Udzu
 NpuEIMvG1RaPioM4WwYCi1ziCPSp2KA=
X-Google-Smtp-Source: AGHT+IFzMv0jcMeqYP0IGZ4TIFJUIe+yDbvJWhnJGDGzKcwibATwGxrZLyRcTS+NctkVkpW+A0JTzA==
X-Received: by 2002:a05:6000:8a:b0:317:d048:8d87 with SMTP id
 m10-20020a056000008a00b00317d0488d87mr3716932wrx.61.1694879049256; 
 Sat, 16 Sep 2023 08:44:09 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:08 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:36 +0200
Message-Id: <20230916154351.2747233-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879050; x=1695483850; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pbaErTrVkV2mRBEtaJo9TxeQpqUmEAeEs4NGO7o9pjU=;
 b=IYF5oSWMK8FELsV39ykJR5UasvjEbxVy/NNEwqGOHtRFpFZpmhhFS23trKEWW4L1Ee
 wOKlvbT3TTxueYHDimeu3hY0JQRNB87Z2b0g/TX/r51xSHbu1w8mnv9LfoQTgkIjC17q
 LC/7NQ2g66E1bEYReaNunMUDjX88sh/cU4k2ccqKYqsnNWfKXEpb6SUDZYZVesFj4sBn
 2ZCjAMBDa1r2JHvl8ekcuIcEQqAjNyBrEelCQPNYXTfsBJpm11El3AmPxOvQis7EGWUh
 i7K8zSUl0kPI3/hrmXDPA5Pv4kJSaFie0cFX4QkDP0Q/9+30oBydYR9FHMR2Se25iPur
 xTJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IYF5oSWM
Subject: [Buildroot] [PATCH 01/16] package/perl-class-method-modifiers: bump
 to version 2.15
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

LICENSE: remove trailing spaces
see https://metacpan.org/release/ETHER/Class-Method-Modifiers-2.13/diff/ETHER/Class-Method-Modifiers-2.15#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-class-method-modifiers.hash                      | 8 ++++----
 .../perl-class-method-modifiers.mk                        | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
index ee0f5ec32..e3e88140b 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b1398e3682aa2e075b913b9f9000b596  Class-Method-Modifiers-2.13.tar.gz
-sha256  ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63  Class-Method-Modifiers-2.13.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  1aea89d0f23c3537580cae549b5c5864  Class-Method-Modifiers-2.15.tar.gz
+sha256  65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde8681cf062c2e15fc  Class-Method-Modifiers-2.15.tar.gz
 
 # computed by scancpan
-sha256  d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561  LICENSE
+sha256  3a4d15d78daa7fbb8b9f90da1b8cb60a6cd5275c6a5fdb0fca5db2e74b522dee  LICENSE
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
index ef688acf7..d4a7f11b8 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.13
+PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.15
 PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_MODIFIERS_VERSION).tar.gz
 PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
