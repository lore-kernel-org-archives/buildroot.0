Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C52C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EEEB60BD5;
	Sun, 13 Nov 2022 17:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EEEB60BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Maq0Srm2Wzc; Sun, 13 Nov 2022 17:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5080260BD2;
	Sun, 13 Nov 2022 17:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5080260BD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C11D31BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C96C60BD3
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C96C60BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOI1OljYP06c for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 17:01:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB59260BD0
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 17:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB59260BD0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6EDD83767; Sun, 13 Nov 2022 17:01:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:48:57 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 275cb4d2dbf6f416a293176318c76fc32ebc1319
X-Git-Newrev: e0e5fd65de61a9187ff06209b58925836de4245d
X-Patchwork-Hint: ignore
Message-Id: <20221113170134.C6EDD83767@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/genrandconfig:
 handle a10disp
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0e5fd65de61a9187ff06209b58925836de4245d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

a10disp will raise the following build failure with a mainline kernel:

cp: cannot stat '/home/autobuild/autobuild/instance-0/output-1/build/linux-5.17.15/include/video/sunxi_disp_ioctl.h': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/1f2607d6adece4d5dfe17fbdb032a2d228fc030f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bada3ae53f051e3788bdacb8483cd386c2f4a419)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 739536125e..353c1ca8f0 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -299,6 +299,8 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
         return False
+    if 'BR2_PACKAGE_A10DISP=y\n' in configlines:
+        return False
 
     if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines:
         bootenv = os.path.join(args.outputdir, "boot_env.txt")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
