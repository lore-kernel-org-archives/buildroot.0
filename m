Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AAFCD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 318F440AEB;
	Sat, 16 Sep 2023 15:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 318F440AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a90srfdtYRF7; Sat, 16 Sep 2023 15:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67A6E40610;
	Sat, 16 Sep 2023 15:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A6E40610
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2581BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8181F81CA3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8181F81CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ooHm0uTC4eN for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:13 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7376B81CAD
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7376B81CAD
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-404314388ceso32600625e9.2
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879051; x=1695483851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAH7c/LtvWsREe9J8LiVVH75xm/hDn4r/z1qrYCrB4Q=;
 b=XhgJ5qCFi+X8rCsZ/zybtcV3qdKujQmAO4wmqGkBmoJp8HMNWAYpWvmrODOX/XQRY/
 big63WztgaI2YnR2fo+PLT1dOfWGHO1LY5sPzTV+L3R1uLgcVNWOAyrozBFHViW0L1ks
 k6BRs6pPB+HSY4vnlEMpMEIrdkLd9qwz1g/11gYjSq67phGZfhPhg8iNbsBrtahFFvH0
 fM8Z1x8D4jY+zBa+BjGhWlmFMHFwFc0jc42z0zbcSI9AxMkyENEWPriLA97azQ+F1s6k
 S6OsVmT/Z2mfMbOpiqdqMAG9Jhc3rge2yKgyQJzao3ZlQgpojpKpcZ5i7DVYWUfiN6k1
 v12Q==
X-Gm-Message-State: AOJu0Yzvfs3Apy3ZFYDTeBd0xnltDl+KSFKVK1d4YmCL7Vx0qfy9Ixel
 xdaDi1ih3t8fycMN3RfDIDC27/wfU/E=
X-Google-Smtp-Source: AGHT+IHuI4zKWTEb6TkrbknAaEsF8cipJN49NJJlJohNridbun+I+YAddch1qhkHVrx/4ssrMh95PQ==
X-Received: by 2002:a5d:554e:0:b0:31f:ef77:67ee with SMTP id
 g14-20020a5d554e000000b0031fef7767eemr3495847wrw.40.1694879051264; 
 Sat, 16 Sep 2023 08:44:11 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:39 +0200
Message-Id: <20230916154351.2747233-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879051; x=1695483851; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAH7c/LtvWsREe9J8LiVVH75xm/hDn4r/z1qrYCrB4Q=;
 b=PXiQnxC5BSJFcZrAjBs3gLrmAlolDA/d3E1bLRwLtj93lcjR6bkQ//QC0D3OYRdEu8
 28ZyF00UiX/WpavwY/a7o745rVCF+p9zEO8lNwPcddvnk0Ui4ObBx7Pz7UWatp6eK3xN
 jopDeWSCQGhxZPxzwd/jzO1DWjATZS9PFEXjMayF/4BHtJNNndF1xrxe8NcpNNQQJnWe
 xzk1/OMxpnbUipZ2+J3US8o79JcHMr+snuPMW66MvYE53FNzpR6nxDP1XVeucGTJIXtz
 dI2fbkGrZTCwBWz04h0UCIlzsDBaXWmq+5+HkVWeqsbXG5SO1mXdru+ymK4AAtS74m24
 Poew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PXiQnxC5
Subject: [Buildroot] [PATCH 04/16] package/perl-file-listing: bump to
 version 6.16
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

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/PLICEASE/File-Listing-6.14/diff/PLICEASE/File-Listing-6.16#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-listing/Config.in              | 2 +-
 package/perl-file-listing/perl-file-listing.hash | 8 ++++----
 package/perl-file-listing/perl-file-listing.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
index acca98be2..461061854 100644
--- a/package/perl-file-listing/Config.in
+++ b/package/perl-file-listing/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_FILE_LISTING
 	bool "perl-file-listing"
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	help
-	  parse directory listing.
+	  Parse directory listing.
 
 	  https://metacpan.org/release/File-Listing
diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index cb52c127c..bd2ca473b 100644
--- a/package/perl-file-listing/perl-file-listing.hash
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  8ba34641a6c5a2ec1b0bf7064f68c535  File-Listing-6.15.tar.gz
-sha256  46c4fb9f9eb9635805e26b7ea55b54455e47302758a10ed2a0b92f392713770c  File-Listing-6.15.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  d4fc8b0c86633d1fa5bf75323720eadc  File-Listing-6.16.tar.gz
+sha256  189b3a13fc0a1ba412b9d9ec5901e9e5e444cc746b9f0156d4399370d33655c6  File-Listing-6.16.tar.gz
 
 # computed by scancpan
-sha256  287e6f0fdf2db790a24975b492cde64b210c16af7137f44373cbd03fcf844212  LICENSE
+sha256  330a553de82a111970d17fdf302bfe4af055f61bfe83d1c5617d5c3f5525a226  LICENSE
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index c8584ffa8..583de605a 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_LISTING_VERSION = 6.15
+PERL_FILE_LISTING_VERSION = 6.16
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
