Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87296C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4140B83C6E;
	Wed,  7 Feb 2024 17:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4r2icn7NI-ez; Wed,  7 Feb 2024 17:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECF0983CC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF0983CC9;
	Wed,  7 Feb 2024 17:52:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22EAE1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1198B83C60
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6I2FadQg3vu for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F86083C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F86083C61
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F86083C61
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HRCYV011555; Wed, 7 Feb 2024 17:51:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4cnkkgdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:48 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417HRGT9012055;
 Wed, 7 Feb 2024 17:51:47 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4cnkkgcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:47 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HMVF9005421; Wed, 7 Feb 2024 17:51:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w21akq480-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 417HpjwH17367690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E40D58060;
 Wed,  7 Feb 2024 17:51:45 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAAC35804E;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 2EBA790AC23; Wed,  7 Feb 2024 11:51:44 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed,  7 Feb 2024 11:51:30 -0600
Message-Id: <20240207175135.1532037-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gM3k0d6Ckjxgf73jRPdXrtQyT9vor1e-
X-Proofpoint-ORIG-GUID: CvW0FdJYuJIdFCtaGsMwH0S4iIGeWNSZ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=j5RItovXC0OrLbTTo5pG7dlA3//8QlsB3SHLvWtE+f8=;
 b=V/930dTDATRm0uUe4DomKwjf3faxBH5WRhsNlM8BwZeYMQ+R0FzwRwGzqgJpjRf7U+8O
 Yvcp311/UXo0eMh8sS2fQSvnDIQljhJxZqQJmqGfNqnoB9RPS1LnxRmhmph/IM9CJAmx
 hxQD1cmDJWN6HKGvJIBSE2WVMccuaFKtH6wNhGaZamq5dpHH8qtiJc3npN6wKQIaeB3v
 YLYI+LGfBLlMPMJ5dxz0WPoUIC7DO+2IfeiQjTVlaWId7Ur0FCy1b+W2w/VAXOsRGPNH
 FZZV6xw5rW3hFplXc+mB1l8l/bfzmLv+YToqlLwh7mFNA/FfuO+yV8wF2iS6+7HcuGpo JQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=V/930dTD
Subject: [Buildroot] [PATCH v5 0/5] package/petitboot: misc fixes/enhancement
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
Cc: Joel Stanley <joel@jms.id.au>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
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
v5:
* Rebase to apply on top of some recent NLS fixes.

* Nobody replied to v4. Cc'ing some more people in hopes of getting
  these changes into the next release.

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

 package/petitboot/Config.in      |  4 ++++
 package/petitboot/S15pb-discover |  4 +++-
 package/petitboot/kexec-restart  | 26 ++++++++++++++++++++++++
 package/petitboot/pb-console     |  6 ++++--
 package/petitboot/pb-shell       | 10 +++++++++
 package/petitboot/petitboot.mk   | 35 ++++++++++++++++++++++++++------
 package/petitboot/shell_profile  |  3 +++
 7 files changed, 79 insertions(+), 9 deletions(-)
 create mode 100644 package/petitboot/kexec-restart
 create mode 100644 package/petitboot/pb-shell
 create mode 100644 package/petitboot/shell_profile

-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
