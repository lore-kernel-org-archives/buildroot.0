Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE26C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7514C41C5D;
	Wed, 18 May 2022 19:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UB05uZMiBMwh; Wed, 18 May 2022 19:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14708415CF;
	Wed, 18 May 2022 19:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0406C1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4623F41C7E
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6SZWmzl_YPvk for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64ED141C81
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0F4A286065; Wed, 18 May 2022 19:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47cfb6a44829555beead3dce0fe1f1d843c3800f
X-Git-Newrev: 541e794a959914d1189570c3674908eb5db08ce8
X-Patchwork-Hint: ignore
Message-Id: <20220518190953.0F4A286065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add ARM trusted
 firmware fixup
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

commit: https://git.buildroot.net/buildroot/commit/?id=541e794a959914d1189570c3674908eb5db08ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
boot/arm-trusted-firmware/arm-trusted-firmware.mk:200: *** No repository specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 60ef8739cc..cf43778183 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -426,6 +426,27 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
 
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n')
+
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=""\n')
+
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y\n')
+        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=""\n')
+
     if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
        'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
         configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
