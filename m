Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFB8C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C7D60BA3;
	Mon, 31 Oct 2022 12:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C7D60BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCKU5xTYHMTT; Mon, 31 Oct 2022 12:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6162F605AB;
	Mon, 31 Oct 2022 12:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6162F605AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1B51BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0715A605AB
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0715A605AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iv_VLR_jau_e for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:20:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 412D460087
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 412D460087
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F089878FA; Mon, 31 Oct 2022 12:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:20:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27e66d77c10b3ae3142a5ff8631ba81ce9cf70dc
X-Git-Newrev: bada3ae53f051e3788bdacb8483cd386c2f4a419
X-Patchwork-Hint: ignore
Message-Id: <20221031122013.2F089878FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: handle a10disp
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

commit: https://git.buildroot.net/buildroot/commit/?id=bada3ae53f051e3788bdacb8483cd386c2f4a419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

a10disp will raise the following build failure with a mainline kernel:

cp: cannot stat '/home/autobuild/autobuild/instance-0/output-1/build/linux-5.17.15/include/video/sunxi_disp_ioctl.h': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/1f2607d6adece4d5dfe17fbdb032a2d228fc030f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 257fe7b520..f19a405685 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -308,6 +308,8 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
         return False
+    if 'BR2_PACKAGE_A10DISP=y\n' in configlines:
+        return False
 
     if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
        'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
