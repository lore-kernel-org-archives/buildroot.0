Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1513CE7A8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BF341AA5;
	Sat, 23 Sep 2023 07:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BF341AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CkLBKIuKaUu; Sat, 23 Sep 2023 07:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9228A41AB3;
	Sat, 23 Sep 2023 07:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9228A41AB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE901BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EC01820C3
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC01820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5I3UEMXCSMC for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:52 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BE3582141
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BE3582141
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32001d16a14so3159231f8f.1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453710; x=1696058510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPVRvXZS26us+bMaKk0YEoFNTgvcXNN/q4OCSI1qn84=;
 b=k8fSAw9TTVEyPbrTGaCeOrB8NW8O5A2J9Swwe8MoDjFPE+KLw+Sb51c8OMUzwCjrpG
 eMto5Jg8orLFaTAmqiCiSTCVmerrE/hdjgM7MQkO1edB1z3tjEFtygZFqJGWt0PoG6I2
 RihVyaDf1R+cnKsltJe1ul+dtHKtgERLTM0eJsLYHPkSNXDyw+MVpbL8FmyrFEcvWGh9
 LVNTSgGCY+V4tFuLvvCqoJVd88I1nVD4WM8uD6PZ0J5knBBEffUOcEp17e621DL/gEMq
 s1GrkmSKEinGLIAN+DCeW10Gv9yFu3d2o2yRtfB/bKzbegEraf6mOgRjoDbxpDLVwWbv
 EI7A==
X-Gm-Message-State: AOJu0YzXJh3hm4A5bPkfTfcB6bGwP1mtfjailzqgLberxmk95+Fl7Nks
 +4vcCqBhaeKwwMBZyx+2hJ2Wk6mFBGs=
X-Google-Smtp-Source: AGHT+IGovtYvtNghSxNw5avzcHoFps6SkEjz5WNRNei5A8F9LiMdYzj5WqVEFltmLuQlBgoajtsJyw==
X-Received: by 2002:adf:ef83:0:b0:321:f74d:ade6 with SMTP id
 d3-20020adfef83000000b00321f74dade6mr1447236wro.40.1695453710098; 
 Sat, 23 Sep 2023 00:21:50 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:24 +0200
Message-Id: <20230923072133.3122644-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453710; x=1696058510; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPVRvXZS26us+bMaKk0YEoFNTgvcXNN/q4OCSI1qn84=;
 b=WwGjdRdwWjlynQCST2vC+lHkaL7teeq+inudFhJxvt4s1sqLwdjZGt1az6vUSg7zCA
 0zY6gy6Q+cfqiIWqWROdBXeaB0q5Nhqz8Bv91XmHHvnWgHW0i+RBJfQdpwFunZRl58fx
 krN+V0BIkJ/eSNmHop1iG8MzoBwh0pgtHkkA/iU65ZhHV9q7LQj64X1X3nVE2HeinMr/
 vjjjVEOrwgWpSxpGUXwD2Xbj8at4VyeLX/OVSKvy+nVCEH3R9qX7b4hzk0LxfafwGZve
 JqIOCSklv0rhhHiE/yDBzsSZiiQ9/mDTC9gkRUgQJNKEoq7rkSbX9uV++Sp5OBxpuXUp
 ZLXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WwGjdRdw
Subject: [Buildroot] [PATCH v2 03/12] package/perl-file-listing: bump to
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
see https://metacpan.org/release/PLICEASE/File-Listing-6.16/diff/PLICEASE/File-Listing-6.14#LICENSE

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
