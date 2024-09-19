Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED0BCF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 043BE4151B;
	Thu, 19 Sep 2024 19:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVqCKcx3Cd9B; Thu, 19 Sep 2024 19:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BCC41869
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21BCC41869;
	Thu, 19 Sep 2024 19:59:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 130171BF292
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2412884C0B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCdLBi__TRQK for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638B284BF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638B284BF7
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FF9083CF4; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 14:01:42 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 78c72422b582bccdac7b3675d4f349e4ecde23de
X-Git-Newrev: 1d2df1c2ae77eeeec172aea71d3729852c8af741
X-Patchwork-Hint: ignore
Message-Id: <20240919195838.5FF9083CF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/go-bootstrap-stage3: add stage3 for go1.22 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d2df1c2ae77eeeec172aea71d3729852c8af741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add a third bootstrap stage with Go1.21.x necessary for go1.22 bootstrap.

go-bootstrap-stage1 is Go1.4.x, the final version to support bootstrap using a C
compiler (later versions require the Go compiler for bootstrapping).

See: https://go.dev/doc/install/source#bootstrapFromSource

go-bootstrap-stage2 is Go 1.19.13, the last version to support bootstrap using
the Go1.4.x compiler.

go-bootstrap-stage3 is Go 1.21.8, the last version to support bootstrap using
the Go1.19.13 compiler. Go 1.20 requires a minimum of go 1.17.13 to bootstrap.

See: https://go.dev/doc/go1.20#bootstrap

This patch is in preparation for bumping the host-go package to >go1.22.x, which
requires a minimum of Go1.20.x for bootstrap.

See: https://go.dev/doc/go1.22#bootstrap

Signed-off-by: Christian Stewart <christian@aperture.us>
[Arnout: add GOCACHE definition]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f00eb37de9b4b0ddbdeb5c7ebae48c883c27e132)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in.host                             |  1 +
 package/go-bootstrap-stage3/Config.in.host         |  4 ++
 .../go-bootstrap-stage3/go-bootstrap-stage3.hash   |  3 ++
 package/go-bootstrap-stage3/go-bootstrap-stage3.mk | 54 ++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 99085dc93f..d106f532e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -593,6 +593,7 @@ F:	package/fuse-overlayfs/
 F:	package/go/
 F:	package/go-bootstrap-stage1/
 F:	package/go-bootstrap-stage2/
+F:	package/go-bootstrap-stage3/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index f03ca16b7b..9543a22ffc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -46,6 +46,7 @@ menu "Host utilities"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap-stage1/Config.in.host"
 	source "package/go-bootstrap-stage2/Config.in.host"
+	source "package/go-bootstrap-stage3/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go-bootstrap-stage3/Config.in.host b/package/go-bootstrap-stage3/Config.in.host
new file mode 100644
index 0000000000..1714c2fb15
--- /dev/null
+++ b/package/go-bootstrap-stage3/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.hash b/package/go-bootstrap-stage3/go-bootstrap-stage3.hash
new file mode 100644
index 0000000000..b1aed10c7c
--- /dev/null
+++ b/package/go-bootstrap-stage3/go-bootstrap-stage3.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  dc806cf75a87e1414b5b4c3dcb9dd3e9cc98f4cfccec42b7af617d5a658a3c43  go1.21.8.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go-bootstrap-stage3/go-bootstrap-stage3.mk
new file mode 100644
index 0000000000..bdc8459595
--- /dev/null
+++ b/package/go-bootstrap-stage3/go-bootstrap-stage3.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# go-bootstrap-stage3
+#
+################################################################################
+
+# Use last Go version that go-bootstrap-stage2 can build: v1.21.x
+# See https://go.dev/doc/go1.22#bootstrap
+GO_BOOTSTRAP_STAGE3_VERSION = 1.21.8
+GO_BOOTSTRAP_STAGE3_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE3_SOURCE = go$(GO_BOOTSTRAP_STAGE3_VERSION).src.tar.gz
+
+GO_BOOTSTRAP_STAGE3_LICENSE = BSD-3-Clause
+GO_BOOTSTRAP_STAGE3_LICENSE_FILES = LICENSE
+
+# Use go-bootstrap-stage2 to bootstrap.
+HOST_GO_BOOTSTRAP_STAGE3_DEPENDENCIES = host-go-bootstrap-stage2
+
+HOST_GO_BOOTSTRAP_STAGE3_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE3_VERSION)
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_BOOTSTRAP_STAGE3_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=0
+
+define HOST_GO_BOOTSTRAP_STAGE3_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_BOOTSTRAP_STAGE3_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_BOOTSTRAP_STAGE3_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/
+
+	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg/
+
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
