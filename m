Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC270CFA449
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5112E40538;
	Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsJhZ9XeBabt; Wed, 23 Oct 2024 16:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0183140637
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0183140637;
	Wed, 23 Oct 2024 16:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5750D59B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4510F810ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0eRKvrvSStP for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B3C0810EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3C0810EA
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B3C0810EA
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso5500952f8f.1
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699223; x=1730304023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j/H1H4Pr6PWT9lYlgeeTJFoJNaKCwE2VFPj2K6d4Ep0=;
 b=npwGQaAYZUZlaBJiRp7RCppc5HM02ILB5KO1XrEMvNmG/1bovXLi31pfniCh8iJTIE
 1JBTU5xUrWvcRSCSJJiH8AcLeSsp3damqJ80NhfTmsWHekNg7rWuoj+iU2z0CMMkXdq9
 2fHPO5NJQSxCeKI1jFTHBUJdFCn5Q3v4I6yCx8+BQBixSPpDvUZ1fsICibEtvz+YKyqE
 FRZndtFguC7OsYFvdt51vDcsni7lad1+A+rzle2Qkf+QeuBOvCZwMLnPWWBO/pHvIhoM
 hmGMbdhHDqgqV92Qv+mu0UznfLIpDEmDKZimZRDrSbugJ2cI2SjvMEnxUWZo6Lb8oo7t
 UHpA==
X-Gm-Message-State: AOJu0Ywu2rwEcXXi4ap/SYs2I0PzRCVeUgu6o/uIiiACu/g8BBMKm7a6
 xBeN7PJF9QnAwnxklwxI6KPI0aI5zIR+DF32rrbWHc/V7sfxdX7l2RJQc9/Dmrv9Tv1Adn6kDF9
 Yrw==
X-Google-Smtp-Source: AGHT+IH2sMJBjt4KhyojCP5nob8Eo1MfTlELNs1aRqj7EBO59VE/1W0gniq5+9SZQiEeBIDv+5AF7w==
X-Received: by 2002:a5d:6803:0:b0:37d:518f:995d with SMTP id
 ffacd0b85a97d-37efcf8bebemr1888229f8f.56.1729699222720; 
 Wed, 23 Oct 2024 09:00:22 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:22 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:08 +0200
Message-ID: <20241023160014.568872-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699223; x=1730304023; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j/H1H4Pr6PWT9lYlgeeTJFoJNaKCwE2VFPj2K6d4Ep0=;
 b=DOQIJQp/9glAajAmxMMLMqih5EjKfh64pZbcjtld6ykFqL/4HxtZXri5HlUYCxihgj
 hn6kE8rjgz5XVRTrWYLaGgG0ZJlDe0Tml8MHVw5Oc+04/8nIznjBoyi7+ECtnnsQd+BU
 JSUM7mwiKbFphYIklhAvPmkR87Stfy9v3L/sqB5CKDIpWgdgxxRYwbg0Re51PNtIOw4c
 UV2usU2FdfLH2ZUjr/VlUOpuIHSEN+FkE8u8bpfP7+W1wJ8hQKJs+LwnfjetPF83JzW8
 UWsJePigwt9LlAdU+Jrut7ILnRvm7yT7+loQg659Dv2rCaFiqkT3NU0wSrOVdA8wATh3
 AddQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=DOQIJQp/
Subject: [Buildroot] [PATCH 1/7] package/perl-digest-hmac: bump to version
 1.05
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

diff LICENSE: use "The Perl Artistic License 1.0" and update millesime
    see https://metacpan.org/release/ARODLAND/Digest-HMAC-1.05/diff/ARODLAND/Digest-HMAC-1.04#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-digest-hmac/perl-digest-hmac.hash | 8 ++++----
 package/perl-digest-hmac/perl-digest-hmac.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-digest-hmac/perl-digest-hmac.hash b/package/perl-digest-hmac/perl-digest-hmac.hash
index 5e7da14f3..4a4b8e5f0 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.hash
+++ b/package/perl-digest-hmac/perl-digest-hmac.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  746a5edffd1485d7500e005730c271c8  Digest-HMAC-1.04.tar.gz
-sha256  d6bc8156aa275c44d794b7c18f44cdac4a58140245c959e6b19b2c3838b08ed4  Digest-HMAC-1.04.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cbeca4ad4c21c241080cd6ee47bdca6e  Digest-HMAC-1.05.tar.gz
+sha256  215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a  Digest-HMAC-1.05.tar.gz
 
 # computed by scancpan
-sha256  cb9ff694d1769f450dd5c400204aa921d2fb3db90fcb21674a39f3725c4255c1  LICENSE
+sha256  c10e8c1b7e9e524e361cc87244c74e3abeae5652f246bcc050327f53ba85cba1  LICENSE
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index bc080703d..0fa4adf77 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DIGEST_HMAC_VERSION = 1.04
+PERL_DIGEST_HMAC_VERSION = 1.05
 PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
 PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARODLAND
 PERL_DIGEST_HMAC_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
