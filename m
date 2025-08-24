Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A902CCA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B5D541B13;
	Sun, 24 Aug 2025 09:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dq0PP1maBkO9; Sun, 24 Aug 2025 09:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D90041B0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D90041B0E;
	Sun, 24 Aug 2025 09:50:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AFF91D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9810F41B01
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JR9xo0gfQxg for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD56D41ABA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD56D41ABA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBCCD87918; Sun, 24 Aug 2025 09:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 11:41:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad75a5d4788cd6018e4f128680ef99b52ba20cd7
X-Git-Newrev: d402ffe2763cd9db3a01a15c7d6a89c3433af7c9
X-Patchwork-Hint: ignore
Message-Id: <20250824095051.CBCCD87918@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: do not allow old
 kernel headers on Loongarch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d402ffe2763cd9db3a01a15c7d6a89c3433af7c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Loongarch support was added to the upstream Linux kernel in version
5.19, so when versions 5.4, 5.10 or 5.15 are selected, the "build" of
the kernel headers fails:

Makefile:717: arch/loongarch/Makefile: No such file or directory
make[1]: *** No rule to make target 'arch/loongarch/Makefile'.  Stop.

Fixes:

  https://autobuild.buildroot.net/results/b27fc299d14b7bc59dab5dae6deb9cc8bd400a3d/ (5.15)
  https://autobuild.buildroot.net/results/1621e9de1170acc5229f99568b35155b6c668b05/ (5.10)
  https://autobuild.buildroot.net/results/2a28e37ee8500d165137c14945000770346e9541/ (5.4)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/linux-headers/Config.in.host | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b49eeb1e94..66a9670de5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -26,14 +26,20 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
 config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
 config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
 config BR2_KERNEL_HEADERS_6_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
