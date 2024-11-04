Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08178D1BDFF
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF62460668;
	Mon,  4 Nov 2024 21:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBtBc6_mAPC9; Mon,  4 Nov 2024 21:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC0AE60748
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC0AE60748;
	Mon,  4 Nov 2024 21:40:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7EF3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B987404E9
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNm3kiRwYEGU for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 907CE40507
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 907CE40507
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 907CE40507
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:40:03 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GdLMJ026107;
 Mon, 4 Nov 2024 21:40:02 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42n9eshuwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2024 21:40:02 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.135])
 by xusxph004rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4Le1BU007491
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2024 21:40:01 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 4A4Le1t8008965
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 4 Nov 2024 21:40:01 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id D9B04201DD6F;
 Mon,  4 Nov 2024 15:40:00 -0600 (CST)
Date: Mon, 04 Nov 2024 21:39:55 +0000
MIME-Version: 1.0
Message-Id: <20241104-rock5b-uboot-uuid-v1-1-0f2f34d87778@collins.com>
X-B4-Tracking: v=1; b=H4sIACo/KWcC/x3MTQqAIBBA4avErBtQUfq5SrTIHGsIMjQjiO6et
 PwW7z2QKDIl6KsHIl2cOOwFsq5gXqd9IWRXDEooLaXQGMO8GYvZhnBizuywaZX2xnVeaQulOyJ
 5vv/nML7vB+ghAEtjAAAA
X-Change-ID: 20241104-rock5b-uboot-uuid-7824f5d9f24b
To: buildroot@buildroot.org
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel <cassel@kernel.org>,
 Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_20,2024-11-04_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_20,2024-11-04_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=521
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040174
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=567 spamscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040174
X-Proofpoint-ORIG-GUID: z-_yhx2O5mpNQbLuFvvSEFNppm_ViumV
X-Proofpoint-GUID: z-_yhx2O5mpNQbLuFvvSEFNppm_ViumV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_20,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 mlxlogscore=630 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2411040174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=UdDsrHEktfSZdbNnyLWiUiuxVXwe6jch5X/gL5HSLk0=;
 b=OSR7kCXWLimuBDeY+uxLWjydg+PM9tCy5HqAX5YK0pRLuHhXWj8MbW+MCk5FPvRWvh7x
 SMEof5IHuGNWtpO+9U4nMnbLA9X+VjzRfXjj6zZ2XMweayLjiXVVrauSqcoaL6wBuJ/b
 34gKcd3IwSLXUDkxL1YqArxL2nS7B8t7dWt6IVKSegMjAAi1XDFl2pXivTLCiXfOynAJ
 owSM+Fz1s7LWq0pLeBAYyCEv2vpa1GU0ac8CUVREtTxjpyTRnf6kFLQAJf8/a3NaPVBQ
 0BCi4ButlqpyqT7B8Po6D4gLy+xFS+3yTHKsICH/P2w6aiorWFvRMslJJOAN8O/RV3Wx Hw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=OSR7kCXW
Subject: [Buildroot] [PATCH] configs/rock5b_defconfig: add missing U-Boot
 build dependency
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

When building the rock5b with BR2_PER_PACKAGE_DIRECTORIES enabled, the
following error occurs from U-Boot.

  tools/mkeficapsule.c:19:10: fatal error: uuid/uuid.h: No such file or
  directory
     19 | #include <uuid/uuid.h>
        |          ^~~~~~~~~~~~~

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index af748a5d25a2b2be3f72d6d93d413be04c5a59a8..38b5aad206229f57925480820c94487b2db5365b 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y

---
base-commit: d74a5a218fabee928abb347086648ad142f7d5a5
change-id: 20241104-rock5b-uboot-uuid-7824f5d9f24b

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
