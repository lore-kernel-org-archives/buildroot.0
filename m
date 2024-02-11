Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C34C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F008340497;
	Sun, 11 Feb 2024 15:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WaXaMWg19uYG; Sun, 11 Feb 2024 15:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C7BB404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C7BB404D8;
	Sun, 11 Feb 2024 15:32:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F039A1BF861
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE20C4066A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VbWCyqovsq-Q for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37057401BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37057401BB
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31C718768C; Sun, 11 Feb 2024 15:32:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:32:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae8cb9b2bfa95a3107ad312748316a11801d8472
X-Git-Newrev: 6e0826d0672e9347fba03cf96ac9e7a48c36dac6
X-Patchwork-Hint: ignore
Message-Id: <20240211153246.31C718768C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rlwrap: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e0826d0672e9347fba03cf96ac9e7a48c36dac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 0a1f2fce0494388080af0a4130e62522c26fe4a9:

/home/autobuild/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: pty.o: in function `my_pty_fork':
pty.c:(.text+0x68): undefined reference to `fork'
/home/autobuild/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: filter.o: in function `.L0 ':
filter.c:(.text+0x134): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/0a3a68cfb181bc67a7dbf1d44f64b0a29df75987

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rlwrap/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rlwrap/Config.in b/package/rlwrap/Config.in
index 0cb3e33fa7..4e18dfde52 100644
--- a/package/rlwrap/Config.in
+++ b/package/rlwrap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RLWRAP
 	bool "rlwrap"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_READLINE
 	help
 	  rlwrap is a 'readline wrapper', a small utility that uses the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
