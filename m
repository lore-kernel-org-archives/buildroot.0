Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD53BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 08:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72CF3408DC;
	Tue, 24 May 2022 08:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5IWCviOPvdE; Tue, 24 May 2022 08:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74FBC40571;
	Tue, 24 May 2022 08:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1D4E1BF983
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 910A281987
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8t41x2zzl1-4 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 08:21:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D538081951
 for <buildroot@buildroot.org>; Tue, 24 May 2022 08:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D823786412; Tue, 24 May 2022 08:10:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 10:14:17 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 222a90a363ba4633bd9fe8f1a981ec4d2694aaba
X-Git-Newrev: eb8dc111025720479e523e55a7a6b0e33c7836cb
X-Patchwork-Hint: ignore
Message-Id: <20220524081008.D823786412@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-tools:
 cpupower needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb8dc111025720479e523e55a7a6b0e33c7836cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpupower needs dynamic library since its addition in commit
f1863ede94c29e120d7ce900f7cce211f1e8633a to avoid the following build
failure:

ld (ld-elf2flt): -shared used without passing a shared library ID

Fixes:
 - http://autobuild.buildroot.org/results/16f41b9169bd76352c2f2ed8c6239ad371b3a30e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c173eb47bfc908be3d3fd204a49c71ce3290f5d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index f459b41762..791f2c085c 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -7,12 +7,16 @@ config BR2_PACKAGE_LINUX_TOOLS
 
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_PCIUTILS
 	help
 	  cpupower is a collection of tools to examine and tune power
 	  saving related features of your processor.
 
+comment "cpupower needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LINUX_TOOLS_GPIO
 	bool "gpio"
 	select BR2_PACKAGE_LINUX_TOOLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
