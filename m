Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A7ECDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A18F41293;
	Wed, 18 Sep 2024 20:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sOdywxTrFua; Wed, 18 Sep 2024 20:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF0E41283
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FF0E41283;
	Wed, 18 Sep 2024 20:13:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF4301BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6C34266D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoigSOOgaTqY for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:12:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDA7F427AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA7F427AC
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDA7F427AC
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:12:52 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48II2uKE015264;
 Wed, 18 Sep 2024 20:12:51 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 41r0rcc2v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:51 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 48IKCoZX029034
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:50 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 48IKCnZb014832
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Sep 2024 20:12:50 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id DDB9E971E;
 Wed, 18 Sep 2024 15:12:49 -0500 (CDT)
Date: Wed, 18 Sep 2024 20:12:38 +0000
MIME-Version: 1.0
Message-Id: <20240918-ls1046a-frwy-linux-6-6-v1-4-941f6224e052@collins.com>
References: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
In-Reply-To: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=779 mlxscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180132
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=803
 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180131
X-Proofpoint-GUID: L6f-UCMUxSMo9aUlVt8CLxN_8R0yzIc3
X-Proofpoint-ORIG-GUID: L6f-UCMUxSMo9aUlVt8CLxN_8R0yzIc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=868 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409180132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=FRcnhMVvF5HU1OVqfwgVDsyMZdQ3obCwUwpW2cjEhos=;
 b=B8+BafSjEzTRmnbxxqm3gUFyPVtup+Qi0ThyZMKQnOLH1UOQiuV1SGiaWnp1le32Mawt
 5ad+PZVHGP6IjCqP2gkGZd648afg1WCmEbMZ+sQ1h8vX++emhicF2NAt+LVq0P6EGuEE
 v2lNcvo4gJWQX3uzzwZd3WHEDjiOOA9ISybPN96yGz0dBv/dT33Tfbq0y/kIDuy4RssH
 C7HCYDHwsayLO8D91Tu84FV7Cy85s9zlisC9wrDlgHujBwj3nodhQ/nRHrbcpjsu0HVt
 ojrY29IEvwUNK46H5Eq6xO9DIUJOplHZTPXmueg/81DmCVmjykUR1nsuuIWsNa7yH0ps +w== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=B8+BafSj
Subject: [Buildroot] [PATCH 4/5] package/qoriq-fm-ucode: bump to version
 lf-6.6.23-2.0.0
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

Update this package to the same NXP software release as the ls1046a
board. The only upstream change was to rename the license file.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 board/freescale/ls1046a-frwy/readme.txt    | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 4 ++--
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 846e4ebfe30940c45f5f68dcbc62d26134f4ab48..1af6fccbf5ebdc09b92f7a3c6e29a1610e43b4f4 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -16,7 +16,7 @@ the components from NXP are:
   - rcw, LSDK 21.08
   - atf (fork), lf-6.6.23-2.0.0
   - uboot (fork), lf-6.6.23-2.0.0
-  - qoriq-fm-ucode (blob), LSDK 21.08
+  - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
   - linux (fork), lf-6.6.23-2.0.0
 
 Build
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 5c664356c034710a399163f92c8a606fbd81484a..67efd675cc26e24d5450f1f4301d1849f6cd57ff 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e431dd726c4aa1db558931d80b318149abdf71fec6e39de9d5aa33399df1fb1  qoriq-fm-ucode-LSDK-21.08.tar.gz
-sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
+sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 5dfdf1e8f8f7afc4d326bd10828cc2d42c45da8e..84360533eb1d24e71864e1ac2ee53bed35e909b4 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = LSDK-21.08
+QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
-QORIQ_FM_UCODE_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
 QORIQ_FM_UCODE_INSTALL_IMAGES = YES
 QORIQ_FM_UCODE_INSTALL_TARGET = NO
 

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
