Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E994CE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4605405AC;
	Wed,  8 Jan 2025 23:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUg6w9Z4vQVf; Wed,  8 Jan 2025 23:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927AC405ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927AC405ED;
	Wed,  8 Jan 2025 23:05:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2B361FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74649405B1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uy5HiY-l2mRg for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 183C64026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183C64026A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 183C64026A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so218178f8f.2
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377531; x=1736982331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qiDH6pqSJ+Nqt1g9NAK9gAUV5iQPLFT/nbErPhwlCMs=;
 b=vKwiHApu5yIaNlrDfrW5tYDEj0E3LdVaZuxAlHM8NP28ue9APzSWCvyffpEWF0zRII
 W8keRmPxN5jaU3opyVnU8nDIpjtY5ueSn0aHRzODIyjhU+8sijsWnP69T0rfn8od2YHi
 akqAHnYAjpt4B9SRk5x3rm3zi9xEu4SGS659Y3tz77FuA408qTpwLIWQSvxcd1T1loDB
 caHVc7ON0D0I8nYLnevcfzfFrkVZjucWtRrdALBeWEkVT9z4aik/ZVbPgEbpNEjsRarM
 urqsCx1/FgMMWSVyeGPPn1vOxO7bAVNCifYQmkmYJnEZivd8SSvwfb3DB6fcfAVISylT
 3LOw==
X-Gm-Message-State: AOJu0YwkcHx/5JDoOHFXS4tAgQuZsGfIijmqj4JAnbzvW5a/lDLlrafO
 EDRtbdHoa8toF8DkfGffxDwm346ETRRDWsxWQBxwDOOt3UpGDhabXrQEzwK6EiJQLV/t+wLoz0j
 v
X-Gm-Gg: ASbGnctZH9u/m9Pz/+0PXSZK/Dq2QUGrBpQ2OEUfvQy3KUZ3UL1faCniZPXgBmTVTuh
 c9plG2AW82h/beyEI8WVtgqtujy7qbPlIcm4Xspq+crVTkE/UdQCtUNiYNDdjd5NIq93P6rEHbq
 z15wsudalTEMJpinGChjHkF3LY5ki51EsnQY1/3/JGjyWVH1hX/jxAnQpce5po8zpBCfRWljTbq
 4909CDhpB9v3EV+iNMMXDlBpF0OgvaeHA1JT7r/J+NxpbjeDNzZ2owa8CiiqXsAh1bbgarTthC9
 yPLy7RTyMOLYJ+YCqW7Tp4safRvqjh+IODh8/op9Ni/7SC2Gv9HikA==
X-Google-Smtp-Source: AGHT+IH1tIHlTQqpTykExVm212cOO+yf+b/OqHvOkDG1PevBoIgHlMhgb61zPKQ6Ud4zuWm597VXdg==
X-Received: by 2002:a05:6000:2a2:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38a89066f45mr2918008f8f.38.1736377531138; 
 Wed, 08 Jan 2025 15:05:31 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:30 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:18 +0100
Message-ID: <20250108230521.1345210-9-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377531; x=1736982331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiDH6pqSJ+Nqt1g9NAK9gAUV5iQPLFT/nbErPhwlCMs=;
 b=eJ63xmqmiU4ptiVdRqakvsPaEjJN/v3oesqifZqt+OqSdN+hkicO9qi+nwm9PZXGEw
 jkIt6nvcgJbRCDNTx6LFDXJrs3WGylrFfyNfpFMdv+qz41NVsaA9n2EwAwyQgClSfRQ6
 M8k/sz2wknrqmRyFuDU+wR+6bQbeImozJsth8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=eJ63xmqm
Subject: [Buildroot] [PATCH 09/12] toolchain: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_93847 (nios2 only)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/asterisk/asterisk.mk | 4 ----
 package/git/git.mk           | 2 +-
 toolchain/Config.in          | 7 -------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e27aa2f760..7b99d30fd9 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -290,10 +290,6 @@ ASTERISK_MAKE_OPTS += OPTIMIZE=""
 
 ASTERISK_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
-ASTERISK_CFLAGS += -O0
-endif
-
 ASTERISK_CONF_OPTS += CFLAGS="$(ASTERISK_CFLAGS)"
 
 # We want to install sample configuration files, too.
diff --git a/package/git/git.mk b/package/git/git.mk
index f56807a00f..bc17c9a993 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -66,7 +66,7 @@ endif
 
 GIT_CFLAGS = $(TARGET_CFLAGS)
 
-ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),)
 GIT_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 87160af3d7..23123138e5 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -180,13 +180,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
-# ICE: compiler error: Segmentation fault on Nios II. This bug
-# no longer exists in gcc 9.x.
-config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
-	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
