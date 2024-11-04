Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41752D1BDEB
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 19:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF5160750;
	Mon,  4 Nov 2024 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fI0bvV29S9Sh; Mon,  4 Nov 2024 19:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00DDC60762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00DDC60762;
	Mon,  4 Nov 2024 19:58:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B5BB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24A1D80D92
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zioz6f_0BE8x for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 19:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 157D880D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 157D880D91
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 157D880D91
 for <buildroot@busybox.net>; Mon,  4 Nov 2024 19:58:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so2727321f8f.2
 for <buildroot@busybox.net>; Mon, 04 Nov 2024 11:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730750310; x=1731355110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ACOrRoKdwbECnT3xyy5zCo0e6pWpYM59dsjkufj4pj8=;
 b=AWcqrG2Qw9deSXaUmycIteVznfNMnC4nHkD36RqFkPZC5mIuMPeBwmVz9+1C63AO24
 O0HayzIHR3OwlkLdl0Tk2D0I+CgDTHvEUK9hehWheaS+r9EbVtKQ7O/n9Is4En5Ai6NL
 /r9dtBTJsugUEGAQ6lDqh/juoEaQqsCelw+tGyzi+N1T8C3n06aRpeBM87vRbVMzpIC5
 5VAPGM8DyVQJCTiy83ZTsK7ylpBPMA9TKxzyzIZMErGmNpMmeBKQh66fn0LFT+PYFCVs
 6zCVURaVaFIMVcBPPktp0RAwfgICsMZIy3+Wr12cthV2g9iQawoY20J3/pZ4BQS80zSA
 FRJA==
X-Gm-Message-State: AOJu0YxMAJKRFtqOnA4CtYv+9tE4/X0Eo0qmxM9LCDqbR4kd/nIDxkpE
 ZPSBDs0wqyxCp3dKK1RD9wg7ByH3rQZQ4UfczWAX+f9xQKVJpN3I2kL+nsZE4+Fae8WZIgtub/u
 QGA==
X-Google-Smtp-Source: AGHT+IF5Uvljs/DCf4fH+IHQh1oK377iLXJMPZViMhbfgzF6J1kyaxq6EbbR9Dq+q4NFb9k7UpAy2Q==
X-Received: by 2002:a5d:5f54:0:b0:381:c811:d2a3 with SMTP id
 ffacd0b85a97d-381c811d382mr9328232f8f.39.1730750309839; 
 Mon, 04 Nov 2024 11:58:29 -0800 (PST)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10d473bsm14123708f8f.35.2024.11.04.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 11:58:29 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Nov 2024 20:58:23 +0100
Message-ID: <20241104195824.1057262-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730750310; x=1731355110; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ACOrRoKdwbECnT3xyy5zCo0e6pWpYM59dsjkufj4pj8=;
 b=DLY9nzFQwcOvreTxTb/ghyMdR1ii3AJ20SHYTspRR3eRB74hrkJiElzCUQ5e1G4wOv
 6K7ssXV6YJDXDNdy8ipq5wnAfY7Fa9IgiQwNyECSGOzXkq/xNSqmpE3D7MM3d6dAkThG
 SlJ8Yq8GxO7+DUOKXX2mPibbzxtrEHIPEP8usEfKEZTsUcusedfSqd4G3xIf6RFIPLAn
 53r10hejVJfdLGDJ4ImXXnq/zzlAR6hJDcwCIs1NwFCQnjegb8N1+etIJfjJrJ5K6HUO
 c2wdB7PcaAH0veb9YpdLNEK/XZ1Hhq/JdpV4Fxj/JR7757I+v87UIEh+qtOGAyImM7NC
 qvUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=DLY9nzFQ
Subject: [Buildroot] [PATCH] package/mbedtls: security bump to 2.28.9
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

fix CVE-2024-45157

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 5466b0e7d..9de7f731d 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.8:
-sha256  241c68402cef653e586be3ce28d57da24598eb0df13fcdea9d99bfce58717132  mbedtls-2.28.8.tar.bz2
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.9:
+sha256  e85ea97aaf78dd6c0a5ba2e54dd5932ffa15f39abfc189c26beef7684630c02b  mbedtls-2.28.9.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9757b8b08..2faa6dff5 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.8
-MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
+MBEDTLS_VERSION = 2.28.9
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
