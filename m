Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09CEC3DA61
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27EA24059A;
	Fri, 19 Jul 2024 03:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6n1jexo33t7; Fri, 19 Jul 2024 03:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAEAF407A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAEAF407A5;
	Fri, 19 Jul 2024 03:22:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03FAB1BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E58E8608AA
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUAV47Mvm1nM for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4CA060741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CA060741
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4CA060741
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:22:10 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1fb8781ef1bso13498885ad.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721359330; x=1721964130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJY3hRuDsP4UCZKuS8l8VYuItuAP3MkCGciGUExmo4M=;
 b=WuW8dCgDLQjlX4KWfo1UDORdlftRkMg4beCZGM5N50OejlPO1cMp/RErdVLiWYykNj
 W9Og/5O35pq8oK4tb9cLjIbfFupWBQ8YhJgTMmrwaBWFKu1vmZfO8SKozt7xeouFMQmf
 jShcUwrSuxHkUc78VfeAdwI18nRR9u4n6m4u6ONEd5ALTk5MYoR4YReB9oPqtrvWfgz0
 MZXhGLsAUuG2M1P/WfbLRoU85MTzA7D2pvAHETjY2z0MOY67v7HcQwHMaQRE7GZ5xx5w
 jqpR5a2pnd8MCOypInxKo3Nvd2I1AXmF1A1Fse4nA1XSqflEizs887ux0h74GlHFfoF4
 D/CA==
X-Gm-Message-State: AOJu0Yy8S+9BwUgqNJaaAZL6M3bidynJUiScaRfGxihMQuZ+ELcrAI7+
 mXdiBGJ7vPOj+WmFrJVUsVkR+C5IZkvcvMtF6wqJ+TFOT3pIpPy2qZhbV9XIprb8eqAxo9uDihl
 Jv9IS7Q==
X-Google-Smtp-Source: AGHT+IF64JqLtomv8x+ERNYT09VBXl0q4FV6OOHPpSYFFm6JS2welbD4Q5gHki695CjoJ7CxKDqdpQ==
X-Received: by 2002:a17:902:d4cb:b0:1f8:44f8:a364 with SMTP id
 d9443c01a7336-1fc4e6886e0mr61309175ad.48.1721359329525; 
 Thu, 18 Jul 2024 20:22:09 -0700 (PDT)
Received: from localhost ([157.97.134.29]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-1fd64d4cf21sm3290225ad.275.2024.07.18.20.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:22:08 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 20:22:05 -0700
Message-ID: <20240719032205.5659-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721359330; x=1721964130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hJY3hRuDsP4UCZKuS8l8VYuItuAP3MkCGciGUExmo4M=;
 b=V/x/1AfWJcS53c1oIJrtINreJEu9ci1tkOcihONF1vMveSI14fijuN3xyMBQKBQAMI
 h62mzGVl8d4Cd5gQQzVP4vaJZKE1bWHO/li5WUyVsTQbq6svsmtvIT8NeaxgciZEX/8Z
 t2PVW/c5zMveexAEEsS3D9AkrrfkBdeYywiEhtwO0c5QI82gdOV8bLPgO/dpydC9ZqiD
 LSEfnAfbFrskrmjKF7cx2dJHb5RNoovuGdXq5dVKUjgSVlrJwygvCHgSdyVC90cySzG7
 U86eoko9b3Bhp/6V1XcKYRrMFC/GYv0pM6nPJmx0qOCOyPllAmbG4UAy9pGQznNAXOo9
 bhvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=V/x/1AfW
Subject: [Buildroot] [PATCH v1 1/1] package/docker-cli-buildx: bump version
 to v0.16.1
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

Drop the vendor/ workaround as it is no longer necessary.

https://github.com/docker/buildx/releases/tag/v0.16.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli-buildx/docker-cli-buildx.hash |  2 +-
 package/docker-cli-buildx/docker-cli-buildx.mk   | 11 +----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/docker-cli-buildx/docker-cli-buildx.hash b/package/docker-cli-buildx/docker-cli-buildx.hash
index a6e0b0deab..26b187d12a 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.hash
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  371eb742213ed580179fc4fdfd9a197f0e3115e91979b7907828427d578d49e5  docker-cli-buildx-0.11.2-go2.tar.gz
+sha256  8c9dd3fb18ccba399223ba0f623c9fe09fa38fb2a05283131be8e4e139b2d8fa  docker-cli-buildx-0.16.1-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
index b62d09fbcc..ea77a86077 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.mk
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_BUILDX_VERSION = 0.11.2
+DOCKER_CLI_BUILDX_VERSION = 0.16.1
 DOCKER_CLI_BUILDX_SITE = $(call github,docker,buildx,v$(DOCKER_CLI_BUILDX_VERSION))
 
 DOCKER_CLI_BUILDX_LICENSE = Apache-2.0
@@ -19,15 +19,6 @@ DOCKER_CLI_BUILDX_LDFLAGS = \
 	-X $(DOCKER_CLI_BUILDX_GOMOD)/version.Revision=$(DOCKER_CLI_BUILDX_VERSION) \
 	-X $(DOCKER_CLI_BUILDX_GOMOD)/version.Version=$(DOCKER_CLI_BUILDX_VERSION)
 
-# create the go.mod file with required language version go1.20
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_CLI_BUILDX_FIX_VENDORING
-	printf "module $(DOCKER_CLI_BUILDX_GOMOD)\n\ngo 1.20\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_CLI_BUILDX_POST_EXTRACT_HOOKS += DOCKER_CLI_BUILDX_FIX_VENDORING
-
 define DOCKER_CLI_BUILDX_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/bin/buildx \
 		$(TARGET_DIR)/usr/lib/docker/cli-plugins/docker-buildx
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
