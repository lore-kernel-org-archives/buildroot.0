Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637BDC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 19:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE70C417AD;
	Tue, 28 Nov 2023 19:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE70C417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ei_ZL70K0E_5; Tue, 28 Nov 2023 19:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33477417A9;
	Tue, 28 Nov 2023 19:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33477417A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8D011BF311
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 19:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0DAC60C02
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 19:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0DAC60C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDvHja9n2yx4 for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 19:55:15 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B33D60B77
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 19:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B33D60B77
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASFvsv3025008; Tue, 28 Nov 2023 19:55:14 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3une3dxbce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 19:55:14 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3ASJtDoI022074
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 19:55:13 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3ASJtDWg005920
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 28 Nov 2023 19:55:13 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id E143D20043;
 Tue, 28 Nov 2023 13:55:12 -0600 (CST)
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 19:55:07 +0000
Message-ID: <20231128195507.5291-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_22,2023-11-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_22,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=373 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280159
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=342 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280158
X-Proofpoint-ORIG-GUID: 2rgeNZaxaceW8W6RcEtdbTUR-lPZjGJz
X-Proofpoint-GUID: 2rgeNZaxaceW8W6RcEtdbTUR-lPZjGJz
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=473 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=8YIEm+9leDiiaDY6CzKTxdhePTvSM6MLTKgEKJylgDc=;
 b=V4grK67uXK0/QLB9Tejs4bOJokmghEhOdgRLI7LUGBGvAnJC93alSCcIYz95MZZ5YmZ0
 9FwyiMrHiNwU3ZtEM4pBIOQoEfrZ3e/u9uxKEmaX0WoadbDjZBdRlUISK+R1e5MJMxoW
 mfn3Rz70s8dI6RGBbUOR+becz8yT8qFAEJhKEIUM94mIufsNBreuLrINgRVgtJJk+bJe
 AKwgY58nb85neoU95tEk5KkGPCYfGy9Wi9IjgFdxBTpD9B8bDSOMBxosHFvBPIMOXSv2
 L9zttMkVROqKpKAfSgeGFlZ6h9qMc6/e8eVwuqIgxz3EbGvMWvoAetyTDB1e0mm9eA/c 2Q== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=V4grK67u
Subject: [Buildroot] [PATCH 1/1] docs/website: fix favicon
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

When the favicon image was added in f26e61319f3f (docs/website: add
favicon.png), it was added to a different directory then where the header's
icon link points. This causes the favicon to fail to load with 404.

While we are here, remove the "shortcut" rel attribute as it is non-standard
and it's recommended not to use it[1].

[1] https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel#sect4

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 docs/website/header.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/header.html b/docs/website/header.html
index e1909291f6..548ed7ad53 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -6,7 +6,7 @@
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<meta name="Buildroot" content="">
 	<meta name="angelo.compagnucci@gmail.com" content="">
-	<link rel="shortcut icon" href="images/favicon.png">
+	<link rel="icon" href="favicon.png">
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
