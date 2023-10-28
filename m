Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB502C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F7642F7B;
	Sat, 28 Oct 2023 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F7642F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4c1hKyzlrLA; Sat, 28 Oct 2023 21:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB4242F68;
	Sat, 28 Oct 2023 21:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB4242F68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B58F1BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F2461389
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F2461389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZfVKYX3ffap for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:52 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C1DA6135B
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1DA6135B
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1838740f8f.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527030; x=1699131830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WKTKXGxPzgBo824mxeCpUWYgXLKgN6yyxx1H8UmLzZc=;
 b=Yc2WozExz0KqviHQCq4COCdET+KK9oBAgYT/oilfSQjkkwE/xEgxqBOcWXGcG62DH1
 rxF5ltV6OqL2i9zbBOYWZyL28/Nnje7tNzwyaTeMa00tXbvYmE2a4/CmezbEOZkcsypT
 7vVQhG4CWKFSIjuSi541fSxDFF4MzzNLvK+eUDGrzi3St4jRg7y/NGbXskPRFPS6aODT
 ziMncyJHKeAUxJ7mWZp8LEl+oh6GYFo7YWzo/IykoWFyF6qPK4MPj4LRtzCE324i/3aO
 JuD0/5RDrdZOR1EfM5lM6ym0GYl7egKc5Ud8AW+zCaDelmUidapMhOyBPqFzckbuCjI6
 lZGw==
X-Gm-Message-State: AOJu0YySaOHcK42mb0dBlci9i2MXRs4dsflbcUu9y7Ias54LEV0WgLJB
 EVqpPDTw/wXCJDlte26iZB+eGbDsjcI=
X-Google-Smtp-Source: AGHT+IGiEcF9l4bhuiOhNDFoTpt4Ov3w1iEA8S62/1sXBGoVU2yIfOjoKAwVtTsniiMvLhTfTLnRDA==
X-Received: by 2002:a5d:648b:0:b0:32f:7ae2:4163 with SMTP id
 o11-20020a5d648b000000b0032f7ae24163mr2988300wri.20.1698527029785; 
 Sat, 28 Oct 2023 14:03:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k23-20020a5d5257000000b00326dd5486dcsm4570932wrc.107.2023.10.28.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 14:03:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:03:48 +0200
Message-ID: <20231028210348.1235466-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527030; x=1699131830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WKTKXGxPzgBo824mxeCpUWYgXLKgN6yyxx1H8UmLzZc=;
 b=NoFFzWlQOmQvxFSJ6F6dBhIU6aE/PTuh1KVQRb/e/InAjhFFBU1JrY4MsanS5ssEuZ
 H9TqwBkxM1SBQ70cKs17PKNvySVOT7K1VsOVypB71p3PxHzdcLq29/2tglj8K1zYbz5l
 DL4yMPjnHX5mq0OIiNKxv5w0vbDlSDg0upVlqakjPm2S1Z4uMeqxImJCvZGgPTsiMqDe
 QPr6NmOBhFaiSL9rV4qNFqQRC7rW3FDaua3PYWGm+2TgG7y82ZuCHFXuspSg2h+TN7Ua
 bZ03SIo8ayvK7VVTf15XjBSUXhNxW3zmR/bHG3Hbuph8DTXhr7G+fkgjy0AzDx+BXx9w
 9v7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NoFFzWlQ
Subject: [Buildroot] [PATCH 1/1] package/flashrom: bump to version 1.3.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.flashrom.org/release_notes/v_1_3.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/flashrom.hash | 4 ++--
 package/flashrom/flashrom.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 2ab463d93a..d3bfbad781 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.2.1.tar.bz2.asc
-sha256  89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65  flashrom-v1.2.1.tar.bz2
+# https://download.flashrom.org/releases/flashrom-v1.3.0.tar.bz2.asc
+sha256  a053234453ccd012e79f3443bdcc61625cf97b7fd7cb4cdd8bfbffbe8b149623  flashrom-v1.3.0.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index dd505987ed..ca55592dba 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.2.1
+FLASHROM_VERSION = 1.3.0
 FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
