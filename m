Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2393CC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1599810BE;
	Mon, 15 Jul 2024 14:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07UUs3zprVMN; Mon, 15 Jul 2024 14:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0055810DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0055810DC;
	Mon, 15 Jul 2024 14:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9326E1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 804E060806
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsTeuPhujv4e for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BEAE6076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BEAE6076C
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BEAE6076C
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:01:03 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46FDfGAj019503; Mon, 15 Jul 2024 14:01:03 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj9rdc7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 14:01:02 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FE105w002455
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 14:01:01 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46FE10ix018925
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Jul 2024 14:01:00 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 432B83000424;
 Mon, 15 Jul 2024 09:01:00 -0500 (CDT)
Date: Mon, 15 Jul 2024 14:00:52 +0000
MIME-Version: 1.0
Message-Id: <20240715-support-testing-s6-networking-fix-v1-1-f6fe7d3fcf51@collins.com>
X-B4-Tracking: v=1; b=H4sIAJMrlWYC/x3NSw7CMAyE4atUXmOpSSkGroK6QDAUCymJ7PCQq
 t6dwPL7FzMLOUzhdOwWMrzUNaeGsOnocj+nGazXZop93PYSRvZnKdkqV3jVNLPvOKG+sz1+uum
 H4x4yyhAOAqG2Uwwt/z9O07p+AXGGtExzAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150110
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407150110
X-Proofpoint-ORIG-GUID: NWy8JGiRo9by9I_IDfNshbJJ2ryryAiy
X-Proofpoint-GUID: NWy8JGiRo9by9I_IDfNshbJJ2ryryAiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=1Ie85Juj81beZzc1aj/p6qWFm5MrbaNqr57i9aeyDdM=;
 b=ldTyLe8B4RQ3lxhTmme4HsQ1Sz7n86UjVfAjkM2U7CuNzXfUbdGmfsS21lzBkXBU8H2S
 QOPbJqB5+hY/J7ZYCbOdX+E/9EJWVgZdXNOqtlnSmy1GVPUpIcR1oq9dx/+SFNCj61iR
 F3FufDy39/YPxee5mwD7ytXERaFBiuDPFQYUlCc56HC2I8q/G+SFDn9Ac84t8+bXmN6a
 ybTyWoZKYBJTJROULfhSN9wfRy4ZTcg5A/NL4SEIM1FHs0FAh6mxSMKCnR1JJnxYUFtd
 CU+/nnBIELDv04XKzX6sZ4B/Yd2b5gvMuXTp/5B5CZu2IxlqU7S0WndKTYf65vsv9jXg QQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=ldTyLe8B
Subject: [Buildroot] [PATCH] support/testing: fix
 package/test_s6_networking.py
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

This test fails with the following error

  -sh: s6-tcpserver4: not found

In release 2.6.0.0 of s6-networking the `s6-tcpserver4` was unified into
a new `s6-tcpserver` command[1].

[1] https://github.com/skarnet/s6-networking/blob/master/NEWS#L33

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/tests/package/test_s6_networking.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_s6_networking.py b/support/testing/tests/package/test_s6_networking.py
index 1fe1b81668..bbbaefdf94 100644
--- a/support/testing/tests/package/test_s6_networking.py
+++ b/support/testing/tests/package/test_s6_networking.py
@@ -28,7 +28,7 @@ class TestS6Networking(infra.basetest.BRTest):
         self.assertEqual(output[1][0:5], "after")
 
         # Test the TCP server and client
-        _, exit_code = self.emulator.run("s6-tcpserver4 127.0.0.1 1024 cat &")
+        _, exit_code = self.emulator.run("s6-tcpserver 127.0.0.1 1024 cat &")
         self.emulator.run("sleep 2")
         cmd = "echo foobar | s6-tcpclient 127.0.0.1 1024 s6-ioconnect -67"
         output, exit_code = self.emulator.run(cmd)

---
base-commit: 51a58ff0624f62ca0fa0ca6494928e8bd1410f69
change-id: 20240715-support-testing-s6-networking-fix-28e7573197e7

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
