Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDC7D3E787
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 08:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61D6606CB;
	Sun, 14 Dec 2025 08:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5ucVxW3ehUx; Sun, 14 Dec 2025 08:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86C060A37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765702042;
	bh=n1x6zILOGtvrh01qtOaYUJtI/ym4b/VhfbpkrFlIaU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EFmQfezpsANpr6qTtImWoBLLzPe2sAKLL/jTnMTiNiyhPUlrujlZUU8MjCTiNVnRw
	 5mAyXz4XoDLGXVkxEDitsuIblgutbymJ9HYdBgkqBTCe2SBikAqoEVue7EnMWzMG/m
	 dGWyVJ7k/b2ZmFKpT59CZ5zqquTK/ig+BEz6kR6+V6tn+dgqYimcWA/30AyQyCHKQY
	 tZi2382Ag60LK0ZzYs+DaBJdsep5qjc7ah+slkaX1PzJjDH/BLryz3+ntgXvD7zZLX
	 WuhHpktPgVJoAOI09ZYuvqjQs5NeIsc67siQoqp8nmqBG01cwIaRgN9RUTBiVX3SF6
	 O/yMo9iAUBc5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86C060A37;
	Sun, 14 Dec 2025 08:47:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21DF0117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 08:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13907810A1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 08:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wz3uBuOePvFx for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 08:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECD9C81095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD9C81095
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECD9C81095
 for <buildroot@busybox.net>; Sun, 14 Dec 2025 08:47:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso1283975f8f.1
 for <buildroot@busybox.net>; Sun, 14 Dec 2025 00:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765702037; x=1766306837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJcjAcJ/T1HMh9Ni0RZkD817DREkP+/kGoYqrTTANi4=;
 b=Hy5cefOnpBnOhXaquQYQ4iZc79hW4aukOmqOkUf6SKkwhggtQOCDNhfAlsq15QtQtd
 6wWVEpSOcIoc8HVsW49NWmAOmHyi4gA1ftBBhaUv1glGw2ya3I4kIX0peBThmJrmHsZX
 Z8ElqK+CTOY7vfh6VecrA9RecdO7vxyo5k6w/Gxjq/ie3Bf0bifTkeQLwYG1kHxYGFMq
 //kPZg/51KjHZ4kJruJAHznT5hci++pYyMywYRUevMiYScBxOG+W7befaAEOcdHHgvQi
 6hl/WxH3HtnWvgepJ0mrIh8ZOtomn7OlCGXybS5/2sx+MMAkSb2vTLMy3WLNoWZuwffU
 +vLg==
X-Gm-Message-State: AOJu0YwWahLRDUhlK38Ip34pYlT2skJKNUZ412yeC6S9JOUAy8UepgBL
 A0p/9J5wVypY1p2bv9KCMPmI0vCzrn84PmlUB+IiqIUSVJ2uJlq4XyrQDvAvg3q12wWXsSaBGUh
 8AwenXQ==
X-Gm-Gg: AY/fxX4EfxVhsWoNQgI0jI/1WPCGEvUKDXRYFGkFhbO3Qstox4a47omb9+bJ40mCLTW
 5DJYucAw6TX0CTaJ6GcxitMhmx/H/NoKxXxbJ9QJ4iEnT7TYui5fnFZ3v+HKq3qpIAwpv0UXl9v
 z21PbHRkQy9UT0FB16PPYRV6Oqli68E4hWoUrYi9gtJkNzCBeOYV6vjIyI7Us0uhCXD9o1hvZ+s
 qz9BOk/YlohO9e7nQ5CLXIkYQMJ4/IymsZdPledzZoprr6g+L7P1zxoE5/0yT0lMeBhNe+y/YtM
 HrdY23uE1mubDmUg+wUzlq8P24/H01eV5WkkxMdueg99g2WnOBWzFbxr0R8000QDfg2/Or81bI5
 JcPBLi87wFVBWMwoqOkw/vGZhGfG47HI5cTVFumjUKLgb33P1q8/S8x235nc5OIFuAQ0qn3Xf+I
 84noRbG+DGv8wNoP02vA8fErDHF8E9OFvySgI=
X-Google-Smtp-Source: AGHT+IHhk31QeVmr3SLumZA/Q7eL1yX+VKRL2dTb5dcoRIYEVxqbpOEa3oJKNkNmNCfWkArLIz3qFw==
X-Received: by 2002:a5d:58ee:0:b0:42b:3806:2ba0 with SMTP id
 ffacd0b85a97d-42fb44d45d2mr5355369f8f.2.1765702037033; 
 Sun, 14 Dec 2025 00:47:17 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f6c20781sm4225308f8f.24.2025.12.14.00.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 00:47:16 -0800 (PST)
To: buildroot@busybox.net
Date: Sun, 14 Dec 2025 09:47:09 +0100
Message-ID: <20251214084709.312790-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1765702037; x=1766306837; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CJcjAcJ/T1HMh9Ni0RZkD817DREkP+/kGoYqrTTANi4=;
 b=RxyQRymH6UMZTDIrycOEuzG0LYPDK89jslOPj0p3+zoUtgpRYCL/dzRfBZXYZQr7cq
 23/JE5vVBfRTfNW77YbbkrYOFR3rsD8IJNavNkt5frmqNI0EylvbRQel60tKRAjqWVZx
 ea7TCiEptBvQI3BPWqrzBNNwWlOlgXbMV2X28Zr6VDFOukG1Xg2nM2GjgxlYX/UwOEgw
 zC1IxPZYhqTXvobSRyM/LY8nWj+Tj0gLZLVXKBEWlBdqTBfuPzEPi4NcI0YG139PJM2n
 Brw+JMpLueKzRsjO7JfL6i1AxDHjRzN51Sy1yMW78jbAYqABmdOJnC5rPhYWrA0uTgEU
 VG9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=RxyQRymH
Subject: [Buildroot] [PATCH] package/perl: security bump to version 5.40.3
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

fix CVE-2025-40909: Perl threads have a working directory race condition where file operations may target unintended paths

see https://perldoc.perl.org/5.43.2/perl5403delta

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  5 +++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d581054bb..0035c448c 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
-md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
-sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
-sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
+md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
+sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
+sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
-sha256  131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
+sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 34abb734d..a301b93e4 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
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
@@ -28,6 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
