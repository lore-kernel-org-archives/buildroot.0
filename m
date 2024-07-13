Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D49AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 18:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E5981F28;
	Sat, 13 Jul 2024 18:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2ma3Z46rYI5; Sat, 13 Jul 2024 18:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261D481F4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261D481F4D;
	Sat, 13 Jul 2024 18:30:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 894C51BF3F7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 18:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C0381F4D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 18:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLLMcZd-TKpV for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 18:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D6BE81F28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D6BE81F28
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D6BE81F28
 for <buildroot@busybox.net>; Sat, 13 Jul 2024 18:30:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42726d6eca5so22170715e9.1
 for <buildroot@busybox.net>; Sat, 13 Jul 2024 11:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720895429; x=1721500229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MMMAP46J6RM2fvgt4lxeq7zp71B5K980bIvzasifPH4=;
 b=IZ5g1MkTkkyAp2vbmJseaXC+w/yDQLtOKFpdWX3Nzds2b+ZNDDljGTryHzKvq6rYJy
 CyN1hsZwpGjV4NoouZYelCnmjuIi52VudZo0hcYtjROHbRvbeHsx6x/wm4Uxrj3FGv7S
 MPrWDDBqGwauqr57fABXkfPuHfbdHyDlfPJKNNhYWrQY7+nvo5+Zs6VJeJBMdy25AnRz
 ZJPm+8ff6l0fsxOqZwipmLZQrVSYo9pj68T9C1A2F+rJTJsZS4o/s/0b7PIbq+OESyUJ
 MvOIzg95J9eBxAqGLrl6tYKs6VUcj8V7XVaqDZytGePL2PyXQ3b1wPttRYEfWsbH5IMU
 aQMQ==
X-Gm-Message-State: AOJu0Yx1qbt0eGEPVc+NUamVj92EOiN06/7peJJce/OlH0QrUC9dVvRY
 9ZtLclAEuPSsLSx9PuudY0GFK0QQBnocArejRKUMQdT2UQidtYzF8QiSQ4jPOXsQKqYtetuySyQ
 =
X-Google-Smtp-Source: AGHT+IE889kYHKqFy8DrJXuaXHek8hHzw/jrPkfHlqp5T7rsW65aocenSCkysM60Nx7uyKRBcRZxSQ==
X-Received: by 2002:a05:600c:4850:b0:426:627d:5542 with SMTP id
 5b1f17b1804b1-426707f9088mr88541005e9.28.1720895429575; 
 Sat, 13 Jul 2024 11:30:29 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7489sm64341545e9.44.2024.07.13.11.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 11:30:29 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 13 Jul 2024 20:30:24 +0200
Message-ID: <20240713183024.129627-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720895429; x=1721500229; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MMMAP46J6RM2fvgt4lxeq7zp71B5K980bIvzasifPH4=;
 b=MrLMlhNbnq0NApcH5Dv3x/SWB/3zrxPvS15AIpcbUaU70nEcJ720TtqLV2hz8kDeWP
 h2UBIgdPafAzkjo7eaLuyIuNzNA/f6/PVHVgh9CAiM29MW22RQI82QQWsbSyKa9b2B/b
 n8l7lIxpAiN95Brclskjo7lX7xKY4Oc/tH8bWERuPB+CCeLIvOG7MsEoArQXH3EZ1FS4
 WBBl7gPytN0nIDqwCAUwvWBJ6o1K66jnPregZfyJ2/jADpPh5k4SLpwQaM2r6cKBf5Cq
 cIp4qBTxWD7yZON+d72quyhTKfQCwTk6eBlaoQuVRZQarMhOKtEB0RsZZqJ+qJJBy8m9
 GPag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MrLMlhNb
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 04dca7911ea255f37be799c18d74c305b921c1a6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 578bb7a3e..54ae3f993 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
+sha256  346b028d9ba85e04b7e23a43cc51ec076574d2efc0d271d4355141b0145cd6e0  luajit-04dca7911ea255f37be799c18d74c305b921c1a6.tar.gz
 
 # Locally calculated
 sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 693e22630..951206b83 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
+LUAJIT_VERSION = 04dca7911ea255f37be799c18d74c305b921c1a6
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
