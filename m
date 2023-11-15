Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F631C072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 22:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC2E614F3;
	Wed, 15 Nov 2023 22:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC2E614F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwQLtS-yKITt; Wed, 15 Nov 2023 22:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31876151C;
	Wed, 15 Nov 2023 22:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31876151C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCDE21BF599
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95F1C81F09
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F1C81F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SttototujYJ for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BF3981ECF
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF3981ECF
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKvkjG013570; Wed, 15 Nov 2023 21:59:45 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud4chb1dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:45 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKItR0010004; Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxt2ufp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:44 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AFLxhI515794728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Nov 2023 21:59:43 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74FEA58063;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EF775804B;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id A556D20BF6; Wed, 15 Nov 2023 15:59:42 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 15:59:26 -0600
Message-Id: <20231115215931.860940-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Akkfz62i30Ptmix2CpL47ZEcPS5Ot13M
X-Proofpoint-ORIG-GUID: Akkfz62i30Ptmix2CpL47ZEcPS5Ot13M
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311150173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=SGl9vjmD3e1h5RYCcEFoK4ZcKJqC5+tw5jA+XpIvptc=;
 b=k/BWiOMRm1AnEonS18EI8GZSdXqcaGY0vqR7JUacReANABBx4nGx10FzST8cgMcPbt7+
 liHYAprfI5ERLBXp2pULVielokvjdYy6PYZLsM7ke67LXRfoJ4x4ueWbYMmUIN4WT5PJ
 jrHFJdGnH8jI9f38tqMvbQCMVmW8J7ycGQnCHmHIx80YzQp/p2u+YBW0SIw11QOk4+Du
 ZJSciR4GcYLOHjLIdl7xuUDYvMi07e7spQ/MNLNEzapgyjOc83LjvlMV9I9NGbqygCWc
 Unz48RZvhzLyY2rfKGpN0iXXeQz9gY0e48r8v6mNr00P7vlDhKz+7MTswGRtlbdQ7bB4 aw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=k/BWiOMR
Subject: [Buildroot] [PATCH v4 0/5] package/petitboot: misc fixes/enhancement
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The br2-external tree used to build OpenPOWER firmware has long carried
petitboot as a custom package[1]. Now that petitboot has been added to
buildroot proper, it would be nice to leverage the base package instead.

To make that transition easier, here is a set of patches which port over
some of the enhancements made to that external package.

[1] https://github.com/open-power/op-build/tree/master/openpower/package/petitboot
---
v4:
* Change the buildroot menu help to say that petitboot *looks best* in a
  UTF-8 locale, not that it *needs* one.

* Change the shutdown patch to accomodate any buildroot init system.

* Split the user separation patch into a couple of smaller ones with 
  better log messages.

v3:
* Add a number of small fixes.

* Add user separation, so the UI runs as non-root.

* Remove udev rules that enabled some additional types of boot devices.
  These should more appropriately live outside of buildroot.

* Remove a sysctl.d file to silence kernel output. I think there's a
  bug upstream; see https://github.com/open-power/petitboot/pull/103

v2:
* Use Laurent's suggested additions to "run pb-console at boot" patch.

Reza Arbab (5):
  package/petitboot: minor makefile cleanup
  package/petitboot: prefer UTF-8 support
  package/petitboot: fix shutdown
  package/petitboot: run script when exiting to shell
  package/petitboot: run UI as non-root user

 package/petitboot/Config.in      |  9 ++++++--
 package/petitboot/S15pb-discover |  4 +++-
 package/petitboot/kexec-restart  | 26 ++++++++++++++++++++++++
 package/petitboot/pb-console     |  6 ++++--
 package/petitboot/pb-shell       | 10 +++++++++
 package/petitboot/petitboot.mk   | 35 ++++++++++++++++++++++++++------
 package/petitboot/shell_profile  |  3 +++
 7 files changed, 82 insertions(+), 11 deletions(-)
 create mode 100644 package/petitboot/kexec-restart
 create mode 100644 package/petitboot/pb-shell
 create mode 100644 package/petitboot/shell_profile

-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
