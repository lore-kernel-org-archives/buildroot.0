Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA90DCA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8784D6144A;
	Mon, 11 Aug 2025 15:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbivQ1DaEAVK; Mon, 11 Aug 2025 15:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2B76142D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2B76142D;
	Mon, 11 Aug 2025 15:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E210B1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C86E68223A;
 Mon, 11 Aug 2025 15:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTWODcyDTZy6; Mon, 11 Aug 2025 15:26:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C08F7807D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08F7807D5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C08F7807D5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:26:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so38669115e9.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926012; x=1755530812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRIS4M2KEebeuYeECtAkyf2Q1SqeFROz74WTjZLYBHQ=;
 b=rcZ0845dJ5IT5d6kSJzbezzjvTSoN8SIDmu5vL5Mn+VVmsDoDSwzRbsdZwCdBveBE4
 xcfx6qM+rTTaS0ObMzTQBbhC1G5juYAjjrSZOde83lQlRsbzs6HRBL8eR5jL/WF7h15L
 DoMQ8kyrUMfo8/tS4m2O+rsXI+OF+gAInJck+j7+7782OUNUsPF6Ty8B/iwq7Z0ohnKU
 WEnQYIfZkROp444tbalJZBV41SuyDU0LzOms1nvdmKKyK7BqBvYHKGYhH2yDVeLRzeM8
 fUQWqH6uyXtAbylqaKYMmtW7LOl/fOpGh9RVra6M6g0sYgqynSjG+Hk5bV5eTw3HOqTS
 HLtA==
X-Gm-Message-State: AOJu0YyPxAlWlb78cV/w9b5MEnS7VxIYdw1BgPqeejlqyQuhWVB2MW3H
 L5n5zWWFk0eA1MTexJuhIQwbML/ptm/6H4Gg6LmQ4WIauWu+jKIAYnty2CO+Og==
X-Gm-Gg: ASbGncsSrcm5+qWQjHrVYTNrKVtvTAbk4GaymhdWZnxKzLPYc1xS68MW9iIYhf0krNF
 LQIFaSyuJD7Xzj5ZA9lfZoMO6Wc4aTuRPrVsDGt+votRZh7WH4rfqaE1cZZNOIiE57QzuEc+dFC
 Jy2V9Iq4T3UfiatFP6gK7EfDb5ZGO6MtQ1OU15twAFgQSN8FpqETWAxWI1mFMenNFSF3jQSL2pI
 zEl7+XnCpAfVm9bQ0hrZqPPiCf8e2xF4LpO4tg6yYAZZC2Y+/K+RQizgKYH8eV5NarU2gVuzMY6
 6d/OSEXmNCWega63aa5s4je7fvHzOi0PLixcnaTfk/g9LVybjooHWPymExNAgum435Fq8H35Qad
 syF238PJ3ShPBtjNwHnG4XuahRe7RCeYi
X-Google-Smtp-Source: AGHT+IGcbpkaQ61Fg+PXxOvXx1N//kOxcvHboZVYRoco5gVqf5U9wdGmK/BF9iWeUuPS2a5etQ65iQ==
X-Received: by 2002:a05:600c:1caa:b0:456:e39:ec1a with SMTP id
 5b1f17b1804b1-459f4ec3a43mr133365325e9.14.1754926011437; 
 Mon, 11 Aug 2025 08:26:51 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e587d378sm256734235e9.23.2025.08.11.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:26:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 11 Aug 2025 17:26:50 +0200
Message-ID: <20250811152650.3689304-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754926012; x=1755530812; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WRIS4M2KEebeuYeECtAkyf2Q1SqeFROz74WTjZLYBHQ=;
 b=kU1GEjoXZ+HBVXcRrPxirKv0ABpPSEW5tML7xptajOgIyBs43fpkIr2jRtwQ8u/m/i
 e3k8cNHfyp/ZKRey/Q5Dp6zcvBhfVa0uN9Cat0S6wUwu+whurW8TyU6IFFOlJJ97xeEP
 V0CbxwV814MpUuYd4jppvEdVjMi+aZnWyIvf8GtXl6fALjkOS0xgw339Y2UWCtqs19nH
 bOLw5pLJkTopNFI0j/+1nWkz/YTQHbDn6oa/bzmLXty2niHNknSfWDYDHbyRyEoSBRuO
 qZaIm1Ho99w/tjhrczF1yOaEQfnu/ZLiwNi32/cjiosLr0Wfe5W9vaOrooC0abNRxf0c
 q4og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kU1GEjoX
Subject: [Buildroot] [PATCH] package/bash: don't use append-assignment where
 unneeded
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the first, unconditional assignment, there is no reason to use
append-assignment; it can even be misleading.

Fixes: b367ca32e53a774c174899e44c77ed1d128cbcdc

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bash/bash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 84f581da79..2747802592 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -17,7 +17,7 @@ BASH_CONF_OPTS = \
 	--with-installed-readline \
 	--without-bash-malloc
 
-BASH_CONF_ENV += \
+BASH_CONF_ENV = \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
 	bash_cv_getcwd_malloc=yes \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
