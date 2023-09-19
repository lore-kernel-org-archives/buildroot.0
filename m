Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB1ACE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 15:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD5461637;
	Tue, 19 Sep 2023 15:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD5461637
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efHMvtNRrP-a; Tue, 19 Sep 2023 15:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3126104D;
	Tue, 19 Sep 2023 15:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C3126104D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC131BF28B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16EE140A0F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16EE140A0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNCsCGE0n7pd for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 15:57:43 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6EDA4028D
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 15:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6EDA4028D
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JFiJdb019239; Tue, 19 Sep 2023 15:57:42 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t7dd92m5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 15:57:42 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JF7bAm010375; Tue, 19 Sep 2023 15:57:41 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t5rwk5eu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 15:57:41 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38JFveMd2753054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 15:57:40 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E7DA58063;
 Tue, 19 Sep 2023 15:57:40 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E85B58060;
 Tue, 19 Sep 2023 15:57:40 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 19 Sep 2023 15:57:40 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
 by arbab-laptop.localdomain (Postfix) with ESMTPS id C022D174FAF;
 Tue, 19 Sep 2023 10:57:39 -0500 (CDT)
Date: Tue, 19 Sep 2023 10:57:38 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <5fc45385-c627-43e4-9faa-21da307b87ab@arbab-laptop>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-3-arbab@linux.ibm.com>
 <3756a0b6-4b33-a4e5-18c4-f65c41ec3da1@mind.be>
Content-Disposition: inline
In-Reply-To: <3756a0b6-4b33-a4e5-18c4-f65c41ec3da1@mind.be>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RckiCHwJe0_KHZpS6qtwll9t-sm_bMpU
X-Proofpoint-ORIG-GUID: RckiCHwJe0_KHZpS6qtwll9t-sm_bMpU
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=+SPsEpkIJVWYSD4EmBML+EFzlBhDLBsY9OnO7Wib7oI=;
 b=kZmv8FqnpIKxCNW779L5S3oCMvfHF5AcZ5kLsvo+iGv2yBqJmYzX4l4NBxKGWosE1+yh
 rS9JUuq3+XUWJ6NCj8+GeqMPltzSyeOk/fQJHTyISzDHSP+V2tteATK8JpDxgEdYPyeq
 ep5glIGvj8Dun7rHVQv8iSKzBxLiqZrp7jhY8Iykk+86FdRHlVwYRyiXVc3qs7jC3HQ4
 9nVT2SQAf6BhBTgkmFGzJ7WrNuQZK9qB2O+6clSrQx+eqnyt4KStOHYr4CgFPIbcPREB
 ja5PJkSz3qXAQpAA6VRgMOMYJP3U5FjMUXSamdZy3psYv3vuDMnvvQH4JqE0I+8upbfa Yg== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=kZmv8Fqn
Subject: Re: [Buildroot] [PATCH v2 2/5] package/petitboot: run pb-console at
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
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 17, 2023 at 08:44:00PM +0200, Arnout Vandecappelle wrote:
>>--- /dev/null
>>+++ b/package/petitboot/petitboot-console-ui.rules
>>@@ -0,0 +1,5 @@
>>+# spawn a petitboot UI on common user-visible interface devices
>>+SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
>>+SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
>>+SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
>>+SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
>
> In general, it's quite likely that there are some serial ports where 
>some device is connected rather that a console (e.g. GPS, Bluetooth, 
>cell modem, ...). So starting pb-console on "anything that looks ike a 
>serial port" is a bad idea.
>
> In Buildroot, we by default assume that the console is on 
>/dev/console - which is why that is the default for 
>BR2_TARGET_GENERIC_GETTY_PORT. If it's needed to run pb-console on a 
>different port or ports than the default /dev/console, then that's a 
>system-specific configuration.
>
> I see no way we can have this generic assumption of "all ttys need 
>pb-console" in Buildroot.
>
> It _does_ make sense, however, to put pb-console on /dev/console. 

Fair point. The intention is just to replace the login prompt with a 
petitboot menu, so if buildroot only assumes /dev/console for getty by 
default, then this should too. As you say, anything more can be 
system-specific.

>However, wouldn't it make more sense to do that in inittab instead of 
>with a udev rule - like the getty line?

This part I'm not sure about. In the petitboot docs it does say "it is 
useful to have this called by udev", but not why that way specifically.

http://open-power.github.io/petitboot/dev/linux-image.html

> BTW, I don't understand why you even have a KERNEL filter. Anything 
>that is a tty could be the console, no?

The filters are very broad, but I guess still an attempt to limit things 
to the enumerated "common user-visible interface devices" instead of 
being totally open-ended.

>>--- /dev/null
>>+++ b/package/petitboot/sysctl.conf
>>@@ -0,0 +1 @@
>>+kernel.printk = 1 1 1 1
>
> I'm not sure how useful this is... There is still output from the 
>init scripts coming on the console, so why block the kernel output but 
>not those? In addition, by the time we get to S10udev (or definitely 
>by the time we get to the inittab stuff), most kernel output has 
>already passed.

Boot output has passed, but pb-discover is in the background populating 
the boot menu with bootable images via disk and network, and I think 
there can be enough kernel noise at runtime to motivate minimizing it.

Thanks for the review. I'll reevaluate what changes are appropriate to 
carry in buildroot vs elsewhere.

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
