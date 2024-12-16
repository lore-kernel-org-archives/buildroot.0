Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA25E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 08:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5DF84176;
	Mon, 16 Dec 2024 08:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R543Ow5Kgcs1; Mon, 16 Dec 2024 08:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B8EC8417F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B8EC8417F;
	Mon, 16 Dec 2024 08:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D732C1
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 08:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D1E540876
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 08:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4NcCCPYewM5 for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 08:12:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9749B40848
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9749B40848
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9749B40848
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 08:12:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so578020966b.1
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 00:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734336726; x=1734941526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmK0z7lBswQpi6g6Ai6HCbHebCn0jGYPazW0xXRYayM=;
 b=eTF1KbaP9M/wBKU6naH/nKevEPc443mglhUpjeECQ8togjt+2zgOwl8dCj6+/jm9S/
 I+0vK30kWeu2ZSepXVYAz6eO1Grdu9w3IZtwOWrRj5M2jeeHTqyEQTvY8heOamBHUQUl
 dMQELcfSCVxIGx8o+4T2DZ3beqWwzZgpQ3kSoL7Iqmm+HbbySNULYodn8QdVd5S1R1J0
 v2S89z8VYlNd7/qFGet9s3W4BMY2vuRbAgpN/4qESvzeja30QasqB7cqIu8V0a4C79UQ
 rOQjjBsMc3Lo4zB8zBd/4+Rm5oUbynIDqua2IaKF1YsC/9AjTrmX1Z1VuNFnWVZlaGws
 wJ2Q==
X-Gm-Message-State: AOJu0Yy+p0ZqQqV9xvQD92uoPt37aQZ6HZ7NAEqavSwmWZ0s89E9kcZM
 OjUYknM/lBJgx4i5+oIxDazek1wtkHiwzNHgrobNJM34p3bUdQehdL3MVA==
X-Gm-Gg: ASbGncvhljyGV+XeY45mTdTe1QJckoseUnX6ffCPba/MsFvR0UMfq3xd8x8n6Yc3UHP
 AIfpv7CVia3bwKyU6masYLRBHQ4FPNwMuB/8Du5/gdRdMIbWXAoh4mmnhHahdrny3YxED4fhx/N
 OGwC3WUqO+kd8qdggv9F27V5dwPMAM0GyP0GPlweGY1gCJP/BlZZiCat1cTRDuIbcwqrFF5ZFJ/
 gmUI4CmFzUwTEQBnrAg1GRfjmI/Oearb2FYP+Ws/xvGRiw+u3XaJ4xqs36F2ae+HVVpXnid5KwT
 WNd4UugJImHOo1KrulJ8PD7JyiLY8MNgwMpU/Q==
X-Google-Smtp-Source: AGHT+IHDF+NxZjUw72TQx3Ng+O+yawFJFP7ve/Im6k16lfwcBc2cEcrsIy5nx+hCUhfeimkuvXq5Gg==
X-Received: by 2002:a17:907:608f:b0:aa5:391e:cadf with SMTP id
 a640c23a62f3a-aab77e9e61amr1089925566b.42.1734336725220; 
 Mon, 16 Dec 2024 00:12:05 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96068933sm301294766b.79.2024.12.16.00.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:12:04 -0800 (PST)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 09:11:58 +0100
Message-Id: <20241216081158.250767-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734336726; x=1734941526; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pmK0z7lBswQpi6g6Ai6HCbHebCn0jGYPazW0xXRYayM=;
 b=T//8Ly2A7WLZQ6WFhtzXjkUUPKXwJwWcFNNG/okyDzYC1Exw0ag6Yh5pkmx2p6qGYv
 TGMayszZggRlILqLoZfLFDWvn55BGDS+M4SHgRT8eUCh0EYQVZfaeDkHHN4kuZKQHWSZ
 zy8DgCScz4ynRctOaq8dEcMMHEQHUFcJf1WnLev3ehLZMSMefN9uvNAwQhaTK8yeIXQZ
 MdZwHkfdfWb3rcDBRoWLs6yqVjg1bTYvnKmnd+aWnT3A6eCgZI7FFFc2B7uSBBE7GnD5
 qJvF55oZWXUZbFFXctV4ePYXBeCoj47WRg/bmSQ/Teqslq4IEYLMPFzFgg9fnVI6Mux5
 nJZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T//8Ly2A
Subject: [Buildroot] [PATCH] package/python-m2crypto: remove package
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

From: Yegor Yefremov <yegorslists@googlemail.com>

The python-m2crypto package was removed as it is in maintained
only mode and is not recommended for new projects.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                             |  7 +++++++
 package/Config.in                            |  1 -
 package/python-m2crypto/Config.in            |  9 ---------
 package/python-m2crypto/python-m2crypto.hash |  5 -----
 package/python-m2crypto/python-m2crypto.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 package/python-m2crypto/Config.in
 delete mode 100644 package/python-m2crypto/python-m2crypto.hash
 delete mode 100644 package/python-m2crypto/python-m2crypto.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 066be19a75..2e6dfce5ea 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_PYTHON_M2CRYPTO
+	bool "python-m2crypto has been removed"
+	select BR2_LEGACY
+	help
+	  The python-m2crypto package was removed as it is in maintained
+	  only mode and is not recommended for new projects.
+
 config BR2_KERNEL_HEADERS_4_19
 	bool "kernel headers version 4.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5fa344c321..1541c85e53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1206,7 +1206,6 @@ menu "External python modules"
 	source "package/python-logbook/Config.in"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
-	source "package/python-m2crypto/Config.in"
 	source "package/python-magic-wormhole/Config.in"
 	source "package/python-magic-wormhole-mailbox-server/Config.in"
 	source "package/python-magic-wormhole-transit-relay/Config.in"
diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
deleted file mode 100644
index af710d5351..0000000000
--- a/package/python-m2crypto/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_M2CRYPTO
-	bool "python-m2crypto"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON3_SSL # runtime
-	help
-	  M2Crypto: A Python crypto and SSL toolkit.
-
-	  https://gitlab.com/m2crypto/m2crypto
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
deleted file mode 100644
index 98307af0cf..0000000000
--- a/package/python-m2crypto/python-m2crypto.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  75c50150857eb60e4f447b04d13ff507  m2crypto-0.43.0.tar.gz
-sha256  6c2c1c7bb0e8aa768f7ca803da7dbc2666d4003b26bd7adf70233afc59d8cf33  m2crypto-0.43.0.tar.gz
-# Locally computed sha256 checksums
-sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
deleted file mode 100644
index b5142c9bb2..0000000000
--- a/package/python-m2crypto/python-m2crypto.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python-m2crypto
-#
-################################################################################
-
-PYTHON_M2CRYPTO_VERSION = 0.43.0
-PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/1b/4771f0ecfdd9df6752ae5d0cf040545bb3cfe8a504af87e05c9ac4a6a499
-PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
-PYTHON_M2CRYPTO_LICENSE = MIT
-PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
-PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
-PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
-PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_ENV = OPENSSL_PATH="$(STAGING_DIR)/usr"
-
-$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
