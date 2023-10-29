Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F42C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C34B40134;
	Sun, 29 Oct 2023 19:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C34B40134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5I5aInHz01u0; Sun, 29 Oct 2023 19:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93613430B3;
	Sun, 29 Oct 2023 19:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93613430B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B67C71BF3EE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 19:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C623707BE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 19:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C623707BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke2v-3cKTh5C for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 19:53:42 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98D18707B8
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 19:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D18707B8
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so53458921fa.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 12:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698609220; x=1699214020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwIKncIt0bn/F1i4vK0X2wUy4PNH3BjOMaIvrIlZPsA=;
 b=T3AigjUWy/aQpuLL5VJXpDhFmHLP8ldlcbCf6dgbsLlIZbIvEItAy6TrHvn0/gCP7D
 sRsmwlwnL13DCRPyoByuXR8AFkd0rez4kkwc0e/UieM1F0MpQUHCsGMESERHorYALZLj
 VgVbhECgcsrrq0eJF8PzwLRSb8aVi+JR5S4FLpMsRfWo3B6Qws9qoUHqUEbNK/lw7hm5
 ekiEtVDpx+4uH9NAaLpqJbcPu6Rz8OnYu6YJFX35aXXoWgPwtwkOO5hklJfAOddq52pq
 QUwAeI7r3EHzPNDQgnd3/XXptzt3dXwMFkXXkwBzE4PIk+qwGAR3uMDGa+2tWXxJVlMk
 0a3A==
X-Gm-Message-State: AOJu0YwtCgwq5U9ZegKEHZFxXpW30GE6gFuLeUowXhk5VWWJ2szPfthK
 ZfUtX1JwD/IfcojU61Ys1t9OaK379hw=
X-Google-Smtp-Source: AGHT+IFXF2+x5EwMdUMbaONpPZFcmT22qUScrdL+mMYbXtOOSYfOTR77BPSy8I7nXGYv7YySEZ3fGw==
X-Received: by 2002:a2e:8ed7:0:b0:2c5:1603:9c48 with SMTP id
 e23-20020a2e8ed7000000b002c516039c48mr6964062ljl.20.1698609219716; 
 Sun, 29 Oct 2023 12:53:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay32-20020a05600c1e2000b004065daba6casm10786197wmb.46.2023.10.29.12.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 12:53:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 20:53:37 +0100
Message-ID: <20231029195337.755864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698609220; x=1699214020; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HwIKncIt0bn/F1i4vK0X2wUy4PNH3BjOMaIvrIlZPsA=;
 b=M+XSz4A/49/qPFB1Unk+d6k8nuSkvimDCP6CIaYVW9Jqa1/wPI0g2tKLyElNut3eRU
 Cq8OsszpvRO9efegwg+e4kGhCfZcNVKbILTAX5I5LdsgE/Ug/4DCAk/W+nrgJfoA7EyA
 cidAGqlkm7AO1YUnnEk6I3RNS7GEmuCuwZ02nBTEDyp8Z9o+WRNwtaptx+9Xv/+u3ZgB
 Yw326JWYYjYT7LkPbdj3Lyk26rA7R3+XXrY+2FzgtlJXsSmvYx6O+j53NklA2abKtwqQ
 /Zgfyc072PWFEUCPBUCaGljV+GoDl9P/1KVHdQ5FSshUkcQDoVwN8cVt/Ghe0ex4Gd4R
 zNcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M+XSz4A/
Subject: [Buildroot] [PATCH 1/1] package/c-periphery: bump to version 2.4.2
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

Update hash of LICENSE file (year updated with
https://github.com/vsergeev/c-periphery/commit/415b0cf5e826b26a35f7ddf752d092c1adbf11ee)

https://github.com/vsergeev/c-periphery/blob/v2.4.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-periphery/c-periphery.hash | 4 ++--
 package/c-periphery/c-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 516cfb33e5..f8f0654b4f 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba298aac5c1f6ebe2b89ed623a2f678bedfa3b9dc78aaf4f0534a1dd304629da  c-periphery-2.3.1.tar.gz
-sha256  7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
+sha256  24327bc2a22588444b2576fa1c9560619f6faad986c236c54f4b3f36b20dad56  c-periphery-2.4.2.tar.gz
+sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 722679f9f8..367ac319b3 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.3.1
+C_PERIPHERY_VERSION = 2.4.2
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
