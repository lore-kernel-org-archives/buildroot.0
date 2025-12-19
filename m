Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088A7D7495D
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 06:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA54540D5A;
	Fri, 19 Dec 2025 06:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDZHIzF8G_wv; Fri, 19 Dec 2025 06:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8E9B412C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766126735;
	bh=Gy9rNymltaJXJR4uHItfJDaoPh/huMFbrYeLXW6387w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZEvegK7iJnq/NRHF7Tx6HeAMf/WIWNUnAR2gMgYoYOHSVp5/p6DTIt6UEQe0LBsRL
	 1ubbscZD3oqQ2Eh5F9Q+rw0QGVfnNnywDZVxcB9ltQMkRl5FExnIbxBXCDZWp/F2WV
	 iS/rYkFS19ywo84h7FVgrqQiYA8zjn+q4hdupOrZjj+3UeOt1OGs4JwvbSXenZw5W3
	 kNPAvz7WBMq+qkIrmboAXigKJs5rSDZfVyTM34gPIaKE5x92ABckpZ0GjgbH9T3M7/
	 R/WcaMo528XxU9CfgsDH4lKZqiaRhApaPYTZgg42/GJfNMpH9ubGsMmzxd73/VUKAc
	 zFhh947ukAdPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8E9B412C7;
	Fri, 19 Dec 2025 06:45:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB878119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 06:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD09F83ECF
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 06:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMZTZoCTxi3s for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 06:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 696A083ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 696A083ECE
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 696A083ECE
 for <buildroot@busybox.net>; Fri, 19 Dec 2025 06:45:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so9390485e9.3
 for <buildroot@busybox.net>; Thu, 18 Dec 2025 22:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766126731; x=1766731531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21ZH5YGbk2ES0nU63s4VO8bi4fMQLPYsnNtBlDOSuJk=;
 b=tFNI1ay6Po7wh/ZILKUVTFqr9sEPlhr1PXKrL1X+Qz7qFbcJK5Wcgj3gBg4Xa282d7
 a0JC1CCnvMvZ5/kYPlII6r0BDqeOMohNmWgJmXkcFVbUA3uJTiufMdMkZjc7ZncSXe8s
 E7N3cwLvuWXieAxC8NTrpFIJYE4+wpePg7dOAh666eVAdzMdu/1Hvsa1C0MDdRr9JIkR
 5yB/w8XNSmJ/P3S1bJMzr37+2q5T/mD3gUEmNS83qb82SFY6Nmmbq1ZUH2PRCe+ZROlI
 6yDIRSR/kGtMx0b9TYTj7f3dMrPiNvgNpJHiTOt0+Wvu/9h64SVlECDmIYp+4XuSkpud
 NMXg==
X-Gm-Message-State: AOJu0Yy18duAHV5dQsm7BCctz+IS3DNy0LRzbvU2N+yTgKpCULFEVgFt
 +usT8VgUppWiUynQS5VNYpvSKNdm9HNhV/6YEKwccSVOtq8h6iUi04whtM5cukx9zuYQNoP5ont
 G/YkZZQ==
X-Gm-Gg: AY/fxX53cvH0Nw7/EXAX1gDBP0oS/6aLfR8Yqcx2vawtNXchxCOj7sjz+TRFPebgje3
 bJXXBH5WJYbszgvMdmbYxKG4Dw/U4nd+zn/hOTNzvLLCnn4eVepsmRWp+1r3LF3HpkfXHpvbF8e
 RK8i2+d/aOa5M5UTjPZPuFKGNBeQjxoU5+QHxvUftXvoAs+wtGR53RRMkVsABrx/NM4ZFWvCCUN
 vAPSSLTKkvVEYUdf1mABI3hn6Yw8Rb9lcbfuXqL2dCOdHg6IdVy8rdbrLzVyq7QFuRrioKz7aRv
 26vQ8RmGIdXluX02fVHanGGFPxOMuRASUyap/IQyFViiE0G9khe6ezTbXdyjAFOmCskRyYWrUYy
 KPwHbFMRLlf2LVI9NprX2YcQitfYIwn6jzAXOZ7+eRrC+o+lQt+PAFqkEGzt77fqVNgGzdx8k/j
 T+xf0Hs0p/p8n13ybwdK01ItHETI8xp4OgUWk=
X-Google-Smtp-Source: AGHT+IESNeoIeAMCr00I4HKrfZFwC82a3BLJ+i2hJEr43E6gNMnhYyVvCFhXufmCUo1YfYpOC5NG0w==
X-Received: by 2002:a05:600c:4e90:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-47d19593896mr14781765e9.28.1766126730499; 
 Thu, 18 Dec 2025 22:45:30 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm28680105e9.4.2025.12.18.22.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 22:45:30 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 19 Dec 2025 07:45:22 +0100
Message-ID: <20251219064523.317601-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766126731; x=1766731531; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=21ZH5YGbk2ES0nU63s4VO8bi4fMQLPYsnNtBlDOSuJk=;
 b=aQV9KZNjt3xgkQfhkPYckPa2oMegS1hgCWF6ISGgyXsv+GoBuIkGMBomyXYGdvVwxF
 Hf0iE9xyY0v4q2exE44C+0qunvWNRvzqq7YqedWXQtiaMgtavoW8yZsOjNNwiuJTVPg3
 7cBilmtFAxjbu4K9keGlnxC4SBDExeyEtyqLuF9xiN9Ao/PnYwX2rhUw6nXejOuNA3pq
 zQUUYK2OmM33QNj8JY8ONkl81/QNT0L4ZnKqK3iFn75JvQMr8Fo9lKt/+3/5pJWyOH4V
 nXmhAxQc3rMxYzZlBasz2rZPkQ7WfY+pIY7TxX4yel9oRFeoDVKaw3IMNDVSrORy1Vic
 tslg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=aQV9KZNj
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
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  5 ++---
 utils/scancpan         |  8 ++++----
 4 files changed, 13 insertions(+), 14 deletions(-)

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
index 0035c448c..3aefdd05b 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
-md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
-sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
-sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.0.tar.xz.{md5,sha1,sha256}.txt
+md5  7a6950a9f12d01eb96a9d2ed2f4e0072  perl-5.42.0.tar.xz
+sha1  3b557f28dcb412b115d9628c37fc94b2fda08384  perl-5.42.0.tar.xz
+sha256  73cf6cc1ea2b2b1c110a18c14bbbc73a362073003893ffcedc26d22ebdbdd0c3  perl-5.42.0.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
 sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
-sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
+sha256  8979e6dd61852041643c5c5c40ea63b2bd1b438a67d114e62cbaef808c514315  Copying
+sha256  189e9d6ac7743ed4e832f14c9edb6f782c92d8868b447fa2684f7fe5a81465c1  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a301b93e4..c31a368b7 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_VERSION_MAJOR = 42
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -28,7 +28,6 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
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
