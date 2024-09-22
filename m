Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0401CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8075040223;
	Sun, 22 Sep 2024 08:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Km0zQDoI2cdy; Sun, 22 Sep 2024 08:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A7D40532
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A7D40532;
	Sun, 22 Sep 2024 08:56:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 096A11BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0536D40165
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JtcrXAMyNxFR for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:56:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D07E7400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07E7400D8
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D07E7400D8
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:56:40 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82aac438539so154148639f.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726995399; x=1727600199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/rFq6FYeAlKxUtD06PPF7Zi0iBgJYlQ90WF9HOuK5U=;
 b=avp9BeEpqV5Nu+I5dpvwRhMPt1meajICMtRHKz5gNnZeUvsAaBRa8Qerz+GdFqk3Ix
 xMsJNfZH0peDiRTiHaW4c5PxvXfNjYvUhELpX4xB8Vk8rVQr7eQdtee3EKRIhe4JDZOc
 p9tv4w4elynDIuGJqtk0eOBzGoPwRS8d0/+8gf2OteLztnXxG7PA85jNVMXomxfNW22t
 L+oxK6nzP6+AfJN3UnKdNKvyAq/bOZdMMpBDiLN6i/DCOYLe8KHvGBzjxqVxdr/4H+co
 sf/kVJvloN4YGECTzZkgInOPnLZP3XMM1ufVzbZooPuNwgrCxuUbdF1GwgoqWsYKILo7
 zb8Q==
X-Gm-Message-State: AOJu0Yx0SEvA5Y0dXUpKES9RiJAR7u2KSeA/ZtFEThO94Frt5pSByPMi
 mmr5emxn7sRe27BhjZZ9fWXnWUvLNn6aQ0Qicq3zda4+PaHHHs/d6EzjMA==
X-Google-Smtp-Source: AGHT+IHMwBYKDKUI9cJYzQJykE+g8uoOhEQujvv7eCQ7w8Mn6RvakvYIVTxU9I3+Q03KV0RPTXUI7w==
X-Received: by 2002:a05:6602:1605:b0:82d:314:23c0 with SMTP id
 ca18e2360f4ac-83209d01de9mr789677139f.6.1726995399453; 
 Sun, 22 Sep 2024 01:56:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4928c3e9sm484653039f.12.2024.09.22.01.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:56:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:56:37 -0600
Message-Id: <20240922085637.1020377-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726995399; x=1727600199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O/rFq6FYeAlKxUtD06PPF7Zi0iBgJYlQ90WF9HOuK5U=;
 b=QzrHig3fLl0vW2eR2073skmdIfxljb9iQks2G4nGtTx8OncIf7NxFHzLbfVrVfqnPK
 A4IQXAg93ahf1zAwEZimtLTHoDCgSlA6M0fwKeK64J/aHmrG2PEqd0t0USOKQaMF2ZE/
 87qR4k+IA5SSXrVm6BZNQiUcLDoc4V8A3K39lonmv9tvRMeqfgJw19b1RCno0MrHxipH
 0s2SPmWld7zxPhms+UnXrMaNcyTwHlaALmVmK77CycmdRZvh0TgPKm0N9HVOpuGDIMWq
 KPnxyZq8fUdig/DgaH6utg0lgNrupbj1/P6Y2AfTeSrN6t+I38LEZoSmzyd03uzGaJzh
 xE7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QzrHig3f
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.20.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 7a52c94417..966a9b3a14 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  39052bc872e39093248cc1841b0037ca  google_api_core-2.19.2.tar.gz
-sha256  ca07de7e8aa1c98a8bfca9321890ad2340ef7f2eb136e558cee68f24b94b0a8f  google_api_core-2.19.2.tar.gz
+md5  72fec88a65cd809c31c35f4284a72274  google_api_core-2.20.0.tar.gz
+sha256  f74dff1889ba291a4b76c5079df0711810e2d9da81abfdc99957bc961c1eb28f  google_api_core-2.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index b2bf049624..18669a71e4 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.19.2
+PYTHON_GOOGLE_API_CORE_VERSION = 2.20.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/78/14/99c2514b3ccc5aad1e0776f0ae8295c9f7153aead4f41d07dd126cecdc14
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/c8/5c/31c1742a53b79c8a0c4757b5fae2e8ab9c519cbd7b98c587d4294e1d2d16
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
