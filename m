Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C0EC7EE23
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 13:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B2A082FA5;
	Wed, 31 May 2023 13:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B2A082FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R24rVyr_llaz; Wed, 31 May 2023 13:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A5482F77;
	Wed, 31 May 2023 13:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A5482F77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5C91BF5A7
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 13:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54C5A61257
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 13:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C5A61257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiY7LBHNTRKf for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 13:46:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF1C605E9
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDF1C605E9
 for <buildroot@buildroot.org>; Wed, 31 May 2023 13:46:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VCn5pP012865; Wed, 31 May 2023 15:46:07 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx3671ycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 15:46:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C3D510002A;
 Wed, 31 May 2023 15:46:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E6A823D3F6;
 Wed, 31 May 2023 15:46:06 +0200 (CEST)
Received: from localhost (10.201.20.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 15:46:05 +0200
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Wed, 31 May 2023 15:46:00 +0200
Message-ID: <20230531134600.1548430-1-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.20]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_03,2023-05-22_02
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=L8f60qgpQgcgoaCcmknPjD+M+GL4jsI5YqSymDBQchk=;
 b=vZuP+hqRGSYj6yFiKoxVQ8hhvc/2d6SJ/Ko13OpFYXRTvBoXuPSGoj0byEVQZSjW4TwT
 VMiUOPw1fkDRZft9Rv0Nri7N4CTFysxDTu0cZzlQHpHlGuwDHLFXJ47QnL126j84pXYq
 OODTm4tNk2lINdRcnV11U3wlAiFJcE0U/AUIVwbj7yquebsnFpcbT2Rf5yk7Jebe1VZP
 tGqdzaYyA8kubMXFa0+aTlUfqSXHQqZFR9up5i9t8AurQ0IaF+TPV3trtwf7BOpzkSKd
 CK2LAZFTgp6/dr/3CjbFLSwnh+lUs6Lbq9yv2ODdwM7PJ70WkqL7MlDwuLiULUMqNyKv gw== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=vZuP+hqR
Subject: [Buildroot] [PATCH] DEVELOPERS: update etienne carriere e-mail
 address
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updates my e-mail address.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e76717e845..7aa5980df7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -862,7 +862,7 @@ F:	package/szip/
 N:	Esben Haabendal <esben@haabendal.dk>
 F:	package/python-kiwisolver/
 
-N:	Etienne Carriere <etienne.carriere@linaro.org>
+N:	Etienne Carriere <etienne.carriere@foss.st.com>
 F:	boot/optee-os/
 F:	package/optee-client/
 F:	package/optee-examples/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
