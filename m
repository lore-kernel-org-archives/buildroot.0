Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B3C3DA7E
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 16:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB99281298;
	Mon, 29 Jul 2024 16:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5B_h154QWYh; Mon, 29 Jul 2024 16:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6195C8122D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6195C8122D;
	Mon, 29 Jul 2024 16:19:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3F041BF4D5
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 16:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0A344056C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 16:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvNsidUHyCkq for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 16:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F021B40565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F021B40565
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F021B40565
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 16:19:15 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46TD1VAF005019
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 16:19:15 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40mskrpa69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 16:19:15 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TGJDY3016370
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 16:19:14 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46TGJCYs002760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 16:19:13 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id A9E773026D6B;
 Mon, 29 Jul 2024 11:19:12 -0500 (CDT)
Date: Mon, 29 Jul 2024 16:19:10 +0000
MIME-Version: 1.0
Message-Id: <20240729-pkg-kconfig-ppd-v1-3-36c901c73a7b@collins.com>
References: <20240729-pkg-kconfig-ppd-v1-0-36c901c73a7b@collins.com>
In-Reply-To: <20240729-pkg-kconfig-ppd-v1-0-36c901c73a7b@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=701 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290109
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=674 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290109
X-Proofpoint-GUID: egcZqrwW4oCSJkE04ViGUVGabxn12qAg
X-Proofpoint-ORIG-GUID: egcZqrwW4oCSJkE04ViGUVGabxn12qAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=775 mlxscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=g5Sm/s7VRC3oYzaREg0HEZGYdAVVOXpFDn46npFm58k=;
 b=b/lwipMe2OdwGS2wnYJPb85D0FMbBk8VWwoFB3/QK3vZwSaj/q7f9VETmpRseKhw2H2o
 DCSlKb+MGxlJDnIkyHwBeUJLjqDiM67FEh0074RxXAbZPMW4d8YYtfap+LWiQAZ74hs/
 ArHqhIHJkfz2k+SeBkl2O93KKQVEQsvGSiHqRtvMXTszfzghPHG87zNv15GudEDqKyPl
 OGP0fgL2kDfLM9OHMve0dWOgYvpWWNh7Cz//yMxqhwEW2ANfRFIkBYfFQhV9lvzdEAPP
 lYl4+97wVDAkGxbtAFeAppAmE1kKZOb4nkWqW+Y3f8K5KkEFaJICDQZgIwO+Ed2IzbSo GQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=b/lwipMe
Subject: [Buildroot] [PATCH 3/3] package/pkg-kconfig: cleanup savedefconfig
 MAKE
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

The kconfig infra defines a 'PKG_KCONFIG_MAKE' var that wraps all the
standard kconfig options. Switch to this so we aren't duplicating the
logic.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/pkg-kconfig.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 684342bcef..8000de16c4 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -33,8 +33,7 @@ PKG_KCONFIG_COMMON_OPTS = \
 # Macro to save the defconfig file
 # $(1): the name of the package in upper-case letters
 define kconfig-package-savedefconfig
-	$($(1)_MAKE_ENV) $($(1)_MAKE) -C $($(1)_DIR) \
-		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) savedefconfig
+	$($(1)_KCONFIG_MAKE) savedefconfig
 endef
 
 # The correct way to regenerate a .config file is to use 'make olddefconfig'.

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
