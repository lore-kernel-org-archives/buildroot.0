Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E22C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBCE40B37;
	Thu, 29 Aug 2024 14:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKskzYmz-iGw; Thu, 29 Aug 2024 14:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A27BC41A08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A27BC41A08;
	Thu, 29 Aug 2024 14:50:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 562AD1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43AF44016D
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCPmHIK5u0kg for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32C5840132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C5840132
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32C5840132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37196229343so524450f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943024; x=1725547824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+C+JufP7byIupoTUNHTSx48LWpx8sefThxRqsETkUCg=;
 b=XRPr4APluqlEvcr4OEcX2LhRB7lz4R82pPeDv+l9AJpfm0AfjtnAM29chfywjghA3v
 UMtavuPwtDNrf/h8B/IW9xVW8qK/GiRIkQIroVzlQwvvhhjAu5BjA0To+wUX4VLK1k50
 q0Ow3XOqew4jjJUsYAyuej6i8p2XhU6Qcn9t2FNBtT31UHl0C+4C29qfHSZyWh7Piobp
 xK+n4+JvsTrJT9skfagvoImDTRSYsc/oJSvYmlOXLbhWkl/mznQSEXFECrUXu6ENKAH/
 JbJxbbghcmsaRktxsCm+UoiHtsnz/9GLWGyzUfwPYiVLUepZlEtrMZ2bXO6vphyizH1V
 4ZCg==
X-Gm-Message-State: AOJu0Yy6QSgQi66uLH3YBROnRsO3w7fkAREHYornNLGRBzFjePGLjKaL
 nhKoj3BeBRZK8blyYZG1oxArgHRR+fGIRD3bGaBySnZEbBuzO/OHGEXVEQ==
X-Google-Smtp-Source: AGHT+IEwD8bp1PD6lMu/NaSRI2eFY4h4bKxVa/uzQ8NvmjsPIk0ShIu2hBisuqGfjQ27EHZAw9jEzw==
X-Received: by 2002:a05:600c:4512:b0:426:6320:226a with SMTP id
 5b1f17b1804b1-42bb02efd5cmr25359535e9.15.1724943023833; 
 Thu, 29 Aug 2024 07:50:23 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:23 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:23 +0200
Message-Id: <20240829144940.209964-8-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943024; x=1725547824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+C+JufP7byIupoTUNHTSx48LWpx8sefThxRqsETkUCg=;
 b=l78TGzZv4Osx2oLQndRPn4woeoWAH9zBOZz670X94nZFT0JYaGbuDGojRdhNcSyFAm
 qg0/yxYaPe5r7ZFW+yxXisIGYcJIGkWWRAO2D9pqop/fo5Y3swcB7++XfoAR5oqKrGei
 sRb+uiNneB5O5jjhzJkTvJFmChkX/ozRzjNJ/VQsRm40S4GKQ7LVgVth7QYTNd1iIcjR
 x5MTduLhV/s5KVUVTgQVilYkETOO7TDI/FZVN8sp/1Xw12zQQYgfQNDKWbloNglO1835
 uo+gg6E80TvDeQ4E2yfNYvEFX1dVksQwUJsTP2Bojri5Y5rvFfzT4VrnhgDXFDyKyps8
 5ilQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l78TGzZv
Subject: [Buildroot] [PATCH v2 07/23] package/erlang-p1-utils: bump version
 to 1.0.26
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index aa8d25bfa6..7f5d213693 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c62f93ab5ea8d9251d9acda2abf576352d50f4a3299972549180a5387656746a  erlang-p1-utils-1.0.25.tar.gz
+sha256  bf00dced9f892ec5972c0ff4f9861b391cbffe1a763c73dcfa622c500a1cc55b  erlang-p1-utils-1.0.26.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 8b00ee1462..fd9a8f1684 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.25
+ERLANG_P1_UTILS_VERSION = 1.0.26
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
