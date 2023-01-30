Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C419C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 12:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A5F9408B0;
	Mon, 30 Jan 2023 12:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A5F9408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRp8btqRlg4v; Mon, 30 Jan 2023 12:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAB84408D5;
	Mon, 30 Jan 2023 12:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB84408D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05C0C1BF5A4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4F8E4058F
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4F8E4058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIswfwlbadp5 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 12:19:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6D0408B0
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC6D0408B0
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 12:19:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h16so10837264wrz.12
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 04:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRHSvvxxdDxYHYdtsLW9DJ16AuXeCewmiF1eKyirnx8=;
 b=QSG4yVRHkSfO4CzZFOXnXM0ZMx9I5qth2f4qaCybeZRTbqep94TW5btn/DFsINRHZy
 uCyXtxAiKP4d0fHHuznose+uLjUoQuF4AVrsngjgZau7hL0dkd++KLybH6qdENZFzGq2
 sX63VLNhUpLLyLHaBvAJDulv7oRRaYcRtS55S7HlwSgNamYuMfPeFOLlIwfbKdpizleu
 Gosz+72BtsoHd+VZEObq9zHahwvfxCvx6aYW/93j7JVsHbbJJgCByGBnl6T2mXUa2EUE
 I59Q3Q1u1Ro/dFqmipCrVVxZ5mJp48ipNmevcWUbTCt0S3T/z3tntH323R6TCXDd+3jG
 Ot0Q==
X-Gm-Message-State: AO0yUKUReslHyjEqGEyI3FcP24HNOnsOnxD7DmbDlQXaBTR/FYzFFTfH
 4rl0YGGuln93nJC1d8XEMEKwbTB1TFVjZg==
X-Google-Smtp-Source: AK7set9QJn0aftwUZnGG0vD1AI6KpT6fqL5fi+DaIkCk1WJphH1F5k4uP1e2YUbAcPVQGIHznEslxA==
X-Received: by 2002:adf:eb50:0:b0:2bf:eec5:390e with SMTP id
 u16-20020adfeb50000000b002bfeec5390emr2490963wrn.66.1675081176327; 
 Mon, 30 Jan 2023 04:19:36 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm11618612wri.110.2023.01.30.04.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 04:19:35 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 13:19:28 +0100
Message-Id: <20230130121930.3472747-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/fluent-bit: only require a C
 compiler
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Fixes:
- http://autobuild.buildroot.net/results/007/007c7c69e54b8ff663891da4535e2e95d40c42a2/build-end.log
- http://autobuild.buildroot.net/results/ede/ede6f9fb67c0c26ff02e71a3d20e3d4344ea59f0/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch b/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..6f2bf36e9b
--- /dev/null
+++ b/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,27 @@
+From 9559c23121c7eee94fe2d7bb37ad9505ee03327e Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 30 Jan 2023 09:10:37 +0100
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Fluent-bit is mostly written in C,
+so don't require CXX in the top-level project.
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ac1b9cd75..45f7bb85d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 3.12)
+-project(fluent-bit)
++project(fluent-bit C)
+ 
+ # CMP0069 ensures that LTO is enabled for all compilers
+ cmake_policy(SET CMP0069 NEW)
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
