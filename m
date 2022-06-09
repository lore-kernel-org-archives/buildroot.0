Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A00EC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D799610D4;
	Thu,  9 Jun 2022 10:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CVsulYAabzH; Thu,  9 Jun 2022 10:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 945F160E77;
	Thu,  9 Jun 2022 10:22:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDD351BF3DD
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 10:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB0A60E77
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ocl5iUKldjw for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 10:22:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::61a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A720C607F4
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 10:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWAAJ3azNan0DaxIO47wox3r6M6voo5YCNJH09xz8BjoPk4uxv74ypkbZ2F9h/ixeovbY1s27CFsjGXDHX5aYExCaeVrrPAivkWA8rjZa4Aq7K4FIaltiSlbsjDxERzpyRqYpvOIhdhIHoPD4PVYsArzNPkr6G3kd0S05ctiTERYrWMtBFpC93z1F1ldfcBR5YnPFLpBRCiCCFTDxXUD3BCN0jLyXIjWqyA/IW7DQJprOaT/AQEvHCSW7NrPkMHN4UxGe4u6zbRh389zjAqHKyFpo+zo0P9QxgDYmyuW2SOKdxkQrpaGbbYfyZR+R7WNX3EmB2Ys4fK4RASSlpUX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP0ozVoWxzF6zBcfbvsHBb8p10I/q/gv3uwzZuJxzgY=;
 b=mZstwFhkqMU7GtJ7YcffbqcN2StBkY/4GxgGvH0wnaul22oxf6YvyF/hdaKK+t9xlV+rcrnF31Ra4CoFZbJmIPHpMkTPvtUaUIyJiawnTuqP6zqKYg6onUhvzoYOvKAIoNcNw3Ghw9bYZPy9yTkq3QmBG14DKcE8yUPQjplCxwqAkcQLc0yZYGFYov4IsJ9Q+fiSH70JtuH+3IPKWmwbVTz0hNiQa3V23D/4eFUSHn1FhY5TPaphnNoe4mgB7ejmRKXOzRDN9Iz+zrAX0Kkyu8XMxqeoMHZPu7RVWQIaAPbzS6mRHovNFe2HCMMR7UUsg4avXDL3eyBNpUiAcOS6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP0ozVoWxzF6zBcfbvsHBb8p10I/q/gv3uwzZuJxzgY=;
 b=k1WMQGIdRVoCmAuc2qRkoN996fti7KZw7kIP61ynY1N6EOzIsPw9ZxKhRXUcyzEmxC3funAPcpeL5CUj4MAnEsSofQVDFlz2cCfJqQ0gYLlM9nsslk+YRxs+pUso4f2tBVQ067jV8JsjHttYn6GpaI3x0xSfrBTKrDC+xDBuBBM=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5914.namprd02.prod.outlook.com (2603:10b6:5:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:22:07 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 10:22:07 +0000
From: Neal Frager <nealf@xilinx.com>
To: Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v4 1/3] board/zynqmp/kria/readme.txt: improve
 documentation for qspi programming
Thread-Index: AQHYah1tiFdiPPWAx0+uXmyvtsxZ4q0kNRUAgCLMGVA=
Date: Thu, 9 Jun 2022 10:22:07 +0000
Message-ID: <SJ0PR02MB77581F883F1EE62C2CAF72CAD7A79@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220517183842.1389395-1-neal.frager@amd.com>
 <431dc45e-07fc-c615-9928-e0dccd3d1a27@xilinx.com>
