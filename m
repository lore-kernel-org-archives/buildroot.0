Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1043BECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DA4417FC;
	Tue, 30 Aug 2022 21:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DA4417FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEd0yjATexbr; Tue, 30 Aug 2022 21:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5BE417EF;
	Tue, 30 Aug 2022 21:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5BE417EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA191BF388
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67186813BE
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67186813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqdtJCwDkFqv for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 21:19:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4DA580A77
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 21:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DA580A77
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 99DB7881AE; Tue, 30 Aug 2022 21:04:29 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 22:58:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7537419257a1ea1b3bd82a2f72e900d68cbb3645
X-Git-Newrev: d16db6d8a405c8410f4e892a3993686a3269bdc2
X-Patchwork-Hint: ignore
Message-Id: <20220830210429.99DB7881AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: prevent gdbserver being
 selected for or1k builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=d16db6d8a405c8410f4e892a3993686a3269bdc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is currently no version of gdbserver for or1k. Until this
is implemented we will prevent both the direct and indirect
selection of gdbserver for or1k builds. In practice this means
that 'cross gdb for the host' cannot be selected and that
'full debugger' must be automatically selected for the gdb target
package.

This partially reverts commit 991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
which claimed that gdbserver for or1k was already supported before
version 8.3. That is not true - the commit that adds gdbserver support
for or1k [1] was only merged for version 12.1, which hasn't been
integrated in Buildroot yet.

Without that support, the build of gdbserver fails with

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-musl/11.2.0/../../../../or1k-buildroot-linux-musl/bin/ld: server.o: in function `main':
server.cc:(.text.startup+0x6dc): undefined reference to `initialize_low()'
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-musl/11.2.0/../../../../or1k-buildroot-linux-musl/bin/ld: remote-utils.o: in function `prepare_resume_reply(char*, ptid_t, target_waitstatus*)':
remote-utils.cc:(.text+0x28a8): undefined reference to `using_threads'
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-musl/11.2.0/../../../../or1k-buildroot-linux-musl/bin/ld: remote-utils.cc:(.text+0x28b0): undefined reference to `using_threads'

Fixes: http://autobuild.buildroot.net/results/b3c/b3c0df53d09d9facaf0c3c2bc4529f9fcf7737ee

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gdb/Config.in      | 3 +++
 package/gdb/Config.in.host | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 71fa6f6064..8fd5eb9fbc 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,6 +17,8 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	# no gdbserver on or1k
+	select BR2_PACKAGE_GDB_DEBUGGER if BR2_or1k
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -43,6 +45,7 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	depends on !BR2_or1k
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a294103ca3..15d5f52a36 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
+	depends on !BR2_or1k
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
