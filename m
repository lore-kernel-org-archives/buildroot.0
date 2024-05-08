Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAECDC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 17:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB7460D6F;
	Wed,  8 May 2024 17:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gM1Vp5Y4Wc1; Wed,  8 May 2024 17:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495AE60D9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495AE60D9D;
	Wed,  8 May 2024 17:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128FE1BF5A4
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F323841B1F
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 17:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Utt-3L9ya4J for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 17:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C374941B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C374941B40
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C374941B40
 for <buildroot@buildroot.org>; Wed,  8 May 2024 17:03:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so47447755e9.2
 for <buildroot@buildroot.org>; Wed, 08 May 2024 10:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715187790; x=1715792590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6wk8wAqXdYl4ZzeQEVYcvI7YentU/GRyLAnpa+0fEM=;
 b=pDZ/q1J4+PwLM8KfSGT27aZQo/dV9c9Z+McJ0dGPBx+FxM/ciwjazGFdFCQUzc++AQ
 5HZVa4xJZH6R37JJvsFO+QwlHxgUAi7xDB7FL/7P17Cd8vue2FhkGhE+iHlHh6Dx4vfw
 bKd3/K+JMJq+NhBxIn7lcv4wM26jqNf17sSgan6pz2feVkH5mYCcjGTw2veR7kNkJloE
 Up21llGXwu4SRGMRWSB+YnXJW59iprVvOYMt58y6BRW4cFVz0lcDGEuDsUQLM69RK3z5
 ZO9DkVFofGQcu8I8FFSqb7Ralz1vFxgyIcLhMg5Phc905VUcSXf0kT5pQnwOl5N93B0g
 H+Og==
X-Gm-Message-State: AOJu0YzxdpXhQN15inEfROJvnHxDJ6o5XWK75GyuRaBM6v6ahlTABka3
 TxHKt/7VzV0Co+83xmMSkjxW/3xIFdj1HLlNAZ6l+H2cYvl1z9t7HecZ7w==
X-Google-Smtp-Source: AGHT+IHQYX3RMIDZDwsuV9/QH/q7o4r+EGasYPCfMz/KkBwbEuAv3gSLZ1TvgTYcBxb4PmrcL4G5Ww==
X-Received: by 2002:a5d:52cf:0:b0:34c:6382:290c with SMTP id
 ffacd0b85a97d-34fca244a13mr2775595f8f.39.1715187790086; 
 Wed, 08 May 2024 10:03:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b0034de3098980sm15794555wrx.97.2024.05.08.10.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 10:03:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 19:03:07 +0200
Message-ID: <20240508170307.31378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715187790; x=1715792590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l6wk8wAqXdYl4ZzeQEVYcvI7YentU/GRyLAnpa+0fEM=;
 b=SWXsoZTPXSzhcSOuWSMzqDFjrW3EGbnp5ZwUzT8Pc4Us6khzit7Pw3lCXoSguC7u4N
 da9q70fokKr8byy3Xa6Q/vXG2PufBy5jIMdVLtfW7PNsTh8Tfo1F0pS38gHHuDS3RsGQ
 2yA1gJdi5VO0152vItfOer4H194V3tAWKDi0fLs8y4Mxm05T9aXfsq2JumSJzHni0G/h
 zUS1Wutv45VbntG+deRJ/FY3gSm2OkHhhx1esCmk+4SbM30bt7/mJZEm9W39SRbVrMAG
 RNZ0q4nQXZ7vLqxgrWt/aKqNU/vdC/+TivtO+Q0vPWe+7rR8E9BZcDNVuLwRJiS9UX0h
 u06g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SWXsoZTP
Subject: [Buildroot] [PATCH 1/1] package/libunwind: bump to version 1.8.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch site to get latest release

https://github.com/libunwind/libunwind/releases/tag/v1.8.1
https://github.com/libunwind/libunwind/releases/tag/v1.8.0
https://github.com/libunwind/libunwind/releases/tag/v1.7.2
https://github.com/libunwind/libunwind/releases/tag/v1.7.1
https://github.com/libunwind/libunwind/releases/tag/v1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.hash | 2 +-
 package/libunwind/libunwind.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 1d532a7830..512cc7b9b5 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976  libunwind-1.6.2.tar.gz
+sha256  ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157  libunwind-1.8.1.tar.gz
 
 # Hash for license file
 sha256  6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 94e9bbd1b8..3eb3b483d1 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.6.2
-LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
+LIBUNWIND_VERSION = 1.8.1
+LIBUNWIND_SITE = https://github.com/libunwind/libunwind/releases/download/v$(LIBUNWIND_VERSION)
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
