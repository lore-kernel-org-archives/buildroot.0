Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D72ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1278439A;
	Sat, 17 Sep 2022 15:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1278439A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvzgdkMZYfNP; Sat, 17 Sep 2022 15:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B92843F4;
	Sat, 17 Sep 2022 15:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B92843F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5551BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7FA61156
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7FA61156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcJKXiPnDqSL for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D55460A9F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D55460A9F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1D15384559; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:17:29 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d5ac94f8b37a0d11f7fc751902789316e0186d66
X-Git-Newrev: ba27d0889f016e111ca33dda5c00ae4974864f49
X-Patchwork-Hint: ignore
Message-Id: <20220917154057.1D15384559@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/genrandconfig: add
 aufs-util handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba27d0889f016e111ca33dda5c00ae4974864f49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Add a custom case to make sure that a random configuration with an empty
version for aufs-util doesn't fail.

Fixes:
 - http://autobuild.buildroot.org/results/e242cf66a02983bcf6e95b37f8e458bd18aee683

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fee46b54e7b51c6b40fa57cf03fb150c21fdf8e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 759aa801d7..33b124cd8d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -299,6 +299,9 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
+    if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
+       'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
+        return False
 
     if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
        'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
