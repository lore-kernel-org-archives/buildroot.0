Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC96C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 02:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5A941E51;
	Fri,  3 May 2024 02:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5q8G60WlxUD; Fri,  3 May 2024 02:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827D441E53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 827D441E53;
	Fri,  3 May 2024 02:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384541BF39E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22D848333F
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Euz2kUmRzSZB for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 02:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 028F8831CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028F8831CB
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 028F8831CB
 for <buildroot@buildroot.org>; Fri,  3 May 2024 02:00:29 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 442KPXFg016827; Fri, 3 May 2024 02:00:27 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xv930gpq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2024 02:00:27 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44320PMO006273
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2024 02:00:26 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44320PtZ016750
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 3 May 2024 02:00:25 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id DACDB3003A91;
 Thu,  2 May 2024 21:00:24 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 01:59:58 +0000
Message-ID: <20240503020000.3168109-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503020000.3168109-1-brandon.maier@collins.com>
References: <20240425195816.2758964-1-brandon.maier@collins.com>
 <20240503020000.3168109-1-brandon.maier@collins.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030012
X-Proofpoint-GUID: 9z7suGIVvZLiuk7du_ZzZxSSq7NeER6Y
X-Proofpoint-ORIG-GUID: 9z7suGIVvZLiuk7du_ZzZxSSq7NeER6Y
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2405030012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=koGN8CHrtj/bdq96N3V2LK7nccvOYhb6M00Juy7zh5Q=;
 b=FihjOzJq++Vh/7QZvnus/2cbprjo5tL2hUYQbQ6UNdIHXqW5qs1HVzoSSywnP9jR2qpa
 eTqqvluvhpjNDR4QGz9c0DATcZlyzd4Hf+zRZU0pxZ3uPk6wcESq4MVw+/4g7QvEZYyU
 yajNaq6AL6B4z9G09gkqhXUSV6OZHSojMZ/DdpdHD7eT2XcBWsn5M3wiRASLwzleUkIM
 yOJMFmbTnl1zzFDWLkfH5UGEGzAUzaNcm9hCgx1+VT1ie5P0KT/v0GiFDzfotte2YLuP
 aSMRzI0dtrNXteCCUleMvZz6D/rYXuLRSgG8Ta+AQ/jCM7Ena8Uf90ULqTS1Nu+3wkj4 UQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=FihjOzJq
Subject: [Buildroot] [PATCH v3 2/4] package/bats-assert: new package
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
v2:
- fix older versions of install that don't support -D with -t

v3:
- fix commit subject to be 'new package'
- switch 'install' to '$(INSTALL)'
- install with 0755 permissions
- remove unneeded quotes
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/bats-assert/Config.in        | 16 ++++++++++++++++
 package/bats-assert/bats-assert.hash |  5 +++++
 package/bats-assert/bats-assert.mk   | 18 ++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/bats-assert/Config.in
 create mode 100644 package/bats-assert/bats-assert.hash
 create mode 100644 package/bats-assert/bats-assert.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fc46d6b43..2dfd5afd34 100644
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
index f1da714418..673fc9a811 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ endmenu
 
 menu "Development tools"
 	source "package/avocado/Config.in"
+	source "package/bats-assert/Config.in"
 	source "package/bats-core/Config.in"
 	source "package/bats-support/Config.in"
 	source "package/binutils/Config.in"
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
index 0000000000..c0e37e0048
--- /dev/null
+++ b/package/bats-assert/bats-assert.mk
@@ -0,0 +1,18 @@
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
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-assert/src
+	$(INSTALL) -m 0755 $(@D)/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-assert
+	$(INSTALL) -m 0755 $(@D)/src/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-assert/src
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
