Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8322ED41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521BB8117A;
	Wed, 13 Nov 2024 09:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUiA9PQDuC3I; Wed, 13 Nov 2024 09:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D75811F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D75811F5;
	Wed, 13 Nov 2024 09:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45F00E11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04C274045A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ia0ujGQ7BkcC for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C8E405F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32C8E405F0
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F11286229; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 22:44:49 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 71e9e15be76d81e68f0bebaa9d8d2b175ff79ec2
X-Git-Newrev: a1bf4fa4bcf540a1ec94c58ce013f2847b6cf94c
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.2F11286229@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig:
 handle BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a1bf4fa4bcf540a1ec94c58ce013f2847b6cf94c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y,
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is supposed to be non-empty. But in
the context of genraconfig, we don't know to what value
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME can be set, so let's avoid cases
where BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y. By dropping this option,
kconfig will revert back to the default image format for the selected
architecture.

Fixes:

  http://autobuild.buildroot.net/results/1d104a051c83bb31e98565369a2ec7badfa21eca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b07d21ab984d10cbabeb186fbd47d446e027c03b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 28a0c1b605..514434bc06 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -241,6 +241,10 @@ async def fixup_config(sysinfo, configfile):
             configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
             configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
 
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
+
     if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
        'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
         configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
