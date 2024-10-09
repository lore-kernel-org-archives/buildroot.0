Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A61CEDD9C
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188E9406DB;
	Wed,  9 Oct 2024 14:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aqGFJ7ZEh7I; Wed,  9 Oct 2024 14:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19C840781
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D19C840781;
	Wed,  9 Oct 2024 14:15:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9231BF420
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9995380EF4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iw1HG5LzmrkM for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 14:15:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF78F80ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF78F80ED9
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF78F80ED9
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 14:15:23 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499D2X6r024399;
 Wed, 9 Oct 2024 14:15:22 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42537n59g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2024 14:15:22 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EF5vs009873
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2024 14:15:21 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 499EF4S8014533
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Oct 2024 14:15:05 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id A74AE1002753;
 Wed,  9 Oct 2024 09:15:04 -0500 (CDT)
Date: Wed, 09 Oct 2024 14:14:56 +0000
MIME-Version: 1.0
Message-Id: <20241009-check-package-requirements-v2-1-df3e7b79788b@collins.com>
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
 malwarescore=0 spamscore=0 mlxlogscore=946 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=989 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-GUID: B8CRhvoGq5kZdPf_2gAbOJ6huQroGPFJ
X-Proofpoint-ORIG-GUID: B8CRhvoGq5kZdPf_2gAbOJ6huQroGPFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=tkbjbHE1nDZhfLUARMQItRXyXeo5ULGtJVdMIbxJk5g=;
 b=oaYnFrpgjjxg+wIy6HHmrsAsVN3zpu01upeTmBQvCFX/bQL279uttNGwtb7Z6tvpdICh
 QDSOy+zuMkV2b/JrMGHBZn46joyFXjTADwtQLyIrdSJ6bJv7j3nTXy/9o/cIaHFXMU8E
 mZpUPXM71d85gnU+dkUS3wr0rzIQYq3LsruVyxfL5hWdKJsdTTVSdJSX6XCv3UNdIzyI
 VoTe2l8P4vNH1fmSRJBqbUG/+J0g2lP76Gnhw/TH9hRG6eDSrLdmkH0ZhdBUZ8OzC3wP
 hAhQnwwnzY8M8MofCssK2hB6YtnbXLsvEEqlyEEtEHUjeX88e7+QMx74SsqGlhMls817 Hg== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=oaYnFrpg
Subject: [Buildroot] [PATCH v2 1/3] docs/manual/adding-packages-tips:
 mention check-package requirements
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
