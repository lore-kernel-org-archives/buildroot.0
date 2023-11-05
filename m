Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AA7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE52361042;
	Sun,  5 Nov 2023 09:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE52361042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bx7ApLpfohyp; Sun,  5 Nov 2023 09:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D98860FF7;
	Sun,  5 Nov 2023 09:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D98860FF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFCB1BF578
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 625B2404DB
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625B2404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdjH58rZLSTD for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:25:02 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05AE3400A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05AE3400A6
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a68d1698adso91853839f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699176300; x=1699781100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=et46/AZfvgaoCt9iMcvD0Kb1GxURfwNmU/qyqjCg83g=;
 b=B+HKNr+9gwSwvII/urSBLKfdHsuziZ/nr+vJPafeUz09N5lhXbjl+V/2utzj82a3/Q
 nzuSW2x6YE3WXITFbQR+YuEIjQ+XXxCHjMFjg2wLN8JKhubCWmyHRcjL6XeZ4L0Pu+AW
 4Soe+fFi4KlS+kFbOjRgnyrtyX1MTbYoGbo/1PiLAX5noEpyoVUkNNxAIphNfVcXHZzi
 t1I2o5x6zLUj4+/+BbtqPr6mI9RjUR7h+P8c4f/8sKe+fiTpjhEEuD3HTcqEAGykERF1
 b8SdA5bMjkbnNXe53k5o+9Xn+pjiMyKWQdH6Kf1YXRSMEkEC/ukHcnGKwBqXyjnVRPTu
 kVkg==
X-Gm-Message-State: AOJu0YzG1MAUpLOftAZwcgxnAeZUYoCYW0+9KZfydOUV0fq9F81Nmiua
 qInt0RKJ+Ndc2foeLOEjSH5HbyMHotVDnw==
X-Google-Smtp-Source: AGHT+IEmZGPvghhp1eNeaRGdtoZ9g3TggtE3EkwjqaCtSogxUduPHoIYPNcF5+8xIuMz6b8kx8aISA==
X-Received: by 2002:a05:6602:341b:b0:795:d33:861f with SMTP id
 n27-20020a056602341b00b007950d33861fmr7737478ioz.6.1699176300538; 
 Sun, 05 Nov 2023 01:25:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 i17-20020a02b691000000b0042b3e2e5ca1sm1560774jam.122.2023.11.05.01.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:25:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 02:24:58 -0700
Message-Id: <20231105092458.2935993-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699176300; x=1699781100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=et46/AZfvgaoCt9iMcvD0Kb1GxURfwNmU/qyqjCg83g=;
 b=Y4uF+4ntExVd1cEOXoBw4956FkhPGS868zG78LL2Dg9Qt9AcdJE6kQ9PbpKY2t5Zar
 8Evi72uEt6CF3w9gVLyGTSGZxSGidXPHLhNB/W6Ga1CpvFH187NCP/EFW9lBIMMLd8Rj
 vR/bpyM54LPZGktTK0A0g70iZAVAvxaXfT7/wW4iD1C+DTfbJ9kmXs4YmmGt3fUUjD5H
 syt1/qazJi9LOckyCE0VvGinv6TgPb59u8XTDSAqbC7IhVRBhroS9sdpuXjzuC5bZgh/
 Cs0zxr8W1sGNA8JBZDU8ht95AQNmIgtvkICctw6GtvJD7nFLn0e0soLcc1xxTQYqqSqT
 xApg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y4uF+4nt
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.12.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from generic pep517 infrastructure to maturin infrastructure.

Verified license is still MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rpds-py/python-rpds-py.hash |  4 ++--
 package/python-rpds-py/python-rpds-py.mk   | 14 +++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index e42dfbd948..b04aa210d3 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  3b1087c3c7d55b8730dfaa539147646292074819295812267832ce5b64a0034c  rpds_py-0.9.2.tar.gz
+sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8bcb72c82ea8ae74802293c41d93ad7d51434001b0ae45a603a5af0f507aee0a  LICENSE
+sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 2b5530f237..6f71d02047 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.9.2
+PYTHON_RPDS_PY_VERSION = 0.12.0
 PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/da/3c/fa2701bfc5d67f4a23f1f0f4347284c51801e9dbc24f916231c2446647df
-PYTHON_RPDS_PY_SETUP_TYPE = pep517
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
+PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
-PYTHON_RPDS_PY_DEPENDENCIES = host-python-maturin
-PYTHON_RPDS_PY_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_RPDS_PY_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_RPDS_PY_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_RPDS_PY_DL_ENV = $(PKG_CARGO_ENV)
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
