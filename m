Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37073EED60B
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 16:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E1142226;
	Fri, 15 Sep 2023 16:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E1142226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxa5_e9hAWJR; Fri, 15 Sep 2023 16:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C507A40352;
	Fri, 15 Sep 2023 15:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C507A40352
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A92A11BF31E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E225883BF1
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E225883BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibxEteJy6J6j for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 617A583C00
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617A583C00
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFQ3FC009369; Fri, 15 Sep 2023 15:58:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4swhrx7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FEXQ3Q012064; Fri, 15 Sep 2023 15:58:49 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13e0dav5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:49 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38FFwmHr65732980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Sep 2023 15:58:48 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64A2658056;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54FD25803F;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id D0C51180BB7; Fri, 15 Sep 2023 10:58:47 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:58:30 -0500
Message-Id: <20230915155835.51140-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kVgg30CPafHtljSejY3Adte4if0D81Mp
X-Proofpoint-ORIG-GUID: kVgg30CPafHtljSejY3Adte4if0D81Mp
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_12,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=566 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=TOScAyATgLyaTxzhvxtCWEi1bwoEodx8e6OA2pDX+Vc=;
 b=BEJIGOaqzTqZ9reanS2RuNzo8ciYP6eKTOwaUkoAEaUBTPsxeIV4dmJVu4lRtjmKXYpe
 UqVyzosELtco6cI3x4o4070td6Cu2w8+l4jEEOyc4GdTLKBrlkscVTzJHHy82takEJtn
 wL+wUjXE0smkChwdiwhUl237hzVctwovbLQv+mm6FOXOkRdjKUPlWV7k//yquHE0UnTq
 vzmxae3baSr5gMhS9NB8OPdCbn26B6JFvcQvMUbey6sr3k/gF6YaMHibWiMecAjM/0bc
 vRf7tfnadBcOD6s8yMQ7jvR8Z5KF9PSiUJmbHguhAwhQQjytJBb+IcFWmGoSpCb/UUN6 Kg== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=BEJIGOaq
Subject: [Buildroot] [PATCH v2 0/5] package/petitboot: misc enhancement
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
Cc: Reza Arbab <arbab@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The br2-external tree used to build OpenPOWER firmware has long carried
petitboot as a custom package[1]. Now that petitboot has been added to
buildroot proper, it would be nice to leverage the base package instead.

To make that transition easier, here is a set of patches which port over
some of the enhancements made to that external package.

Beyond these, there are a couple of more involved things left:
  * User separation (i.e. the petitboot shell runs as 'petituser')
  * Support for MTD devices

[1] https://github.com/open-power/op-build/tree/master/openpower/package/petitboot
---
v2:
* Use Laurent's suggested additions to "run pb-console at boot" patch.

Reza Arbab (5):
  package/petitboot: fix HOST_PROG_SHUTDOWN value
  package/petitboot: run pb-console at boot
  package/petitboot: poll removable devices
  package/petitboot: enable discovery of software RAID devices
  package/petitboot: enable discovery of SCSI devices

 package/petitboot/63-md-raid-arrays.rules    | 41 ++++++++++++
 package/petitboot/65-md-incremental.rules    | 69 ++++++++++++++++++++
 package/petitboot/66-add-sg-module.rules     |  2 +
 package/petitboot/petitboot-console-ui.rules |  5 ++
 package/petitboot/petitboot.mk               | 20 +++++-
 package/petitboot/removable-event-poll.rules |  3 +
 package/petitboot/sysctl.conf                |  1 +
 system/Config.in                             |  2 +-
 8 files changed, 141 insertions(+), 2 deletions(-)
 create mode 100644 package/petitboot/63-md-raid-arrays.rules
 create mode 100644 package/petitboot/65-md-incremental.rules
 create mode 100644 package/petitboot/66-add-sg-module.rules
 create mode 100644 package/petitboot/petitboot-console-ui.rules
 create mode 100644 package/petitboot/removable-event-poll.rules
 create mode 100644 package/petitboot/sysctl.conf

-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
