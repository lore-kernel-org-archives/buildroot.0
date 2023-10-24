Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BED0C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 15:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 251684EF4F;
	Tue, 24 Oct 2023 15:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 251684EF4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulsiJwxEj4Gc; Tue, 24 Oct 2023 15:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C92D4EF40;
	Tue, 24 Oct 2023 15:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C92D4EF40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBAFE1BF3F7
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F23F42FDB
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F23F42FDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ao2Ynfko4BHb for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 15:17:47 +0000 (UTC)
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on070b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::70b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 768AA4300F
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 15:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768AA4300F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=yuIE7kVvoF41VZlmL+iPt5QyNNkOJj/3E2keN+fQCT9VHVoiih8Ns12l9toYcy1XzL4lXBl6Gy3yTXhuU/nJt1K+uMzh9Ywg+H80y1lG8ZwxAEsEJE265Duvb6Rk+riRiIc52bizvg9bcP/CaY4Htn7tDLA6ghkw8uc7eyid6iUnIxPYC/y3P3coMAECfD8090QSowyS7TfThE7+EDXuebEiESEuoSZZhWgUoRPQH9Gj88T/WGODO5Z44LrRIY8y7/dsmMCCT5RcF0lshVq0VgSMbTIfdL9ZxRRZHKVR6vHKjuptRtrvj3zc4qfAb7oWzJIBdAjtyroNATSHIxPscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5njMP6sCVIjqG2+zTIwk9cvXDKFvDFZiR7GCfLHwkno=;
 b=eAS5kkR5P/4sbnmxLLUEkuM7QAN0g+r7yrXYRpvirnb55RJQXN7GvCvOEKjOahOeuISTmo2zm/u6DNeQqOGcZAop82aGJ0Rr2mZ8i7rfsvkgm1CNOGA5pWgF2tMtOFQbhqv+frQzwyDGbU7As2IPqUydPslZnRKyqYw63WJ6LBOwqqvvvbjxol7u0R4wVAok475zsjrq//bT9Z5XKd62sGh8bIzYMq9Li8rgrMa9o1nu64ACDet/i1OQgJdBJuDlMDVMCC3lSPVBsem8bv0XZ6hCzeCnOT301zUXOrLDbfaSdTtjAmHbsPJo7wbbmju3Q2vUQ3RRsCFjPRjXBmdQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1250.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.51; Tue, 24 Oct
 2023 15:17:41 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8c5a:5252:71ce:59b2]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8c5a:5252:71ce:59b2%6]) with mapi id 15.20.6863.051; Tue, 24 Oct 2023
 15:17:41 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Marcus Hoffmann <marcus.hoffmann@othermo.de>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
Thread-Index: AQHaBGbwkOetTmJV/Ee/cQHuI7LAIrBXU3WAgAA+tACAAEK5gIABI4/QgAALhQCAAAJBwIAABp6AgAABwQA=
Date: Tue, 24 Oct 2023 15:17:41 +0000
Message-ID: <PH1P110MB1603BACCE9A528FF031B049A9FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
 <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
 <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com>
 <PH1P110MB16038C63A3D4037B53F502499FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <12dadf47-47c1-d158-b6f9-1f15991553e4@igalia.com>
