Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A669C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF9340881;
	Tue, 15 Apr 2025 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzRv58gLTvXA; Tue, 15 Apr 2025 09:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 045294071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045294071B;
	Tue, 15 Apr 2025 09:06:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDF6D108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D36188209F
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxiKdDNlOybg for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 09:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 938F481FC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 938F481FC3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 938F481FC3
 for <buildroot@busybox.net>; Tue, 15 Apr 2025 09:06:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so42859325e9.2
 for <buildroot@busybox.net>; Tue, 15 Apr 2025 02:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744708008; x=1745312808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5VMquGILds2ss5QDAD/iGtt8pku7kyN++SrZoWttEog=;
 b=UC2lbFi5/Qb5Z4N3bngcdyYa5mOnRsMXNO6Iv8rAVGuRSLyPi8Nj1IEQbh/vilLl12
 X8RQYiz+VKd9VUnIULa8jF3aqXtHeQWCh5uWzVjFsClwcbYO5INI9eBusZCyVnGxp/PA
 nhWEcvWwFCarHFRzENVQMM6VGI9H0g5YhIlPc93D96E1doLVbMnN4UVS3gsHDD2EmC2d
 lGGIkIGCzgV1F3TdA4AwhNqqeGREdxBXYceriJOMFOx+U9FHJe7v0PA/NgNQ9SsRvvdI
 WdPNY336rEH8s8b6GETB3XBUppTFW6Ttj8rHqxz+Vmak0ilgCeiyRPXx/2gBIhn97BF+
 UYWA==
X-Gm-Message-State: AOJu0YzTzTed9wd92h83xEHZSSGN7K8s3hPlpdsIiGm1+YrhnGA+lAyt
 +eQxc2K9feWIETWSUd5EsT6LaBiwLCNub9D6dIOCbMJzbtV990y0yWDta1AGThhICG+J5tWUJLp
 Oow==
X-Gm-Gg: ASbGncvTC1P/FfsUXKFI1RBRo8wVGZk31TPac90fYt8ApsACs3vrXabXtu7GTG73quL
 SPYAZa79Un+gwAUG42M6AaLmY4a7DMeujJquWJZpukZHEn/vXsHR3NUQ7JhosVwgpicYGXVojba
 5kJlMx23MvnxAECBgYfc2OiyRg61UHuAlEEj7LBQCZ4ksu5c7x54QjzAQ5ZVBdUAi0FIaW1Fo9O
 9YQQzhbOTM3b8BW5a6hwCGaqBOQoIlfUCAICPEZDtsjK1yLXVQRz9H8M55yV+Jza5OPZyI2MNAJ
 6EMx2gubknk2X/G5p1h62CqjapCxEyuR1N8F+21kmpEBlW0si0rEf1Z9KHGoplay5cV1hPK4lej
 w0w==
X-Google-Smtp-Source: AGHT+IElHATZnfE4ojubqiotagTcZtg909uJDkjMlroSaoz9rgrLwj7cs6dOeUUPdqr7adlCLuqglA==
X-Received: by 2002:a05:600c:1c8e:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-43f3a95dc30mr131902705e9.15.1744708008463; 
 Tue, 15 Apr 2025 02:06:48 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc78sm206352445e9.27.2025.04.15.02.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:06:48 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue, 15 Apr 2025 11:06:37 +0200
Message-ID: <20250415090638.319859-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1744708008; x=1745312808; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5VMquGILds2ss5QDAD/iGtt8pku7kyN++SrZoWttEog=;
 b=KiglWxGYltBaLRrslFnXEmkbwtxRqECn8NZweDiVFlmW3n+T/wllomeHLAOPYr1sNp
 95OZxoQnvfhOsksGdLirBigJSidlJS/ZqPnKoCaAMOqJok9SWG2rOQqwGNMHiYQV7wMa
 xBnYT1dtMvYMqEkJ9KUmvLiE6IfcatkK0zuKbg/sTOTRSPMD+TkFY67qPfO21hggIrjl
 tgf/0DeAmUm/LHGFQt0800JBzdd7ke8jrQgpd0ybgI/ru/rPpQFzvzoBXDD/Qiz/SKAj
 ZOR4BmsSVLHg4S4cYv7Yz3TLKZecrUu33OOUfujviGNQ6VEWWj+nNOW3+GNNpaKCvlCf
 n0Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=KiglWxGY
Subject: [Buildroot] [PATCH] package/perl: security bump to version 5.40.2
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

fix CVE-2024-56406: A heap buffer overflow vulnerability

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 04ebf83b3..308f58605 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.1.tar.xz.{md5,sha1,sha256}.txt
-md5  bab3547a5cdf2302ee0396419d74a42e  perl-5.40.1.tar.xz
-sha1  4ffe5246c791df884363aed05ba81ba41cb02084  perl-5.40.1.tar.xz
-sha256  dfa20c2eef2b4af133525610bbb65dd13777ecf998c9c5b1ccf0d308e732ee3f  perl-5.40.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
+md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
+sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
+sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.1/perl-cross-1.6.1.hash
-sha256  b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f  perl-cross-1.6.1.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
+sha256	131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 37b9fe185..34abb734d 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6.1
+PERL_CROSS_VERSION = 1.6.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
