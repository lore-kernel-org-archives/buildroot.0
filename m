Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93098C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 23:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F27340999;
	Wed, 14 Feb 2024 23:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XR187iHHRZL2; Wed, 14 Feb 2024 23:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61ECD40816
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61ECD40816;
	Wed, 14 Feb 2024 23:01:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 919251BF57B
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BC8B60835
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TQmpCgBU9use for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 23:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=vineetg@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CA5D6075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA5D6075D
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CA5D6075D
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:01:44 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5c229dabbb6so208808a12.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 15:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707951703; x=1708556503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxlxXjpvROVqB5V+MReceg8qankVCwW7zfEG6/aE9qY=;
 b=f0y20EZph7ybko5KI2zE/tlSUScq6i1eBR32d1LAo01bu9ZzViHSQNjkXgQbwX30EX
 DXwB7h9gCLpRcH6gWz7oTLVwh6su2DiXCwrPlgc/94ylAIuckfC+KbQf3PcEqcHTCBxd
 lrXKde5QzrOPv7S4Om8UcJSFgX+gRbdCbnsOULl9luU0ClxI3n+zAcC4UAtEulanNKUp
 YsxCNmRNYyxXWtbzI3kTpD9Xwx4j1Dilw7tf9spmwphEdgJeP9gHa3l8Yq5+hWyuAveO
 mnvpkntfVrNEvuaKaRo5zxH5xhUftmX+Y0UQhsqXQqw4hJNwMe0jlSr7cLKq75ZOiGUz
 U1ZA==
X-Gm-Message-State: AOJu0Yx62ttLvnXiO0ZM7i6E2zepktbX53+k4c03gSJmdgSr7SpArVeY
 5HSSybXUaWzto5QScerC4UkpY+v3kXjVz0aasTKJFwXCtVXykbPgvmKDOvNhS04Z9D4Dfo0+Kpz
 0
X-Google-Smtp-Source: AGHT+IH9PGMeweRDKddZa4OBuoZB8BPMJ3JWF2xxjz8T2WZ4EzPd0BkJCrkKnm4kynULjD1KQx9OhQ==
X-Received: by 2002:a17:90a:bc88:b0:299:4e:6b17 with SMTP id
 x8-20020a17090abc8800b00299004e6b17mr97308pjr.20.1707951703450; 
 Wed, 14 Feb 2024 15:01:43 -0800 (PST)
Received: from vineet-framework.hq.rivosinc.com ([12.44.203.122])
 by smtp.gmail.com with ESMTPSA id
 js5-20020a17090b148500b00298d6b4e8c9sm26460pjb.10.2024.02.14.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 15:01:42 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 15:01:14 -0800
Message-Id: <20240214230114.551779-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214224355.551010-1-vineetg@rivosinc.com>
References: <20240214224355.551010-1-vineetg@rivosinc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707951703; x=1708556503;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxlxXjpvROVqB5V+MReceg8qankVCwW7zfEG6/aE9qY=;
 b=UX2xdEdI0UdWutH84dXvNFrkI9Sc0ZjDM7v/zRF++Ffn7crXclVA9gpydWsP8/5hzG
 M5aJBcbeU/uJd2rjFqJaY01fABP33pj6xlWD0pTczoa5Bum+2j0bz1QB+qtuRzZIT0dS
 X7U+WBgUcRgsXeyzcwC7AWLgXhFZMYqTjiTdDZn7O2dkxY5fNRb3AUCUjpMuoHkIJFQd
 74ClJvzsPhT4CiSxA+T+P9IjWhdoc/1SWE3DwvPFFS1QIh87OFhBtg5ZMV68tssosbFL
 +imWOsSAHKmQfAcZBe5CY8eq17se+up45CPCE72Bl4OzdiUGSLbTCDSvD1CGjMiVVdqE
 kV3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UX2xdEdI
Subject: [Buildroot] [PATCH v2] glibc: build: honor toplevel
 BR2_TARGET_OPTIMIZATION
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
Cc: Vineet Gupta <vineetg@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

glibc though part of toolchain is technically target binary and thus
needs to be built with BR2_TARGET_OPTIMIZATION in case users want to
force a certain build toogle from top level.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
Changes since v1:
  - Add to exisiting GLIBC_EXTRA_CFLAGS if any
---
 package/glibc/glibc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d198d6f04cb2..ebcd7b2bdb21 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -80,6 +80,9 @@ GLIBC_INSTALL_STAGING = YES
 
 GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
 
+# Seed with any special toggles user may have setup in config
+GLIBC_EXTRA_CFLAGS += $(BR2_TARGET_OPTIMIZATION)
+
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
