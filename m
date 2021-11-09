Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69171C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D3C60F90
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4D3C60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F8824039F;
	Tue,  9 Nov 2021 17:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kruyj-XHw2um; Tue,  9 Nov 2021 17:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA63640398;
	Tue,  9 Nov 2021 17:02:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFE01BF2C4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A4D580F64
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDvDQdk6HpdK for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:01:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4A6080F5E
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:01:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2762677wmd.1
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMgLjVlAKIXVjXUcq93RzQmDYAKxlmxcYCXrU1UI1cM=;
 b=AvhzqqwRH0sUrNlMegI/4Qvuix0Iqcf0/Jvoz5cjECKceqYTuPBnQ+pz77fXcufpOy
 yOUg2e2RvYLGAL7jMnfJgiaq53S4YjDTT51GsoDJLH+Ze8XU7dSq27q5r/ONVi4GNxB7
 9P/46sXfbqmMQdn0s0rbte/0/dpJWmdfOf0m07/1bEnuXkHX9jd/V0J6Bgf0qh6ZWyuB
 gg3Y4KRzMN3V3E0peprqMTH1MepAziX8rE1xmClRa1wUIT83PeJBb+TCT8qE+jXnseAf
 8hS85K+0AnB52JYtysC7Ya9I7eUXiYmknrO/Idon4bqt1subZ6Na7j0bar8PGOvWDYYT
 W+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gMgLjVlAKIXVjXUcq93RzQmDYAKxlmxcYCXrU1UI1cM=;
 b=NkxzYiMhWNZgz7YnWdc+qDh34kZJnDm3TPU7F6norIljEq6ixqTy+cTdfih+y5aXzx
 DmmF64zRpflEJ8iHOTdxvn38A8+zhbG86xSPE+a/GI67e1ucElhXQVj6/TnvqenX6yU0
 EMMT50+NEuHSGYbjcorQ4Os7IM89PH5I7nBlSE5iuXDmaCV2IAmEJkv/KVA25bJD13sQ
 zVGAciFcIMM+JUUANfb/ca3TZJKF2RQC+roIIgdhI3E8DEyDgdlO/4ri6XE+tFi+KbLy
 gX8ceI4JVZMavX7u1a4TI2KyAFJyjnbSt+/hBjqriyQpUFgYdxKDr9mlkj/E2E80Z+ge
 criQ==
X-Gm-Message-State: AOAM532L4hvg5oi/lf7lKYYDsUMXyWp/+2YkKBhqKffsamG1dLY9a5Fm
 aRXjVoUeRmWEVvCsIe7X5Jv93tmyVKJDFQ==
X-Google-Smtp-Source: ABdhPJxCgp3YQEXDFVxvnfctLFvpFYLyDbn6fRtlk1vnua5Ep7ZrJUK0OjdDNr2HerM1MsJ0/A6BaQ==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr9015250wmp.43.1636477311046; 
 Tue, 09 Nov 2021 09:01:51 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 by smtp.gmail.com with ESMTPSA id h22sm3750695wmq.14.2021.11.09.09.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:01:50 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:01:45 +0100
Message-Id: <20211109170145.1944679-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109170145.1944679-1-yann.morin.1998@free.fr>
References: <20211109170145.1944679-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/pkg-python: do not set empty
 variables
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Similarly to what we just did for conditionally-set-empty variables,
unconditionally setting empty variables serves no purpose in Makefiles,
as unset variables are just expanded as empty...

Even though we have numerous python packages, the speed gain was not
measurable, with delta much less than the noise.

Still, for consistency, we just do not set those variables.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-python.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index ce0fc97283..4cc416cea0 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -127,7 +127,6 @@ $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
@@ -135,13 +134,11 @@ else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
