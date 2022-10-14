Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B281CC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 17:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A1CE41593;
	Fri, 14 Oct 2022 17:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A1CE41593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4KdvT3YCZQO; Fri, 14 Oct 2022 17:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450EA4158F;
	Fri, 14 Oct 2022 17:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 450EA4158F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2AA91BF297
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 17:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D1842427
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 17:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D1842427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaXLAFlHwRVt for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 17:20:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C2C42425
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3C2C42425
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 17:20:23 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id s3so4080713qtn.12
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 10:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lHsZDbnU6JkTADhL0N7RW5m+a5nE3DbrFYOI9+io3mc=;
 b=F3xLxinOAgRmWFbI1rSgpyzkYeoHkwDPPwCmhYEi04TMcRLlX7gCMA+/4LzqxD4Qzu
 t3pL1ZxBsAZwxZL+5/YlebrcgTQCvnIsLHre41c2vUpNfYI+i6BafJ+pROcXrZvg6V2y
 AlzXiqBx7tkc/phq3RcQ2fiF5Z5Xd7+AJNmmtA7Plb1e9+0zJHT4/MOCjKQLRTk7owO0
 aSU6ALZbpF7FN3BnSKGU2nSXcbqsxCy/jxQFPWw5O/RyACHRjl05Ww9Y0YVCQFzp3vWH
 +dQt9g6DMmOVjuzAx16v/9YVTNZYcO8aa2CxIONq2oG9hVSUUcU1/0DIb/sGSHrPeGUu
 mmNg==
X-Gm-Message-State: ACrzQf1QYRw9sBJ5oSk2tSjMc278+heOlyDKbgsSlOayNvLKJfrAHWGd
 7CsoyKzs7hAQzTThL4N3iloOPA==
X-Google-Smtp-Source: AMsMyM5JgaWjpeK+crsiPgYE5mpnuLA/FfP0sjueYQ1QEGqLr3taSeCMW86EBACBRbdqrdKjPLHZMQ==
X-Received: by 2002:ac8:5c0f:0:b0:39c:db4c:82af with SMTP id
 i15-20020ac85c0f000000b0039cdb4c82afmr2301713qti.538.1665768022307; 
 Fri, 14 Oct 2022 10:20:22 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a37ea15000000b006ce1bfbd603sm2677509qkj.124.2022.10.14.10.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:20:21 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id DED304A93919; Fri, 14 Oct 2022 10:20:19 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri, 14 Oct 2022 10:20:12 -0700
Message-Id: <20221014172013.758628-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lHsZDbnU6JkTADhL0N7RW5m+a5nE3DbrFYOI9+io3mc=;
 b=Z2BfmCed2jui+9LwlBQCMRnzCvly58dxj+atjz9bYj+vGpc8QAjw3vsvJa8QQMiUBh
 F0wGgdZe6Wjz29u8lKGtotwYXJKLrWiKzgfrKregvXYqOa3mh1ytvb08R5pPAJy9N430
 6yHlJGyeD/ANJwPhCQO7fslonOwxQHCufLEq4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=Z2BfmCed
Subject: [Buildroot] [PATCH v2] mmc-utils: allow enabling of "dangerous
 commands"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provide a config option that allows the user to enable mmc's "dangerous
commands" if so desired. mmc-utils considers turning on permanent write
protection on a device a "dangerous command" and doesn't offer it by
default.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/mmc-utils/Config.in    |  8 ++++++++
 package/mmc-utils/mmc-utils.mk | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index 850aeac44571..0283658a7a57 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -8,3 +8,11 @@ config BR2_PACKAGE_MMC_UTILS
 
 comment "mmc-utils needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS
+	bool "Enable dangerous commands"
+	depends on BR2_PACKAGE_MMC_UTILS
+	help
+	   Enable support for dangerous commands in mmc-utils. mmc-utils
+	   considers turning on permanent write protection on a device a
+	   "dangerous command" and doesn't offer it by default.
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index c84737869264..14e2bee58736 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -10,12 +10,20 @@ MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
 
+MMC_UTILS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS),y)
+MMC_UTILS_CFLAGS += -DDANGEROUS_COMMANDS_ENABLED
+endif
+
 # override AM_CFLAGS as the project Makefile uses it to pass
 # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
 # with the _FORTIFY_SOURCE that we pass when hardening options are
 # enabled.
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) AM_CFLAGS=
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(MMC_UTILS_CFLAGS)" \
+		AM_CFLAGS=
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
