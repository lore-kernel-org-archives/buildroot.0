Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C63C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C5D83DF0;
	Sun,  5 Dec 2021 11:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2V82pVIaoeq; Sun,  5 Dec 2021 11:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF2683E4E;
	Sun,  5 Dec 2021 11:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACAA01BF973
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C32C60A4E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOMqRtTPndRG for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:57:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB54560A41
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:57:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3884F7F899; Sun,  5 Dec 2021 11:52:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 12:32:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8022e00b2dc822c3403eee28db7181b5899c22dc
X-Git-Newrev: 086c96b4527425e0b4e1adf0531c83ea7f617c02
X-Patchwork-Hint: ignore
Message-Id: <20211205115206.3884F7F899@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pc_x86_64_bios_defconfig: fix
 image generation after grub2 rework
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
Content-Type: multipart/mixed; boundary="===============8865579520914708551=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8865579520914708551==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=086c96b4527425e0b4e1adf0531c83ea7f617c02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 82d1e8c628cc (boot/grub2: use none platform when building for
host) changed host-grub2 to only install the tools, not the actual
bootloader or its modules, as they are of no use on the host.

It so happened that, when not instructed to built for a specific
platform, the grub2 buildsystem would default to build the legacy bios
platform (at least when the build happens on an x86 or x86_64 host).

However, because the host is more often than not an x86 or x86_64, when
the target was also an x68 or x86_64, the modules built for the host
could be re-used for the target, and this is what was done for our
pc_x86_64_bios_defconfig.

But now that we explicitly tell the grub2 buildsystem to not build any
platform when we build host-grub2, we no longer have access to the grub2
modules from the host directory, and the build fails when assembling the
final image.

We fix that in two ways:

First, we ensure that individual modules from the target grub2 get installed
in target/; we can only do that if the target grub2 tools are also
installed, so we enable that in the configuration.

Second, we fix the post-build script to look in target/ rather than in
host/.

All that, just for the 512-byte boot.img bootstrap, which pulls in all
the other modules (4.3MiB), the tools (8.8MiB)... But we are not going
to cherry-pick individual modules; this is error prone and
unmaintainable...

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Köry Maincent <kory.maincent@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/post-build.sh           | 2 +-
 configs/pc_x86_64_bios_defconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index db23795e27..c76dee2676 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -11,5 +11,5 @@ else
     cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
 
     # Copy grub 1st stage to binaries, required for genimage
-    cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
+    cp -f "$TARGET_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
 fi
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 3290a1dda0..df5988d75e 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -13,6 +13,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 
 # Bootloader
 BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_INSTALL_TOOLS=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y

--===============8865579520914708551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8865579520914708551==--
