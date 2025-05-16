Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E98C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 22:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A82A41A15;
	Fri, 16 May 2025 22:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB3k0IYgs86e; Fri, 16 May 2025 22:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A259E417AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A259E417AA;
	Fri, 16 May 2025 22:30:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FAC91DE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2536841776
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maFhWQj1oJW5 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 22:30:42 +0000 (UTC)
X-Greylist: delayed 520 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 May 2025 22:30:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 336E64177A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336E64177A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com;
 envelope-from=prvs=4231729db3=brandon.maier@collins.com; receiver=<UNKNOWN> 
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 336E64177A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:30:42 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GG2hiu018080;
 Fri, 16 May 2025 22:30:41 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 46p0gay7b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 May 2025 22:30:40 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.135])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GMUdto020677
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 May 2025 22:30:40 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 54GMUd2r023722
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 May 2025 22:30:39 GMT
X-Received: from kirk.rockwellcollins.lab (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 0CE4F3026D78;
 Fri, 16 May 2025 17:30:39 -0500 (CDT)
X-Received: from kirk.rockwellcollins.lab (localhost [IPv6:::1])
 by kirk.rockwellcollins.lab (Postfix) with ESMTP id D515F12837AC;
 Fri, 16 May 2025 17:30:38 -0500 (CDT)
Date: Fri, 16 May 2025 17:30:27 -0500
MIME-Version: 1.0
Message-Id: <20250516-mtd-2-3-0-revert-v1-1-7f19b06acf09@collins.com>
X-B4-Tracking: v=1; b=H4sIAIK8J2gC/x2MQQqAMAzAviI9W9gqFfEr4kFdpz04ZRMRZH93e
 AwkeSFJVEnQVy9EuTXpEQrYuoJlm8IqqK4wkCE2bFvcL4eEDRosusQLqZtZvDXMfoGSnVG8Pv9
 yGHP+AIZ7pKhiAAAA
X-Change-ID: 20250516-mtd-2-3-0-revert-28b5ef1055fc
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505160220
X-DMZapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505160220
X-Proofpoint-ORIG-GUID: QwgacEgNkMpE9lBMTHaGJYUXfp1i7ZxV
X-Proofpoint-GUID: QwgacEgNkMpE9lBMTHaGJYUXfp1i7ZxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIyMCBTYWx0ZWRfXzYjoUsyEBsrY
 wk5xQKBiqyOdTZH81QqjNSoGxU45YlGagB/X37PM3CflGDpkB5Sv8sIyoTeQcRTnAg+8BjFEO1f
 kxziUMAikIa9gnB8kRt8EPuiodxrviX8XLiDbwY9AuwkVvGxh/IoJhagE9dckjnsZYKHbl5aVNF
 pal2E0Lz0O+IcrSVF9YLQNIGu9zVnzMmK1Iyi9h2OwTBrfcWHbe4vo4i1lYI7GZuQEUR7u/Bjg0
 vREyE4hriCWsiovg+H1q6sPv/inf9SJ0Qz71FRJX66qxFNw9LXyiucYnvL+4z3q++g+HaBuqGDZ
 0b8emndHo5ZiIXlTcmNysstGeBk4RS2p5qhGkS/4CI1USSKOzCar9E62MPwo3TXNK+YD2Ij56a1
 HaGR0UHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-CPOD-Spam-Details: rule=outbound_default_notspam policy=outbound_default
 score=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505160220
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=RllSZ5eGV2NKAdmIGh0IdhXggxc0IuQixEoFIZMM8fU=;
 b=B7pQ3CNdb33TNgt/E7KTH60wdqWwIDD6j1KHSgVpUSnrqVzLIjnBKRw/z1YZ3J4Al7In
 j9cRqy+W9wwFS2EavfliHgCOp1GrWdlS4E9Fsjll9WosS4dLL/YtxOOtsUeqoTXXlfud
 GL3t+lSRNRvwTg2A9kMjGkNI1kLcuc630SChwoM0WeLI5Vov9rntHpgj4pTK18JGQwBs
 G8x9+olsSA16FZ4MoUeDzg98346I9e+bwBHfdnGRAwm7CtY8fc7gVs+T743CG95wv1BI
 s3qntBqvEumJNEyrbv0S7vTJsnhnk+SAzpRyPrdiC+RGiti195FbRinXduz6inICMFX4 Iw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=B7pQ3CNd
Subject: [Buildroot] [PATCH] package/mtd: revert update to 2.3.0
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mtd package fails to compile when BR2_PACKAGE_MTD_TESTS=y is enabled
with the following error.

> make[1]: *** No rule to make target
> 'tests/ubifs_tools-tests/images/good.gz', needed by 'all-am'.  Stop.

This issue was reported upstream and a patch submitted. However we can't
apply the patch to fix the problem. The issue is that a file is missing
from the released tarball, so only a new MTD release can fix it.

This reverts commit 0c230eef9075a37248488ecf0a877012115f7b58.

Upstream: https://lore.kernel.org/linux-mtd/20250220112554.2150046-1-m.olbrich@pengutronix.de/
Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 84b9e83bff25814421e40bb9545cfa1af83007eb..0eb90a5118be19ca20c84b1c6d04c22b62330054 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc
-sha256  2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598c10  mtd-utils-2.3.0.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
+sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 4ff43a1dce6662d1c5365ce4da1f1a622d80ab7b..77050e7e40b6244c632c8298f6de52de8e2e485b 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.3.0
+MTD_VERSION = 2.2.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -12,7 +12,6 @@ MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
-MTD_DEPENDENCIES = host-pkgconf
 
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -29,7 +28,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += zlib
+MTD_DEPENDENCIES += host-pkgconf zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -44,7 +43,7 @@ MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux
+MTD_DEPENDENCIES += util-linux host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
@@ -84,7 +83,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-pkgconf host-acl host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \

---
base-commit: 6cd8f95346aaf7dd7c26e83d263969e5406420bd
change-id: 20250516-mtd-2-3-0-revert-28b5ef1055fc

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
