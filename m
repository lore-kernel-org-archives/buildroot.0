Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC41AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EDBA61107
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EDBA61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17024402BF;
	Tue, 14 Sep 2021 17:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsO04r_q584w; Tue, 14 Sep 2021 17:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81FBD40283;
	Tue, 14 Sep 2021 17:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2E9C1BF59F
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD17E60607
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeZAaEKg1iuJ for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 17:54:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE47D6059A
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:54:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d21so13917147wra.12
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVg2epyJqNTNulGK+iv1fgMWmPZWbB8rgg4oPLM8xrE=;
 b=FUoRFYZjdL3Yp6zwDKvYPmbSROALDKyA63A3QGyQwcaiyd1KNPEIf/zY6WrxAYAayS
 HvY0pYAJSJPdo4KY736Ag48vz/buLVK+dPlg4fYqAiMlOw1/D40YZtKckkyFMZQbFzGk
 cKLXUFpQZ8SH/3dcDPrp5kuaoSGsTxhtXBgghnxTes3UxNxAmFCVrPEH2WZD5mOeXGMM
 hyyw8KfigmFQ00r1bsIA6sLbgon5HjI9TX8Z6spL3COIEBdZG09r/l3YlC6bFfyRZkgH
 oNZ6NNDw7Cm3F/GxHrm8T2n9tzzZ/qRY3oMi0ShecyOg0fg32FMXKURLLPLVMsjZMiP1
 xNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVg2epyJqNTNulGK+iv1fgMWmPZWbB8rgg4oPLM8xrE=;
 b=hg7IQj4Y3TteZgCQSUXRSY5khKYEtGhi+6lVssFWlcqPq/eolcKSSnZKn1XxpptAVp
 5Mic01BjQRneh7IT0cUlur4pu5a6ORpvRkbt59zWTgykvNphwqk6ksOhz1lmqefpytPR
 9+OUzf0VMAL6yrCfcLPYUa199sZ3OS7gV1GncZAfot23udQi8XZSz+LFvJqYeY4fUCdk
 WYqwcwQUGwcsB8yj8qYY61vaXCmK1d4Oud9vP6o9j504dsWVLWFFw926f7vAtEAmABg7
 +gT//YTc5JFB+3dTMXB+uJlTuhlm3RDzcaB8fWv2uOQ152YfSn9Bkd4OxF9t2TpUjJzl
 dF8w==
X-Gm-Message-State: AOAM531elDbNC4e/00mtQKYZv9VmPMAuMypTuS3RlZ49vWHmq+Nd5yib
 8wv90B5zJmFZWwgOhW+azCL4uCupx9g=
X-Google-Smtp-Source: ABdhPJz6CWUk1dPXdQuqn3ppNcZyyPwQD6Qj4UZVip2V0HyQZ7GPR7ehAvFtw1NZ2whDRMzQTY33EQ==
X-Received: by 2002:adf:9003:: with SMTP id h3mr435033wrh.75.1631642042199;
 Tue, 14 Sep 2021 10:54:02 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id k6sm649777wmo.37.2021.09.14.10.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 10:54:01 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 19:53:51 +0200
Message-Id: <20210914175351.21107-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/feh: bump version to 3.7.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 3a2296ac23..07c0dd9403 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 437420f37f11614e008d066e2a3bdefcfc78144c8212998b2bacdd5d21ea23b4  feh-3.6.3.tar.bz2
+sha256 57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
 sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index f27509330d..3aa509abfe 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.6.3
+FEH_VERSION = 3.7.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
