Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB57C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 018A540BB7;
	Wed,  4 May 2022 19:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cwx4KpmP9Cug; Wed,  4 May 2022 19:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0728940BB9;
	Wed,  4 May 2022 19:47:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0771BF9C6
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C3560ED6
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_yDPmhWEIIH for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:47:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC8560AFA
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:47:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A9C8785783; Wed,  4 May 2022 19:36:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 May 2022 21:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac05c0d68dc89c3697c22db4c4357b6de5589809
X-Git-Newrev: fcca7574430a04f0b0c6aeecc5399f7758dfc38c
X-Patchwork-Hint: ignore
Message-Id: <20220504193655.A9C8785783@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add DTS cuimage fixup
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcca7574430a04f0b0c6aeecc5399f7758dfc38c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we don't have a DTS name or path we need to also disable cuimage
to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
support.

Fixes:
linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 89ad53ca4c..60ef8739cc 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -385,6 +385,9 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
             configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
             configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
+        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:
+            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
+            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
         if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
             configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
             configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
