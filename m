Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA072D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B0540216;
	Sat, 26 Oct 2024 20:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSc2eORC2gnF; Sat, 26 Oct 2024 20:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72332402AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72332402AC;
	Sat, 26 Oct 2024 20:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B396D5E29
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93E43605DA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIzvxhosB000 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7C2C605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C2C605DB
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7C2C605DB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:38 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83aad4a05eeso121195439f.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729976317; x=1730581117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Oi2B6OMK9p2m67bZdIfKcM2SRq5hbIA3MTbz0yozcA=;
 b=gzoxoeL/uMj5xFCrEoBkKOBsq7J34GGs8NWy95BfdRPdoBry8+frqEWvNOnWYRkKER
 8Sp7tkvcYEDw66O4nfbUouDhKBNqwjbDhESsQaOqX7nHy8xnzaKc3hiMo7YF+ngWHas2
 qST+CAR3Uel7rY3ijw6TcW0zUhh8sOfFpiDRM85O21wJp8AfJGVAgtE2hVqdCkuYH4uf
 geM0ygSuDNUQtecD2rDEZQEIjS4gUlA2Flx3IxQnBGLrJksb9PmYTGjs5kPZ+On3eCJM
 iBTCa4I8i/XlJs6Jzs7SRBFmkm7madMlhI7RRCgdv5/XCVN3LJLvLRziO3FQ4RLt4CVY
 0Vdw==
X-Gm-Message-State: AOJu0YxZyE4WBURUOX4RkOzrfNlZ7WckibNzTY3D5iAdWA985fyx+6NT
 EaRDZlrfhxY7WWSw2mQ+dinlYeUSdArP5hLJlY9UqjQ9FNsvWNkfbHk5wA==
X-Google-Smtp-Source: AGHT+IFIv76Sry2uiy/fHRS0juSdZUPchKJkRz3nlMp1+CFMzHQQZ2T99Y58oNxsbeYXiNSk7mDE+A==
X-Received: by 2002:a92:cdac:0:b0:396:e8b8:88d with SMTP id
 e9e14a558f8ab-3a4ed29b811mr27907475ab.11.1729976317164; 
 Sat, 26 Oct 2024 13:58:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df3c48sm8775985ab.34.2024.10.26.13.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:58:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:58:35 -0600
Message-Id: <20241026205835.3629885-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729976317; x=1730581117; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Oi2B6OMK9p2m67bZdIfKcM2SRq5hbIA3MTbz0yozcA=;
 b=TUy1RLYbkJ64z9FV+MV2iXQNR0XXCkwiLc1kMtPSA5FZKkO4yQwKOpD7ND7RiX/tFo
 GjVNzi9LzTOtCI7iL0T3CszSIXfminYCu+ICVn0moOHso6ShQKUOe3Mj3qdIZDTR0QKt
 fhioP+4IDO0QXcHNB7xjk0tS7jQoMKejleVdxkFiW/7TAeSARRDZhAzs1us1pYeV5aY8
 bxh3KdNkDb5IN7R8kNr0pLk+ox0BXqOwhprUVj0aEMF5RSr3vnJ+HGi5B3LZQRnxLvic
 4dgnFKMWYNLD9nXlVJhvZtwq1z5o+Xe/zisda3bddmxTGkFmQROYke8LPGa0JGZcaq9v
 k4jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TUy1RLYb
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version
 3.4.2
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
 package/python-networkx/python-networkx.hash | 4 ++--
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 77d2fbfdef..5433192a73 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  4980849a13f8174a8f6aeb5a9d59e77b  networkx-3.4.1.tar.gz
-sha256  f9df45e85b78f5bd010993e897b4f1fdb242c11e015b101bd951e5c0e29982d8  networkx-3.4.1.tar.gz
+md5  b6cde64de26aca58aa8431c0b232512f  networkx-3.4.2.tar.gz
+sha256  307c3669428c5362aab27c8a1260aa8f47c4e91d3891f48be0141738d8d053e1  networkx-3.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5b433b90f755eb9bbd06feff1d1a4f5f232c5208a185694199e45fa95d762792  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 9ac5f857e9..37780ef36a 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.4.1
+PYTHON_NETWORKX_VERSION = 3.4.2
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/36/2b/20ad9eecdda3f1b0dc63fb8f82d2ea99163dbca08bfa392594fc2ed81869
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/fd/1d/06475e1cd5264c0b870ea2cc6fdb3e37177c1e565c43f56ff17a10e3937f
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
