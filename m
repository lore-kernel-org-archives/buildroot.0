Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCE0EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 14:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C59F0404DA;
	Sun,  9 Jul 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C59F0404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6oruJla4owM; Sun,  9 Jul 2023 14:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29C46404BA;
	Sun,  9 Jul 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C46404BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11B0C1BF336
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 14:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF5A0404BA
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 14:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF5A0404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCPbgBzMZKrG for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 14:51:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD1B440017
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD1B440017
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 14:51:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A923FA4C00F9
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:51:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40498)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIVks-0000OF-1V
 for buildroot@buildroot.org; Sun, 09 Jul 2023 16:51:18 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 16:51:18 +0200
Message-Id: <20230709145118.1163585-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688914278;
 bh=HUHmTWlJfEypyb42pnB8GrBOjr8X8l5XlwCZL5Ek2Is=;
 h=From:To:Subject:Date:From;
 b=hNNSxmFG1Z8ERe5pGEXrO0C1XU/kVU6tuEV3zYZnOydumQw2KmBH3hLlcspMdmCt9
 G3XO5YIIBANeYZ8pc4ujE9mWIbZ21i4vlIOG0psDODza3M/02WMahpnytexxJ8fS2e
 k/mqOW1IiZf21Wfw0EUN0xzfQTguMsBL3ZWO7G46M86IbytqTbVwf8wc97ypGxxLah
 qLnrdh+hIGnxf50Yny6WM2aSlhd7nIZG9IO2E7R4NeXFXbIL8xCWhQ959HM0s//DyL
 6dZagOyxYZ6iL76N+qePo2F3rf93r5Zc9uQzAJI6unQlnmtYZNU/5GFnBqW/2b9WeU
 oUT7VlOe4PsCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hNNSxmFG
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: disable cramfs images
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error:

  warning: estimate of required size (upper bound) is 1374MB, but
  maximum image size is 272MB, we might die prematurely
  mkcramfs: filesystem too big

Fixes:
http://autobuild.buildroot.net/results/d47/d47f9b462707dffe1b6665f143701303b04e2adc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
