Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6FAC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 23:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35544245F;
	Fri, 10 May 2024 23:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6etzoTS_jCg; Fri, 10 May 2024 23:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C78194246D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78194246D;
	Fri, 10 May 2024 23:55:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7381BF2B7
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 23:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29CAC615E9
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 23:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMRsUTgNGHRe for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 23:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DFCC615E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DFCC615E8
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DFCC615E8
 for <buildroot@buildroot.org>; Fri, 10 May 2024 23:55:28 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44AH6GWd025392; Fri, 10 May 2024 23:55:27 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y16mra7y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2024 23:55:27 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44ANtQkP023018
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 May 2024 23:55:26 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44ANtPrC028923
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 May 2024 23:55:26 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id A61D23026D63;
 Fri, 10 May 2024 18:55:25 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:55:09 +0000
Message-ID: <20240510235510.2454216-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405100174
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100174
X-Proofpoint-ORIG-GUID: ax4lXYbH4Ib7KZ6_ggKM62QkhP0_dutG
X-Proofpoint-GUID: ax4lXYbH4Ib7KZ6_ggKM62QkhP0_dutG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=Ixa9QVAVBs1vSGkH/wbuoPVhw9hPo8dHC5j/9eYPmfM=;
 b=G6+ehf51egpfjgPUbXA9NBcouRUK8ScsUT7f5MkwFVTh+dD92oJYxgU9S2c8GemznVHx
 b2tNue0B6O/W2N8+J4gD7bpy6EzWAWG1kYtD62bVSssVQf0So2Yw7iMYi9GgKNaBWa5n
 UgPfWSdXRukP7ieD+tQxrAoOB0zycAsQR1lsljiBFpldQjPAKW/i4W/xa+8tLyj0+58+
 V4BYHban14GgAmWNpwqDgAA0hSi+L0OIZKiU7Ms5lg6UeSU+daCjxxLRCT+Agwc1oX+V
 rwX9QWTRKb2OtTiZfD4NIuyUK5LqVDRXjwms8hK23qLc4wPw/OqLetdFnb6W6ODMQdCg +g== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=G6+ehf51
Subject: [Buildroot] [PATCH 1/2] support/testing: add zip test
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
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/tests/package/test_zip.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 support/testing/tests/package/test_zip.py

diff --git a/support/testing/tests/package/test_zip.py b/support/testing/tests/package/test_zip.py
new file mode 100644
index 0000000000..eb2e016988
--- /dev/null
+++ b/support/testing/tests/package/test_zip.py
@@ -0,0 +1,15 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestZip(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_ZIP=y
+        BR2_PACKAGE_UNZIP=y
+        """
+    compress_cmd = "/bin/sh -c 'zip $1.zip $1' /bin/sh"
+    decompress_cmd = "unzip"
+    check_integrity_cmd = "unzip -t"
+    compressed_file_ext = ".zip"
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
