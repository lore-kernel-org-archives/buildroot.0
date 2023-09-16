Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54554CD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F6794114E;
	Sat, 16 Sep 2023 15:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F6794114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFfi-DJpfEPv; Sat, 16 Sep 2023 15:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 473064116C;
	Sat, 16 Sep 2023 15:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 473064116C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0FC21BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE6781CC3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE6781CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pU114dRHt_Yc for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:18 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2732C81CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2732C81CA3
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31c7912416bso2870993f8f.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879056; x=1695483856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/mMAcJo3KF1P40QNF5rT47RAnf6v+mkE7h8tMPHtHs=;
 b=mV+nAbv/nOw9bikk/Euilb9kJoYDMvkuJQUEM9YREGdHvCBrQEx95iooImaKA8IByI
 NqS+pgpoShFioRwrRTR3ry2lPHO3cpPy1D+PpxWzdYAWnwzqDcdBhhp8rh1knGrZ8AGc
 s3VVo7l9SPDOKLfnAZRHlrnb3OcbO9c4hLJeXQ35YaqWBkvu+p8QsOcOhDMncH6JACT2
 0Or9uDTYXhlAjk+fCYwcfy6CRDPgZvXCNDBcQBLaEHy+o6rSUi5K9S/9LA8CcG2NSK96
 Wmhgc//NzsRUrPCXz21dY9AIxaA2X/NyJOD9bsleDq8Cg2iR/hniM/+miqUcuOpFN365
 9UYA==
X-Gm-Message-State: AOJu0YyDkD3e0YUtt+8xVUg8BuRK08i/cO7gVjs5sLeP/g6JM0ZBFl7Q
 2VNO1mNW8EvvCgRHRUZFNsImxt5NCsc=
X-Google-Smtp-Source: AGHT+IHWrBEj29Mq8PZ/SVD1iJcBmb0g2xTHy7y+hlcgKBs09Rq4GBGD7zAqW52/zzuipuRhdX9koQ==
X-Received: by 2002:adf:e686:0:b0:319:8333:a2d4 with SMTP id
 r6-20020adfe686000000b003198333a2d4mr3688570wrm.29.1694879056159; 
 Sat, 16 Sep 2023 08:44:16 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:15 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:46 +0200
Message-Id: <20230916154351.2747233-11-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879056; x=1695483856; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/mMAcJo3KF1P40QNF5rT47RAnf6v+mkE7h8tMPHtHs=;
 b=MEHYdjK9fH7LZAEwzcxj2kJCJHddqde3JBehUbxg6YAdnNQictniDsIDrCzavGM5VE
 11DE33gC1+OZ7PWK15K+szZ56xCdCeiVPy6MNEN5QS/chhZbI9OD8LahdRNnWTLgwdds
 LkoFaDWHSC0y0CvYWDThGNchLq43QwbOrkH7d6WEiO13ybpWXqtLc/2qSOEfn0iBlM7R
 38Nm20BDs71VvNxCVm8S/0T50JfwN0omavRNsD6RWKn74GfDRDc7txG/HdnleJw7hvP6
 nnr1/jv1remCLIoaumFEk2ooax+igCPBPMMaCjEAAC5Ymp9CI8pw+7U0aLF+A3ecKXFU
 KdBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MEHYdjK9
Subject: [Buildroot] [PATCH 11/16] package/perl-package-stash: bump to
 version 0.40
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

LICENSE: update copyright dates && remove trailing spaces
see https://metacpan.org/release/ETHER/Package-Stash-0.39/diff/ETHER/Package-Stash-0.40#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-package-stash/Config.in               | 4 ++--
 package/perl-package-stash/perl-package-stash.hash | 8 ++++----
 package/perl-package-stash/perl-package-stash.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index 6b7ca2478..05506c242 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_PACKAGE_STASH
 	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS # runtime
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
 	help
-	  routines for manipulating stashes.
+	  Routines for manipulating stashes.
 
-	  http://metacpan.org/release/Package-Stash
+	  https://github.com/moose/Package-Stash
diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index 0bbac515e..329d2dbbb 100644
--- a/package/perl-package-stash/perl-package-stash.hash
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  287d80c9115c9230912aca684f8ca92e  Package-Stash-0.39.tar.gz
-sha256  9165f555112e080493ce0e9129de0886da30b2593fb353a2abd1c76b2d2621b5  Package-Stash-0.39.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7a2922941cc2aad6a52642e4fb13d07b  Package-Stash-0.40.tar.gz
+sha256  5a9722c6d9cb29ee133e5f7b08a5362762a0b5633ff5170642a5b0686e95e066  Package-Stash-0.40.tar.gz
 
 # computed by scancpan
-sha256  810b319a6f4a53c9cbbef513da17b2f0c872accd149bb889f153f4b78cf8cbb8  LICENSE
+sha256  5f82745d355b43f451c557642618cbd903251192b89f31ca53eaab90c35aeb7c  LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index bc116abca..dd93314d8 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PACKAGE_STASH_VERSION = 0.39
+PERL_PACKAGE_STASH_VERSION = 0.40
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
