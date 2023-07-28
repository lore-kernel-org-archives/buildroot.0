Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C2EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270FE416B6;
	Fri, 28 Jul 2023 21:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 270FE416B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDgljnCoLoAo; Fri, 28 Jul 2023 21:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0048741999;
	Fri, 28 Jul 2023 21:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0048741999
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF0F51BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B59E040423
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59E040423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9GS0r8OAjqh for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:48:57 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 813ED4032B
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 813ED4032B
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SGYOUD006879; Fri, 28 Jul 2023 21:30:05 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3s4dq7c10q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jul 2023 21:30:05 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 36SLU208003213
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jul 2023 21:30:02 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 36SLU0cs011685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 28 Jul 2023 21:30:00 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 164AA602B2;
 Fri, 28 Jul 2023 16:30:00 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:29:52 +0000
Message-ID: <20230728212952.3890970-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=449 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307280196
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=389
 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280196
X-Proofpoint-GUID: T3pbIsEWQLr1cA1PuSkF32broigTo_eD
X-Proofpoint-ORIG-GUID: T3pbIsEWQLr1cA1PuSkF32broigTo_eD
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=459 spamscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307280196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=uaVk5NviEDKQROrIfjeH8Q/ErZvmkpsCFKUPEX7zEys=;
 b=HWI8DeuOjrt5xI2FH5+rp6859omSPnipjnqWxwz/BkCBEI/AUPNB2UXhqF43mp7KnLET
 DE9IFwKCNr37rNOs30y4fmr5kxkSftF+iJwC8wj0+fHUf0Ur10bQSxnxd12JtrQg5RAr
 83Ut2/m09VdpyThuSPjD7GbT5zjIlfarsaD0XjkuelCqmBVoE95OznCp2y/BWkVe0ooQ
 dfdvM8EECIzWIoq+9i9TdzAA5mk+pauxVgy/QRMuTfVzpjJNsu4eMSCcmYdhory7Zdvg
 IZ7WX9PMbEt0X+jrsSko+2WgcUseutLvDFFHzVcxsMnj89fc/+dRs90bkwaMNHqMjhTI bQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=HWI8DeuO
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: backport fix for NOR
 flashes
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a bug present since v0.3.3 that causes extremely slow writes to
NOR flashes.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 ...-fix-bug-when-SPI-flash-write-size-s.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch

diff --git a/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch b/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
new file mode 100644
index 0000000000..084fd34e61
--- /dev/null
+++ b/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
@@ -0,0 +1,70 @@
+From 35bbc4d8155ed86ca7200e060dad98bdfbce684d Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Thu, 15 Jun 2023 16:54:46 +0200
+Subject: [PATCH] Revert "fw_setenv: fix bug when SPI flash write size !=
+ sector size"
+
+This reverts commit 44ecc1c216007272a6f99a104a71c9d410969d9e.
+
+mtd writesize was errouneously interpreted as maximum allowed size, but
+it is the minimum size. The patch raises performance issues because on
+NOR flashes single bytes are written.
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+Upstream: https://github.com/sbabic/libubootenv/commit/9f17a00ee56dc5cfb1d9b51e6639d67b64cb3309
+---
+ src/uboot_env.c | 29 +++++++++--------------------
+ 1 file changed, 9 insertions(+), 20 deletions(-)
+
+diff --git a/src/uboot_env.c b/src/uboot_env.c
+index c5eefe7..76e2619 100644
+--- a/src/uboot_env.c
++++ b/src/uboot_env.c
+@@ -712,8 +712,6 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
+ 		sectors = dev->envsectors ? dev->envsectors : 1;
+ 		buf = data;
+ 		while (count > 0) {
+-			int blockcount;
+-
+ 			erase.start = start;
+ 
+ 			skip = is_nand_badblock(dev, start);
+@@ -744,26 +742,17 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
+ 				ret =-EIO;
+ 				goto devwrite_out;
+ 			}
+-
+-			blockcount = blocksize;
+-
+-			/* writesize can be different than the sector size. */
+-
+-			while (blockcount > 0) {
+-				if (lseek(dev->fd, start, SEEK_SET) < 0) {
+-					ret =-EIO;
+-					goto devwrite_out;
+-				}
+-				if (write(dev->fd, buf, dev->mtdinfo.writesize) != dev->mtdinfo.writesize) {
+-					ret =-EIO;
+-					goto devwrite_out;
+-				}
+-
+-				blockcount -= dev->mtdinfo.writesize;
+-				start += dev->mtdinfo.writesize;
+-				buf += dev->mtdinfo.writesize;
++			if (lseek(dev->fd, start, SEEK_SET) < 0) {
++				ret =-EIO;
++				goto devwrite_out;
++			}
++			if (write(dev->fd, buf, blocksize) != blocksize) {
++				ret =-EIO;
++				goto devwrite_out;
+ 			}
+ 			MTDLOCK(dev, &erase);
++			start += dev->sectorsize;
++			buf += blocksize;
+ 			count -= blocksize;
+ 			ret += blocksize;
+ 		}
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
