Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED759C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 09:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E2FE82438;
	Thu, 30 Dec 2021 09:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzsn-N_9KJ4V; Thu, 30 Dec 2021 09:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F9A81B71;
	Thu, 30 Dec 2021 09:14:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 613551BF346
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FBF540241
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uc-x5An6f6jS for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 09:14:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7D56401DC
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 09:14:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w20so40232541wra.9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rgI6QDYdt1UIhdVfDT/MfUu3BMtYWltmKRf+BdGFKOg=;
 b=WkNt6Rw0D94CvElX725g2EIryJedCEWN76LlvFq2JvSvzMQ+DTI/rEPZwvlfufTFOE
 ssp3nHd2S24B3x5nkpGoOxTDTxASu0tou5x9p9TIQYHx/s+CLVNTRtplF4Ib9IezA3t/
 axpr+kIErXcDMGAnFBym+H5zAynvio/cv7KkxhfdojsMkRJC78IRoFIH722qgqA6bI1a
 llOhlxDPRV2mGuUL7yQADHay/rySVJAwOTS7ubqljZfvJT4C3SWguHkDMjITSJVg0Bxp
 xDvzJH8BpmdyQ7zU5fNynroQTbV8TWvKFjkn38hSZrZMVt6j7wd0oVvVGqVCwn/QK9SI
 01zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rgI6QDYdt1UIhdVfDT/MfUu3BMtYWltmKRf+BdGFKOg=;
 b=XSRy+j5qCgddotxcqAh9tkZ2igCJKJFAzOGdOmzWjhz+ltWQZoKWnwfNnn9pT8alKT
 2GMXYJmfNmJ3kHfL9nsJxRsdOzQs2yED0w3wJEbAX0tVxXrLw4tY3vZmyMO5zWr8tru6
 cqGHe+X/MiWjriXKEuGWRSveXUFFYOsOYsZdxo2diw5RxBTTo+/Fb/N/h9+NvY06UcEM
 sPOuN8n3P3hu+HGC5mBmEUokx1MY/J/EFPLAskuKjzGYX5+rlvLj3WRy2GlPuJiR/fWp
 UpIJUGy9gpAtvoydCS6AApwH2MqGT7Y1+vd5eCSEmz6/xEsb+J4QMtcOKgxgbI4VbbtG
 KqdQ==
X-Gm-Message-State: AOAM530Bn6QP9f9Vff2BeLD9eoFRFm9hIdSCfoIlwcWiDFTN1vVY3zY2
 j1xi48wpycRPyQVCt6ti4lBdRl+NxCg=
X-Google-Smtp-Source: ABdhPJygmOsULIvu9AnzNPed5ZEVR4ANcuw0CbqYl1Rv8grba/RJG3NR8h4X3UhSyCIAZviB98NHUg==
X-Received: by 2002:adf:e109:: with SMTP id t9mr23691035wrz.387.1640855654201; 
 Thu, 30 Dec 2021 01:14:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z11sm29538228wmf.9.2021.12.30.01.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:14:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:13:30 +0100
Message-Id: <20211230091330.1445939-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: argp is needed for SSH
 plugin
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
Cc: Martin Hicks <mort@bork.org>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

argp is needed for SSH plugin to avoid the following build failure
raised since bump to version 2.4.2 in commit
b537fe14339592023221a7c200257eb3a923c0be:

configure: error: You need argp library.

Fixes:
 - http://autobuild.buildroot.org/results/6740792920a28c91f4f82a8f8c2fb525ed80410a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/Config.in     | 2 ++
 package/cryptsetup/cryptsetup.mk | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index d9c9d4d4f4..f36883ea47 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2, libargon2
 	depends on !BR2_STATIC_LIBS # lvm2, libargon2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && \
+		(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL)
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 980a36faa8..676cd25be4 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -34,7 +34,9 @@ CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
-CRYPTSETUP_DEPENDENCIES += libssh
+CRYPTSETUP_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
+	libssh
 CRYPTSETUP_CONF_OPTS += --enable-ssh-token
 else
 CRYPTSETUP_CONF_OPTS += --disable-ssh-token
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
