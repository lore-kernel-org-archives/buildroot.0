Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AADFCEFC21
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 15:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38FD24056B;
	Tue,  8 Oct 2024 15:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voJagxfBdRFy; Tue,  8 Oct 2024 15:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE0340577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE0340577;
	Tue,  8 Oct 2024 15:57:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC571BF36F
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69FE740297
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22nCcdRvetWq for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 15:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 667BB40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 667BB40153
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 667BB40153
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 15:57:55 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498DM4ND011382;
 Tue, 8 Oct 2024 15:57:54 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 424ryb6pmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Oct 2024 15:57:53 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 498FvqTH019096
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 15:57:53 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 498Fvq68014277
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Oct 2024 15:57:52 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 65A0B2023693;
 Tue,  8 Oct 2024 10:57:52 -0500 (CDT)
Date: Tue, 08 Oct 2024 15:57:50 +0000
MIME-Version: 1.0
Message-Id: <20241008-check-package-requirements-v1-1-a137acc133e6@collins.com>
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
X-MHapp-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=978 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080101
X-Proofpoint-ORIG-GUID: yqwJ7h8QINVxgzfLSrdxEKv6PUL9LQFQ
X-Proofpoint-GUID: yqwJ7h8QINVxgzfLSrdxEKv6PUL9LQFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410080101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=tkbjbHE1nDZhfLUARMQItRXyXeo5ULGtJVdMIbxJk5g=;
 b=tH8yPktBScXMEz6J/OsZAPMSJSOggtBb+2mG+6k5lpvTKdIhb7W6TVPM2mzEIZvG5IT8
 9D+Nkg4auBxxw49NVAxNASkP7Q/N+DgsQHXyYBFvA2Pc6hpej15O4Dd/KSaqlM/unh09
 2zUGgFSs8JQ9XdvUKb6mQAs6GX4ucQPZWVOBx6XRV5GTmPFoDw/lgkVd6qXBJ3KMdgtK
 sN74Oc1+OyuqkL+GYVBTVyLtmMzqsABwb5qTYxyj2jUeV17MkOCDLp50IOsj1ya5Vkvj
 c49iEFbEYLApC7Q+az53cY5jwSrFNtLAgp/9igW43tjDkSRR2VfRO6wSgLtx5dm7aBlR OQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=tH8yPktB
Subject: [Buildroot] [PATCH 1/3] docs/manual/adding-packages-tips: mention
 check-package requirements
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

Call out the requirements to run check-package and mention that Docker
can be used to run check-package without installing dependencies.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 docs/manual/adding-packages-tips.adoc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index b04b42b51f92aaa2ba4dc759a3fe9db8b6ec5cfc..182204101413d879eb6aa4777d43abac5f48e8d5 100644
--- a/docs/manual/adding-packages-tips.adoc
+++ b/docs/manual/adding-packages-tips.adoc
@@ -64,6 +64,16 @@ The tool can also be used for packages in a br2-external:
 $ check-package -b /path/to/br2-ext-tree/package/my-package/*
 ----
 
+The +check-package+ script requires you install +shellcheck+ v0.7.1 and the
+Python PyPi packages +flake8+ and +python-magic+. You can use a different
+version of ShellCheck, but you may see warnings from unrelated files.
+
+If you have Docker or Podman you can run check-package without installing dependencies:
+
+----
+$ ./utils/docker-run ./utils/check-package
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
