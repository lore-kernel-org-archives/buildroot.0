Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FFAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A6A40B42;
	Tue,  3 May 2022 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_CTFmqrQMng; Tue,  3 May 2022 20:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26F6740ABF;
	Tue,  3 May 2022 20:31:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82E3C1BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DEAE40B3B
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dlIXXUVw5ym for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE59C40528
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7B74E854F3; Tue,  3 May 2022 20:20:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:22:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e11431dd611bd3f9f23a2fc48f3b077d35073b9d
X-Git-Newrev: 57926b025bcdb477d69ee9c1474e6867f0e0a3b5
X-Patchwork-Hint: ignore
Message-Id: <20220503202054.7B74E854F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: only fixup host uboot
 tools source when empty
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

commit: https://git.buildroot.net/buildroot/commit/?id=57926b025bcdb477d69ee9c1474e6867f0e0a3b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the kconfig values being replaced are not empty we should not
try to fix them.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 8ed2783a6d..89ad53ca4c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -299,7 +299,9 @@ def fixup_config(sysinfo, configfile):
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
 
-    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines:
+    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
+       'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
+       'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n' in configlines:
         bootenv = os.path.join(args.outputdir, "boot_env.txt")
         with open(bootenv, "w+") as bootenvf:
             bootenvf.write("prop=value")
@@ -308,7 +310,8 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n')
         configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x1000"\n')
 
-    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines:
+    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines and \
+       'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n' in configlines:
         bootscr = os.path.join(args.outputdir, "boot_script.txt")
         with open(bootscr, "w+") as bootscrf:
             bootscrf.write("prop=value")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
