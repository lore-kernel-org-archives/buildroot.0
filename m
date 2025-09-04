Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D07CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 21:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060FE404BB;
	Thu,  4 Sep 2025 21:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C-kqBUy3CRm; Thu,  4 Sep 2025 21:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3218B4049C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3218B4049C;
	Thu,  4 Sep 2025 21:18:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2D9B69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C3BF4049C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpyPdXsFbASr for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 21:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=osama.abdelkader@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3574740485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3574740485
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3574740485
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:17:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so259751066b.3
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 14:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757020677; x=1757625477;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xkYB6hdOpGBEqWOg6BYQgZP7LU9zHAgNaQA2DO5ehS8=;
 b=PmfQtrWbAqpkSuH/V+AOtnuEMM1BITo9/EJlwzC2FpOimBwG++dY5jyB0NPoFzMGsh
 kzYLarVKCJahJFOHjwa++lKcZJ4nvnDX+i8vkWRqC3SCekzjlIogNIqi2zzUd27RwHdB
 J1bvFyRWRZGJ3m+rD3KkwZp8DYfhW3b/NfvQcd5EUy/45GLO2zAFjLPsmAgU5nmuC3OT
 vGwgFutDoSsmwJQB6d/9YAVLO6l7hkCuC1VFwnr9mEHwGvpyIEGussTlS/RIseSj59Yh
 jJjJO78oCa8HtIfS1KPnIkRGYEIgu+2jHalsm69P/H9dPRsC/C6yQ6uGfFBh2wjvj4RR
 sulg==
X-Gm-Message-State: AOJu0Yy8UVl9arJEc0E410ecoNZhNtDgV/ZzSx8y4RUfRZbFnIxYS+Rs
 +94F9N8qIVOzZMOf3ihhclNDfRGdHmbkhmCMEf/D8dCmetBdsUaDRZZFGAQtJVxH
X-Gm-Gg: ASbGncvdVqjRzO4p2Wfc7MrDd1aa8VsgGVI8beJnZeVPVCjb94lxHkEegMDdqynPTiT
 0MHUEk689RtEV1kgpk36rEdYLwCOTrupBFKkrxoMQ55L4TqdbD8Q8tTlg/ctZcvpB4XhjYQ7aR6
 7tP/3iXQ3plgi5HUlQR1/sBw2M1r8WRcZmFRajcOmZoYdNoDQ6SHeJoqrKudhdlsl/yCuUnSDKJ
 msqhZqo/6sAU7ofSKCf8wNvFzAmt4VEby1jIvopM69nqACf3rR/VE53yo183sn2LSYUEirE1h6v
 1nCr4MALYn6psKaL6ICQLfk7RUcqCgP/sR7L+NUE5SoJ7z+oB3zWBvpv2ZwlCYOt/1ZOykG2o6o
 Ol8LM0lmSOqyNfK1/XUl9rrNbZ1o+rgmy1xJGqwv7a33x3IVrhuWCQF98Gmnd7GEQ14ALjdgmio
 +rFYpYOqvdlxVDJsFF
X-Google-Smtp-Source: AGHT+IEppQ0iIRRwfcJEp4H1ooMDgmhFI4ZfWRsUtltZF4r7+i63by3TjdCLZ2KgsaxGs3r7C8RRkA==
X-Received: by 2002:a17:907:3fa2:b0:b04:9822:1ab4 with SMTP id
 a640c23a62f3a-b0498221f04mr22677666b.27.1757020677040; 
 Thu, 04 Sep 2025 14:17:57 -0700 (PDT)
Received: from osama.. ([2a02:908:1b0:afe0:ce7c:2f00:14d:7943])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm1121084766b.21.2025.09.04.14.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 14:17:56 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: buildroot@buildroot.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Date: Thu,  4 Sep 2025 23:17:53 +0200
Message-ID: <20250904211753.92305-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757020677; x=1757625477; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xkYB6hdOpGBEqWOg6BYQgZP7LU9zHAgNaQA2DO5ehS8=;
 b=Lz5OdrjxswvX/O/FmGX3po8SaVl3dz5y2GcpBFRZwk0MJlaHyAGCKwrw7GDg0NErGz
 6g+L3RzcJZCMujM8vJm97MXJwCypswelT1+z8+UNb8my1cxs1FHJheJFiTPvYQd3ngWu
 50kFRZXdrflPU74pUr8a5O9jygXFFPTQu6fDXetEwfnUUXgPEoy6RY2uUiUeZuIwxjRj
 40ThQkKY2Dt+hdUmz3KxSA78AUgf/8+OeBnWnsvicUpbnRdJ2K0ai69vgBJYnyWmJN8D
 m2KHR35YZwcJXxMRCPKbgILEJr69cRtGk88oXiaUuyvWYTwL5jtNQLaOitFI9zZBr6uL
 mlnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lz5Odrjx
Subject: [Buildroot] [PATCH] package/nano: bump to version 8.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://www.nano-editor.org/dist/v8/ChangeLog

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c4866b99db..714046414a 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.5.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.6.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  000b011d339c141af9646d43288f54325ff5c6e8d39d6e482b787bbc6654c26a  nano-8.5.tar.xz
+sha256  f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619  nano-8.6.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index e3005f4dd0..183dc07e7e 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).5
+NANO_VERSION = $(NANO_VERSION_MAJOR).6
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
