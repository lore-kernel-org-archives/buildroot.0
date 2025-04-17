Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C8C369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 13:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70E384AB6;
	Thu, 17 Apr 2025 13:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LLaemNmSiYP; Thu, 17 Apr 2025 13:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E775D832E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E775D832E6;
	Thu, 17 Apr 2025 13:33:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1171F3
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 13:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF78381ED6
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 13:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLVgI3iHSFdJ for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 13:33:30 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::602;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9FC0819B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9FC0819B4
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0602.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9FC0819B4
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 13:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=eQL8LQ813GMXsjyAvwDA3Mu8Cg6Yrp++x8WplIwU/QRo4cfOa5mr1oQ4zZDslExXsBClAU1q6KKyIuETe3pZ9Z3/4NdK/2Je/5RYxhk1c3WuKk40hv977uQJUHHim3RY/ikYyvCFjpDCqEzTBokRthwtg6yMm1kTw6ulLMAk3i80wb2mUkQCEH28ZzNOP2llj7lNn5wiyAQ23hKebhPINvltJ6pyWbX+Xt1XrP9XMpe3QDuy681ufyLhb+MKnW4hXiwW2MyrJZs5qxSaKYf7SDZGov403UBaRTIXKRedA7mAs7U4m+Vs5rXwz6z9WDS3krJHc9xO/4/8dvSuGayC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2FypynILNCMnb58tvw9vUNMkOMayN8fjEgrCTS+cKA=;
 b=uGVijJNBD4jwFlIG82D4xv5kdp6FSL1fx49IkftZpOerr7fcIG3WlI6zJUS18sfBJnNjSt8c5r6a+F+AdOK3/m9IH/FwkU5maLkj4RwmHLOsMTnQ2+zF/b0oxGFbSC3uXEHi6WqhgWnPyBrMLif4Y3NQXzD+z4cPdkOBbOVv/F0YQk80s8iaiL95PhGFO0/jOOGG3+GhxeQzFXWuCYNriPRvsmqQy0nEhCipl79s+kQp15ljbqopUMlBYXms4g7+nUIbSa2uUudNGGN1lYvifHkfLfJzBnlDF/NJCZ8Hl2zrXdx917m6r7TF8NAShZ2B7pRFB5gJ7oRgVqadU/nfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB1310.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:194::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Thu, 17 Apr
 2025 13:33:23 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8511.031; Thu, 17 Apr 2025
 13:33:22 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, James Hilliard
 <james.hilliard1@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-04-16
