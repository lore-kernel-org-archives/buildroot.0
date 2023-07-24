Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D261C001DC
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 01:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A2C9409A2;
	Mon, 24 Jul 2023 01:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2C9409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qHeS0_gJCjO; Mon, 24 Jul 2023 01:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D4C409A9;
	Mon, 24 Jul 2023 01:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D4C409A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 361381BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F15560BA4
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F15560BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAIoHl_AKbnG for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 01:09:11 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B437860B98
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 01:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B437860B98
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b895a06484so22110505ad.1
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690160951; x=1690765751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDj7LntQw1NeAaLmqGxKB8VK+m73C3pQ4wxv1EPx9GI=;
 b=j6abDB6VXM1OY8zMhE2QA9nVTiEINTY4W4n4nIpQNhP/WQVqotQZxLDeWrpYHuloaf
 MlNKBhgEVrSlteGA4SxRp6wck5qAwb0vScZSkH46mg0a1sldFcdB5WvhzCMKQ8MKkAqQ
 Q4syaeO3wAgHCtaaZDsaiNdxwRhYKJO+BJ40d8lo8Ts/GEFdhLClj5mumpxvnTxQ9R7+
 NKo/bh0us6lSe/H9W004mjk2n8P2Gf2yfpRgrqu7XNq77MAm/xfAYwxh3tIWWy+wLdq7
 9maCH/uVLuRwHYHl+r95x5YEuCpHJq7PYakNR0Hxki5qTp736shonxhKgDSLYZgsAexK
 WoLA==
X-Gm-Message-State: ABy/qLYBtjxS/ctNc8FJ/qlcNlUBZZSfeAoXLpGok6y5RhFEh7vqM++Z
 sHP+K7rJYPHJU/T+LV8EfjMUvsvpiMRWTEC2bLnpTxr9oT8=
X-Google-Smtp-Source: APBJJlHiiKAI/211JGIOMwed7bdSbcDT6mG6uuGvE/loEHimadKIFkCF2CNNfuxNoLYLY0a+Adh2Wg==
X-Received: by 2002:a17:903:183:b0:1b8:a936:1905 with SMTP id
 z3-20020a170903018300b001b8a9361905mr9548805plg.38.1690160950862; 
 Sun, 23 Jul 2023 18:09:10 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l14-20020a170902f68e00b001b7e63cfa19sm7508372plg.234.2023.07.23.18.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 18:09:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 18:09:07 -0700
Message-ID: <20230724010907.411055-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690160951; x=1690765751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FDj7LntQw1NeAaLmqGxKB8VK+m73C3pQ4wxv1EPx9GI=;
 b=bJhdRgUlc42kjdfmwnTP1f1xu9NCPVgxJ7BCoCB7eJDr8S6ZCXo3XWs1WJtMZSiNzq
 vsUsayHm+hYH+PzUtNCf6giHXMyH8uEkwfoA4m0iBQZPmFAidXV/5dBQ9QwVF6Q+GfzR
 Nfm7qgTGrZ/R7yH86DxBNBHERNY64zuR7AdshhhofVEfboe3UAmmZ3cfaXYTF/qFoykC
 PQdhpgF7ZOkjGiPpqpo/4CNFUxMOtoKFGgQ41h2QxbG7kVU0edIjHjyDILq9u9/+HHGv
 wIDMwdJaftPCa3tXJUdCqN/rwig0b7zD9OFpK/QFsx0VYaJdx2wmOQiEJCrRYlDTrYY9
 lcEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=bJhdRgUl
Subject: [Buildroot] [PATCH v3 1/1] package/docker-cli-buildx: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

buildx is a docker CLI plugin implementing extended build features.

buildx is the default builder as of Docker v23.x, and if the plugin is not
present, the CLI will output an error warning that it is using the deprecated
built-in builder instead of the buildx builder.

However, buildx is a separate repository from docker-cli: it is a plugin that
needs to be installed at /usr/lib/docker/cli-plugins on the target.

