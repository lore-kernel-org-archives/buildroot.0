Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AC5C00A94
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 416104149D;
	Fri, 12 Apr 2024 21:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEOA8DQxihkA; Fri, 12 Apr 2024 21:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C71541C59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C71541C59;
	Fri, 12 Apr 2024 21:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 941081BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8175F60640
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Nb_H7i-2uL4 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5241660612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5241660612
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5241660612
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:09:16 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43CH2X83007809; Fri, 12 Apr 2024 21:09:14 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xf2wnpdtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2024 21:09:13 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 43CL95jw027540
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Apr 2024 21:09:12 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 43CL95et006969
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 12 Apr 2024 21:09:05 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id D309C3027DD4;
 Fri, 12 Apr 2024 16:09:04 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 21:08:49 +0000
Message-ID: <20240412210850.17265-3-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412210850.17265-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_17,2024-04-09_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_17,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404120152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404120152
X-Proofpoint-ORIG-GUID: MEeUHNTadAWnXwe1xXzLZgDwebOpd9As
X-Proofpoint-GUID: MEeUHNTadAWnXwe1xXzLZgDwebOpd9As
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404120151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=OpI6mNjAwSC4ErDk2wjqUEzyHjkNkgwwapwq6F3H86U=;
 b=PNxWMfgZ2BfOC0lRYQQcvoTkqAzGmV0xAA3xpIUADNWJAxZZEOwcaMexr7iRfHYX4j7T
 tqSy4IcalbP3aqA0pVhgevq2QWCY1/Nqhi2w+dOSLP6PaaFC77olEFmZyNQjG9vgf9ZP
 rYTYKI7xpmxVXgdnMBSNVsRMHXzq7Fb7e3vm8sLtfx4KlTnchHf1ym58RdyqbMU/zpX+
 svtArtYp7HO/Y5IQREvtpQNW4iNggSiXB95lF03I0KlSZfdOGy1zoyNb/9uiQVPp64o3
 c+q4KCTp9b3Q8sbDp2+AYtiFb72umY0cyDzAITDxtK4pGJYv1Ri+pQpDuRJUtuUZwCRS vg== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=PNxWMfgZ
Subject: [Buildroot] [PATCH 3/4] package/bats-assert: add bats-assert library
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

bats-assert is a helper library providing common assertions for Bats.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-assert which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-assert/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/bats-assert/Config.in        | 16 ++++++++++++++++
 package/bats-assert/bats-assert.hash |  5 +++++
 package/bats-assert/bats-assert.mk   | 17 +++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/bats-assert/Config.in
 create mode 100644 package/bats-assert/bats-assert.hash
 create mode 100644 package/bats-assert/bats-assert.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 846dc987a4..4bac9c9d1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -540,6 +540,7 @@ F:	package/ncdu/
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
+F:	package/bats-assert/
 F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
diff --git a/package/Config.in b/package/Config.in
index eef0ccc588..9d54fd3817 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,6 +170,7 @@ endmenu
 menu "Development tools"
 	source "package/avocado/Config.in"
 	source "package/bats-core/Config.in"
+	source "package/bats-assert/Config.in"
 	source "package/bats-support/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bitwise/Config.in"
diff --git a/package/bats-assert/Config.in b/package/bats-assert/Config.in
new file mode 100644
index 0000000000..78fa0ac4d5
--- /dev/null
+++ b/package/bats-assert/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_BATS_ASSERT
+	bool "bats-assert"
+	depends on BR2_PACKAGE_BATS_CORE # runtime
+	select BR2_PACKAGE_BATS_SUPPORT # runtime
+	help
+	  bats-assert is a helper library providing common assertions
+	  for Bats.
+
+	  In the context of this project, an assertion is a function
+	  that perform a test and returns 1 on failure or 0 on success.
+	  To make debugging easier, the assertion also outputs relevant
+	  information on failure. The output is formatted for
+	  readability. To make assertions usable outside of @test
+	  blocks, the output is sent to stderr.
+
+	  https://github.com/bats-core/bats-assert
diff --git a/package/bats-assert/bats-assert.hash b/package/bats-assert/bats-assert.hash
new file mode 100644
index 0000000000..94c3908ab3
--- /dev/null
+++ b/package/bats-assert/bats-assert.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd  bats-assert-2.1.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-assert/bats-assert.mk b/package/bats-assert/bats-assert.mk
new file mode 100644
index 0000000000..ec4858af7c
--- /dev/null
+++ b/package/bats-assert/bats-assert.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# bats-assert
+#
+################################################################################
+
+BATS_ASSERT_VERSION = 2.1.0
+BATS_ASSERT_SITE = $(call github,bats-core,bats-assert,v$(BATS_ASSERT_VERSION))
+BATS_ASSERT_LICENSE = CC0-1.0
+BATS_ASSERT_LICENSE_FILES = LICENSE
+
+define BATS_ASSERT_INSTALL_TARGET_CMDS
+	install -Dm 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-assert"
+	install -Dm 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-assert/src"
+endef
+
+$(eval $(generic-package))
-- 
2.29.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
