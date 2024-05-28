Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662A5C25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 15:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA4D940AFC;
	Tue, 28 May 2024 15:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnYAKt4oF2X3; Tue, 28 May 2024 15:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40D2414F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40D2414F8;
	Tue, 28 May 2024 15:29:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 608061D29D4
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 15:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 498FA6063D
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 15:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5XC4Bv_804Q for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 15:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32AC9605B1
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32AC9605B1
 for <buildroot@buildroot.org>; Tue, 28 May 2024 15:29:53 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44SEsTjZ004130
 for <buildroot@buildroot.org>; Tue, 28 May 2024 15:29:53 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yb8pcpbbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 28 May 2024 15:29:52 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44SFTpkx027666
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Tue, 28 May 2024 15:29:51 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44SFTokZ026929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 28 May 2024 15:29:50 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 708AE3027DCA;
 Tue, 28 May 2024 10:29:50 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 15:29:48 +0000
Message-ID: <20240528152948.86337-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=849 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405280116
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=806 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280115
X-Proofpoint-ORIG-GUID: GsHYz4g5PYj_bIbzmr2ZR6SZpIE9otuQ
X-Proofpoint-GUID: GsHYz4g5PYj_bIbzmr2ZR6SZpIE9otuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=941 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405280115
X-Mailman-Original-DKIM-Signature: =?UTF-8?Q?v=3D1; _a=3Drsa-sha256;
 _c=3Drelaxed/relaxed; _d=3Dcollins.com; _h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:date:from:message-id:mime-versi?=
 =?UTF-8?Q?on:subject:to;_s=3DPOD051818;_bh=3DkeCo5U+cyKTxZHS2bF/6u3qMnXoD?=
 =?UTF-8?Q?h2uLVhmMJhGmFWg=3D;_b=3Dp68+3PVZu5XG7FSd3NYW+ngPCXjWIUAGFCWLhzc?=
 =?UTF-8?Q?sFS3VpwSFNhal4Ju8prkmWkzQneRr_ch1X/9McZSJeeJHLRsZmn0013h2kJYBrF?=
 =?UTF-8?Q?I5/1xtUYma1iOVYmChfxH/Ju/TmV9awzEei_SIElwEGdqj97pBoD1KUtDskmqXa?=
 =?UTF-8?Q?UtNMWN1czvu36+fNdEwBoqATks/Wp/taVxIphsIoO_VuD+iqnFFkmGzmHJ7e3Mp?=
 =?UTF-8?Q?TIyjnezZVOMyewI99CGdoX5uQ8QRBVZTPSYo2bPRkzrKxOf_q6tSy1kg/VJ2gxo?=
 =?UTF-8?Q?STCgCXrVu3rU8IVD5ic8phZKOhGd2Fi5a32iKT0yX7fb38OOEGeNq_wA=3D=3D_?=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
Subject: [Buildroot] [PATCH] package/pkg-utils: add 'hash_files' to show-info
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/pkg-utils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d1964299af..8970a2a8b9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -176,6 +176,13 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"hash_files": [
+		$(foreach f, $($(1)_HASH_FILES),$(call mk-json-str,$(f))$(comma))
+	],
+	"no_check_hash_for": \
+		$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES), \
+			false, \
+			$(if $(filter $($(1)_SOURCE),$(BR_NO_CHECK_HASH_FOR)),true,false)),
 endef
 
 define _json-info-fs
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
