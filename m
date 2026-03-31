Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC9FFF60EE
	for <buildroot@archiver.kernel.org>; Tue, 31 Mar 2026 08:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A99814A0;
	Tue, 31 Mar 2026 08:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtWr1W9kRSoF; Tue, 31 Mar 2026 08:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F3C81311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774946233;
	bh=PJ65kGFYNP0rpjWTXumHZsq3fy4oqnVv8DjK0Z2RETI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H9ITwGUDoY1u4+iZZWRdiqwbzEA6iOHz9j2TkzS6srnsmZYXtrwJ1uZNehGwgIYkj
	 PA2WoeUyef5F3st3EfAeOVe3s1sGqejXYR419zaibz5G++PsBrUCo0SpXqdRJuem65
	 OIE9JX34J0K8hodDjmHJ6HMOL+xrkJtrk9DOM/i9WdWbD3uRdWuEFTyDddJi8lCZP/
	 0w2uEoro+1opcB+3EaBhF5+lterLLyI1mGfgy54ADZEhMEVVZYFoZFfHeRAAR+9fcF
	 VNCWL+z+soD9bk810fuXjtnBqYKb9wyyvnPh436XsEbsaBFf1EUphHJQhcUijY+l3C
	 8LWci8lEk+I4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F3C81311;
	Tue, 31 Mar 2026 08:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6ED30E
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 08:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C61A81309
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 08:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ij7CYpMH2OQ8 for <buildroot@buildroot.org>;
 Tue, 31 Mar 2026 08:37:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCCCF812F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCCCF812F5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCCCF812F5
 for <buildroot@busybox.net>; Tue, 31 Mar 2026 08:37:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so48958055e9.1
 for <buildroot@busybox.net>; Tue, 31 Mar 2026 01:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774946228; x=1775551028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpJa1jw/B/FSEzuXKzqPlmbIjfSDbhLjbx8EM6eYAlU=;
 b=AgmsGFIQeqDmUzZ9Y2JmQubaszOhWTsiQ3x62wxRoUKQIt6uuPDWKdqc/72CBMZP5Y
 70w18nMu/yD0/rofVPjhDfoCAqOob3z+ep0aM5sBhhp1SSdPCYbpJR/HsECm11HHg0Yb
 XPtpotE1gpzgYzshmJ+CuL6aaW7SZYBMbhRrd1TyfxjxKi7g9gsmTlOIsCfGvoP7SKlh
 6BGa6ceD4qB2i7GkBiI8MhikZM8mOaOMxF8c/jhQqK216PHypoNTNAY0oat+enYPLC3w
 DgF79H/9fLl+3JoPwlqCvW7JiyYsgcpDWg6nRPO419aStt/vzKYOgVQ4Bsr8tNQ8plLa
 uV0w==
X-Gm-Message-State: AOJu0Yz6QMtnqxMAjWTY0PV53WcFeQPReRoxjQOR2N8FFtdedWXSFuM6
 HiNT1NomZWV7yiWdppr26X9Nm4a3QnltUHbV2FATSkQa0Go5DsYq3Ph5mINAewFa8Efl0Mok5Da
 WTqntNQ==
X-Gm-Gg: ATEYQzwUri7L19un2lwaSnLtDh3tAlV7kSpyHccciNCFUltyb/4/Uh8+63rAGUlt3m5
 Tb/mT1pVW/SxXP5BQIOLsCRZetcJSfdhLB6dE8uCZKbXBazs3C9oPIhGfjAw6YfRlm4dwXWJ6ZC
 ESTfnXw2fm/BTrjqQbGiRDOJdzR0m/59hs2BQFqqTvJ+CKfcYZiHE94Mis6t25DPhEbo5crTs7Y
 Ear6WIl8XT6n446BcX0R4AHdTwdg4vORGXfnSXv2nTd6NcT7zJUma9f8Qx8c+rzdz2egjgDXmb7
 NJgVM9U4qzdjUnUStW8uC7dPD43se3mifx94P8Sjosqgjrhq+ProkIPE0t2WQ/fG5Rng4bQH1Mc
 ofmakNKTqq8SFaQE6EVXeYzfbJc/Ef24fP7RuhGOYRjo6mXpKEmTiJbfkfmW6NwfQRe9RP24QWm
 LgW0zADfVGtZI3BOAIrdd/HfgsqGw1cLxBuebqYXQ6ApGFwerjEQ==
X-Received: by 2002:a05:600c:4fc9:b0:485:2fe9:336f with SMTP id
 5b1f17b1804b1-487280ba3a8mr246125085e9.30.1774946226819; 
 Tue, 31 Mar 2026 01:37:06 -0700 (PDT)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e3602sm25893943f8f.4.2026.03.31.01.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 01:37:06 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue, 31 Mar 2026 10:37:01 +0200
Message-ID: <20260331083702.86930-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1774946228; x=1775551028; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OpJa1jw/B/FSEzuXKzqPlmbIjfSDbhLjbx8EM6eYAlU=;
 b=pppS0izcQGmYLalOndEDlDcTceW4zZMiHbCQfLPoV+RSXTz0HbIJrF2sEcTFWSonip
 VwLhGtVtkkZnOZfTtbM+8DRMQntHYhMRIZ6vfmHZGwKSB6MN1tw06wQ8tDtQmERnCzH1
 yITqj8bLPDUSfj4+5qyaqtPxa3TCvwi22efVGMN9NAv8MUA53PUDMaW0oMEY+3on77ok
 dikiAE4aYB+lygNUuHGh7Ma4itxQJqfxX2Yx/QgjMYi2vsKrw1F1NKdqkPnI4JvtGAxr
 vojQ0HTFH0tuRLDlf7joru47NYXSmclAQm70qK1Cy4SaAMDrMOt7whKXJIBXjAKBmgRv
 VdUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=pppS0izc
Subject: [Buildroot] [PATCH] package/perl: security bump to version 5.42.2
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
https://perldoc.perl.org/5.42.2/perl5422delta

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  5 +++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 3aefdd05b..d88de6c42 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.0.tar.xz.{md5,sha1,sha256}.txt
-md5  7a6950a9f12d01eb96a9d2ed2f4e0072  perl-5.42.0.tar.xz
-sha1  3b557f28dcb412b115d9628c37fc94b2fda08384  perl-5.42.0.tar.xz
-sha256  73cf6cc1ea2b2b1c110a18c14bbbc73a362073003893ffcedc26d22ebdbdd0c3  perl-5.42.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.2.tar.xz.{md5,sha1,sha256}.txt
+md5  be6e70b71ec6589fc090f7303c5b3056  perl-5.42.2.tar.xz
+sha1  dc36549204ec31680e1c7c0acb37fad0de83a339  perl-5.42.2.tar.xz
+sha256  0a585eeb9e363c0f80482ddb3571625250c2c86aeb408853e8ea50805cfb14bb  perl-5.42.2.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
-sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
+sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  8979e6dd61852041643c5c5c40ea63b2bd1b438a67d114e62cbaef808c514315  Copying
-sha256  189e9d6ac7743ed4e832f14c9edb6f782c92d8868b447fa2684f7fe5a81465c1  README
+sha256  16381bf5fe73ad96ed26449b52eb4a85b2a32a49763c8a788d43af80f3add548  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c31a368b7..c96eb4413 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 42
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
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
@@ -28,6 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.2
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
