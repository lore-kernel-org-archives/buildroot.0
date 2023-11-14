Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5222C4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 15:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 681EF61107;
	Tue, 14 Nov 2023 15:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 681EF61107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klikOaHMsD9b; Tue, 14 Nov 2023 15:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F6F60FE2;
	Tue, 14 Nov 2023 15:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85F6F60FE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136B21BF292
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 15:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF9A981235
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 15:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9A981235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abM-cniNaQpi for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 15:25:14 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 647AA81228
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 15:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 647AA81228
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AEFH71m027622; Tue, 14 Nov 2023 15:25:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucbd908yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 15:25:12 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AEE6PsP011661; Tue, 14 Nov 2023 15:25:11 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uanekgjc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 15:25:11 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AEFPBGg10355352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Nov 2023 15:25:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26C4E5805F;
 Tue, 14 Nov 2023 15:25:11 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19B0658061;
 Tue, 14 Nov 2023 15:25:11 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Nov 2023 15:25:11 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
 by arbab-laptop.localdomain (Postfix) with ESMTPS id 9A4AD171EB0;
 Tue, 14 Nov 2023 09:25:10 -0600 (CST)
Date: Tue, 14 Nov 2023 09:25:09 -0600
From: Reza Arbab <arbab@linux.ibm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <7b237806-e04d-4c50-aad6-b3ae21e5fb7a@arbab-laptop>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-8-arbab@linux.ibm.com>
 <342a893c-af90-4602-b73b-1afd37b34acb@mind.be>
 <624ea15d-6d09-48b3-a004-42cd3d3b67df@arbab-vm>
 <f730a063-dc3c-4937-bc76-24b17c57d6a4@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f730a063-dc3c-4937-bc76-24b17c57d6a4@mind.be>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3eMZ1pBzETphWBYuaR2hXibtAOL5fMK3
X-Proofpoint-GUID: 3eMZ1pBzETphWBYuaR2hXibtAOL5fMK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_14,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=676 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311140118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=FMsqwphx9t1doXsZ0aSgwSjZGqjDWK28SRhOnwKtcdM=;
 b=MwHlfZl7sK7x9WEKLkMkzOppsKxeYH2FFxN7pCj/1LsN1FsswxyFTJCwNEA6a/FK/CbU
 Rpw8d4K269L3L+qL9cDaEctDikT0+IQLPqPs11o/4cr+QRsJuEuIwha8x56+sapqk0iQ
 p9PMZ7wMXr603oB214HrwlOU4C7+GR9Wu74O/F9Nn1FcUDC0OBn1viCHnL98ZA5CFc2F
 hwmJvmW6L/4NeFdiE0HGsiQab7TXgm/dzqLnbcG7gx5sZaNJAoM78QQzEMbjCFmLYV0S
 l/TtHj276v07tU9m5mhsrs74zNH0jd0C3t8O3FXylAmjTVP0Jdq7WZQXOA9rFLdmSilI Fw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=MwHlfZl7
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Nov 10, 2023 at 10:01:25AM +0100, Arnout Vandecappelle wrote:
>On 09/11/2023 17:16, Reza Arbab wrote:
>>On Sun, Nov 05, 2023 at 07:26:16PM +0100, Arnout Vandecappelle wrote:
>>>It's also not clear why it would need agetty instead of busybox getty.
>>
>>Sorry, I didn't explain it very well. The chain goes like this:
>>
>>1. /etc/init.d/pb-console start console
>>2. /usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 console =
linux
>>3. /sbin/getty -l/usr/libexec/petitboot/pb-console -n -i 0 console linux
>>4. /usr/libexec/petitboot/pb-console
>>5. /usr/sbin/petiboot-nc
>>
>>After the change:
>>
>>1. /etc/init.d/pb-console start console
>>2. /usr/libexec/petitboot/pb-console --getty=3D/sbin/agetty --detach -- -=
a petituser -n -i console linux
>>3. /sbin/agetty -a petituser -n -i console linux
>
> How did the -l option disappear here? Is that due to --getty=3D instead o=
f --getty?

Not because of --getty=3D exactly, but you've got the right idea. The =

script does not add -l if it sees -a.

> Anyway, the only reason to use agetty is for the -a option. Can't we =

>achieve the same by using su? I.e. create a wrapper script around =

>pb-console that does something like
>
>exec su -s /usr/libexec/petitboot/pb-console petituser

It's tricky. "pb-console --getty" runs getty which runs pb-console =

again, so at least that first invocation has be done as root. Instead of =

a wrapper, it can be made to work by adding this at the right place in =

pb-console:

     # If we're root, rerun as petituser
     if [ "$(id -u)" =3D "0" ]; then
	exec su -s "$0" petituser $@
     fi

I'm not sure if patching pb-console is preferable to depending on =

"agetty -a" and .profile?

>>4. /home/petituser/.profile
>
> Something I didn't touch in my earlier review: I don't think .profile =

>is the right place to set this up. Either petituser is a normal user - =

>in that case logging in through some other means (e.g. ssh, sudo) =

>should give a normal shell.

In .profile, I can do

     if [ "$PPID" =3D "1" ]; then
	exec /usr/libexec/petitboot/pb-console
     fi

so it only runs when petituser is logging in by getty/agetty and not =

through ssh or sudo.

>>>>+define PETITBOOT_PERMISSIONS
>>>>+=A0=A0=A0 /var/petitboot d 775 root petitgroup - - - - -
>
> Given the information below, why is it in petitgroup? If pb-discover =

>is just going to create directories there on which it can mount =

>things, it's not very useful for pb-console to have write access to =

>it, right? Unless pb-console needs to delete those directories or =

>rename them?

You're right, I think /var/petitboot is really only used by pb-discover =

(root), so we can probably drop this.

I'll revise and split all this stuff into more than one patch so it's =

easier to understand when looking through the git log.

-- =

Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
