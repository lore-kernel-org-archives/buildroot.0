Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A490C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA5C843B4;
	Sat, 17 Sep 2022 14:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA5C843B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJJsl_Und_fg; Sat, 17 Sep 2022 14:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507928437E;
	Sat, 17 Sep 2022 14:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507928437E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 104101BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F748436F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F748436F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kADxG31Tg-F4 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:27:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABA584370
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABA584370
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 98A2F8438F; Sat, 17 Sep 2022 14:27:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:26:21 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 604a495f257fc99c0c0c2d618463598247cd080f
X-Git-Newrev: 6d335e61986839c27c12d34f3d748149b1432df1
X-Patchwork-Hint: ignore
Message-Id: <20220917142733.98A2F8438F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/genrandconfig:
 improve ARM trusted firmware fixup
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d335e61986839c27c12d34f3d748149b1432df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Improve commit 541e794a959914d1189570c3674908eb5db08ce8 by adding a
custom case to make sure that a random configuration with an empty
platform for arm-trusted-firmware doesn't fail:

make_helpers/plat_helpers.mk:15: *** "Error: Unknown platform. Please use PLAT=<platform name> to specify the platform".  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/1b67220008223d1bcbe70b76d643f9d04362ba6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d3e029575c29cad2ba40cce7bf4270a28b83870e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index f9d690b45a..759aa801d7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -427,6 +427,10 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
 
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=""\n' in configlines:
+        return False;
+
     if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
        'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n' in configlines and \
        'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
