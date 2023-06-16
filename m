Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99356EB64D8
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 08:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4334D60FCF;
	Fri, 16 Jun 2023 08:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4334D60FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jy6PY-YEn7B8; Fri, 16 Jun 2023 08:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78FCF60F9A;
	Fri, 16 Jun 2023 08:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78FCF60F9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B88C91BF5E6
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92B3740181
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B3740181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuM_CqP7cj7D for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C779840A14
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C779840A14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B63CD83A1D; Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 10:37:52 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9da144a812f8744e99fffc7f9771fb39b416b090
X-Git-Newrev: 0d8a19a2ae475ac23ec5f66b217c5349351e49ac
X-Patchwork-Hint: ignore
Message-Id: <20230616084116.B63CD83A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qemu: qemu
 systems emulation needs fdt when building for all targets
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d8a19a2ae475ac23ec5f66b217c5349351e49ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

defconfig fragment to reproduce the issue:
BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
BR2_PACKAGE_QEMU=y
BR2_PACKAGE_QEMU_SYSTEM=y

ERROR: Problem encountered: fdt not available but required by targets
       aarch64-softmmu, arm-softmmu, i386-softmmu, loongarch64-softmmu,
       microblaze-softmmu, microblazeel-softmmu, mips64el-softmmu,
       nios2-softmmu, or1k-softmmu, ppc-softmmu, ppc64-softmmu,
       riscv32-softmmu, riscv64-softmmu, rx-softmmu, x86_64-softmmu

Commit [1] select BR2_PACKAGE_QEMU_FDT for each individual emulator targets
but forgot to select is when BR2_PACKAGE_QEMU_CHOOSE_TARGETS is not set
(building for all targets).

Fixes:
http://autobuild.buildroot.org/results/e44/e444a02b899d325a9d99daed96b8cb96108383e7

[1] 44be514b21fd94096702b80c62d46c31d72f15a5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Carlos Santos <unixmania@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 59df3875b5e965872007ac22245aa6e048576644)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 31cbf09644..de6475e719 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable systems emulation"
 	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_QEMU_FDT if !BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 	help
 	  Say 'y' to build system emulators/virtualisers.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
