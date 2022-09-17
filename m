Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BFFECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A00843E4;
	Sat, 17 Sep 2022 15:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A00843E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N78UAUJl6d5P; Sat, 17 Sep 2022 15:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64A08439A;
	Sat, 17 Sep 2022 15:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E64A08439A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7AB1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C6661150
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C6661150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rN6yYFVt4DY6 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB12360A9F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB12360A9F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AADCA844E8; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:17:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 815a4d66ea52326d4bbd9c70f9345f8f906a07fc
X-Git-Newrev: 9b1efacba95c4700f202cf6baf76aee73e432abd
X-Patchwork-Hint: ignore
Message-Id: <20220917154022.AADCA844E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/genrandconfig: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b1efacba95c4700f202cf6baf76aee73e432abd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 629efbbfd9..739536125e 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -296,6 +296,9 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
+    if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
+       'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
+        return False
 
     if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines:
         bootenv = os.path.join(args.outputdir, "boot_env.txt")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
