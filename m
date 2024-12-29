Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2031AE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E354E40164;
	Sun, 29 Dec 2024 12:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqRyNg3YYdDO; Sun, 29 Dec 2024 12:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A07D40192
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A07D40192;
	Sun, 29 Dec 2024 12:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B96E72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D11080492
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5px66cx1v1Jg for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A91468048C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A91468048C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A9A87687; Sun, 29 Dec 2024 12:38:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 13:23:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca46491736b4b3ae9549acbdef6383d145932963
X-Git-Newrev: 8d94747b33471ff0cc3e4db2459f23b9b34ca0cc
X-Patchwork-Hint: ignore
Message-Id: <20241229123857.92A9A87687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: bump version to 1.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d94747b33471ff0cc3e4db2459f23b9b34ca0cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes at:
https://github.com/riscv-software-src/opensbi/releases/tag/v1.6

From release notes:
"Overall, this release adds more ISA extensions, drivers, and other
improvements."

This OpenSBI version 1.6 can be tested in qemu with the commands:

    cat <<EOF >.config
    BR2_riscv=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_OPENSBI=y
    BR2_TARGET_OPENSBI_PLAT="generic"
    BR2_TOOLCHAIN_EXTERNAL=y
    EOF
    make olddefconfig
    make

Then:

    qemu-system-riscv64 \
        -M virt \
        -bios output/images/fw_jump.bin \
        -kernel output/images/Image \
        -append "rootwait root=/dev/vda ro" \
        -drive file=output/images/rootfs.ext2,format=raw \
        -nographic

Note that in the previous qemu command line, the OpenSBI ".bin"
image is passed rather than the ".elf" image.

Loading the ".elf" image in qemu can now lead to the following
qemu error:

    qemu-system-riscv64: Some ROM regions are overlapping
    These ROM regions might have been loaded by direct user request or by default.
    They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
    Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.

    The following two regions overlap (in the memory address space):
      fw_jump.elf ELF program header segment 1 (addresses 0x0000000000000000 - 0x00000000000271e0)
      mrom.reset (addresses 0x0000000000001000 - 0x0000000000001028)

See: https://github.com/riscv-software-src/opensbi/issues/372

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: reworded the commit log about testing]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/opensbi/Config.in    | 4 ++--
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 7604be29d9..98d6103ed6 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.5"
+	bool "1.6"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.5" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.6" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index c69bcf7150..84ad67b2e3 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9880485672a3a2c48a81d373df6707517b568402f2d3f9eecbfa9d83f8e6f22f  opensbi-1.5.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
