Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980FBC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 18:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F87F40D1D;
	Mon, 28 Jul 2025 18:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPN2am76C0HP; Mon, 28 Jul 2025 18:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8819C40D01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8819C40D01;
	Mon, 28 Jul 2025 18:15:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F96BDA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 18:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3129C40D01
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 18:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SFG0zVRmCjZ for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 18:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B32440CFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B32440CFE
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B32440CFE
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 18:15:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso7559413a12.1
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 11:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753726549; x=1754331349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BtMbYcOvH2vhO9LbMiW6S7HNXmN1Jm84BLXHMxd0zfU=;
 b=AftjsiC46T/Dp0erjqx5tveCy8TeFmhL4JUjUGLsdfxGqdP7r6jlwNKAwVs+B7cBQQ
 Ulm1Lz7+5xKOtkZFXcJ+3i9M76dHbEPug7thP4VqkO5s3QAUxQtQf1GKBDdmnaMwDtO+
 l4J/jclbWdacEUOQBB76MgCWmtG790pn3mxES2/flV9awX7RgGVs5+gB9UmAXQwP1vyh
 dRIdIgDErNuQ/RefvEHZZygqkjmv5AiCAcaLIPO8x50uO/ZtTnEJZnxoFlftp326hhBE
 e2DL8KqXi9kZdMMD6pz0IaWCOYFLj/GYTQdLM0PDi2tKL4rbbspp9RmcnqiCibTqR78G
 6aKg==
X-Gm-Message-State: AOJu0Yx/b9o0lrRQ1LsCcxUJzA+ACY6uejP/F3UM/PYyHA3YzMrVAyGg
 AuFQRknAcr2l/0wofitN95TdbAChAEiqfDkB8JaTFgW0ptJFmJpy1JrEm1JZWyFrxm/mKWhEae4
 RxWeG
X-Gm-Gg: ASbGnctPUQbqOXuelqXRPK8MtzMxaFR4FC2Q4W4B5PdVopIJ7Y/+GOQNPwdvpOLdvV3
 /c6UpgbapIjr8yOp3j/Ih0cv6nM2VGotqIsBL258n4+YN28K8Dv+YWHYJVVwwceKnmCOQyMMlGM
 tMUb0czHROUzisOeeoiZqYRB4zH6rRANUSFIkaIF+Yju5GRuunfAEaDwc3jRNr0+m35drLx1dk8
 wmfBL/S8fslBBFuP4YyRLrUX2WcioOmSLT8vteDguflibyMEOr1BCHNAB66pbJcknqaSBjPUHAW
 91Yuxq8Uh6Onof/uiXZTWIhveT/YW/jqsc2m6/xi+BQ5opdtY4WKHyVUjmrv0evyvb6oJkRfvBP
 6JZdO/jnhgVQdbSvvEzowiJ8lIAzHRizUYMjrz7s1kuZ1HG2Zc8BLSSjFhMSDE0T6wdEtyRZZ4P
 dtc+TjkfUrbzCB
X-Google-Smtp-Source: AGHT+IHt92gic761nYItsNGIau3pgxQXgzrGv7wAVO7CuDnF499e2TfKDpUn7iXapeEZhUT9Yqb2JA==
X-Received: by 2002:a05:6402:2342:b0:615:6482:7490 with SMTP id
 4fb4d7f45d1cf-61564827ccbmr475012a12.33.1753726548934; 
 Mon, 28 Jul 2025 11:15:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.167])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61548e6e705sm1160173a12.42.2025.07.28.11.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 11:15:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 28 Jul 2025 20:15:46 +0200
Message-ID: <20250728181546.2655487-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1753726549; x=1754331349;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BtMbYcOvH2vhO9LbMiW6S7HNXmN1Jm84BLXHMxd0zfU=;
 b=Mwufa4Z1K9RjqCXc4+b/2D+b76iheBR1PwcTBGwKPxRq0VC5oUoVOOBVj2hwsUpu1h
 FJEeCb8rP2Rm+9i+qAxQhcuC/zkhNSpdpp5DFZIwFJ4HAGajDawBtZyV2CzNnQHtR3C/
 23Hyn19QGlDeQ+IW1Fprn+Uv2iG2ziL/IjId0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Mwufa4Z1
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 26fee7fc094b..ace08a496177 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d18ccdb78a5da88f18fc529d8a8d40fad455842be6b01c59796f47a6f5bc7fe5  armadillo-14.6.0.tar.xz
+sha256  bec67f368fc61673c4c9e9429d20135a42ba80a2c7f8592b912e5f97e289bfc0  armadillo-14.6.1.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index a50b10dc6d8f..c64c07239a0b 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.6.0
+ARMADILLO_VERSION = 14.6.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
