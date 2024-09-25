Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A954DCF58ED
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78DF6426A0;
	Wed, 25 Sep 2024 13:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUWawnOXYfUS; Wed, 25 Sep 2024 13:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36D804266C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36D804266C;
	Wed, 25 Sep 2024 13:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3250D1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2272C84857
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A_bNcve-1QM for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0060847AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0060847AA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0060847AA
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:38:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42e5e758093so59307475e9.1
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271500; x=1727876300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yr/bUCw5Fx8XwOE3qUlw9sKAzoiOU4aYU2FH5qlBvCc=;
 b=ShVvc/WDDkwsNr05zQfmlDxi6CbdeYYd5nYduqr/k54n/rzoCtqCFJ3wNbyNzwYWkX
 wqpAaM7Tr9MiSaE4EjRaouoBASSFcjyS94wxa1N0dfacw9JMNNNfz36um9F0u/fPGewz
 v/ms58oy1Zz/QgL1R4qfH8wvVwqMXsI6/NnMI7zw/Ok+/Kmoy1HE2qc5IX26UZv45CVF
 nHEldKQn94ZaMRLA7sh6QcHek5y9HxXAJcIO8MfVAr5UJz+Bu+KwJY65ZHSnD8V4tBNA
 8/3NwDFUoSvU4DXWAh46uGihcpEEpNyVbm+iwZzLRLYaT+d61lZYYEv6owzqvSrkTzh+
 Mczg==
X-Gm-Message-State: AOJu0YyLivFDlZ49+SbS4slgl2+ImF8/UpZqOkz8y/YYFD8IrZAvbvv5
 J47+mCPysm9islhbHCVxbFyA+N7N7MhPUDzGFugwsZ/GEOmmXkzhHhYWsBBZwsNfzaJKy027Kfe
 UNw==
X-Google-Smtp-Source: AGHT+IHTyorpXWuIn2EoUDmUOt1X02qW3WeVhxjTUfqGffH4USnuU40Q4FRdoZAif26HoTu6TCZg9g==
X-Received: by 2002:a05:600c:4f55:b0:42c:bd5b:cb53 with SMTP id
 5b1f17b1804b1-42e96146bfemr18815455e9.23.1727271499885; 
 Wed, 25 Sep 2024 06:38:19 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969e1957sm19405075e9.9.2024.09.25.06.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:38:19 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:38:16 +0200
Message-ID: <20240925133816.3899931-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271500; x=1727876300; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yr/bUCw5Fx8XwOE3qUlw9sKAzoiOU4aYU2FH5qlBvCc=;
 b=S+tMrgajLKKNWv30DTo03zsswXsCC8/vIMVJFiI94wde8afTEzbOn3su89C1xgV8PE
 CnsfFZd9B+bJo5uOpl3gYrNaNcNZsQKLX6ptZBjXXGU4yp5k6IB+PLVFFXilNiwC6gg+
 /OrPxQ8hqwybsgAjEqCL6+3IYdv1jZvDMMQZeTDQlMDoqTTKFg/nPdSNam040urxiXQQ
 pZZO3jfWSpiASPIRZ6qLlJXcWcEHvP0usXstZUef4yI3YM8QLjJc9N4NyDsCDDP9KEti
 mUGGGKvbIfCKHUY/2p+77/GN0ORL1R96r3/dKgKfWZYAcUMO8Owjtxz1lAuAtYkaPyKG
 D/yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=S+tMrgaj
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.4.0
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
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index adc543059..d579356a7 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4  libwebp-1.3.2.tar.gz
+sha256  61f873ec69e3be1b99535634340d5bde750b2e4447caa1db9f61be3fd49ab1e5  libwebp-1.4.0.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 33cb4bd50..a4d030948 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.3.2
+WEBP_VERSION = 1.4.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
