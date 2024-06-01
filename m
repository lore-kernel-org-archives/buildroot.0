Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAC1C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 12:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FEC960720;
	Sat,  1 Jun 2024 12:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJAM9DR_8yqP; Sat,  1 Jun 2024 12:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE4660814
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE4660814;
	Sat,  1 Jun 2024 12:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFFD41BF239
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8748845FB
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJNNO0cHaHkp for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 12:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8D70845FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D70845FC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8D70845FC
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 12:59:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42011507a54so16465555e9.0
 for <buildroot@busybox.net>; Sat, 01 Jun 2024 05:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717246774; x=1717851574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdO6br3YeOW7MEuBfZ/Fh/ksx9tt+X3YG7Bsq04I9Gw=;
 b=pa63oFOjsQD1+SarOO3nyDE6Nvc9xVfP3ewqPCYR3azJnQB9vQmYQPkU5+2nYiFum8
 vksFDaX3h3EFV6O5oDFlFkDrku2+USGURtn/21sEQX2IVw8r/SlKw+qvRERVEormAptO
 M+OBjnbGRuG9mdUTGdTwzvIoE/q9GSN23TH7UBlyhVETaUiSlP1FlPtyysJ+JKok0xeH
 i2Etba94ZCiXw98nDVtVf05DR8vBFwSYYOsfy4cM1iQkg+ievRzaLp+U7GKIb6JDSGI4
 qy/6SSw1yOJSIXRPNh7BUYXFz0fBiqjXIXYgnlSWlZcbjRn+LVOCszne3FccmAFsWBed
 fn8w==
X-Gm-Message-State: AOJu0Yw9lFa9re7JxHQQh1mws0Lf1DB4aRSJh/ojYMDbPsaFPzOnQTGO
 beU1IAelJTqhV7x968+foxyuYUG8iS5FM/MvaWc3huGPb5sT5dbMTeIvWifuHIgUamL5CnLWJaV
 iRw==
X-Google-Smtp-Source: AGHT+IHesPhfG0g8wgy7aGxeIM5em+JAipiQdNWGr4rr04B2fW+eFa3t5nD310mkbXNQUcyeyQ+djw==
X-Received: by 2002:a05:600c:3b16:b0:421:2974:c7bf with SMTP id
 5b1f17b1804b1-4212dd6df05mr41086375e9.9.1717246774437; 
 Sat, 01 Jun 2024 05:59:34 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b83d479sm55111935e9.3.2024.06.01.05.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 05:59:34 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  1 Jun 2024 14:59:30 +0200
Message-Id: <20240601125930.29745-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717246774; x=1717851574; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OdO6br3YeOW7MEuBfZ/Fh/ksx9tt+X3YG7Bsq04I9Gw=;
 b=M9hFgmkuc7IoLO2D9u4C42UJfaa16iSZ7qQFM7F5rND3uWDosiWjxveaguz7V9B0n5
 /wDoYPsKF0QmvkRIbS/k817vOhj7GWjc3rhpmFmU2yW/ncw8xw8LDz1A9yIKCJtthpQD
 13kHs5/G3aYQnrUWd7Y/MoXgSvYvN5cuMhYLofWQCxSKlqH7beahSfCET9ktnh4mInlp
 gNmGJlIO7PLMibEJGzWlT2lDkjMGiotU5UUxQaQDu6RGmShbaaKssRQz8JpOiKR+fWTT
 MIDXGv/qpp3N347Ni+rdJyByBrK4hqzBf2POgao4NW2uwnNfWIvWNZ6PomFgFtlWfWgY
 MTdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=M9hFgmku
Subject: [Buildroot] [PATCH] package/nano: bump to version 8.0
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
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 3ca37c633..fc9a0947a 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v7/nano-7.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.0.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526  nano-7.2.tar.xz
+sha256  c17f43fc0e37336b33ee50a209c701d5beb808adc2d9f089ca831b40539c9ac4  nano-8.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 8b93527be..72f4de6a0 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 7
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION_MAJOR = 8
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
