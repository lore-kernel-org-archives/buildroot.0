Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ED5C636CC
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 03:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D759241131;
	Fri,  3 Feb 2023 03:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D759241131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbXZQiKrvtjC; Fri,  3 Feb 2023 03:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B6841058;
	Fri,  3 Feb 2023 03:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B6841058
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C37051BF955
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E82141058
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E82141058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9myIgXkBoFq3 for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 03:44:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFF8940111
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFF8940111
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 03:44:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id k13so4077688plg.0
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 19:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ho3GKGKA7ilKYg8/KoLmw26jYoig5b7K2NLwJ/y2Gmw=;
 b=1v79n9vvdF9vZ74XEWtL9Ryo466atT8a+i5WhkCnMwhfCTYXy6bGh1pUhur/IMlUKD
 K0qp06iNnYUJMTmg+o1+ruA6DEoYYgPrYC4GYzYjwYrqsUDkVbOhZe12VD5O0Zi7c9hP
 QA4uP/feE/aGtjLBBdnP54ohV4/MXpqxVoR7hTyul1nbFlviOUARIM0juHlKivV0SSb+
 DTqiNYn8a+twlPiI8fZo60XbNBKbQnrLuYY/irSEQpL4V4ry6RwTG6oCwplOcjPyLM5A
 zUYzBzKZVlbwKTJ4SjCPpc8RXibz2ulX+H6XgOR6Aebt/GH/LncvbSKterq5XmaCPhXy
 /S0g==
X-Gm-Message-State: AO0yUKXBMWkQ7rUguENAKjeA+j/XsnAUl/oNSTAcZEE4vTfUIINt34JR
 4q6J94VIYjc5xMbXp4NxUOXgsh4Pc10nRQ==
X-Google-Smtp-Source: AK7set8+JBsuVAJQDpbwsSi7FnQS6FVjJoRJtoOfk+qB1U6OtPWRdvKDwm3A1cvK8x1jqQABEmyIlw==
X-Received: by 2002:a17:90a:e7c6:b0:22c:7471:eca7 with SMTP id
 kb6-20020a17090ae7c600b0022c7471eca7mr9329211pjb.34.1675395892564; 
 Thu, 02 Feb 2023 19:44:52 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b00229d7f2abd4sm582529pjq.54.2023.02.02.19.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 19:44:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 19:44:41 -0800
Message-Id: <20230203034443.326513-2-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203034443.326513-1-christian@paral.in>
References: <20230203034443.326513-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/docker-engine: bump version to
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
adjust the go.mod file to the required minimum version go1.19 for generic types
used by docker-engine. (Fixes a build error). Note that this changes the go.mod
language version and is not required to be equal to the current Go tool version.

Note that as of v23.0.0 docker-engine expects containerd to be started by
systemd if --containerd= flag is set in dockerd.service, whereas in previous
versions containerd was started by the docker daemon as a sub-process.

There is no sysv unit for containerd, but this is OK: in the Docker sysv init
file S60dockerd, we do not set the --containerd flag. The docker daemon will
start containerd as a sub-process automatically due to the absence of this flag.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - clarify commit message about containerd.service and sysv compat
 - fix formatting in S60dockerd
 - bundle commit into a series with required containerd changes

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/S60dockerd         |  2 +-
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 16 +++++++++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index def8bea149..7591f9fe66 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -10,7 +10,7 @@ DAEMON_ARGS=""
 do_start() {
         echo -n "Starting $NAME: "
         start-stop-daemon --start --quiet --background --make-pidfile \
-		--pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
+            --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
                 && echo "OK" || echo "FAIL"
 }
 
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
index 2a9b72ca78..208688cc43 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.22
+DOCKER_ENGINE_VERSION = 23.0.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -40,6 +40,7 @@ ifeq ($(BR2_INIT_SYSTEMD),y)
 DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
+
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
 DOCKER_ENGINE_TAGS += experimental
 endif
@@ -62,6 +63,19 @@ else
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
