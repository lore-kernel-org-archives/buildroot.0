Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D45CD3447
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 15:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE75606A8;
	Tue,  3 Sep 2024 15:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhZhMM15shm6; Tue,  3 Sep 2024 15:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C6A1606B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6A1606B8;
	Tue,  3 Sep 2024 15:56:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 889411BF3FB
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 15:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81DFC80E08
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 15:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elw1BBRvKwGk for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 15:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51FF5804F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FF5804F4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51FF5804F4
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 15:56:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso45414275e9.0
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 08:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725378991; x=1725983791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOi6UamjaipDTBEptL2x8kIVXUEZ9Ab128d3AsfPFiA=;
 b=qxUE9j3KbEwBG+Z/qr3eUvjd8YUo8t4j1ucIg4Na0YYETlHuDrNpklgyDNVgJaHH+I
 VR2AkMlulpwoX2Er4AfbWnCdiIQ1y5krTYAwmrJ+j6shdA4bNfmbR5kA6lKtUuLYhZ5I
 S+8tB2uufUe2LArhC20B6zij9xRbsmpDrPJQxR5MNXPl7QhB92C6ZMCm5N/9HIOJUn5k
 Gm3sH+biPHvt0j5aYp2c5PAj9iVWzgF6T19bDby0iBPhtmWUvorq/6+wB2OqLa/RhiB9
 xye+gP0rEJrhiIJRFS+b3DZbYj8Y8NgrIzpoZRJRkme3idqfJyHyQYmE61pFdE9bbwNR
 l4zg==
X-Gm-Message-State: AOJu0YzJFouZDIV/hQvoowSWBIzk5IOEabQatNTpRkIW0s7RzpI0Su7b
 wI8YTfKCkw5lmtj2Cfs7YRnkSN2f8J/J+nlXUCpfojQDCG3qQ+uOZ8/iXSxZo+1GN26X+YTqYNQ
 s2xY=
X-Google-Smtp-Source: AGHT+IFzYq3tdERe/OIsV8+HBcBcCeBY+49wSb1rkJfTCiSmbj+WAf+BFDz1gnK1uTqUtI2Nu9Dlww==
X-Received: by 2002:a05:600c:3b1e:b0:426:62df:bdf0 with SMTP id
 5b1f17b1804b1-42c82f5318fmr47603845e9.10.1725378990868; 
 Tue, 03 Sep 2024 08:56:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc8de253sm118577705e9.0.2024.09.03.08.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 08:56:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 17:56:21 +0200
Message-ID: <20240903155622.922284-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725378991; x=1725983791;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IOi6UamjaipDTBEptL2x8kIVXUEZ9Ab128d3AsfPFiA=;
 b=Rzc7E8GUS83FI2wmgB/AMXfyq/cGhLfjuym6yZvtjai81f0CC5j3uZPfqpT7KgBl7T
 6DbhiwvRosi+Sr4z8vZ7Q3pG9ATm9w5RUmsLLy0Nr+4zUKnPecgnuw5A3F3rS1jPXhT8
 A2NdQKcpJhqphM/w7+FMSzefqXdoLzCQPL1Zo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Rzc7E8GU
Subject: [Buildroot] [PATCH 1/1] package/cache-calibrator: fix build failure
 for implicit declaration
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.org/results/db996c894c810ff5c7f4263975d1def0edef6d55

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...e-due-to-getpagesize-implicit-declar.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch

diff --git a/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch b/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
new file mode 100644
index 000000000000..fcad6694816e
--- /dev/null
+++ b/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
@@ -0,0 +1,33 @@
+From 29c4e0038b212e953cc59ac8b31d4541db758a3d Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 3 Sep 2024 17:43:44 +0200
+Subject: [PATCH] Fix build failure due to getpagesize implicit declaration
+
+The patch fixes the following build error:
+
+calibrator.c: In function 'runCache':
+calibrator.c:267:24: error: implicit declaration of function 'getpagesize' [-Wimplicit-function-declaration]
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: sent to Stefan Manegold Stefan.Manegold@cwi.nl
+---
+ calibrator.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/calibrator.c b/calibrator.c
+index e045dfdcb96b..fd2fadb26020 100644
+--- a/calibrator.c
++++ b/calibrator.c
+@@ -37,9 +37,7 @@
+  * THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-/*
+ #include        <unistd.h>
+-*/
+ #include        <stdlib.h>
+ #include	<stdio.h>
+ #include	<math.h>
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
