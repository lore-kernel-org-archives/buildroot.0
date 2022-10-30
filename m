Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F69AC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A172240351;
	Sun, 30 Oct 2022 11:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A172240351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Pey0tJMoX1A; Sun, 30 Oct 2022 11:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 500BF40334;
	Sun, 30 Oct 2022 11:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 500BF40334
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE0521BF5DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA77A8124B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA77A8124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HUrC7qh4qtX for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:44:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E24F8100D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E24F8100D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C2D48749F; Sun, 30 Oct 2022 11:44:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 12:44:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1550ef755c90ccaa63b9d4ed805e1f85f73142f
X-Git-Newrev: 2b3f0153bb5accd1f543a43088a8cf792cda95fc
X-Patchwork-Hint: ignore
Message-Id: <20221030114429.1C2D48749F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: headers >= 5.4 needed on
 RISC-V 32-bit
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b3f0153bb5accd1f543a43088a8cf792cda95fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since glibc 2.33 (upstream commit
7a55dd3fb6d2c307a002a16776be84310b9c8989), headers >= 5.4.0 are needed
to build glibc for RISC-V 32-bit. Indeed
sysdeps/unix/sysv/linux/riscv/configure.ac contains:

if test $libc_cv_riscv_int_abi = ilp32; then
  arch_minimum_kernel=5.4.0
fi

In order to take into account this dependency, we add the appropriate
logic in package/glibc/Config.in and
toolchain/toolchain-buildroot/Config.in.

This change means that if headers < 5.4.0 are selected, then no C
library at all will be available for RISC-V 32-bit, as glibc is the
only C library supporting RISC-V 32-bit currently. However, thanks to
the recent addition of BR2_TOOLCHAIN_BUILDROOT_NONE, the
choice...endchoice for the C library selection will not be empty,
allowing the user to see the Config.in comment explaining why glibc
can't be selected.

Therefore, technically this commit does prevent from creating a
configuration with RISC-V 32-bit and headers < 5.4.0, but it will have
BR2_TOOLCHAIN_BUILDROOT_NONE=y, which is catched by
package/Makefile.in, which aborts the build early on pointing out that
the configuration is invalid.

Fixes:

  http://autobuild.buildroot.net/results/5ca49b2732f68eccb5276e7112f7f496dcc514ee/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/Config.in                 | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index b63f99b0b4..71c50504ac 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 26d731d976..64f7892f98 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -62,6 +62,10 @@ comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
 	depends on BR2_RISCV_64
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 
+comment "glibc on RISC-V 32-bit needs a toolchain w/ headers >= 5.4"
+	depends on BR2_RISCV_32
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
 	depends on BR2_arc
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
