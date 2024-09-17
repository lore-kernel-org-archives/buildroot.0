Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400B1CAC594
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC501610E9;
	Tue, 17 Sep 2024 18:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j_sH_NRnYkJ; Tue, 17 Sep 2024 18:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF94F61114
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF94F61114;
	Tue, 17 Sep 2024 18:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7B371BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D6C403F8
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAu_1Fe_YWQP for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:11:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7479E40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7479E40139
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7479E40139
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:11:15 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a08489f757so17960035ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726596674; x=1727201474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srEtiRZvX64ziliqJfJT+Ioz9MF5YZmQ5UAmniTWCFQ=;
 b=EHeWRVsLSvCPrTCZTX455Pk5JzuAywtDLisP39TAluu2D3J+j1U9uHQSJ7M/EZBfnl
 8qo/5sKFXgtJ3VZTZeSN1pAb7SDYukta9dxPvufbk0EWVSZyuw4SfAhzPH1XLP9sOv2o
 bxhzK7wKavHMegP36aa0fySVtjaH/cYeuVWL9SALu7Rqwcp+mxzcbDuIuUYVKuKV+6jp
 VvcO6LwcSOxhAhckj9C+5PEohjabCQD5rk6V5iIgm5C497PkfohcJbIGoqZmlZND+ATR
 q99O0ylYbIcFFzn9yR8PAfMs5JnVLhwfem9NSbwAM2hgsHrQPf8WDlNkSWNNzZ/Fjp+j
 44YA==
X-Gm-Message-State: AOJu0YzDqSD8aJwh6BTRwoToMzssf08XuS5+cHyvlHV1tfQeSub1GycV
 e0A8HQV7oYeV2Y6OIUrVHmuiNGSQXGBNoKKPhB0dVRMz8mxQWspGgdaZ5g==
X-Google-Smtp-Source: AGHT+IG/2vEKrlE6AkFicrRjdbboHGUWFEzinSr8TUr4aq10e17+YwZBjDsNsloRGyzdQu5iiOvsng==
X-Received: by 2002:a05:6e02:1c4c:b0:375:acd3:31b3 with SMTP id
 e9e14a558f8ab-3a08461c41fmr168386165ab.5.1726596674042; 
 Tue, 17 Sep 2024 11:11:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e724desm23244725ab.62.2024.09.17.11.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:11:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:11:11 -0600
Message-Id: <20240917181111.3864545-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726596674; x=1727201474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=srEtiRZvX64ziliqJfJT+Ioz9MF5YZmQ5UAmniTWCFQ=;
 b=XIPqqI0zcAfPeM5K0rqzhoUlufaiBgPuENgOFwGbUEeCRZA3S4qwlmDM51q8Ole6l/
 Vu3oQW/1S6FAefuSqTqjynLEzJSK5rZcDaIH3cusqeCKlPrS+A93b7Jcqza2iolRxLBX
 brvOpl/DGZBrd3k1+YagHUgobpAeh66HWRG2+KCOXKNKVxP4TrIPsPyAngsAqJqc1sCh
 k68IMNknfI2BWf2SnAS7J9fZwNinU0qlYJhcE0fT7W8d6Dl5lukbga9+oScgjjItvvCJ
 PR8sy+b+ALboiIYJ4N00HR4LLK6HIWr+T1bzHEalaUkwgbBYvE4nexfsyNJbWpDN36sk
 Mm5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XIPqqI0z
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index c010097fc7..4ef98beaa0 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  30dbdd4ebd62a40b6f13a3c741bb215004778c17fd951d0ce5812a7c34476b09  python-orjson-3.9.10-cargo2.tar.gz
+sha256  cb462f63497889632807345b609fda0562888b0432b0764eeb1215901ae9f3d6  python-orjson-3.10.7-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index dd538acb0a..4e1b1e9629 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.9.10
+PYTHON_ORJSON_VERSION = 3.10.7
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/72/75/642688bf5d99131fe8cf603f4ef9f26e4b1c6ed8f7f5c7e6fb31def54fb7
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/9e/03/821c8197d0515e46ea19439f5c5d5fd9a9889f76800613cfac947b5d7845
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
