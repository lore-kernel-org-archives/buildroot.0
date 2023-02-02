Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936AAC05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAADB81FD5;
	Thu,  2 Feb 2023 13:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAADB81FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HG-125VF1dcB; Thu,  2 Feb 2023 13:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1444981FC5;
	Thu,  2 Feb 2023 13:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1444981FC5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4593E1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CF9B40363
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF9B40363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALSJozJcCXFF for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:14:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFFF40120
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACFFF40120
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:14:01 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id n2so1156640pfo.3
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3/K/Q8KQ73BZn7JebizuCkbCr0OIgUF5dyf87CXc5Jc=;
 b=vifr6mHtmq+daESI/W/WWa88By9YBx20nVboQPsDgH2Q5FhkllNMI3uyQSJpwhTFKq
 NNYZSr+5zEiTDOYjR1c476rOc2vPfvsOJa0t3HvPeWWfMprgatMQZvs05Camwc5uw6wA
 qVlA3FmadCL34EYg4UKAZOr/3nfTdl2OstjnO89WZLIS52962x8q9poK1D+xqwgimCKy
 b/+Yt4MAouNPaHshCvlDQ07DjJHDlrCdIb3kCeJ3MXOu2aGNW2Fj9gfaRON17Rc4zOE5
 DwCg5tzqcmuBqOIzFsVEVnYAYqx8kF+5eyd1+F0HcZYbwZU0OwJBTDCMJguaOsNR6qZV
 RqGg==
X-Gm-Message-State: AO0yUKWacwma7WPvhwcyBZJlbFsq8nTylZEgqQGud7ROfZhgt9fDG0sh
 jBgC89DCnveqZNV3cp3k8NmBUutDYFtAHw==
X-Google-Smtp-Source: AK7set/H3hjbRq/745/sKIaFVc2cu1tE4vn0tZcSZSxJnljbIdho7HxYp2zfTGVtwWsUx38P7I027w==
X-Received: by 2002:a62:7b82:0:b0:593:da8:6f2c with SMTP id
 w124-20020a627b82000000b005930da86f2cmr6037087pfc.5.1675343640415; 
 Thu, 02 Feb 2023 05:14:00 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f132-20020a62388a000000b00593e5a45ce7sm6339999pfa.173.2023.02.02.05.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:13:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:13:52 -0800
Message-Id: <20230202131354.1193243-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/3] package/docker-engine: bump version to
 v23.0.0
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

This update requires a workaround for the non-standard vendor/ structure in the
docker-engine repository, which has an invalid vendor/modules.txt file.

Removing the vendor/modules.txt file fixes the build error.

Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705

The go download post-process script uses go mod init to create the go.mod file
which specifies a language version of go1.16 on default. Use go mod edit to
adjust the go.mod file to the required minimum version go1.19 for generic types.

https://github.com/moby/moby/releases/tag/v23.0.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d15b1359cb..670cbd414b 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
+sha256  94492508260e57eb93399257d53435cd5308ca6330e173ca6e6f3dbf4c6e12f3  docker-engine-23.0.0.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2a9b72ca78..9c193a29a5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.22
+DOCKER_ENGINE_VERSION = 23.0.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -62,6 +62,19 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
+# update the go module version to go1.19
+# docker-engine does not use go modules
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_ENGINE_CONFIGURE_CMDS
+	if [ -f $(@D)/vendor/modules.txt ]; then \
+		rm $(@D)/vendor/modules.txt; \
+	fi
+	cd $(@D); \
+		$(HOST_GO_HOST_ENV) $(DOCKER_ENGINE_GO_ENV) \
+		$(GO_BIN) mod edit -go=1.19 go.mod
+endef
+
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
