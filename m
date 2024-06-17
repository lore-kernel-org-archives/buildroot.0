Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94769C2BA1A
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 18:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6134F413D0;
	Mon, 17 Jun 2024 18:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhI9rcNCMjMj; Mon, 17 Jun 2024 18:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 315574167D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315574167D;
	Mon, 17 Jun 2024 18:44:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 343641BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 224F1605AD
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVt6WrEz2k0F for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 18:43:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24CAB605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24CAB605A3
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24CAB605A3
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 18:43:49 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45HFCJDp027537; Mon, 17 Jun 2024 18:43:49 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ys25005t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:48 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HIhkrV016747
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:47 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45HIhkm4009819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 17 Jun 2024 18:43:46 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 6AFEF300057E;
 Mon, 17 Jun 2024 13:43:46 -0500 (CDT)
Date: Mon, 17 Jun 2024 18:43:25 +0000
MIME-Version: 1.0
Message-Id: <20240617-mtd-2-2-0-bugfixes-v1-2-a136825e24ff@collins.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=924 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406170144
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=853 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170144
X-Proofpoint-ORIG-GUID: _ku9pRp5QKNI-q-EvXUiPSKk6MTKm4RO
X-Proofpoint-GUID: _ku9pRp5QKNI-q-EvXUiPSKk6MTKm4RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 mlxlogscore=994 adultscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406170144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=e9D3pXR96/man0iVsL106+/vqEJFQ6K10RWf2N0D254=;
 b=g8J2Hg8BbkF6EE0BpeJMKkIrqzAYepDJtpDiiD7e1vENohhorp0DFUUD0jrIt3kthTdy
 WSkL0hC3M7WweaiXutP3HB4ooukc7VnLJg1UK3RdAgmBTSbPd4jutKfoNzFoRyefsXdv
 SyvO+/3JsGykVhotka7OWD9UxxzXW3J99dpjxRYGuxOJEYR+DnN1hoHnaQoSmw6VIR+W
 u81p25kSiXSmgoLm7VAel6zFRqa2Wd4bxZdPkd2/bvdW1MnBicpnSikogc0l/ap66n+Z
 s2XTBMHryLuC0WI9rXoIriznxcaRpEuTqr4lxbpevaCmE1JaDyoOzH5khXmCXBLO9/O6 Pw== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=g8J2Hg8B
Subject: [Buildroot] [PATCH 2/3] package/mtd: make lzo an optional dependency
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

Upstream fixed lzo to be an optional dependency in release 2.2.0[1]

See https://github.com/sigma-star/mtd-utils/commit/ab4628e756ab73d8193ed62b591417dad561b298

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/Config.in |  2 --
 package/mtd/mtd.mk    | 11 +++++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 3ba48da645..9e5bb1735b 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -12,12 +12,10 @@ if BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_JFFS_UTILS
 	bool
-	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
-	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_ZLIB
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index faf4c55eda..f790ef5ec4 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -20,17 +20,24 @@ MTD_DEPENDENCIES += libexecinfo
 MTD_LDFLAGS += -lexecinfo
 endif
 
+ifeq ($(BR2_PACKAGE_LZO),y)
+MTD_DEPENDENCIES += lzo
+MTD_CONF_OPTS += --with-lzo
+else
+MTD_CONF_OPTS += --without-lzo
+endif
+
 MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
-MTD_DEPENDENCIES += zlib lzo host-pkgconf
+MTD_DEPENDENCIES += zlib host-pkgconf
 MTD_CONF_OPTS += --with-jffs
 else
 MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
+MTD_DEPENDENCIES += util-linux zlib host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
