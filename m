Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE8CFA449
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F43B608CB;
	Wed, 23 Oct 2024 16:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veaLw0MX7ehK; Wed, 23 Oct 2024 16:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0136087F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0136087F;
	Wed, 23 Oct 2024 16:00:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B0DA2072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEA47810EE
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPPanB1-ttZ0 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B891F810ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B891F810ED
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B891F810ED
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4315eac969aso7767125e9.1
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699228; x=1730304028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kh5E6mTXYUBcWqTrmpYc4OL4RfR1VuZpveHo7FeLAuM=;
 b=rm+cPbXsQU66V0CvU7C00I20eRS4vuSPoDPkNB+DMzbqynqyE7TWJAYUTIijB/IqBf
 yKVUSDkNll6wbYalS8wPNBlYRfoedvd/UYZfi+cg/MKKj67WWDyuMxCJgvQIoT/3NaQe
 +JafhRUhFw5agqk3DRnV6Lsu9juuX2SqqSpkcecKpwFYjqypylNvWMAzX+o7bnJZa5PA
 AhnC8kCGkWi3lIS0dVJW++fkEpEOiKNZuQTxwY/7jVa3KzyJNR5tOMMuwmWw+c5Tg6mp
 4heF3jhLAvV+5jpBrHWrksZymMPtc8GUuuCkjwRQij/+x+2dTqLlvSz3QeUMkuleV89D
 U90w==
X-Gm-Message-State: AOJu0YwIk7TFNvcJxywmj3OAPzkNoGSjOiJW9TrB4cXaa3cpDjusQp8/
 RpbvA72p1Gaq91LUgqgRGeEdUKPnUoc2fU2Bnwa9GjkExU1VKKiuYK/21bsfqluQAtvDBsC7tBq
 OCQ==
X-Google-Smtp-Source: AGHT+IE4j/uaAcQ5XPVEuGmBVtYYGlOsPL5kfMR7L2jo4lADO81B5FQwaDr23S8iXcKh9BG6UNN4Zg==
X-Received: by 2002:a05:600c:3b85:b0:431:405a:f93b with SMTP id
 5b1f17b1804b1-4317bd885e2mr48779645e9.10.1729699227638; 
 Wed, 23 Oct 2024 09:00:27 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:27 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:13 +0200
Message-ID: <20241023160014.568872-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699228; x=1730304028; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kh5E6mTXYUBcWqTrmpYc4OL4RfR1VuZpveHo7FeLAuM=;
 b=FGTo+HGwDig6KIFTsyKrcbw4JEOCXkoyLmZzOnmV3QBHg4mdw1OPMNpRQ8fXkETNGD
 D0VfWKT/qVpwRsMo6NiOB5NR9uOIUS8be594xtwvEAep5yxAVPSrv/F6VlqPTqroxDVs
 BJ/cBkg8nJBn3B9z/OlwzmP0y9X9dUXrt2SbdLTBrGw5QT9OhfopDcZ7NiBSY+3KbzyC
 YXukGWWLH+PGEj1o+sErqymS+liqRifLmiUgKRcBUXSIHwU8sLcWmPvhiqECrnAYgfDk
 K/ebJhL2IgOby+cktmnIu0fvtI+EAuelalYbxZh4fwY0EPQwKSX8gPoOVYLLzDjExNsL
 5LMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=FGTo+HGw
Subject: [Buildroot] [PATCH 6/7] package/perl-net-dns: bump to version 1.47
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
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 1e559a432..9bd87d12c 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  640f572abed308ca5399d3429cbce6bd  Net-DNS-1.46.tar.gz
-sha256  91b65cd0f12461802c61ca5474f87b3e29f5182d2e1b3a2ea70702a3efb4a743  Net-DNS-1.46.tar.gz
+md5  7a1c00ef78a6a000bfdf329f24cc5f31  Net-DNS-1.47.tar.gz
+sha256  fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b  Net-DNS-1.47.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index c5b01e8a8..fc8c77dd6 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.46
+PERL_NET_DNS_VERSION = 1.47
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
