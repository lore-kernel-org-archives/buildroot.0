Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D208C4321E
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197E160ADB;
	Wed, 30 Nov 2022 07:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 197E160ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaPTMpIFMuC5; Wed, 30 Nov 2022 07:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6523860A80;
	Wed, 30 Nov 2022 07:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6523860A80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 665B11BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F211813CE
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F211813CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yzuaE68NTbf for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59450813B2
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59450813B2
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w15so12543641wrl.9
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A8v7EAJ4LLgMrDvXbs2KvnfIWAlpFF0qP0kGBpVT8dI=;
 b=uMd/oIlAuwCs/hATLgsZXMg1UinWfLEQSLwMfD4Ce/n88y5PoTATkB9qy2+9TfaADn
 Q9wZO2oCqq/eV60rUbV72PJabFt6IeVh45gtM4Wgf+KzHD9esRHMo4aI95NXvPW7nzGG
 XaSqSGArIh9zdCrPQYF252n5qN7MQKB0ydStP7Fsor1ih5ntepnpBUIqLXvEvKx+mBLR
 EHCLSEt3tuLejVtRoG21CX4f2UIBtSdjrmgQLY3Y4F5oMZFlsYSLCdseHltEZFoC1r8V
 XX67+6bHlTGmlBr61rYdKnZs8NUqGgbnPA3m1Ud+IB/sUGR7NlU8sT8vClC3yUPEOfNH
 GnaQ==
X-Gm-Message-State: ANoB5pm/3UVnqRIMA8uqJ+PzxafegqelzIhQXznMocpz1eIeL5N13e3q
 M3GCEDdEVexxTqrS8WpTFZofPXcjewaGOw==
X-Google-Smtp-Source: AA0mqf6I6lRLcnx/bNNe3yZcgoIDNEhZ8VaKLPl8YwZbvQMnS7PJXT17ybt1ZyNkCDBoPS1mfF2GHQ==
X-Received: by 2002:a05:6000:1d84:b0:236:5022:c705 with SMTP id
 bk4-20020a0560001d8400b002365022c705mr35450475wrb.466.1669794906312; 
 Tue, 29 Nov 2022 23:55:06 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:05 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:49 +0100
Message-Id: <20221130075452.2507453-4-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075452.2507453-1-etienne.carriere@linaro.org>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8v7EAJ4LLgMrDvXbs2KvnfIWAlpFF0qP0kGBpVT8dI=;
 b=ABSgSRTlBVZHZbb1+mNUpgwl9XTjVA/o5j6qcIuRdTZHWY7VXN3y90aABJvJzH/Oxu
 1y4YXatqHLAA61TxbCW9oT5huzXsdO5MUOdTd0P82W1NnyU1nH/lMO2dIjrvUxCikz4N
 gXftb5GS7OudWb3LJI45y7Ie8bpY1LFw+6Ec6j3klJt3JMT1aWH4i85/KIIOr+JTR6ew
 jwIWiYDj0kNz6cpgNpvVWz7klb2I7EKGLSIOr14vOu8orLuZkFBAjfVDTcn3d5rkG/et
 t76giZJC122aG3GLCRBak/8UdIM5rnsmsI+Rx+V5UAMmQskbD3d+Q+KaYl1VZIVBH7DH
 4K3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=ABSgSRTl
Subject: [Buildroot] [PATCH 4/7] package/optee-examples: bump to version
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
