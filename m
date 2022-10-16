Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14063C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 22:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992FA60EFE;
	Sun, 16 Oct 2022 22:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 992FA60EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZqHRvtilQAW; Sun, 16 Oct 2022 22:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48F260B9F;
	Sun, 16 Oct 2022 22:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48F260B9F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D52E1BF385
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 22:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1825A60B9F
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 22:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1825A60B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgvPvHh0G4XZ for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 22:42:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49589607C7
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49589607C7
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 22:42:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d24so9249850pls.4
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UbsWuxHu5ek8N0z+H1gZwhiadsRfdm8txoZhwbti0o=;
 b=i624BMdmA/swM+Pa6ab9PUsPNanSJ4fAw6UgVpyTfpysagyiIYmMZQBPkkpWkiUfj+
 AeDQKaj1OEsAwJ2mT5l7gERhsxesfuypKscoCiI0DzCUc/Z0ehMNvEXJhHJ+8DjkoeVS
 jVYAUsRLA204mjODz08YcXfhAN4JffjwLEe9EP1bILWygu2LdqIrdBBes9M7BUmD8y2N
 8rkB3CHvBG/+pstv1Fw2R4h4BDE2WCifCU05uSJQgNUJifBNQsZYbivH67sAD7HAlrjD
 GiRrT7AErwB24Bjt/VZ61pFTR3ZKfxTZFpH+WIM/zt5Hn2hfIXfL42AHnTQG/wsXqobB
 jyKg==
X-Gm-Message-State: ACrzQf0JvCoAKUIGI6RQGAEDrVF4p4sPhkl3EdXL7KIcS5jZns6az2aE
 M7sQsZBnlAUqQRuClwxZ/aHZkkHS3jLP9g==
X-Google-Smtp-Source: AMsMyM7mSYDMnq4g/8luTwvHx7ixWMMGuc6vkyKaWUUwiEOHHG6Z7xTgGwl6oandaXJE6LFp4S/j+w==
X-Received: by 2002:a17:90b:388c:b0:20a:9c33:dd2b with SMTP id
 mu12-20020a17090b388c00b0020a9c33dd2bmr28857202pjb.225.1665960158170; 
 Sun, 16 Oct 2022 15:42:38 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b00561cf757749sm5575936pfg.183.2022.10.16.15.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:42:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 15:42:33 -0700
Message-Id: <20221016224233.237038-2-christian@paral.in>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016224233.237038-1-christian@paral.in>
References: <20221016224233.237038-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: bump to version
 20.10.19
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

This release of Docker Engine comes with some bug-fixes, and an updated version
of Docker Compose.

Builder

    Fix an issue that could result in a panic during docker builder prune or
    docker system prune moby/moby#44122.

Daemon

    Fix a bug where using docker volume prune would remove volumes that were
    still in use if the daemon was running with "live restore" and was restarted
    moby/moby#44238.

Packaging

    Update Docker Compose to v2.11.2.

https://github.com/moby/moby/releases/tag/v20.10.19

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index e1c29f0926..dfd4f4e365 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9907aaaf39fb1c2c3fd427192e4a63d7adf8ddc9fb0e29c692a6ca10de9c34f6  docker-engine-20.10.18.tar.gz
+sha256  228caadac1b37a5ba310eb25418cf1fdd8878336f1d8faf0a2daa87fcc577577  docker-engine-20.10.19.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 246419ec4f..dc45baf055 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.18
+DOCKER_ENGINE_VERSION = 20.10.19
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
