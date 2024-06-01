Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5E6C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD0F606A9;
	Sat,  1 Jun 2024 15:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ar6uq9eDdiGg; Sat,  1 Jun 2024 15:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C9B608F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C9B608F2;
	Sat,  1 Jun 2024 15:59:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E13E1BF239
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A694241E
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3R3HzD0xLe0n for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED6A4243C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED6A4243C
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:59:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 181F98797C; Sat,  1 Jun 2024 15:59:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 17:08:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 58a291470acf458239202bd81bfc642b9cadd298
X-Git-Newrev: fa2536ec940105acc71630144bd1187c931462ac
X-Patchwork-Hint: ignore
Message-Id: <20240601155936.181F98797C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go: make host package
 a virtual package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa2536ec940105acc71630144bd1187c931462ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Turns host-go into a virtual package, with a single providers:

 - host-go-src, which builds host-go from source based on the same logic
   that was previously used in package/go/go/go.mk, now moved to
   package/go/go-src/go-src.mk to remove any ambiguity on the role of
   the package.

In later commits, we'll add host-go-bin a prebuilt binary host go compiler
as another provider.

A similar solution is proposed for host-rust.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 +-
 package/go/Config.in.host                          | 24 +++++++++++++++++++
 ...d.go-explicit-option-for-crosscompilation.patch |  0
 ...t-buildvcs-false-when-building-go-bootstr.patch |  0
 package/go/{go/go.hash => go-src/go-src.hash}      |  0
 package/go/{go/go.mk => go-src/go-src.mk}          | 27 +++++++++++-----------
 package/go/go.mk                                   |  2 ++
 7 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c25298d54b..25ad6f1d63 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -715,7 +715,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
-package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
+package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index e1833d0905..483393f8e4 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -37,6 +37,30 @@ config BR2_PACKAGE_HOST_GO
 	bool
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 
+if BR2_PACKAGE_HOST_GO
+
+choice
+	prompt "Go compiler variant"
+	default BR2_PACKAGE_HOST_GO_SRC
+	help
+	  Select a Go compiler variant.
+
+	  Default to 'host-go-src'.
+
+config BR2_PACKAGE_HOST_GO_SRC
+	bool "host go (source)"
+	help
+	  This package will build the go compiler for the host.
+
+endchoice
+
+config BR2_PACKAGE_PROVIDES_HOST_GO
+	string
+	# Default to host-go-src
+	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
+
+endif
+
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
similarity index 100%
rename from package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
rename to package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
diff --git a/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
diff --git a/package/go/go/go.hash b/package/go/go-src/go-src.hash
similarity index 100%
rename from package/go/go/go.hash
rename to package/go/go-src/go-src.hash
diff --git a/package/go/go/go.mk b/package/go/go-src/go-src.mk
similarity index 66%
rename from package/go/go/go.mk
rename to package/go/go-src/go-src.mk
index c3c40922f4..1e061e20bc 100644
--- a/package/go/go/go.mk
+++ b/package/go/go-src/go-src.mk
@@ -1,21 +1,22 @@
 ################################################################################
 #
-# go
+# go-src
 #
 ################################################################################
 
-GO_SITE = https://storage.googleapis.com/golang
-GO_SOURCE = go$(GO_VERSION).src.tar.gz
+GO_SRC_SITE = https://storage.googleapis.com/golang
+GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
 
-GO_LICENSE = BSD-3-Clause
-GO_LICENSE_FILES = LICENSE
-GO_CPE_ID_VENDOR = golang
+GO_SRC_LICENSE = BSD-3-Clause
+GO_SRC_LICENSE_FILES = LICENSE
+GO_SRC_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
+HOST_GO_SRC_PROVIDES = host-go
+HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
-HOST_GO_CROSS_ENV = \
+HOST_GO_SRC_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
 	GOOS="linux" \
@@ -28,7 +29,7 @@ endif
 
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
-HOST_GO_MAKE_ENV = \
+HOST_GO_SRC_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
@@ -39,14 +40,14 @@ HOST_GO_MAKE_ENV = \
 	CC=$(HOSTCC_NOCCACHE) \
 	CXX=$(HOSTCXX_NOCCACHE) \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
-	$(HOST_GO_CROSS_ENV)
+	$(HOST_GO_SRC_CROSS_ENV)
 
-define HOST_GO_BUILD_CMDS
+define HOST_GO_SRC_BUILD_CMDS
 	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+		$(HOST_GO_SRC_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
 endef
 
-define HOST_GO_INSTALL_CMDS
+define HOST_GO_SRC_INSTALL_CMDS
 	$(GO_BINARIES_INSTALL)
 endef
 
diff --git a/package/go/go.mk b/package/go/go.mk
index 5aa61c6199..dfcb633aa7 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -129,4 +129,6 @@ define GO_BINARIES_INSTALL
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
+$(eval $(host-virtual-package))
+
 include $(sort $(wildcard package/go/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
