Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F36C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12094841E9;
	Sun,  2 Jun 2024 20:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTgIuGKHBpkz; Sun,  2 Jun 2024 20:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC6D1842DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC6D1842DB;
	Sun,  2 Jun 2024 20:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 147DC1BF853
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF71783330
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRRJufcjRQzS for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BC9D82154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BC9D82154
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BC9D82154
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4213ce259c1so1652605e9.3
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360797; x=1717965597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AxOi7Znm8e5Y3HVPxFJcN/1hPCnLaEc3juQ2n41eSxw=;
 b=hXeXAX22AGMKepbKvfVLbbuVUalsxHbe/yYi+VD++8BcP7O899pIOF4FuXAKfGI9Sr
 SAdtPSZBf/iUPeho2rcrktVFa6MggCsLZRFRNZynJEfKUhHXvpTIUYZIHqWnIE96Tz2W
 nR/1z2ZYvyKYOScxQbUkHe5v5BlkKxQvumE3z2tlZDpqftNuz9bQa9GPo7Ettmo/Q/09
 RSjdtzvvajIYV9mVxrLN++X0P45NEtGPxYI+aGjU4ML41utjpD/tGnAfF9xGgAWXz1qu
 HssOnr/4Tu+e1/sWRt6dx70qpnBVG9AEDUsi54FWtcHBNDax4AtmZUSbGmtLso9DiHZx
 sfxA==
X-Gm-Message-State: AOJu0YwymWmdwB4PNyCSM/z5YwyHlWOYvSj3NjB4dOc6Uxds7EcHxSxD
 BYPwqa9IaewmtEdKuwWQLlt5lemXa2HxCwy6t9/6IX4ZIhFX7ZB4+Ii5GQ==
X-Google-Smtp-Source: AGHT+IHKqBFwPhf/iABqrI3Gpa7flM9broeeEGK+UKcJkggq6Qb/e2MxGv9J70DdVqegVdeuVxH5nQ==
X-Received: by 2002:a5d:574f:0:b0:354:eb62:3653 with SMTP id
 ffacd0b85a97d-35e0f316755mr5318690f8f.53.1717360797521; 
 Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:47 +0200
Message-ID: <ff3778a15fc17807180a9b3fd3bc48d2b8bb2b15.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360797; x=1717965597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxOi7Znm8e5Y3HVPxFJcN/1hPCnLaEc3juQ2n41eSxw=;
 b=ZNffZps3RtSgSZXxOz75EeiD/etpOvi4pOkfX3scNh7cII4bf5psFw2gxnDB2SD79z
 aOpIunqoPCuRJotaZVZWNWbiom/fx3bQ3criKoMgZbuaR1T6EOitIxqc4dQUkCKGjW6H
 XeO4jHrNlqX8vTfJCRhQ+LZcr+Mw2fuSIhNLOjAeAiJYsT4VpZAV5yNMax6BMHWut/wh
 gzhf576fOSA9W8vpQRofGcylQfJHEG1G0Gs5TLekH9wqcF4qnssCsIGtlAIqbISwJk+e
 TvfMIgHi1o1vg4rexGmNrvUglO1kOH4tnw1Wph/xxMopNuqSEUp4TrMGRcXqBANZInkg
 a0PA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZNffZps3
Subject: [Buildroot] [PATCH 11/16] package/python-bcrypt: use post-process
 opts to pass Cargo manifest path
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-bcrypt/python-bcrypt.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index f3137401d7..f09c67441e 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -19,9 +19,8 @@ PYTHON_BCRYPT_ENV = \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS_OPTS = -m src/_bcrypt/Cargo.toml
 PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_BCRYPT_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
+PYTHON_BCRYPT_DL_ENV = $(PKG_CARGO_ENV)
 
 $(eval $(python-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
