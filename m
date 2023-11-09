Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AC4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 16:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA3B861477;
	Thu,  9 Nov 2023 16:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA3B861477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBAlx1Juu2DE; Thu,  9 Nov 2023 16:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0125F61313;
	Thu,  9 Nov 2023 16:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0125F61313
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D93561BF418
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B21DA61313
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B21DA61313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qimguYj0XHGu for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 16:18:02 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18399612EB
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 16:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18399612EB
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9GCZbK025286; Thu, 9 Nov 2023 16:18:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u92r7r6dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:18:01 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9Eb808000662; Thu, 9 Nov 2023 16:18:00 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u7w234vf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:18:00 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3A9GHxk316057086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Nov 2023 16:17:59 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6994A5805E;
 Thu,  9 Nov 2023 16:17:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3919958059;
 Thu,  9 Nov 2023 16:17:59 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.61.80.56])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with SMTP;
 Thu,  9 Nov 2023 16:17:59 +0000 (GMT)
Received: from arbab-vm.ghola.net (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTPS id 395FE2F0430D;
 Thu,  9 Nov 2023 10:17:58 -0600 (CST)
Date: Thu, 9 Nov 2023 10:17:57 -0600
From: Reza Arbab <arbab@linux.ibm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <374b0272-4fa2-4108-93db-06d98f17acb0@arbab-vm>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-9-arbab@linux.ibm.com>
 <e2f95788-7508-45c7-94d7-664b2ee68d37@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2f95788-7508-45c7-94d7-664b2ee68d37@mind.be>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BhHK0-_ra2f48e-QUDcvByruSadcn41_
X-Proofpoint-ORIG-GUID: BhHK0-_ra2f48e-QUDcvByruSadcn41_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_14,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=309
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=2yMxJmQcbxfOhZ0k0l+ehQ+Ubc0WCkJnhhPloeRX8yM=;
 b=tMa0IU4wJrezAjuCI/+6Paa5MgVnrRJ9ngckuVnrRsnJ2B/e+Q2ojzHt6rG3RYmWfx14
 IgPGCfw/kPO/7qfDeO9frOven4Osqmd2zVlftKJaYC4FuGdtiNW3NEkoeIpZxcSU9bVq
 Ab7v9LII8BtAlZhZscmXlUv0OnJxnGT8MRIT8AwEQQEDwBllRfHAYob9PKaFQFnGqF8n
 hAe4xZ8Kf6lavXAbpiPKuTpAefeY9W/s7rXwb8SWTOyvLM7zJCxourFNZGuKmcga9svF
 p4iHcca+iabtV2dkYfrWAzsm7JN6O4/O/74VHwRjN/PUzLqEXFQN6MUiVN5v1GyN+jkb kQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=tMa0IU4w
Subject: Re: [Buildroot] [PATCH v3 8/8] package/petitboot: prefer UTF-8
 support
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

On Sun, Nov 05, 2023 at 07:30:28PM +0100, Arnout Vandecappelle wrote:
>On 09/10/2023 17:17, Reza Arbab wrote:
>>Add a reminder that a UTF-8 locale should be generated for things to
>>look right. Assume C.UTF-8 by default, allowing $LANG to be overridden
>>(by /etc/default/petitboot or otherwise) if something else is desired.
>
> So, this improves things, but they're not really necessary. I think 
>it's better then to just put in the help text that it looks better 
>with UTF-8 locale enabled.

Will change.

>>--- a/package/petitboot/S15pb-discover
>>+++ b/package/petitboot/S15pb-discover
>>@@ -15,6 +15,7 @@ start() {
>>  	# shellcheck disable=SC2174 # only apply -m to deepest dir
>>  	mkdir -p -m 0775 /var/log/petitboot
>>  	chown root:petitgroup /var/log/petitboot
>>+	export LANG="${LANG:-C.UTF-8}"
>
> I think it's better to rely on the default locale being set to 
>C.UTF-8. Hm, it seems we don't actually set a default locale though... 
>Perhaps we should add a system menu entry to do exactly that. Though 
>I'm not sure if it's even possible with uClibc (glibc has 
>/etc/locale.conf).

No problem, I'll take this out. I think we can defer to the user to set 
a UTF-8 system locale. A config option for default locale would be nice 
indeed.

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
