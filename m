Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2777FC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBE7418C1;
	Thu,  2 Feb 2023 13:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBE7418C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uySEc4baV3yq; Thu,  2 Feb 2023 13:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8744D418BC;
	Thu,  2 Feb 2023 13:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8744D418BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F311D1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD769418BC
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD769418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQ3qjIFI8ejM for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:26:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD469416F1
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD469416F1
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:26:54 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id z1so1791102plg.6
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j4Qj1+XwCzfmpLKlmPIxVoyLc7btV/bfEuOMM2MAXbc=;
 b=h8Shp8gNFY/O6iT3xvq24Hcdji9B5dKGrK5XoHBODydP592q/rGQKh491ghiYUCz1K
 Y1oBuPmUeh4zBj1ycljw3goSapKqL0DvqWuZMs9+tVfRc7j+m0CfFxqJ2huAHY2P9Hwa
 jY8GeofWe47kcP7I8NdUYhzDXv0r+6jqZYIV7UsvinT5lcqf0I5uzAOtL4GNj6XwEpPD
 W9MsNfYG/f1Z81tU5C6q51oPf6TWLnQUkHLtGR3PFvczRDZTbGDSLaKikTy6ZIKy4HTY
 K1U45h1EJTDaEQ2uCjLo3QqVGUjvHrTcpgml4X6QBo0gNYzjvXpD4NHMXSn9pgT8wTur
 PlvQ==
X-Gm-Message-State: AO0yUKWJZ7EYvp68otiJowVJoUsQFDrKoSy5cWmgXk72pT3TQLYvDwPJ
 G1MiV4iJq+F6cvEoQygL0AAGNPPyoBAkFQ==
X-Google-Smtp-Source: AK7set//yWdEQY38S1MSh3e4WJ044YEYuYj/+iwrSdoCJ66l+6yR3qa172jQh+2ywZ2wsG2EiCo7Ow==
X-Received: by 2002:a05:6a21:999a:b0:bc:cd2c:dfce with SMTP id
 ve26-20020a056a21999a00b000bccd2cdfcemr8027272pzb.31.1675344413681; 
 Thu, 02 Feb 2023 05:26:53 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f7c600b001963232f49dsm7541851plw.233.2023.02.02.05.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:26:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:26:50 -0800
Message-Id: <20230202132650.1537778-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/balena-engine: bump to version
 20.10.26
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
balena-engine repository, which has an invalid vendor/modules.txt file.

Removing the vendor/modules.txt file fixes the build error.

Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705

The go download post-process script uses go mod init to create the go.mod file
which specifies a language version of go1.16 on default. Use go mod edit to
adjust the go.mod file to the required minimum version go1.19 for generic types
used by docker-engine. (Fixes a build error).

Remove the vendor/archive sub-tree (fixes a build error) because Go no longer
allows having duplicate packages in GOPATH and GOROOT. vendor/archive/tar cannot
be in vendor/ because it exists in the standard library. Remove it from vendor/.

https://github.com/balena-os/balena-engine/releases/tag/v20.10.26

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/balena-engine/balena-engine.hash |  2 +-
 package/balena-engine/balena-engine.mk   | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index 4adb8ce561..6a92a40cc8 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4fb38109d133d499de366466a612fb6f523ea99d56fcd69b45dc494a75fbce0f  balena-engine-20.10.21.tar.gz
+sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index ecfb62bfbf..3b8b2f9ac6 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 20.10.21
+BALENA_ENGINE_VERSION = 20.10.26
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
@@ -34,6 +34,18 @@ BALENA_ENGINE_TAGS = \
 
 BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
 
+# remove the conflicting vendor/modules.txt
+# remove the conflicting vendor/archive (not allowed in go1.20)
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define BALENA_ENGINE_CONFIGURE_CMDS
+	if [ -f $(@D)/vendor/modules.txt ]; then \
+		rm $(@D)/vendor/modules.txt; \
+	fi
+	if [ -d $(@D)/vendor/archive ]; then \
+		rm -rf $(@D)/vendor/archive; \
+	fi
+endef
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 BALENA_ENGINE_DEPENDENCIES += systemd
 BALENA_ENGINE_TAGS += journald
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
