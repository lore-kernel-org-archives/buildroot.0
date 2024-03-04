Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7700EC5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 20:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E662D40919;
	Mon,  4 Mar 2024 20:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RaA8Y_noPCMZ; Mon,  4 Mar 2024 20:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A155140939
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A155140939;
	Mon,  4 Mar 2024 20:21:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79A051BF473
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6200B40939
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id toi1bXBLpOzz for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 20:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC6A34092B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6A34092B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC6A34092B
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 20:21:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso1536322f8f.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 12:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709583700; x=1710188500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3pfRDkM03ZA6CwQzxfecn81irlqjZZk+sPLvQXJdIM=;
 b=nZHQ+tqx30wpMGQuTjSv28apdztvUCr7iA/0Q9950IC2fAXfc/THldISLxw9tARTa7
 rH1xjMpddfFY7Mh0JNk0aKxC7omoUz4co5I6AoyGLWbYV46dMP5MQiPwSp/rusti42iG
 V9B2P+Ih+B6esgiiGpHgHk9boTjeYNVOSgeSfQS/bl4VwUTdGBCD1gxND7hpNzU4X2ry
 //2LlhlQ4JpYyy5x0kK8nP/miEapt4E8y8OJfKemaNM32M1Uk4kCNRHyBKk9icFdi35A
 SC4zQrMc9iziFWjYplQ1jhV09pY9miFz1CRleVG0idZdisPS3WWiGHPjfiXmVr+vXKLU
 h4Sw==
X-Gm-Message-State: AOJu0YxibriJzDKB6ExRxDvFNHDKyNJexsxubsclzgqYiPKgohEOl1j6
 ui2J+wdCRWYvZlxxJHBeFIUvrx+PRUWV1eE9IzBL8NJsaWkNC+ykRY+Ng0vUMI4=
X-Google-Smtp-Source: AGHT+IGr9mihYwY9XE0m+nmTg9Ot4J8K3LTd9KRIqgp5dJkqDcKjeSOS5Z1Wc/VEMhfz3+IqtQ0xag==
X-Received: by 2002:a5d:594b:0:b0:33d:f30:5689 with SMTP id
 e11-20020a5d594b000000b0033d0f305689mr6918584wri.30.1709583699674; 
 Mon, 04 Mar 2024 12:21:39 -0800 (PST)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-7ec7-2b5b-f491-03c6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:7ec7:2b5b:f491:3c6])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a170906049200b00a44ebb34851sm2939765eja.10.2024.03.04.12.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 12:21:39 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 21:21:36 +0100
Message-Id: <20240304202136.3291714-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709583700; x=1710188500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c3pfRDkM03ZA6CwQzxfecn81irlqjZZk+sPLvQXJdIM=;
 b=juVIP6XEuTfQU221chFH7tzh4MHquQhLbU+TYU3JOYCaSFZc5Bfv/l9y/VrUBaTxmv
 Xr0wlm6Lop1mZ+vcDYbhm6K1kqTDZ0PiQ4+ltrTUI3hKp5cs6Ddl3M6Kg+aXJ9xpTi/J
 Aw/pOcsHnH7ZOPgASRX2i24BqjYFDzKZo8yUPHkOymNpYPnnc8B+2y5IPnCmNM+lH3Ge
 aUYG++mpID96vdKBgg9QoPAvsU+15AkplNhuWbgq8a/nzWRbFrhmHhUKj4ebXorfLOK0
 5YKWdEBgkX97AEG4/jqYmIIz5zZ5N0S7Qt8D+Egq8I35mXWvdoLV+9jp3ocynEf1ZrTD
 oyHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=juVIP6XE
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.5
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.18.5

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 64f46759d7..e01bdaab2a 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11e6127a615744b52d52d66ebcdf9e5366f62746e8123b3eec00e35a057db988  eza-0.16.0.tar.gz
+sha256  18a9dfba0904a7f3099ac04fc99089914414eccfebb6eedf9ddf16355b0c9c1d  eza-0.18.5.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index b11c1a1e7f..c65a2af28c 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.16.0
+EZA_VERSION = 0.18.5
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
