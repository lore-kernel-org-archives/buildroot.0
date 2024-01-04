Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA074C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82554615D9;
	Thu,  4 Jan 2024 21:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82554615D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQD6TAhsDPpi; Thu,  4 Jan 2024 21:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA65B615D0;
	Thu,  4 Jan 2024 21:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA65B615D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B26281BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B226615D0
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B226615D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xgABbwKNvM9J for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:35:43 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF886158D
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF886158D
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so5346705e9.1
 for <buildroot@buildroot.org>; Thu, 04 Jan 2024 13:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704404141; x=1705008941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rYP3ovKRJmci0L/XpjBkOSvB9FZF6HDTJPxeJ7KiOUg=;
 b=bGPVOBtBGUz0GL0ZPN0Yw0MdiLMHCjWWDd3PF6KV3yLrtty313NJ+QLV4SHqe/wVSr
 hgdL3AL/FaeImCXZGBJSYPg/IncxWvZ3ZkNsWKs1DZdxDSFe7P50y+CfgdR/lXAC7/iH
 S9YTiPWam6Qjg/v6zuHMN/h0+Q+ybeYtRI9ZXDPyiMy+lLvUwtyVjU+uAR5rRdFIHvxE
 D6S6T7wtFT1HCQPXONbjE1HhXo38URnkoXNVGVtnluUGIrF3FvyQNcJG3xAZ9b35y80o
 5XBUGpmEkbndtipavZzUVIv36wn/Rt/TgM3PAzJqDqqqFZ63Qfl2tAzqdJqCAZlrAtLf
 xFQg==
X-Gm-Message-State: AOJu0YxieoOeb8XAdqfr2zdhglRQaDbRV6WFXQ7jTIHcvN0PnEesDkCW
 BTcHZ7+I4Ko6rL6mxfp4YytYhZwfhQM=
X-Google-Smtp-Source: AGHT+IFdd2DXVLe+Hx8PVr3kT0/nBQLc63MvwfGjVHrHfwMJrHQaUaaI5DSIUNZKA1/exXZi2xeing==
X-Received: by 2002:a05:600c:19d2:b0:40d:6f22:a6d6 with SMTP id
 u18-20020a05600c19d200b0040d6f22a6d6mr670058wmq.106.1704404140486; 
 Thu, 04 Jan 2024 13:35:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b0040d5e53d7c3sm6885863wms.23.2024.01.04.13.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 13:35:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 22:35:34 +0100
Message-ID: <20240104213535.605890-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704404141; x=1705008941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rYP3ovKRJmci0L/XpjBkOSvB9FZF6HDTJPxeJ7KiOUg=;
 b=k8r93nH0tcSyIpc32HqbxQ8kPYZq1w9M6C5gMvUCE+WM/3DOvS+LwsowgMafLtE21T
 ib4PETkK0ptZh0wUbD/Kr7vUx4u0MoKi/8yh5QLjLnPCh5KG3G2rn02SDJq//0JkvRyv
 lR6vpVvJR+ymakqQgOHjpf6NqB1zYtPFRJpJ0XluTOaG4SHfS345LSYEkvGvxaEXhG47
 SaBXVzTy+d95FHtul8mCSW+5kX2a3WvU3F77Ae6UcOSXkrjqv6OF4OMXSu67qbOPoeTt
 xT6hgwG4oBGpEf7r2IwjPO4CYOkVfPuKC+rLs9yCn3LPGS/H3Cm+Hjke3kj1o1B0m+ex
 BRyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k8r93nH0
Subject: [Buildroot] [PATCH 1/1] package/dahdi-tools: bump to version 3.3.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/asterisk/dahdi-tools/releases/tag/v3.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dahdi-tools/dahdi-tools.hash | 4 ++--
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index c119ff4ee1..1251617286 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,5 +1,5 @@
-# From http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases/dahdi-tools-3.2.0.sha256
-sha256  2bc269887fcd42d2486572611934d713e603734cc658b3b517fc9f3bdea7262f  dahdi-tools-3.2.0.tar.gz
+# From http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases/dahdi-tools-3.3.0.sha256
+sha256  5706b37df5840ecdc524d4c86df2ad34a31f83db552a8519b4ccf61bac75d2e4  dahdi-tools-3.3.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index 7d4de645a2..056b29156d 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 3.2.0
+DAHDI_TOOLS_VERSION = 3.3.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
