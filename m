Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1040C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 07:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C5381F83;
	Fri,  9 Dec 2022 07:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C5381F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBrmmQo_Kt9K; Fri,  9 Dec 2022 07:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CABEB81E8A;
	Fri,  9 Dec 2022 07:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABEB81E8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1B81BF5DE
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08954813FC
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08954813FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvKPvR7Dx8BB for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 07:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF1D81E7E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CF1D81E7E
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so5164195wma.1
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 23:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7G67gnjpozvRKaXDIoJhhm6/upsmg/RK3yNnFi1vpfI=;
 b=AjVBLRZ76Y6tKPScLSbTC91i154gSrCFbn1BHygx8bLZnBl6neqw/rwR75hVaaHS6Y
 jYWoLj0JidC/VypaVxln6P1KBMpskUiw5KVFYOwFjH3Y/NN5PKvA0WMvIer4Q2gZDNsN
 GU2jN2jqV2i9QW5n/3kYecvRaBZS0XA374NzU29KTES/vf24eYibYVbaaKkdh6/g6A/v
 kxi3XRra7QT6QShteYw+x/EOV3kvbpHeL5zuwqhC1KytyLU8oyo3Z9aU1WTbQBtqWNRy
 Tr9h06TkhTY269by4ixrsTtgr19W2UEjg/jGmyND38yfDcLZZoKP9YbWXkswTAnqTyyH
 9nyw==
X-Gm-Message-State: ANoB5pkJlerU3aRiN145PojsENZ6UZgaSghmvH1wA1q9aGJ8WFAq7SxE
 YqRehpMwdELZyQYD1In3J7B4BrR7ERUVWHZL
X-Google-Smtp-Source: AA0mqf5tjc6GD76pd7EYd0QZpGQaz4aaOhRsQ28GpMu7iNMqNMXatmhhZNkWmBAmmx2ZsJ5JCa9NxQ==
X-Received: by 2002:a05:600c:1c93:b0:3d0:7026:f0ad with SMTP id
 k19-20020a05600c1c9300b003d07026f0admr3853916wms.38.1670572275978; 
 Thu, 08 Dec 2022 23:51:15 -0800 (PST)
Received: from lmecxl1178.home (lfbn-nan-1-127-214.w90-49.abo.wanadoo.fr.
 [90.49.211.214]) by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b002415dd45320sm664507wrb.112.2022.12.08.23.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 23:51:15 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 08:51:03 +0100
Message-Id: <20221209075104.1168297-4-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209075104.1168297-1-etienne.carriere@linaro.org>
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7G67gnjpozvRKaXDIoJhhm6/upsmg/RK3yNnFi1vpfI=;
 b=f++ncqq4EniAcSfiizmD08sLa+9BpXuJ9u7dfhKX1qsa/QSNlRvWlYzkBSqDJZDaXX
 2SdjRz7A1lFta0AC0kg5OfKdQSPrYqpXUtyhNO12BE8jjjC7Dqx25KKMmuLxm4hfOGX2
 yy18bSRXA5Qo9aKrMJwzDCuIa4vV/7358cV8nZebTj5+zlKTUqiNKxizgXFbz4d8/bu6
 yfmap1zC0aan4pCXTIGmGraZokcAaMDOmfSeGSoVO0vdYZgmjDa4EP1+D3FppWPekqsa
 /E735tc7PUw1ZcfZ6MxZ1j6WB1xvOh63pTum1Wiq3ufoAblykqE/AnZIo49TxjqgR6xd
 54BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=f++ncqq4
Subject: [Buildroot] [PATCH v2 4/5] package/optee-examples: bump to version
 3.19.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE examples package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
No change since v1.
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 876584c5e9..937dd44c8c 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.18.0/optee-examples-3.18.0.tar.gz
-sha256  6c64fbc6c5d1282b6311b4076351abbbfab10ac918c6cfc60e45ec705bb5a9ec  optee-examples-3.18.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.19.0/optee-examples-3.19.0.tar.gz
+sha256  545f9438885220e890a4f785249a586a957b22dacc31a3cbafa4656f8e9db349  optee-examples-3.19.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 17adce0fe0..bb2b208583 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.18.0
+OPTEE_EXAMPLES_VERSION = 3.19.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
