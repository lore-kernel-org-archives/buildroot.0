Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21751C55175
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 08:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C98AE6072B;
	Mon,  3 Aug 2026 08:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5wKX8mGHcUe; Mon,  3 Aug 2026 08:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B886061E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785745190;
	bh=S4ANzwUlQTpMuNqk1tA5cCEB5wDns0m3NRB2dx/8bw8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RwV8NhzKtKUkW8nRC4xqEDdIQccVc31KZk8W92iJT9GEV9ooeHGtSZ17Bs5SBM+VM
	 2Vnerv204HYcRHe3bdqBTqEQ2d4JDAlDy0kxPidjbm0+5NoLphsT9WXYksg8bx3bZR
	 pWlrxT3M9ee0BacvtziH7nobKnhTc5In4Lz0j+uoRo3/lpWoqO9FgKupEDYICHGV6g
	 xSnZSQHa/lcauweuthmLsLJhBK8OHT/5jE115J/E2aq7fck3Z/dXUB27A1rJwev7cX
	 siGSBIQhZnamr5WqWgiqcWmys0eFztKBwIRFnTAhU6e0qosdSZ3O/4HzodLZrRgxnc
	 eyeKCn5wQkRdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B886061E;
	Mon,  3 Aug 2026 08:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E988397
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 08:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042EB80BB9
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 08:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QEme4K3K9a1 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 08:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D03B8809EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D03B8809EC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D03B8809EC
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 08:19:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so1895987f8f.3
 for <buildroot@busybox.net>; Mon, 03 Aug 2026 01:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785745187; x=1786349987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Mc4XdJax8v/6a+dou51VbINGVtiIExjie1/HuKmXwck=;
 b=aLGeDJuELi3p22beK08gVrfwxdjCV47fvZl5nOCpaHcRDgwRbNNt05Youc9+DTWcw7
 bhhGP1hKhtdxQjHdHEJrt7AszPlB0V4uOS20Je6mQzNSpJ/4rWOog5M6HC5aa6n+jBrE
 zq0zT5CVUOHcs6xfbhy7JTdbkxjXB1py9+gL5qZghGJTXuMcPN7jNzKbPz0myqYpSDVh
 DvivGINbvWFXWLvZ+i/8nNIL7s+B2sz3jK3MoYBKo2iZNzCSi44vtCZVluzodNQWyY0l
 Bd7qPRM8x7MLZMzXrXmaqH3uwf3PB8kUO/V58s3CLyFpwt+yoLBWbzZT1zEOx0h+hKyF
 9inw==
X-Gm-Message-State: AOJu0YwV5NXmQhfuv/YUs56u4YfE+Ax258GljwLDro7cMDLuW/gb++vq
 HJNhzPHmYQzJW6ipI3l/BPk4gfRs96BWmpUTOmnEAUJ1wyMv1X9T6xthEn6fPg==
X-Gm-Gg: AR+sD13KJzlvwKJkklDY1/ZDyBMqkbG6dSwk1P+e9z4FB5eYKDaMR7UQTr70R4+PTHM
 6/BtR6IBNN03jjE1MKSZ6fKzOwB5EGusSGarNBjLSqJoltKbpQWK2bg0pc/dFAx1FkG4LNnB2+k
 jCr50z6mFPwERTnsg/zUEouEilVFpT+AFuPh7rdoG6c620A2eJ9kRIf053iSBe9zrBz1v9Ppgkb
 TCHvIbtui/eVZ2VBiFUQ3r4Msi27lwWl/ZKz+Lqsdj/fxnyapWgMvPNOltA8C5BATM1KhRMPnvi
 yTcBrVaVOuAfeywlhke800CnFsf38Kras00ectLvj1D6MoxNAviAoxblBpeurYFPK9ncGNuW4/T
 kUDCxX4c+EG6lDz1TLi6mJ8ELY3KJV20X+idb5vgBou6W5NEb46nw/EykXake+GZKn72MPe4mBS
 BvHdBXTuJoAJsQtdv5BLzw/YQA8Yfhu7zDiK9oIXglionrtLDVB+Them5MGf8R08CU3dn3O1xON
 SH+gvl61JY/ZfvwmGVyig==
X-Received: by 2002:a05:6000:178d:b0:47f:86af:8fdd with SMTP id
 ffacd0b85a97d-47fd72c74bbmr22335740f8f.3.1785745186426; 
 Mon, 03 Aug 2026 01:19:46 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456262bsm28239491f8f.17.2026.08.03.01.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 01:19:46 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 10:19:16 +0200
Message-ID: <20260803081917.391134-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785745187; x=1786349987; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Mc4XdJax8v/6a+dou51VbINGVtiIExjie1/HuKmXwck=;
 b=akskyqm46dnYk+2SteLKQokBgBlVylK2dGnDHqL90y4w1bRIsqB0ULiw99RNm1sqq3
 6D9zt7xNCfZNu8HOS+9pvQc1m/6WmfwxtbCKDav9GFwk712c9nXlrIlbtOR8d3pnEwWG
 7g74StO8hnO04hSWyZnwPocU1TMO3mQV6VihWgOLyebVR4j2PMgPN4I+QiMBLXCN+NiK
 MPjaYuLBO+qA+Tx8wupr4rh20fI+N/BEXhySZcUcilRf68JjgosIi09DcOiTl/tBEUY8
 NdTeijXOZwgUj62GRsMDF65LITWLZVfO/WIm0+FLKk8VIz/ov9ziTwODjH21FEw2pq50
 AxvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=akskyqm4
Subject: [Buildroot] [PATCH] package/perl: security bump to version 5.42.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix CVE-2026-8376 - Buffer overflow in Perl_study_chunk
fix CVE-2026-57432 - Buffer overflow in S_measure_struct
fix CVE-2026-13221 - Regex trie 16-bit field overflow

For release notes, see:
https://perldoc.perl.org/5.42.3/perl5423delta

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d88de6c42..7649ec47c 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.2.tar.xz.{md5,sha1,sha256}.txt
-md5  be6e70b71ec6589fc090f7303c5b3056  perl-5.42.2.tar.xz
-sha1  dc36549204ec31680e1c7c0acb37fad0de83a339  perl-5.42.2.tar.xz
-sha256  0a585eeb9e363c0f80482ddb3571625250c2c86aeb408853e8ea50805cfb14bb  perl-5.42.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.3.tar.xz.{md5,sha1,sha256}.txt
+md5  fb96e6cf064bf374e84ef232b0eda5c1  perl-5.42.3.tar.xz
+sha1  1d878802a55eacc778bb1d84b1f1b8ab9b22cc96  perl-5.42.3.tar.xz
+sha256  c9387e1473a1866935cb047ece7c2e0a80767a3acdecb79d4a375f8a95970ddc  perl-5.42.3.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
 sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c96eb4413..912445ccc 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 42
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -28,7 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.2
+	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
