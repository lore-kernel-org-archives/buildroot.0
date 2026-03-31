Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB03FF60EE
	for <buildroot@archiver.kernel.org>; Tue, 31 Mar 2026 08:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D664607A3;
	Tue, 31 Mar 2026 08:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNVobQXDa7Dq; Tue, 31 Mar 2026 08:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743C160EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774946256;
	bh=4hD6G5LytHV6xIs9KzVqIRzvGV8Teg8tOMouU9wJXlY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QhrEshNObwVKb4Xef63JejsGmeLKMMDbGfTde7ODy8XAhfMun+9T9U20E+ihfrjug
	 N8Ez6a+OnegaNhl5eixqpM4U+sBOqXz+8K16kHusdW0pC16LTVp3Eupc1oJYNeffjK
	 iVXNmTrXpz7kbJT+S2lZ2rQOVDc6WJzr0hqmkDbBDNJf97qy2PDoYIly6+U2X7IVq4
	 KXtnu1OT9BwttcN26BQ8BWwAKw9i6BoeGCtRnURAVcG/Lwib0vKJC1KSQOehY7/BrW
	 wGCQQwqYc+zYdVJIzoUsF9iRlGgkSwPT+omLdOGxX3ah7DSgFEJ4zAMQ+z4jlsbyKL
	 +JKdGcgdx5ipg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743C160EFA;
	Tue, 31 Mar 2026 08:37:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED6332C5
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 08:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3A5481452
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 08:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dewNvtD78vrh for <buildroot@buildroot.org>;
 Tue, 31 Mar 2026 08:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCBFB81521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBFB81521
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCBFB81521
 for <buildroot@busybox.net>; Tue, 31 Mar 2026 08:37:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486ff201041so53387125e9.1
 for <buildroot@busybox.net>; Tue, 31 Mar 2026 01:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774946252; x=1775551052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXT+Wjn3SJcaDIiA5LMn7Qc6WYgsJFZQ/e5Ub2BdSL4=;
 b=gzAi6iQGaPTQUvdLAoJYnCS/vSCbLkB4ReBbHul3tvmdAZVQJbizDG9S9W7mTHcZPx
 RF5gDU5Czwwu9maFhNFsihFe9n9qyyky0hTaSs6Y5uro9tqXHjMIo722O0CIrlDmHGFA
 ANB3ob+tptuJ64Twuc0oA5KQSGo/Ek69wj/6pGVnOBxYAbk3QfXIoWhLmY/DgRTK/27Y
 D9k6kQWo39j8EGObh3qUWJaRs6FlSRHKsZeVHbuG4PALjxELuMmD26UJFVGqE1I2peEC
 UINVB01PSFByo7pAWRU7Bho0UlloIqErMEAjxr7NF3q4E6CUjzy7lVji/ND3D6XCbIn+
 ySfA==
X-Gm-Message-State: AOJu0YzuDtsth60awxPaOTfg3fLnrPzwVEfFQSVI1ET2hEmMmEN1k784
 kHd6IbWY7TUjSXVQuO+Q3tbeMsE5TMRu8Zh6OoHoQGjfU8F6v1d1BBbI3tmak599sN5j3vcyt3S
 V0T4pWA==
X-Gm-Gg: ATEYQzyjcjXYFrT9Drb4vW9SbqmZQWCUfi0EvNh/DPZbxVJKDgqDhGsM5VeBdh3IZDP
 tqP1K5tQPRTq9z386MUYSjfdnD94Rv//S4z6qvmvv/bPjKidiN84O3XuI2+k4avtRS6w1IqSBMj
 YKwrd67PFGbuNGrHJFFTEIoFEbMVWv0CdFqZG2sZrghidK6CvtASivt4xxeuFehhjbWEY9COE4f
 uuBgziBmIX2Qr6D/m5ZyYcyZMGF5B64ft86LmdkyQ2oharjsn4lBGQeGZNcR7SkpYzBAnR70+fg
 WCDV778oXCCjMB5MEnctPYE3Vrf44OHm7ve2CWv2o9HOO+4h+/9lOmdj2jktsPGSA41tRO2bMFM
 tvjlYQAVegKoELUMUFsALe/L5MoWU+P8U+wCajPd1HRF8J5Tvy2OxBiBdlo4KYN3qB0TJnZFVM9
 Kldayxh94QpTQuMsXNnxRfrVUJIt8q56KXNILGFz0rH4VzYDyY1qcLEojV9gbv
X-Received: by 2002:a05:600c:3f0a:b0:485:2f4a:6ae6 with SMTP id
 5b1f17b1804b1-48727d5941emr298587165e9.6.1774946250576; 
 Tue, 31 Mar 2026 01:37:30 -0700 (PDT)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf2580168sm26060383f8f.36.2026.03.31.01.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 01:37:29 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue, 31 Mar 2026 10:37:22 +0200
Message-ID: <20260331083722.86951-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1774946252; x=1775551052; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BXT+Wjn3SJcaDIiA5LMn7Qc6WYgsJFZQ/e5Ub2BdSL4=;
 b=lTl/bstump4ZFdcsX5RYl79/Au3cTk1yyqrmboszVqvy4i1LPTGgsDDDpAIObUutIB
 8GTRqS+oDsKO+UKQhJNRY8bFhlbyDUetjMNFl3Fz3jhUJckTyBPeVWt0L8Ig21/hlp1C
 nah34Q7qZZskCs4yj38vbqCfnkMvc6v0F7XneBbuozEjVDkVMd0IL658SxZSvtq9Cj19
 +oDfFcNbA2uxG91fyY7WStCZTr6RX8mqlHgcqRrVoKJ2+rO+uQhJZtZce1q3kVUdCdX6
 8U1emLwJajteF/UTL+ek9nR8OSVrtXVzNPhZn+fG+tFJqhrfeAgxQa9xHCNq6uOqfWAW
 Kxfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=lTl/bstu
Subject: [Buildroot] [PATCH for 2025.02.x] package/perl: security bump to
 version 5.40.4
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

fix CVE 2026-4176 : contains a vulnerable version of Compress::Raw::Zlib

For release notes, see:
https://perldoc.perl.org/5.40.4/perl5404delta

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 0035c448c..2fe7b5c21 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
-md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
-sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
-sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.4.tar.xz.{md5,sha1,sha256}.txt
+md5  2e83cf578d5044444eb9e445f58cf36f  perl-5.40.4.tar.xz
+sha1  85790a2f35446a9dca6749a563117a36bf381a2e  perl-5.40.4.tar.xz
+sha256  eb0b1116b84ded552f686c9ee40c83000d8388c454f54197ca1d3a3b17246bd3  perl-5.40.4.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
-sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
+sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
+sha256  52bbfb0dbdd5301ab21cc43d0b1d649189eaa3c0caad60a0798657b8c011ab0e  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a301b93e4..41bb8d5dc 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).4
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6.3
+PERL_CROSS_VERSION = 1.6.4
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
@@ -28,7 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
+	mv $(@D)/cnf/diffs/perl5-5.40.3 $(@D)/cnf/diffs/perl5-5.40.4
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
