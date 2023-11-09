Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A39C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 16:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89A1860F3F;
	Thu,  9 Nov 2023 16:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A1860F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfzuXNa0KjFr; Thu,  9 Nov 2023 16:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBA960F4B;
	Thu,  9 Nov 2023 16:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBA960F4B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6A91BF418
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62D1C40A5E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62D1C40A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEQsc6_I_6aq for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 16:16:49 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1429A40A50
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 16:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1429A40A50
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9GA65Z006492; Thu, 9 Nov 2023 16:16:47 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u92pyr98v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:16:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9ENqg3019252; Thu, 9 Nov 2023 16:16:46 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u7w244udu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:16:46 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3A9GGj5v21889638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Nov 2023 16:16:45 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A533558050;
 Thu,  9 Nov 2023 16:16:45 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F52C58045;
 Thu,  9 Nov 2023 16:16:45 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.61.80.56])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with SMTP;
 Thu,  9 Nov 2023 16:16:45 +0000 (GMT)
Received: from arbab-vm.ghola.net (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTPS id 1C4CF2F0430D;
 Thu,  9 Nov 2023 10:16:44 -0600 (CST)
Date: Thu, 9 Nov 2023 10:16:42 -0600
From: Reza Arbab <arbab@linux.ibm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <624ea15d-6d09-48b3-a004-42cd3d3b67df@arbab-vm>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-8-arbab@linux.ibm.com>
 <342a893c-af90-4602-b73b-1afd37b34acb@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <342a893c-af90-4602-b73b-1afd37b34acb@mind.be>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b_N5f-DCm4-fKvVvOjI5csrKsTbGcSoY
X-Proofpoint-ORIG-GUID: b_N5f-DCm4-fKvVvOjI5csrKsTbGcSoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_13,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=OAVSwzH6EiwbF0gUN5McQw++QfvdoatX3YCiGtiDPt4=;
 b=D8a4odmGmG6vmmlwF5pC5Q5UTqb4HXeRSftTAGkYHVCn1xqLATTP2ED/y/DRq5RVknJ5
 6dHnU8FqMUQnxewbhZO563rZhfVeNDc3s5B23n5ojnshJM8AYRFAsjFPrNRNHUBT87+d
 +o3/h614Rau8Dmnzv3imYuOYXQiwrbauu57RyzrkV75G6sN+dBkPFd9YG9mfwBPoznrw
 JJZzi+W8NHXDjQciq23h73ECmjf8KelVh1DxjXdnlE5uVaiF8YfTJxwku7vrX1Pvi7qc
 5DHZY127KmYu/FSkd3xBICTNEA/Jh3CBEZOb+TiaHn1uibDYzG+of9Ohm2iLaler8qC2 eg== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=D8a4odmG
Subject: Re: [Buildroot] [PATCH v3 7/8] package/petitboot: enable user
 separation
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

On Sun, Nov 05, 2023 at 07:26:16PM +0100, Arnout Vandecappelle wrote:
>On 09/10/2023 17:17, Reza Arbab wrote:
>>Run the petitboot UI as an unprivileged user. This requires using the
>>agetty package instead of the busybox getty utility, running the initial
>>pb-console helper at user login rather than directly.
>
> That sounds counterproductive though? It means you have to log in 
>before the boot menu is displayed? Or perhaps I misunderstand the 
>statement here.
>
> It's also not clear why it would need agetty instead of busybox getty.

Sorry, I didn't explain it very well. The chain goes like this:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 console linux
3. /sbin/getty -l/usr/libexec/petitboot/pb-console -n -i 0 console linux
4. /usr/libexec/petitboot/pb-console
5. /usr/sbin/petiboot-nc
  
After the change:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i console linux
3. /sbin/agetty -a petituser -n -i console linux
4. /home/petituser/.profile
5. /usr/libexec/petitboot/pb-console
6. /usr/sbin/petiboot-nc

Because we're using the -a (autologin) feature of agetty, everything 
from (4) down is running as petituser. If you select "drop to shell" 
from the menu, you then also do

7. /home/petituser/.shrc (the $ENV set in .profile)
8. /bin/sh

>>If sudo is installed, with a sudoers policy allowing petituser to
>>perform sudo with no password (or a blank password), the "drop to shell"
>>feature of petitboot will automatically become a root shell.
>
> It seems to me that the logical thing to do would be to drop into an 
>actual getty, which asks for a login and password.

At this point we're already running getty and (auto)logged in as
petituser. The sudo integration allos system-specific flexibility in 
if/how the the shell may be elevated. As petituser, the shell has 
permission to collect diagnostics/logs by running pb-sos.

>>--- a/package/petitboot/S15pb-discover
>>+++ b/package/petitboot/S15pb-discover
>>@@ -12,7 +12,9 @@ fi
>>  start() {
>>  	printf 'Starting %s: ' "$DAEMON"
>>-	mkdir -p /var/log/petitboot
>>+	# shellcheck disable=SC2174 # only apply -m to deepest dir
>>+	mkdir -p -m 0775 /var/log/petitboot
>>+	chown root:petitgroup /var/log/petitboot
>
> Why is it owned by root and not petituser?

I don't see any reason why it couldn't be owned by petituser.

>>@@ -84,4 +88,12 @@ endef
>>  PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
>>+define PETITBOOT_USERS
>>+	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user
>
> Are petitgroup and petituser standard names? If not, we normally use 
>the package name as username and group name, i.e.
>
>	petitboot -1 petitboot -1 ...

I think we could change petituser to petitboot, but there is a hardcoded 
reference to petitgroup in the code:

   discover/discover-server.c:     group = getgrnam("petitgroup");

>>+define PETITBOOT_PERMISSIONS
>>+	/var/petitboot d 775 root petitgroup - - - - -
>
> What is /var/petitboot used for?

That is where pb-discover mounts devices, looking for boot sources:

   /var/petitboot/mnt/dev/nvme0n1p1/grub2/grub.cfg
   /var/petitboot/mnt/dev/nvme0n1p1/vmlinux

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
