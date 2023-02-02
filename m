Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA26C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5824881FC4;
	Thu,  2 Feb 2023 13:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5824881FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQrgKGZOwfgf; Thu,  2 Feb 2023 13:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F1581FE3;
	Thu,  2 Feb 2023 13:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77F1581FE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77F861BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C5181FD4
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C5181FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtFHJUbWR4OF for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14FAC81FA4
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14FAC81FA4
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:14:04 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id ay1so1151333pfb.7
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HN6NFv+sCPGyd3riMVeCy6bMH0ymblJhmsJpSP1zT1U=;
 b=SLH8OlQGemwVWWBQ3LKa95S50x6ppbADzknV0DbFl4Fn8VpAzCs2iVjNxihUDfhYPm
 SwslcgiUop5hAHncgILeLv8mlKwFCFGh8kLCrWHKF2dhveD+M501LwECzHRzz0Do4K9S
 p9SUDyja6M4XuOzL0llLcHtgYOmCM3/daLJ/IDJyCNom0uE90DBPTbcetast+117qpgx
 /mJ4h3QyTkYc4ZOtuoaI3ySXfAG4mgh0mzIDkUFvjEEGeSs2QCQT7MbDnt5aiKqJrmEy
 H3LT6LOkiXZdwCrW6gtLd8hilc/6Jvr0yU0Zz2jFYQ9LIrxSNYDXD/3HFMJjmn6jmryy
 WgDg==
X-Gm-Message-State: AO0yUKWL2eo267G+Ta68JC7y4bCh1MX9NxAofNTrX1ODJXIX9Sw0RWlC
 sCoHzkfJ7uhdsMN0fIhGZyRsO2vHaW3CiA==
X-Google-Smtp-Source: AK7set/FCheJLak00Bdmfw/QbwSneM5FzxMH7ZvYk3skDzyZXo9XfxSJx9rcbudEWRJJHvnpxahdeA==
X-Received: by 2002:a05:6a00:410d:b0:593:ea06:7fd with SMTP id
 bu13-20020a056a00410d00b00593ea0607fdmr6408844pfb.13.1675343643126; 
 Thu, 02 Feb 2023 05:14:03 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f132-20020a62388a000000b00593e5a45ce7sm6339999pfa.173.2023.02.02.05.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:14:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:13:54 -0800
Message-Id: <20230202131354.1193243-3-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202131354.1193243-1-christian@paral.in>
References: <20230202131354.1193243-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 3/3] package/docker-cli: bump version to
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
 package/docker-cli/docker-cli.hash |  3 ++-
 package/docker-cli/docker-cli.mk   | 15 ++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index c6db95f9b3..253efd4001 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  84d71ac2b508b54e8df9f3ea425aa33e254fd3645fe9bad5619b98eaffb33408  docker-cli-20.10.22.tar.gz
+# Locally calculated
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
