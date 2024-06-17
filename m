Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC1C2BA1A
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 18:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EDAF4029A;
	Mon, 17 Jun 2024 18:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSqsD8lensoT; Mon, 17 Jun 2024 18:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654D9402DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654D9402DC;
	Mon, 17 Jun 2024 18:43:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB30D1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F03605AD
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usMp4ok-C9S5 for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 18:43:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C13CC605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13CC605A3
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C13CC605A3
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 18:43:48 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45HFAN17005981; Mon, 17 Jun 2024 18:43:48 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ys2j380ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:47 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HIhk6R016651
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2024 18:43:46 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45HIhkKU013432
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 17 Jun 2024 18:43:46 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 4FF8B300057B;
 Mon, 17 Jun 2024 13:43:46 -0500 (CDT)
Date: Mon, 17 Jun 2024 18:43:24 +0000
MIME-Version: 1.0
Message-Id: <20240617-mtd-2-2-0-bugfixes-v1-1-a136825e24ff@collins.com>
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
 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=817 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406170144
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=774
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170144
X-Proofpoint-GUID: hcZW6i9WfN81Cy479_tkJbbmHuP91YZU
X-Proofpoint-ORIG-GUID: hcZW6i9WfN81Cy479_tkJbbmHuP91YZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=884 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406170144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=rNh96sIqwowrsXUBtHLzXsqKyiTiOifJUSmG9qXIX2s=;
 b=JmT0FtK9mj/ZfeikllnGaJUlOVIbEnM715V801pK71y0uDL+Fr9+F4QKDLKPUG5ZzsAG
 ueHd2TFzC9XU7OGzD+AKaUgXoQ6gpPAyJjOdrXuDzqxZUbKwgSqvwHZU/ExiMAYz+xTV
 ZcVnJJQVnr+c5W0/tl0L+tgU7rgh3MPChOTu/NFVi6f7Y5zwBs8HGEXJKap1aR5aZCou
 owKRUBgDC0JwTCdlhveTktysNmLPmRlSjVbFSC9qrxBCE+SOjdv2iJdWmwFUJTRAnwwa
 WXNrAdTwCSB3zkOd0wWJZ+h5p0DvbAUANR20DSNlr2p2pBdVDEBZJorfcomn3YbM8frq Og== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=JmT0FtK9
Subject: [Buildroot] [PATCH 1/3] package/mtd: fix tests compiling when
 disabled
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

Upstream changed the '--enable-tests' switch to '--with-tests' in
release 2.2.0

See https://github.com/sigma-star/mtd-utils/commit/edc83b61745e6ee7fa9c9502eb520493832b1e9c

Fixes:
- http://autobuild.buildroot.net/results/52a289c7033005b7a29b0f2bc6aa5056cbdabb34/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/mtd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index a20e00e9da..faf4c55eda 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -56,9 +56,9 @@ MTD_CONF_OPTS += --disable-ubihealthd
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
-MTD_CONF_OPTS += --enable-tests
+MTD_CONF_OPTS += --with-tests
 else
-MTD_CONF_OPTS += --disable-tests
+MTD_CONF_OPTS += --without-tests
 endif
 
 # If extended attributes are required, the acl package must
@@ -75,7 +75,7 @@ HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
 	--without-crypto \
-	--disable-tests
+	--without-tests
 
 MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/sbin/sumtool

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
