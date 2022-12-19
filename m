Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA305C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 308448187F;
	Mon, 19 Dec 2022 20:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 308448187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7xl8LQ-LGMk; Mon, 19 Dec 2022 20:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 706458146B;
	Mon, 19 Dec 2022 20:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 706458146B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6131B1BF369
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 20:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C3BC8146B
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 20:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C3BC8146B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuUpSU-8gGye for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 20:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6959680C58
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6959680C58
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 20:23:16 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so10044982pjd.0
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8GzEICf1JvUA7jivkQA+NceUlMjKxGTBoCIqESs+0Yo=;
 b=2Oe92BCPay/RoRzmFBUR+SCgk40ybqV6dll2Dwt3TrkA8Xa0j1F3gsYTJ8k8OO+4Vu
 j2JPj7pnSjPf5Pwos80UbEmqgWj24L9Bd8jTeHhXpsk7a1FEhLrR8vhY/jbfbjWa+lnW
 uwInksWyk++Ynq7lVK4d5fBuKHGVDX7kc/4xenLySNzUwuQDhQ7TEHk4BF1IMuVRAwSk
 mMjNu5SosCs3uNhdZ0qugaZQCEkEQwoxiVbfeQTvdHg5V9mNy7mopU+0lQD9fVOR3G5k
 L6zLqLWpVu52cZ6gkIY7w3e3YKB4u08YPJYhS6XQ9qvZ8JCzhmvr6nvOaGc2BHcd9CnH
 lGaQ==
X-Gm-Message-State: AFqh2kpZ8vpm1dqTPkDfikJZ2X6dfabYtI8ayHXiiooG+/SuDGvZkwAe
 /oDIRI2+5nM5U2Iye7sffFEJHeWZId/6Rg==
X-Google-Smtp-Source: AMrXdXuKRURxQYjtseGiJDxIX9T/RYMtSZIzd7fRfBtThrScDoqwODDM14UR2fiMMuWljexAS7GruQ==
X-Received: by 2002:a17:902:e54b:b0:190:f536:e4a0 with SMTP id
 n11-20020a170902e54b00b00190f536e4a0mr28429282plf.20.1671481395412; 
 Mon, 19 Dec 2022 12:23:15 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902ed8b00b00191152c4c6esm4291404plj.152.2022.12.19.12.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 12:23:14 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 12:23:08 -0800
Message-Id: <20221219202308.2597300-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8GzEICf1JvUA7jivkQA+NceUlMjKxGTBoCIqESs+0Yo=;
 b=MK/lCkU+qibEnlwRPd1AbHr9qYvYi1p5D0mngBBRKegvPVkxsoaN9KG1XInCmmuQQQ
 rWU/EHOxHF173FKBygyV8Vw/btGDqkbeqtV0IPBW2h8BdejF1cCcmM+Iz1PDgIelcVAr
 hCWSFoRlDK5ZSbf3gbWgBFMxrmk0tnREZf6r/++PK+Bw7Bn2Z6CrHWNyzf6qzkwa3AZY
 XCnlSxfEQ4Cgg8qq5ml3rwtMUsKdCKnq4i0Ozb7/AvLMcQWbmgOUHgkAbT3VzliBIOsF
 zM33Xp5IXVs8tB4KY9d+ccl/tAy0n0ExXrcit/NDaXTqEmq1G8TV1N1I/+hCPDBt7qre
 g3zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MK/lCkU+
Subject: [Buildroot] [PATCH] package/libgpg-error: Disable support for non-C
 languages
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The only other language supported is CL (Common Lisp) which buildroot does not
package yet. This saves 52KB in the final root filesystem.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/libgpg-error/libgpg-error.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 86dea6ad2acd..0b7b8df389f9 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -14,7 +14,8 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = --disable-tests \
-		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
+		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
+		--disable-languages
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBGPG_ERROR_CONF_OPTS += --enable-threads
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
