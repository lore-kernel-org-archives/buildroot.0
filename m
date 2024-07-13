Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A5DC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 06:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3061041A08;
	Sat, 13 Jul 2024 06:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9zC5S-AMX7f; Sat, 13 Jul 2024 06:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A20E7419E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A20E7419E1;
	Sat, 13 Jul 2024 06:31:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3AA61BF5A2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1DE84611
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6fl2fIWGAiF for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 06:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBADA81F82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBADA81F82
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:31:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB19F86271; Sat, 13 Jul 2024 06:31:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 08:31:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d889031e0b70390ea34703071f96a5b750803d30
X-Git-Newrev: 22579ce771bde65dffa8cef22c3e8bb4973ef9ab
X-Patchwork-Hint: ignore
Message-Id: <20240713063141.CB19F86271@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli-buildx: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22579ce771bde65dffa8cef22c3e8bb4973ef9ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

buildx is a docker CLI plugin implementing extended build features.

buildx is the default builder as of Docker v23.x, and if the plugin is not
present, the CLI will output an error warning that it is using the deprecated
built-in builder instead of the buildx builder.

However, buildx is a separate repository from docker-cli: it is a plugin that
needs to be installed at /usr/lib/docker/cli-plugins on the target.

https://github.com/docker/buildx

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/docker-cli-buildx/Config.in              | 16 +++++++++++
 package/docker-cli-buildx/docker-cli-buildx.hash |  3 ++
 package/docker-cli-buildx/docker-cli-buildx.mk   | 36 ++++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a52ed146d9..65d7981773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2757,6 +2757,7 @@ menu "System tools"
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
index 0000000000..a6e0b0deab
--- /dev/null
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  371eb742213ed580179fc4fdfd9a197f0e3115e91979b7907828427d578d49e5  docker-cli-buildx-0.11.2-go2.tar.gz
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
