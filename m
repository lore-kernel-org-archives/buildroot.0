Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB771C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4224405FB;
	Fri, 12 Apr 2024 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M22FNPmaJxCb; Fri, 12 Apr 2024 21:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85D5B40B52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85D5B40B52;
	Fri, 12 Apr 2024 21:09:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E97EC1BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D402B8136E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDBbhvn3TGIS for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E008881364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E008881364
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E008881364
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:09:11 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43CF3j4h006376; Fri, 12 Apr 2024 21:09:09 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xf792bkbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2024 21:09:09 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 43CL97b4014333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Apr 2024 21:09:07 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 43CL97If006842
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 12 Apr 2024 21:09:07 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 4FF8D3027DD4;
 Fri, 12 Apr 2024 16:09:07 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 21:08:50 +0000
Message-ID: <20240412210850.17265-4-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412210850.17265-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_17,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404090011
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404120152
X-Proofpoint-ORIG-GUID: 7_RcgaqCvflOe48zyc39KKwExwvDTt8p
X-Proofpoint-GUID: 7_RcgaqCvflOe48zyc39KKwExwvDTt8p
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404120152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=rdvMLPK0bp5hDqvOsT7zhG+SaxpTNDSIOXcxyqzNb0A=;
 b=j9KlOY8XwDBFVvHez3zyw8K6hb2ShxqVs5VtzMx/NECt8LXOU1jqFH7b3j9g6Oe9oHGm
 731mNJ5qxzQKqP1ZFkyV911wNf1sFpBkEptjl8GlZG9M/jXeXzIGHpsuMtwpRv+xOr7I
 8fgi53u2sPsGyLmOMaEDmGSQLRINpkvlewhezoTvPSsGCjoQcxi2g0q2MK19gquCDDcq
 b3Nqxp2hnbCNrcgXuJP5P5EPWODtrKIBjfNteuJ1+1VVpgnAl9XQeDmLmFUgmY60ozjn
 27pTK4VHHh7Cr9aTp4sjFz4JesqJUNmB/f8kgSxVxhpQQ+VW99yacUsGM8ScNrtuK6vn mw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=j9KlOY8X
Subject: [Buildroot] [PATCH 4/4] package/bats-file: add bats-file library
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

bats-file is a helper library providing common filesystem related
assertions and helpers for Bats.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-file which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-file/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/bats-file/Config.in      | 15 +++++++++++++++
 package/bats-file/bats-file.hash |  5 +++++
 package/bats-file/bats-file.mk   | 17 +++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/bats-file/Config.in
 create mode 100644 package/bats-file/bats-file.hash
 create mode 100644 package/bats-file/bats-file.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4bac9c9d1b..d2c45c905f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -541,6 +541,7 @@ N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
 F:	package/bats-assert/
+F:	package/bats-file/
 F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
diff --git a/package/Config.in b/package/Config.in
index 9d54fd3817..e71421c2ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -171,6 +171,7 @@ menu "Development tools"
 	source "package/avocado/Config.in"
 	source "package/bats-core/Config.in"
 	source "package/bats-assert/Config.in"
+	source "package/bats-file/Config.in"
 	source "package/bats-support/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bitwise/Config.in"
diff --git a/package/bats-file/Config.in b/package/bats-file/Config.in
new file mode 100644
index 0000000000..fa9312c9e4
--- /dev/null
+++ b/package/bats-file/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_BATS_FILE
+	bool "bats-file"
+	depends on BR2_PACKAGE_BATS_CORE # runtime
+	select BR2_PACKAGE_BATS_SUPPORT # runtime
+	help
+	  bats-file is a helper library providing common filesystem
+	  related assertions and helpers for Bats.
+
+	  Assertions are functions that perform a test and output
+	  relevant information on failure to help debugging. They return
+	  1 on failure and 0 otherwise. Output, formatted for
+	  readability, is sent to the standard error to make assertions
+	  usable outside of @test blocks too.
+
+	  https://github.com/bats-core/bats-file
diff --git a/package/bats-file/bats-file.hash b/package/bats-file/bats-file.hash
new file mode 100644
index 0000000000..9530dc6d9d
--- /dev/null
+++ b/package/bats-file/bats-file.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  9b69043241f3af1c2d251f89b4fcafa5df3f05e97b89db18d7c9bdf5731bb27a  bats-file-0.4.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-file/bats-file.mk b/package/bats-file/bats-file.mk
new file mode 100644
index 0000000000..dda2d17475
--- /dev/null
+++ b/package/bats-file/bats-file.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# bats-file
+#
+################################################################################
+
+BATS_FILE_VERSION = 0.4.0
+BATS_FILE_SITE = $(call github,bats-core,bats-file,v$(BATS_FILE_VERSION))
+BATS_FILE_LICENSE = CC0-1.0
+BATS_FILE_LICENSE_FILES = LICENSE
+
+define BATS_FILE_INSTALL_TARGET_CMDS
+	install -Dm 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-file"
+	install -Dm 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-file/src"
+endef
+
+$(eval $(generic-package))
-- 
2.29.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
