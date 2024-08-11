Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D21C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 00:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B2881447;
	Sun, 11 Aug 2024 00:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td3f69V80z9i; Sun, 11 Aug 2024 00:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C08B81411
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C08B81411;
	Sun, 11 Aug 2024 00:00:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC81E1BF280
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 00:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E749260692
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 00:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qD3WxH2-L1GY for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 00:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC36260650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC36260650
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC36260650
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 00:00:49 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-397052a7b63so12539685ab.1
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 17:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723334448; x=1723939248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9H7HdTK+36J6u3/3IIephS10gecRCgAt6J0d+BBuB/M=;
 b=LtJBTgiNq0k//BImVKF9DUXI03rGlmEMDmGxuDZNpPvFKzuLNcNSUg0j7YlpCXefP4
 x0yA7w+jUDPfpoZsb+NYAHMTSOpr2imWsEpoBVn6y13HMbZPvnzrsw/hWQKXFblq9Osv
 ek2FCnhi+QKKag/5M+xFGeT7DOaDgDUdOMI4Zi3tjLvjvmb3EM6lKP70yfh2pLxdI254
 0NbamcBeKjn3+fI1OuAILJ/0uVoiBtbFvN7ndqzNMcNC+9g+qMAcNzIQ22CeCILtcfwo
 DFn686ltFUQUf6KLAOlNX/au9tl+ZTFOJzwJsiAERRNGoA+NLLti3CQLGERU5eAn+tim
 Biww==
X-Gm-Message-State: AOJu0YxlZ8Gza4acrnJLipR0vAjhu8hWA8PyoW+WE4Lw8oRWT2cOu8KH
 AtituEwx7+8iH8rxb1WQ84ybR7SjTAFVHWQM3VYn0dkvhYyij42JmFSx1w==
X-Google-Smtp-Source: AGHT+IFF3JicaLtjoccoTWBJxR+ha39us3MXPvBobJ/+Ufe+f8P6bFvw+bQvk6omnPfL/YC9BMVG9A==
X-Received: by 2002:a05:6e02:1c26:b0:38b:48c9:55d5 with SMTP id
 e9e14a558f8ab-39b81348108mr79391575ab.13.1723334448249; 
 Sat, 10 Aug 2024 17:00:48 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:646:a200:bbd0:19b6:28ae:c9fb:dc2f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5ab3524sm1682139b3a.190.2024.08.10.17.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 17:00:47 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 17:00:29 -0700
Message-Id: <20240811000029.1956409-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
References: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723334448; x=1723939248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9H7HdTK+36J6u3/3IIephS10gecRCgAt6J0d+BBuB/M=;
 b=X+Ru4EimkhRT4EkIsJvtLwD+OXDl/AezO0ooblzKdarunBqjmup2qdv9+Iie1mNG5T
 /ppHpdya3effhz5u/r5CWpVkxMznfdL9URUfTFHkk/UADLwdtAIyWkFXrHFHj0DjsSMw
 C1DX4HwrNtkwaK88AsxQH9ux87l/ucjzX/uzu3mKBpOrAuHUWE7yrctINiPYNvrhf2eA
 gdFNIqYsFmcXCATLpz6cBO2fSf5SAM6RY23qb/anFsLKs6Wb6Gx6IZx8aYTdmQXyQfQx
 wInLkClnc+pWrejYDiXNk3DBsmoYDlurrwQYf4t7aPXfk3lFh43fq5RRI76K06fxFKF5
 srBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X+Ru4Eim
Subject: [Buildroot] [PATCH 2/2] package/chicken: pass TARGET_CFLAGS to the
 build system
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

chicken build system expects non-standard environment variables with
compiler names and compiler options. Pass buildroot TARGET_CFLAGS in
chicken C_COMPILER_OPTIMIZATION_OPTIONS.

Fixes: http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e/
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/chicken/chicken.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 2667f7823d8a..0000fc635ed5 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -16,6 +16,7 @@ CHICKEN_MAKE_OPTS = \
 	ARCH=unused \
 	C_COMPILER="$(TARGET_CC)" \
 	CXX_COMPILER="$(TARGET_CXX)" \
+	C_COMPILER_OPTIMIZATION_OPTIONS="$(TARGET_CFLAGS)" \
 	PREFIX=/usr \
 	PLATFORM=linux \
 	LIBRARIAN="$(TARGET_AR)"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
