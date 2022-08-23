Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F1AC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D396B60BF2;
	Tue, 23 Aug 2022 21:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D396B60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rafes7qVtwvB; Tue, 23 Aug 2022 21:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C0E60BDB;
	Tue, 23 Aug 2022 21:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0C0E60BDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8E6C1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9134B410C2
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9134B410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IM_4QznLG8g for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:55:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 780DD40881
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 780DD40881
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E48387C2D; Tue, 23 Aug 2022 21:41:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:55:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e52c28397b79f8c4c99552217cbe95202166626
X-Git-Newrev: d3e029575c29cad2ba40cce7bf4270a28b83870e
X-Patchwork-Hint: ignore
Message-Id: <20220823214111.0E48387C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: improve ARM trusted
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3e029575c29cad2ba40cce7bf4270a28b83870e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Improve commit 541e794a959914d1189570c3674908eb5db08ce8 by adding a
custom case to make sure that a random configuration with an empty
platform for arm-trusted-firmware doesn't fail:

make_helpers/plat_helpers.mk:15: *** "Error: Unknown platform. Please use PLAT=<platform name> to specify the platform".  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/1b67220008223d1bcbe70b76d643f9d04362ba6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4c00d67691..6772df44e3 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -424,6 +424,10 @@ def fixup_config(sysinfo, configfile):
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
