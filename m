Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A12D68BCF
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 19:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769184088C;
	Fri, 15 Nov 2024 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikbtTWrEG51v; Fri, 15 Nov 2024 19:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4350F407D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4350F407D2;
	Fri, 15 Nov 2024 19:52:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CE927DF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4598A61096
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dW1xxOQ3Wz4J for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 19:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F2D360A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F2D360A48
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F2D360A48
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:52:18 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21145812538so18154725ad.0
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 11:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731700337; x=1732305137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyoKY6+H7MtEWJKyDqC29jfqTpoiy1hvfZSAC2tbO5Y=;
 b=wVbO4HqRV9vQfDZQsczKb416TJlB1rZcKEBXkwjgfwe8fCm7D1g+0OiV8GCv3nNGhs
 jm3nuy7pdivjWkxIS6UcL8/gOUVqSQPJoMlOAzKOu+rm9/U5GG4eQYIfdnP2ImpAgCmn
 /pPtVvDvc4+Jt6YwbeR0gwafDtXp29v7i4Ym8jGqWUYkK5ciPnErtaXgPMlS7SjjTk0v
 DlMdsaTr8uwM6us5CJYjH0z679tCzXc1usvyDrnXJRvuD5B4OMgMAps2+eqs2V0Pr4SM
 Ai3RXtTVtaALMM9z2ckGp4hSBjAtifdg9lZgSLIw1Zwsz40aT+BTwtQYynKVi1wMkULC
 cUoA==
X-Gm-Message-State: AOJu0Yy4F4ECvdURZd270/7LJURK661oPIN220O9a+Ey6NgLhRSm3EWK
 gGESxPh83TLlzZkktYtEv7M9ztcj/RWdVtXWQJbgY73jCIfInvVV14Elsg==
X-Google-Smtp-Source: AGHT+IGp7pASUC4XESsiTXei9OME09uit5AxS5mHp6qmOpG7oEVrvWMuHq8nIB2pMANhiuJm9IdXbw==
X-Received: by 2002:a17:902:dacd:b0:211:e4c5:cd5b with SMTP id
 d9443c01a7336-211e4c5cdcfmr19539225ad.50.1731700336912; 
 Fri, 15 Nov 2024 11:52:16 -0800 (PST)
Received: from eldorado.. (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0dc5d7bsm16034505ad.36.2024.11.15.11.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 11:52:16 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Nov 2024 11:52:13 -0800
Message-ID: <20241115195213.633633-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731700337; x=1732305137; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cyoKY6+H7MtEWJKyDqC29jfqTpoiy1hvfZSAC2tbO5Y=;
 b=gJ59m8dAwQp8yEnNzORzml8bTB2aY61WehsuxXhIgXtp7SBMirLwvwqWODgBkhNAh/
 VPyxlYSg6bI1nPDfY6+mOfA3265pch4OnxAoF9MD2CHdPivRtAl+yzSFNPSmWoxSS2sr
 G6cb0BnsyfKDW2EnZzDwEO8FSTdXL71S93N5r9KtPyQUqQHUQ1a+Ed5SxA+pw5jI41J9
 mOpm0/yRbY3WfTKBLTFCDnTVjrFV+3/zJkPy3lAcWo6YNWipfMamBTUQQTwc0kLCfLDA
 +SY4h4MuCHBVhvxc1HxgMVmPg83IqkxUXIbqGje/0Z3jE63XAfC5hwZu0VBcF3pPvQOs
 lTzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gJ59m8dA
Subject: [Buildroot] [PATCH] package/linux-tools: perf: Disable shellcheck
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 Bernd Kuhls <bernd@kuhls.net>, ju.o@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The use of shellcheck within perf is not a functional requirement and it can
lead to build failures where the perf makefile attempts to link in empty
.shellcheck_log files:

https://lore.kernel.org/r/fb078045-dc05-426e-b21e-72ffae3e8e1b@gmail.com

Disable shellcheck since we do not need it at all.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 65aba2e9fe25..df3030439efc 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -28,7 +28,8 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
-	NO_LIBTRACEEVENT=1
+	NO_LIBTRACEEVENT=1 \
+	NO_SHELLCHECK=1
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
