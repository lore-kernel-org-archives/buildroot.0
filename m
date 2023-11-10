Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D767C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29EF426AA;
	Fri, 10 Nov 2023 21:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29EF426AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX44MC-q7WzU; Fri, 10 Nov 2023 21:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12906426B6;
	Fri, 10 Nov 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12906426B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3350E1BF2C4
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198C44025A
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 198C44025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHfwkykTclNC for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:00:20 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9DFB4179B
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DFB4179B
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAHWX0w012341; Fri, 10 Nov 2023 21:00:17 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3u9s0tt4m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Nov 2023 21:00:17 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3AAL0GHJ005199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Nov 2023 21:00:16 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3AAL0FjD026965
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 Nov 2023 21:00:15 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 237822006C;
 Fri, 10 Nov 2023 15:00:15 -0600 (CST)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 20:59:59 +0000
Message-ID: <20231110210001.58405-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100175
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100174
X-Proofpoint-ORIG-GUID: Yls4HGu2PX-w0Z0KnLEjSVTxDRPPz63m
X-Proofpoint-GUID: Yls4HGu2PX-w0Z0KnLEjSVTxDRPPz63m
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311100175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=u8zAaANRVIPAgaS3F6zkjkVIK1Qz3FZXhBEOtIJM1fI=;
 b=DQg4JUG9wA/BZOk6XnQ7KvdtJkAhJ8xAaywg6RQLAU3VQoNS2iAz0Wy6hzy7meGbfI6L
 TktZMA/zK8RfC7m0tWXUSQzlN8nJmIG4RHwqvyC3C4CWqWhrF/7625xurRMqzMjrmysk
 8/s0gn1f/ZGL1dcdkEXdDdEx1B1jpvLMny+KWtG4pf7eUhhdqgG0ycC1xmw6fFyZHpp+
 GJhipvcV8f+ssSuTv6KPnOfjgKU3EmqJ7zVTustNJaOMoNhqz5mKOumm6ntsN3eFlBdS
 ryVbNt8o/YESR04SGTBMdXXG91JFL8tGrWD04jQ/CrcCdXwfO9EyZqwzCyY1YUQnjUgA jQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=DQg4JUG9
Subject: [Buildroot] [PATCH 1/2] package/memtest86: bump to version 6.20
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
Cc: Steve Kenton <skenton@ou.edu>, Brandon Maier <brandon.maier@collins.com>,
 Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Abhishek Anand <abhishek.anand@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kalpesh Panchal <kalpesh.panchal2@collins.com>

- bumped package version to 6.20
- as 6.20 prebuilt version is not available on same download site but
  source code is released at https://github.com/memtest86plus/memtest86plus/releases
  so updated mk file to download source from git release
- prebuilt binary not found in 6.20 package and also README.md
  does not mention any toolchain limitation for compilation
  so added source build command depending on 32-bit or 64-bit x86 target.
- corrected License file name
- installed memtest binaries to image folder like other bootable
  images(grub , kernel) are copied.
- updated config help as per package README.md

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Abhishek Anand <abhishek.anand@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/memtest86/Config.in      | 30 ++++++++++++++++++++++--------
 package/memtest86/memtest86.hash |  4 ++--
 package/memtest86/memtest86.mk   | 26 +++++++++++++++++++-------
 3 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/package/memtest86/Config.in b/package/memtest86/Config.in
index 79c0161020..81c69e0222 100644
--- a/package/memtest86/Config.in
+++ b/package/memtest86/Config.in
@@ -14,14 +14,28 @@ config BR2_PACKAGE_MEMTEST86
 	  back again and verifies whether the result of the read is the
 	  same as what was written to memory.
 
-	  Memtest86+ will only work on 32-bit or 64-bit x86 targets.
-	  It boots as an i486 program and autodetects hardware. It can
-	  be added to the grub2 boot menu by adding the following
-	  lines to the bottom of /boot/grub/grub.cfg - note the use of
-	  linux16.
-
-	  menuentry "Memtest86+" {
-	    linux16 /boot/memtest86+.bin
+	  Memtest86+ will only work on 32-bit or 64-bit x86 targets. It
+	  boots and autodetects hardware. Refer README.md for boot
+	  options.
+
+	  It can be loaded and run either directly by a PC BIOS (legacy
+	  or UEFI) or via an intermediate bootloader that supports the
+	  Linux 16-bit, 32-bit, 64-bit, or EFI handover boot protocol.
+
+	  It can be added to the grub2 boot menu by adding the following
+	  lines to the bottom of grub.cfg
+
+	  Example for legacy BIOS using the Linux 16-bit boot protocol
+
+	  menuentry "Start Memtest86+, use built-in support for USB keyboards" {
+	      linux16 /boot/memtest.bin console=ttyS0,115200 keyboard=both
+	  }
+
+	  Or for UEFI BIOS using the Linux 32-bit or 64-bit boot
+	  protocols.
+
+	  menuentry "Start Memtest86+, use built-in support for USB keyboards" {
+	      linux /EFI/BOOT/memtest.efi console=ttyS0,115200 keyboard=both
 	  }
 
 	  Other boot loaders will have similar requirements.
diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 559ae0ac6c..df4699c63b 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  142127b7953fbd829b1057fb64a78d3340c2b771484230a7347e94530a0d9039  memtest86+-5.01.tar.gz
-sha256  2e15e2174b86640d7fbfcb62b51d9182062d9db71d66a46e5b01d736c68150ea  README
+sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86+-6.20.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index eb071cc29d..332157ab26 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,15 +4,27 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 5.01
-MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
-MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
+MEMTEST86_VERSION = 6.20
+MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
 MEMTEST86_LICENSE = GPL-2.0
-MEMTEST86_LICENSE_FILES = README
+MEMTEST86_LICENSE_FILES = LICENSE
+MEMTEST86_INSTALL_IMAGES = YES
+MEMTEST86_INSTALL_TARGET = NO
 
-# memtest86+ is sensitive to toolchain changes, use the shipped binary version
-define MEMTEST86_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/precomp.bin $(TARGET_DIR)/boot/memtest86+.bin
+ifeq ($(BR2_i386),y)
+MEMTEST86_BUILD_DIR = build32
+else
+ifeq ($(BR2_x86_64),y)
+MEMTEST86_BUILD_DIR = build64
+endif
+endif
+
+define MEMTEST86_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
+endef
+
+define MEMTEST86_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.* $(BINARIES_DIR)/
 endef
 
 $(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
