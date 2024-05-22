Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B749C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 15:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C2004053D;
	Wed, 22 May 2024 15:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jEcvUf8w0EB; Wed, 22 May 2024 15:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2E740542
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E2E740542;
	Wed, 22 May 2024 15:46:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4921C5CF1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AC7960712
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9uB_dCJ9Jdp for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 15:46:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E22960687
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E22960687
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E22960687
 for <buildroot@buildroot.org>; Wed, 22 May 2024 15:46:28 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44MEXHFJ020230; Wed, 22 May 2024 15:46:25 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y8sjw8mug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2024 15:46:25 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44MFkO1K018982
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 May 2024 15:46:24 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44MFkORv002398
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 22 May 2024 15:46:24 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 1ADE81002DCE;
 Wed, 22 May 2024 10:46:24 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 15:46:16 +0000
Message-ID: <20240522154616.1265769-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220107
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405220106
X-Proofpoint-GUID: WvLujMDd_gi7WKO4YlkJpzMwLqTADwPU
X-Proofpoint-ORIG-GUID: WvLujMDd_gi7WKO4YlkJpzMwLqTADwPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405220107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=IHQ7RqOMlvEvBMBoFMYyxr+NshfVMfIJeMVU9wprAwU=;
 b=fL4linDf4YqGW8webQo4qG1L/TddTliLE3M+a42Wjz24VOpdWWQP8kBwkGWJMsXwmTUY
 /aF9gYPsYGSvWhHSLWGR+7Djwm0szGfEeZuFn8P505g0fu7+d74rCb6UWk9kc0EjSo8c
 TosFLIB4tqXfZgABLefZHJ4hnwo6anGl/D+dEb++4/aSW0ifQszo+mBgTMMPgyLFBTM7
 YVkzWdpo8uPQRq62ZICBi7H638vfRc262DpEcI5IEj1ShH79KkBcv5V71rlTV40HCJGg
 y2WW2gLz21GixulS7BHVb8JPYUmSmwH6q4DoI67aWp9EmjDf25t5SreJ+OEdTAF8bZBj 6w== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=fL4linDf
Subject: [Buildroot] [PATCH] support/testing/infra/emulator.py: fix qemu
 prompt detection
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The qemu.run() method can break when a command happens to output the
string "# " to stdout. This is because qemu.run() detects when a command
has completed by searching for the shell prompt, which by default is
"# ". It then captures everything before the "# " as the commands
output, causing the rest of output to be lost.

To work around the issue set the prompt to something more unique. This
makes it less likely to appear in command output.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/infra/emulator.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 624740fcb1..aa579443a6 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -100,6 +100,13 @@ class Emulator(object):
         index = self.qemu.expect(["# ", pexpect.TIMEOUT])
         if index != 0:
             raise SystemError("Cannot login")
+
+        # Set a prompt that is unlikely to appear in command output
+        self.qemu.sendline("PS1='br-qemu-test# '")
+        index = self.qemu.expect(["\r\nbr-qemu-test# ", pexpect.TIMEOUT])
+        if index != 0:
+            raise SystemError("Cannot set test prompt")
+
         self.run("dmesg -n 1")
         # Prevent the shell from wrapping the commands at 80 columns.
         self.run("stty columns 29999")
@@ -110,13 +117,13 @@ class Emulator(object):
         self.qemu.sendline(cmd)
         if timeout != -1:
             timeout *= self.timeout_multiplier
-        self.qemu.expect("# ", timeout=timeout)
+        self.qemu.expect("br-qemu-test# ", timeout=timeout)
         # Remove double carriage return from qemu stdout so str.splitlines()
         # works as expected.
         output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
 
         self.qemu.sendline("echo $?")
-        self.qemu.expect("# ")
+        self.qemu.expect("br-qemu-test# ")
         exit_code = self.qemu.before.splitlines()[2]
         exit_code = int(exit_code)
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
