Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE8FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 08:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1558B81421;
	Sat, 13 Jul 2024 08:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtmAwXByPiht; Sat, 13 Jul 2024 08:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1367781461
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1367781461;
	Sat, 13 Jul 2024 08:20:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5E71BF405
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67E43606C0
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k65gPMbIG8b1 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 08:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70275606BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70275606BD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 08:20:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 600DA8468B; Sat, 13 Jul 2024 08:20:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 09:56:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fad6b3c58abd20c533b67b85658bc66d015110b
X-Git-Newrev: 079f5ccdca2e65e21d64a50b7badaa57c04d91dc
X-Patchwork-Hint: ignore
Message-Id: <20240713082006.600DA8468B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: disable cgo support with
 static libs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5453845436404580073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5453845436404580073==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=079f5ccdca2e65e21d64a50b7badaa57c04d91dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The go stdlib "plugin" package relies on dlfcn.h which isn't available
when we have BR2_STATIC_LIBS=y.

Concentrate all cgo decision (including the existing threads part)
under the config option BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
that has the proper depends.

This should fix this build error from autobuilders:

/buildroot/build/host-go-1.19.3/src/plugin/plugin_dlopen.go:11:10: fatal error: dlfcn.h: No such file or directory
   11 | #include <dlfcn.h>

Fixes:
  http://autobuild.buildroot.net/results/1f4/1f4b9882986b9df723a1446493d270c29287b505
  http://autobuild.buildroot.net/results/a9d/a9de62374c948f773634c694a47abcaa2bc266d0

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Christian Stewart <christian@paral.in>
[Arnout: revert parts to v2, keeping most of the overall logic as it
was]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/go/Config.in.host |  4 ++++
 package/go/go.mk          | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 92c1f4cdc3..11ce6df369 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -25,6 +25,10 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	# Go doesn't support CGO linking on MIPS64x platforms
 	# See: https://github.com/karalabe/xgo/issues/46
 	depends on !BR2_mips64 && !BR2_mips64el
+	# go uses dlfcn.h + cgo for its plugin module
+	depends on !BR2_STATIC_LIBS
+	# cgo supports uses threads
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 
 # Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
diff --git a/package/go/go.mk b/package/go/go.mk
index bfbe997911..660c7a9bad 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -78,23 +78,24 @@ HOST_GO_TARGET_ENV = \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
-# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
-# set, build in cgo support for any go programs that may need it.  Note that
-# any target package needing cgo support must include
-# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# Allow packages to use cgo support if it is available for the target. They
+# will need the toolchain for cgo support; for convenence, include that
+# dependency here.
+#
+# Note that any target package needing cgo support must include 'depends on
+# BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS' in its config file.
+ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS),y)
 HOST_GO_DEPENDENCIES_CGO += toolchain
 HOST_GO_CGO_ENABLED = 1
 else
 HOST_GO_CGO_ENABLED = 0
 endif
-
 else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-# host-go can still be used to build packages for the host. No need to set all
-# the arch stuff since we will not be cross-compiling.
+# If the target arch does not support go, host-go can still be used to build
+# packages for the host, and enable cgo. No need to set all the arch stuff
+#since we will not be cross-compiling.
 HOST_GO_CGO_ENABLED = 1
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-
 # Ensure the toolchain is available, whatever the provider
 HOST_GO_DEPENDENCIES += $(HOST_GO_DEPENDENCIES_CGO)
 

--===============5453845436404580073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5453845436404580073==--
