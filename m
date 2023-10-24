Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCF6C00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4821B844AB;
	Tue, 24 Oct 2023 14:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4821B844AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oltnkPCOyIgR; Tue, 24 Oct 2023 14:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560F9844AF;
	Tue, 24 Oct 2023 14:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560F9844AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C84791BF2F6
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB3D342F85
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB3D342F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItnnQsUnqXMx for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:01:55 +0000 (UTC)
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on071a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::71a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD641400BF
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD641400BF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=KVntiyYSTkA4FNoF48tHsLr78yXRBTV5+O0Prtcnb7+cy+EIm8sjJCv9QgJm1jtq9h98hYIm3ZVQHuTGYXBNtYQfPqb/eexPE2Y1ePNHP0EGNwSSRJXtEjzdwFJmZT2XhFKWWjO7dW6cE873k3zkqaEY6nb3E9N5aLaZRtL+SXskf5+gyNH5/S+tb4JOGcybMFje8cTYpoMrZYJ3/h7w3/joJsYsUadz6bBhbnyetlppOO9Yfz9anIhYb8toFUg0iwbXFVJt6MfDtDy2VdWks9Ya6XQN6hEkG9dvyfF/AItHpdsP2P+WsmTd6gB9IXCw5YX8KNSs8EC1HX5HjIFbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrMNicRcbQWrrA6YhihBbLbzMmLoWul2c1pw5lTGjUY=;
 b=0GRhqxlR8BjgMmwOdq6e9qo2AtFcDEuDY5kqhd+qB5xQE/Xz3DcnUfa4jROKhxSrpEt5n2LqKK15OoWb3SdqfvSwWIGkRb+7WoCtyjvTphUAYftW+NoXQ8E5Z3GrHZAShSqaxKskc7qPNSmNIB2F8ZUBM7DvKWLDVfpYrF2+K5cyQVRn6/zKUfkWZsL91iJjjI17NZgl6TqEYW2Fr5CMAfPhmHopf5lpf/BihYlw9a/ReTzNhYO5acPrvuMkb8qN8LMDAPv8ZcIy23Ghl28D3SiErxzY7mDn61TM80Hq2zEN4AoqeLqniR9ScRsZ0zaybZAyyBnayWm5VG/kUIwOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB0971.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.51; Tue, 24 Oct
 2023 14:01:50 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8c5a:5252:71ce:59b2]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8c5a:5252:71ce:59b2%6]) with mapi id 15.20.6863.051; Tue, 24 Oct 2023
 14:01:50 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Marcus Hoffmann <marcus.hoffmann@othermo.de>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
Thread-Index: AQHaBGbwkOetTmJV/Ee/cQHuI7LAIrBXU3WAgAA+tACAAEK5gIABI4/Q
Date: Tue, 24 Oct 2023 14:01:50 +0000
Message-ID: <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
 <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
In-Reply-To: <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB0971:EE_
x-ms-office365-filtering-correlation-id: 5859b712-2c37-49fb-2d3d-08dbd499c537
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3PiSV65coohbNyf+gHjSMcRgdIwZgqAo4KPHiWEOnr3KJZczgF9nNBmcBGqPuNEXBXdsE+eOgalCZGCnxpSAsgGdcffuo3EHWcXnvKABE20E4mdczaE17vWcx4LvNS76ovhHFx0iDLwGtJQ8FRyLmFErUkt/7yeOASqDMCD+rfyvgE7PVEstxQhKp9kLJyBU2RJS7mqtRljoJzr7bSnYsXUSq39gRuxlOyNUsgKYe0Z8GJ0RiYm/VcufxYd+kfzrrEGky01vqeZbsq4a391G/F6PkzogrCUW1/g/jtAVCEXXxRM19azuzqDvQumLKrHH1CQOGcep+b30b70+3ouyrEXKKU6PQTm8ziwrfhi2Ec1DPfawg/0wfoVLzUbQfEBL2w243i9UmgBvxOZj5idZ/Tk3suZo1eDuKe6pvZxIKyz/K9z+sevAOnFa1NiL5M6Sl4pUGG9hPyjn4pnUV3Eu34H8+u4zJzYPXVZOnmAmotlLjvHx4Jl7YYgWUGB8dYTMtQZkO7AOpU8wOlWV7AcWUrfvlwWvq2CkDijDI1eJGa3ZGc2hIGVZHme9hUaXYJfgEVT0QxO7IuqsXThKdhomGMySIzhGPVUY+f6OpzaM8anGvVlfChYLUxpYA+OCdJGK4SZYqnY2q1e0QqKSmOsYKxmYbAIw2RU5lRLrrFlqDNo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39830400003)(366004)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(38070700009)(41320700001)(4001150100001)(38100700002)(2906002)(55016003)(86362001)(52536014)(5660300002)(4326008)(8936002)(8676002)(33656002)(110136005)(7696005)(71200400001)(508600001)(6506007)(122000001)(66476007)(41300700001)(54906003)(66446008)(76116006)(66556008)(66946007)(83380400001)(64756008)(966005)(53546011)(9686003)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: PpUJGMLPhTv0KkNTWUGcnjJJBO1LPdD1c5x/FQ/qDFbAfBfh/6KWQL5kd4/PEs6Ninyi9wkIAAw7rKNsJagBnOguYtBKo/V9KTHULW8RLXViAh99IYvM4kzodiYf/rQg85Yg+il+8Yc85dAX8i+Zozw5MJS3POcQQezlEvI8aWRTAc/MOf8XT1kadRjgJeJU37FabH1N5z1ADAwi9s6ESuVA0TRYQb7G/Flx/jRP1TgUo3vZaGIQRSgPf/uG8TegMP7ue5rMhZ0AULn3s2a9WF8MyUCMeHoiku0JYy1v91WYyjT6LYtO5+3J2CkMRsw7pqEcCItg8qQ4E9DCyXXCWCpeoJLME/9nActZBrVYaPKVfdOn6JlxeO+T+5OyG19CvrL04fSfiRyoPk1T3lHMejXbZ8ib6lkUAJ8m6RxAfWI=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5859b712-2c37-49fb-2d3d-08dbd499c537
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 14:01:50.6365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB0971
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrMNicRcbQWrrA6YhihBbLbzMmLoWul2c1pw5lTGjUY=;
 b=BXjWHsxSAyN56XUwWhPly44iA9DspnWreURO43fxrQgyHZg0owxwEBxVFzosucro4Ins7wedU3vrNcnMAhgneqbNxeblk8eo4cr4x3bpWFHHxmRv7r7qm57CH1TChD1ueXZEu6S5BBHbWgyT3hu6WXOwjVGVvchxfxO8coCdr7q/Pmv3Cg4NDMxlFq80KhIVFhSQVmSq/CTSmOX/yVit0EfPT+sVpLefBf4u12AyG+Tt1UtqvzyQjGJaiyjhw2dRovDLGexPwrguSwO/iX1oSWayGZYuP/4AQ4LsVGneFvTlCXiM+zRGcWPfa13G7ZEtrExx4xcD2l6UIoH1Yg4dHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=BXjWHsxS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Carlos
