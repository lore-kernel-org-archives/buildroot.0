Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50549C07545
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 18:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11D340222;
	Wed, 25 Oct 2023 18:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11D340222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txJ_QxyuBRSl; Wed, 25 Oct 2023 18:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32DC4175E;
	Wed, 25 Oct 2023 18:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32DC4175E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51A881BF976
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 18:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A8F780C28
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 18:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A8F780C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDfeogSXtB0t for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 18:34:47 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4345480B6D
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 18:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4345480B6D
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6b5cac99cfdso23217b3a.2
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 11:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698258886; x=1698863686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZNOg52iHP+JyBojZhyLkpEtApgCJacMvgmK1zkp/JUw=;
 b=I1ZC00rXIEBNo+I6XdDY3zsLM1FzpcAJDNsERegnbLY6gVGpA+K2il7+bpBSiPs9cX
 CqRyd5meD5dGUf1RERrYBmqSwuD4Pr6asCRPREcLcL7f1AEdX6VKOCM7VcI/0LeOFvjW
 ozLHypvi6f7fai8rbJ0oLzRDDCSbzmzwS7mDIGozkBS6w4F13SmvRn7wAwESpPZK83Rn
 QEJ4qAirMxn9kqr8P/zA1N1hkyDiBXsYtCmJ4gmYY3DIx85VPgtIc1upu2heAnx4YGAo
 Kcm+PFqv+Oa9czam5cQhd0HnhEPVaV26L2N+/1tJMq442rKnV+8Nz6gB40jiLO4scijG
 Mmog==
X-Gm-Message-State: AOJu0YxcgGmoMDvxPwRoSHQP3A78LRCebV5hynv4u2de23LY+Xkpuu7l
 rvnoZuhE86FFsyDE3TvKTH9H3C0R1YsThds+K/regA==
X-Google-Smtp-Source: AGHT+IF1jnicirhiab73prcf7exCX3vUuWB+ZUERkah23nF6GZAWPZRz/SxS111E4Z1njLFtdAzk0Q==
X-Received: by 2002:a05:6a00:18a5:b0:6bc:eb60:b26c with SMTP id
 x37-20020a056a0018a500b006bceb60b26cmr16438105pfh.25.1698258886504; 
 Wed, 25 Oct 2023 11:34:46 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d6-20020aa797a6000000b006b225011ee5sm9728231pfq.6.2023.10.25.11.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 11:34:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 11:34:44 -0700
Message-ID: <20231025183444.114398-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1698258886; x=1698863686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNOg52iHP+JyBojZhyLkpEtApgCJacMvgmK1zkp/JUw=;
 b=j+2tMsNi/l7AbGunhD4ZIhLBBSZWivfn7NJFksktsshm8BRJC4vglnlQUvzZPHgTMJ
 /QwJTCbrFK8+26k9deLmNj98ZUzdoCtpAr5NraSYq8e+sXZrJrImTfiJb9PAhg74jKPy
 J5y/Ipp+qyaGBhoGtdIah5nI7xK9ojjtJMRHi5MICGvO5jvfrpUTSr8tuf1Jp6kopfVK
 J5bxWlKJ+mYyyCb+Cmr3yZYESVVbV3fKhqCcwgrCvF0gJkxCRhGYBgD6eiYsGcNSCXU6
 UDFJ//eF6I28SR71JUWNaGY7FuHNE4zqIcvHZKyj4qlVeUrG5ArfjYLkIGiljH6mpzfl
 qYPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=j+2tMsNi
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 v2.23.0
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Significant update with new features & fixes.

Full release notes:

https://github.com/docker/compose/releases/tag/v2.23.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index fce3477257..afccafd994 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2051ea80097f3c9e74e3a8565609e704e76035fa9ba04183950d3431bd123ea5  docker-compose-2.20.0.tar.gz
+sha256  8a1109124e7dfef736ad3db0457d807eb41a0068211bd13e52051252cab28dda  docker-compose-2.23.0.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index b2d3e99988..54557b9841 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.20.0
+DOCKER_COMPOSE_VERSION = 2.23.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
