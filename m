Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BDAD10C04
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 12:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B224070A;
	Mon, 28 Oct 2024 12:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcqKjo_pyLM4; Mon, 28 Oct 2024 12:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DBAA4070D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DBAA4070D;
	Mon, 28 Oct 2024 12:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0617E112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E64A660677
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcz25821nPeu for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA05605ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA05605ED
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02ED5842EF; Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:48:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2417d0cf81ee54329aa941d1a588baf601711978
X-Git-Newrev: b07d21ab984d10cbabeb186fbd47d446e027c03b
X-Patchwork-Hint: ignore
Message-Id: <20241028122431.02ED5842EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: handle
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=b07d21ab984d10cbabeb186fbd47d446e027c03b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 282a9ebdea..0698cc5ff0 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -248,6 +248,10 @@ async def fixup_config(sysinfo, configfile):
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
