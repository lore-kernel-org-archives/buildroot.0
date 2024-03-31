Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44552CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 07:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D404607F3;
	Sun, 31 Mar 2024 07:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqZHprGHpF7p; Sun, 31 Mar 2024 07:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2806069B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2806069B;
	Sun, 31 Mar 2024 07:47:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B71B51BF28D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A354481D4F
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER-JdVw5Nk7K for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 07:47:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCEEE81D46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEEE81D46
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCEEE81D46
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 07:47:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1e0d82c529fso27094305ad.2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711871251; x=1712476051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ktgvAn7Em6+ADI/bPAnVkY2fc3LopUgrLCXN58LvsA=;
 b=U0KaMJojcsriBJPrjpY0sJa0iupIH+K8L2j8U002DY5QNjWp9rJn+wZw+nYj3WROIP
 0ok7aLkth71nHNo6eNS30FzBpz9mIbiCXnHFVVd8jtyAaQ8V7SuJ3DkGO1T5KCiJqpF8
 uYWT1qmmDeABDbUZwCUksJwnR3j71zVasSRUa4dIap2H9DqnZxxoDdCXJaGbxfZGa1LT
 93aCmgpXx3j1mCSm/hH7BO/tBLln6OypUAPU4id28X/SZ4AbGJI+hF9wuI2bnx5la3+j
 3s8rOMGM6kSDpq1rKY+CvnWbW1AlxwB2mWG1W2z5Hc5yOFr+LCGDQ5wU6r3Tz9ukRMPL
 BhtQ==
X-Gm-Message-State: AOJu0Ywu40jj42hqHPmcSHL0ZRXnD8RTQERWztHPxE55548rv2t+BcBv
 8j736EbWbL9dI4hpTAOMfIfb4hrwntdYDbOEwP3g1GvMpW5POMoNPas9U0/JkiCKLsBZJRtCzaD
 XBzE=
X-Google-Smtp-Source: AGHT+IGz1m/+WWa0SEUztgBNRowfQMvJti4elPkY58BeUoT/MML9H/LikkANpBEBzs0hFNIiOOwgSg==
X-Received: by 2002:a05:6a20:b714:b0:1a3:3260:754f with SMTP id
 fg20-20020a056a20b71400b001a33260754fmr4800984pzb.28.1711871251419; 
 Sun, 31 Mar 2024 00:47:31 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170903024900b001e22e8a859asm4402961plh.108.2024.03.31.00.47.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 31 Mar 2024 00:47:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 00:46:13 -0700
Message-ID: <20240331074614.17359-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1711871251; x=1712476051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ktgvAn7Em6+ADI/bPAnVkY2fc3LopUgrLCXN58LvsA=;
 b=C1PIbS1EGK5W/RFuhnDElT3lx5fAIo2KPJsEsKnXdF87W+Zo8zt31PpVmXO6CFCgNY
 ftlq8YOGo+OQ4SZmIk/r8FHDs8GrQRCI1anfYPcsEeXKhOWSptJwPU8dKVWYcFL94G2+
 6BPuSgoUw3BBqxoGs51z+mhO+ET4Uk4PUnh+RebpTP/TEt9EaBZXmnR4MrZ88XdIqcW/
 Ml0zG5TuRf9V6H2BD48/Q5d09oqGEF7mFrNTtriQJNuuOTjOUUNzVURNLtmIlgIEjsEh
 sWvW8G8Bv6LfQHXYgnnlXfR0QPoZJBGl/o1iUXibewV/GI+FMS+G5wZH1921eyajoS+T
 lGjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=C1PIbS1E
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: security bump to
 version v26.0.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest major release of docker-engine.

Fixes CVE-2024-29018: potential data exfiltration from 'internal' networks via authoritative DNS servers.
Do not forward requests to external DNS servers for a container that is only connected to an 'internal' network.

https://github.com/moby/moby/releases/tag/v26.0.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 931d6529e1..5c76b99af3 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  16a2cb4cf4d314a070085e0df06e3a6bd9ec678d28715b64060af694fc9051d5  docker-engine-24.0.7.tar.gz
+sha256  fae1aabb63ed5cf6d302a5f4266ed092716b1cea9a974a9d61154ef31b03c302  docker-engine-26.0.0.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 05bf23ad3d..86106d3ccb 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 24.0.7
+DOCKER_ENGINE_VERSION = 26.0.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
