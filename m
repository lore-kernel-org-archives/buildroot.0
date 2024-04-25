Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E4C19F4E
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E43161355;
	Thu, 25 Apr 2024 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIHR6ZmLS92F; Thu, 25 Apr 2024 19:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D03C61383
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D03C61383;
	Thu, 25 Apr 2024 19:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE7A1BF21A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A57C817A1
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id le6o--JZhw2S for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 19:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 005D88176D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005D88176D
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 005D88176D
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 19:59:04 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43PJaAA5005740; Thu, 25 Apr 2024 19:59:02 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xqtb5tw6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2024 19:59:02 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 43PJwn27020523
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Apr 2024 19:58:49 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 43PJwmXC023161
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Apr 2024 19:58:48 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 388D53003A9A;
 Thu, 25 Apr 2024 14:58:48 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 19:58:16 +0000
Message-ID: <20240425195816.2758964-4-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412210850.17265-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404090011
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250143
X-Proofpoint-ORIG-GUID: Rfm4tHecaMZOt-3K9gNn35Q9SW9LC14e
X-Proofpoint-GUID: Rfm4tHecaMZOt-3K9gNn35Q9SW9LC14e
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404250144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=wcSqkrWQ1Q3HXEKqbuAeMGgXM2Y0l7TjZ94my6SUdBg=;
 b=Y37YFu8PAx85ECd7B4G4UEeg8aPRg3TFSB6MHX8nQlVhMck9A8c9Jtf8njkGIOOAc6/x
 BMLJRMDwI5IqOGVhiD890nk/ZKNf8hG+p9HnNu6lEO2LUNTYHMqkFvR80G26Z0ayh0He
 sb60JmPlzsR51yiOYpxbIPxMMJsrnW1q9D/4f9XDbyoLUO/+FbTfmewtibJUepM5uEZg
 5Ms4n1JXK8lX5A/uiHUQHNmSh/raVy5Ou23i1PPsdYzM71Ka7B+4CnGXebOP7sdGKDVX
 5BEfwij2kWjJeMBoh7u9uUnI9LutmECB2MFHS6LX4fPnzz+oDdkU0QFlYK5j7RyRns+P DQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=Y37YFu8P
Subject: [Buildroot] [PATCH v2 4/4] package/bats-file: add bats-file library
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
Changes v1 -> v2:
- fix older versions of `install` that don't support -D
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/bats-file/Config.in      | 15 +++++++++++++++
 package/bats-file/bats-file.hash |  5 +++++
 package/bats-file/bats-file.mk   | 18 ++++++++++++++++++
 5 files changed, 40 insertions(+)
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
index 98ff90a005..4af0e52b58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -171,6 +171,7 @@ menu "Development tools"
 	source "package/avocado/Config.in"
 	source "package/bats-assert/Config.in"
 	source "package/bats-core/Config.in"
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
index 0000000000..66c2a7b9f3
--- /dev/null
+++ b/package/bats-file/bats-file.mk
@@ -0,0 +1,18 @@
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
+	install -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-file/src
+	install -m 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-file"
+	install -m 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-file/src"
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
