Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6FCC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 16:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D61EA80FB1;
	Mon, 29 Jul 2024 16:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYAom1abkKOu; Mon, 29 Jul 2024 16:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D301481220
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D301481220;
	Mon, 29 Jul 2024 16:19:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54D551BF4D5
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 16:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42384400C7
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 16:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtM0rrugxtUJ for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 16:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 532BD400E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532BD400E8
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 532BD400E8
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 16:19:36 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46TD5A6I017853; Mon, 29 Jul 2024 16:19:35 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40mt9a6999-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2024 16:19:34 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TGJCCC016254
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2024 16:19:12 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46TGJBja030627
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 29 Jul 2024 16:19:12 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id BDBD43026D7A;
 Mon, 29 Jul 2024 11:19:11 -0500 (CDT)
Date: Mon, 29 Jul 2024 16:19:07 +0000
Message-Id: <20240729-pkg-kconfig-ppd-v1-0-36c901c73a7b@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPvAp2YC/x3MMQqAMAxA0atIZgNaqqJXEQdpkhqEWloQoXh3i
 +Mb/i+QOSlnWJoCiW/NeoWKvm3AHXvwjErVYDpju8nMGE+Pp7uCqMcYCQdx1pKMRNJDrWJi0ec
 /rtv7fo5BKyNhAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxlogscore=592 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290109
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=548 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290109
X-Proofpoint-GUID: l_KKHvMCWC6LsLg2WfgxBRXpbDXpo7fR
X-Proofpoint-ORIG-GUID: l_KKHvMCWC6LsLg2WfgxBRXpbDXpo7fR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 mlxlogscore=681
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2407290110
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=UsTnbK05E0CoD4qrFh/sVQhMSTpScAZ2Zzx9o1fwFd4=;
 b=gernQZ1ZMcrLJhLr3DNNxGdq7JLFInJaV6D97j+hpAnJaUZzPQbRNWw0gXNoVtR31nYg
 7R+3kBy+2lZlStwrmv+tZnw+uTh8fS++M6uz9JOl2hHDdTv1xfQczddOmV5f95PpTxBN
 mqjXpx8OhtNUDsZHxUt7f/wQ4fMPgrsJa7GhhhyFCdPwgzE234dnq5JkTFPUMo3oD4K8
 lo9bbzSrBlqb9/1A1jnvL5XY5pgLBE4AQHQxkDP6X1aXwkPxRqGt1tjMojHh0o8grDRA
 G5uASwG+R+tHnDnE97jcPEyG9HoOlNehLis7m8ibBZEuLoqd/QZA9P2dg0OHbauXwF/W SQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=gernQZ1Z
Subject: [Buildroot] [PATCH 0/3] package/pkg-kconfig: fixes for
 per-package-directory
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
Cc: Nathaniel Roach <nroach44@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (3):
      package/pkg-kconfig: fix *-savedefconfig under ppd
      package/pkg-kconfig: fix *-diff-config under ppd
      package/pkg-kconfig: cleanup savedefconfig MAKE

 package/pkg-kconfig.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 520ca083dfec4ad5ce7977bed478e2285ce93b07
change-id: 20240729-pkg-kconfig-ppd-5fc44df6ddf1

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
