Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C65DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F2280851;
	Mon, 19 Aug 2024 20:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHUlPr26zKEJ; Mon, 19 Aug 2024 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66B580B3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66B580B3B;
	Mon, 19 Aug 2024 20:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1C21BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0742A404EE
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gFrxt-Cyxmq for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E13E6404F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E13E6404F7
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDBB9860F3; Mon, 19 Aug 2024 20:40:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:40:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f565397d83e7940b093fe09f749570225d7a283
X-Git-Newrev: aa50907d83947091117e869fbf98bca1747637bd
X-Patchwork-Hint: ignore
Message-Id: <20240819204050.CDBB9860F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: account for arch
 dependency of vmspawn support
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa50907d83947091117e869fbf98bca1747637bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
5c57a8650630304d8434a348283b6b643fbc676b ("vmspawn: add support for
-D/--directory"), src/vmspawn/vmspawn-util.h defines a
QEMU_MACHINE_TYPE based on the architecture, and not all architectures
are supported. This commit first appeared in systemd v256.

Due to this, the unsupported architectures fail with:

In file included from ../src/vmspawn/vmspawn-util.c:27:
../src/vmspawn/vmspawn-util.h:46:4: error: #error "No qemu machine defined for this architecture"
   46 | #  error "No qemu machine defined for this architecture"
      |    ^~~~~

So let's add a BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS and use it to
ensure vmspawn support is only used on architectures that are
supported. Even though no-one selects BR2_PACKAGE_SYSTEMD_VMSPAWN (and
would therefore need to inherit the
BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS dependency), we nevertheless
introduce BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS to make the
depency list prettier than a long "depends on A || B || C || D ||
...".

Fixes:

  http://autobuild.buildroot.net/results/0e614375f731f7bfe3c6041c6e89a09c31898053/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6708adce9b..113a8093c4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -599,8 +599,22 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
 	  Default keymap for the system. Leave empty to not set a
 	  default keymap.
 
+# See for which architectures QEMU_MACHINE_TYPE is defined in
+# src/vmspawn/vmspawn-util.h
+config BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_SYSTEMD_VMSPAWN
 	bool "enable vmspawn"
+	depends on BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS
 	help
 	  systemd-vmspawn may be used to start a virtual machine
 	  from an OS image. In many ways it is similar to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
