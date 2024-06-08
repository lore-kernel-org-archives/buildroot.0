Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAFBC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14278824E3;
	Sat,  8 Jun 2024 13:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PePidBhQqgN; Sat,  8 Jun 2024 13:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E753184456
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E753184456;
	Sat,  8 Jun 2024 13:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2081BF47E
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759AE606A9
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3737o21mARDU for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B711606B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B711606B0
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86ADB87DCF; Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 13:53:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ab0d9104e924847eacb1759a304d545b48ae1bda
X-Git-Newrev: 9da3d9a04f8c92d440b873219acc6300d9fe70c5
X-Patchwork-Hint: ignore
Message-Id: <20240608130122.86ADB87DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/musl: enable on
 s390x
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
Content-Type: multipart/mixed; boundary="===============1529180514908643308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1529180514908643308==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9da3d9a04f8c92d440b873219acc6300d9fe70c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add s390x musl supported archs. Upstream musl already supports s390x[1].

Tested with qemu_s390s_defconfig:

	$ output/host/bin/qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 -kernel output/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio -net nic,model=virtio -net user
	(...)
	Welcome to Buildroot
	buildroot login: root
	# uname -a
	Linux buildroot 6.1.44 #2 SMP Sun Feb 18 01:33:42 CET 2024 s390x GNU/Linux
	# /lib/ld-musl-s390x.so.1
	musl libc (s390x)
	Version 1.2.4
	Dynamic Program Loader
	Usage: /lib/ld-musl-s390x.so.1 [options] [--] pathname [args]

[1]: https://git.musl-libc.org/cgit/musl/commit/?id=15094943050eb9a564f409323070e50b40f78816

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab990cf58a724a178dbdd55afdb520212f7197c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 89f41d2ff1..44654eff34 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_RISCV_64
+	default y if BR2_s390x
 	default y if BR2_sh
 	default y if BR2_x86_64
 	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks

--===============1529180514908643308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1529180514908643308==--
