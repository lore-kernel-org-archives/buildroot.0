Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7F5C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 04:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E63060E03;
	Tue,  7 Feb 2023 04:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E63060E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ILmMJj-kp9C; Tue,  7 Feb 2023 04:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C34D60DF4;
	Tue,  7 Feb 2023 04:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C34D60DF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCADC1BF2C8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 962E781D72
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962E781D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgYndPBRNd3y for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 04:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5AA81D70
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE5AA81D70
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 04:30:17 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id bx22so10854025pjb.3
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 20:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ihahv+XNKVZ1B0lme4IvEJFzN8zd2+ZHTwBXEWB1GM=;
 b=KbLZS9II39FSehOuEQhdvKQrronD+BWnZAVn0bBmlKzwCYYvrOo7ZgZ/1KexStV5gG
 1BwubFV/94Fte+lXaHgbkqXpptzTQc7XjSyIf+qu0PLBANVMqNSMS5szAUSRqsyELz2l
 AXl+s4ubWNkCwCP+WZnYwXykTte8ziTURBeMW7G6Y3THZfh19wcsbUm8N1/Zd8cTjyD6
 DAWs8u1VihePfdK+DdS/dsqqkUHKfiNoaA2kjyzIwm6dtwdHTsMrFrGbbqlF2oh0ybqo
 j4eYKXY5XdHDlryHiliCnDtkxtcX5wye3wC/wxiJV7HEmCY4plTvmlML/sOTktaruwMS
 SQYg==
X-Gm-Message-State: AO0yUKU2EeEuFZqDe00tDozWYWa5AA/ABq/SNofR+bvrV+38GKGaayUW
 xbQzp0ax60dkHqr2CgOOZZo05ccFiwauiQ==
X-Google-Smtp-Source: AK7set8Dvr31IvokIMu7hqwB5yX08h5w5Y0ZGtfRoQDjJX23vdlf2qojtBslo5+VoyPLKCWoMnmP9A==
X-Received: by 2002:a17:902:d1cb:b0:199:dee:f912 with SMTP id
 g11-20020a170902d1cb00b001990deef912mr1312743plb.0.1675744216968; 
 Mon, 06 Feb 2023 20:30:16 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b001967580f60fsm7695484pli.260.2023.02.06.20.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 20:30:16 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 20:30:10 -0800
Message-Id: <20230207043010.85696-3-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207043010.85696-1-christian@paral.in>
References: <20230207043010.85696-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] package/docker-cli: bump version to
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

docker-cli does not ship a go.mod file in the tarball: create one to tell the Go
compiler the root import path prefix for the module and the language version.
Note that the language version in go.mod is not required to be equal the version
of the Go compiler.

This update requires a workaround for the non-standard vendor/ structure in the
docker-engine repository, which has an invalid vendor/modules.txt file.

Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705

Signed-off-by: Christian Stewart <christian@paral.in>

---

v2 -> v3:

 - create go.mod file in the CONFIGURE step
 - update comments regarding adjusting language version
 - use rm -f instead of checking for file existence

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash |  2 +-
 package/docker-cli/docker-cli.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

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
index cb44c68c1b..4b0c9dcc89 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.22
+DOCKER_CLI_VERSION = 23.0.0
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
@@ -29,6 +29,14 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_CLI_CONFIGURE_CMDS
+	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
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
