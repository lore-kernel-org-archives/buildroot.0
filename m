Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D137E6FE48
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C79844E1;
	Fri,  6 Sep 2024 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpuhAbcRpuVF; Fri,  6 Sep 2024 20:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D01844FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D01844FB;
	Fri,  6 Sep 2024 20:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12D791BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B04C408C5
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rmwEotqo1jL for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47776407AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47776407AF
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 441B686EE1; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:16:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 238313c605cd16e96a5abf87f1040d2616341813
X-Git-Newrev: fecf69525e21306fa8337b114dfd21504d410a2d
X-Patchwork-Hint: ignore
Message-Id: <20240906195855.441B686EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: allow uclibc toolchains
 for e4defrag
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fecf69525e21306fa8337b114dfd21504d410a2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 2014 e4defrag was only available for musl/glibc
toolchains in commit d770abad335a85884cfc2ec7574a331c29522810.

I believe sync_file_range() was already available in 2015 in the uClibc time.

So enable e4defrag. Tested in Qemu on a ext4 filesystem.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 23c4ef30b3..a45767d506 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -47,14 +47,9 @@ comment "e2scrub needs bash, coreutils, lvm2, and util-linux"
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_nios2 # fallocate not implemented
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
 	help
 	  Online defragmenter for ext4 filesystem
 
-comment "e4defrag needs a glibc or musl toolchain"
-	depends on !BR2_nios2
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
-
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
