Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFCAC43217
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCA1D4055D;
	Sun, 13 Nov 2022 14:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCA1D4055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj3qduBVXJ4x; Sun, 13 Nov 2022 14:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC86740585;
	Sun, 13 Nov 2022 14:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC86740585
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9BC41BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D20C4057F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D20C4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uahU9nBdJTEV for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:33:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 452A84020B
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 452A84020B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33A3483618; Sun, 13 Nov 2022 14:33:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:15:58 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: ec043f103ab41cb647d5ab76872b696c6250f3b2
X-Git-Newrev: 54eeba1f78ed891ddc13044ce97503fe33e57c52
X-Patchwork-Hint: ignore
Message-Id: <20221113143351.33A3483618@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/glibc: headers >=
 5.4 needed on RISC-V 32-bit
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

commit: https://git.buildroot.net/buildroot/commit/?id=54eeba1f78ed891ddc13044ce97503fe33e57c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 2b3f0153bb5accd1f543a43088a8cf792cda95fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in                 | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index ba9f691d80..8bd529d25d 100644
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
index daadeac09c..bf874f1ea7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -63,6 +63,10 @@ comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
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
