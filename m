Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0ECC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 16:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F4061473;
	Thu,  9 Nov 2023 16:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F4061473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LR0AENw8b8OD; Thu,  9 Nov 2023 16:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB8F61313;
	Thu,  9 Nov 2023 16:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB8F61313
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 925D21BF418
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C9380DB9
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C9380DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SziYnzGIgqpN for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 16:19:53 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28C3B80D7E
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 16:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28C3B80D7E
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9FgNMI015688; Thu, 9 Nov 2023 16:19:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u92a79k60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:19:52 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9EQQf9014325; Thu, 9 Nov 2023 16:19:51 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u7w224x2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:19:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3A9GJofb19661506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Nov 2023 16:19:51 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E00A658063;
 Thu,  9 Nov 2023 16:19:50 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E09058059;
 Thu,  9 Nov 2023 16:19:50 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.61.80.56])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with SMTP;
 Thu,  9 Nov 2023 16:19:50 +0000 (GMT)
Received: from arbab-vm.ghola.net (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTPS id 602162F0430D;
 Thu,  9 Nov 2023 10:19:49 -0600 (CST)
Date: Thu, 9 Nov 2023 10:19:48 -0600
From: Reza Arbab <arbab@linux.ibm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <88809538-d6df-4a10-93aa-ea362529b8d5@arbab-vm>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <a73225eb-c2d6-4dbe-844e-145d8c58dce8@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a73225eb-c2d6-4dbe-844e-145d8c58dce8@mind.be>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gMoRufYnSxwxSqmrewgSIb3hOPg2p9v9
X-Proofpoint-ORIG-GUID: gMoRufYnSxwxSqmrewgSIb3hOPg2p9v9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_14,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=446 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311090123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=4yiuFBSqnPFffUkuwi8b4LT5pWwLl8jvGJWGoE6jv2w=;
 b=Q0PIuwHjPTv58Sr62EEZku7VaPCV6s2iJnR/kPEL8pvGdBE1P9NZ9IvXgitkkHM9Oi85
 VIFSTbCKHM8VFLKq0ppsAA9ZhgAlwmkzMHJr6mwYp7zPp8Wx7VWQyYjeFcSFYHsQ/dPd
 kJReRvGbA/sgINrIVk+zcf7EZL3qh5Y67Aw1RnySUhbkNLbLHZBWgZ1w6kixVMobjt8T
 NvuK4atfJXLXKxM8l1dmzotKVa4JBAro5KvtHYDsc0uGIrq3xMwWV9pNu4n/hUoPpL5R
 uIgXAnkp9SWivtn+yu5dwf4Dt5iR9jgz1l36yTDoc3NrE2aDA66k5ly1FWR5hAGBJCSB dQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=Q0PIuwHj
Subject: Re: [Buildroot] [PATCH v3 0/8] package/petitboot: misc
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
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Nov 05, 2023 at 07:31:04PM +0100, Arnout Vandecappelle wrote:
> Series applied to master, thanks, except for the ones where I wrote 
>that they're Changes Requested.

Appreciate your help in getting all this straightened out! I'll send 
another set to address what's remaining.

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
