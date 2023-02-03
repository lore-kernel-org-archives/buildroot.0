Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0603CC636CC
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 03:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB4E41CFD;
	Fri,  3 Feb 2023 03:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB4E41CFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkihNL9w34Dc; Fri,  3 Feb 2023 03:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20DE741D8A;
	Fri,  3 Feb 2023 03:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20DE741D8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57E81BF955
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF4B0820BA
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4B0820BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6e4Ki5VR_9RH for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 03:44:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0C84820B9
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0C84820B9
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 03:44:55 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id m13so4003722plx.13
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 19:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjIbSWQqK25wfbjmCQp6CqeWpVjxSLWxBPvSIF251NQ=;
 b=HbldnaVGySXbsnwSOAkB5+bwV1BzES0goW2yGuV9qMCrDSofQCCRZspBqIqshjplUv
 CfJ/SVfVaLVlvke85mzY9DPeJ9kZpUwg6wODV74qzXevqh3FjgLMhliQ1QsSTzpEJ/Lt
 eOh+fhuB/9xKdtt0UlXlPrF+2iv6IL+cyd8dG1n5IVBlsJh4Kxw9QrmrvG4nKhisxTfW
 ISTg74AOIKTFOmK9XVftIFUyV4Z+7VfAhgEqIOAEj0bC1PREl5mx/GStfbKnc5pqI8YN
 aopN6VOVeRuaKPcd41L9CDI3G6hXRVgbZ/wcQT8S4TibHuf5uo0reF0e8xREz2HG1PnA
 PS1Q==
X-Gm-Message-State: AO0yUKU+waPlMGB6J867Ijm4x+UIV9Nq/CnSeM2UJ0O/71AYA8Uv2yjQ
 tlDZyyupoyBAqkJMMbPBvjm9ayYsWbh4oA==
X-Google-Smtp-Source: AK7set9S2Q3XE8qKvRCyZ1fr4RUoiCXD/kT/Y3U00njNwcgGDb5NnV7eyNbJTaMh0eul6+ST2nZrmQ==
X-Received: by 2002:a17:90b:3809:b0:22c:4455:a84e with SMTP id
 mq9-20020a17090b380900b0022c4455a84emr8726193pjb.49.1675395895278; 
 Thu, 02 Feb 2023 19:44:55 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b00229d7f2abd4sm582529pjq.54.2023.02.02.19.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 19:44:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 19:44:43 -0800
Message-Id: <20230203034443.326513-4-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203034443.326513-1-christian@paral.in>
References: <20230203034443.326513-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/docker-cli: bump version to
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
used by docker-engine. (Fixes a build error).

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash |  2 +-
 package/docker-cli/docker-cli.mk   | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index c6db95f9b3..ff981be963 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84d71ac2b508b54e8df9f3ea425aa33e254fd3645fe9bad5619b98eaffb33408  docker-cli-20.10.22.tar.gz
+sha256  3379d06cd6177832b91f4796c680b6bf15c7895773448716b4c3c5253f611d1b  docker-cli-23.0.0.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index cb44c68c1b..3b155b5675 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.22
+DOCKER_CLI_VERSION = 23.0.0
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
@@ -29,6 +29,19 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
+# update the go module version to go1.19
+# docker-cli does not use go modules
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_CLI_CONFIGURE_CMDS
+	if [ -f $(@D)/vendor/modules.txt ]; then \
+		rm $(@D)/vendor/modules.txt; \
+	fi
+	cd $(@D); \
+		$(HOST_GO_HOST_ENV) $(DOCKER_CLI_GO_ENV) \
+		$(GO_BIN) mod edit -go=1.19 go.mod
+endef
+
 DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
 
 $(eval $(golang-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
