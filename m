Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468FFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D9E60FD7
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D9E60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB2340227;
	Mon, 25 Oct 2021 07:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wm0YJtTeM2R4; Mon, 25 Oct 2021 07:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD90400F2;
	Mon, 25 Oct 2021 07:35:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50D8C1BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F2340070
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svNX8QW8Jcvc for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F13040057
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d3so6896326wrh.8
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QzJkgBGsh0uwbhzpRDBJq86LUKWJ9ANWgwW/AWbs9lk=;
 b=KQcnbOR9ywbg60xzKPjEoLYxV7DBWZZYnIrlPlnTOSfUbQnYPnkYaNrTDQpIEIdl2p
 4QVGlUUkwdFDEhXTh0A04sAtg/mMj6IZqea26vyVlavRNyVOqM+JRTFUWGVpb6Wa24lI
 IG93Ar5rU/mDjC2ozeK76wc4vBD/kQKFI8vgWm/h9LtFg6z3MZHrmEChdqnMJqiAVP2b
 MJjby0U8x528KsdgV5kTmgK54onx5ZzpOVaXJAnywQo99kA3ZcYDUw79GMLeqTWnqgwg
 OUgF10RzjeXrtbtZLTkHEq4/Szn1IM7sk4PqtLaGoz1EQqPu3JqRim6HEh9/MHxm/vRW
 mrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QzJkgBGsh0uwbhzpRDBJq86LUKWJ9ANWgwW/AWbs9lk=;
 b=NO1bboj6ERXY9u7IjR+qG9GBtugDHaPKnZJS9NdHLjtsf7PxuKt3CD5w3q/cDd4Sa6
 WjzsqizqH7scNM10899WG5gyhW6pQCepYN7txg6XisB5ZvaCQQ5EoJIbmRq6UH4OOTPi
 pGMFd7N2qP3cPuzsaK9SXPDtDFYw/3Dxt4Wz+HK1pjGLWlLP/lelHsgBfiui2PupzLU6
 N8P29SBwVStVrLoUf1alGWGoPrRol8D6FwH25cHDhKOLPbRazAHGee5boaXjr3dV0xKN
 NynIbZVsF7tAEMIkY/9zj9ML3k80c7oI1C3LQWrntp9BLPgXDD/9JWbvIUSHfTyBhw43
 gj0Q==
X-Gm-Message-State: AOAM530V8/TrhZHGgitBeEPxqNkt2zvvAfBnWr/S2xWiqzaIKJxpXdOj
 Orjvf125vjNjK6pS4uZOZCnqqy9omZTmUA==
X-Google-Smtp-Source: ABdhPJy4F+Cog+fQvNhGymGbljF8Qs70Pqh7vLyNRZuKIlR/aq6JFFt5X99JqT3bKl4qDKolRzvF/A==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr21738176wra.125.1635147305379; 
 Mon, 25 Oct 2021 00:35:05 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:05 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:55 +0200
Message-Id: <20211025073458.8576-4-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025073458.8576-1-etienne.carriere@linaro.org>
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
Subject: [Buildroot] [PATCH 4/7] package/optee-examples: bump to version
 3.15.0
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

Bump OP-TEE Examples package version to OP-TEE release 3.15.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 5e1839f43f..f88904c795 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.13.0/optee-examples-3.13.0.tar.gz
-sha256 2e97252a57a5d84fa5f33adec976cea2dbfb0e17f60b1ee912041be74f6b14f8  optee-examples-3.13.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.15.0/optee-examples-3.15.0.tar.gz
+sha256 9770827292eea85068913077d3406070f6182389779c5d4a5c0876bffd962353  optee-examples-3.15.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 484245c951..2b46dcc1eb 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.13.0
+OPTEE_EXAMPLES_VERSION = 3.15.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
