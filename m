Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7413C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 20:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8317F40441;
	Wed, 29 May 2024 20:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4wYkw4hBHck; Wed, 29 May 2024 20:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6FC404B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F6FC404B1;
	Wed, 29 May 2024 20:24:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9B61BF359
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BF5F404B1
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 20:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPe9aaM1ByOi for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 20:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D21AB40441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21AB40441
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D21AB40441
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:35 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44TGSEml001395
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:35 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ye7wq34a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:34 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44TKOXFA004781
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:33 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44TKOWTh030327
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 29 May 2024 20:24:33 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id C98DE3000468;
 Wed, 29 May 2024 15:24:32 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 20:24:22 +0000
Message-ID: <20240529202425.469185-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=571
 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxlogscore=550 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Proofpoint-GUID: mgbm1SMtX-0XXrCZMc_aGhW454ajQQLw
X-Proofpoint-ORIG-GUID: mgbm1SMtX-0XXrCZMc_aGhW454ajQQLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 mlxlogscore=640 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=POD051818;
 bh=Mz/yZ7pLC00lwS0Eh0tGbuWlQp5WrsnPIBZ5CQvsaCY=;
 b=NmQnTmk2DkJuRdDLU6ilTQiuMonKUM9RQuqksAh6tSy/mkEkiaVjPklTa3O0de+NnGSG
 EAYYYC8UgSMNR8jb7o8jddviKT9vDTNeKilpDrut1+jU8ZOr4h2RmELOYOcTTIhecw50
 GpUUdpzQHsSMGVxltxTTn+mRFZvylg3h1rBnq0s5mOBDa1k7OgwVgrrua1EGnCKbwkr+
 TIk5XGHn4vxhSsLCbOsfR6MzDDsSo8+53PqQyq+bI8gUn428vOm/hdmBmkXVa0gbyF7S
 6oJVguDnMpCU8ZRdd/KgEPaWBNHFt4dC5ErM7zIGR0z2mCa3QGxoQp1CyRKsHeK2Jccm cA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=NmQnTmk2
Subject: [Buildroot] [PATCH 1/4] support/testing: add mtd test
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/tests/package/test_mtd.py | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 support/testing/tests/package/test_mtd.py

diff --git a/support/testing/tests/package/test_mtd.py b/support/testing/tests/package/test_mtd.py
new file mode 100644
index 0000000000..0871ab6457
--- /dev/null
+++ b/support/testing/tests/package/test_mtd.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestMtd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_ENABLE_LOCALE_WHITELIST=""
+        BR2_PACKAGE_MTD=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+
+        self.emulator.login()
+
+        mtd = "/dev/mtd0"
+        erasesize = 256 * 1024
+        test_sectors = 4
+        test_size = erasesize * test_sectors
+
+        output, exit_code = self.emulator.run(f"mtd_debug info {mtd}")
+        output = [x.strip() for x in output if x.strip()]
+        self.assertEqual(output, [
+            "mtd.type = MTD_NORFLASH",
+            "mtd.flags = MTD_CAP_NORFLASH",
+            "mtd.size = 134217728 (128M)",
+            "mtd.erasesize = 262144 (256K)",
+            "mtd.writesize = 1",
+            "mtd.oobsize = 0",
+            "regions = 0",
+        ])
+
+        # Test flashcp
+        self.assertRunOk(f"dd if=/dev/urandom of=random.bin bs={test_size} count=1")
+        self.assertRunOk(f"flashcp random.bin {mtd}")
+        self.assertRunOk(f"cmp -s -n {test_size} random.bin {mtd}")
+
+        # Test flash_erase
+        self.assertRunOk(f"dd if=/dev/zero bs={test_size} count=1 | tr '\\000' '\\377' >nor-erase.bin")
+        self.assertRunOk(f"flash_erase {mtd} 0 {test_sectors}")
+        self.assertRunOk(f"cmp -s -n {test_size} nor-erase.bin {mtd}")
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
