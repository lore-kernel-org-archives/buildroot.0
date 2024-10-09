Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56028CEDD9B
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0154C4078E;
	Wed,  9 Oct 2024 14:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx4wV_TxPyc2; Wed,  9 Oct 2024 14:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E202C406ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E202C406ED;
	Wed,  9 Oct 2024 14:15:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 598311BF420
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4485940796
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 14:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFz04qMIe6DL for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 14:15:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B03B40628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B03B40628
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B03B40628
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 14:15:24 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499D2J1W021700;
 Wed, 9 Oct 2024 14:15:23 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 425strh90m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2024 14:15:22 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EF5wr009959
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2024 14:15:22 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 499EF46w009119
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Oct 2024 14:15:05 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id BE83E1002754;
 Wed,  9 Oct 2024 09:15:04 -0500 (CDT)
Date: Wed, 09 Oct 2024 14:14:57 +0000
MIME-Version: 1.0
Message-Id: <20241009-check-package-requirements-v2-2-df3e7b79788b@collins.com>
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
 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090088
X-Proofpoint-ORIG-GUID: sY8teqoKS_1QT3AyAlIJvY-l82ECiNTX
X-Proofpoint-GUID: sY8teqoKS_1QT3AyAlIJvY-l82ECiNTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410090088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=xOprRXQ9vbCzMJA3ZbJBcCIEuMIVmJSxO7vELynxiFY=;
 b=dsHfUAkiWese9b9xKo+xQ5Ky6rDFPDvgM7BXvYMUFzbjxsrUzcwUzOgZFnvIBLaaVaI9
 aMLExs7Hg3t/aMUN9XiABAP9qee9tUBMe4Qq6F0p+NYJSsrPey3RTQwnA8ey+pfySOfA
 o50ZwRjEV74T21TMlZCq3amPlxClmNXS/9bXW8oG8EYo2tYx2EMCvh83U1276WZ5jE8D
 O2jxQ2X0GO4LET3z58LZOJ6r9Nkt//ybut2dkn1C4hYxC/Fww4CpJT02BqZNKTMkGSm8
 sLiseFSWU/KcAuwjY3k+FybDXnv2S1mIvQmF4EmSmyfPhlZVjI8C5ySfE+fB7MgDYMoi Tw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=dsHfUAki
Subject: [Buildroot] [PATCH v2 2/3] utils/check-package: add inline script
 requirements
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

The check-package tool requires some PyPi package to be installed before
it can run. This is typically done by manually installing them into the
user's global Python environment or setting up a virtual environment,
then manually installing each dependency.

Python recently defined a format for managing script dependencies as
inline metadata[1]. This can be used with the `uv` tool to run a Python
script and automatically install the minimum required version of Python
and PyPi dependencies.

With this change, it's now possible to run check-package with

  uv run -s ./utils/check-package

Note that, because check-package does not have the '.py' file extension
we must specify the `-s` or `--script` argument. That argument was added
very recently in release 0.4.19[2].

I set the minimum python to 3.9 as that is the oldest version still
supported[3]. I verified 3.9 works by running

  uv run -p 3.9 -s ./utils/check-package `git ls-tree -r --name-only HEAD` --ignore-list=.checkpackageignore

[1] https://packaging.python.org/en/latest/specifications/inline-script-metadata/#script-type
[2] https://github.com/astral-sh/uv/releases/tag/0.4.19
[3] https://devguide.python.org/versions/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Changes in v2:
- fix utils/check-package to use Python v3.9 [Arnout]
---
 utils/check-package | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 872e66c126b8ec4d5207235d69f0c02ad1757a06..6a5e89daa3ce4f173cb21beb75122bcd40b80123 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -1,5 +1,12 @@
 #!/usr/bin/env python3
 # See utils/checkpackagelib/readme.txt before editing this file.
+# /// script
+# requires-python = ">=3.9"
+# dependencies = [
+#     "flake8",
+#     "python-magic",
+# ]
+# ///
 
 import argparse
 import inspect

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
