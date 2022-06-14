Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB25C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4CAA60C31;
	Tue, 14 Jun 2022 15:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCN4yD6_YEiY; Tue, 14 Jun 2022 15:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA2160B19;
	Tue, 14 Jun 2022 15:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEDA21BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A658301D
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gk6HC1g37Fhr for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D5E83027
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC52486FFB; Tue, 14 Jun 2022 15:32:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:21:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae8177b18a03b5e1e1a22f92ccfab3d3ac31f4e7
X-Git-Newrev: 80a24d0965c543a7e32d338bd42c4ab10b71ae81
X-Patchwork-Hint: ignore
Message-Id: <20220614153200.DC52486FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: add
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
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

commit: https://git.buildroot.net/buildroot/commit/?id=80a24d0965c543a7e32d338bd42c4ab10b71ae81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some external toolchains do not have gdbserver available, but the
option BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is always visible. And
when enabled, this option aborts with an error when gdbserver cannot
be found:

  Could not find gdbserver in external toolchain

Due to that, some random configurations fail to build when
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y, for example with the Bootlin
toolchains for Microblaze or OpenRISC (because there's no GDB support
for those architectures).

One solution could be to make "Could not find gdbserver in external
toolchain" a warning instead of a hard error, but then nobody would
notice about this issue, in cases where it should legitimately abort
with a hard error.

So, the clean solution would be to add a
BR2_TOOLCHAIN_EXTERNAL_HAS_GDBSERVER. But that means all existing
external toolchains would have to be modified to select this option.

Instead, and as an exception, we chose to use inverted logic, and
create an option that is the opposite:
BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER. By default, we assume
external toolchains have gdbserver. If
BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER is enabled, we disallow the
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY option.

Note that the case of custom external toolchain does not matter: by
definition they are not tested by the autobuilders, and by definition,
we cannot know in menuconfig if the custom toolchain has or does not
have gdbserver. We could make a user-visible option for it, but that
adds no value over simply erroring out because the gdbserver binary
can't be found.

Similarly, we could add
default y if BR2_PACKAGE_GDB_ARCH_SUPPORTS
but that would make it impossible for someone to include a custom
gdbserver in their external toolchain, and gives no benefit at all.

This will help fixing:

  http://autobuild.buildroot.net/results/6315ef7b66ee4ae8f870c92186bc674d65f62f2c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2177e6a678..1a67e5645f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -155,9 +155,13 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.option
 # Custom toolchains
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	bool
+
 config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	bool "Copy gdb server to the Target"
 	depends on BR2_TOOLCHAIN_EXTERNAL
+	depends on !BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	help
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
