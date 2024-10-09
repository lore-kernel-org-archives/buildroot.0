Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD60CCEDD9C
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853E640782;
	Wed,  9 Oct 2024 14:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLkU_D1PpQQZ; Wed,  9 Oct 2024 14:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C90407A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C90407A4;
	Wed,  9 Oct 2024 14:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 093461BF420
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05BEA80EEC
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VIJ6lNHhnJO for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 14:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41E3980F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E3980F5E
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41E3980F5E
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 14:15:06 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499D1IGu002469;
 Wed, 9 Oct 2024 14:15:06 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4255r8bqww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2024 14:15:06 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EF4jB005223
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2024 14:15:04 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 499EF4fR007025
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Oct 2024 14:15:04 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 8CEA81002750;
 Wed,  9 Oct 2024 09:15:04 -0500 (CDT)
Date: Wed, 09 Oct 2024 14:14:55 +0000
Message-Id: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN+PBmcC/42NQQ6CMBBFr0JmbU1bDBBX3sOwKONgJ0ALLRIN6
 d2tnMDlez95f4dIgSnCtdgh0MaRvcugTwWgNe5Jgh+ZQUt9UVI2Ai3hIGaDg8ljoOXFgSZyaxR
 Nhx32GnVdIeTAHKjn9xG/t5ktx9WHz/G1qZ/9K7spIYVRZW0QVVlSdUM/juziGf0EbUrpC5b0U
 UDGAAAA
X-Change-ID: 20241008-check-package-requirements-8bcbcf2c276c
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=409 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090088
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 mlxlogscore=452 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-ORIG-GUID: jLOw6Ejy7dgL100yDCztJY31E-ynpyJZ
X-Proofpoint-GUID: jLOw6Ejy7dgL100yDCztJY31E-ynpyJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=518
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410090088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=gVJQFouOOWzrWfY3EYvriG/ncxqD0pgDG67pmlA8Wf8=;
 b=B9OuhHM9DHRZxo0LUZSriLGooeTaN9CKXkckqRGnk8Y8uQLxnoHZ8YFVkStRUTL0f3R2
 STuDFuAHOpvBdfJ+L9iTd+U1e2iTX9ETgXsRReA2dA1iXpWUs5Ojfv/GptKBm/GQtdZ2
 UTbtsrHC3U8s5GW2cl29DKqnb02hs1l4z7QqFaD8UW9um1h9Uh46RkBf5HQ4ENtm3+Dx
 y0VbqveLaGrxYN5nYlVCaEHWgcUA568SZLYeah29RX32NILRjUDfHNs6zUNHd8TBfgO0
 TTVvb1cmg59zjU5CzWHEGFaAmgTlcxbNh89TAbmShDl2I16drFxGPwTqkJ8XTd01VJtC sA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=B9OuhHM9
Subject: [Buildroot] [PATCH v2 0/3] utils/check-package: make check-package
 easier to run
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Try to make `utils/check-package` easier to run with Python's inline
script requirements. See the second patch for a detailed description.

We also attempt to document the requirements for running check-package.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Changes in v2:
- fix utils/check-package to use Python v3.9 [Arnout]

---
Brandon Maier (3):
      docs/manual/adding-packages-tips: mention check-package requirements
      utils/check-package: add inline script requirements
      docs/manual/adding-packages-tips: mention uv

 docs/manual/adding-packages-tips.adoc | 17 +++++++++++++++++
 utils/check-package                   |  7 +++++++
 2 files changed, 24 insertions(+)
---
base-commit: 09964bc5c0f8b329cda6383a1297029354269da9
change-id: 20241008-check-package-requirements-8bcbcf2c276c

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
