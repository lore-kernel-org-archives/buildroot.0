Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00586C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B234B83F9B;
	Sat, 14 May 2022 09:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSmFmSRRieCO; Sat, 14 May 2022 09:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76CD83FB8;
	Sat, 14 May 2022 09:50:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F19551BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0E6883FBF
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbLpVrAzvmfi for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DD0A83FA9
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DE6E68376E; Sat, 14 May 2022 09:39:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbd326cac3c7368b5a52ab0275cdaf78f0608873
X-Git-Newrev: 4c72c4eb392bdbc8e7fb693ef065a81125dd04d7
X-Patchwork-Hint: ignore
Message-Id: <20220514093943.DE6E68376E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpulimit: Disable build on
 OpenRISC with musl-libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c72c4eb392bdbc8e7fb693ef065a81125dd04d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in the following autobuild report:

http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/

cpulimit does not build due to a lack of definition for elf_gregset_t
which is not currently provided in the or1k musl-libc port. While this
is being worked on, disable the build for or1k and musl-libc.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Fixes: 9e8e80d1e335 ("package: Add cpulimit")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cpulimit/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
index 7cab152fc0..cca74afc99 100644
--- a/package/cpulimit/Config.in
+++ b/package/cpulimit/Config.in
@@ -1,7 +1,12 @@
+comment "cpulimit needs a toolchain w/ threads, does not build open openrisc with musl"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || (BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
+
 config BR2_PACKAGE_CPULIMIT
 	bool "cpulimit"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
 	help
 	  Cpulimit is a tool which limits the CPU usage of a process
 	  (expressed in percentage, not in CPU time)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
