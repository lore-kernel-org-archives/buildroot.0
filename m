Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8520CC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 03:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F87080F54;
	Mon, 27 Nov 2023 03:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F87080F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyrG7Stvq2uZ; Mon, 27 Nov 2023 03:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8180180F21;
	Mon, 27 Nov 2023 03:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8180180F21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 837C31BF319
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 03:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B3D80F21
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 03:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B3D80F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOf4LrPaScII for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 03:26:50 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63A9C80F1E
 for <buildroot@busybox.net>; Mon, 27 Nov 2023 03:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A9C80F1E
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54b450bd014so1025163a12.3
 for <buildroot@busybox.net>; Sun, 26 Nov 2023 19:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701055608; x=1701660408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGBg2T4r68q1fyPPLFlTwwk/AqW04nM34p9nG6ds76o=;
 b=c6bIKAMA2UoWI29CiISL/tHDQz0ZIMH8ewOwQd4olxXLIsiGXk/T3kCU+7bdGRUW3B
 mljRJzgpYGuEcEDYhboaHyesrv90BBFHl+oFPqcJFFaS4IW0qQYYLXKL9e87wrYWqyT9
 +X2WhV2gHFDCVTb40oyL+AHiV0YUFM1vpRJxC5tInvTEsiFqos6gQ67jQyPIoCv4+aOf
 5OxB4RrRN8QttsyM4tz8UrXMX5IQkvNDLIzUViDj7iVDtI6fHqCzegz/JEqlOkb9/X5Z
 6M6OiWmv/MNYziLEUPhsbnAhCHw+EGOpZXxmfi2SczaKPOqjGqv8O83zPeyf2nxOFO97
 aCUQ==
X-Gm-Message-State: AOJu0Yx6iCUkRM/vOw+Qs0GiPUn/WR39sVdYj2RzrYoxRM/wueICNiwX
 7j4fGRJD/BLsmJ/xBz3OL5yDNuVk11E=
X-Google-Smtp-Source: AGHT+IEDC2O6HN8UjZDnrJkvm0mluc8D2Wn6mD7P3BQvsxaXhUl+Wg23cYTUxYRjQXOoZCIoilllKg==
X-Received: by 2002:a50:9e49:0:b0:547:6663:a164 with SMTP id
 z67-20020a509e49000000b005476663a164mr6015537ede.40.1701055608032; 
 Sun, 26 Nov 2023 19:26:48 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 r12-20020aa7cb8c000000b0053deb97e8e6sm4695505edt.28.2023.11.26.19.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 19:26:47 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Nov 2023 04:26:39 +0100
Message-Id: <20231127032639.500851-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701055608; x=1701660408; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGBg2T4r68q1fyPPLFlTwwk/AqW04nM34p9nG6ds76o=;
 b=V2ghFrhQsqITZ6H4FIzxHRx8Ga24pNTNv+JI8PlHpIG7QMZdvGdhIK7GE1btJmQLdf
 EtaZuF98AsgCrTM7zcx+6HbCR8PIVklKbLi8YksHUrjovueEehpv7+Hxk5ceWe1p5hX6
 xz8yBcEMZJgNxq0n7INLxA1joTVFOZGVW01RchPcxMHH7/u+ty+4pJ/O8pIR52njhUqR
 ZJUfIn68eSt/Tbqlmjp5QsQFyqs9Rdyz5Be+xDYSKZZDlsEd58M2hn4/CnpgpwIu8EMU
 32AVa9NziSFC47y7d2o3+/nC5yVHl7TTRpFIqIXxUk/nlX4yBLqmkcVBpKWAaDcQYLFg
 oT7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V2ghFrhQ
Subject: [Buildroot] [PATCH] package/perl: security bump to 5.36.2
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

fix CVE-2023-47038 - Write past buffer end via illegal user-defined Unicode property

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 2165c8c60..667b09221 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.1.tar.xz.{md5,sha1,sha256}.txt
-md5  825f6b1d7e03b22522e0bdb992fbb728  perl-5.36.1.tar.xz
-sha1  7b766266af08a6cef0487308e80b40d5d8069df7  perl-5.36.1.tar.xz
-sha256  bd91217ea8a8c8b81f21ebbb6cefdf0d13ae532013f944cdece2cd51aef4b6a7  perl-5.36.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.2.tar.xz.{md5,sha1,sha256}.txt
+md5  698ae4946b28e38a729916f04cc389a3  perl-5.36.2.tar.xz
+sha1  9bd6e3f7c333e2e5f14c8650333fc29da3df2d90  perl-5.36.2.tar.xz
+sha256  19445f09ea9f6ada33297010d5b76ac46be565568d1a4377a6bc736cd795a128  perl-5.36.2.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4.1/perl-cross-1.4.1.hash
-sha256  3e14bb4f28c83586c668c5f9f6b4e57b138b4ec2fae0271086e29d4e352670ca  perl-cross-1.4.1.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.1/perl-cross-1.5.1.hash
+sha256  35d859b49bab274021d8a61511fd39a70a58cb727223de5b54342898155cf5e0  perl-cross-1.5.1.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 734e8efec..735adea01 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.4.1
+PERL_CROSS_VERSION = 1.5.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
