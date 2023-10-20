Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED2C001DF
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 16:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52AAA705C7;
	Fri, 20 Oct 2023 16:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52AAA705C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kn2atrTZixgw; Fri, 20 Oct 2023 16:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9D1705C2;
	Fri, 20 Oct 2023 16:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9D1705C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDEE31BF990
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E7784BE9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E7784BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRpj4akJ76SH for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 16:19:12 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 411B384BEA
 for <buildroot@busybox.net>; Fri, 20 Oct 2023 16:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411B384BEA
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53d9b94731aso1518412a12.1
 for <buildroot@busybox.net>; Fri, 20 Oct 2023 09:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697818750; x=1698423550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O748kIy3ityn8K8QGvB9EWhAty0Ca3HL8vmiBVlZArY=;
 b=YVKApcEchelKKJvtiOlOvdmke+1eYi6L0Eib1Wk9Lzv/UwCHn4nhgpqfP9buxS8rSu
 YIJIQS7UrJOqQLarPk2saxzB9ca8xxd7a4X/tX6G/WKspKGstQsh72s3QPKb8fOo9oFB
 Xp6ktW7+xJm5WoaGWch89mfgGLt/fDc4hrrW/svnklBpW+Ox7Ua0WT26pVw86+8AWSFS
 gk8CgmvCtDWdioieXMUSlQ89Plfz11uC1hZL+OuQA6OSSUbbmv1sckBdRL8m1TZjrmSn
 AJCOr8thbHNiF7Gr4JyJhG57oxZFjqk8SYipCU3Wns8DGeGAi7U9jfb1dId6J9t3b82h
 QMKQ==
X-Gm-Message-State: AOJu0Yyr2shzjaZUOAL9DFf0/PwrtPKRgY3lN3ypbiVIPpHJ0nQ4RGHD
 vlG/pJ5s/cWh2UGU/Odr7QLy1lvc/7A=
X-Google-Smtp-Source: AGHT+IGK5rgPieop24Phs9ShENU1NhctgLKSYYRcHYMAVjnqd8mzM1UujNTzYm3/RaZZsS/7aKLrQw==
X-Received: by 2002:a17:907:9620:b0:9ba:2aae:6410 with SMTP id
 gb32-20020a170907962000b009ba2aae6410mr1629514ejc.29.1697818750150; 
 Fri, 20 Oct 2023 09:19:10 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090607c200b009c6a4a5ac80sm1746753ejc.169.2023.10.20.09.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 09:19:09 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Oct 2023 18:19:02 +0200
Message-Id: <20231020161902.48876-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020161902.48876-1-francois.perrad@gadz.org>
References: <20231020161902.48876-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697818750; x=1698423550; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O748kIy3ityn8K8QGvB9EWhAty0Ca3HL8vmiBVlZArY=;
 b=b32lpVeAL6nmPJVJOE594bgo+wzbpX8RxktpOdo/BmNqSXIJcMslzpB2sqFkcdXkJE
 h68uNXckY1zwyWS5J7xYp+romqFQBScf7QWDXwYPRKGG6f0DU/dcUdCXXMEkKMUyqXaI
 1vlng7a1DR6N2dqr3xjZhBKi0lWTz78273qHWZHvSGL68KUCbfrsGIMlPNp5NkAFD3Kx
 qHVSNWhqpv7+L3QuTsvWxTH7lBzMeyVs627G7yyfbS2I8RgFfVXUsS9LhF6vLbZivm/E
 NGHKhUCKyQnxWk5JWcvQr/INW5KgYWudWYrFZBDIFmwHUCcUJg0319yRaye7FwdVW7KV
 u0ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b32lpVeA
Subject: [Buildroot] [PATCH 2/2] package/perl-mojolicious: bump to version
 9.34
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
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 6d8f50015..ddf27a808 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  e06ce611dd2444f2ca5b74f3a910b679  Mojolicious-9.32.tar.gz
-sha256  bc04c552ee24eaecc45feb8709d49c2901bc26fb82b4a1a8e17574e1cca083dc  Mojolicious-9.32.tar.gz
+md5  530e682c101eda6caa0b65438a0b704d  Mojolicious-9.34.tar.gz
+sha256  5069d68e4e2d8ad663db58859b4fec0ce79ab134d9e58055aaaf3f0f3a73a2c6  Mojolicious-9.34.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 63b02a518..040fbf08e 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.32
+PERL_MOJOLICIOUS_VERSION = 9.34
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
