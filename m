Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E8CC3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 14:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F24F41328;
	Tue,  9 Jul 2024 14:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCIrMDQC6NTN; Tue,  9 Jul 2024 14:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF4F40270
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF4F40270;
	Tue,  9 Jul 2024 14:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5A11BF27A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC36B41314
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrAIwFz-XhQc for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 14:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7114E4132C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7114E4132C
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7114E4132C
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 14:17:03 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 469BfYTi016341
 for <buildroot@buildroot.org>; Tue, 9 Jul 2024 14:17:02 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 408pu0ekt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 09 Jul 2024 14:17:02 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EH1vi020331
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 9 Jul 2024 14:17:01 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 469EH0mT011457
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 9 Jul 2024 14:17:00 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 4A8F120054B8;
 Tue,  9 Jul 2024 09:17:00 -0500 (CDT)
Date: Tue, 09 Jul 2024 14:16:53 +0000
MIME-Version: 1.0
Message-Id: <20240709-support-b4-v1-1-ef971fe9a893@collins.com>
X-B4-Tracking: v=1; b=H4sIAFRGjWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMz3eLSgoL8ohLdJBNdE8MUM8Mki1STFDMDJaCGgqLUtMwKsGHRsbW
 1AEhE4q1cAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=911
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407090092
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=871
 adultscore=0
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407090092
X-Proofpoint-GUID: TURBewKI12K_BLd9dq8Uc1deWxtHU32Q
X-Proofpoint-ORIG-GUID: TURBewKI12K_BLd9dq8Uc1deWxtHU32Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 bulkscore=0 mlxlogscore=972 mlxscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407090092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=vo0Zw9NX9SEfQG+bwTlzxXhg7DL63ujBczQyNH/nQck=;
 b=UfLYQObHXu4RlfKD0NeGmGDOXA2uQMsHi8jQueeIpVT5Crekm+TVxu3DZ5BJWGrQ5xii
 3as2PWO94OBmWvuTAZtOOdR+BpvFVcClQ8M+bnBwrSH1SRWdLBaW8BoepBv4ZSsnQrw2
 SPykBcP51Q6yNJb7e4Xce0351yPLJrpe8e/dheNLl1d2vzWHn9sfOY+2taLQXs+ttZDW
 PsJH5otIrHrocxytF1qp968yxcyYxpZ5CJcdEDbNM4klSA34/rCFPHGILyZyFqSQ4fmm
 yyriYxqZe5GNmSJU/I3JzqLjRKVx5aE+VTYfd5DzWejdoOS0oS543XaZagCC6Trnymuu 3g== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=UfLYQObH
Subject: [Buildroot] [PATCH] .b4-config: configure `b4` for Buildroot
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

`b4` is a commandline tool to make patch-based development easier[1]. It
is primarily used for Linux kernel development, but can be configured to
support any project that has a public-inbox endpoint. Buildroot has a
public-inbox mirror at "https://lore.kernel.org/buildroot/".

We configure some basic settings that tell `b4` where to send patches
and how to use get-developers.

[1] https://b4.docs.kernel.org/en/latest/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
I am planning to send a future patch to hook `./utils/check-package`
into `b4`. This reminds users to run check-package with `b4 prep
--check` before sending a patch series. But support for custom check
commands is broken in the latest version of `b4` and I am waiting on a
fix I submitted upstream[1].

[1] https://lore.kernel.org/tools/20240626-b4-config-check-cmd-v1-1-83fc971196f9@collins.com/T/#u
---
 .b4-config | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000..1943458f2f
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,7 @@
+# Configuration for the `b4` tool
+# See https://b4.docs.kernel.org/en/latest/config.html
+[b4]
+    send-series-to = buildroot@buildroot.org
+    send-auto-cc-cmd = "./utils/get-developers -e -"
+
+# vim: set filetype=gitconfig:

---
base-commit: 3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55
change-id: 20240626-support-b4-41d61b8e4d60

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
