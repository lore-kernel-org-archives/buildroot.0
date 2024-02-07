Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF0EC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 194CE81B72;
	Wed,  7 Feb 2024 09:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFKx12EfS2V4; Wed,  7 Feb 2024 09:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FDF981BD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FDF981BD4;
	Wed,  7 Feb 2024 09:31:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53C321BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4130C4174F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h96HQRmfZgxX for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6E842182
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6E842182
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:31:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 758A88751C; Wed,  7 Feb 2024 09:31:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 10:23:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 694001df1ad6024b2a3f2748bb3712c782573087
X-Git-Newrev: b7232c51dd402afb361d7c310855e0bf5666958d
X-Patchwork-Hint: ignore
Message-Id: <20240207093130.758A88751C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add default setting
 for bare-metal toolchain arch
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7232c51dd402afb361d7c310855e0bf5666958d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We recently added support for building a bare-metal toolchain, and the
autobuilders are therefore trying to build such toolchains. However,
by default the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH option is
empty, causing the target tuple to be empty, and therefore
host-gcc-bare-metal tries to build a toolchain for the target
"x86_64-pc-linux-gnu", which isn't a bare-metal target, and fails
badly.

In order to properly test this bare-metal support, this commit adjusts
the genrandconfig script so that it injects a valid target
architecture tuple.

Fixes:

  http://autobuild.buildroot.net/results/6cb1514b19bfe056fb984d3538bdccdda5e174c1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 52edad06d8..eb1f8cbd4a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -315,6 +315,10 @@ def fixup_config(sysinfo, configfile):
        'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
         return False
 
+    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y' in configlines:
+        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""')
+        configlines.add('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"')
+
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
