Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3DEC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 22:32:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F8D60E76
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 22:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52F8D60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A07831D6;
	Mon,  9 Aug 2021 22:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NUUbqrsUI6r; Mon,  9 Aug 2021 22:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5BE0831DB;
	Mon,  9 Aug 2021 22:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4E0A1BF3CC
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 22:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDDFE40471
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 22:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BliLXdP5bih for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 22:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3914A40475
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 22:31:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q11so5225625wrr.9
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66RsfWKFAJgfS0vtPz6JmfQ8EUpvvUx2e3wEKtv1xMc=;
 b=h1fbx77qpdX8E2ydEtngct5lYYr9kXOOMN+KW5gyw8RqArCePRBvVSz3UIkFWsiVDY
 6d4GZFD8iJLd0KlncN0od41cudTNc+PEmliJclgI/D2o4Wafo5AG0WU7OXeq8lpqt/hL
 9BEB7He3ZwRkHNaxRnhzK4yNs0ERb/tzh1MfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66RsfWKFAJgfS0vtPz6JmfQ8EUpvvUx2e3wEKtv1xMc=;
 b=k7f3yfAh+TiD9raSg1ORXItMbpf/rrVBIaI+z3Kf/T/dxH6GIedW+SQjxhgtmmImqo
 qSi0bwq2F5wzs4igC87IHjQwAzgSMiwrqaw+qZ83Kd+Djk0jNQndoGOhbPuYX7Ktyp0B
 WaH0WqkqZ0qh8Jasj5ZPmZW0RR1hr4Z3Fqm23qsfrvSCGeaA0JFjv9mU+d1y/zMjJnEx
 2tL2lmXXW6/HApYPioX8jbc4MOhjxsMFXExw5SK7nydeEszSG3lMDQ71yUOU7wgXdMiB
 Ux2X9Hpkw1mBMWWQ5H9pcklhMeh1BLllBPYQA5Tf8hNpSqYBA1Km6SKXqeEElFJ4MSQ1
 Dr6A==
X-Gm-Message-State: AOAM5339DepsQmVzrdYdPej1i2D6efCdIUwe/d95iYONdri7T9te60Dh
 lpiba3EH+Fv/f8vSjuvrce4gl1pD1hQ/Vw==
X-Google-Smtp-Source: ABdhPJxGJldMEGMItkSg46vLBtObdSaEfbtu9ZEOhx/B5gq6JrtHAFi4rzzkojsltmzIqVuLlyxoqQ==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr27342388wre.12.1628548310303; 
 Mon, 09 Aug 2021 15:31:50 -0700 (PDT)
Received: from localhost.localdomain ([37.160.145.131])
 by smtp.gmail.com with ESMTPSA id l38sm725255wmp.15.2021.08.09.15.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 15:31:50 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 00:31:47 +0200
Message-Id: <20210809223147.142565-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/apparmor: bump to version 3.0.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patch bumps apparmor and libapparmor to maintenance release 3.0.3

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/apparmor.hash       | 2 +-
 package/apparmor/apparmor.mk         | 2 +-
 package/libapparmor/libapparmor.hash | 2 +-
 package/libapparmor/libapparmor.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index ddbe87c569..88280cbfcf 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
 # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  8fada772d9a60989525594346d9aa22af938daafc1781adce9a1acb3c75bdf24  apparmor-3.0.1.tar.gz
+sha256  153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59  apparmor-3.0.3.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 6c23e1bb89..400ea349ae 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 3.0
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).3
 APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 37e1ff5228..6a19aef77a 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
 # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  8fada772d9a60989525594346d9aa22af938daafc1781adce9a1acb3c75bdf24  apparmor-3.0.1.tar.gz
+sha256  153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59  apparmor-3.0.3.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 255432e455..0d5822a56d 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 3.0
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).3
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