> Alberto Lopez Perez
> Sent: Monday, October 23, 2023 3:24 PM
> To: Yann E. MORIN <yann.morin.1998@free.fr>; Marcus Hoffmann
> <marcus.hoffmann@othermo.de>
> Cc: Martin Bark <martin@barkynet.com>; Julien Grossholtz
> <julien.grossholtz@openest.io>; buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*: stop
> setting powersave as the default CPU governor
> 
> On 23/10/2023 18:25, Yann E. MORIN wrote:
> > Marcus, All,
> >
> > On 2023-10-23 14:40 +0200, Marcus Hoffmann via buildroot spake thusly:
> >> On 21.10.23 23:38, Yann E. MORIN wrote:
> >>> Carlos, All,
> >>>
> >>> On 2023-10-20 15:20 +0100, Carlos Alberto Lopez Perez spake thusly:
> >>>> * The defconfigs from the RPi Kernel set `powersave` as the default
> >>>>   CPU governor, which is a bad idea as that reduces performance by
> >>>>   setting the CPU frequency to the minimum one.
> >>>>
> >>>> * In case of a buildroot build user-space is not configured by default
> >>>>   to change the CPU governor, so `powersave` will remain the CPU
> >>>>   governor and it will slow down everything.
> >>>>
> >>>> * I submitted a fix for those defconfigs to upstream here:
> >>>>   https://github.com/raspberrypi/linux/pull/5666
> >>>>   However, we shouldn't wait until that is accepted and backported
> >>>>   to all the stable branches (if ever is).
> >>> Unfortunately, the rpi folks have rejected this change:
> >>>     https://github.com/raspberrypi/linux/pull/5666#issuecomment-
> 1772531097
> >>>     We're not changing it.
> >> The upstream situation is that the governor is changed by default to
> >> 'ondemand' during boot though, which I don't think the rpi buildroot
> >> defconfigs do?
> >
> > The defconfigs are basic configurations that just demonstrate the
> > basic behaviour of a board, with minimal to no tweaking to deviate
> > from upstreams.
> >
> > Users are suposed to take those defconfigs, and adapt to their needs.
> > If they want to change the governor, then they can provide a startup
> > script that enables the required governor. Maybe we could cary such a
> > script in an overlay in board/raspberrypi/, though. Just maybe...
> >
> 
> Who is upstream? mainline Linux or the Linux RPi-OS fork?

"Upstream" for the in-tree RPi configs is the RPi Linux kernel. The maintainers of that
fork continue to address issues for their suite of products whereas full support has
not, to my knowledge, been completely upstreamed to linux-stable.

> 
> Because the default governor for Linux is schedutil and is what any user
> would expect to get on their build (IMHO).
> 
> The RPi guys are the ones changing the default CPU governor of Linux for
> some obscure feature of RPi-OS.
> 

Per Phil:
We default to powersave to allow boards to be booted successfully when higher clocks speeds are causing problems, e.g. with an inadequate power supply.

I have personally had issues booting CM3+ boards with ondemand governors with ethernet plugged in when the CPUs don't have heat sinks on them.

> I have argued with them that the place to do this change is not on the Linux
> Kernel defconfigs but on their repository for RPi-OS because other projects
> (like buildroot) depend on them. But they are not willing to change this.
> 
> So I think Buildroot should undo that change in order to keep the Linux
> default CPU governor to the Linux's default one (schedutil)
> 

Can't this be done by one of the following:
1) provide your own kernel defconfig file
2) fork the RPi kernel with your own changes and use that ref
3) add a kconfig fragment to switch the default governor
4) adjust the kernel commandline in config.txt with your chosen governor
5) use a startup script to change governors post boot (obviously doesn't fix the "must boot fast" issue)

> It is actually a bit surprising to me that we have to argue about this at all. I
> thought this change would be uncontroversial. I don't know why anyone
> would want to have the powersave governor by default or think that is a
> good idea.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
