Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD272CEFC21
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 15:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C121405C3;
	Tue,  8 Oct 2024 15:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6-AaF8ZZzE3; Tue,  8 Oct 2024 15:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D17D405E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D17D405E6;
	Tue,  8 Oct 2024 15:58:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 322DF1BF36F
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2106260690
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmMWw8JcmY_J for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 612CE60600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 612CE60600
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 612CE60600
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498D5ElT011422;
 Tue, 8 Oct 2024 15:57:55 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 424ryb6pn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Oct 2024 15:57:55 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 498FvrCh008667
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 15:57:54 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 498Fvrrk017324
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Oct 2024 15:57:53 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id EADB72023699;
 Tue,  8 Oct 2024 10:57:52 -0500 (CDT)
Date: Tue, 08 Oct 2024 15:57:52 +0000
MIME-Version: 1.0
Message-Id: <20241008-check-package-requirements-v1-3-a137acc133e6@collins.com>
References: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
In-Reply-To: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=945 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=974 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080101
X-Proofpoint-ORIG-GUID: CKo0N9AFrZfcDqmSQgxVR96kknB269kY
X-Proofpoint-GUID: CKo0N9AFrZfcDqmSQgxVR96kknB269kY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410080101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=lhVeMWUxulNCdKpwibbK1DgzObiSualwMnIReg/0r58=;
 b=hd7kervOKxmQzM+iVnUNG99G9nnDokVWUI0LS4oBl1Y0bj14liTJdL6ybDIHyNaQo25b
 doigQflLcrBL0VxEzqVqmpNYGgRW18JDJThW3uTZ41qZbF20GW8jUaZhmTrk12A0O5H3
 h+vFH6KwKoS626RxOD9S/MBTuKev2FyhzEN6oaMNOSdrLWAoBNnzEekNTdxdDyUUMvzI
 VoQd/hZ4zmMbYvgLhBUA8oGFFZZD8IEW77eyV9dWYNhLF0WX8VqJteRChALrHTFjxKwh
 AQF3wd7nen3gwPAZYnzisG71jgpF81ptsg4mxVCyjUxGPSq3uae0FS3XQf+cFZCQVJrU Dw== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=hd7kervO
Subject: [Buildroot] [PATCH 3/3] docs/manual/adding-packages-tips: mention uv
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
