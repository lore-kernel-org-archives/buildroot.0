Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB343C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72EBC40575;
	Tue,  4 Jan 2022 17:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aw6sRQuB6ROt; Tue,  4 Jan 2022 17:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 862FC40166;
	Tue,  4 Jan 2022 17:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 101D01BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B4A281412
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Io8WbbLUd9sq for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCDFB8267C
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 45E9382E00; Tue,  4 Jan 2022 17:11:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:08:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25cec5ea733251eb27745adb489f268e7e4d5a76
X-Git-Newrev: 4c92ef3dd8f6b83c33d8e4fad2e2ac2d2a2d6a39
X-Patchwork-Hint: ignore
Message-Id: <20220104171106.45E9382E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: fix
 bootlin-riscv64 configs
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c92ef3dd8f6b83c33d8e4fad2e2ac2d2a2d6a39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
bootlin toolchains by RISC-V LP64D. The config symbols
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE were marked as legacy.
Those changes were not reflected in the autobuild toolchain configs in
support/config-fragments/autobuild/bootlin-riscv64-{glibc,musl}.config

When testing a package with the command:

    ./utils/test-pkg --all --package somepackage

bootlin-riscv64-{glibc,musl} toolchain are always skipped. The build
logfile contains:

    [...]
    Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN not in final .config
    Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    Actual value:

    Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE not in final .config
    Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
    Actual value:     # BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE is not set

This commit update the autobuild config fragments for RISC-V 64bit
toolchains so they can be used by test-pkg.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/config-fragments/autobuild/bootlin-riscv64-glibc.config | 4 ++--
 support/config-fragments/autobuild/bootlin-riscv64-musl.config  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
index f6c6fcaa36..433a6e89f7 100644
--- a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
+++ b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_RISCV_ABI_LP64=y
+BR2_RISCV_ABI_LP64D=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/bootlin-riscv64-musl.config b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
index 2b6a6e56da..fee1f29f4a 100644
--- a/support/config-fragments/autobuild/bootlin-riscv64-musl.config
+++ b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
@@ -1,4 +1,4 @@
 BR2_riscv=y
-BR2_RISCV_ABI_LP64=y
+BR2_RISCV_ABI_LP64D=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
