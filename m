Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF2DC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 21:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A090B405C7;
	Fri, 24 May 2024 21:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCmZZ6-FNTLS; Fri, 24 May 2024 21:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D31405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D31405D9;
	Fri, 24 May 2024 21:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF08F1CFEBF
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C71960B24
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYp21G8ORGpT for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB05160B5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB05160B5E
 for <buildroot@buildroot.org>; Fri, 24 May 2024 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A51A875F7; Fri, 24 May 2024 21:38:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 23:35:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07853b31d2c8cf39553646f0f9ff82738af5c08d
X-Git-Newrev: ad9c8c9289772fb3cf026b214d6869ebc2b017be
X-Patchwork-Hint: ignore
Message-Id: <20240524213844.9A51A875F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_sparc_ss10_defconfig: fix
 linux hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad9c8c9289772fb3cf026b214d6869ebc2b017be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c3e17c407a3 (configs/qemu_sparc_ss10: re-introduce defconfig) added a
hash file for the Linux kernel, but mistakingly used the .tar.gz instead of
.tar.xz.

The patch fixes "make legal-info" for qemu_sparc_ss10 configuration:

>>> host-gcc-initial 13.2.0 Collecting legal info
COPYING: OK (sha256: 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c)
COPYING3: OK (sha256: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)
COPYING.LIB: OK (sha256: a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861)
COPYING3.LIB: OK (sha256: a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c)
ERROR: No hash found for linux-6.8.6.tar.xz

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash | 1 +
 board/qemu/sparc-ss10/patches/linux/linux.hash                 | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash b/board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/qemu/sparc-ss10/patches/linux/linux.hash b/board/qemu/sparc-ss10/patches/linux/linux.hash
index 762f8575e7..9d0d5466ca 100644
--- a/board/qemu/sparc-ss10/patches/linux/linux.hash
+++ b/board/qemu/sparc-ss10/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1973e6fc3e8617fc8b0e24b33180449f1a39fa6a607f8dba61cf91b4c5bba466  linux-6.8.6.tar.gz
+# sha256 locally computed
+sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
