Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E330C3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBDD41486;
	Wed, 14 May 2025 16:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1Q3kou8NmFV; Wed, 14 May 2025 16:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7F041517
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7F041517;
	Wed, 14 May 2025 16:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB14312A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB5C607AD
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubnO_DHclQ-b for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEE65606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE65606CB
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE65606CB
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a1fb18420aso3040f8f.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241911; x=1747846711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=79igz4Z5t/g/Bcl+dWWFg7teQIguUKtWKZJhZugIco8=;
 b=YeNUZ0aWjeN9dteQICHQcIE9WtELMAt90M0n4VToZSQo7trtVYsUgNoa4MKycj2ioa
 ObVyYLlZbwXDtLz8tU1ySs9Jrht5tUeSftnkE5BdvnPzhS06g7AzvZVmbEGgFwm1/SoL
 OvSDfNVydA3xGeX770uvPTU/C+OLBHxexz6DQniypaP71eBv+/NlbW+4JUGuWE2TNDkm
 jCgmF4kU/fAjyEWTmb+vouzhFLXr2bEGIXQjpQcG/mLgKHqah+TJlSKcAPADz8s79D7m
 LIvoufvseEctZs/bGrbgUp2e2PC2z/1XnXkhkDTVTPgvf9zge+q0ZfGkcZjdKfopii42
 Cszg==
X-Gm-Message-State: AOJu0YxQ+m0EicJdpBW612hd4oWJhDZSapBsOtX8+xltc9qpMFJYG1pD
 v/qpKCFXSKtgV+HcCZ7j0YCPHp4WHbLtYcghBSQzRYxC6UjG8k1cZAJoZg==
X-Gm-Gg: ASbGncsCrAZvhtN+UsMcYBX5zearzcNyH6SJCrnCT7Cg3AutnMp+CTsFyl7SQC2HLF6
 EjGuN0TEuzHrZQtLYWC7CiqcarLy8E/15l4WiM7JnT2VeeXDUQw60InQ2fiutALGUNHOnNyv40T
 XTI0PjFoqPzEMUrLw8Sxmw9NpfJ66aVHFJpTxtZbwHFlN1ylrFaB793o9Co0ZnlVNgNwwuQosSB
 grwzmVHUmSRuHIfC++7XRGarsYHjnEGaj2SVTEyGAUbLXRWTzCuyTy9PfY//EDVoQtgcjOczhZC
 ln7CHAodQMUTlU6rOSv0hodlotEYnAAKax+ywAlxcFrhhvoHRPFWREeL8C20XgdoJpJPlpVp
X-Google-Smtp-Source: AGHT+IGfgLw60dqwxD/0DDLnOKas+H6ZCcNB8pPo5m97IriB9Mvd6nNsMi2qXT/hpOrpkwCuJULPDw==
X-Received: by 2002:a05:6000:1445:b0:391:41c9:7a8d with SMTP id
 ffacd0b85a97d-3a3499512f5mr2918411f8f.54.1747241910553; 
 Wed, 14 May 2025 09:58:30 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:30 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:18 +0200
Message-ID: <a014de507585b759a575d0ba424a4c5a996fa108.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241911; x=1747846711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79igz4Z5t/g/Bcl+dWWFg7teQIguUKtWKZJhZugIco8=;
 b=K+obpC4DR1lQ59p2qpROl/T766zH+G3ncQVppOZMjINqFzGCyTAG9dj0D8otD8kxs+
 REXU4a3i7WfeaqxzT3sGbbjNU7jkPLZe9pfk5TIK501bV/7YC03OPirG62+4ZolxXY8f
 lF8rMIxQu83nhE7K+62rpagjYhPPOD5Nrd1f6tlrBmhIp/z8EgW2urrrif31hpqWU0IJ
 DuIYdAW1pvS49ItPHKP7CN59u5qtB203Be3jkd2bTOHBfYiEBm5O++FhodICOgyZ9lyV
 sYnapLXhWNdMtqUUZGSRuQstGdfBJjRnRjtyJRGAmVmWf/ip4lr0egbo8VaczpR3crrZ
 TpUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K+obpC4D
Subject: [Buildroot] [PATCH 06/13] support/scripts: rename
 check-merged-usr.sh
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're going to need it to check merged-bin, so the naming would be
misleading as it would no longer be just about merged-usr.

Also drop the extension, it's useless.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                                              | 2 +-
 package/skeleton-custom/skeleton-custom.mk            | 2 +-
 support/scripts/{check-merged-usr.sh => check-merged} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename support/scripts/{check-merged-usr.sh => check-merged} (100%)

diff --git a/Makefile b/Makefile
index 411e1de515..a5aa1c6553 100644
--- a/Makefile
+++ b/Makefile
@@ -784,7 +784,7 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
-		$(Q)not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
+		$(Q)not_merged_dirs="$$(support/scripts/check-merged $(d))"; \
 		test -n "$$not_merged_dirs" && { \
 			echo "ERROR: The overlay in $(d) is not" \
 				"using a merged /usr for the following directories:" \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index b05c834b94..7d64959711 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -27,7 +27,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
-	$(shell support/scripts/check-merged-usr.sh $(SKELETON_CUSTOM_PATH))
+	$(shell support/scripts/check-merged $(SKELETON_CUSTOM_PATH))
 endif # merged /usr
 
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged
similarity index 100%
rename from support/scripts/check-merged-usr.sh
rename to support/scripts/check-merged
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
