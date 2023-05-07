Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224B0C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC66040CBD;
	Sun,  7 May 2023 13:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC66040CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-FvKCUI4pIK; Sun,  7 May 2023 13:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E55E5404F4;
	Sun,  7 May 2023 13:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55E5404F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7C21BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533608209B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 533608209B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0jb6OEAMCQS for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E1DB8206C
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1DB8206C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BB5985F93; Sun,  7 May 2023 13:14:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 15:12:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a57c02a4ea48bdb3ffc8cdba2569d240275b1bc3
X-Git-Newrev: 3fed683035658ee354885f46f1ac1096c2d94e4b
X-Patchwork-Hint: ignore
Message-Id: <20230507131430.1BB5985F93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: disable gdb for or1k builds
 with musl libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fed683035658ee354885f46f1ac1096c2d94e4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The or1k musl port is incomplete, elf_gregset_t definition is missing
(user.h is empty) [1]. It fail to build gdbserver and the full gdb.

[1] https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276569

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
[yann.morin.1998@free.fr: simplify condition, add comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 80b1185b5e..d1813fd7b9 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
 
+comment "gdb needs a glibc or uclibc toolchain"
+	depends on BR2_or1k
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -17,6 +21,9 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
+	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
+	depends on !BR2_or1k || !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
