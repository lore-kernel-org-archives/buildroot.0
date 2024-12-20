Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B938E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 18:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFAD283AAD;
	Fri, 20 Dec 2024 18:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeK-IJZiNrjE; Fri, 20 Dec 2024 18:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B0583AB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B0583AB1;
	Fri, 20 Dec 2024 18:58:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D33920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 18:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A52B683AB1
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 18:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6blNij217ZPW for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 18:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 956FB83AAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956FB83AAD
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 956FB83AAD
 for <buildroot@busybox.net>; Fri, 20 Dec 2024 18:58:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so1493744f8f.1
 for <buildroot@busybox.net>; Fri, 20 Dec 2024 10:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734721105; x=1735325905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wYV5nT/VMnld0CKVAAn1k0iU5GSz0siKH119m5U1EA=;
 b=qFwsp+3H6Zd3LOwCRzKVJfNr75h2wio8Xr3RCCSWVMEFu7CCdcVX2XsKmQ8HA13VXW
 LIn2w8uyizURl212dk+wSyQy9n5AROphR8AFKtAhWj2U8rU/Ec7AN4EWJ3U+1uegojw6
 YnzJj4s4ni6ZhmxBVqAFcTPYgs+MsjSCOgqzGzspgwM8oG4T4oqTamd/Oh1YY5AlTduB
 bBhWxbR6u2goz4ROJpY4SzEGK/KCez187aYRs70VTmDjDstN9pTa+TgfzOnpVFx0RTCk
 RXeaVrWi5ltc5VYQcbrCc3DhZM7DCJNvN6jdRRhWWnniQqr26LMvm7OpHqFjjh7S5aIf
 FDdQ==
X-Gm-Message-State: AOJu0Ywu+vYF6svMjKBul3uL6IRJhz8OzOFAjzjokTjxTdkW1bqMDdCm
 DPzkWCelGh3rXMqOpt5bsdH3zd9UwO8ye2wROFtSyH78m2BzTw+KgnhKfg8wRIAfBzEqMea/Piv
 VQA==
X-Gm-Gg: ASbGncvE6T/9tfNSNiUlpHcRcijCgvqI/cfWl6DqV8VzW1QlHBEAEQfz4meChDU92uN
 mLQKpu18ZLWxlRZMJgE0il1UkJKoe2yf8ml7PW/qnEW3fGRlhwqB8B3bO1Shycp252dr3UJ9tPR
 DNmvX60UhmiH8wxnN2xJIlwVRDfkVfulARBEaQqw9yU9khfI9Qz1XIeDVxTmkUxQrYQvEDXEkdU
 JcXeD8YTd3CcgcOAPpVIFbl5LzLiYG69WTc3q7jMh+sK/Lll67aJ0vrsDwLKZwmMu66Ik4p8ZEg
 bMTTw84lKnqmW4U=
X-Google-Smtp-Source: AGHT+IEg3gdQB3x+FoX+/wh8UoR+s9PpqDSipH3qE1Cm974FLilztJ7C7hfSFnqsIVB9ioF2F80PSA==
X-Received: by 2002:a05:6000:70a:b0:386:459f:67e0 with SMTP id
 ffacd0b85a97d-38a221f12a0mr4574963f8f.21.1734721105210; 
 Fri, 20 Dec 2024 10:58:25 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8bb4bcsm4684823f8f.111.2024.12.20.10.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 10:58:24 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Dec 2024 19:58:20 +0100
Message-ID: <20241220185820.1252854-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1734721105; x=1735325905; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8wYV5nT/VMnld0CKVAAn1k0iU5GSz0siKH119m5U1EA=;
 b=hcWsqx211LZmMGXFqhY6VysWS5Mbf6fbUftUgGHjZ8fciNwsnzxTjZ408U0fM4BB50
 H/t5Ywok/w3hAlabTgIL93YaqVduUjC1JiygnfUbOUox7PXBg3DUYT6SEBE7Bcf4OxQR
 hQtiE1e6T6uRzrxKl6TD3vf42HExOOkk7AAQqgJ0xi1cUy3BLJ0DnQ4VdpXiZBK7ZrVS
 wxx5L1mtV7HgZYRE/k9Djwp+7NRLaA2TXL4P5/t1jn7M1vgjOU82PpqTMo/0Kc2S2011
 oQvRmyt+6j/5W0Zfn6QRD9xYOJ6aMkeE3sxMGwrN+7ZXtYF6cxO1mMrgpnWHSpdwvn/W
 /loQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=hcWsqx21
Subject: [Buildroot] [PATCH] package/libgpg-error: bump to version 1.51
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
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index be5202584..957f96edc 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  6790fc3d6e7bbd7576654b43971bbe15e953ccc4  libgpg-error-1.50.tar.bz2
-sha256  69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a  libgpg-error-1.50.tar.bz2
+sha1  0a9386ff70a5d1f771771bf0b8db2b956e292f13  libgpg-error-1.51.tar.bz2
+sha256  be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2  libgpg-error-1.51.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 8dff6a612..3f327e305 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.50
+LIBGPG_ERROR_VERSION = 1.51
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
