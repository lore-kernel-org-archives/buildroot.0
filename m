Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAF7E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 18:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B566074C;
	Thu,  9 Jan 2025 18:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRqygxXp902o; Thu,  9 Jan 2025 18:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A78607AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A78607AB;
	Thu,  9 Jan 2025 18:57:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 914E4942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 18:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C74C80522
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 18:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5tnSf1Aojco for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 18:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF1D18050E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF1D18050E
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF1D18050E
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 18:57:29 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e55a981dso37722439f.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 10:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736449048; x=1737053848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXXCZAUK4Sob1qF+YYMqFTYzA3uxjQGuE/+N+Kvw2P8=;
 b=IDXQujsNQcv92P+B3+IXt+OnWr79YqqBD5MqeZ8HZEQP874NRfe7E4FuaUwqwJq9fG
 LAl3R6FxYHgk0IIFcUSA34am54I8c9JnPS53PrPUS9/3FJ6JPsp8MA80RDZx+ovHtZPg
 f8FtUS0ezSYkskZ131og6R9vCkiS//TaI5Lw6xe4qekN0EhKpjLDbxGVvcLYbIuLl86Z
 nOVtWMn5j4c01pFZ73ldUVvSQ369ECGp0wWComkGz4YMb/MRPrn+fE8tH4dLEXAuvbfD
 GL2o8uKBIFE2vx9sNgU1/94o1Bc54u/cN4pLp+PhcbTUH2EO64ID3zyOBgp4j8izvZZ5
 YbiQ==
X-Gm-Message-State: AOJu0YyI1k0pzcbMpv4jS5lcZixncvSAwdmJZicCzLbbMnruDUUERkYh
 Djv6o6Vkzd+IIp9f0ETygW5/BAA3zSe7PwdQU0GN+SOB76mr7CO/4h9pZDZOnbo=
X-Gm-Gg: ASbGncv51kymDDDkmNTVAntoTQ1N7tYLwuF5tKLljvPSK76zFn+/p5QZE6pT2qIFUnu
 vqpOXnFsOuytiHOdkhUVgI88F1l4296oLSF5/4j0H2yAyiHGjDNJd5QrT/UXGXkeyesLxg9usXl
 8rDHA3NwclYSL/K+Ob1S49alYlPFKrCb+LcdVW9rPM7yX6QW9KapL4iwNLXhJ7iTWj5G1xcVIIH
 wLCCjc9Dks04Zn5ZYLly8MrcK28J3P4L+14p4EjwMAFoA6r6ZyarbbaY+001yzFlcdLU9SjigiZ
 ScAZtRHxh0SIwM0/3Gxvpm+s0WLQFiA=
X-Google-Smtp-Source: AGHT+IF6xP0RksEpY/QXBtz7vCOKV4UBt65N93AnX+0t6HOzhEZeKI5ALLJ8VPZ5kC8C4DJwHOcRBg==
X-Received: by 2002:a05:6602:4089:b0:83a:b52b:5cb5 with SMTP id
 ca18e2360f4ac-84ce007c66dmr793960639f.5.1736449048303; 
 Thu, 09 Jan 2025 10:57:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4faee632sm46127539f.10.2025.01.09.10.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 10:57:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 11:57:26 -0700
Message-Id: <20250109185726.2351200-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736449048; x=1737053848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JXXCZAUK4Sob1qF+YYMqFTYzA3uxjQGuE/+N+Kvw2P8=;
 b=V3U/XuJMt7mOkOwNmtNQ1AvY8zSlZXJIpp5CR+Bn016Dj8vGsU96yE8y2PokGzrzZU
 YLsz+eKoxpIoXAWf74lBk7EyzkWF6mnuO0iKA2oAUJxU99+f/4Fc9ExPpRHazPbtBe7f
 weHRHhylio2Vt6VRQENIxlV0cgcM5RgIEX3BfuCrZMNrbB42A91yNVAzhc45lAmuKf+f
 cpIvVahLVMoeb+23b5WP02uHcb8YE0VwljzUma0kCsDGp6aY8eI6ls0GUz6pYTjBJYh3
 Qj+23wgoTlA4YPby7tdO8l2PEGmyB5XJXIfdnjKhQ5QkldafrFLjD+BAuW4eGy2wZqa4
 d4Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V3U/XuJM
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version 0.8.1
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

Replace python-tomlkit with python-tomli-w runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aerich/Config.in          | 2 +-
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
index 39c0a50aa1..4e7ea1117c 100644
--- a/package/python-aerich/Config.in
+++ b/package/python-aerich/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_AERICH
 	select BR2_PACKAGE_PYTHON_ASYNCCLICK # runtime
 	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
-	select BR2_PACKAGE_PYTHON_TOMLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TOMLI_W # runtime
 	select BR2_PACKAGE_PYTHON_TORTOISE_ORM # runtime
 	help
 	  A database migrations tool for Tortoise ORM.
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index ba1ea35997..87df73d3c7 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  22db080bf0e608344dbd837ff29ee2e8  aerich-0.8.0.tar.gz
-sha256  13786a91469626c025a2e2c5e524cac2b82b900de063b317f402710ee4c11ccb  aerich-0.8.0.tar.gz
+md5  d4062a911161435a3d21736b51340b0e  aerich-0.8.1.tar.gz
+sha256  1e95b1c04dfc0c634dd43b0123933038c820140e17a4b27885a63b7461eb0632  aerich-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index ea4ee07697..bb568d642f 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.8.0
+PYTHON_AERICH_VERSION = 0.8.1
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/35/a5/fc8f6e70cedf47757c4738ed6f79420b9cca6ed1655daf527f86e73f3159
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/4f/41/3c478b7a344abda866f2c644b056ebae638499bbe0eec0010e7361211774
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
