Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02399C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE696111F;
	Wed,  6 Jul 2022 21:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE696111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1VtVu5PGdEc; Wed,  6 Jul 2022 21:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE3A361125;
	Wed,  6 Jul 2022 21:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3A361125
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADC831BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8883860E0A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8883860E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3j6UuM3_EUP for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:37:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD17960783
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD17960783
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D77F082DAE; Wed,  6 Jul 2022 21:24:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:36:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05f559baccb2c34f73a17ecc831f7f0429a22dd1
X-Git-Newrev: d780b828fcbe2b4a1f125d3460f28379d5c27b8e
X-Patchwork-Hint: ignore
Message-Id: <20220706212451.D77F082DAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add optee-os custom
 tarball handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=d780b828fcbe2b4a1f125d3460f28379d5c27b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a custom case to make sure that a random configuration with an
empty tarball location for OP-TEE OS doesn't fail. It reverts to
BR2_TARGET_OPTEE_OS_LATEST in that case.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6f748fa709..75757917c2 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -463,6 +463,13 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
         configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
 
+    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
+       'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_OPTEE_OS_LATEST=y\n')
+        configlines.remove('BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n')
+
     if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
         configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