In-Reply-To: <12dadf47-47c1-d158-b6f9-1f15991553e4@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1250:EE_
x-ms-office365-filtering-correlation-id: 39c8f69a-0db7-4afe-9ff9-08dbd4a45d72
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pdko+1jSpgja0uFcoSPvJaTWY9DM2SsM6UrzZGrcoBZtWA1vTd7ls1RIfvQT0MsbHRHeZFkZs17DV+ai5qvou9nkwBR96y/XgdaEsm2Y5RT8+qrx1L1CvP/r/SW1MC9mv7DB+Nc7/E/wcwISKNkTbvAOTso5xihkKDsIpMeSe00bUZ6kXvbmiwRZRuMNgK6FFjO1n6T2exjoEepKrmxzoyfy05QGsqRzCcysW3f2CSSx30cjOhqGNMmXkzPwlkwKb1E9lBQ7IkamHfHvTDTt3r04hYX63s+u++DluhtMzAj0oY15xwAik3lwnaAJTMR6FexvtklJFTxQAPEVWIKZAdCyalqFpVJRRGuXe4ByZgO/HyzcF4O+u900ax3x7bLXosSBwwi0Z0TIsErQyTQRO5OWmcZSaTgnhmD//cBSSlMhQY5Dq7I4ijyIKiotxWAzE6SQbkCK8DVW7m9pAs+F21UxRodSiThU6z5c7saGCJ3gG1+Ae+GqgmpIR9dCQkN7zn521OSqUeZjnSR0/UCJZK0p6TbLsIel/gDJJJkeh3rMsFKQSbuAViOiOmWyUA7dMWeGr3NbUFTy0noAjXJ7mhf62qO4Vm2cajmJqfGWkqbrMgp7lJBGnvQjNCrbDQE8dlu0GfvIGtN0mI9naExcDwuDXTBAU/c7kLBHmVHXK8woXjoox4QjOTKmEM2nZdQQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(55016003)(41300700001)(7696005)(2906002)(38100700002)(64756008)(54906003)(66476007)(76116006)(66446008)(66946007)(122000001)(53546011)(71200400001)(66556008)(110136005)(6506007)(508600001)(9686003)(83380400001)(52536014)(86362001)(5660300002)(4326008)(33656002)(8936002)(8676002)(38070700009)(26005)(41320700001)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: tUjVZH+Qw3Ewo8879/QJ9wLA9SnS/bHZa7yn/Wv1vcJH8TYoRxsIYVdq38awgG4J9PCJlwIPnVeaJ1XNKKDJ1LpUzMWDe3zWCPxjg6sbsLMHupwZ1M8Xy9NCL6KDRd4tsf57P5jngGdBo3NdixjChaTV0WudVLP4vYqp29P776OCKjpEvKGEi9whVp0/quE4n2DUNjiGVI2qDifPig2WmnhQRmHQ3LKFfJK2HNQ8x2A7vvM4GGj5TNJbc/z3KMuG/ANJ542iPiQgPsPpmukkSnMzk1b+8q9ZDIrQC+jeZjfKUDMcimszeE4t8WaJngT6X5qxXYr8YKE4ej//csJjiik1vGdBH5CTxa5VfQYXP+haIMepPy9ERYvrr7lDJj+qU8Ft0xB6SlQPq8lDau/xbnBwrfj+7SgA4QoDgZ7CG7k=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c8f69a-0db7-4afe-9ff9-08dbd4a45d72
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 15:17:41.0425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5njMP6sCVIjqG2+zTIwk9cvXDKFvDFZiR7GCfLHwkno=;
 b=vDr64Jthr+ql+BqiId4FlS/R+Nlw/djiNoGKrNuu1+403HRsTngJQzckSnbXSELRRBCGIK8+8t9rHjv06HCIVvOQSVqUm9mIJW//7n979CR38GPdLcm6Qtmj+pGd0PAzjPHInucymaWHWr7hyunVMUn/qzeCZtiZzyP8IgHHJpctalr2Dna/BUcUm8r/pds+8dWR/yD/MQ621TmV3AI0LgbJj5fs043iHomGECQ/E0hNOYaDviQ1lKh2pQc28GH/Sh5STe6cjubkJfIdceOfIycfB4CheeQ/wwo1AzZbFNumrOVJkfCPWW9snVsJTx99KZPI0mDenytgwUb7RWbZKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=vDr64Jth
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



> -----Original Message-----
> From: Carlos Alberto Lopez Perez <clopez@igalia.com>
> Sent: Tuesday, October 24, 2023 10:00 AM
> To: Vincent Fazio <vfazio@xes-inc.com>; Yann E. MORIN
> <yann.morin.1998@free.fr>; Marcus Hoffmann
> <marcus.hoffmann@othermo.de>
> Cc: Martin Bark <martin@barkynet.com>; Julien Grossholtz
> <julien.grossholtz@openest.io>; buildroot@buildroot.org
> Subject: Re: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*:
> stop setting powersave as the default CPU governor
> 
> On 24/10/2023 16:52, Vincent Fazio wrote:
> > All,
> >
> >
> > RPis can be deployed in numerous ways, such as being seated in custom
> > carrier boards, so I do agree with upstream when it comes to "playing
> > it safe" and if your situation/design  proves out and isn't flaky, then you can
> opt-in to a more "aggressive" governor.
> >
> 
> That is not true. Upstream RPi-OS defaults to the ondemand governor. The
> kernel boots with powersave but there is an init scripy that swichts it to
> ondemand as soon as the board boots unless the user press the shift key.
> 


Sorry, I wasn't very clear here. When I said upstream, I meant "upstream RPi kernel", which default to powersave. RPi-OS does have a mechanism to switch governors post boot.

FWIW, we use vanilla arm64 Debian Bookworm on our RPis and had to tackle this problem too, so I do understand where you're coming from.

Again, I think the biggest issue is just informing users and letting them choose the right solution for their deployment.

> So what is opt-in is to use powersave (the user has to press shift), by default
> they run with ondemand governor (ondemand is equivalent to shedutil, just
> older)
> 
> 
> > I think the problem we can all agree on here, however, and it's a
> > point you made in your upstream PR, is that it isn't advertised or
> > clear that by default all RPis will be running on the powersave governor so
> people don't even know they may want to change it.
> >
> >
> > It may make sense to update board/raspberrypi/readme.txt to call out
> > that the default governor for the upstream RPi kernel is powersave and
> > that if users want to change it how they may go about doing so.
> >
> > I, personally, see value in the cpu governor kconfig fragment to
> > "revert" to the default linux-stable governor if consumers want to opt-in so
> everyone doesn't have to reinvent that wheel.
> >
> > I obviously defer to the BR maintainers about whether the rpi defconfigs
> should use it by default.
> >
> 
> I think it should be done the other way. Default to the Linux one
> (schedutil/ondemand) and maybe document on the readme that if anyone
> wants to use the powersave governor document how to do it.
> 
> Please note that RPi-OS also defaults to the ondemand governor by default.
> Using powersave is optional (user has to press shift key while booting the
> board).



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
