Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380AD44145
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8EA60633;
	Fri, 12 Dec 2025 08:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUWkoXUOOv2J; Fri, 12 Dec 2025 08:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C1F60782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765529668;
	bh=9jwqBr5DYVW2/w5KX+ew6NKbDjLOz0DHL9NiUaZNzA4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IqtTpAIDrtqRnhm8Owz0Vdd73NPypinlpVHTXn6GOy4wZ8G+Czaw1skbAJoj+1vSd
	 o0qXxFlYxrMvGpNiQ1mQY0gGB4zeGYr/5Ge/GrVkAg/CtGpuIPm7KBK7qa1uZ1M/lQ
	 QwtXjex65xck2y9zau6djcjX9LxlXEykklk54VqQu7eCT4paCDBp3H5FKlV9d7AeXT
	 qQEsVGvc7B3dg9+q+Encc44yR4hnj9ngNJGndlD9lTTUb8y08oNvwa0U4BFmw9h8Qo
	 ygYvELS4M0HqNdU3LXQ6JICZ2VIR7oeumxWNs1nuZgXkKpAbUrNHyU0De6g+cI0W+u
	 Nl0pIV41mNc7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C1F60782;
	Fri, 12 Dec 2025 08:54:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 624502C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544C980AC7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTG8g_Z3dD_D for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 08:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35C7B80AAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C7B80AAE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C7B80AAE
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 08:54:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso4577145e9.1
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 00:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529664; x=1766134464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+dTAUFNQItG679stqDfyIq60+nZMCpvbNVNelRrstI=;
 b=Z0Xa8vGPlPVJ1PVSGrXsb7eYydqO2/De+ml/SQpEhhAS8vGIM22lzN38bV49ZpR7UH
 ZVmB807sSL/ftDW1Cp+sToq7AqjWaqnSR7sdXNiCWQv3g2JO5ZGLne3xKFHiKxgFqepZ
 1NUDBfw9SU9jwEl+heFSoPGDuawm+bA66YdlUJ0D8mq+fEHTp88Qz9Oqd1fsCXIsYMwM
 oV/m3nDEJYC4R943WDzPAd5x4uZ08uYB9KfTFBDEvvKll61giUnt8TRxjdvNIcGST7Fa
 42mMRvKLeGO8yQ/rR85T5vx9yQrKyAOb410nQaIPGrK4ukADapXLO2tKByFa1OPF/H8r
 PN7g==
X-Gm-Message-State: AOJu0Yxo9MbwNHkoXEZTKfm/KB3ABIPSKBR4gv6WElnSEW0YxC4eWJqJ
 pocRpM2Bxh9skVIKi63mPaM6+NbgUoJ8h6VCIbhNMpcRH7gYLf7hxwwbc8y0dn6Xw2O+2jWfY+Y
 kmZAgbg==
X-Gm-Gg: AY/fxX41+Tom1XHohymkEtHKLd4pKZ7HjA+ZC/CzsUO3RJG0sj6fqA46o8nXHyAJOVI
 yiDex8cvuC8+lQrvReZFc479Yg88UgscSQNzFg8lOghUBe6DWgWmQHneNpu7H2t+AO0k2R/Nm7r
 6z9hR6WHClC3mAqeIXBrqXJAUCBsfKbnrhPz4LFfyqcEi8BjA9C12crPJZvL5v8MwiGXg2IGtKZ
 qk7DF8VmdIqdUTTiis0yPVKCFtSwfrCENNOqizqD9ifQ4pwbAHnVG1eDiX7IsK7AbOvFsNtZ7eP
 KQwYQY+wGfW/yo5I5+4+97qpDxswi5SoGIVm9xAlDom27kQfQnZSjL5fPhx8vUZ7JS8O1CJ1Vu1
 25eJP/159PydIOONlzrKeJ8Ebjx/I3Ee9f+gRisi1OvihMJo4z/JfeIwdS29yAAHChHaweaObC9
 mw77+P0ztWn18D3GOmGxS0GBmLAxtB6oXcyuc=
X-Google-Smtp-Source: AGHT+IGU+izvk754yAS9h3l1+H5EBeuVfaFB+Zm8YhfjSmHwMV70ikdyiYIjbigkqUwkl44X8JiP0g==
X-Received: by 2002:a05:600c:4f86:b0:46e:4586:57e4 with SMTP id
 5b1f17b1804b1-47a8f9057fdmr12109175e9.24.1765529663816; 
 Fri, 12 Dec 2025 00:54:23 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a09fbesm10493370f8f.0.2025.12.12.00.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:54:23 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 12 Dec 2025 09:54:21 +0100
Message-ID: <20251212085421.76507-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1765529664; x=1766134464; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T+dTAUFNQItG679stqDfyIq60+nZMCpvbNVNelRrstI=;
 b=AIw4C3J1yB2AajVsM6rhNHDZsPAd0CVt2R0dJhfbCRSRCK6Ky6xlL7KHW43tOKNuGe
 X6BDBEtpLD6Iri7PILOcmdHtJ9bv3Gwt2EaYO9DqYQqjSHN8lHHQ8sR9HHBc+rx+cXZG
 /VNJL7bJLHv/BvFCHt8jRzXSGGNcbmKQi+BHGN9zkjt34lcKeZP31QM8OtvH1qeUEm7x
 seTaGrwNgJR0lFCyAZCNrgoqy8Ssp5/9rmODQ11lrajmYRe2Np3THIhWmz4MFfDMMsmh
 4jKRUa4FHRAGgTAGTM2jizYG3Oyj1DZMcAT/t9OcYpJHAe2mREE9axE9DXhixK5g0zoQ
 jYfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=AIw4C3J1
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.42.0
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
