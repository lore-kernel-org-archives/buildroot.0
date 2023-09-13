Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541FBEDEC7C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 15:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028A682151;
	Wed, 13 Sep 2023 15:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028A682151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKb4Sh5ORSHy; Wed, 13 Sep 2023 15:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5899281BBD;
	Wed, 13 Sep 2023 15:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5899281BBD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0D71BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52A13416A6
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A13416A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3wW8bxH3wF8 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 15:54:51 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3219E405F8
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 15:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3219E405F8
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38DF6mlI017187; Wed, 13 Sep 2023 15:54:49 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t3dv5d4bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Sep 2023 15:54:49 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38DEK1cu011953; Wed, 13 Sep 2023 15:54:48 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t15r23rc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Sep 2023 15:54:48 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38DFsmiI3801704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Sep 2023 15:54:48 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37FBA5805D;
 Wed, 13 Sep 2023 15:54:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F59358043;
 Wed, 13 Sep 2023 15:54:48 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Sep 2023 15:54:48 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
 by arbab-laptop.localdomain (Postfix) with ESMTPS id 3EECB1725CA;
 Wed, 13 Sep 2023 10:54:47 -0500 (CDT)
Date: Wed, 13 Sep 2023 10:54:46 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dc769889-d37b-46de-8041-a43a78d29850@arbab-laptop>
Mail-Followup-To: Laurent Vivier <laurent@vivier.eu>,
 buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 Joel Stanley <joel@jms.id.au>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-3-arbab@linux.ibm.com>
 <af489c0d-75cd-b7c0-53ba-cb4a187ec62c@vivier.eu>
 <fda04f6a-0e4f-4e72-b86c-01d75b8f5231@arbab-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fda04f6a-0e4f-4e72-b86c-01d75b8f5231@arbab-vm>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n9bSYnO2FysXHOaeUa_IRJ0D4pXyUsH-
X-Proofpoint-GUID: n9bSYnO2FysXHOaeUa_IRJ0D4pXyUsH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_09,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=776 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130128
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=yz7X14lVsESbYd/NWrzgHys/GBptZkqBj8J+50J5oqk=;
 b=rc+A3yDZh1cJ9ofhPyGJ5J05HKn5ikDOISfsZWiiFexjy/Z7ZcEhjtGJ2k7hHWuIDNDm
 VCP5f7pw5SHfSgHzPt7BjwDRKhyAKl2jl9gsKnUL2fmaRu68GbdRDWzOT/ueGj5uxBVX
 xlTmJUpU6oUesOLEZ2fUiJiV67aVz63e24vEIWsuozPuq3/+tXG07WUqUjbyQ4WpWsSF
 p/2r4vMw5wzY36TWYOOmN2i22/JcPIS6sNBy3bD0CcBaElB2oR/m/iApy8MAwH3tFTh+
 fBP4TqvUWFykmkzX6crduCCJwG/CGOWHcvn6b3qTp27kRG464LxLWWaoAJBifDTLkdYk xw== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=rc+A3yDZ
Subject: Re: [Buildroot] [PATCH 2/5] package/petitboot: run pb-console at
 boot
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 07, 2023 at 02:41:22PM -0500, Reza Arbab wrote:
>On Thu, Sep 07, 2023 at 10:51:32AM +0200, Laurent Vivier wrote:
>>I think you also need:
>>
>>diff --git a/system/Config.in b/system/Config.in
>>index 1ca7690ea3ba..786ec9a1c6b3 100644
>>--- a/system/Config.in
>>+++ b/system/Config.in
>>@@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>>
>>menuconfig BR2_TARGET_GENERIC_GETTY
>>       bool "Run a getty (login prompt) after boot"
>>-       default y
>>+       default y         if !BR2_PACKAGE_PETITBOOT
>>
>>if BR2_TARGET_GENERIC_GETTY
>>config BR2_TARGET_GENERIC_GETTY_PORT
>>
>>Otherwise the petitboot prompt will be mixed with getty prompt.
>
>This makes sense, but oddly, all our configs have
>
>  BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
>
>Let me try to figure out why it's never caused problems.

I found that the reason we've never had problems with this is because 
BR2_TARGET_GENERIC_GETTY operates on the default /etc/inittab, but we 
overwrite that file in our overlay.

So your suggestion seems good to me! I'll add it to v2.

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