Thread-Index: Aduvmvvn5gMXXZm7QDyNhgH2YdunVw==
Date: Thu, 17 Apr 2025 13:33:22 +0000
Message-ID: <PH1P110MB16036167354B3CDFDC1D66BA9FBCA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB1310:EE_
x-ms-office365-filtering-correlation-id: c8230081-3778-40bc-f4e6-08dd7db46cc9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4w//2WVWRN5Trt1pDdg3J7kXFGdK2/+5MJsNp/SjP+3dDipB4ZQOZCxz8HHc?=
 =?us-ascii?Q?JVI3GWRwNO0JLcw8+4ljg1aF1YEZdUFT/N+ZsjQUBENCOU3M22XVnbjr0y/Z?=
 =?us-ascii?Q?6xhAzEa4T4AebrnvVAbr732qWpKCFqGfemA7FD1MFQyIC7sMWt6iV71yzxOk?=
 =?us-ascii?Q?9NemwO0yXD/xUAn0And8qX8NCXorGchTi2TLolCO7Qhivf8x+iEJDOQUZUqM?=
 =?us-ascii?Q?iHCz9xCCKQ3KSbsLs6/TIApIVcyl9+zdYcYaAD71p4dfzUk01UN1M1OlHNuw?=
 =?us-ascii?Q?2YkIgrxbrKxFnNHucT3l2mG+hEv0Tx1Q09Qgwnk7V/8gUtb49NeNiTUag3wi?=
 =?us-ascii?Q?tfRsNqrhYs8m70RL+rszi/MzfSsU3u2nBTryp9ocZjJYYwIL2rMHHWEmrVrr?=
 =?us-ascii?Q?2KHIBtrR4kCTav6jKIVXDoWoFsh3PN2yoIzvmNsDbHDhJNQsZFfJ6fsSKoun?=
 =?us-ascii?Q?/TIhZeI28ggvB60qo7gk/3lRepCsCQJoZg1gGjVeGDOER9W/twlEPnR7If+k?=
 =?us-ascii?Q?gm/f1OHwpNzqMCS5JhbdKHovHaaPeezewwzJmh6Yx5wvrVDn84DvZiFnIIP4?=
 =?us-ascii?Q?rfp62m9yDwEIEef7uBf7bRAPCLdEB9CBOSyKoGBSmDJ9YNNDPBssfHqRFwX+?=
 =?us-ascii?Q?vcdgLwxrjzPZLEc7Ko7g2iTGroOSK6xTToUdPU/UwIehyQFxnQr+Eu1+l7UE?=
 =?us-ascii?Q?BVT8q3CaOye6uSqBRJ0clY+RarVqIZmRDeBN5zC0yrUqFmezIX8UJyUUHUtY?=
 =?us-ascii?Q?4XnIhApF2/kpVf1jC2AqBnz2uPTwiT59VrW6E9XWgp28wt0g1UUxDEwI5tWa?=
 =?us-ascii?Q?ZaeVO2kQJot5gGKAmsSFTWKaV2Mwo+n9gn93Thbd0ug1v9X0NrFVhVMeFcrI?=
 =?us-ascii?Q?iiEf+re3NyhFBSOH3fi/r/Q4mDpWI8byidsIgpJcbKDgvJB4VxOta3KqqDHP?=
 =?us-ascii?Q?ofKE3GXlahUTGXBarBRhBO8WOPySazEcH4PmK4ajNy3R/ZKWuOhkqIzg8r5F?=
 =?us-ascii?Q?9xdbKDF9H0hnfv1arne7Hwwdchcu18me/QXfdHJp8wMLqV4FgS71kZHLgIxi?=
 =?us-ascii?Q?c1a1iCbDdEPbI1HbQah94ve9NiHePhiNVDmHwMF/YofHCoPK2Ko/hAC5QHjh?=
 =?us-ascii?Q?/YP7Iwj92YFUO8f9hRnsjy6kGthe8RBf5IDa1xuyycRHu0fuPaO9UnWGRpnF?=
 =?us-ascii?Q?vYvS27jrPSnSgNPFZD8YyC/WKKNov6UAy28huYXNOf1o7mwMWYTmNAw79Vs+?=
 =?us-ascii?Q?JtNv9CZwbeP24AJTIgeY6ciVRul9XiF5QZ6Jsq03XpeUCegOkjuTDyTZZV+e?=
 =?us-ascii?Q?AsPTi/d+3fCUmctcUkRh6H0EKUi6TD8a8N6G3A14liOkLMdMo5b3OmDEw3ey?=
 =?us-ascii?Q?UVTizlpoIt1q+x3iTJt1ZDs55u3znjIhMTDM29g4dJvNe9DbOUZGUcJFbbAw?=
 =?us-ascii?Q?OcHzy098Ykoyc27EYp9YFQtycq6GXno7UBoUKjtxftzgw3qh7Fy4rlbxr2uB?=
 =?us-ascii?Q?z/8WnO5pVIjozfM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yJtufF55FscCzK74Evpg2sQT9IsXSSa71WhSCOlYvVod8X1HLliEpkfU64AG?=
 =?us-ascii?Q?3fIUHrq9T7+7w9cpPc0Mu4+0YtjgIU/9ulTghH2VNC4FAod+uCRk3hVGPNf3?=
 =?us-ascii?Q?NGavfO/Ksb32DCXZgoZmwMAvhmmGYut91C3HmCOHynCGpVygZKeqi/unj8xP?=
 =?us-ascii?Q?9BlpSycj5tbdmkgn3GZ7gbvhXt5OHzltFcMjf4HlT8btzfEZ3vh2XsCq8YuW?=
 =?us-ascii?Q?SoIkpYiloL6gTb999PiVbQOUfnix2fdPUNpTv68qTAVSs/gWAo2BElHpiy15?=
 =?us-ascii?Q?YqFA/hZkYsbG8rl8Oo+TlSZGtx2UOvs40o/FGpz9D1ExqNbEjOvLyhhB1XZ4?=
 =?us-ascii?Q?GVyXd7reAgc2nSwxE0pKVC9Fm5E/HFFXVHkDyVNI/jZBo6VivIq4VwUomTyK?=
 =?us-ascii?Q?wqLFlsf7A6/pAQ5jLVn8P6Os+05nc4+ebv4u0PpnNyBtIFEKnSlew9NVua4u?=
 =?us-ascii?Q?qrmC16o3+gX3ksAqR5pifZZIknOIwsEFvNcIKZjFp4grG6dFYm2riP+ONFmx?=
 =?us-ascii?Q?6oCxo3IeHSAv51Ci3do12Xk+97T6TF0D2eWHClQxadKUgVSaO6lsCah30nDq?=
 =?us-ascii?Q?kLCaTCjTgnLNAVtAXvZlXN1Ca6NuPVLVJKDnEjqqq/uwGlMfSydwdCEpBP7M?=
 =?us-ascii?Q?qkZBNaCmloFaAnQPmEypemk+ZHRJHb6lzFpoDzvTq8PgVzfyZunp9QUXfljq?=
 =?us-ascii?Q?1ho2y7U1wlfYU+tMtOaaXUH2qMLljYGQjijNMusgrL1xkjZT4lXRNe24qVgt?=
 =?us-ascii?Q?7fya0p+l2T7ssJdhN092nZSekbQgZo0pkEuaAB/5ODANiBrAvpK4wK1YJqr5?=
 =?us-ascii?Q?djHpET12pTkOR207yPIkqEiXnnep0nKgGkFwKNgiFom0nVhHkPlUhWqmhrNS?=
 =?us-ascii?Q?X7GV4YGwfMzwdEx9oFN0H9LYlF+sNza0pLNfrHtpJI0h5e8HH7upeQ95H/o+?=
 =?us-ascii?Q?kVQlgw+/UxtNpTlBbHCoWMNrp+iXpMR2gkQWRuxa5YQtBNxxR9Y5X4bQwa8c?=
 =?us-ascii?Q?K5WDhcdEx5rvV1h/tkCTD6DHA9JYEg/wQLSAnd9nWISnkqX4ZH8vGgwl8zrR?=
 =?us-ascii?Q?dwNBFUazZpO4f2fORtajinTjDHYgRvvWpYXMQqmO8GRTb16gAf1xON871ZWu?=
 =?us-ascii?Q?u8kuTx659MNzaC3JGEQGHuvEe2NrRQaJCTrxWMaWLjkOmHNXHYowE3SejyV9?=
 =?us-ascii?Q?JXolypETUHm058iGWtQu84Zozswjn3eXLqC5XM9Sw2G2Mr50tzby0c+nJX2u?=
 =?us-ascii?Q?zNiDhzmWyNys/WL/Vlm8uoCakYXxMUzFNb6pYIn2+V72zgsaeB7XRskXqs7K?=
 =?us-ascii?Q?hw4qTv/07/vthotaZaWx95TnCT/U0JG+bvQ0OhPPh7POh9/HmnkOeZA99tGw?=
 =?us-ascii?Q?sXtW1mDW4OaO8o6lHzaZg90gEaBtR/FN5uQZb8TANPwK2iRlXaAS1PIvws/9?=
 =?us-ascii?Q?SB2106vtrx7cR7t4yPTMBQEH3GdQ4Yks+Ffuii9W5xSSxABeEElM2bqigAXT?=
 =?us-ascii?Q?vHZ8aEcbULuwhGU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c8230081-3778-40bc-f4e6-08dd7db46cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 13:33:22.9187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1310
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2FypynILNCMnb58tvw9vUNMkOMayN8fjEgrCTS+cKA=;
 b=a2vHfjxG6ZB6rcy5aJxwmJYnZUvp/3CD1WOwyZR5v02HNtqiCGMCcJ8WDQtFxCiAtaZI6YiLLrIwcOLGgYxulZAsK8Q0+ihDnUeiwLVH9liSBxaSd3WmJHqxCtzxzknK1ZJb7r3FDjTUDmA7DpqUL32SfI3DOMhGIMJMY9YepEAlGQzOtSnakju5ZJAtCb5TgV3gIAxWGy6KG7efHb78ScHHKeKY01gDhMXB3T8Jf6zyjWd76+1F+My6EOJTnNWUYFrh4b7CX4dhoYSCUzo/epi0BI5oCvexOdKNc+mSFWYabE0tbqdKRhJ4kDExKElkAcHQQ7/0MCZQkGwKZ0Pwtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=a2vHfjxG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-04-16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, Thomas


> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of
> Buildroot Notifications
> Sent: Wednesday, April 16, 2025 10:20 PM
> To: buildroot@buildroot.org
> Subject: [External] - [Buildroot] [autobuild.buildroot.org] Daily
> results for 2025-04-16
> 
> Hello,
> 
> Autobuild statistics for 2025-04-16
> ===================================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2024.02.x  |  1  |  1  |  0  |  2  |
>   2024.11.x  |  5  |  2  |  0  |  7  |
>   2025.02.x  |  5  |  6  |  0  | 11  |
>     master   | 11  | 54  |  0  | 65  |
> 
> Classification of failures by reason for master
> -----------------------------------------------
> 
>                    libcap-2.76 | 8
>            at-spi2-core-2.50.0 | 4
>                    perl-5.40.2 | 3
>              dahdi-linux-3.3.0 | 2
>                    eza-0.20.19 | 2
>     host-python-greenlet-3.1.1 | 2

For host-python-greenlet, I'm think the failure is https://github.com/pypa/distutils/issues/355 which affects Setuptools as it copies in distutils.

We may be able to patch setuptools' copy to work around this for now. If I get free time I'll try it out.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
