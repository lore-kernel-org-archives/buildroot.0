Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87A6D5E379
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A456059E;
	Sat,  9 Nov 2024 18:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bl5k9n6e7dTK; Sat,  9 Nov 2024 18:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C2B605BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C2B605BB;
	Sat,  9 Nov 2024 18:59:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA93FD8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97272605BB
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy8qBl3LalAM for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A98160593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A98160593
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A98160593
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:59:16 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-83aff992087so108721039f.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 10:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731178755; x=1731783555;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WrqKDfxX74sictYqUCP1RfRsa5/lDbjNNx8Ne34re+Q=;
 b=jzBhxJLNdCZ2xKqyr/sm3Nb6D7G+Si/3VKKb/HjSmqg2cSLmdpkdshkBQiy4rss1DB
 m3J5qDoqyyPtFqFE8hFoyBMYIN18Lyp8UekZefOP76cVc0Rn1ZJVgWz8MNGPAy8I3tai
 L0U0dZ4obCxYAMGnv9LGGnXB9QAfjGLZN+h8wyMyq6EgiT7nNOUzniWVmbEXb5Yi8qug
 QIg0EoRgVBUPXlub/XbbZoxa32abUc804RGMNNGp3ZvRhT1REITWrVhocSZR/0pQxKmf
 eU419dqXSSJxOOMnuMraRttYHudQE+Xi5/2Bc9jtgunJgu8uZqjyofXZGaMQKV2w+xuD
 FSxg==
X-Gm-Message-State: AOJu0YylefHgQeBYb+EH8dAcptG14HBTrLjTzBeEOMAocVQlD9ahhHj9
 WsFPuTbHd0OizFDLObtDAdvrwtTsg8+0tc5j+BnqoAL9mkEsc/AZd/w4Yg==
X-Google-Smtp-Source: AGHT+IFJBsoeLPel7um7ZtMkMDdwkrOtaecPDTV2dphLCaJO/+0zmBGnfwb6pWTmgS/DyE0G/Cllvw==
X-Received: by 2002:a05:6e02:1748:b0:3a6:ca22:7b2d with SMTP id
 e9e14a558f8ab-3a6f19c1cc3mr68204585ab.13.1731178755332; 
 Sat, 09 Nov 2024 10:59:15 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9842ea7sm4624705ab.34.2024.11.09.10.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 10:59:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 11:59:13 -0700
Message-Id: <20241109185913.773912-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731178755; x=1731783555; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WrqKDfxX74sictYqUCP1RfRsa5/lDbjNNx8Ne34re+Q=;
 b=FYOzZZ8Nifr/plJ4eCQf1JLtm3GHeo+9eMypsgQWalK+bI8tXSr/ULvrkriMwNn18t
 QpN/oFOpRoVD/hlgt37zPTC4w1P7T8RpREzCfNfPOGxKKhKw0/IvDNFUzhI6pwbEnMiH
 bGaIfxo7DN5LxZUAk3QcgXVGL80ubbuJr0MXacmL3X7nvjOSV2FQp6SB4wMMaw5PDkNu
 deXiwU1t9o1Bw695f6UIjrERbGnFEbRXEVysIJRGeHh9f93nfWmL7J3Zeu83+e1/Fqil
 sgApUF0U7s/giRJtkPMsJD7fX8TbHACvgNBnozL/49UuMnYftJx9H7d5zOHSPnKrlqmW
 V4AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FYOzZZ8N
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 1.5.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 4 ++--
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 1736572710..30043f1b95 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  4fc3708430d818df6d6cf3543b01d5d6  pysmi-1.5.6.tar.gz
-sha256  5b25825a5b4a566c42615c7b80547834dd32be394bf0c0504f56676843f96749  pysmi-1.5.6.tar.gz
+md5  187efbaa8ebb5d6d880906bab0116ef8  pysmi-1.5.9.tar.gz
+sha256  f6dfda838e3cba133169f1ff57f71a2841815d43db2e5c619b6e5db3b8560707  pysmi-1.5.9.tar.gz
 # Locally computed sha256 checksums
 sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 6758b4e807..454cd11447 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.6
+PYTHON_PYSMI_VERSION = 1.5.9
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a3/a1/b43edf8fd80c550782c9f0daa499c7d3013d31ff924405a7f96c9cdaa5d2
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/be/b0/19085322fc24f6b4a7bbc151643641c391b8b8d9aa4fd0e40d8178b2a5f5
 PYTHON_PYSMI_SETUP_TYPE = poetry
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
