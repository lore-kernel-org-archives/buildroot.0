Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E171FC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F5C161446;
	Wed, 24 Jan 2024 10:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F5C161446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKqlqdValycJ; Wed, 24 Jan 2024 10:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6CFA61489;
	Wed, 24 Jan 2024 10:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6CFA61489
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB5BF1BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9247883F18
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9247883F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xv6eYd_Vbjh for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 264E883EB3
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264E883EB3
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40eac352733so34290645e9.0
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092510; x=1706697310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4s0NPiM0OgT1+zo8cv3WCy3jMs/4Mdhg2QWHpGG8RRw=;
 b=Y08eBkZ0BJekNvGXvdrDM7ocxJYX7j4xfZGgOYfHyv1THcTxFBBcEyegGL4HT+y+rb
 9StY9yl/kBCbXHu8lXFByR1qnxSOXqLZe7Sd/xexkQhk5AnGbgFoz2mDmC2Xe6sz2Hmb
 2OzoYlZFijbusAKZvODOf5BDNXPbBGxLONmkDDx18lh2HmEsUVy3d1ogEDSgwqNwO5dw
 m/a/Ii9APvKL0WZqjjxvq7QfVEkNbIUQEg04PJVPEGLH/5/6XHyLz7v9FFBBLRHlyi7D
 03h3rn4W6H3GWzmk5EUOh6gkcg2fTmSmzK7drH+t25BLFgUJV88zRhllKb2qrq4ivaYf
 fykA==
X-Gm-Message-State: AOJu0Yzp8AmlelJqY4xTi1OOUT0q5x+IDlpTiZlsQwGN5dz+ZMCkyZc2
 vc2wOaMhi4kZbgvnWg6P4uma+ay4Kc0Iu+0LvrwXt5qylc6kmU0cvaWIJoib
X-Google-Smtp-Source: AGHT+IEKw//CIAxjBLX/EGs88fgZGDiZQhyENS9JOAT/xahcvD/sujwrEbk1YJWZPLhx2C+l8C0wSQ==
X-Received: by 2002:a05:600c:35c2:b0:40e:4ad9:dbb2 with SMTP id
 r2-20020a05600c35c200b0040e4ad9dbb2mr946894wmq.112.1706092510217; 
 Wed, 24 Jan 2024 02:35:10 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:09 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:51 +0100
Message-Id: <20240124103453.623733-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092510; x=1706697310; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4s0NPiM0OgT1+zo8cv3WCy3jMs/4Mdhg2QWHpGG8RRw=;
 b=fP0fRvCuta/NDzNDTnpp70rkCqDVWQo3Wr/2PkAtSvKT5YwKwmYCYnRsUNX6Hw6v2+
 eeLBihDET+dZs95CcB+kvcYo2dFl28b6+LU6dNAIVzcyAifYnJkUIHrxsan4iNOEmFpY
 5LuVPTKBg5TVpI3hFiCqKkXglXCua+an0Nc9/qwd/NClPjcD2AOzQKG3bWkBofcuNBei
 1XhMf0MLIlJn0kCdXUdtJJeJeaIw32EW4FGBhGuNaXJJcbmczsja89I59cNtLngnXmMR
 pl2qEJfzeYfhlpu/s0+nvmQM5PnqLJHU14QEG6wHhzgzYW+J+hyxWnFf0yd9AS+TRV5F
 SKuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fP0fRvCu
Subject: [Buildroot] [PATCH 08/10] package/perl-net-dns: bump to version 1.42
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
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 35f2e92ee..f025d36ab 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  a71e4cfe069e700fc52bacb6dbc0cdc5  Net-DNS-1.40.tar.gz
-sha256  209bbd40de8d48c1bd7aade48da237fe0a499f89d279baa2e1a99bd5ec922ddc  Net-DNS-1.40.tar.gz
+md5  7c88cae0cac342f3fd43e7d99b29bf2a  Net-DNS-1.42.tar.gz
+sha256  48dea4d57b25deff5590e18f398a34a52256cb9f0cbf4b7a9ad2ec6fb5182cbe  Net-DNS-1.42.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index d49a00f5f..5b6c1ba1d 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.40
+PERL_NET_DNS_VERSION = 1.42
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
