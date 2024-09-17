Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7559BCAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C6BA60777;
	Tue, 17 Sep 2024 21:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJuN6LXx3WnK; Tue, 17 Sep 2024 21:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DBD7608F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DBD7608F1;
	Tue, 17 Sep 2024 21:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB7901BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A98B541A3C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4ijJUTQ5D_T for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:26:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70EEE41A0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70EEE41A0A
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70EEE41A0A
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:26:28 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82cdb0baf19so389987239f.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726608387; x=1727213187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AHs9oiyBB/wl8BGZN7dvd92pT21l/iWpiNgffPe1bJg=;
 b=dACoyjUnDnZaZlRCbKcTu6CgbwQIhfNohpIvEMqSawPpbTeeXHI2NXOx2vc/BYDTg9
 6qUX/36XIDuANc5IDjaLhgS8Dxy9vqjQhTdA/OMJioAuwCCK9Py+v8dNawKtrI8dJTRq
 9Xjw/fXSPqdWpsGkt0wwZyTTFQFn5vwfagTGtfonldNtYOICfs/3KuJqglI2NFD75efa
 JjGzTim6+hCn4XFbRUIkL2uJ7K99bKnX9lOIHoCJdEJ88qlmoHYCJbBsD6CpM5hGyXBd
 9to3UJRq4lMEg0XtglowhMsqDQKOjylbJT0Qd7L4KyFT29EVd2KS8crOja40nulyY6Lm
 WoKw==
X-Gm-Message-State: AOJu0YxMmskpEv9fYktuiKd//NyW7tiGoTVz0TPmGgX/cMnXgE+XQUAc
 6yA63FSwBp68FbFOUACiEor393sdY+M3T6DdLHs5M6o1muNX8+GNaYsnaA==
X-Google-Smtp-Source: AGHT+IEdtXXuMg9c5chnPxZuNbxZF4LRGqs6/HvWXDJJ3cuk0Ms2LP6KkEN6+CMKoQuJS7853PTQ2w==
X-Received: by 2002:a05:6e02:16cf:b0:3a0:abd0:12b with SMTP id
 e9e14a558f8ab-3a0abd1022emr62208105ab.8.1726608387104; 
 Tue, 17 Sep 2024 14:26:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1c103sm23979135ab.48.2024.09.17.14.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:26:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:26:25 -0600
Message-Id: <20240917212625.64085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726608387; x=1727213187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AHs9oiyBB/wl8BGZN7dvd92pT21l/iWpiNgffPe1bJg=;
 b=CnDyRGBPYfJQ2We4hhZgd09ZMqPSEgZnUPCUO1qJvi7aGY6Y8CPAh3Y1CgimM0y1VG
 3yHUjL7pdp0tvV7x/UPUk/QHbIrHYuRF55iHOiMLMcYfN64cQOSohAnqQIiYFBvzXUWB
 Xf+TFuiamDQ4WtiM9BYuftSCeQ5bmfjbW3k5Exmj5th9rf9JexAkzgXSHLJZI2sO4yO+
 E5BMzbhbnPkA5yRZ1nfOpU+oyCykCYieCBHbe8WX3mNW5y3DiGpS4WfKB9jT6hcZ+ORB
 implJTLwSGgCc/VIIwOnIHGUoVAgjRmdV8Ago1Hx0tHm7fVDnRUucLJfuPr2NuQxnsD1
 1GxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CnDyRGBP
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20240906.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 9f2ab55508..09b952fea1 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  b2072b7b000223890b56830ca1ab3616  pydal-20231114.3.tar.gz
-sha256  c42d16fca9e3bb6d399aefb2434c0e70862ee13c75437852f421920432ee5fb1  pydal-20231114.3.tar.gz
+md5  db5439288a58ee0442967f81f2f0492e  pydal-20240906.1.tar.gz
+sha256  9b4a8a16324453d52930d2778c48c37fb3135555d4e04f3390e8a4b00c96c62d  pydal-20240906.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 245383f244..3265e21692 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20231114.3
+PYTHON_PYDAL_VERSION = 20240906.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/0b/3b/86302e165af07bc3d9225aea6ed8f52386270220e4aac1aad0101a48aac1
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/9f/80/cbaf7c90eec1da2404b1e6d100687ec2f01e6ccfbe695922a00de882ec84
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
