Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00CCC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 02:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52BE141E5F;
	Fri,  3 May 2024 02:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyqbEEjzj_yV; Fri,  3 May 2024 02:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763A141E53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763A141E53;
	Fri,  3 May 2024 02:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87B241BF39E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2D183342
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsXOdPVa4lB4 for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 02:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59697831CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59697831CB
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59697831CB
 for <buildroot@buildroot.org>; Fri,  3 May 2024 02:00:23 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 442HR1Mx022763; Fri, 3 May 2024 02:00:21 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xv1cvjue4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2024 02:00:21 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44320Jop006236
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2024 02:00:19 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44320JQt018980
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 3 May 2024 02:00:19 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 2B7F43004994;
 Thu,  2 May 2024 21:00:19 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 01:59:57 +0000
Message-ID: <20240503020000.3168109-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425195816.2758964-1-brandon.maier@collins.com>
References: <20240425195816.2758964-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_01,2024-05-02_03,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_01,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030012
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405030012
X-Proofpoint-ORIG-GUID: iYLF40G6C6aDcxjXxbgqiSUi-kE4rcEa
X-Proofpoint-GUID: iYLF40G6C6aDcxjXxbgqiSUi-kE4rcEa
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=ePoVp6YWQ65VczXvjC403oRHll5dmpYPirWdUfUURXA=;
 b=OKdFQlemxbsHzEQDGtFhm4DAJxeHaeb/CjihO4TyRwwSfplVrFVQsZs9ADPldTKbjepm
 3Jcm5zJ3aWi0iFXO72JwMsnfOadCSSAWaIKrrOsZmFN8QuROOvzyobEQ2T1DjcPwio16
 tw1aTg6o2W66GJ/w7krX5ILzF29R8gQf5HwcOpxkbCepFhR2OM+5+QBcxbBk83EYH3vq
 V6im4ISpxhG+10aA2/mFqbvpLjCIYcmmPgPoM8SOrNdoJsoT4K6LKmBKG+HnV3iEsMSz
 pJn1VS2wH25X5QhtG7m5sAx8DID/Rq3NpVV/VZNdS40cGwVdydRKs4tUDOsPxLqLtt3J kg== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=OKdFQlem
Subject: [Buildroot] [PATCH v3 1/4] package/bats-support: new package
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This library provides support functions needed by the bats-assert and
bats-file libraries.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-support which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-support/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
v2:
- fix older versions of install that don't support -D with -t

v3:
- fix commit subject to be 'new package'
- switch 'install' to '$(INSTALL)'
- install with 0755 permissions
- remove unneeded quotes
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/bats-support/Config.in         |  8 ++++++++
 package/bats-support/bats-support.hash |  5 +++++
 package/bats-support/bats-support.mk   | 18 ++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/bats-support/Config.in
 create mode 100644 package/bats-support/bats-support.hash
 create mode 100644 package/bats-support/bats-support.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5d198567d8..7fc46d6b43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -540,6 +540,7 @@ F:	package/ncdu/
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
+F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
diff --git a/package/Config.in b/package/Config.in
index 38e9c94198..f1da714418 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,6 +170,7 @@ endmenu
 menu "Development tools"
 	source "package/avocado/Config.in"
 	source "package/bats-core/Config.in"
+	source "package/bats-support/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bitwise/Config.in"
 	source "package/bsdiff/Config.in"
diff --git a/package/bats-support/Config.in b/package/bats-support/Config.in
new file mode 100644
index 0000000000..24b49cee1d
--- /dev/null
+++ b/package/bats-support/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BATS_SUPPORT
+	bool "bats-support"
+	depends on BR2_PACKAGE_BATS_CORE # runtime
+	help
+	  bats-support is a supporting library providing common
+	  functions to test helper libraries written for Bats.
+
+	  https://github.com/bats-core/bats-support
diff --git a/package/bats-support/bats-support.hash b/package/bats-support/bats-support.hash
new file mode 100644
index 0000000000..847f39e7c7
--- /dev/null
+++ b/package/bats-support/bats-support.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  7815237aafeb42ddcc1b8c698fc5808026d33317d8701d5ec2396e9634e2918f  bats-support-0.3.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-support/bats-support.mk b/package/bats-support/bats-support.mk
new file mode 100644
index 0000000000..765e08ffce
--- /dev/null
+++ b/package/bats-support/bats-support.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bats-support
+#
+################################################################################
+
+BATS_SUPPORT_VERSION = 0.3.0
+BATS_SUPPORT_SITE = $(call github,bats-core,bats-support,v$(BATS_SUPPORT_VERSION))
+BATS_SUPPORT_LICENSE = CC0-1.0
+BATS_SUPPORT_LICENSE_FILES = LICENSE
+
+define BATS_SUPPORT_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-support/src
+	$(INSTALL) -m 0755 $(@D)/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-support
+	$(INSTALL) -m 0755 $(@D)/src/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-support/src
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
