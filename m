Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD1DC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B60141D7F;
	Fri,  1 Mar 2024 08:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfQ0c0ccHjeH; Fri,  1 Mar 2024 08:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8887441D86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8887441D86;
	Fri,  1 Mar 2024 08:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 344BC1BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214358275A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIKVcTuwJLE9 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F0A7826F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F0A7826F5
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43BE787E4A; Fri,  1 Mar 2024 08:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:13:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f253e3e04e57d72f470eead8591a2606f98d396
X-Git-Newrev: 6ee61ef95b0e9e66d2d251049ddba3696e51f5a6
X-Patchwork-Hint: ignore
Message-Id: <20240301081453.43BE787E4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: fix
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ee61ef95b0e9e66d2d251049ddba3696e51f5a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b7232c51dd402afb361d7c310855e0bf5666958d added default setting
for bare-metal toolchain arch but unfortunately it used configlines.add
instead of configlines.append resulting in the following build failure:

/bin/sh: line 8: /home/autobuild/autobuild/instance-1/output-1/per-package/host-gcc-bare-metal/host/bin/-ar: No such file or directory

While at it, also append /n for consistency

Fixes: b7232c51dd402afb361d7c310855e0bf5666958d
 - http://autobuild.buildroot.org/results/95ac565653ddb5c14ec71470c32a34ad10b048cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index eb1f8cbd4a..5ebec415b5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -315,9 +315,9 @@ def fixup_config(sysinfo, configfile):
        'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
         return False
 
-    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y' in configlines:
-        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""')
-        configlines.add('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"')
+    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y\n' in configlines:
+        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""\n')
+        configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"\n')
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
