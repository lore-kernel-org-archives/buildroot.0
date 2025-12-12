Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE86D44149
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1F9580EA5;
	Fri, 12 Dec 2025 08:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rfCAr3AVwPW; Fri, 12 Dec 2025 08:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED5780F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765529395;
	bh=9jwqBr5DYVW2/w5KX+ew6NKbDjLOz0DHL9NiUaZNzA4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gxqkj8XtBSOFPl8q0xfXbMXBegY9x0Rf7qBpTRr55gUlWt7c7LmAb1c/2SWj31//q
	 GX3U6zlWtSTiNze3VXIefEuBvDn16ldHJKSK8jGum+sPD71hJOTurdg5UHG3GdO00Q
	 G0R6uODWUb0LrDLkDvUeZNzd/VkFZ1sAoiYazho2S3GU9Zk15+Hz98YlIUhjToKE5N
	 YZGxQPIpVqvIK2QkhEwJD9Id1lgEbIwljpYnEKo6ngwnfqKsxBpEqjqssHfb/lFzqm
	 lAjlDq6UWcD7y3oEd32SK3CkllKDZfsaOVzlA8MsEX0Aq/+3wMrrh4+4g5p2S7POVI
	 mrG3OFz4GsqCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED5780F2C;
	Fri, 12 Dec 2025 08:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 809952C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6735680F2C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaX-Sg-jmDrs for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 08:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1068480EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1068480EA5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1068480EA5
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 08:49:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so447445f8f.1
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 00:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529390; x=1766134190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+dTAUFNQItG679stqDfyIq60+nZMCpvbNVNelRrstI=;
 b=pBJS5iWQ+x6ysvlOwm9YH50/vZHch0GLdJNkfoOgxRwwJl9YnikQ8JmiLpirbSwBjA
 QvhFv6FttjjdptmR3Ursux/ZKK4q2n+KOw+6LoYt2DFMlnbIkSEhLmm8CnGyprFH7m7i
 zMXv8ynM8QzC72x175OFKItWvsfFKHDzp+G2Fln+sYpN4p1NrKIFsGbHIpjoOyXkLLNR
 IpJoFIRXvwg+CzVg42Wwl2dXardguJC0OGvtzLKjbFnwJudoC4+rbw4auaBqWJD9UFu1
 7f96pIt94kzpeeRjFfVJbqhHoABvSMIpxbqT+rIxB94hWIAzCqm5vwjThVbCUqm6K81z
 DUmQ==
X-Gm-Message-State: AOJu0YyW2uTD2R4fkK+wcuF44ZjptjNGHezNrpu0wAWk5UrVVFYCG7rC
 v/ZnSkRTY6eMKacc6l2T12rg0BcdBE+U0B4e6FxYKa8LtiCXWC5/A/0SSIUgbDZEJ+62KyT2JbZ
 NtZBO+A==
X-Gm-Gg: AY/fxX6fwLXpZiVBccKvgPh/j+yRETgY4VdbDEFQCJf3XpOgCqZhObMReHKGn+5f/bI
 SYPz5iaPybRT+xH2vjzceBiiwHScgHUhhbgyE6iY6ae1DCZi3sYqJtdEa5WkuyAZS3VSxs/ZEq7
 XjZ0oxic1Rh3++++1ZzFQbmPSqoEFLqgz0yTzuwL/sKll02Z7bTpCYcGz3CXwSCOSy3fRTwec26
 LzuntcKrnhD0ZO8lYVnTlLdjTLueOSKdt2F2ce2PVKrM8LQO5K4GXQ4phDX3ajE/uuf/pXKY64J
 PECI6HGxBaC7ReSWjDoyMszrAOgYTMvlw+2P9OY5YQPvA+IqyHtV6cGBfqjdG6AApLjp8zJ2tpN
 +opKxYa6UYdwhwM/Al0hfAiXzvOgi3pkI4/m3qKw3GWHFlCWhveCozHNxU1h63hy+CIFVs48P+y
 bAOUkDlpjFs7h2XonFbgUtGxJzdMyUWFF4PXE=
X-Google-Smtp-Source: AGHT+IFtkhgxXHoQ8VFqWXaSzFhRW3xUj4dtkit+T2BdtRvvLLvm1OjIIqFvhNEALbuTOW+fUCer3Q==
X-Received: by 2002:a05:6000:2c09:b0:42b:5406:f289 with SMTP id
 ffacd0b85a97d-42fb44a24f0mr1194403f8f.3.1765529389776; 
 Fri, 12 Dec 2025 00:49:49 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a7044csm11706726f8f.15.2025.12.12.00.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:49:49 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 12 Dec 2025 09:49:47 +0100
Message-ID: <20251212084947.76236-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1765529390; x=1766134190; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T+dTAUFNQItG679stqDfyIq60+nZMCpvbNVNelRrstI=;
 b=ePki1cNp6+9nJOyqmUctovl4HDQnFRtSQP1nRjWrX/hC/x/1FdzqYsAbGnSq49KbWB
 +yPJfg2LZxPi2yhu39tkh2wLHqcn9s9l2PItvFW6knosQZ4jPfs1jvNmT1o10DI5sLWZ
 6Ltd2D4/jDymH8oRDB4SdnDPqkOMlUKGRldciE9YZtQRLp7wmh4ErqP19HP1TZQmwFEv
 1A6zA5c65levulaWcnae2rO+9XpAJ3axqgVpbA6f5VkgBt3Jv0dKy0ziT8KSgK0UNxXB
 /6hQIFvkEhg1jt0KgZLKm4qRTLZQm2SEKtgLNBbpJWkzXS9zorxfrAt2jUFnswvYUuv9
 gHCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ePki1cNp
Subject: [Buildroot] [PATCH] perl: bump to version 5.42.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/Config.in |  2 +-
 package/perl/perl.hash | 16 ++++++++--------
 package/perl/perl.mk   |  6 +++---
 utils/scancpan         |  8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 0ead1c4a4..6c9bf1e0d 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PERL
 	  An interpreted scripting language, known among some as
 	  "Unix's Swiss Army Chainsaw".
 
-	  http://www.perl.org/
+	  https://www.perl.org/
 
 if BR2_PACKAGE_PERL
 
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d581054bb..991bb41f1 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
-md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
-sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
-sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.0.tar.xz.{md5,sha1,sha256}.txt
+md5  7a6950a9f12d01eb96a9d2ed2f4e0072  perl-5.42.0.tar.xz
+sha1  3b557f28dcb412b115d9628c37fc94b2fda08384  perl-5.42.0.tar.xz
+sha256  73cf6cc1ea2b2b1c110a18c14bbbc73a362073003893ffcedc26d22ebdbdd0c3  perl-5.42.0.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
-sha256  131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
+sha256	cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
-sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
+sha256  8979e6dd61852041643c5c5c40ea63b2bd1b438a67d114e62cbaef808c514315  Copying
+sha256  189e9d6ac7743ed4e832f14c9edb6f782c92d8868b447fa2684f7fe5a81465c1  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 34abb734d..c31a368b7 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 42
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6.2
+PERL_CROSS_VERSION = 1.6.3
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
diff --git a/utils/scancpan b/utils/scancpan
index e7739a8ad..276c79b4e 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.036 should be aligned with the version of perl actually
+# Below, 5.042 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.036;
+die <<"MSG" if $] < 5.042;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.36.0
+    perlbrew install perl-5.42.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -967,7 +967,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2023 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2025 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
