Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A01CC5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 18:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D7B41969;
	Fri,  8 Mar 2024 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8A1ObDd9XWol; Fri,  8 Mar 2024 18:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C09041977
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C09041977;
	Fri,  8 Mar 2024 18:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4561BF228
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AB2460B16
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKQrH6KUEwb7 for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 18:43:14 +0000 (UTC)
X-Greylist: delayed 987 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 08 Mar 2024 18:43:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 382F8606F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382F8606F9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 382F8606F9
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 18:43:13 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 428GXBW7032278; Fri, 8 Mar 2024 18:26:45 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3wqw7hdt8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Mar 2024 18:26:44 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 428IQhBT011957
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 8 Mar 2024 18:26:44 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 428IQhtK019377
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 8 Mar 2024 18:26:43 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 3289220378;
 Fri,  8 Mar 2024 12:26:43 -0600 (CST)
To: buildroot@buildroot.org
Date: Fri,  8 Mar 2024 18:26:37 +0000
Message-ID: <20240308182637.37011-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403080147
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403080147
X-Proofpoint-ORIG-GUID: tuONSfwjcO2AB0CFW1_EQk-mxs1oU5dg
X-Proofpoint-GUID: tuONSfwjcO2AB0CFW1_EQk-mxs1oU5dg
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403080147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=LptriqdzRiU7jJl6ZolB9TUYchOIGqi0kv6NmFAu4x4=;
 b=uf4vFo5yNVTvgT6rDHiIRoQhmdoPfpVjbZ8wGFODL/IjxX2nxH7jvkHeuvoq8RhyGFHt
 nhrORoXESUUWyF9qrM5DfAdvqLoA9OvrLJq4WE7kl60bViRiDzKvIZWH/CDWHQXV9ZNl
 M7/xjlliQmiHj/57cHg1+c06JK5nRonVta16KEmmNw4Oiq82M1qVbottPL+dODjsTqEg
 Nl6eVq4WaqTjopPu4ws6HmFl97+wUWnMJg4JzBq+MfGREhvzsB5pqctUuw99N9rnMuBn
 m/PWTfSFlIYdNyovutOP8gFA8V1NoG7BcAw4EAGugDweU3/hLD/3Nll9SadeHzCT0Q2G 4Q== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=uf4vFo5y
Subject: [Buildroot] [PATCH 1/1] package/ccache: require host gcc of at
 least 8
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ccache 4.9.1 requires a host gcc of at least 8.
See "Build-time support" at
https://ccache.dev/platform-compiler-language-support.html

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 113adf0755..14b74d3590 100644
--- a/Config.in
+++ b/Config.in
@@ -318,8 +318,12 @@ config BR2_JLEVEL
 	  Number of jobs to run simultaneously. If 0, determine
 	  automatically according to number of CPUs on the host system.
 
+comment "ccache needs a host gcc >= 8"
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 config BR2_CCACHE
 	bool "Enable compiler cache"
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	help
 	  This option will enable the use of ccache, a compiler cache.
 	  It will cache the result of previous builds to speed up future
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
