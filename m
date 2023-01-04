Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BF4C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 09:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2B8640AA9;
	Wed,  4 Jan 2023 09:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B8640AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJoklyeujyWj; Wed,  4 Jan 2023 09:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A09440AA4;
	Wed,  4 Jan 2023 09:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A09440AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 019181BF31D
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 09:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D105E80BA0
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 09:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D105E80BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxDuotsM1cEb for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 09:03:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE821808A2
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE821808A2
 for <buildroot@busybox.net>; Wed,  4 Jan 2023 09:03:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso25912478wmp.3
 for <buildroot@busybox.net>; Wed, 04 Jan 2023 01:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XLOnzw9GQnanNkcyNz3m0RDdH6Dm0zWC4WpEmjkYRp0=;
 b=w9AMQuvfETAAFyGaPhh1ZjaVRvu1pg10oJtmBLQY+AyP1LIGSTHXW2AMpUejHpZmhu
 CL6FonScIEuFYbMaTDsrZjGBx7Fz0BSRnl90EayHFohkmuanXGRZpqgSZRHLyT5jzrP6
 AQcXzBO1R5dyr76OFjCXO43aZCs7u4ns1SBfeFXsRTdt5KzueiKU7YqeLugGJsL9Gdvs
 09Mg/DwsTzf9VBhZvbSOOsagNPtUt8MG1CsFqWvfqhmgbSGEIhyrUa+v1ED4icijRfvD
 FOmaM4PdIkZ7DKJWm2aHqwFteW/PW1LHCvuTwFruHmaQaQkkQhjpSeYsmlYPrGWY3vV+
 UVJw==
X-Gm-Message-State: AFqh2koCxDb8HCs0BNXpKpFXKwhgUCgmvQFBXMwM9QR6PzntDVxaggnr
 n5C2QxASUbcWRg01nVqRPZRjTIV3RsQ=
X-Google-Smtp-Source: AMrXdXvNWFziPSN4UVLMskOKR7Fz5r3hUHjT7tW5Qqg14e5ExpvSvIfjLxbScDFp1t29PZpFQPTF0Q==
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id
 p17-20020a05600c419100b003d1fccace24mr32176695wmh.32.1672823012891; 
 Wed, 04 Jan 2023 01:03:32 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05600c4f8100b003d96b8e9bcasm48848862wmq.32.2023.01.04.01.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 01:03:32 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  4 Jan 2023 10:03:17 +0100
Message-Id: <20230104090317.1912926-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XLOnzw9GQnanNkcyNz3m0RDdH6Dm0zWC4WpEmjkYRp0=;
 b=IzJJ9kuNX2J2RKGU3Xg7APMUbN7oYZQPjK4smzDySp4nb4mOt/tAft8bcfzlsmFu22
 8/+ovuVeSrTSfO3k8fPKJb7Zbi0OgaB50qMQL5IElzFFYOsda19YZFYSHSYLr1Y6Z4RS
 FLltkTd/hV/96pi9Qf03HkF6AeGGXC2wfZRwT9sIVjQeqcMP8yZfci/YPamRPYoP1/Ep
 b97da2UhTBR64lpT9N2YcrIZNtu/AhzCBy013JK7NR/kBItWJGYQY800BKIt/CbdBXxv
 0x1FdFjCjfxD/ZDqM3WehJeaT6an/cGyl8ph0Ogo0O5zdxjcStuBGi1Kel0qpwFYttM5
 1Npw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IzJJ9kuN
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.36.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 4 ++--
 utils/scancpan         | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 9ec2b42e3..b21023f73 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.1.tar.xz.{md5,sha1,sha256}.txt
-md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
-sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
-sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.0.tar.xz.{md5,sha1,sha256}.txt
+md5  826e42da130011699172fd655e49cfa2  perl-5.36.0.tar.xz
+sha1  938c56a77ae094eb7f5019318a5e4efb2d9c74fa  perl-5.36.0.tar.xz
+sha256  0f386dccbee8e26286404b2cca144e1005be65477979beb9b1ba272d4819bcf0  perl-5.36.0.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
 sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 27acfaeff..9be00e1b2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 34
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION_MAJOR = 36
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
diff --git a/utils/scancpan b/utils/scancpan
index 48f8bd83b..e7739a8ad 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.034 should be aligned with the version of perl actually
+# Below, 5.036 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.034;
+die <<"MSG" if $] < 5.036;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.34.0
+    perlbrew install perl-5.36.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -967,7 +967,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2020 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2023 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
