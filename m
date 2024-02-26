Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFA2C48BF6
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 17:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87CC260AF9;
	Mon, 26 Feb 2024 17:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QD5H6PAdP0DZ; Mon, 26 Feb 2024 17:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3DCC60B1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3DCC60B1E;
	Mon, 26 Feb 2024 17:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9BE51BF3E9
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B425781A12
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 17:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szosRtMxBNc3 for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 17:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96F3081B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F3081B48
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F3081B48
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 17:36:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5643eccad0bso5234226a12.1
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 09:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969008; x=1709573808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nBmQwQTYz9KmTXeubZxmfo1P6OPfnkAlaUWAuYesRZo=;
 b=qHdrHGvkRngDS8ZkS7Sj8Xj5bXOagx3NBboj4amJP5G6fMiT4g8q3wLD+wciqhvhSU
 mU6FWS1j+L88VAu8MjHUgWTQov66tHeBVwxGKQDsB2FjiP9jKMPRj4lYMlq4qny1RKVh
 pIO5MV0WhohkGybDhaycRBIxBoY3m5UO0p9P0rjOudeMxiMXn7Zs2myHGODqvEGMXLzE
 L1EGZQQgkMnG48pK6c+d74Bw1JgTJTwZB9ZDJauEEOrL/7owne/Clbirq7AJyAXY120G
 IgisC3gzNBZK4qc3bdSgwaIu2lPEyUZArn/Z+6H+15oB5LwcxZtOfAwj6OUxPcyfTRGg
 iAFg==
X-Gm-Message-State: AOJu0YyHTIPunnkbu71jTA7L3cxe0uHo5J2QJtKBz7MYbp786FKbj8zM
 z5EHm6M0KHFqu38cWydoL1o5VdsfZxuAvNJBfZP6y1fgDCh4RFh2BAflUruN
X-Google-Smtp-Source: AGHT+IHsqBz1rS5PFPjDSpc4k6A7eiIfa4UOsTygqnz1Ikb4S3afhLemfUpWWTNDZMAClTgc2uf4Hg==
X-Received: by 2002:a17:906:d96c:b0:a43:4ddb:a9cd with SMTP id
 rp12-20020a170906d96c00b00a434ddba9cdmr2547894ejb.37.1708969008391; 
 Mon, 26 Feb 2024 09:36:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b00a3d99dc3f3asm2580119ejc.67.2024.02.26.09.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:36:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 18:36:44 +0100
Message-ID: <20240226173644.1077579-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708969008; x=1709573808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nBmQwQTYz9KmTXeubZxmfo1P6OPfnkAlaUWAuYesRZo=;
 b=gTugzEaHmcSDvx/jfKdLgoK0m89g2DSDCWX97rNTuRnoLPCmmFphr0WJITxWywt/l2
 20eSYmmI9ufamauA7guOtKtIl5/85Sm8PtvKc3tjVlMwcfzfE7CLGgHaOWDKj/Z/lBoH
 qeIKkUz67AZ3YcqNFwfJ4KtReKrz5vWK6mpqx0yVKEJssYtbKeWVObDEanqG1C5qYq8e
 /HVHJ2Dnim0qJlWQPYvVk3JrpCvIBeGda8znpLivX6YiUqhtRN42fd97rv75F1qRcMvw
 OjxLtMAB+PnSV8m0/WIwPnar34K6dYCCPj5qeETfMKr1PfRGMCLxIKaQX8H9N6EmrnuQ
 xipw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gTugzEaH
Subject: [Buildroot] [PATCH 1/1] package/erlang: fix build with autoconf 2.72
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
Cc: Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use ERLANG_FIX_AUTOCONF_VERSION to fix the following build failure
raised since bump of autoconf to version 2.72 in commit
524f3536029dace3ce9aa154d3ca4685582e1955:

ERROR: autoconf of version 2.72 found in path! You need to have autoconf of version 2.71 in path.

Fixes: 524f3536029dace3ce9aa154d3ca4685582e1955
 - http://autobuild.buildroot.org/results/c9e8df3427fca9e8e75488e32bca18e81009238c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/erlang/erlang.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 1600b59381..84d2f4e898 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -17,14 +17,22 @@ ERLANG_CPE_ID_VENDOR = erlang
 ERLANG_CPE_ID_PRODUCT = erlang\/otp
 ERLANG_INSTALL_STAGING = YES
 
+define ERLANG_FIX_AUTOCONF_VERSION
+	$(SED) "s/USE_AUTOCONF_VERSION=.*/USE_AUTOCONF_VERSION=$(AUTOCONF_VERSION)/" $(@D)/otp_build
+endef
+
 # Patched erts/aclocal.m4
 define ERLANG_RUN_AUTOCONF
 	cd $(@D) && PATH=$(BR_PATH) ./otp_build update_configure --no-commit
 endef
 ERLANG_DEPENDENCIES += host-autoconf
-ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
+ERLANG_PRE_CONFIGURE_HOOKS += \
+	ERLANG_FIX_AUTOCONF_VERSION \
+	ERLANG_RUN_AUTOCONF
 HOST_ERLANG_DEPENDENCIES += host-autoconf
-HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
+HOST_ERLANG_PRE_CONFIGURE_HOOKS += \
+	ERLANG_FIX_AUTOCONF_VERSION \
+	ERLANG_RUN_AUTOCONF
 
 # Return the EIV (Erlang Interface Version, EI_VSN)
 # $(1): base directory, i.e. either $(HOST_DIR) or $(STAGING_DIR)/usr
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
