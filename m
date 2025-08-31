Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7078CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 16:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4B982A6C;
	Sun, 31 Aug 2025 16:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFgxl-6D6l2s; Sun, 31 Aug 2025 16:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 950DD82BEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950DD82BEB;
	Sun, 31 Aug 2025 16:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FB8A10E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 16:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80E6082BEB
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 16:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5MiYx8EsUyo for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 16:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFCCD82A6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFCCD82A6C
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 16:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF97587D68; Sun, 31 Aug 2025 16:58:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 18:56:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73331b68a9a8b72876a69f1138a0917b44ad67db
X-Git-Newrev: 98e28829ae3dbee88786e96fe9a6206b509a9ddd
X-Patchwork-Hint: ignore
Message-Id: <20250831165826.BF97587D68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: update bare metal
 logic after change to buildroot vendor name
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98e28829ae3dbee88786e96fe9a6206b509a9ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://autobuild.buildroot.net/results/c961d9edae0f1f3d17b5a6f078519bc7bad03a26/

Commit 053b0c9f66d8 ("boot/xilinx-embeddedsw: remove support for xilinx
vendor name" dropped support for microblazeel-xilinx-elf, so adjust the
genrandconfig logic to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 67f0ea9f73..0ec478e6ca 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -147,7 +147,7 @@ async def fixup_config(sysinfo, configfile):
 
     if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y\n' in configlines:
         configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""\n')
-        configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"\n')
+        configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"\n')
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
