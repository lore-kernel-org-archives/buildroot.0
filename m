Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA80C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 14:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A58AC6107F;
	Tue, 18 Feb 2025 14:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkrZLpir2mg3; Tue, 18 Feb 2025 14:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A5361066
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A5361066;
	Tue, 18 Feb 2025 14:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A35A3E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8780F81760
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1ZUw2cTzhcd for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 14:55:07 +0000 (UTC)
X-Greylist: delayed 3021 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 18 Feb 2025 14:55:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22FB380C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22FB380C66
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22FB380C66
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:55:06 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ICpCff011835
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:04:46 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 44vs1v9b3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:04:46 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.135])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IE4ioE030607
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:04:44 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 51IE4i1q004181
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:04:44 GMT
X-Received: from kirk.rockwellcollins.lab (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 7BA2030016B0;
 Tue, 18 Feb 2025 08:04:44 -0600 (CST)
X-Received: from kirk.rockwellcollins.lab (localhost [IPv6:::1])
 by kirk.rockwellcollins.lab (Postfix) with ESMTP id 7465D12808B7;
 Tue, 18 Feb 2025 08:04:44 -0600 (CST)
Date: Tue, 18 Feb 2025 08:04:37 -0600
MIME-Version: 1.0
Message-Id: <20250218-mtd-2-3-0-v1-1-5a726b3f2890@collins.com>
X-B4-Tracking: v=1; b=H4sIAHSTtGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ML3dySFF0jXWNdA91EU1Njk7RUozQTYxMloPqCotS0zAqwWdGxtbU
 A2vu7MFsAAAA=
X-Change-ID: 20250218-mtd-2-3-0-a5534fe2f434
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502180107
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502180106
X-Proofpoint-ORIG-GUID: OKblIqOhfPe_IKScABC_OZ2hnKGAi24V
X-Proofpoint-GUID: OKblIqOhfPe_IKScABC_OZ2hnKGAi24V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502180107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=WzDem/rgURHDajcTpYt0Mo8rSN9HZvsfWPqVf2lkuAI=;
 b=uhUY5MpWUfbgSXPtx1hOvf1ZAGaw2+rCDjP8MIMTKOPnGIuHeEd49pkfMd+FxSj85izo
 mp2zAOGrcGGVCpIgqy1fs5orH4XDnvY0Dlmgu4tTlAxB5vq8Xa9lxzymOB0NCpvT/3T6
 aHsY1nKZfEqYjVtAYaDJYvu6I7yoAEvXvzGrzvyX0c6wPYtsvFWZpJZw4v6ZxJVV23MN
 r7u2ZYfGohWDgrqVEkDXzx8qCkutpItqhbv3Yz6cdbnA0gVDem6fRv4xMzjjpcpT6QcR
 8UmhHj9d+/iJV2SYm32hIhdRRmL8cp3Sg2WZFHnwyH7/sU8xXNNrjk1Xp0sXRasJnHlu qw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=uhUY5MpW
Subject: [Buildroot] [PATCH] package/mtd: update to 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md

The TestMtd build fails with the following error

  checking pkg-config is at least version 0.9.0... ./configure: line
  5375: .../output/TestMtd/host/bin/pkg-config: No such file or
  directory

So we promote host-pkgconf to be a required dependency for the build.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 0eb90a5118be19ca20c84b1c6d04c22b62330054..84b9e83bff25814421e40bb9545cfa1af83007eb 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
-sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc
+sha256  2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598c10  mtd-utils-2.3.0.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40b6244c632c8298f6de52de8e2e485b..4ff43a1dce6662d1c5365ce4da1f1a622d80ab7b 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.1
+MTD_VERSION = 2.3.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -12,6 +12,7 @@ MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
+MTD_DEPENDENCIES = host-pkgconf
 
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -28,7 +29,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += host-pkgconf zlib
+MTD_DEPENDENCIES += zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -43,7 +44,7 @@ MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux host-pkgconf
+MTD_DEPENDENCIES += util-linux
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
@@ -83,7 +84,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-pkgconf host-acl host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \

---
base-commit: 3761177a89a78c83a102d811efd0079ed01a3abb
change-id: 20250218-mtd-2-3-0-a5534fe2f434

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
