Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96DBCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B43E61470;
	Sat, 16 Aug 2025 19:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeLLFHwLx_l0; Sat, 16 Aug 2025 19:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D75614A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D75614A6;
	Sat, 16 Aug 2025 19:39:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FF58196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F6C4111C
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7Stk3NWSkxE for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A232D412F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A232D412F9
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 916EC87537; Sat, 16 Aug 2025 19:39:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 21:39:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7508a23242aae7a80f22acc4473da25f7f9e96d
X-Git-Newrev: 71ae8e6ca94fb445b3c4681b85787789a352af6c
X-Patchwork-Hint: ignore
Message-Id: <20250816193951.916EC87537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71ae8e6ca94fb445b3c4681b85787789a352af6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "package/gcc: bump 15.x series to 15.2.0",
gcc-bare-metal fails to download its sources. For example using the
commands:

	make zynqmp_kria_kv260_defconfig
	make source

fails with error:

	ERROR: No hash found for gcc-15.1.0.tar.xz

This is because the gcc-bare-metal package reuses the hash file and
the 15.x package patch directory from the gcc package (which was
bumped to 15.2.0), but still defines its _VERSION to 15.1.0.

This commit fixes this issue by bumping gcc-bare-metal to 15.2.0.

Fixes:
https://autobuild.buildroot.org/results/eda879fb8e1ccd696f01927087713b88a4b1a2c5
https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/b1dd235ad0dd91e1919a167a17cc9cd20a3695b2

Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Cc: Neal Frager <neal.frager@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc-bare-metal/15.1.0            | 1 -
 package/gcc-bare-metal/15.2.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/15.1.0 b/package/gcc-bare-metal/15.1.0
deleted file mode 120000
index 669da9e956..0000000000
--- a/package/gcc-bare-metal/15.1.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/15.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/15.2.0 b/package/gcc-bare-metal/15.2.0
new file mode 120000
index 0000000000..d3d1bbdefa
--- /dev/null
+++ b/package/gcc-bare-metal/15.2.0
@@ -0,0 +1 @@
+../gcc/15.2.0
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 17232a8ef1..88fc56ac09 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 15.1.0
+GCC_BARE_METAL_VERSION = 15.2.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
