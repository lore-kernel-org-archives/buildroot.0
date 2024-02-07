Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C389EC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 02:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7190A405D3;
	Wed,  7 Feb 2024 02:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Foi4xl0_9Wxy; Wed,  7 Feb 2024 02:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A33A409DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A33A409DB;
	Wed,  7 Feb 2024 02:22:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57CC21BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44CBE834D3
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VoPBJv6IUnEL for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 02:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E20C812C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E20C812C4
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E20C812C4
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 02:22:01 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5d8b519e438so91249a12.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 18:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707272520; x=1707877320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2o5FraDtRkAyywrRyE9XNu8j1+IkhD1HvbqY8lP7gjc=;
 b=lKzJt74412F8lkQQkRbCxVEAcng58AOliqZ7UlEVUgiVXmq0waMgqcVyjwCmau1JJg
 f8tqsJZDpHSRGol5SWWHjwavI/uE2v4Y6qX8ONJkJjBYLpyHJu4PmxYTa16ovLKUbp/b
 /G0Y2gyZ4OOd3u4boif+rhOrKWmg8gxoNkBz6B5scrJQsMbD0wJUQ+hZFG0Ut/STFuEr
 HJ5iYUuV6PMVjqdhWYdF6z3A+uOLXuK/+BIoEml2VnOcvSUp7qICutUYVGqhcLgaH4Bo
 Oovxvsy+GxV7taOCizpiYlDrjbWydVy9XSIPu6se10SGZBfe/aCHcne3CbH6eNSfVGrA
 CYwQ==
X-Gm-Message-State: AOJu0YzDmSWdfUhkCEBq6jVPIdMvA87GoE9Jpwe8Cgwg4HiX2ONED95b
 3u7/42epCpEJgfTLoc0jgsvXNrxStxRMFoFEpn2qliSsmfX75iyiZeItxM0SDcYAivOv3RTe5Li
 E
X-Google-Smtp-Source: AGHT+IFPIQZEf1XcmGVfcgOw1UvmwOAxtofQnyF2A68Mfw+zdhP39x42z2dfG83ETfpwsFj8wmlJsQ==
X-Received: by 2002:a05:6a20:d90e:b0:19e:9c72:90ab with SMTP id
 jd14-20020a056a20d90e00b0019e9c7290abmr3325098pzb.18.1707272520398; 
 Tue, 06 Feb 2024 18:22:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW9tAYKMgoyrl0z7WtFLmCeFjljXPrjqN35cEy1Cd9zHaW4iNoiEVYCdJBVyZIw/pFQRqPTDfVEN8dM8V7GLZMeBRPLdBaKxV+9F4PLj4HbfuEU5G+beplPXImHWmkluFLxuTV4WudXyGGkmRwbMTXNRs2Ibrl2EFTNwfhUGKE8Z7aLIAADzeUxahal4lJj2RdlIw==
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e6-20020a170902744600b001d92a58330csm214324plt.145.2024.02.06.18.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:21:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:21:56 -0800
Message-ID: <20240207022157.2560531-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707272520; x=1707877320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2o5FraDtRkAyywrRyE9XNu8j1+IkhD1HvbqY8lP7gjc=;
 b=Kcaz7CwEqDtJcmOf5MVrrRO6JFNO1Iyh3pFJCJKPP5bTI8Gs6Nasg80LEqt43P8QHK
 9LHB69YGuVE8IlFwNpB8gxo9CZV9vJQb/Fywso4x2RWxvJEzPhZZfVUSLckZ/2r4oEDO
 1CpOeAii2L1PinwrEmXsG+5/WomPKVQn7e5s21hJj//YYBrEQpkXVhFlSNX/DMVoELJW
 Xgl8h96C8i6D/4wPtSFu0GHG6X04UnE/Af/7FDAD0tUKhF+bfIr2jaKMft7Tj6HMpYXJ
 qfxv9OygTwTZoiBKGCphiEMAuooRmJ9Va01yFLhL6Zp8lBbzCGgGqjsf2c+vhjso0NLX
 2w/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Kcaz7CwE
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 v25.0.3
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
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v25.0.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 931d6529e1..40293be7e0 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  16a2cb4cf4d314a070085e0df06e3a6bd9ec678d28715b64060af694fc9051d5  docker-engine-24.0.7.tar.gz
+sha256  4cdb516f5d6f5caf8b3bcf93c2962277ba727cfd2d1620176a3bb0cf153b3590  docker-engine-25.0.3.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 262be2df20..066959e0c0 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 24.0.7
+DOCKER_ENGINE_VERSION = 25.0.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
