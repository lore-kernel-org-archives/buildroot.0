Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A2CEDD9B
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8399D407A0;
	Wed,  9 Oct 2024 14:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uKr_UeTgwq1; Wed,  9 Oct 2024 14:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A2740790
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A2740790;
	Wed,  9 Oct 2024 14:15:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 744CA1BF420
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 637BB607DE
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvDOIeyfSI2h for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 14:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE01D60071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE01D60071
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE01D60071
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 14:15:07 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499D1HXu007671;
 Wed, 9 Oct 2024 14:15:07 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42531mn6pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2024 14:15:06 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EF5tQ005227
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2024 14:15:05 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 499EF46P014547
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Oct 2024 14:15:05 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id D5F3B1002756;
 Wed,  9 Oct 2024 09:15:04 -0500 (CDT)
Date: Wed, 09 Oct 2024 14:14:58 +0000
MIME-Version: 1.0
Message-Id: <20241009-check-package-requirements-v2-3-df3e7b79788b@collins.com>
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
In-Reply-To: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=914 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 mlxlogscore=942 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-GUID: pEy5tX9Q5VL-Gf3-yMHBFJJhRbnzs_pK
X-Proofpoint-ORIG-GUID: pEy5tX9Q5VL-Gf3-yMHBFJJhRbnzs_pK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410090088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=lhVeMWUxulNCdKpwibbK1DgzObiSualwMnIReg/0r58=;
 b=M3iU5jhwT3DLnR+37POyPjjjZbN7H/d4O5kvyEP9nBemNud2SQxY7sJgItxcg9vvcD0E
 V+oUpl2GqEUHieo5OxAptZ+EYArHzJldU55ed/+NViw5KGtSh/Ojaa336zuUs88iYb3N
 5tFRd5K90LQBXhFIEsEEAFtgRX/N75k5eAgJAeYc9rsIcfQnbN8xxlUmU5J3ALIVTqZV
 rWPhWE/FeqFwxe14d4+BZlPdEnk4dJ/WefUdXZ/Mc0hKOgv4Z3XSlR5kDStlGpK4A5vN
 MyIJr09O22EEkrJvHZrgXcD3NtIFRoPIqvE7HJupQdZDQ/B+uNMqRQsxCot60S5fcsqe GA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=M3iU5jhw
Subject: [Buildroot] [PATCH v2 3/3] docs/manual/adding-packages-tips:
 mention uv
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

Mention that `uv` can be used to run check-package without installing
PyPi packages.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 docs/manual/adding-packages-tips.adoc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index 182204101413d879eb6aa4777d43abac5f48e8d5..98dfcd8988521a0a9d0739d39704b36447a77485 100644
--- a/docs/manual/adding-packages-tips.adoc
+++ b/docs/manual/adding-packages-tips.adoc
@@ -74,6 +74,13 @@ If you have Docker or Podman you can run check-package without installing depend
 $ ./utils/docker-run ./utils/check-package
 ----
 
+It can also be run directly with +uv+ version 0.4.19 or later, however you will
+still need to manually install ShellCheck.
+
+----
+$ uv run -s ./utils/check-package
+----
+
 [[testing-package]]
 ==== How to test your package
 

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
