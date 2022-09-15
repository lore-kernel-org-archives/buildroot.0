Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ACFECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 18:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD49383E84;
	Thu, 15 Sep 2022 18:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD49383E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7uafmVDPXAu; Thu, 15 Sep 2022 18:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB7AF83E45;
	Thu, 15 Sep 2022 18:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB7AF83E45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95D641BF5AA
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E46B410EC
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E46B410EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvRLdsw1Re3O for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 18:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA2A410E7
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFA2A410E7
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 18:34:03 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y127so18906529pfy.5
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 11:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=KLc0wCGmOQPgeLNqQnko6wOrRpPPWdFNIhynY0gPS/4=;
 b=j9UdNvL+pHfB/6q4o4XUxc6O0S6UHveuWOwMaM9OY98aFiDvd0h6sDc3zBndXPYhBA
 OshutiTbeJA4e96ZwkGApjsaD+6tOlGsyfzrBU0siDZ7vZrvPvAdPVBP0o7Io/gbgTtT
 rfIQw7te5fyjcpFIeco+FIZlgqCx/fxLCZNce6CQxbWeQx7Atm1VzmFjWyswUTHRUi3F
 Uv8ZxN6CPOdd1gDefw7HgaeNov/pzPF2elBP2K4mverMabvZ5WPcwdLEhb8uEo+dqiwv
 AlbekG37qKTbLMuToExsGTNRUaBfxs9++6fRoKifFfrTFqJCZjjHL8dQbtSd7kgu2wdr
 di1g==
X-Gm-Message-State: ACrzQf3YWbHS0urgR0CPAqiSTjcA05+K/EOil35UvaS9X/cU72G3XZLa
 mbyA3BpyYhSCERJ7fwJZr5pIMMYK/tBNXw==
X-Google-Smtp-Source: AMsMyM4SO0DtXdjshMUn8UkldF7cvFfZA9nV5U5KwuFOCkAWLsNi3ijhLXGtQkxfYJdD8WIfvf7ABA==
X-Received: by 2002:a63:90c4:0:b0:438:a962:61e7 with SMTP id
 a187-20020a6390c4000000b00438a96261e7mr1009074pge.426.1663266842644; 
 Thu, 15 Sep 2022 11:34:02 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y34-20020a631822000000b0041d6d37deb5sm11900403pgl.81.2022.09.15.11.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:34:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:33:58 -0700
Message-Id: <20220915183359.481550-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump to version
 20.10.18
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

https://github.com/moby/moby/releases/tag/v20.10.18

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 2cf2f4a75e..e1c29f0926 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  061cf8579aa3c813c353c80fa480744e2f6cca2e6392f546bd0942a6a10c7a14  docker-engine-20.10.17.tar.gz
+sha256  9907aaaf39fb1c2c3fd427192e4a63d7adf8ddc9fb0e29c692a6ca10de9c34f6  docker-engine-20.10.18.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index fb489c0f8d..246419ec4f 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.17
+DOCKER_ENGINE_VERSION = 20.10.18
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
