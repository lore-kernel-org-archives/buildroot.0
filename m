Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCB2C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE3D60E85;
	Wed, 24 Aug 2022 11:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE3D60E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urxx3oAoNMPl; Wed, 24 Aug 2022 11:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6203A60E6D;
	Wed, 24 Aug 2022 11:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6203A60E6D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCC71BF37A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 573F060E83
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 573F060E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bfDdyYgnhUk for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:16:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F910605EC
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F910605EC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F16F087CF7; Wed, 24 Aug 2022 11:01:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:16:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15ab53968c5a92a99d5546d259057a87ace2e43c
X-Git-Newrev: fee46b54e7b51c6b40fa57cf03fb150c21fdf8e5
X-Patchwork-Hint: ignore
Message-Id: <20220824110142.F16F087CF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add aufs-util handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=fee46b54e7b51c6b40fa57cf03fb150c21fdf8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a custom case to make sure that a random configuration with an empty
version for aufs-util doesn't fail.

Fixes:
 - http://autobuild.buildroot.org/results/e242cf66a02983bcf6e95b37f8e458bd18aee683

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6772df44e3..eaf5bd35d6 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -296,6 +296,9 @@ def fixup_config(sysinfo, configfile):
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
