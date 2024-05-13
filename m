Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA8BC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E37E4076A;
	Mon, 13 May 2024 21:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aNd-kNaSWdP; Mon, 13 May 2024 21:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F199F408B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F199F408B5;
	Mon, 13 May 2024 21:27:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0797C1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8A7F404B4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwb_GefORsQI for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 246904012A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 246904012A
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:26:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F0087316; Mon, 13 May 2024 21:26:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 23:26:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c79f4be597d78428126bfdb02eb47c3126f3ebe
X-Git-Newrev: ab990cf58a724a178dbdd55afdb520212f7197c0
X-Patchwork-Hint: ignore
Message-Id: <20240513212659.C5F0087316@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: enable on s390x
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
Content-Type: multipart/mixed; boundary="===============3257667157914177216=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3257667157914177216==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab990cf58a724a178dbdd55afdb520212f7197c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 7fba85bcd9..a6e2af054c 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
 	default y if BR2_sh
 	default y if BR2_x86_64
 	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks

--===============3257667157914177216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3257667157914177216==--
