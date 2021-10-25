Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8A8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09CC60FBF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C09CC60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87B6540264;
	Mon, 25 Oct 2021 07:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahm3G4KbIvQI; Mon, 25 Oct 2021 07:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 825644010C;
	Mon, 25 Oct 2021 07:35:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE431BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B091400AB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-PNRZfadQzd for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DEBA40070
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d3so6896261wrh.8
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hzGXNryHJA6iWO7VKYCwANkq0BidQWBaWEb0z5NCvxw=;
 b=FRfAx3XF2BE9GSF6jGQM2+9McBF0x732YaUYsBCj7zgVl2rEx68lfGvvBx76FtHRES
 TiELK0MxmMl0V+/sgfPM5IUcL3+CZelvzLQ5EpxOvNzJWTk9MAOoWr/rpxLrs743P/tU
 K3SihTIPi1bYeOB2HaTJNZ8QEBgNoV3Ukc7to8YwC1ALx6A8wwDd5OOMWc/Lwg4LytzV
 Wl1GStP5WK53o5i/S86b0MyOiNCfFdWpVfm7lCezLW57c+qAx3G00MX/Lj45nm2Rpvrn
 rzZ0UGRemu3rExMXgcyUSZXLwrdkGcvUFJucUdRY7Nw4L25gqx+UVJuEwJGxUoGV4gc0
 YwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hzGXNryHJA6iWO7VKYCwANkq0BidQWBaWEb0z5NCvxw=;
 b=OXyhMCQWyGfISnfkEV/zoxdvQS9YTlHMtaBByhRtiDQqLD6G/wClC8LHf+1/BoATQi
 rz0NsTcwRM1POWvFxTvKegzpt59Z8NzWMiLE2DwPfst9YvC6WysFk/ah1n0G7vCWwDYL
 9airg8Q6yRL6jdAKeMjRulg1HK0qqYVhnmOpUw7Xjr8RcsM0nWndk2UP82zTHr+HHm7f
 embrdhgyySPEtK/aGa7Plc4Ja8huD1lF8bsaSWZqR2/nQxBcLMpCntdxSoH8y+1hWYh0
 s5Eq5P0za+7TKcFUlQ7O3io4WHTw08sabmrqrkfQdshp7FsNSpUgsS/2GBcULDNxFW+w
 SGFg==
X-Gm-Message-State: AOAM532CsIHtm8aUi+POHq2Q3wO70fLzbF0goejjO267GyzE2TnsxmvG
 FzhYUBNjPCAztUEyw8zagWUO3Aur06GQ8w==
X-Google-Smtp-Source: ABdhPJw5p+Yy2UJtuWOMh2T/3ogD5GhbBU6nNA6SWYZp75xa+MuSEgbphjiCaU3gheOVj5CHj0m06g==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr21088822wrm.23.1635147304614; 
 Mon, 25 Oct 2021 00:35:04 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:04 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:54 +0200
Message-Id: <20211025073458.8576-3-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025073458.8576-1-etienne.carriere@linaro.org>
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
Subject: [Buildroot] [PATCH 3/7] package/optee-client: bump to version 3.15.0
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

Bump OP-TEE Client package version to OP-TEE release 3.15.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 5d14f1023c..3ae06f2afb 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.13.0/optee-client-3.13.0.tar.gz
-sha256 2ec6f05f833dce458f0358104e83e28e9a7643b81cfd96db32a7a1fadcc1e3af  optee-client-3.13.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.15.0/optee-client-3.15.0.tar.gz
+sha256 e1ea6c953e3584248d7a62050813e5ac0f0112933447954c44236a233a4cbba5  optee-client-3.15.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index b73e76775e..20147c89a8 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.13.0
+OPTEE_CLIENT_VERSION = 3.15.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
