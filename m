Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C28D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D57F280EBE;
	Sat, 26 Oct 2024 21:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U66MU2R4Ovlt; Sat, 26 Oct 2024 21:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4B0E812E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B0E812E7;
	Sat, 26 Oct 2024 21:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B969D5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4AD260824
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcmDlUrzfme0 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8315607EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8315607EC
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8315607EC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:22:42 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a4d1bb4605so11297175ab.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729977761; x=1730582561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDJueGlTR325E3o63tZ/C8Vit0UzT3y1nVKi30WowKU=;
 b=XMpz1SmdDiPByvrCfkEtyKQUi2Ae66YjPz3TqBhGKfnUwzAczFje1GwRaPc8PcLfzA
 pT1d6UYqfZKQ4bWIDxgVE+3hqvEwnZqHsQEPklrRBUdR7TGnB0g1tDca7VuSk5JSnd0D
 itRdVljfm+fIf5tzzjNTBOtx++bt97aq8BfuDy1eP+f/JptDzivNDbpVD++Z9OGyAePx
 Py6pfTCrbRkzVfQ38AUTRLar3Ttv0q6ix6k9L6Z34RSJwfDcz3UnydsKySxXBQjkQpiG
 5eAby2+hhIlGydQf/FSMiKCMX5+zUAW84qp0D0filiQfCjyxHuUGtD8IdwJneaMrsCYI
 +1fg==
X-Gm-Message-State: AOJu0YyBWacn0qXoVJO/ktop6m3fdnFUfiLnAvqqvLa4OM2Ou/hdw6aX
 Lbuk/Mo5Z0H99gcpU2UJ0ABmbZu3X7z/1zDUxBASc1IRy5csuhHh2M7JBA==
X-Google-Smtp-Source: AGHT+IHzCYuO1uzpgCc/A7YRWd9jaUfwEhgRBT9SCqnbJFCk/39N0HEzC/7Wzifw3eSVze2tMTdSJw==
X-Received: by 2002:a05:6e02:1d01:b0:3a0:9829:100b with SMTP id
 e9e14a558f8ab-3a4ed2fcbc6mr26067105ab.21.1729977761465; 
 Sat, 26 Oct 2024 14:22:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6dfc9c2sm8722885ab.48.2024.10.26.14.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 14:22:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:22:39 -0600
Message-Id: <20241026212239.3729635-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729977761; x=1730582561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rDJueGlTR325E3o63tZ/C8Vit0UzT3y1nVKi30WowKU=;
 b=erv4V7+DYKda99YXoPq5MjWRwM2VPUjKvSTjLGLkgkgZIRChrCnwAeUkYmSHu8GuNN
 a7aqFMG+okeCbAKStCeEKvRVV06uHFj3C4gWSQX7sh4TqpPyU70NSPP2XjfTYiBuPa7I
 hU0HqIZcuyjb7wYwXb3SRUYwWsBJE9Shopx01d6A9qd5mIUAFgIcVjnlZZYMBJkdxPdM
 l/NfIfpQPVx8LWJis6NjYiM8yJrghozcFmaVLNrrpzMQVuxMReF0ArQD17At6xsjnPoC
 39J6zrFgq7spxoN5+TeY/rebmGe8HcWmntubUPdh1stAAhP0BNEnOGrsG95GOIjTKsAx
 qy4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=erv4V7+D
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-cffi dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/Config.in          | 1 -
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 5 ++---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
index 420e023b0a..258024032d 100644
--- a/package/python-orjson/Config.in
+++ b/package/python-orjson/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_ORJSON
 	bool "python-orjson"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  orjson is a fast, correct JSON library for Python. It
 	  benchmarks as the fastest Python library for JSON and is more
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 4ef98beaa0..b48eec080d 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  cb462f63497889632807345b609fda0562888b0432b0764eeb1215901ae9f3d6  python-orjson-3.10.7-cargo2.tar.gz
+sha256  48e12af76f92259e429af9d830bb222d1262e8cddedc07aa5208b589b314fae9  python-orjson-3.10.10-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 4e1b1e9629..60e6078132 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.7
+PYTHON_ORJSON_VERSION = 3.10.10
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/9e/03/821c8197d0515e46ea19439f5c5d5fd9a9889f76800613cfac947b5d7845
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/80/44/d36e86b33fc84f224b5f2cdf525adf3b8f9f475753e721c402b1ddef731e
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
