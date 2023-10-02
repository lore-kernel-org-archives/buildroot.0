Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868DDE784AB
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 16:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E394031B;
	Mon,  2 Oct 2023 16:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E394031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Np8PdNFGnSh3; Mon,  2 Oct 2023 16:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2873E40425;
	Mon,  2 Oct 2023 16:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2873E40425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 741D11BF2B7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF8682299
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF8682299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYtH_fdRQoIQ for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 16:53:09 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52C6182192
 for <buildroot@busybox.net>; Mon,  2 Oct 2023 16:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C6182192
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so2384852266b.0
 for <buildroot@busybox.net>; Mon, 02 Oct 2023 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265587; x=1696870387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5o7rAzLo7HplnjMKDXLWOQnHc8xJRX0ssP7PixJufYs=;
 b=nNFV5tmn0F1vYoxCCC45KXnVzFbxwU3bqAWLHPsE7YQUpg3wPwXO2sI+nY5GZVD/bk
 0f33pEWeQ4AAYrjWWx1qIodWGkIikfUrL2tZ3gBQptGFusL82dn69TxA0M2tx3xFnUml
 rMc13qSpg2kXn/8Tr9sf75rerMUU/nFijmA+AFYjENfbox2MD5gV5JppTEEIylQdi1oj
 R/lVmoCGZbrEcAIGxHkJoZf4xB0jmDPCAFW0JMw5qXiUKKMmtAMvxN9S01Qj8ci6rq/2
 QeCTOdANAFAwoNehibahdmxlHxVDLU0lj87kb4TXlV3M5tExBhNTHepBTI6nZ6NYLwWn
 kXbg==
X-Gm-Message-State: AOJu0YzdIWe2OGaFJ86mIXc517+brKXclCSPfl9pWxwxMKIaDsAuvKkx
 7/Cu4UDq7eK0JG/4nCIq7jnnzxyqLJU=
X-Google-Smtp-Source: AGHT+IHk5h6dSbEWNeUTkii5jCPLOEs1KFvLV3QGjWl//Qz5NfipYbSo+2Fxh+UoumvXxZP+mVruSQ==
X-Received: by 2002:a17:907:1dcb:b0:9ae:5367:fe90 with SMTP id
 og11-20020a1709071dcb00b009ae5367fe90mr10489296ejc.32.1696265586807; 
 Mon, 02 Oct 2023 09:53:06 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709061f1700b0098921e1b064sm17294148ejj.181.2023.10.02.09.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 09:53:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Oct 2023 18:53:01 +0200
Message-Id: <20231002165302.3341402-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696265587; x=1696870387; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5o7rAzLo7HplnjMKDXLWOQnHc8xJRX0ssP7PixJufYs=;
 b=Y2BKCsQrl9lTHT3aetY8L81YPHLVQLDsS9nzmVyDKKSWW7LGaVrKfsf9bEPBhBjTiU
 K54n76tfAE44Sm9umUhttycelUkNTRx76wrs0p1cehYiQNIP5e/Mk2xHKvP2qxGEui7Z
 hXXXTUosvtPy0mC4oOO8N+I9ngi3c4pRkJIiUe+ld1IDCthxpcJh8jm9vo5SOxgoAN4t
 RfEA+ozhLJeTIqCCPFgDQELWjY3L94zxS2Y4k7IKigaUzXOt4X0NdLikJudSopSJUqa/
 4syGZw3CYSEcW4SbDTfVz/6woEItsDnWnSNldNUKkqNnMHNfUQGPxjTTPbSrd20bcY1e
 bPzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y2BKCsQr
Subject: [Buildroot] [PATCH 1/2] package/perl-module-build-tiny: bump to
 version 0.047
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

LICENSE: switch to Perl Artistic
see https://metacpan.org/release/LEONT/Module-Build-Tiny-0.047/diff/LEONT/Module-Build-Tiny-0.039#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-module-build-tiny/perl-module-build-tiny.hash    | 8 ++++----
 package/perl-module-build-tiny/perl-module-build-tiny.mk  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 7f03f96c1..7b503ff06 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2332c90c17454107fea3f2614e11a3a9  Module-Build-Tiny-0.039.tar.gz
-sha256  7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c  Module-Build-Tiny-0.039.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  de9814b3c22825837438fc70adad58ac  Module-Build-Tiny-0.047.tar.gz
+sha256  71260e9421b93c33dd1b3e7d0cf15f759c0ca7c753fa840279ec3be70f8f8c9d  Module-Build-Tiny-0.047.tar.gz
 
 # computed by scancpan
-sha256  09fd2bc0428920c455f10c5a6c52e2bb4615114e88966c75ce27a07af028c36b  LICENSE
+sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index cdf6ac3ec..e2e3d83e7 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.039
+PERL_MODULE_BUILD_TINY_VERSION = 0.047
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
 	host-perl-extutils-config \
 	host-perl-extutils-helpers \
 	host-perl-extutils-installpaths
-PERL_MODULE_BUILD_TINY_LICENSE = Artistic or GPL-1.0+
+PERL_MODULE_BUILD_TINY_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_MODULE_BUILD_TINY_LICENSE_FILES = LICENSE
 PERL_MODULE_BUILD_TINY_DISTNAME = Module-Build-Tiny
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
