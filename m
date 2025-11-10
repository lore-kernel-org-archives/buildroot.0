Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5068BCCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFE760AA5;
	Mon, 10 Nov 2025 21:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Edbj0d4dttvN; Mon, 10 Nov 2025 21:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DEE060AA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DEE060AA8;
	Mon, 10 Nov 2025 21:41:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CF9E25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 21:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F420406C0
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 21:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOve0OuTkohH for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 21:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C24CB4052B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24CB4052B
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C24CB4052B
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 21:41:15 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso4185478b3a.3
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 13:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762810875; x=1763415675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGv7EmMBVJ2he5TmBB/oIB64G4fgGF2EZei4h7GPY4E=;
 b=ZeVnie0PyhIOfICKanHoaFm/Xmxq/2P5h4wcv6KH+HEaOMteLHhgrtQfTxdr7AGcs+
 sUJUjOiAUq4EAJtUzaYavloeWNc74Ahed3s3BHcoDIjcyzQPQzLZJ2xZHEvGECZPND/9
 YdQPNLSUucGwbiJvjhiq65J+q15wscdp8lqjZ4X0EILFxpsAabVq/3/iYdjNeuiZnRdI
 yOLjqu6qRq9yZxrcrXt3WSe0UzjhQg3oH5SvdCd5CnfqQEvkAXJdTsnVjWqchVCtyTd2
 I0drX/xI7zbVOp4YGrYFb42mz7mVHThoIW/04dfeo9dS1Fb5C1GwsCC3Mfg352s5Lc7P
 OXKA==
X-Gm-Message-State: AOJu0YzVH3gBJ4Lq/JAzqWoznIlS5chtbz89jOVU0qWII334xoWHFyPT
 uOW/NOQJRrRdCrPHQsigqvjMKRZP898k/3xVxv0grSQeWS5aWWklp8GJRWF9iMHq
X-Gm-Gg: ASbGnctIDsufswBoa6z+3s5nnNV/reFA62SSN/Z9ea11UU51Ujmbyn/eUYxE9G0ZR0w
 r4085PJC2HmzuOEjhoKPM+5OBpjdqSsEtUU6O1EHQWaX3p2D9dQI0QKPglY68N25FpOAVgeIQBd
 r2AfgFAO1RGXy9UiDKdiYxly8+QCimDAKrHskdeeUFmwzVR4iI3sG98DNWKcvbY4xg1EavGyPGf
 Q+Mc37c1aDcjbZC8d7atO2HLMmnYrWBkB5KQH8QsBoLr0yM6P3JkVjEfw4suXHqos8yeqmCzahM
 +JUh6PO/jVfg2kFu+I0qqj0TRZWZ3U0LqOYUdcIjYra21wSj/12REwWFpG94m5tFp6y00WorwhM
 nC6t42ghh77NpDv7uZKdGjpEkn89pK9/uO03twUR6/g4bit6PoYNG2UBnBWPRwDZhznEDjg0pFF
 GFamfNEfu2RGX4YQNuOPi5rA6eeefAUL2UZLb6PhoLgGDNsnvUauEMSVvJxbfRQ9epx9VOPA==
X-Google-Smtp-Source: AGHT+IFtjrqZwsP1Kt0zjmbi/i5xUi1ZDh85BZuFJlL+6oXNChcxzC2m4cmpY60vdC7/VEnLH+CexQ==
X-Received: by 2002:a05:6a21:6da3:b0:341:98b5:cdfa with SMTP id
 adf61e73a8af0-353a0b9f1c7mr13163286637.10.1762810874650; 
 Mon, 10 Nov 2025 13:41:14 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc17a688sm13030945b3a.40.2025.11.10.13.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 13:41:14 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 13:41:11 -0800
Message-Id: <20251110214111.5096-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762810875; x=1763415675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGv7EmMBVJ2he5TmBB/oIB64G4fgGF2EZei4h7GPY4E=;
 b=M36Yg6DNLvS5huvN4QDN/f6XDWyxg2AiBUJacnjxwmExS1ZZGJbKHrhi54IncDISNw
 zf4TFNgaaOQHNxwFm2RqJOtjO9TE5BeClLpEyUecQ6OCnaVyP3E042w1Nf75SiHKpgbs
 rn4gxaq3I73GY1PTB7tDybJ8hAIl15gT0Te2gu0b2te+yVKhh9boAkNUkhPTL3PYQPmO
 Ov+nyfHUJYeaSuq5r+FXYDoMt/giWnkqYHv+jaKfaoLLuTCXxAPZAmstRW/tS8y1HTZb
 sSkI0HPK0q/Itjva4YlmqSvk7w+NLkrHEUE41sQMc8XvkGDRcVc4woqg9BjNkI5yCcsq
 ABiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M36Yg6DN
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to 4.5.2
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

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.5.2

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index af46fbb11e..7ec9140957 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,5 +1,5 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.5.1/libxcrypt-4.5.1.tar.xz.sha256sum
-sha256  e9b46a62397c15372935f6a75dc3929c62161f2620be7b7f57f03d69102c1a86  libxcrypt-4.5.1.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.5.2/libxcrypt-4.5.2.tar.xz.sha256sum
+sha256  71513a31c01a428bccd5367a32fd95f115d6dac50fb5b60c779d5c7942aec071  libxcrypt-4.5.2.tar.xz
 
 # Locally calculated
 sha256  9144e66d8140feb84f0e4e344906ac425378896320032e0248567ef195cf0135  LICENSING
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index cb4924e0ff..ae7ecf5540 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.5.1
+LIBXCRYPT_VERSION = 4.5.2
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
