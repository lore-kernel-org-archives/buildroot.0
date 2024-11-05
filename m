Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F3ED2C115
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15923608E3;
	Tue,  5 Nov 2024 14:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFi070OD0QYN; Tue,  5 Nov 2024 14:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D9F608C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D9F608C4;
	Tue,  5 Nov 2024 14:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16BE43B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9A71608A0
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRhZkxJMOJzH for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 14:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E20836089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20836089E
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E20836089E
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:29 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5E6vXj008698;
 Tue, 5 Nov 2024 14:37:28 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42qh71t70e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Nov 2024 14:37:28 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.135])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5EbRNa003711
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2024 14:37:27 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 4A5EbQC4001829
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 5 Nov 2024 14:37:27 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 89D321002A2E;
 Tue,  5 Nov 2024 08:37:26 -0600 (CST)
Date: Tue, 05 Nov 2024 14:37:19 +0000
Message-Id: <20241105-support-b4-v1-0-2963298c1a58@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ8tKmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMz3eLSgoL8ohLdJBNdE8MUM8Mki1STFDMDJaCGgqLUtMwKsGHRsbW
 1AEhE4q1cAAAA
X-Change-ID: 20240626-support-b4-41d61b8e4d60
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=329 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=376
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050113
X-Proofpoint-GUID: t1-OmMbA5L1FQI2rMm0xUBLxIWKu2vqz
X-Proofpoint-ORIG-GUID: t1-OmMbA5L1FQI2rMm0xUBLxIWKu2vqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 mlxlogscore=439 adultscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2411050113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=xM+I5P4m/MRRkBeCqhKRiG79tNzuAsEAaVo5l6qOOoc=;
 b=R8OabAmDwX+Mo1Z7Jf2NG5ncGFFR3eQS22sYd/HN+OeaeLFUXpnoo7kogmjqM0DH6X2d
 hqSYpy+cW96HmmpVXPPYtqfQ4p7d7NGJFeoxDrOj0Cqa1PQ01m7ek2fj0S0iaUaikfC9
 Y4WvhSx6kO9ff66Jbq1+4nYeR01hhXRElJoUc0KePpIFVj9oYlxq87c8cd9omX0V+umm
 +Vm1liQk1o2lZV8JSOFY2GdGz4VL6xEmsTX3vN90VpoCM2W8WGczK5/KVdFtx+uEa6tK
 oc+1zLKb1/HexGKseu1gorw1TkzF/dGYdm1k/6cVe6vE04Jo95l9b3IgB5YDSTEn2+yz iA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=R8OabAmD
Subject: [Buildroot] [PATCH 0/2] .b4-config: check patches with
 ./utils/check-package
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

NOTE: This requires `b4` version 0.14.2 or later as earlier versions had
a bug that broke custom prep-perpatch-check-cmd[1].

This series registers check-package as a `b4` "pre-flight check"[1].
This way a patch series can be checked with `b4 prep --check`, and `b4`
will warn the developer if they try to send a patch series without
running the check.

The first patch adds support for checking patch files to check-package.

The second patch registers check-package as a b4 check-cmd.

[1] https://github.com/mricon/b4/commit/0741bc9a5b45578e4d3804588dd3f63fe4848059
[2] https://b4.docs.kernel.org/en/latest/contributor/send.html#passing-pre-flight-checks-v0-14

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (2):
      utils/check-package: support finding files from patches
      .b4-config: check patches with ./utils/check-package

 .b4-config          |  1 +
 utils/check-package | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)
---
base-commit: d74a5a218fabee928abb347086648ad142f7d5a5
change-id: 20240626-support-b4-41d61b8e4d60

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
