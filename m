Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D567C0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 13:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F067D60D53;
	Mon, 17 Jul 2023 13:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F067D60D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pXE3XwFrqqC; Mon, 17 Jul 2023 13:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A36860A5F;
	Mon, 17 Jul 2023 13:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A36860A5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 391E21BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10909605B5
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10909605B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDFYMQZsLXHE for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C05060AFE
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C05060AFE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A3DA872F1; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 15:03:56 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 747f62053c52a54ba2b603f3909371e3bd993809
X-Git-Newrev: 7f8805c1a698fcf4cf8b62d037c6a8076bd8ab5e
X-Patchwork-Hint: ignore
Message-Id: <20230717131709.3A3DA872F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] utils/genrandconfig:
 disable cramfs images
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f8805c1a698fcf4cf8b62d037c6a8076bd8ab5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes build error:

  warning: estimate of required size (upper bound) is 1374MB, but
  maximum image size is 272MB, we might die prematurely
  mkcramfs: filesystem too big

Fixes:
http://autobuild.buildroot.net/results/d47/d47f9b462707dffe1b6665f143701303b04e2adc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af5ccec266dbb7925ac12622f379dacb20087ddd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
