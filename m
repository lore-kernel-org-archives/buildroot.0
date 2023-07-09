Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B62FEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3878160741;
	Sun,  9 Jul 2023 16:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3878160741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKq9jr7e2yA7; Sun,  9 Jul 2023 16:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E14606F5;
	Sun,  9 Jul 2023 16:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E14606F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E26E1BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F2D81882
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F2D81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78o50lqaeqv1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFC9B81871
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC9B81871
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FDE586942; Sun,  9 Jul 2023 16:30:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 18:30:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a749a93b7def81096f33310a5892f677c9fc8bb1
X-Git-Newrev: af5ccec266dbb7925ac12622f379dacb20087ddd
X-Patchwork-Hint: ignore
Message-Id: <20230709163023.9FDE586942@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: disable cramfs images
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

commit: https://git.buildroot.net/buildroot/commit/?id=af5ccec266dbb7925ac12622f379dacb20087ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error:

  warning: estimate of required size (upper bound) is 1374MB, but
  maximum image size is 272MB, we might die prematurely
  mkcramfs: filesystem too big

Fixes:
http://autobuild.buildroot.net/results/d47/d47f9b462707dffe1b6665f143701303b04e2adc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 2b0baedf31..0938260c1b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -512,6 +512,9 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
         configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
 
+    if 'BR2_TARGET_ROOTFS_CRAMFS=y\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_CRAMFS=y\n')
+
     if 'BR2_TARGET_ROOTFS_EXT2=y\n' in configlines and \
        'BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n' in configlines:
         configlines.remove('BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
