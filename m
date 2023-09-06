Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8957DEE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D32821B8;
	Wed,  6 Sep 2023 19:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D32821B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 979v2RGgqxhQ; Wed,  6 Sep 2023 19:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694C88219C;
	Wed,  6 Sep 2023 19:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 694C88219C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7B31BF983
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B1341920
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B1341920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1xzq00Ya4bo for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7A8941936
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A8941936
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 386Jga7O001365; Wed, 6 Sep 2023 19:46:13 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxythr323-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:13 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 386IAoTO012275; Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkk5ps9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:12 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 386JkCPw8389328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D41C5805B;
 Wed,  6 Sep 2023 19:46:12 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F310F58058;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 3CC9B19B6A3; Wed,  6 Sep 2023 14:46:11 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 14:46:04 -0500
Message-Id: <20230906194609.74080-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j7zEhHxSGVWRgviAIRhHRGor9wvI7RIa
X-Proofpoint-GUID: j7zEhHxSGVWRgviAIRhHRGor9wvI7RIa
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=552
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=07j7qCW+DrpckZYHQX3EAcuqWR0tvXQEXiLiS04YqM8=;
 b=QViWAf4MlI6z9Xw/6i1wkta6SWlc3offDbh0ioFj+N4lHBlysziVEpzhjmxEt9AyLeMA
 do85IGQkGbyJUgyPoqSUfdu+D4fYU58fE1Acml4RQW09g/0LLqnvm/4S6BeXYSqSkfwB
 r603phYPMMSoCMZQmCeZPgmOBEe3B/K4Vh3j6uDoZ69B1tvxVB3utTXJqln7hFSWJvO9
 A0ZZp5QcEJyFFXTYtlll3af0UwLU5q4ULO41+0Hotmm5ars1WWug5oCwH3D0Xh/rL+fs
 IAOlxbGb/YSSR1j3u/XwlcuVPvWWJ4yoLzmM9vOu1wXp9XPoD2BzrlpsJt7rSKkoJbIG rQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=QViWAf4M
Subject: [Buildroot] [PATCH 0/5] package/petitboot: misc enhancement
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

Reza Arbab (5):
  package/petitboot: fix HOST_PROG_SHUTDOWN value
  package/petitboot: run pb-console at boot
  package/petitboot: poll removable devices
  package/petitboot: enable discovery of software RAID devices
  package/petitboot: enable discovery of SCSI devices

 package/petitboot/63-md-raid-arrays.rules    | 41 ++++++++++++
 package/petitboot/65-md-incremental.rules    | 69 ++++++++++++++++++++
 package/petitboot/66-add-sg-module.rules     |  2 +
 package/petitboot/petitboot-console-ui.rules |  4 ++
 package/petitboot/petitboot.mk               | 20 +++++-
 package/petitboot/removable-event-poll.rules |  3 +
 package/petitboot/sysctl.conf                |  1 +
 7 files changed, 139 insertions(+), 1 deletion(-)
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
