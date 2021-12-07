Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363E4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 21:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC2EA405BF;
	Tue,  7 Dec 2021 21:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKom427-EJ1d; Tue,  7 Dec 2021 21:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB5F41D76;
	Tue,  7 Dec 2021 21:54:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF7C11BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE49C401B6
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZV1hC2dq47a for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 21:54:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88F9D40186
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 21:54:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so2849999wme.0
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 13:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5D0EKRk8he4plHGAGXQz5JuKo2aN/79hrDMrLlMJ28=;
 b=ppCgTYNaWoD4iL/uSRpIwyg0QyA/9YGSsAZNcB1TAtIR+HLYBun3HaU29Owr0jrEPm
 1ZQefqLgNLgGWbKbDalVM9Z7+rb/Pqo3uYkAWgom1O+yR7UFCy5uUnl56ooU32XA5rUS
 oix9LWDXMLbYV9bAu/76pQXyo0XvBGD4W7S4lW0nZ77uEt8LF2eYYmtGi3P001L2b7VO
 Nx69jsIbGYuzsTwmJvt/hQAH2MSxOTIbegrVV+ndV//dAnSKHKuweDSN1smCYF6M41YW
 UEzE5/vmHiTPbP2G/+UkNiQvrxvpWdj+a9F42JOZe0fLvwFtuPWpZZ9Q3Sf2jX8Ym2T4
 7S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5D0EKRk8he4plHGAGXQz5JuKo2aN/79hrDMrLlMJ28=;
 b=jQunrPEv815yDwNCti9dgLePNjfFt82mEtXsivtvNPcIOy7QJT47iCtwWq8KM7cQP7
 xXGDq7Zog4Dw7CF1y4oryBz1RyDxY9PLjEXtTIrnyUddS4cVNO3mpDZELdY67tm70I4P
 oZeDqMeB2hC85RUB8j+8Ck3tgnVGnM6bMM4lJfcdFd+AshQyk/00JfBx2GaIUF0db9Di
 PIx9HGuls4VobQ7BD++C81+EP9elIeoEgOBaSKNnv+gY3VRomiGn2wuLUuuSGtuIp1Yw
 kFxYsRYAQU8qZ844PoiFIzkq9A6yMgqJnoq6RIzOMliwsHXH58y6LdbrOs8/UARqhn+e
 SXMQ==
X-Gm-Message-State: AOAM531JkQdN5FYm6nw4Mx0qQM1nLkZjg1SR4bWMiMsq8RMZDPLPjKkK
 8zfPko7HKKdt+KG1qwYPfW813v0KznILYQ==
X-Google-Smtp-Source: ABdhPJyJAuH4Zet9ti1U4k+dPKeVErVWHxsZtj2dcWR/VPP+uRoevIxLZbXLhRf01lsSRyRSS13fLQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr10505282wmc.39.1638914062638; 
 Tue, 07 Dec 2021 13:54:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z6sm1029113wmp.9.2021.12.07.13.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:54:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 22:54:19 +0100
Message-Id: <20211207215419.3319061-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207215419.3319061-1-fontaine.fabrice@gmail.com>
References: <20211207215419.3319061-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/stella: zlib is optional,
 not mandatory
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zlib is optional, not mandatory since version 6.1 and
https://github.com/stella-emu/stella/commit/00e464afc3a2581e2716b3eec9c516a36f895236

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/Config.in | 1 -
 package/stella/stella.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index 22507edd60..4d28e96df2 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_STELLA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_ZLIB
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
 
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index e7b0082e7e..9e21606155 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -10,7 +10,7 @@ STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VE
 STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
-STELLA_DEPENDENCIES = sdl2 zlib
+STELLA_DEPENDENCIES = sdl2
 
 STELLA_CONF_OPTS = \
 	--host=$(GNU_TARGET_NAME) \
@@ -24,6 +24,13 @@ else
 STELLA_CONF_OPTS += --disable-png
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+STELLA_CONF_OPTS += --enable-zip
+STELLA_DEPENDENCIES += zlib
+else
+STELLA_CONF_OPTS += --disable-zip
+endif
+
 # The configure script is not autoconf based, so we use the
 # generic-package infrastructure
 define STELLA_CONFIGURE_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
