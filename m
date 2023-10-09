Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B107FE95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E11361316;
	Mon,  9 Oct 2023 15:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E11361316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGdkQGo3SLIN; Mon,  9 Oct 2023 15:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59146612C8;
	Mon,  9 Oct 2023 15:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59146612C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57ED01BF95C
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0A582112
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F0A582112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pq7ZXjQxlmMX for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:19:39 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3C4581F11
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C4581F11
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399EixLS006132; Mon, 9 Oct 2023 15:19:37 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmkj916pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:19:36 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399DnhXF024487; Mon, 9 Oct 2023 15:18:07 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnsa551-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:07 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FI6MS63111544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:06 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBD5758056;
 Mon,  9 Oct 2023 15:18:05 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B62258065;
 Mon,  9 Oct 2023 15:18:04 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:03 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 797EE9ADE5; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:21 -0500
Message-Id: <20231009151729.2223963-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yNWrkG-KrzA0Kl9n4zAW3PkXUTS1Txl6
X-Proofpoint-GUID: yNWrkG-KrzA0Kl9n4zAW3PkXUTS1Txl6
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=966
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kS9jp3W7Rfe4M88jQszNkskk3m5KCro1nQ+9gdimIak=;
 b=OH3bTm/DFDBXkLDCTt+t2WgZkOEps8/81H6h8UyuHXeigjAQ0LvF8xlgcAQyZ1lqqAYY
 wmJ5GcG5TpcjKXDnxEgcvZcbHAM1iVE4m7OpmKmnRkjFqJ8mBUsNKrNPHlPk4iRUyKIf
 yx1nLiiUBJeyYopkwaB4erLUvQDCgvqSiFRbES+R8NsGiWdK1kOCjsMyr7lGQTTXPe2T
 mvpTXN9BJCi+6TgMFTzSxCOBAniI4cn1CBXlEY56WaJamJY3MrPL9LAz5X1kg2XrOLM5
 ZqmawyC75pKtg9R/qRCD1W026gEwhR0+4RkIkV6lYTLlAtWeU3hDMd7vcO5dkfTALsUj vw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=OH3bTm/D
Subject: [Buildroot] [PATCH v3 0/8] package/petitboot: misc fixes/enhancement
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
v3:
* Add a number of small fixes.

* Add user separation, so the UI runs as non-root.

* Remove udev rules that enabled some additional types of boot devices.
  These should more appropriately live outside of buildroot.

* Remove a sysctl.d file to silence kernel output. I think there's a
  bug upstream; see https://github.com/open-power/petitboot/pull/103

v2:
* Use Laurent's suggested additions to "run pb-console at boot" patch.

Reza Arbab (8):
  package/petitboot: fix menu comment
  package/petitboot: fix pb-discover pidfile creation
  package/petitboot: use default logfile dir
  package/petitboot: prefer kexec-lite on powerpc
  package/petitboot: fix shutdown
  package/petitboot: run petitboot UI on consoles
  package/petitboot: enable user separation
  package/petitboot: prefer UTF-8 support

 package/petitboot/Config.in      | 26 +++++++++++++++------
 package/petitboot/S15pb-discover | 13 +++++++----
 package/petitboot/kexec-restart  |  8 +++++++
 package/petitboot/pb-console     | 39 ++++++++++++++++++++++++++++++++
 package/petitboot/petitboot.mk   | 38 +++++++++++++++++++++++++++++--
 package/petitboot/shell_config   | 24 ++++++++++++++++++++
 package/petitboot/shell_profile  |  5 ++++
 system/Config.in                 |  2 +-
 8 files changed, 140 insertions(+), 15 deletions(-)
 create mode 100755 package/petitboot/kexec-restart
 create mode 100644 package/petitboot/pb-console
 create mode 100644 package/petitboot/shell_config
 create mode 100644 package/petitboot/shell_profile

-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
