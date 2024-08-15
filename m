Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749CFC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 14:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66C2940EDF;
	Thu, 15 Aug 2024 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiCPd97gWwPa; Thu, 15 Aug 2024 14:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B714040EC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B714040EC1;
	Thu, 15 Aug 2024 14:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E61BC1BF983
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D44E381EF3
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQkhAfyYNb23 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 14:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 194C18101B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194C18101B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 194C18101B
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 14:22:37 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47F7e7li032356; Thu, 15 Aug 2024 14:22:33 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 411dg43556-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 14:22:33 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47FEMWmd014225
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 14:22:32 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47FEMVTi032454
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 15 Aug 2024 14:22:31 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 0E7A71003B80;
 Thu, 15 Aug 2024 09:22:31 -0500 (CDT)
Date: Thu, 15 Aug 2024 14:22:29 +0000
Message-Id: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACUPvmYC/x3MSwqAMAwA0atI1gZaUVCvIi5qTDWgrbT+QLy7x
 c3A28wDkYNwhDZ7IPApUbxL0HkGNBs3McqYDIUqSlXrCgfvdzz+0sLGofUBt/WwF5KiUmnTWKY
 K0mALbOX+513/vh9BmbojbAAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=748
 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408150103
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=697 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408150103
X-Proofpoint-GUID: wEY7k9wiwlqz-6te309btFAt6UecDDMk
X-Proofpoint-ORIG-GUID: wEY7k9wiwlqz-6te309btFAt6UecDDMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=831 lowpriorityscore=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=l3/F1wQw2fjLJFy++qP4DllpFiCRJ4BPR2aSU4IOHKU=;
 b=chqSV8mUpR4hyRiyqG+P2C4PEPvj086L6qrT2MAU8PkkvtCfSXDqpUc4foyRoYZWIvf+
 MlJXtUeYc7f8TP4PTHT20YR+MArJp1NGu74bhILSgLu4ToG2BUhVp8KkJSYvtQhvaCHA
 r3mhtbhNPGkaLPqHNfqPmOhmpJ/N9WkajVe6yuiiJk89VwhzbUVApKtGKi+UqurGOI+c
 PhZCgd/CjXZdEHsOiKgZ3p3IvlHJ7W/Ve8tCGvFhSOSHAXxnB5eZHMJtphrdoi/3hjBs
 SRxYyg6W8/U3zS307WVfFbAM9Y3g2cQDA84e62uYoxeDfuSATvQcKYjMY+Doa73HwAEs xw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=chqSV8mU
Subject: [Buildroot] [PATCH 0/2] boot/uboot: clean-up for ZynqMP pmufw
 handling
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (2):
      boot/uboot: avoid setting PMUFW_INIT_FILE when not used
      boot/uboot: use $(TARGET_OBJCOPY) for ZynqMP pmufw.elf

 boot/uboot/uboot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 48e7affffa06bbe23a1cd190d0a765956cf179b0
change-id: 20240815-boot-uboot-clean-for-pmufw-c0c401a9fec5

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
