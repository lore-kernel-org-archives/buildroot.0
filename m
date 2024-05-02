Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA4C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 19:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 482D941B9B;
	Thu,  2 May 2024 19:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4H1KJiUCqwML; Thu,  2 May 2024 19:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 559FF41B8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 559FF41B8F;
	Thu,  2 May 2024 19:05:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEED91BF285
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 19:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC10182FCE
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 19:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AFgo01REiy2 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 19:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0CEC8233A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CEC8233A
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0CEC8233A
 for <buildroot@buildroot.org>; Thu,  2 May 2024 19:05:25 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 442Ili1n029439; Thu, 2 May 2024 19:05:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xvgdpg1fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 May 2024 19:05:24 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 442J5OjE026713;
 Thu, 2 May 2024 19:05:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xvgdpg1fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 May 2024 19:05:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 442Inhsc022182; Thu, 2 May 2024 19:05:22 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsd6n1h8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 May 2024 19:05:22 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 442J5KTS46858616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2024 19:05:22 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 292B158063;
 Thu,  2 May 2024 19:05:20 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF2FD5805D;
 Thu,  2 May 2024 19:05:19 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.61.29.7])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with SMTP;
 Thu,  2 May 2024 19:05:19 +0000 (GMT)
Received: from arbab-vm.ghola.net (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTPS id B56742F0430D;
 Thu,  2 May 2024 14:05:16 -0500 (CDT)
Date: Thu, 2 May 2024 14:05:15 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <a983295a-c182-489a-af83-93cf8eb3e806@arbab-vm>
References: <20240416144818.681220-1-arbab@linux.ibm.com>
 <ZjK3yArA-YSkrSOI@landeda>
Content-Disposition: inline
In-Reply-To: <ZjK3yArA-YSkrSOI@landeda>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s0DqLvHYeWEc1W8YWeSPiG106A5Fudbb
X-Proofpoint-ORIG-GUID: n4eKHlm1QZrCDcpp6Ede_NOlCWEUjzVR
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-02_10,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=947 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405020126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=/2Txi3nnrXMB2L2EiMvuWSd8DlR16elkBtU4jw/W2Ko=;
 b=rMYM6tmgigCb6PIUSs/XJMh/ma2mhP5aMFOunchBvnA0Ex97TTJWCM5xoKpe9OHBBsok
 ScKzOdv4cmFs1mTSAaR3iCt4spiq49tkibFct++6KvcEwMTqY4kIyEIDveWL43OmiwFU
 WAs4csnBHao5P6Xvrp4iesVABDGN6/jGbbcTDRppooa+MWUS8HlCSFxMAEu2Xf9zb3wk
 63RNRgfNJO9EPmqCV6QgNJukiQbua+fKTeRj+PRUURvxSyHTXAL6bULOn00+NP0AO9lf
 fkbF+BKnyArYPxzS4T/qbgk6sla1Z01nMsGlrJ4TF+VVIAcYyg/lL5uNGVLsLSgjkSTH wQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=rMYM6tmg
Subject: Re: [Buildroot] [PATCH] package/petitboot: add libxcrypt optional
 dependency
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 01, 2024 at 11:44:40PM +0200, Yann E. MORIN wrote:
>Applied to master, thanks.

Thanks Yann!

Do you have any comments on the three remaining patches in this series?
https://patchwork.ozlabs.org/project/buildroot/list/?series=394036

Patch 3/5 is a required fix for petitboot to work properly, and the 
others would be nice to have.

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
