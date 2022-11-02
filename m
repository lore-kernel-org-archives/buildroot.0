Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EDBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E896E81E73;
	Wed,  2 Nov 2022 20:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E896E81E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrdiuGn5_G9s; Wed,  2 Nov 2022 20:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC4781E4E;
	Wed,  2 Nov 2022 20:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC4781E4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6CB1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA48B41704
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA48B41704
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjAd2kq0Txto for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:48:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B036E4168E
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B036E4168E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:48:13 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 11so16108707iou.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bhr4RUQ3udKHC9jglTJi48uMm0uYn3XrBE/cglXTUgI=;
 b=iciWJoI3Lx8eaiFHo2qY99c0dZVvNktzVTNn8/0TC0bKaBJtoWEv+oqKQlZURvsnx4
 HtnIllz7wid9uvw1eooCQrQweRid0zEg7/93TbBBUB2unaZPE9LwuCb/MVBTkRYPa6y1
 Ozq2T7nwG9l94fUghYTvTAuVV5KXAlHbyqTnDr2n7M6lrXzUbDxaV3D/UPEP/msiu/wk
 0/Puu6FEFkyPPrKTzG2vkn2vlqawD+IigfZWK8eQCAacXBh6k8sXpD6ZXHxS98MYHmP/
 7+K4wFgxIi1ssXuczO+RGR0elufKOgc5PEU3AZ3Nt21eKsUbLjsaNrOtquq9zA4yFrBt
 M9bA==
X-Gm-Message-State: ACrzQf1WA8nJhk39voFWgBe83haoKCf24DZXjWowcvtUqQgV8SZqNCeM
 aIg1/XsOp2eBcmCzj85OySBn2uc9Q+tvAA==
X-Google-Smtp-Source: AMsMyM4aGOVRkqpC8aWuWaZs91G+RZ4HiJggq8gpR+gcMzEGg23gVgJSYmuQfrOgRw/Olw5kM2PccA==
X-Received: by 2002:a5d:9481:0:b0:6c5:8052:4631 with SMTP id
 v1-20020a5d9481000000b006c580524631mr17192951ioj.46.1667422092465; 
 Wed, 02 Nov 2022 13:48:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 7-20020a92c647000000b003001147e7f3sm4918946ill.30.2022.11.02.13.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:48:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:48:10 -0600
Message-Id: <20221102204810.765230-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bhr4RUQ3udKHC9jglTJi48uMm0uYn3XrBE/cglXTUgI=;
 b=g7gRFw9QLbf+17UqAg9SiCNFiCPHVTmSkjvXyGYVGB3KcHp5NHT7rpBdbqxvpcI3W9
 pMeKgsRRvPnl5az+P7jDcQyXMC96xTxLRowxMwmP6l7X+XDf0Csnalfo6v++frMVPDv7
 KOGLeLPlPLG3E4A/heL01B2f7WtCxWQ4BgY8txgIcQQq8bTs38YsDSTPUytrUmoHTsTO
 NZQH6YqC4oTZQuwQeLjGKE7yZZgBYXj8jsTjAwiKXTAE2cxkl+kDHM3Y0tWg1YTDtotQ
 +OYp7JYYD7acHyVKKfxGhDffmeKAuarck8YczZ8sdiDmag7tCkuKz2Klujecw+jqXqp9
 athg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g7gRFw9Q
Subject: [Buildroot] [PATCH 1/1] package/python-humanize: bump to version
 4.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 9b2559ab11..871bb9bfa5 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  04f5b334283e1f7f0dfeccf7d5a4b880  humanize-3.11.0.tar.gz
-sha256  4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f  humanize-3.11.0.tar.gz
+md5  5e90552713107f756788ecdd8fbe341d  humanize-4.4.0.tar.gz
+sha256  efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c  humanize-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index ea5454d6cc..04cb0713fc 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 3.11.0
+PYTHON_HUMANIZE_VERSION = 4.4.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/a6/d0/e06993724937f2aab3e7085d137d453968aaac0f74661ef9c90528a79d61
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/51/19/3e1adf0e7a8c8361496b085edcab2ddcd85410735a2b6fdd044247fc5b75
 PYTHON_HUMANIZE_SETUP_TYPE = setuptools
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
