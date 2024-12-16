Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A414FE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 10:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129C44043D;
	Mon, 16 Dec 2024 10:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQYWFxDSgaFh; Mon, 16 Dec 2024 10:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF51B40562
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF51B40562;
	Mon, 16 Dec 2024 10:23:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D85CE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 504D281393
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpiClw3VlXQY for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 10:22:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1111081364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1111081364
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1111081364
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:22:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so640696566b.0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 02:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734344576; x=1734949376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fY5Rjs73AQWYZpEQe9gIVPddv+PXKAy+1ISFf1XCdfE=;
 b=pMS8ZWMqMuIDyMzx1d7BueBr8H9jnspgkF7dr8tYVnZhR9KcCnr+a/1IJDrEqftBR/
 tMxnIVBT81Omrw3QkzKiNFLAXvW0F7BY9MSV9K+tNJMNdO9YTw99FmnQuVwrQVUGXdS3
 y0aAAIdKjY43wzoYDReTxPXClNHqspGiKfmWV2UkeG5rpsoCoqLFY5Jmp2ifRr5v9/FF
 WyqdS/WARwdyUw7vHDE2GU4WS1A53a8T9TOe10MYrjLyLIi67Cf70kUNPcHGxg56muoK
 kW6D0CxOAG0cIIE0BtYEfGLkxQtEnLcTSoqupMPgGPsXC2aDUuLy828T9wVKUPg75BTs
 gK3A==
X-Gm-Message-State: AOJu0YzrB8EWht4YZ3OcYrczFFA+7XgfRXN71lV8KrGD+EgLtByS2mAk
 +1+jKNf9zAVCI06kY+FXO0JlXG4yJoMaqJtOlBnNysl3RRvqlMdb9dIdQA==
X-Gm-Gg: ASbGncsOfYY3rTnc3c0NyFVV+uA+v5ENhiMdigldK3ZmePPn85d+YXD6CCJgR/R9cu3
 Oc2EnOA6/SmBehoJlRMVKvBlDoKH1Kc1afgls41L3PLxDW4Rg7ykvCTgMdnezECbB2lUQxRVjeO
 8mBh+thkO0o5tsQCMnpBVIhocw4iBon3NoY2/QoeeXomsuQteSajRK8KHbIw7dS/xnHjJ9GWP7R
 YO4o0/QlMD1m/22Qw81DKE9m4nK5J0oBikuEty05C5+2Kdaz/RiTAwowyv1tVHuQ2KvOFJK03kZ
 NFwNM9EVrDsMKqKXjSDov8ztXMHl90FEc/EOtA==
X-Google-Smtp-Source: AGHT+IFJvwUKE364j6xXK0YWvJzknioJGZ3RiX01eEj7iGTCPMb41NmxYCgFDXY9Owx60jveJaWzGQ==
X-Received: by 2002:a17:906:3112:b0:aa6:82ea:69d6 with SMTP id
 a640c23a62f3a-aab77907a5fmr1118275766b.18.1734344575602; 
 Mon, 16 Dec 2024 02:22:55 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96359dddsm315112366b.117.2024.12.16.02.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 02:22:54 -0800 (PST)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 11:22:49 +0100
Message-Id: <20241216102249.282732-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734344576; x=1734949376; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fY5Rjs73AQWYZpEQe9gIVPddv+PXKAy+1ISFf1XCdfE=;
 b=mTe6XMY044s9xsB+k8fquGI1vQ4EeJvZOoZ2kB1oQbVZVLCpHu34osO56Y4V4B3aNT
 EeSLGenIyXHtGpTPDSm+nUlgqnOlRdVQSXNSo7DaTWwZSUayIe1fk3FcA6B/H4DwlYe2
 1t9ZiQ8B00Yq+VEIq/WhC7jQKYwL/g9FUbFajTBRMxH+Wq7ndOjwk7+Vre4/ToUQmfV0
 902ayQpEeu8ibHN1aLhYUvxX/hp/5PVqDpH//STArQnRrX+LgEGroeiX6NaoVQtLeELu
 7rOoOH7QC6db2QiO0t9yK2u17R6eL2NwZgOfwNB1LGhc7f6dQK0KHBfjI0VdAnJcCFuL
 J1Nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mTe6XMY0
Subject: [Buildroot] [PATCH v2] package/python-m2crypto: remove package
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
Changes v1 -> v2:
    - also remove the python-m2crypto entry from the DEVELOPERS file (Baruch Siach)

 Config.in.legacy                             |  7 +++++++
 DEVELOPERS                                   |  3 ---
 package/Config.in                            |  1 -
 package/python-m2crypto/Config.in            |  9 ---------
 package/python-m2crypto/python-m2crypto.hash |  5 -----
 package/python-m2crypto/python-m2crypto.mk   | 18 ------------------
 6 files changed, 7 insertions(+), 36 deletions(-)
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
diff --git a/DEVELOPERS b/DEVELOPERS
index 047dc4a88f..eabbc7eb20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1351,9 +1351,6 @@ F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_pybind.py
 F:	support/testing/tests/package/test_python_scipy.py
 
-N:	Gustavo Heinz <gustavo@gsthnz.com>
-F:	package/python-m2crypto/
-
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	board/terasic/de10nano_cyclone5/
 F:	configs/terasic_de10nano_cyclone5_defconfig
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
