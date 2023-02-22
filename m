Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110AAC64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 07:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64FB860B6A;
	Wed, 22 Feb 2023 07:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64FB860B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQtTyk22yXJI; Wed, 22 Feb 2023 07:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87F0160B5C;
	Wed, 22 Feb 2023 07:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F0160B5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2B41BF33C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 07:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46AFD41744
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 07:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46AFD41744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OcAkcWEwLNtf for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 07:23:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DE6410C7
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17DE6410C7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 07:23:41 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id u10so7836236pjc.5
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 23:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jbgw5MptYv8zmSva8liQlUhlOML/OVcnHfocd/Om2BU=;
 b=UscJkZzFka1Jg7pxDyCGS8hdJrfub4sWt/d/MHQcEQd6jda0PkpY0vGZAnnn3hNy8D
 wCznGtZBcs9IXfdhGOYoJ3qzi7EUcYzJtemi7mafLud2ppQfG6urmZSDiVknt4FI9MYS
 MDhuTEowz9ZSOoQwJkpbas5Wy66nKUAlcBeqv1xoYgzTR5cxbh1FeixLwzON2UwteDhl
 1nFsx4OjPa8xGXmPjqia1rlwXN3SQhWLvt0ydl2PoTiNXN2H8ajDRbqKWxsg2KHewDq8
 mtQEcFOa0iVwdEdjka4H5+R9JLkPWc7VBwBKhpK/L+yU7A3C+cMwyQHApeDAUyLea2Wf
 b1Ng==
X-Gm-Message-State: AO0yUKUCN/Mw5lhVKPi0a+F07NV4qILWhlslJpOAMTINvJyaZfqk/aQw
 W6MvUZILN67yOBwbP4p/1O3y4somsZ4=
X-Google-Smtp-Source: AK7set9IMscF1x7/oQGZTiNSj91yQUcP0mCUghSY/8Py42CoSfmRmJyoFiDhL1M/pYtjzA+q05J6Zg==
X-Received: by 2002:a17:90b:4c50:b0:234:d1c:f112 with SMTP id
 np16-20020a17090b4c5000b002340d1cf112mr9089405pjb.0.1677050620969; 
 Tue, 21 Feb 2023 23:23:40 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e14-20020a65648e000000b004fab2ba60adsm3267127pgv.81.2023.02.21.23.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 23:23:40 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 23:23:37 -0800
Message-Id: <20230222072337.2953461-1-christian@paral.in>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/docker-cli-buildx: new package
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

buildx is a docker CLI plugin implementing extended build features.

buildx is the default builder as of Docker v23.x, and if the plugin is not
present, the CLI will output an error warning that it is using the deprecated
built-in builder instead of the buildx builder.

However, buildx is a separate repository from docker-cli: it is a plugin that
needs to be installed at /usr/lib/docker/cli-plugins on the target.

https://github.com/docker/buildx

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 package/docker-cli-buildx/Config.in           | 15 ++++++++
 .../docker-cli-buildx/docker-cli-buildx.hash  |  3 ++
 .../docker-cli-buildx/docker-cli-buildx.mk    | 36 +++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/docker-cli-buildx/Config.in
 create mode 100644 package/docker-cli-buildx/docker-cli-buildx.hash
 create mode 100644 package/docker-cli-buildx/docker-cli-buildx.mk

diff --git a/package/Config.in b/package/Config.in
index 6c5238a9b0..140c2417d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2639,6 +2639,7 @@ menu "System tools"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-cli/Config.in"
+	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/earlyoom/Config.in"
diff --git a/package/docker-cli-buildx/Config.in b/package/docker-cli-buildx/Config.in
new file mode 100644
index 0000000000..a6b343a794
--- /dev/null
+++ b/package/docker-cli-buildx/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DOCKER_CLI_BUILDX
+	bool "docker-cli-buildx"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_DOCKER_CLI
+	help
+	  buildx is a Docker CLI plugin for extended build capabilities with BuildKit.
+
+	  https://github.com/docker/buildx
+
+comment "docker-cli-buildx needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-cli-buildx/docker-cli-buildx.hash b/package/docker-cli-buildx/docker-cli-buildx.hash
new file mode 100644
index 0000000000..6a360a5ead
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e21ce4b222cfcc5fe981a1ee51fca1f7c7d59de0f1911ae3f64f6d9a969695a3  docker-cli-buildx-0.10.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
new file mode 100644
index 0000000000..9aafcac85e
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# docker-cli-buildx
+#
+################################################################################
+
+DOCKER_CLI_BUILDX_VERSION = 0.10.3
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
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_CLI_BUILDX_FIX_VENDORING
+	printf "module $(DOCKER_CLI_BUILDX_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+endef
+DOCKER_CLI_BUILDX_POST_EXTRACT_HOOKS += DOCKER_CLI_BUILDX_FIX_VENDORING
+
+define DOCKER_CLI_BUILDX_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/bin/buildx \
+		$(TARGET_DIR)/usr/lib/docker/cli-plugins/buildx
+endef
+
+$(eval $(golang-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
