Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194DDC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 15:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB98260BBD;
	Tue,  2 Jul 2024 15:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boB7to2hBJgW; Tue,  2 Jul 2024 15:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA72A60BAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA72A60BAE;
	Tue,  2 Jul 2024 15:18:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C97311BF30A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A03606FF
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_JwS_HzJJ5X for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 127136059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 127136059D
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 127136059D
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 15:18:53 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 462F5343029457
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:53 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4041ev08q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 15:18:53 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 462FIqwp020901
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:52 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 462FIpwC010063
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:52 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id C7B25100264F;
 Tue,  2 Jul 2024 10:18:51 -0500 (CDT)
Date: Tue, 02 Jul 2024 15:18:45 +0000
MIME-Version: 1.0
Message-Id: <20240702-atftp-sysvinit-v1-2-f26694337129@collins.com>
References: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
In-Reply-To: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=568 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407020113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=521
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020114
X-Proofpoint-GUID: JqNRnINoDGZYs2bFJOR8J4zOWtr_m2ie
X-Proofpoint-ORIG-GUID: JqNRnINoDGZYs2bFJOR8J4zOWtr_m2ie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=629 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=TjeOS8z0TS0VT2Cm7zIRxylTrqq3UJ7p+U/5m1JZTxY=;
 b=eKh2IeiIYPyw+F7wmmtQGBN0aM7jCmx9iMa/g2sbVFgNQSVy8g2rqu3l9OQUhhMme3xF
 iPI37aiAFgKPDHZ4b/7/VSq4pNCaSj6yDw3m6hIeC7f7OmadzpEJgZwY4CiRO+BHTm9U
 bvDcnb3ZCtqE++QC0vcCYMumBEb0s/m/Bsq2+biAFbgE9Ce5j8tLBZLeOoU48eqmEuKk
 jdBb9176qnRpEiDnx/8xLScdGKHs8c8xnk9hYJ30R05AiN+O+sRoH1vCSvG2zlD4B8bf
 okuCQUCu8yMriTqJ7bsXk/W5fLS2o2HVRYKHXF1IDAbcX3aJOvQHuitR3jMJTzznpDk7 2A== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=eKh2IeiI
Subject: [Buildroot] [PATCH 2/3] support/testing: add atftp test
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/tests/package/test_atftp.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/support/testing/tests/package/test_atftp.py b/support/testing/tests/package/test_atftp.py
new file mode 100644
index 0000000000..95e76c07cb
--- /dev/null
+++ b/support/testing/tests/package/test_atftp.py
@@ -0,0 +1,28 @@
+import os
+
+import infra.basetest
+
+
+class TestAtftp(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ATFTP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+
+        self.emulator.login()
+
+        self.assertRunOk("mkdir -p /tftpboot")
+        self.assertRunOk("echo 'Hello World' >/tftpboot/test_atftp.txt")
+
+        # atftpd is launched by /etc/init.d/S80atftpd
+        self.assertRunOk("atftp -g -r test_atftp.txt -l /tmp/test_atftp.txt localhost")
+        output, exit_code = self.emulator.run("cat /tmp/test_atftp.txt")
+        self.assertEqual("".join(output), "Hello World")

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
