Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A12C43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 05:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E3940535;
	Thu, 23 Jun 2022 05:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4E3940535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7hpDSw9zUBh; Thu, 23 Jun 2022 05:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A78B74017E;
	Thu, 23 Jun 2022 05:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A78B74017E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E30E1BF20F
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 05:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3433E4175E
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 05:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3433E4175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yO6TzTTGB4OE for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 05:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27E741756
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B27E741756
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 05:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP6LcMNAkP67Pud0/HUmA1nxTwwZODYXp6SxJg2H3QsHd00jqKhKJPAEQ42IYIXHG80hVyY607T05Vax/+gNbbXDDCbvj7QMyjqjs8k578v3x9LNR4Le5CrY8s3XZLeDOPYuPHTF+9DZK9jZLYrngp8Z8z5yQdEVOVWoTuO20lfJwe6AwzQB3Huu69qCt+EZPaN8iXxVI5BPitioARq419302JueU+V8VqfOa2bYavHkWCrZdhS/6KYJz9II4i7/3fV4zX3njpjXAMcD1c8KNNzsfMmAzf3OcqTfIAYbPAUdl8vGrsR3Ok+uKHZ98Jh7cIv3OytfSnclGuR6S6Uimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP0ozVoWxzF6zBcfbvsHBb8p10I/q/gv3uwzZuJxzgY=;
 b=Z8XxxCTh7FFNdaK+AGUYoUS8xVJdOP8bBCEJWIGh4jXxRjHKFi60IxliXIAf8NkjyYPBPC+k7COf2J0fowkI2R8kXl/1/ASQRGPlMO0+6fLHi3S8gdfxMwqkl8+4QL7Rfczqv7PiSs5YfjfjJ0pd3twAqX3eUxtoQB6TUdAjiDpNwFDXhXlh/pAMZxjo3GL2XQmNCKSaGW2rRj3QDbx+OSWCz/SOgt5FTqv1vuVQrxKx1yBVn+bWgProguPiB8Wl5CDB7g1CImIp9zfoxuLQA/PokOBTKN9Dclrxk8uZMz6SCaRr4luR68Sg2THSWSQmu7iH4QXzJxQKMEUB7LPERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MWHPR12MB1199.namprd12.prod.outlook.com (2603:10b6:300:10::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 05:57:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 05:57:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "peter@korsgaard.com"
 <peter@korsgaard.com>, "Simek, Michal" <michal.simek@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>
Thread-Topic: [PATCH v4 1/3] board/zynqmp/kria/readme.txt: improve
 documentation for qspi programming
Thread-Index: AQHYah1tiFdiPPWAx0+uXmyvtsxZ4q0kNRUAgCLMGVCAFbaZQA==
Date: Thu, 23 Jun 2022 05:57:28 +0000
Message-ID: <CH2PR12MB5004D62BEAB0A7EC22197E97F0B59@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220517183842.1389395-1-neal.frager@amd.com>
 <431dc45e-07fc-c615-9928-e0dccd3d1a27@xilinx.com>
 <SJ0PR02MB77581F883F1EE62C2CAF72CAD7A79@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB77581F883F1EE62C2CAF72CAD7A79@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f08387f5-4aa9-405c-28f2-08da54dd4150
x-ms-traffictypediagnostic: MWHPR12MB1199:EE_
x-microsoft-antispam-prvs: <MWHPR12MB1199B333E6BAD6647082F869F0B59@MWHPR12MB1199.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s4VMTrIWdEZg1N77gzWJqAaX/wCrBL7O2WSS3RWi63+Vf8uQrjkk4Fb4WcUnhgmSYCbqzq6OApmimOJExjCJPzMI1H0KUAKHVVpQwuk0GCq8/uhSn/zcq1cijWXTGmNfmV5roLpohZQD23QjXbPBtMIQjJW0XHBx7pT+/SUaZGUkWSRXNUjloRDaX8SFq/3ZZAXLU82Vcesj89mxgkL5JmMXdAkzadux/zNFlyWehV0S/D8Q1BxGEm+omMybX7kH75ypGYqPZGHjy6/vVWMY1inb7d78Qt4Trc6e1Pa2SGEwsh7dNcPoulEM7jfiX1cDmj+r4XXr22+RLpABsUEQYmHi8SFIGlp/0DQHkYwLHd7FoLIXNAhw95Gdy856EQm2JBO27ukkKTc0ZBJD8LWADjMP8v5mQnqedjiKJggiPZIv8q57VlgpSrakEm9twu7cl45C4yr9xyi68EbC1/cRtVZ7S0QTS/u+P2jDApd6Oj2G03TUwHA9ts7LVqwHTlOFvy0qT2U9aMmqZZifwEuACFr3IUd1ZFgZSEy8N8RrMb/xTsLgTH0DB09qeGDEHKjN0S1EMUNJL5MKPlRXdYUfMICV5w2yG/X1Fwz5ilUk8WiEYEFclNaDG62FlHCnOuoCXNXND3fDc2dmdEXSMvngr4G86VqqBH8e0d1x3GB0n8FlY7xuJX5PMjugMp+ZsRI4W65EGCAPPG9CCkZqjwTLpYTVTNU759YTuXdIeOLnMzpt1nsAmTMGarZ1mIbWkeMr3/91BY/zr8tfF3N+FI8MXXeDK8dkzir4Rm4TRbnKfq8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(2906002)(86362001)(71200400001)(7696005)(110136005)(66446008)(316002)(66556008)(9686003)(8676002)(66476007)(38070700005)(6506007)(66946007)(122000001)(64756008)(966005)(26005)(76116006)(55016003)(38100700002)(83380400001)(52536014)(5660300002)(41300700001)(186003)(478600001)(33656002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 0ayJbubijI50m1WUt4N1XVmdQusZ738sKD8kHI4pde+maOVflWSnnmfCezOxB08P8BbtsErfj8EDzC1Jq/h4DaW/UGhAcNdvCw11lZAqPr0QGZK4nHpfLzGRZeYeKBuskAx0d3kl+rzTSxPh1NogL082slDRHlnE4EOxoi1ht0OX9KHkfQhjontXVZq3LnGTEUbuDzmNvy98ytDuuRBSLNOGKxx0s3lrLEjTS6o9kvQTTresrOgqQfMaIBMSCpc93yhdfHp99Ry7SGNtHcCaAuDnmF5rNzmsGWZw/OxKmKnrJPv5Hq/T3NhaJsIeyYxgaw/QI1nDhSn8Thmx03fCjnWsA8B1gdLGQIJfsxfRB4qXK1sHkX6BpylnYyaZGaxjFRggaE/wuA2rzV8QoSvNS7UKU4Xkgf0jBjCPoaEzp+ho5zdvQIka3Hl3Vfie5U9rcKzj0BGK5c5yZRMfEm/3R0EcZVm76aYYy9wzR1DWWSbO8Mvoi3cM3GNOTsGQ0Dk1q7TPzrfEPBNUJoufraReFpyt1DKQsJw5953ayGlolvSh7exTPgO7tujZsqc496fSkDbSsWUm5FUtbLDMpE4hdwgfA4cpsDLxJX2ndAZY50E7YRQdfWHeICJyskxCw/aJZnmmLgTBOvExCWlrHzP1nuqZ2Gh4AvccwcFoPCe1Y2+PKft0Av3hW6P00v4eavTShrau4CgEtcaR1jw1PbUYdFlRuuYavRd2YiJUi4jqQzb05HX4cYY3uEgCrcW0nNumEcrc+x5QqvFKqCKsUpdotA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08387f5-4aa9-405c-28f2-08da54dd4150
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 05:57:28.6155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzqIkXcYIkW0QhNKFJNqciIfoAaIVpytYviKOj1Al/ygSCiMXzhJlJ1DzR7r+4hQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP0ozVoWxzF6zBcfbvsHBb8p10I/q/gv3uwzZuJxzgY=;
 b=L9ER9BWf7YbDMpTRnKV6sT9okPq08NYaD+cwAecpY+f8jXXJep2nIQz6mZ4fUQSZdKDKG9vmIF+69FgUCywlplSGP5F2TlsfzNJoX9s3+KTkzLQXqviXS6iRzHnQG1PHZoJysCgqaE3pAXYUq5mNuRldYY0mmPotFh0AP/bbi7Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=L9ER9BWf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
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
