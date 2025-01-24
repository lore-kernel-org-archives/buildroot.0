Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAAFC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 276FC60ADB;
	Fri, 24 Jan 2025 21:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2kwANEMAfq3; Fri, 24 Jan 2025 21:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28C1C60B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C1C60B04;
	Fri, 24 Jan 2025 21:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56C30941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 371AB820C6
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcH2WGlAIHc9 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 564BC820C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564BC820C2
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 564BC820C2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:18:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so82280339f.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737753530; x=1738358330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yN26QMCl0yBRPt9t2+qRfVPorQwhQh5jHuOwgPRPCcY=;
 b=OCfWS+QiWETpwuIdUbfkcWbQHoIOne1QZ5++yjJrXng8uCC/pWN/HvO3VMNaZxxFWk
 ao+xmGWnxfAe25cQznDO93KNqTRF7iR0mt89CeDtJX3qBB4+vjP5aHD7l7rxn4Zh3VOY
 CbbpvgGYw/qwUPepwsK6J08wH8OOLkL1pQSZ8Et63rIMqj1+llJsVQFgzslHRNsHGB1R
 7R7kaKRj8kTrvb7/JebwFd/CUYnLdRZXfgHOZtGZ+085RyDyepUz6f9vcw3Qj5Ne+S62
 yin1FM5wHoK672wP4CoSju1bHp+7qikIBInMb9eCmLe/1mW8cArM449pANv3wL2uZx6U
 T+CQ==
X-Gm-Message-State: AOJu0YzZOtBcYxmb8snZgphGeWFCGKOQmbMRZnqOqBBWWhCzfGInWxR6
 vGvLNEdN9OQyOi1tU1uB4jV2mxDougGvkFRWARldSaF52JKBbiG0VcwAwnDW
X-Gm-Gg: ASbGncsIfIo2W7GYH7udg4pRrMViAveJfbwfNLoWt1sHN/P+g3YpCjzAZSEFeXDorIK
 8GAYcI+y261XajVJxzQKraHvwEuvmRMUzhim9VNmyXwkzOr8zwKHmbOzGMKaVO19eSLwR1uzwdf
 soDQXi46mnNHBsne7GauaH4vAuZWx7o+97y/xJXnJCMdPln/y+nw4OCNt2aRpZ4WAa5xpmHHD7h
 4aLnA9/UFTSaXJkgnbIg1gpyFFC2LQYK82REyCNk/cmgx2I8bc5Y7CuiyiHn28mNVJmHG4fhKxi
 JWwcOwfulFDXIVmxhG9Vh5UhX9SRbNWWkbB7D3BP7zKkQYzsMikFXBU=
X-Google-Smtp-Source: AGHT+IFWQvAevB5T3rCn0vgRBBrejrzV2zo8kcxEgGPrSk0+kQvqb1qJT4z2oIyNYJgnpHGaKGmbPw==
X-Received: by 2002:a05:6602:6081:b0:841:ab27:acac with SMTP id
 ca18e2360f4ac-8521e1a91d5mr431500039f.2.1737753530007; 
 Fri, 24 Jan 2025 13:18:50 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db85906sm829801173.106.2025.01.24.13.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:18:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:18:48 -0700
Message-Id: <20250124211848.3876263-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737753530; x=1738358330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yN26QMCl0yBRPt9t2+qRfVPorQwhQh5jHuOwgPRPCcY=;
 b=OLgyejewcsCqjIS6absLwvrgOzA1Bgei/wuf4Y8F85W0tIHKu1WrBGMmwf5MXT+b9q
 5Sfe3f7BGDvdTA4/L+IekgsnYjTNvsAbiCOsRydM5EJIklJZZSpOBKH1qNyAzsmEibmE
 tJo5mk3tJR8XJO33/qgc2qp5iu3Aur/n66dmmlAPzJ2jlAiIKS6Yucr+vxWJC8SX2TPY
 lGhyQJPv/+d5XLwRXOCN2pC8GwFIrWOGgD2abQ71cv4nD71bO8Ihe2l2IntbGvPrx4Yc
 fvE+feJ9M5kBAf6cb1iB4/BcviT8WuIvgq2nCXImNEuDGLF7+dabmZErspSn66baoQn2
 QH9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OLgyejew
Subject: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version 1.17.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index b83d7fc575..199de265a5 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  31bef7bc31a8ba7da00cb33a70aca7a1  wrapt-1.17.1.tar.gz
-sha256  16b2fdfa09a74a3930175b6d9d7d008022aa72a4f02de2b3eecafcc1adfd3cfe  wrapt-1.17.1.tar.gz
+md5  f4db93e73e5c70a59955f0ec162d585d  wrapt-1.17.2.tar.gz
+sha256  41388e9d4d1522446fe79d3213196bd9e3b301a336965b9e27ca2788ebd122f3  wrapt-1.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5974efbbc8b626b2050810d63c3a907ee21c92bf64b3740fc623ad05eb3448ab  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 32bac19d61..9048f7010e 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.17.1
+PYTHON_WRAPT_VERSION = 1.17.2
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/c8/dd/35c573cc2b4b8d65ea96bba0247d05710f284857d30e2266d1874f1c727d
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/c3/fc/e91cc220803d7bc4db93fb02facd8461c37364151b8494762cc88b0fbcef
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
