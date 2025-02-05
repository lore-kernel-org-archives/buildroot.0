Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88432C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 07:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1339E82099;
	Wed,  5 Feb 2025 07:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0g7BPTdU5tA; Wed,  5 Feb 2025 07:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E24382B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E24382B51;
	Wed,  5 Feb 2025 07:46:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEF1E12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 07:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA69B82099
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 07:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_ySGY3D6l0l for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 07:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E91982B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E91982B51
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E91982B51
 for <buildroot@busybox.net>; Wed,  5 Feb 2025 07:46:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so44077415e9.1
 for <buildroot@busybox.net>; Tue, 04 Feb 2025 23:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738741580; x=1739346380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zk/H6uuz34IYaFTfUPvWDyRCFHh0M81OHhmNtcIGSjU=;
 b=P8qs6RltkAg8gHk6RkziDvfXi+rhxPwvzPPCNe5Bk3WUrMj5doZAEQbiXVhH+4bR+M
 yK3al+F3ZKw7TlfPUXZeiJ1n56YqmSjkmZY4lD5Mj0yN+BMb+JgsNKpWnqab5vsTOdlc
 rWQBDGiFFkOP5ScatKMnRzp2jVZgyI3vCfpKdXD6Lj9gAOdJ1b6aYroFtADwqoUA9hIn
 +iZNB3ryzK/eO+JbyXvXPK1uHdJdME7hZcuD7h9yD0gShIZBE3y9jQuKNi8MVzel2o5m
 BvM8jSnAGpRNt0ycwlqNlW0E8y5XEXc+ninaR6PDILTzrJGhNNdUF5DO8kG919i4hDNN
 m07g==
X-Gm-Message-State: AOJu0YwRwjLMMHFPCgztIwwblybnGKsnOPqo7//HGUeRkAzoFoBiOcJe
 71U7ytQS7Ox//LT3M2nL49GSkAmaWoQXRAqTSknIy9zyxXuyDYjNPXRWhl34OAoEAA/pv+vbb9H
 7QQ==
X-Gm-Gg: ASbGncso8zT1EhEYLdENSir0L0GNXnzPP9zV3/IV5UIlqXvBwtMI4xB87+HXxXMRBNj
 Y/6hVkkv9guxUv1JlaDHMlGkq73wXs4JGCKctpxcPVUqf2gDWfasN/D6qoaP/vI6ieyrnL1e9tS
 A8w1gVyKWfn9Owm/CLMYxEQbgGTPE8zM+YIKVDKRHUOyCIqWAZ7nL6AXOBgTS1L7V96uejvB19m
 o5Vo8+mTCBA2KY+nLjm8xOdzS9cklPBF6QwyEoogXLlQyEzpbNgUg0+qT6/YxOpN23qqDWqA88C
 GviOrAmyzEWLShuZMis7WiztB1v0U1TQhdBuI4QTFKG8YvhoHg==
X-Google-Smtp-Source: AGHT+IGkFh6vbumdEFQn0aBiaHupm6LRu/ZQ+wbKLAfvTk1izQjIAjjiO/iELeJ2cfqQpAe6wQsu1w==
X-Received: by 2002:a05:600c:4452:b0:434:f82b:c5e6 with SMTP id
 5b1f17b1804b1-4390d42cd07mr8571175e9.1.1738741580051; 
 Tue, 04 Feb 2025 23:46:20 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38db6d7fb3dsm577369f8f.72.2025.02.04.23.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 23:46:19 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  5 Feb 2025 08:46:15 +0100
Message-ID: <20250205074616.3285104-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1738741580; x=1739346380; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zk/H6uuz34IYaFTfUPvWDyRCFHh0M81OHhmNtcIGSjU=;
 b=YlYhOlZXtQDEwYCN3BuOLjd7kWh/TmGDmNfxE4jU1Zp0gpcrIoVQNJDU9EzpYrFsmG
 nFNs2btgkOd2yw2AKFYOAwobUfGYNvlNm2SePtgE9MVkTvmRUS41EQQsPyST3JkFHafg
 WZsaVGcbwW5F+asKfSAXDLWAXSYzwLS/HrnAJdBB1nslSEfpr46hYrSt3QRnoNk9xkLu
 4xtg+2GuPKm42ZR9Xf/8a3pq7HTcpzIqiQ+o1vz+IRrHpR2rKx4DxGQ8vR15otM07R+Q
 T1JaYk6fW/BAc/F9r0dF43OlffOr9RGXdMy7dRF9AjTV48YI09eOr2nHr4GCmCRQhCgO
 aNEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=YlYhOlZX
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.40.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff README:
    -Perl is Copyright (C) 1993 - 2024 by Larry Wall and others.
    +Perl is Copyright (C) 1993 - 2025 by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index aba284403..04ebf83b3 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.0.tar.xz.{md5,sha1,sha256}.txt
-md5  cfe14ef0709b9687f9c514042e8e1e82  perl-5.40.0.tar.xz
-sha1  4a3af1f62afc611aa1552adc6c7ec389e9723bce  perl-5.40.0.tar.xz
-sha256  d5325300ad267624cb0b7d512cfdfcd74fa7fe00c455c5b51a6bd53e5e199ef9  perl-5.40.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.1.tar.xz.{md5,sha1,sha256}.txt
+md5  bab3547a5cdf2302ee0396419d74a42e  perl-5.40.1.tar.xz
+sha1  4ffe5246c791df884363aed05ba81ba41cb02084  perl-5.40.1.tar.xz
+sha256  dfa20c2eef2b4af133525610bbb65dd13777ecf998c9c5b1ccf0d308e732ee3f  perl-5.40.1.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6/perl-cross-1.6.hash
-sha256  5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69  perl-cross-1.6.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.1/perl-cross-1.6.1.hash
+sha256  b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f  perl-cross-1.6.1.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  05fcf86432bd78754c7e325d4be44a5968344c01cc08c004b685172ea508ec23  README
+sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0f7038a04..878c5d9ab 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6
+PERL_CROSS_VERSION = 1.6.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
