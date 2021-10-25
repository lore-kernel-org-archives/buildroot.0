Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD366C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A842261002
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A842261002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D3C60836;
	Mon, 25 Oct 2021 07:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RId2aCARJMVN; Mon, 25 Oct 2021 07:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D85566070F;
	Mon, 25 Oct 2021 07:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2323F1BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12A166070F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Em2cRaohYjCK for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27DCC6065A
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p14so5083646wrd.10
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=frREvy7oqin24ry9GDuwLu35XjLoN/cIxBVjCUUnLiU=;
 b=PpqPigJ4fIrzyxWEQv7ZUs0TiaashHYUCIHv2v/UQ49vc4ONEh16SW8tNLyDjPgGHM
 jnphsKbCiA1BlMDbXad+xN0eoPwphh0rf3oXeMvA6BgoHayXzHx1AmmLBnAbIjYeGMfG
 Vg30IvVYXMn+u2VnuD1NnxIkMKNHtWARXFnz582pVXLODFNVGzu95yDKix/tydwRSN4s
 FZXayH+TCncjTGG6UG62b4OxCvxO5zlbKCjK2yhivPTRZx0aOMJC0eGkmYiIuD4tgbj6
 LitQn9IUpcrcrPD7sAsvQiLRE+t0Vz3yB11i67ko4dNUS6MLXFZ7Z1ZQbW/Y+xcYP6O0
 7/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=frREvy7oqin24ry9GDuwLu35XjLoN/cIxBVjCUUnLiU=;
 b=B5JfRIALEmlKQYpfpMExBU/SPNCZhB9hOMhi/oKTDeWoHdNMCXBbkro34Aa7D8h/Vz
 6l4rj+xa1sUDZ6CB3OBQvFx9Xjz5Ih/ueJecjZVFYFyF3/FM/Vf0V/Yqv63++wvZK/aL
 ZvEWm4aQS/YtvhuVJRu6LJfe86mWvJHeNB/gH0Uc9gd2ie++l0N0zA0lrtADenrfndFB
 rOpv8XY7SJdN/3JQtVXl4ALxpE/on4ODlN6rMEF+Mb+ORJWZZAhTpgJX4dMH7jOIU/oc
 qpB3VeWfUFm9Rxhy0RWPr8+0klcpiMcpMEi6VlfeYesPw9xYv8QRxh8Rtbq/sHs5MYFA
 m1ng==
X-Gm-Message-State: AOAM532DcXHmWsbO2gfB7UpUgd+r+R5lHeMlc24H9O3vnID+jG5wtsX1
 wDnhnR6xbNQdZSPCcHEdkoM/gr2ZZS+qPA==
X-Google-Smtp-Source: ABdhPJwopE+PCtjqiZbEAGv8AGqdXXT7ulm5RCLvcB9q4gCZUv2F5RX67bBUB2ho5vdjqnAtrY3Y3g==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr21222753wrl.189.1635147306120; 
 Mon, 25 Oct 2021 00:35:06 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:05 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:56 +0200
Message-Id: <20211025073458.8576-5-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025073458.8576-1-etienne.carriere@linaro.org>
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
Subject: [Buildroot] [PATCH 5/7] package/optee-test: bump to version 3.15.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump OP-TEE test package version to OP-TEE release 3.15.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 39bd68532d..5d68f94fbd 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.13.0/optee-test-3.13.0.tar.gz
-sha256 4dda2a6b2f7667664cc3bc2578a90c1e60fef7e1c296b8fa8f317ba93302a652  optee-test-3.13.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.15.0/optee-test-3.15.0.tar.gz
+sha256 9c2b6b80055cbef0f9bccce17dde494725bc71d9013dacaeb3e46d0926191098  optee-test-3.15.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index ed6ec3fb39..f2117c0d00 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.13.0
+OPTEE_TEST_VERSION = 3.15.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
