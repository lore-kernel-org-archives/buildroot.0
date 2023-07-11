Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C01AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB34E41902;
	Tue, 11 Jul 2023 22:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB34E41902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lWVUrT1SLHB; Tue, 11 Jul 2023 22:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A904A41DEE;
	Tue, 11 Jul 2023 22:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A904A41DEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AED2A1BF420
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95DE4414A2
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95DE4414A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYQ1vDjxU32d for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5606440493
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5606440493
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:45:39 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-262d33fa37cso3210316a91.3
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689115538; x=1691707538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SbFCVFaLAekHfyDDZrWMGRlR5pNxahRzus5YpF/GXgs=;
 b=do+gS7P5D4E/mi1wLhGy+zkjkur5NdsgHbwO7UEMOP5uI36GwVOVx/qrX3C1bVFIaX
 P+3W8U+d+M23SGpS3VHoFEKYuEpFHASOhMQzCVGytRwxS+53yH+6N4pTUw99E3HjlZ3L
 +6i+a2KpiSUi9RI8TFAapHxKawa9uFWEXnyVGhbzsmjdl+fCpBgHtL0D5HULpy9LAk/s
 3Q8FX1R38OP0FDtLuE61Edq9f+sGoaEnyztaREG7jR5vE+S5g6VMmOb3bDaR6mbkcyCm
 TtSWRI9OZke4tx+ZCoAf+ZCYGUDrOyhtB6PkFxU/QaifCNFINFAvZht6tBFlbxqBijwC
 zjXA==
X-Gm-Message-State: ABy/qLY3CyJ6XCufnH0U2RL60J/HRPMuXG++LhF2m17yFvFTugh+pvf1
 Ri3I9JiUEQINsAJb3x8hGyu0DEW0R0GrsNimzCHy736FJlQ=
X-Google-Smtp-Source: APBJJlF1Z+kZ7kszyQFFruYt0RoQjmWjZAAwFj3IWUhj01W6PpcAsme9bO4DDH9R8DkmaE1Al0L5Qw==
X-Received: by 2002:a17:90b:3b45:b0:262:ea30:2cb8 with SMTP id
 ot5-20020a17090b3b4500b00262ea302cb8mr13313702pjb.20.1689115538559; 
 Tue, 11 Jul 2023 15:45:38 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 t5-20020a17090a3b4500b0023fcece8067sm2540056pjf.2.2023.07.11.15.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:45:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:45:36 -0700
Message-ID: <20230711224536.1799553-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689115538; x=1691707538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SbFCVFaLAekHfyDDZrWMGRlR5pNxahRzus5YpF/GXgs=;
 b=GHyc42bEPLPshGLAM28FPDiyVzM3Vf7zm/szhhe/ACTCvb3Ud1QdbS+/5VIjwM1v35
 WLuCKOrbthtpZz1C36X/P3njmxQoIzqZt6riLp/VZEA1o3NYMaPjbI0k09dfiP8eVeRH
 MFK8ZOH2BNcul2nSdEWaYVxGdMAMFCj/15MN6BliTcaQP7N9Gq+dvRdMLNF8AsFr54Ms
 cWNLwIr2wnRrKFG1wnMFd8GfROowSwGu6JLI4jdW1zplzE5N+2QvNfl6Nb4c5P7Sx/Vx
 kS1xi6eYzVNhngLjmxhOJEDgrC/5+eYZc13iuMqqed+p7zP6nHbWNaHgNxk1pag2ESSS
 DEbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=GHyc42bE
Subject: [Buildroot] [PATCH v2 1/1] package/docker-cli-buildx: new package
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
index e6ed56a811..9284f024d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2648,6 +2648,7 @@ menu "System tools"
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
index 0000000000..c6a33d468c
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  34172c3d8bafd084668146fee415fd231c2d6aab52e0e223c97a630227d8e2ae  docker-cli-buildx-0.11.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
new file mode 100644
index 0000000000..ff09b752d3
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# docker-cli-buildx
+#
+################################################################################
+
+DOCKER_CLI_BUILDX_VERSION = 0.11.1
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
+		$(TARGET_DIR)/usr/lib/docker/cli-plugins/buildx
+endef
+
+$(eval $(golang-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
