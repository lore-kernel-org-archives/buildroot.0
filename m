Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3130E82CDE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2930142F76;
	Fri, 29 Sep 2023 22:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2930142F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrj7NvXbCKYA; Fri, 29 Sep 2023 22:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2019E42F83;
	Fri, 29 Sep 2023 22:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2019E42F83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BBB01BF2BB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 416FE830C2
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 416FE830C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0DX97SpQymN for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:02:59 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1D5983CE6
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 22:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D5983CE6
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a645e54806so1923557966b.0
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 15:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696024977; x=1696629777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZW2/ngH9jSmWItoetNNI4QvDdcK/I86CZxsPkM5WDFw=;
 b=KNb6tabrIyFCbpG9+MzeFrxQBKFp4WmNcuBvHz+vLcgAEyy7P5VUJPY1rDiDXAvx1k
 o0iP+BLnLMTQUWzfUlysXwVqOK3EFMPUaZXngTQd7MZx0on200LcirArmytfMdmCGHbi
 5xH/Zr8Rm5sBlGkkVb5/Und/QTXaiTfK7Mfqk0dzMiM0hAIlw0zWr8GPasn/LJJIsZwL
 s1vZO5p5TtV4xywaEksT2T7fTD6dUXVgOGn9zwt82CaX8GdYuLBQN+SNO3FGH095KFDi
 R5wXe0L2C+x5fvP5HwqKA2OJgh0f1ucBq/ZsihVCDdxGWgWDkTVjRtFkXKymdAvyMhuR
 a5KQ==
X-Gm-Message-State: AOJu0YzxIvuDrvGu9JToXsIruKE6XPvjYBIO5JhCvxmY0hK/eoCdTlw+
 K1SPJIqwXnUddD6NxKVUg+/D+lBiLp0=
X-Google-Smtp-Source: AGHT+IHxawLWl63HKYVxTvdvePFLk+lytg9CZrThlRT+3JmyxbK8hMdZuhrUVu/8867ehsRcMUbaWg==
X-Received: by 2002:a17:906:5393:b0:9ae:3fdd:4dd with SMTP id
 g19-20020a170906539300b009ae3fdd04ddmr4733296ejo.24.1696024976514; 
 Fri, 29 Sep 2023 15:02:56 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1709060e9400b009ae587ce135sm12996857ejf.223.2023.09.29.15.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 15:02:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 00:02:48 +0200
Message-Id: <20230929220248.3314845-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929220248.3314845-1-francois.perrad@gadz.org>
References: <20230929220248.3314845-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696024977; x=1696629777; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZW2/ngH9jSmWItoetNNI4QvDdcK/I86CZxsPkM5WDFw=;
 b=g0z8UL0DRM+lpHh9uEQkLTAGCfQWfAARd+HraZD6Ad+VC8WF9F0ufAqXrV+HuhUqr2
 IJ0426oLrJAYxc1iJgz0baqRXmOsFeARWuDsFnSJEwf/3ehSTaN+2VuvTEC/brcVGi7n
 4IkToEnk+WUpnUIl2kDnjcnB88TYM3TCVWve4aqBFf904hnriOQH44137nBEyxPpLA7V
 0fcSMS4G4M/UtuWUv3SftWD3Px23TIKHxFPBM/VhJavv/hnwlqKB3k+p+Lf4u0x8WfG1
 NBrLgO2ey+tD7bcG03lKsGG0FbEzhHwcr4ej/KPdAejJe2jy782w0MLwQWcaW+giNyiN
 8F0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g0z8UL0D
Subject: [Buildroot] [PATCH 2/2] package/perl-net-dns: bump to version 1.40
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
 package/perl-net-dns/perl-net-dns.hash | 5 +++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index f6292d242..35f2e92ee 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  e99cdedf9f0d60dca16f613e488c5b7f123c2fb24b3346d580cfe7da40851ac6  Net-DNS-1.39.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  a71e4cfe069e700fc52bacb6dbc0cdc5  Net-DNS-1.40.tar.gz
+sha256  209bbd40de8d48c1bd7aade48da237fe0a499f89d279baa2e1a99bd5ec922ddc  Net-DNS-1.40.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 2626c22d6..d49a00f5f 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.39
+PERL_NET_DNS_VERSION = 1.40
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
