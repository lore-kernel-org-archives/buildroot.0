Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB6C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 15:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 717386059D;
	Tue,  2 Jul 2024 15:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Coiizs1MqMPQ; Tue,  2 Jul 2024 15:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F67606FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F67606FF;
	Tue,  2 Jul 2024 15:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7341BF30A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 888C78057A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRTFNmesmReI for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCB2980A4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB2980A4D
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCB2980A4D
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 15:18:53 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 462F57aY029650
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:53 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4041ev08q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 15:18:53 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 462FIp6d016383
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:52 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 462FIpSk010057
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:51 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 8DD681002685;
 Tue,  2 Jul 2024 10:18:51 -0500 (CDT)
Date: Tue, 02 Jul 2024 15:18:43 +0000
Message-Id: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFMahGYC/x3MQQqAIBBA0avErBNUtKKrRAursWZj4YgU0t2Tl
 m/xfwHGSMgwNgUiZmI6Q4VqG1gPF3YUtFWDltrIXirhkk+X4IczBUrC+sEMnZMKFws1uiJ6uv/
 hNL/vB62oRTlgAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=530
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=480
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020114
X-Proofpoint-GUID: 8Y3skVJBEBAn_qwrGpduHWyzhJA69e3e
X-Proofpoint-ORIG-GUID: 8Y3skVJBEBAn_qwrGpduHWyzhJA69e3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=613 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=MFaSlI+zBgTfGN+KurKJgLx2VGUpLidRTswBOpkidOk=;
 b=iBXWyjm5wyca1XLKSuy4Fwlc+yHVah7ZoFxxKddxwDhoW8+h/QsO9tLPVwj94srWyXha
 EAs3iXyupFY7I1izoVEa0Tb7YN4XXg3+/GGL+iQr9wOP0IBgmj/ejsyLVzdkb9TmRkVF
 ChAT3gTF3t6O4DLNjYcFrAWpG5c/FoeoL4Xu05nc9P4+JLif/JClXc/xlaa6/hQ01b1Z
 So4Q5fEhC6AegEexjr1vkUIxkrWnV0V2TnrE2YZwuyRNT2Ee48Ob+4TXLfx3bznCPns2
 vvW9aPacreoeqNoLrxV+QOJW+KfrYSrKiO9+mm3wGPm8UY9QpHVgwO02AlZAMvhZIHjQ PA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=iBXWyjm5
Subject: [Buildroot] [PATCH 0/3] package/atftp: add init script and
 support/testing
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
Brandon Maier (3):
      package/atftp: add sysvinit script
      support/testing: add atftp test
      DEVELOPERS: add myself for package/atftp

 DEVELOPERS                                  |  1 +
 package/atftp/S80atftpd                     | 44 +++++++++++++++++++++++++++++
 package/atftp/atftp.mk                      |  5 ++++
 support/testing/tests/package/test_atftp.py | 28 ++++++++++++++++++
 4 files changed, 78 insertions(+)
---
base-commit: 55c8c2328e73725e9ab41c8dc566b09f49f2aad5
change-id: 20240701-atftp-sysvinit-5f8486a01eb5

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
