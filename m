Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA09C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDB081E7B;
	Fri, 23 Aug 2024 15:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4PQyecIASr8; Fri, 23 Aug 2024 15:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B35AE81E99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35AE81E99;
	Fri, 23 Aug 2024 15:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A9721BF4E6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17630412F7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j17sPSpzWpDd for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:12:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDA2F41278
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA2F41278
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDA2F41278
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:12:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so15868265e9.3
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 08:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724425974; x=1725030774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gByXiaISKbDcwo3+AzCq8PGjWJytIwB8P3cggtoy7u0=;
 b=JONaqMqTFPC8Bj0YW3FpDpeHmXDj7xAiQaysjBZBd0GKPVbjNZzfmFgGsDh0+lW8Tb
 /BobSpbHihtOUmDlGg67O5CJJYXzrGENhgPRg+OFdcLlY7kMuEwppZHehKJ5Y62qVQz7
 eaEV7zJ7fNspNP6MppxtaHciov72FVLKW6IEuK5ZHu2BTsClrfXBbtlf4MtiMQjsft7P
 2W1dQlCF17pJghWrBn9BPBVg8hyzV5NvgHWgxmNJdRdTVdFhaSTz+8voviLg98yiOVSS
 tWvSuAIdrEhDqkr0NcaJJiuvJwcDDEOYxQ5z8TfUBQCgESLPCEd/CVktKRmBiDmdBqdt
 fYXQ==
X-Gm-Message-State: AOJu0YzSZ0alrGBPVsjQgNEtxl0D2ij4Ebs9Bpr/l6jm2XPLi+exLpCU
 NxZX3+faXuyAP/NkQ4tnjmqdAF1XWMtyqzp+QiNegjkLzWkxL963FsAn9EEC
X-Google-Smtp-Source: AGHT+IFliGaYh5GKFeDU0hD0jsr4gCbPkojXngBKckHDOJAJp0puCiAVsVsJwow38MNkX+V6+61ueA==
X-Received: by 2002:a05:600c:1c82:b0:426:61af:e1d6 with SMTP id
 5b1f17b1804b1-42acc900408mr21336815e9.29.1724425973942; 
 Fri, 23 Aug 2024 08:12:53 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:c742:1e66:4b5f:4ee9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811044bsm4362922f8f.23.2024.08.23.08.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 08:12:53 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 17:12:49 +0200
Message-ID: <20240823151249.1808674-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/pv: bump to 1.8.13
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

News: https://www.ivarch.com/programs/pv.shtml

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index ed4cc21d89..cac506a83f 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  d22948d06be06a5be37336318de540a2215be10ab0163f8cd23a20149647b780  pv-1.8.5.tar.gz
+sha256  e2bde058d0d3bfe03e60a6eedef6a179991f5cc698d1bac01b64a86f5a8c17af  pv-1.8.13.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index f7243da8be..1434f8a88b 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.8.5
+PV_VERSION = 1.8.13
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
