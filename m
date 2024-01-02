Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17EFC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 15:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5851540541;
	Tue,  2 Jan 2024 15:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5851540541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkVye-rx1nkK; Tue,  2 Jan 2024 15:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C84840949;
	Tue,  2 Jan 2024 15:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C84840949
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 661171BF38E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 15:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E2FD81433
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 15:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E2FD81433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xb4d4b6NXEMH for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 15:18:08 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8543881431
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 15:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8543881431
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 402CojUB013484; Tue, 2 Jan 2024 15:18:07 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vcf2j7yyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 15:18:07 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 402CjZ7B024503; Tue, 2 Jan 2024 15:18:06 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vb0825393-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 15:18:06 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 402FI6JZ49742554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jan 2024 15:18:06 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C78158063;
 Tue,  2 Jan 2024 15:18:06 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FBE258052;
 Tue,  2 Jan 2024 15:18:06 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Jan 2024 15:18:06 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
 by arbab-laptop.localdomain (Postfix) with ESMTPS id 9838E1741C5;
 Tue,  2 Jan 2024 09:18:05 -0600 (CST)
Date: Tue, 2 Jan 2024 09:18:04 -0600
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Message-ID: <b3dda4d7-d29d-4025-adb6-ce45ecc806ac@arbab-laptop>
Mail-Followup-To: buildroot@buildroot.org, Laurent Vivier <laurent@vivier.eu>,
 Arnout Vandecappelle <arnout@mind.be>,
 Joel Stanley <joel@jms.id.au>
References: <20231115215931.860940-1-arbab@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231115215931.860940-1-arbab@linux.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q0vZZ6nqjlN5Hl5aQZuJvg6_CPV4tu--
X-Proofpoint-ORIG-GUID: Q0vZZ6nqjlN5Hl5aQZuJvg6_CPV4tu--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_04,2024-01-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=557 clxscore=1011 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401020117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=RMgduzzhYw8PPjcI0uJzr/nEYEiB9VMUWR1mIcACphM=;
 b=FnhLZRgK/8jiY9zGggCKqN6IcnucJDHl0QeW+czuX69/k4P94nhM+muwbFyq1GqMejwB
 HUJPpuuT7qcng8p8Fx0HldUM2D0CipwENVZavTxLS920iPS2x2/QdnosENeBMvA8DFno
 D3np6Gq9rDtW2QVlTuvCt4ZQiM4bzbF3wPo2LlJSg1ZNiWbtz0THwPXNof9eChZ0F/NH
 lxfJDNejGO0ytfT5txWx/nIUo5JDPdb6tPpMgORrFvav+YpNSFViYbl8dH6YgFDLoqcC
 Yqbi8Hn3A4GUXo/cit7LjHWTDtzLRQ5LfRunRm9/RAbV+Sdea89VRdsUudHfD7sLACjm dw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=FnhLZRgK
Subject: Re: [Buildroot] [PATCH v4 0/5] package/petitboot: misc
 fixes/enhancement
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Nov 15, 2023 at 03:59:26PM -0600, Reza Arbab wrote:
>v4:
>* Change the buildroot menu help to say that petitboot *looks best* in a
>  UTF-8 locale, not that it *needs* one.
>
>* Change the shutdown patch to accomodate any buildroot init system.
>
>* Split the user separation patch into a couple of smaller ones with
>  better log messages.

I think this addresses Arnout's feedback from v3. Is there something 
more I could do to get this series committed?

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
