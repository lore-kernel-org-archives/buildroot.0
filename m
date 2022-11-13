Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FDEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 17:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC2C80EE3;
	Sun, 13 Nov 2022 17:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC2C80EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uc2u9ckyK6U1; Sun, 13 Nov 2022 17:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E7480DCC;
	Sun, 13 Nov 2022 17:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E7480DCC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 745431BF40B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59E714032F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E714032F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sua15ItcwDlV for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:59:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A253402EF
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A253402EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4477583755; Sun, 13 Nov 2022 16:59:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:48:51 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: ff790138ef447f1426c09798b7e0b05202c65555
X-Git-Newrev: 3db40bf45c918f0aa317fe1a001d94c8e773593c
X-Patchwork-Hint: ignore
Message-Id: <20221113165947.4477583755@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] utils/genrandconfig:
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

commit: https://git.buildroot.net/buildroot/commit/?id=3db40bf45c918f0aa317fe1a001d94c8e773593c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
