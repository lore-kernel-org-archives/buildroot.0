Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EC5C54EBD
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 10:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25EB4189F;
	Fri, 13 Jan 2023 10:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25EB4189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XF-McHitml1; Fri, 13 Jan 2023 10:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B634B41893;
	Fri, 13 Jan 2023 10:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B634B41893
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6825D1BF32C
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 10:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4134960C19
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 10:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4134960C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJ-oAx_CsqQI for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 10:05:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6170E60B8C
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6170E60B8C
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 10:05:59 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso1237074pjb.0
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 02:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8U8yB4UuLyd9PeNt8fEGjYe9V5Ibsbya/uFUZKtTI8Y=;
 b=lf5rzliErhHUbeiFMSYSManHaDJZAOiUnoROXrC+6m3Q2Kg7OyjipF4i1E7HBQM3sU
 NRTs3a+KUmOsIj8BArdl6jXJ7aQKOo1e6Wh4USE/oPaIUM2FIb1WwXwF3H3GE8PkG+wp
 9MsadJF2nhXUN5yaUljMZbEpJ9xlYHZOqsnmuYVlV7fE2YGRTT6zLCg156rcPs86FnW1
 Dx3y6BMLaRFbzo8ZSpHouHnrYGIwFs/5KMP0YSfIA7qTEsK+2nIXFALxSZzRrLqoohY9
 SGPamCIFUdZT99rD7OOzyx0gM8/7I7I8ybrX3hcSEVq0G8TcfQeS1QysgQWFBGWHFPzC
 1TZw==
X-Gm-Message-State: AFqh2kqTWN2jdR4GW4QCD9V/WpQi9ssoJuKXkx47gXI1xhYaRj6Er6aY
 Emgj4Ez7cZhex0eqIbyJ3BgrTWvOITMaKA==
X-Google-Smtp-Source: AMrXdXuXVgfoWxklaSJwssEd7iYHwkvRhChOy03wlROU9rwq8FGd0oCx8OOEVH+W+an9Sjgoq0mM3w==
X-Received: by 2002:a17:90a:bd81:b0:219:14af:3538 with SMTP id
 z1-20020a17090abd8100b0021914af3538mr10447648pjr.40.1673604358283; 
 Fri, 13 Jan 2023 02:05:58 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o33-20020a17090a0a2400b00226463cd239sm13894262pjo.15.2023.01.13.02.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:05:57 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 02:05:52 -0800
Message-Id: <20230113100553.2836256-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 20.10.22
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes and enhancements

 - Improve error message when attempting to pull an unsupported image format or OCI artifact (moby/moby#44413, moby/moby#44569)
 - Fix an issue where the host's ephemeral port-range was ignored when selecting random ports for containers (moby/moby#44476).
 - Fix ssh: parse error in message type 27 errors during docker build on hosts using OpenSSH 8.9 or above (moby/moby#3862).
 - seccomp: block socket calls to AF_VSOCK in default profile (moby/moby#44564).

https://github.com/moby/moby/releases/tag/v20.10.22

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 10e9727a08..d15b1359cb 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61f4c3a2d0426e1bbbda1b0e5dd33ec203776f7d99d1a61522c77c04c4ed09fe  docker-engine-20.10.21.tar.gz
+sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 36c66485ba..2a9b72ca78 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.21
+DOCKER_ENGINE_VERSION = 20.10.22
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
