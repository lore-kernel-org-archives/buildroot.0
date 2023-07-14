Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A5EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 18:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC83F41889;
	Fri, 14 Jul 2023 18:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC83F41889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHf6M_Rc7OQl; Fri, 14 Jul 2023 18:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27DBF4176C;
	Fri, 14 Jul 2023 18:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27DBF4176C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 936351BF836
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 18:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3BF417A3
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 18:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3BF417A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0V4RXwy_dAfZ for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 18:24:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D0141903
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6D0141903
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 18:24:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B1AF9A4C00B8
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 20:24:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40238)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKNSS-0001ZC-1X
 for buildroot@buildroot.org; Fri, 14 Jul 2023 20:24:00 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 20:24:00 +0200
Message-Id: <20230714182400.3801854-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689359040;
 bh=+zfbaH8A25x1ovfqi4BQqUGakNGj+UVQYZzkv1IketI=;
 h=From:To:Subject:Date:From;
 b=tJa+DaHVHZa2pOUqtnfFGvIC5p1Dyjj0OqdTd6awygz7QLwHBJnCN3G7xSmcLQtRn
 4+0x1WKMV3g1JBhPofzLXxU3uIALtjMjKbgzOYvZqljoAwWKeQyR+z7KsHYfkWa9K1
 rGpLWJRqKRhIWC5JKEq0DcDFvqwKben7luAcvdyR+6Wjs/5u8NE5SqGvz3KhwKiSst
 A+DV+5TXhIsDjJJ1CH0hooI8pa310r30bv+CBNO1q+Nf6JIQC3cVXRdNmeaD9cfuo4
 z1bkkVjA+128gTXiUVyU/gNgr858ZUtZafhUx2gv6BHxQxLin/5fqcNDuyHwR/3/uU
 uOZIvQaG8q04w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tJa+DaHV
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: increase default
 target ubifs image size
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

The new value is calculated based on:
ROOTFS_SIZE = 5G (see commit 3c98eb26db6501a373cc405c80505ba72fde9e96)
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE = 0x1f800

5G / 0x1f800 = 41610

Fixes:
http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Suggested by Thomas:
https://lists.buildroot.org/pipermail/buildroot/2023-July/670125.html

 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0938260c1b..60922e871c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -525,6 +525,11 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n')
         configlines.append('BR2_TARGET_ROOTFS_F2FS_SIZE="%s"\n' % ROOTFS_SIZE)
 
+    if 'BR2_TARGET_ROOTFS_UBIFS=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048\n')
+        configlines.append('BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=41610\n')
+
     if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
