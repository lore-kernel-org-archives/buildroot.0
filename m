Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5494C27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1AD40893;
	Mon, 17 Jun 2024 18:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4B07aOuwHuM2; Mon, 17 Jun 2024 18:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888E7402F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888E7402F4;
	Mon, 17 Jun 2024 18:43:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A18BB1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C0B880BB6
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOGsqQtUzw18 for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 18:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B064480885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B064480885
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B064480885
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 18:43:49 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45HFCR6a012442; Mon, 17 Jun 2024 18:43:49 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ys4827evy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:48 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HIhlnF029884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:47 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45HIhkZl013439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 17 Jun 2024 18:43:46 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 830C130005DE;
 Mon, 17 Jun 2024 13:43:46 -0500 (CDT)
Date: Mon, 17 Jun 2024 18:43:26 +0000
MIME-Version: 1.0
Message-Id: <20240617-mtd-2-2-0-bugfixes-v1-3-a136825e24ff@collins.com>
References: <20240617-mtd-2-2-0-bugfixes-v1-0-a136825e24ff@collins.com>
In-Reply-To: <20240617-mtd-2-2-0-bugfixes-v1-0-a136825e24ff@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 mlxlogscore=961 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170144
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=890
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170144
X-Proofpoint-ORIG-GUID: kqCskePcTmQph7ogCDOdHRR7Na1-_6T8
X-Proofpoint-GUID: kqCskePcTmQph7ogCDOdHRR7Na1-_6T8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=ZhBciBf/VXiPijEfMyliDRa55ID7QE1JFZikURgrX9o=;
 b=Z7vIGxwpHskAbyAw+bvkyLhARCoR8GBJzE/gG3JH+3JIeW4FWP7fc6vID5VivGAxhI3a
 poqUmwtXQQBHxdslBZwd8hGHpDECkQCBMb7G6uAZDhrEfR3zlWcI6RVN8X1Z/GPxbWyc
 4XDyIfbrGa1qdw4SOIBcBd95lec34DDRyBEHJrjAMUTXl4jKpinY7hE0FxzqNqi2rwqS
 O6c3AEBFU3SBCAhwpGl4VS7C6cBnKbLUmxbrBLFUvJV+kKEKuZ3xKi+nn4RIrRm9q80r
 5TPkaPgB1pTZO5d0KylSMjrUYCb+5TuiyE/2CLNMmRCqUPD6H/E+stCKV3SPBs4bmAjp ag== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Z7vIGxwp
Subject: [Buildroot] [PATCH 3/3] package/mtd: make zlib an optional
 dependency
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changed zlib to be an optional dependency in release 2.2.0[1]

See https://github.com/sigma-star/mtd-utils/commit/2465754716634422620b4577e0b7ba79c4ce1a39

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/Config.in |  2 --
 package/mtd/mtd.mk    | 11 +++++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 9e5bb1735b..57a562c108 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -12,13 +12,11 @@ if BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_JFFS_UTILS
 	bool
-	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_ZLIB
 
 comment "MTD tools selection"
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index f790ef5ec4..fe40cf6c06 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -27,17 +27,24 @@ else
 MTD_CONF_OPTS += --without-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MTD_DEPENDENCIES += zlib
+MTD_CONF_OPTS += --with-zlib
+else
+MTD_CONF_OPTS += --without-zlib
+endif
+
 MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
-MTD_DEPENDENCIES += zlib host-pkgconf
+MTD_DEPENDENCIES += host-pkgconf
 MTD_CONF_OPTS += --with-jffs
 else
 MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux zlib host-pkgconf
+MTD_DEPENDENCIES += util-linux host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