In-Reply-To: <431dc45e-07fc-c615-9928-e0dccd3d1a27@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aebd8e5-42d4-4f49-0ddd-08da4a01e814
x-ms-traffictypediagnostic: DM6PR02MB5914:EE_
x-microsoft-antispam-prvs: <DM6PR02MB5914911F51D39C70813C97BCD7A79@DM6PR02MB5914.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fHK1C4w9KntV46mj1to/Vy1hG63xQ3lRQ6sLaRZawJjjIDXCafxFMOOfy/Y1nLdsqNmj/SX7qRdswyFG+8F9Qk9oj9DF7iwWR3OgTYRCTnl0JbUSqvIGHbCqDKfX7o/p93b3mK3dQJOKENxrvyab3Ym5bZwcK2OJhwOOi++XYUVBbdg5/K6QNmmjgjVc0Uzaub/JlGYMbT0fcRKbzluucJyrr1TSyuwCV+tsqsUJ3GCvGbKVJ1CNocAZGISmgpEyXE6cuv7DG/Y38LZGuC2bSBWlkh4oRiCivXgORteqv3+UytD7hY5/1LbVLlB968VjRgeQTdS9f2i/pDApQhIXUU0jGexEhfT5amqq4/F/HViZWKeSGQe6DJZPfCWRoTjCo1YNbo5/Ck3hC9Ki1pdP43hJb6QlXdfN/bsJOiTzvg5qbQMz64rd2eB4hDN8dGjryh+IHwmTtjgWH1KkyT65/5+ktDvV1pSYyKuvY2TreWMvWpuSds/KlMdc5Q6gCL9wM9Zbr6JWX88aBTSMV4+8y9GvFd8anEqV/eHlZh+yYK6EDqSzr8XK9OSTwgfRpW9DX/g1XuxKvEOJ6lmV9s0oUONjhLP3dcUcXMXOFYfid9L4pawEoubmYtBeE/JTx0lYou77/hV4mfniHEaeijhsAqm2cZ/kRGXIKwapKcrwBeEYODLT+x9Hq5xoURVDyWGrHYhuB/NZVrejZ4fhAUqHPS7+Ez9p/pX+fvn+qqprp29wexHg+wv1sgvQ+5y/zItVhd14Uo3zIWXFM+w0liC1PeukWEoF7zPPeGzmguuA+X8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(38100700002)(5660300002)(71200400001)(122000001)(33656002)(8936002)(966005)(508600001)(83380400001)(76116006)(186003)(66446008)(66476007)(66556008)(66946007)(64756008)(55016003)(54906003)(110136005)(4326008)(8676002)(316002)(9686003)(52536014)(6506007)(26005)(7696005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2VYRVlBcDRNa0lOMTFtYTZaK3d4eEZCa0NEN3lRWGZiUzJodElTY1JKSkV3?=
 =?utf-8?B?bUl2RW40YUI3YkYzMzhEZUZSb3h5ZzRIZm8wVEJidHUyU3ZDMmFhR004MUdo?=
 =?utf-8?B?UlNaQmQyUmZNUjhYL1lFRVA3V1M1SGpnVU9nYm1vUG5aSTU0bVUvRGZmL0hx?=
 =?utf-8?B?VkJnU3lUdGV4bFlOb1c4UUNrbk5xS0JEQXZGa20rTXJyUU5qVEc5bE5ERkk3?=
 =?utf-8?B?Mk9LZUYzVUJpQWtqSnd4dFI1aTQxTy9pZm5kd3BmWHAwNzRBUHhYL2hWVm84?=
 =?utf-8?B?WDRLZnBvelJQUk5kajM0a2N6VUNtaSs3M0lVTjhYem5qN3JCangrU01jUVhQ?=
 =?utf-8?B?dU5sUGM0Nkt0eE1iOFVqd3ltR09UeU5sVzNrVzBra3F4T2ZCRUQycGpad1U5?=
 =?utf-8?B?TXZOOEkyeC8zMjA0TXJFOWVUbnV2dnBQaHlNWUpncURHQUFsRHRRSVd1WGJ1?=
 =?utf-8?B?WncwWmV6TUtVd3BodExjUE8zNExHK2NtdE85N0FHK0E0K2xmMDRmQlVEUUdj?=
 =?utf-8?B?U0pDdU9LMmpYK2MvWkVXV0NGV2hvejNzb1JBYkM4dVpLNHFRckRQdHg2R1c4?=
 =?utf-8?B?dU8rYVJRR1BUL2pOVXNTQU1maWxrcmFycHdBUS9lRi92dXM3cVVOZVhSdCtK?=
 =?utf-8?B?N1QrNTgxNWhLcW0zZkRRWmNwYmRNaERORGw5UERhUXNyeE5QRVVDZTYzU0g4?=
 =?utf-8?B?WjZiUGFuWkFUTHkwWHpCcTZmTXM2b00zd3dFWkdyRnNzQm1BcDhyN3hvdWMr?=
 =?utf-8?B?MGFBYnFPWlhtL2R4TUJ5Z2RGVC8vc1ZLbXl0dTcvTGtPZmlLWE9tM1dURWJi?=
 =?utf-8?B?UHdWcy8yWmtzWDVDRzYray9DNVd3MElqbGNnOW9ObmhrVFlXTXpJd1k2dkEz?=
 =?utf-8?B?TmY2ckNWMHM4ZmRJbmZVWEwrZnQ2c1FHZjFsUWhqSWhoK1c2b0dzcVA4Qk1w?=
 =?utf-8?B?VWhTZmVZWG5aZGtudHY1N2syQzJ3RkdORVBVUGwzU05FdU4rNTlXc2UwRjZP?=
 =?utf-8?B?WUc5RXdTVG45N25KdnhwNVFlQ2NUNU5CQzZieWlGTzNEcldTV21JakNJTFpW?=
 =?utf-8?B?RS9tQkNCTFBoUE93TGQ3RE05Y2g0RzZYMmpMcVc3UXoxc09HMjlJWXFpNVFZ?=
 =?utf-8?B?VGNBeXZPa1VaRHdKcVJzV2VDaFhyRk1wTEhEbUErUTFxaXB3U1orVmpqYmtF?=
 =?utf-8?B?eS9OV0JxNDZ2a08wZjlwUGg4Qms3ZU13VnpJZWFSTlc4KzZWM2Nwa1gyMWFU?=
 =?utf-8?B?SThraEJaaW9ZRWpsdnhVTkh6UFd5V0pzMlV5NGp4MUwyQ3BaakVkOW9jY01I?=
 =?utf-8?B?VmN2YVBkdmdMRUpmV0VERzBuMVowaitVZ1N4K3M3dzFlL0JpeHBxT1NXUEtU?=
 =?utf-8?B?TmE4aVdjS3FkdC9pbEU1NnZHUFl6N3ZjakJCQkt1ZkRwL1BVVkgyWjdzTGJE?=
 =?utf-8?B?czZ4L2Zwa003MXhuYU1YTm5hOC84alBnK3ljeUVZbWM4U0NHcFB5anF6Vldq?=
 =?utf-8?B?eUVra3pNUzQrdXNkbE1ySUdTRHM2aXFabmdjTVlsZFJYK3ViNXk5S3p0T1VL?=
 =?utf-8?B?KzVsL1dQZ0c5bnQ0ZFBvK0xyQmM2M3NsU1FVK3JFZTBEUENJc2FuUDdkNjBx?=
 =?utf-8?B?NW9qZ2pTT25Bb3RhK1NEUUhob3lCRkh2cXowSlNaamFhMStlOGY5eElwRFlB?=
 =?utf-8?B?ZWVZQXBjcUVibXRveVZZUjNKRnhEWWw5VGZFa0JUcUxvNFhSYjlLR1RVU1dJ?=
 =?utf-8?B?a3huOGY4VVJGbnc5bHpoYWV1NndMSDdUdVZablB1ejhNN3BLUEQ2Ry84V0RS?=
 =?utf-8?B?WnBBZUdvc3U1N0U5WitZVndsNGhTOW50TGR6bXoxZ1NpMDQ0VUlGR0k3djBS?=
 =?utf-8?B?K2dTanFSd1hreENldEhyM3ZZdThwTHZqS0kwWXVvb1o0WkU2citaMGdYZG5s?=
 =?utf-8?B?aWVoTU1SNkRhbHlsMThWTWRhU2ZhU3VPeXBmSGdJNG55M3NrckVDVjFBc3JH?=
 =?utf-8?B?TEJUTnJwYVhHdmwza0hCSDN3N0tQcmNpT0hBcy9PMi81Y0dsaUsxd05qeUhW?=
 =?utf-8?B?alFaUm9DWW5tWWpRZTNvYlk1VGRCdUZRYUYyRGlFemN3cEdNeEJSalgrUDgw?=
 =?utf-8?B?Q0Q4SW9LZFpSSEpvdUZSMVZYNkMzSVlxOTdUL3IwOEVZRCtnRkpMR01kMUFW?=
 =?utf-8?B?KzBTNDNPYjZFOXhUem9wdk91bzAycVFZVENVQXFYbmVkeWFsVGhuMEpqVmdt?=
 =?utf-8?B?cHR6ak9wNlJFMlhoMGF0c3MzTStSR0pSN01razFMY2dkZXhicnA5bkNsejhK?=
 =?utf-8?B?T2Z3NHV2NXJldEorclJ3eWxkaHgyazVyaEwvcWpxSkhIcmtaUUdaQT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aebd8e5-42d4-4f49-0ddd-08da4a01e814
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 10:22:07.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ek9a2i85Q8Z39gc5i2pNkVa01OHlRdW5TKFascAknfVhvaa9p9eSbogI2LisGjy0u0s1LoeRY6kUsVdaO3j8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5914
Subject: Re: [Buildroot] [PATCH v4 1/3] board/zynqmp/kria/readme.txt:
 improve documentation for qspi programming
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> This patch improves the documentation for kria k26 som qspi programming.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> V2->V3:
>    - fixes boot.bin file name spelling error
> V3->V4:
>    - improved documentation to use $filesize
> ---
>   board/zynqmp/kria/readme.txt | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/board/zynqmp/kria/readme.txt 
> b/board/zynqmp/kria/readme.txt index a3a4b5e65a..977e88491c 100644
> --- a/board/zynqmp/kria/readme.txt
> +++ b/board/zynqmp/kria/readme.txt
> @@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
> 
>   Eject the SD card, insert it in the board, and power it up.
> 
> -How to write the boot.bn to QSPI boot flash 
> -===========================================
> +How to write the boot.bin and u-boot.itb to QSPI boot flash 
> +==========================================================
> 
>   The Kria SOMs are preconfigured to boot initially from QSPI.
>   This makes these boards different from other ZynqMP boards -in that 
> the boot.bin needs to be flashed into the QSPI boot -flash such that 
> the U-Boot SPL can then load all of the -remaining images from the SD 
> card.
> +in that the boot.bin and u-boot.itb files need to be flashed into the 
> +QSPI boot flash such that U-Boot can then load all of the remaining 
> +images from the SD card.
> 
>   In addition, the KV260 Starter Kit QSPI comes pre-flashed with
>   a utility designed to make updating the QSPI flash memory
>   easier.
> 
> -Instructions for using these utilities to update the boot.bin
> +Instructions for using these utilities to update the files
>   in QSPI flash can be found on the wiki link below.
> 
>   
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+
> K26+SOM#Boot-Firmware-Updates
> 
> +Additionally, it is possible to use u-boot for updating the QSPI with 
> +new boot.bin and u-boot.itb images with the u-boot commands below:
> +
> +Flashing u-boot.itb:
> +    $ sf probe
> +    $ fatload mmc 1 0x1000000 u-boot.itb
> +    $ sf erase 0xf80000 +$filesize
> +    $ sf write 0x1000000 0xf80000 $filesize
> +
> +Flashing boot.bin:
> +    $ sf probe
> +    $ fatload mmc 1 0x1000000 boot.bin
> +    $ sf erase 0x200000 +$filesize
> +    $ sf write 0x1000000 0x200000 $filesize
> +
>   It is possible to boot the Buildroot generated SD card image without
>   updating the QSPI boot.bin image, so this is an optional step.
> --
> 2.17.1
> 

> Acked-by: Michal Simek <michal.simek@amd.com>

Just a friendly reminder regarding this patch set.  Any additional changes needed before committing?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
