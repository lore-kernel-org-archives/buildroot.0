Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC88CFA448
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14FEB406C5;
	Wed, 23 Oct 2024 16:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXc19Rjz5Qqk; Wed, 23 Oct 2024 16:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB544406C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB544406C1;
	Wed, 23 Oct 2024 16:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3925459B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E57E0810EE
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmCcbOK-GvjR for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5942810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5942810E8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5942810E8
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso5098545f8f.0
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699227; x=1730304027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQgYE//WffwgVeKySKLQI6uYZ1UHlXYdWGLuTr2u3P0=;
 b=Kw5Ha3pL2xhGSd1Q6DeXMUi+m3cSiP/jxqxEGAF3g/5ocRd+28o5jyPZOcTWyw9pHm
 1pDAikbSraHlrwwDUFcpC7UjmfcZGyCdsy/YMOMp7C2dcKdV9zx9iEResAiKG6wL9L93
 akv8pfb4AyEvs/+2fJAhdE6b2ZZ54GDwI0xaYBmm9jHXs0tmyW2qzXizDQ5R3fEBwYp3
 UewDRNAjOv36cCNNfEWmeN56t65yKm1r/iKgnlcqfudaD+XIGDLvoQgDBG4w06Hii6WW
 KPSLrJLrj9V4x+18D3RE2pWPdpKfjcI4a/csmxaUCQXfeOlu8wKz8gRMmtjp3tko66DY
 X62w==
X-Gm-Message-State: AOJu0YzsTWRxdcnV/YVjp2cDn59dyuhXq9SMGDgO59yqj/VrgprrSZzZ
 +heNAcxnjt711yMwcrhSFLsR08shQe7wq+QdczivzMV5UnuBEXpUvQM7L6vpieh64L/NDr3IpZ3
 arw==
X-Google-Smtp-Source: AGHT+IEh9uSwpQVUrYVmE3zAydR43hqu8An4R/EC9ZHxhZd/40D5VCqenh6sd9LRBPg2KG+X0yJ7wA==
X-Received: by 2002:a5d:65cd:0:b0:37c:fdc9:fc17 with SMTP id
 ffacd0b85a97d-37efcf0c195mr2188487f8f.23.1729699226723; 
 Wed, 23 Oct 2024 09:00:26 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:26 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:12 +0200
Message-ID: <20241023160014.568872-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699227; x=1730304027; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQgYE//WffwgVeKySKLQI6uYZ1UHlXYdWGLuTr2u3P0=;
 b=c+2F3f39KJ/B60zWktNBBdqiEy7f9dItNX1Q0RQLG5n/1tgtK4SFrnRXFgU51HqMTJ
 VdMfbfeQRHcoxiDPjR7RrbOT8BPzBwG6p3AkS+DxtZNQx4yFsyZqU7seIlYY1mhsmeme
 b5+zCK9F/YN7AugabgzNC/qqJ4ZZ/3ELw91FjqV0RWJzuM1KLEhlZiqi9qVuu+p8MKlE
 qCy0IHI8RalShXfWe/tmjDWICzww/2/Gw1uZO7t6SLr7RCV4cGPii9OiWIJHERm4pZDv
 7lw1Hw8Bzf78LdCqpaZnDYAdnYBAXrjP07V6G5mjFvye656YL8GREM+P1JdPPLM66+Ww
 5ylg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=c+2F3f39
Subject: [Buildroot] [PATCH 5/7] package/perl-mozilla-ca: bump to version
 20240924
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 8d1b8c68d..35bb158d1 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  5e1c97b65ef6fb4ecb07d0d01b3c655e  Mozilla-CA-20240730.tar.gz
-sha256  55bbee1875a905616e0c39457245f94f8173227fbe906f643673f5adadedf863  Mozilla-CA-20240730.tar.gz
+md5  dad624e6dce1d5f87dbb6268395df180  Mozilla-CA-20240924.tar.gz
+sha256  c4b1412bbc37dff8cf29af6f92cb47defbe90eebcbc29e407a98638f7a31bcd0  Mozilla-CA-20240924.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 9e8dabe28..ce5664996 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20240730
+PERL_MOZILLA_CA_VERSION = 20240924
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
