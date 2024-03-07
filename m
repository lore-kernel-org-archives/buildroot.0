Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C63C54E41
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 01:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD31260880;
	Thu,  7 Mar 2024 01:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NNRgWWLVAdM; Thu,  7 Mar 2024 01:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F076063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79F076063E;
	Thu,  7 Mar 2024 01:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E98E41BF5B5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2AAF4183F
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFHpejJEtF2h for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 01:45:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8716E4183D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8716E4183D
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8716E4183D
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 01:45:51 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1dc49afb495so3082355ad.2
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 17:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709775950; x=1710380750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLh+asQ0vuftrvcBWlUtysHDTr4HiUo8aCsQPv26NnA=;
 b=QC6BMti63cuVGW0zDtBAb3xIHTZcIlrneV7ZtKHqjb7c9ZoHoRqUM/FLseR6IkMpZv
 J8nhE9ozecUivm5LPPalLrxxMp5RhOz7XkrGNiQsqydQEK9vg6U0rWiWAAjc/5ro7JyN
 QrK8CO0wMS/kjG0v9lR5HrZ2Uhoa4yMwosqqX0uOLmA+OoM3JotO6jy0e070FFw3WMxq
 MLEmhXuE4VRlyiF5gUsUrOKhROKfKJMBqN6a1VzvbzAKgsbobZLvnWUOnN6XaPdSua1J
 p2SYa+utQnXCcl2aJfOVbeRpfEFefEyCVOtHiO8EXFGoY4KrHsQgOrMYj8H2v0jUIypz
 mn2g==
X-Gm-Message-State: AOJu0YyqLGLwaZAvjGYaLZrORqBGa/QQbvL+y8RkbtjbxZZ5HcjB3zjX
 r0EKRGHh8i6he4v68vlusiNDuGYiUUH9z3zeJ6PVLQbh/a34YHEcf7kymCkixlCLTY+l0dorWHl
 iozc=
X-Google-Smtp-Source: AGHT+IEwfLnmGYQLh8V9MJsSL+7lcndMWsMlutbvkBzc9nA+fQQkKVGpSSU0jZk1xn23lPgSkejt5A==
X-Received: by 2002:a17:902:c085:b0:1db:b36c:715f with SMTP id
 j5-20020a170902c08500b001dbb36c715fmr5726573pld.24.1709775950459; 
 Wed, 06 Mar 2024 17:45:50 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170903244d00b001dcc28544dbsm13269621pls.78.2024.03.06.17.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 17:45:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 17:45:40 -0800
Message-ID: <20240307014541.2900022-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709775950; x=1710380750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zLh+asQ0vuftrvcBWlUtysHDTr4HiUo8aCsQPv26NnA=;
 b=pYiOFymoy/dN3BMx7+ZCjV05q3/ClZRpMn35ueTDNwB0D3oEN/ZFMZAJ3Dpef4JRsJ
 n/CO57q45VLRhVl5lTDqjvuo3MQC5F9N76P+Rgua/HE43NIb2NgY5KEhSQ/6Ngci8kU3
 Y543+1dBwrEyBVtTiHoVRDQNsDO+LLbT4y8lcQmTs8pNtBJP14gs3SSZy53VTV4Rs31c
 9VIECuhmDMRPBqgYT/jaxIeRwQ/fof9g0kc7PTaCo0ZP9kjqVc7cEblATWTbI9J3uz7F
 NH81nrBDmKvAHikGlWLr7avCRI5HvYfTPoV6fRRMYtvoNY5oMJ7u58PSCT/xOP/2GU1b
 Inyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=pYiOFymo
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 2.24.7
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

https://github.com/docker/compose/releases/tag/v2.24.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 92f7b227d3..ca3d08cf63 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed132bcc226261a595469f5ca6d4ea20b02965867216b56d4e7a5962efb46570  docker-compose-2.24.5.tar.gz
+sha256  931bfcc34eb43106be07787372bb853d4cd82830a5785f3049c5192ab0e4ac35  docker-compose-2.24.7.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 947f09d0b3..5417ba2d4f 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.24.5
+DOCKER_COMPOSE_VERSION = 2.24.7
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