https://github.com/docker/buildx

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - buildx: bump version to v0.11.1
 - https://github.com/docker/buildx/releases/tag/v0.11.1
 - NOTE: docker-cli-buildx requires language features from go1.20!
 - Depends on bump to go1.20.x:
   - https://patchwork.ozlabs.org/project/buildroot/patch/20230711220849.1702358-3-christian@aperture.us/

v2 -> v3:

 - Rename bin from buildx to docker-buildx (fixes docker cli not finding it)
 - update docker-cli-buildx to v0.11.2
   - https://github.com/docker/buildx/releases/tag/v0.11.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/Config.in                             |  1 +
 package/docker-cli-buildx/Config.in           | 16 +++++++++
 .../docker-cli-buildx/docker-cli-buildx.hash  |  3 ++
 .../docker-cli-buildx/docker-cli-buildx.mk    | 36 +++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/docker-cli-buildx/Config.in
 create mode 100644 package/docker-cli-buildx/docker-cli-buildx.hash
 create mode 100644 package/docker-cli-buildx/docker-cli-buildx.mk

diff --git a/package/Config.in b/package/Config.in
index 1e551d17c4..9f8834e8b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2650,6 +2650,7 @@ menu "System tools"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-cli/Config.in"
+	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/earlyoom/Config.in"
diff --git a/package/docker-cli-buildx/Config.in b/package/docker-cli-buildx/Config.in
new file mode 100644
index 0000000000..486f1196c3
--- /dev/null
+++ b/package/docker-cli-buildx/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_DOCKER_CLI_BUILDX
+	bool "docker-cli-buildx"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_DOCKER_CLI
+	help
+	  buildx is a Docker CLI plugin for extended build
+	  capabilities with BuildKit.
+
+	  https://github.com/docker/buildx
+
+comment "docker-cli-buildx needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-cli-buildx/docker-cli-buildx.hash b/package/docker-cli-buildx/docker-cli-buildx.hash
new file mode 100644
index 0000000000..dfbcdb1902
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  371eb742213ed580179fc4fdfd9a197f0e3115e91979b7907828427d578d49e5  docker-cli-buildx-0.11.2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
new file mode 100644
index 0000000000..b62d09fbcc
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# docker-cli-buildx
+#
+################################################################################
+
+DOCKER_CLI_BUILDX_VERSION = 0.11.2
+DOCKER_CLI_BUILDX_SITE = $(call github,docker,buildx,v$(DOCKER_CLI_BUILDX_VERSION))
+
+DOCKER_CLI_BUILDX_LICENSE = Apache-2.0
+DOCKER_CLI_BUILDX_LICENSE_FILES = LICENSE
+
+DOCKER_CLI_BUILDX_DEPENDENCIES = host-pkgconf
+
+DOCKER_CLI_BUILDX_BUILD_TARGETS = cmd/buildx
+DOCKER_CLI_BUILDX_GOMOD = github.com/docker/buildx
+
+DOCKER_CLI_BUILDX_LDFLAGS = \
+	-X $(DOCKER_CLI_BUILDX_GOMOD)/version.Revision=$(DOCKER_CLI_BUILDX_VERSION) \
+	-X $(DOCKER_CLI_BUILDX_GOMOD)/version.Version=$(DOCKER_CLI_BUILDX_VERSION)
+
+# create the go.mod file with required language version go1.20
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_CLI_BUILDX_FIX_VENDORING
+	printf "module $(DOCKER_CLI_BUILDX_GOMOD)\n\ngo 1.20\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+endef
+DOCKER_CLI_BUILDX_POST_EXTRACT_HOOKS += DOCKER_CLI_BUILDX_FIX_VENDORING
+
+define DOCKER_CLI_BUILDX_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/bin/buildx \
+		$(TARGET_DIR)/usr/lib/docker/cli-plugins/docker-buildx
+endef
+
+$(eval $(golang-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
