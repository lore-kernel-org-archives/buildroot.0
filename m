Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFF7C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB8E821DA;
	Mon,  5 Jun 2023 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB8E821DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hrnt9KN4WLQC; Mon,  5 Jun 2023 20:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0437821A4;
	Mon,  5 Jun 2023 20:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0437821A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161141BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F165440514
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F165440514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6efZba95v9c8 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29B5E4014B
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29B5E4014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1746686C8F; Mon,  5 Jun 2023 20:12:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:11:10 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2cf01c59ed6a2e8500017936f3d6ecdb7940c399
X-Git-Newrev: 7ad09fbb876ed3b800a7020ac4887c4a5f117f13
X-Patchwork-Hint: ignore
Message-Id: <20230605201238.1746686C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gdb: disable gdb
 for or1k builds with musl libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ad09fbb876ed3b800a7020ac4887c4a5f117f13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The or1k musl port is incomplete, elf_gregset_t definition is missing
(user.h is empty) [1]. It fail to build gdbserver and the full gdb.

[1] https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276569

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
[yann.morin.1998@free.fr: simplify condition, add comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3fed683035658ee354885f46f1ac1096c2d94e4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
