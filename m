Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36527C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D560960FE0;
	Tue, 13 May 2025 21:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyPS1UmEYVse; Tue, 13 May 2025 21:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B8260FCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B8260FCE;
	Tue, 13 May 2025 21:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AAAE812A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BEC260FCE
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNROKdv-zlDW for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:19:08 +0000 (UTC)
X-Greylist: delayed 3242 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 May 2025 21:19:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4FAD60F42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4FAD60F42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com;
 envelope-from=prvs=42288e2dd3=brandon.maier@collins.com; receiver=<UNKNOWN> 
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4FAD60F42
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:19:08 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DJu1h8014317
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:25:06 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 46mbe717kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:25:06 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.135])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 54DKP4vJ011061
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:25:04 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 54DKP3Qp027790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:25:04 GMT
X-Received: from kirk.rockwellcollins.lab (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 96B60300498D;
 Tue, 13 May 2025 15:25:03 -0500 (CDT)
X-Received: from kirk.rockwellcollins.lab (localhost [IPv6:::1])
 by kirk.rockwellcollins.lab (Postfix) with ESMTP id 8003D1283684;
 Tue, 13 May 2025 15:25:03 -0500 (CDT)
Date: Tue, 13 May 2025 15:24:39 -0500
MIME-Version: 1.0
Message-Id: <20250513-mtd-2-3-0-v1-1-bfa48fbc955a@collins.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505130193
X-DMZapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505130193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE5MyBTYWx0ZWRfXwjZyOVu5NCaU
 0Njd1wN2w5EAtzIcD/7R+wkb+fnV0ElIp6LELOxY6qkwfn5PwH8Jb+LCOKT4rykh+eNOfQn8mcq
 tQUW4twwxMltW3oJmVOchsQzvggn9QipfRpCdFTXh2wRI1BbDZU8akyDnu4I0LsZVQzIY3BE33m
 CY6Y0wED7Ft0vcu6j6CGSzi4xg1FkZKHUSmL5iGVsoyubZZoSJJEKmrPCQ7tC078PrQJc5kSZyT
 FYrSk5Z3zBF8u5HJVzuX2bOsbqaWz6GDpOoZNpLC79lwruvF9kG7KalXJLYUsR8kWoHUsQxPKhS
 q/xiZZuIxO4jlggXW8Fge1+FuHWr0BH38jokZ0YY+lOok4QzAWDw37oEkTRTbt/qpRom1LGYGpu
 He53X2KS
X-Proofpoint-ORIG-GUID: WT0NMxld39lIBG_5fTt9XVRRu-3vHg_d
X-Proofpoint-GUID: WT0NMxld39lIBG_5fTt9XVRRu-3vHg_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-CPOD-Spam-Details: rule=outbound_default_notspam policy=outbound_default
 score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2505070000 definitions=main-2505130193
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=WzDem/rgURHDajcTpYt0Mo8rSN9HZvsfWPqVf2lkuAI=;
 b=TkF4OnDWRqKU43EX0VbPQg07llabFBL72wXaUjmKTlQB1d28YIhzJuUlGRWn2ASgbyuC
 TIcYjh0ChogiaV3WgJHNLiRzntshBOu+QwQSDUYE5a0xMW0R8hFne5KDxiiVQQR/sadx
 A7T9xDMA80VTkJQdKaBt+joqutrYUGlW2lUCig6AcxUKaLtBQqoggDa5gCrn+tGQZyeV
 AYrSfiXoxfWydFn/f2Aqav+NjxlkMW4kXL/Evl7IGk0DIjBS8rj0GEey7iDZc6O1Pdqu
 JSPb4OZlfg9fGiEDU4lhzItm1NGKg4rO43CzqqM3VEXd/RDd5G5mnS4YKRCwLxWmoAju Kg== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=TkF4OnDW
Subject: [Buildroot] [PATCH RESEND] package/mtd: update to 2.3.0
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
