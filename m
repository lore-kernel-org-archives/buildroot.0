Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F2CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 12:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060C141838;
	Sun, 24 Aug 2025 12:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRGSClOc8Lhq; Sun, 24 Aug 2025 12:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1611B41968
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1611B41968;
	Sun, 24 Aug 2025 12:11:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A91419C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 12:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 513BD61759
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 12:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kt7ptjvOjDvy for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 12:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84EB261621
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84EB261621
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 12:11:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D4786ECF; Sun, 24 Aug 2025 12:11:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 14:10:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f20d9a9b8a7520ec747c785de9f522f5f81374d
X-Git-Newrev: b1b3aab60d549ad066b5b09c51c9226444561439
X-Patchwork-Hint: ignore
Message-Id: <20250824121121.72D4786ECF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: tweak wayland-scanner.pc
 after installation to fix SDL2 build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1b3aab60d549ad066b5b09c51c9226444561439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages such as SDL2 do this:

WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`

to find the path to the wayland-scanner tool.

Of course, since SDL2 is compiled for the target, it does that using
the pkg-config configured for cross-compilation, which looks at
$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc.

Since it looks at the variable wayland_scanner, which doesn't get
prefixed by PKG_CONFIG_SYSROOT_DIR, the SDL2 configure script is told
that wayland-scanner is in /usr/bin/wayland-scanner causing this kind
of build failure:

/bin/bash: line 1: /usr/bin/wayland-scanner: No such file or directory
/bin/bash: line 1: /usr/bin/wayland-scanner: No such file or directory

when building SDL2.

The target wayland package depends on host-wayland, which most notably
is responsible for installing wayland-scanner in $(HOST_DIR)/bin.

So in order to fix the SDL2 build issue but in a global way (possibly
helping other packages), what this patch does is tweak the
wayland-scanner.pc installed by the target wayland so that its
wayland_scanner variable points to the host wayland-scanner
executable. We find this a better solution than passing a
WAYLAND_SCANNER variable to each and every package that needs
wayland-scanner.

The issue is not visible in the autobuilders, but can be reproduced
using the following defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SDL2=y
 BR2_PACKAGE_SDL2_WAYLAND=y
 BR2_PACKAGE_SDL2_OPENGLES=y
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_WAYLAND=y
 # BR2_TARGET_ROOTFS_TAR is not set

Note: Make sure that wayland-scanner is not be installed on the build
host to reproduce the issue.

The issue probably exists since WAYLAND_SCANNER was retrieved using
pkg-config in SDL2's configure.ac script, in upstream commit
19d3500ae19636f3f410e270f12e0bc5e83410d4, which got first introduced
in release-2.0.5 of SDL2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Romain: add a comment about wayland-scanner to reproduce the issue]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/wayland/wayland.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index bb5ceabb9c..23903bafcb 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -23,5 +23,17 @@ define WAYLAND_TARGET_CLEANUP
 endef
 WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TARGET_CLEANUP
 
+# The wayland-scanner.pc installed by the target wayland package is
+# used to find the wayland-scanner tool, which in a cross-compilation
+# context is compiled for the host (and in Buildroot, compiled by
+# host-wayland). Below, we tweak the target wayland-scanner.pc so that
+# when the wayland_scanner variable is requested through pkg-config,
+# it points to the host wayland_scanner tool.
+define WAYLAND_TWEAK_WAYLAND_SCANNER_PATH
+	$(SED) 's%^wayland_scanner=.*%wayland_scanner=$(HOST_DIR)/bin/wayland-scanner%' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
+endef
+WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TWEAK_WAYLAND_SCANNER_PATH
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
