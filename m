Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967FC4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF1E60676;
	Thu, 25 Apr 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcL4YzcvIwa7; Thu, 25 Apr 2024 19:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6FEB6069D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FEB6069D;
	Thu, 25 Apr 2024 19:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 944411BF2F5
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 803714024A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1JqSiAsI0Zv for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 19:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A59140245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A59140245
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A59140245
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 19:58:49 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43PJaBvQ015133; Thu, 25 Apr 2024 19:58:47 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xq24gm18j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2024 19:58:47 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 43PJwkcu015266
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Apr 2024 19:58:46 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 43PJwkcd015844
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Apr 2024 19:58:46 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id E24383003A9A;
 Thu, 25 Apr 2024 14:58:45 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 19:58:14 +0000
Message-ID: <20240425195816.2758964-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412210850.17265-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250143
X-Proofpoint-GUID: vnDLmHvtr4EGM_LtNAn-EM-K1DVP3nJT
X-Proofpoint-ORIG-GUID: vnDLmHvtr4EGM_LtNAn-EM-K1DVP3nJT
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404250143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=EgW7MDievT2Fsk0aWLWKA2djzJSjLvAcPocVrqVrtq0=;
 b=DxF48+Xmd3v5wNGZ/ArR/afxayNQ2IX6K50Pf5OTUn/LGHw2GDHnPGvqY7jEDUs4UlND
 wpXLuy0igCRGWaMCdJ4YTziP41KC2CN/1PGtVzw1IcKJgW+mPnJ7FmPS+BAxVmfo1FMZ
 0AjkYzvykdu+J8xxob0YyAaBF+9iePBRPkLHPITCvlGe0BxhZAVpJt/msJRBjBhu0FQa
 v0IOmIC4mv80HdsizsG1ULNp2laHvnzpOICm8KdhTtFlEwAwmo3SLLA+plPS8Yi856KX
 BmBNls7xg/TZAWGGfxQgvE3PEZq1yMx0E2yKe9zDS1krvmYD7BiCEdtPkIB7cKI38TxX wQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=DxF48+Xm
Subject: [Buildroot] [PATCH v2 2/4] package/bats-support: add bats support
 library
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
Changes v1 -> v2:
- fix older versions of `install` that don't support -D
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
index 399b2931ff..846dc987a4 100644
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
index 1935077f0f..eef0ccc588 100644
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
index 0000000000..37c69c7d62
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
+	install -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-support/src
+	install -m 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-support"
+	install -m 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-support/src"
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
