Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BDEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 16:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A64061473;
	Thu,  9 Nov 2023 16:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A64061473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FtAYiL1yvns; Thu,  9 Nov 2023 16:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF4C60F4B;
	Thu,  9 Nov 2023 16:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF4C60F4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1B91BF418
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBB9260F3F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB9260F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nr5_vh6xA4j5 for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 16:14:00 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D599561266
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 16:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D599561266
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9GCeFS022801; Thu, 9 Nov 2023 16:13:59 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u92r7r1nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:13:58 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9EFWYB004176; Thu, 9 Nov 2023 16:13:57 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u7w214unj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 16:13:57 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3A9GDvYg18088504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Nov 2023 16:13:57 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F66E58045;
 Thu,  9 Nov 2023 16:13:57 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABEF858056;
 Thu,  9 Nov 2023 16:13:56 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.61.80.56])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with SMTP;
 Thu,  9 Nov 2023 16:13:56 +0000 (GMT)
Received: from arbab-vm.ghola.net (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTPS id 411072F0430D;
 Thu,  9 Nov 2023 10:13:55 -0600 (CST)
Date: Thu, 9 Nov 2023 10:13:53 -0600
From: Reza Arbab <arbab@linux.ibm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <291a2490-09ee-4d84-8b59-483749678bf3@arbab-vm>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-6-arbab@linux.ibm.com>
 <73d7f53b-b52e-45fd-af74-dd24d2e5bf85@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73d7f53b-b52e-45fd-af74-dd24d2e5bf85@mind.be>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d4zhVzf3qsuXnWnr1CZWJx8hqqteyIAP
X-Proofpoint-ORIG-GUID: d4zhVzf3qsuXnWnr1CZWJx8hqqteyIAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_13,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=831 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=KDVlhaN8FGVpKPS0bebMl7QaKUXi5L7hn4z1gSg1LSQ=;
 b=szeHVVTCq+V+ESHHg+Nz9qcU8j3kgfY3rjlglLgouBlwVRJAjLKNL//SvlZUzhshU+qQ
 HYO7jB1OdsYfGH+AuKe6MJtMcjsyIHWTZmWAE6kt78CaWJblzvjVYDkjbloYXm2Ox4Ve
 Gh55tIZR7k+5kTgmawtdi0xafXers7fVFL1mcATHAzhdn77Y9JCbFR5v5eMogrhJCJVg
 tp0gtSov6FOSHOh7UBBpvpZuJ+vbq9kZAM01TfDnolCRtp5bxFczrREIYCxxx9+GS2c6
 giz9r4KnuatJkj25FCeliiBJIS1px7dDamArFGlAGaStLOw8k8upWvQEsgNi2HXHlMvU UQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=szeHVVTC
Subject: Re: [Buildroot] [PATCH v3 5/8] package/petitboot: fix shutdown
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

On Sun, Nov 05, 2023 at 06:57:47PM +0100, Arnout Vandecappelle wrote:
>On 09/10/2023 17:17, Reza Arbab wrote:
>>There are a few ways to set HOST_PROG_SHUTDOWN that enable us to
>>successfully kexec the new kernel chosen from the petitboot menu.
>>
>>1. HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
>>     `- bb-kexec-reboot does 'exec kill -QUIT 1'
>>         |- init sends SIGTERM to pb-console
>>         |   `- pb-console does 'trap 'reset; echo "SIGTERM received, booting..."; sleep 2' SIGTERM'
>>         `- init runs 'null::restart:/usr/sbin/kexec-restart'
>>             `- kexec-restart does '/usr/sbin/kexec -f -e'
[...]
> It seems to me that (1) would be the proper thing to do for sysvinit, 
>openrc and systemd based init as well (not that anyone would be crazy 
>enough to put systemd in a petitboot image, I hope...). So, if I 
>understand correctly, what needs to be fixed is when init is not an 
>actual init, but something trivial like a single shell script. So at 
>the very least, the condition should change I think.
>
> But then, BR2_INIT_NONE is not a reliable indication that PID 1 is 
>not a real init. So I think it would be better to instead decide at 
>runtime which approach to take. That could be done for instance by 
>looking at /proc/1/exe and comparing it with /sbin/init - if they are 
>the same, we have a real init; if not, we probably have a shell or 
>some such.

Good idea! I'll set HOST_PROG_SHUTDOWN=kexec-restart unconditionally, 
and make that script smart enough to accomodate all the init options.

> Also, why don't we simply always do (2)? The only difference is the 
>message on pb-console, and normally it would anyway be pb-console that 
>triggers the boot so it would already have shown something, I expect?

Well, just in general it's better to terminate things properly before 
kexec. But also, pb-console doesn't really trigger the boot per se--it's 
pb-discover doing that in the background, so the SIGTERM pb-console 
receives is considered the final notice that we're going to boot.

What's nicer than the "booting..." notification is actually the 
preceding terminal reset, so you exit the ncurses visual mode,  
scrolling is raw rather than being confined to the window ncurses set 
up, etc.

>>@@ -46,6 +45,17 @@ else
>>  PETITBOOT_CONF_OPTS += --without-fdt
>>  endif
>>+ifeq ($(BR2_INIT_BUSYBOX),y)
>>+PETITBOOT_CONF_OPTS += HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
>>+define PETITBOOT_INITTAB
>>+	grep -q kexec-restart $(TARGET_DIR)/etc/inittab || \
>>+		printf "\nnull::restart:/usr/sbin/kexec-restart\n" >> $(TARGET_DIR)/etc/inittab
>
> So, if I understand correctly, previously this wasn't booting _at 
>all_? I mean, it would just reboot instead of kexec'ing like it 
>should?

Yes, at the moment we are doing `kill -QUIT 1` but without the above 
"restart" entry to do the kexec.

-- 
Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
