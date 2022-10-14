Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B244C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 00:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C1283FAF;
	Fri, 14 Oct 2022 00:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C1283FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzxAOlwi5moL; Fri, 14 Oct 2022 00:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B3B683FA9;
	Fri, 14 Oct 2022 00:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3B683FA9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7BA1BF3A1
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 00:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D0D405FB
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 00:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D0D405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01loKooIEdCB for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 00:51:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DE7C405E7
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DE7C405E7
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 00:51:06 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id mg6so2359775qvb.10
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 17:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7OuhFyitca+c0q8LA7ZQ+OLDG0OgpugWeYypm6KXACc=;
 b=RilK0crofcFEpwJ6tVl0uW0pN9rOSqwF6tbLqa+ZLUXKsNYt7rh69qpwA4NHY5Xb9F
 ockdfVOkCfgtPsztG03yviTFvSgzs3XeeebWPqe8pRqRG6Zvr97EHwEEGR5BnRY9BEo1
 xiesX4/JGRxhqkIrMkqKihnviLS9/iyPmY2Sf6a38S2eJRDyg1v7hyusvgGe7Fmzp4HE
 sC2bM3AjS2mL8eG0U+zkdio38Aw20oD8PMKP3UEglRbsNjgNvwUBWEqD14dffWxET0cb
 pHKtWKxTy0SkRdtknQoLFduQ1K4ZNzI5hDLlbAu2nudxcLS1hodrvf5lX8sRcNsfT0pi
 3DLQ==
X-Gm-Message-State: ACrzQf0tAZAoEor3kWV9iqf9Zjl9Iexe/OU5KWOrkM7xSFYz516JbhZy
 uthkbIwbwrB5yxm2TPJVdFnhmA==
X-Google-Smtp-Source: AMsMyM5Nu3X2hbEn+bH6LJ1+a56XzXAh3TLKxzawFAMLUol6FVMD5vznPI4TfYOL2WY8dI+j/bAd6g==
X-Received: by 2002:ad4:5962:0:b0:4b1:d684:f726 with SMTP id
 eq2-20020ad45962000000b004b1d684f726mr2099472qvb.31.1665708665033; 
 Thu, 13 Oct 2022 17:51:05 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac874c4000000b0039cb59f00fcsm1031741qtr.30.2022.10.13.17.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 17:51:04 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 9F7644A920B9; Thu, 13 Oct 2022 17:51:02 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Thu, 13 Oct 2022 17:50:55 -0700
Message-Id: <20221014005055.746362-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7OuhFyitca+c0q8LA7ZQ+OLDG0OgpugWeYypm6KXACc=;
 b=SX0ZqCE7dU8p3s5WGasp5a0Z9UQUvWs83CU91tt4jMOfTRuDgQF8+TPXvnssvo0rAN
 luz+/gnfqJ7FB53mGpKOnh60IMzuCYA4EaWezou0EM4Ctpw2fdQdHlfoRoLBMvGQlHdn
 Xr4/eJLztZ74U77fx65JPYUwML3k9mTcj3poU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=SX0ZqCE7
Subject: [Buildroot] [PATCH] mmc-utils: allow enabling of "dangerous
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
 package/mmc-utils/Config.in    | 8 ++++++++
 package/mmc-utils/mmc-utils.mk | 9 ++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

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
index c84737869264..a176cb94ae43 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -10,12 +10,19 @@ MMC_UTILS_SITE_METHOD = git
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
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS=$(MMC_UTILS_CFLAGS) \
+		AM_CFLAGS=
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
