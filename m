Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54418C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 17:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D296A40141;
	Sat, 20 Aug 2022 17:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D296A40141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oG26Ks76ZD68; Sat, 20 Aug 2022 17:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBCBB400EA;
	Sat, 20 Aug 2022 17:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBCBB400EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1515B1BF2B7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8823400EA
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8823400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tg8uSN54XSIT for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 17:52:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10AF2400D8
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10AF2400D8
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 17:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp3GmP6QoOrQJhJEhrT9HlWEgGAIO7JvXNWVQcrHX2ZKi0budnGnygxJN1LJOCDexrYdk7qiDmiJ2D4ttJZXa5z8bNqxdaF9loetRcsoZsWsAJmN12cNu1FMVEHsd0p1B0sZtb9c+vJOY45vxQ6Df8AINPXNJzsFIR/049XX48+Km9Aos26GeUmWErkroJmbazVz9qJbCozqvWD3Ynm6ZXKPXoRGjG6QdHgOqqHLeOsnd+tHm+wrLa6XcaR3VWMjD6rBH4QuEpdHASRFRv+4PAROBdsyzX+y5sV0E5HmH9BrpfiGByCuFQnYeVbhrtdk3d7ASg5oE7oKrpsD0psr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amI0Lbkg4yFIyc7FoILryeW5QVyxyqoVpw4iNAIg55s=;
 b=lQf9shMIinAYNUyAQ/I/c6PgNQ4gFRK1NnGqblZ6fepu5OGJehe8VCzF62O1OixeydScG6u9Cx/y2Bi7SaHFAAiT461qPqTEMeIqid2ZnMXEkm5LTl1Sm5uy1Ua8iVfl7MXzSJFRdHsjQRN/RcfoYEXR8yrOR+T02lTarlQ0rf3HTAs4Cxm4dpbh1yS18qxog8MiZEPpl5mQTaHFdkgn/7KUoTGMPtlbhwsREExcdBtlCYyA+D2hzCjgL5HlgkKRH6/9LaxOmVxCamYi82li+r5JJgkI1PWqW4QtVvEzZpAuXK2kjBq+SdFVUXeVgVUzLdMlFKIIDWHbZ6XUDcn53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN1PR12MB2511.namprd12.prod.outlook.com (2603:10b6:802:23::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Sat, 20 Aug
 2022 17:52:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1%8]) with mapi id 15.20.5546.020; Sat, 20 Aug 2022
 17:52:10 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHYs5Yt/VTzzNzFBUGC6DI8hhWoIa2352uAgAAnvqA=
Date: Sat, 20 Aug 2022 17:52:10 +0000
Message-ID: <CH2PR12MB50042583296DCDC5716F5ACDF06F9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
 <20220820151243.GM2167049@scaer>
In-Reply-To: <20220820151243.GM2167049@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df7ede03-d093-4fbc-19f8-08da82d4b50c
x-ms-traffictypediagnostic: SN1PR12MB2511:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0RMi7n5Kajh0FjhyABAD2eRUiVAb7ph2lCp+eF48hMLwSqA9MJpd7S5vo76hs4KtqCnd3mILQ8LtR+HIdaI8xMem2LROUOjNW5oWjHrdH3xxrWIX4H7kUnEnnoWhZZPKAmA/LCz87juBdwE/fhH55A3zP9yYYbJB928DYA5aspqRR2Kjc+7wcVbYPeh/gS3XLzdrvhuAD9v61zSYUSGFiW3/fUp47j6+IQNG7AKWpCfMH8Yd8RSGfaWkZMHOXBDKgkknfd/Hmrd8xnJZ35oCXzi5T+kKaF7i/ELVOfuxahWqTjwjv9xyj5KQfxcMGHY3Uv4GztgVLWDeFRk+/V6kF0tKCAv2eP9o3zokuVGBMD4j6tuESMZwSHeYw3R2kku+hvtfXg7wfH8Mv5EgB6uTOHttABll8JAeStws6JFhr3jm3TE78wk6FEPEJcQUG0lontKr3X9U83RFJMrgio0e2RLTOUncQLAb49k4qCD6O3xORESjVAoSwii3kc6TCTvVjtKZMt7AklJKztvH3iKqQIMtbcce7WoVLpO8vALjRJ4z2DX4ZIeFTxPDEXo3OH8BcYnSgXF5QgXP7XWdIV1mP4T7Cv0r7u2ltR/X0WEJGb12TkfGCRSR8/VmZKZIsf9hhIKaz1lFm/EbGrrLhDc4dYkKHgC+K5iGBHElh1fP7Tc3vvPMwycP9+HRNPg7etjU6pDV1Yh8Sdqt5xXyo1iBIzwfqVquNTGuD6Mor+GT5P57/UHUSsJIlKFH8YDNAF5r9FPl8zkoM0nOONmhX+l6orDd3k8Qt1IhNFWzSaymh2H7XiHIq+kBT8pFH1RY9vrY8cUO2M3FlitCPWpXfo+UoVtsLXs289FCWSi8yGnfbQc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(316002)(83380400001)(186003)(966005)(6916009)(54906003)(55016003)(33656002)(86362001)(5660300002)(2906002)(52536014)(8936002)(66946007)(66556008)(66446008)(66476007)(64756008)(8676002)(4326008)(122000001)(38070700005)(6506007)(7696005)(9686003)(478600001)(41300700001)(71200400001)(76116006)(38100700002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1poL0RTUnIwdGpHSy9WWUE0bEFhbUgyRi8yWk5WRWl3M01QWUlYeWNvejZ1?=
 =?utf-8?B?YkNwbXdjN2RxS2VGQWQ0Z2FraHR0aDFzSXR0WFpMa0dpbHZnNXpwSTFQeUNi?=
 =?utf-8?B?OUczTldpV3BsSmQzVVFGL3VTeTJ0VEVkekdFVFNldnpnNjdZRzdKQUFZSzN1?=
 =?utf-8?B?R0taeHRYMEN1RkdQMHJwVEVmaU92NnphMHVOVHdzZStoUE84alZKd3BiQXdv?=
 =?utf-8?B?Z1BNbW9oL05wakUvZjYzZlFhcjZOUmdzOG5JZnMrdHdIeEpzK0FwTy9YQldS?=
 =?utf-8?B?d09RdHU5ZWY1MFR2N1JTd1RXRzM1YnZqZDF0Wm1wQlZ4N0dNZ1VHazVuNFh6?=
 =?utf-8?B?b2R4MC8rdmdqTlUwblYvck5xd1VNcVlkZldpMDJFOHNhTGhlMndNNHJ1a0NU?=
 =?utf-8?B?NnFUdXVWWHVpWFc1YlUzbUVETE1RZjRWSE5lQU5OaHgxdEovT25OZzhjMXNW?=
 =?utf-8?B?SVBlTmFUT3lvdEQrWTQyRlVrY3NZSklhbDRiSnVVcWNTSE9XZW5CR2w1c0N1?=
 =?utf-8?B?QkMzRmphUzNVeUFFTVkxRzJqU0QxZHdIdHgrUkRsdEFUQlQvbkNIc1hoMTlO?=
 =?utf-8?B?Rm91SHM2bGJNNjI3UFpsTE1JenpxVjFtcEFVZ0R0OFJLNmZKNUMyUHF1WERY?=
 =?utf-8?B?QitRSTQvTXkvQWxvV1RmeDBpN1RkUjF3SmRZVjNlZ2laa1lpM0l5dExreTRQ?=
 =?utf-8?B?Q0twZDdBRUhjQ052QnpzUnZ2bmNhblhwUys2Yy9WQWN2NWpackJvVFVhODZO?=
 =?utf-8?B?MVpNRnFrRHd3ekFMR0NXdkplb2RNZ2FsWWs1SlpGeFhWWE5wMWlXQ2NuNld1?=
 =?utf-8?B?aFdIN016ODI3ejlIMkhsVEFjb2pkeHhzZHd1TG0rQVVUSzBnMExhaDJzMWJT?=
 =?utf-8?B?eUc3eC9BckVYQVBsdmEzZXFEamdrcDBnNUhyQUtGeEVtMFBHbHlUcXVUY01I?=
 =?utf-8?B?NkRGblYwdVMvY2R6Q3pobS91UHVXTVhRTnFJdU1rTmIwdlJrdkprck9hZzZ5?=
 =?utf-8?B?UE9KdkQ2eHlNby96RVdiT3hReEZGWSt4UUJueWFHR204VFVKRzA5Slo3ZnZB?=
 =?utf-8?B?UXZ5MkNBMy93ZXNKWll2VjBuaVJFaks0TDN6T1FZemZ3ZGhJQmExc0hseHBJ?=
 =?utf-8?B?OXVXMkpib21Ici9aelJhcXQ2UXhsd0ZxSURnY2wzcm4xZk1ZWllvWm91Wldl?=
 =?utf-8?B?YzF0RVV6UXZzU1VvcmxyN0wveG50WDNXVm11anZXRFRlWmNqYXdwa2xmYmwv?=
 =?utf-8?B?aTMrdlpMZUNJVFIvd0p4UVNlOTZwa2VETFlxZ1YvejJNVVRiZENIN1QzRGZp?=
 =?utf-8?B?WjYvOGNSVU1sQkZ3d0FUUDlXMzVPK1ByRUtkS2JCR2ZpWHJiMklvWTNiMTBB?=
 =?utf-8?B?TGJKN250MHJWQ0VMRTJZY2h5WTB5eWJBRC9raXlGSEhzU2U5MzN0VENNTnBa?=
 =?utf-8?B?dXRhVU9RYkNQNUlzZVNBOXQ2QlVLUmtGRml5WG1Kbm42dEFwNXVFSWsvdmNl?=
 =?utf-8?B?NDRPdjNBRnFwNTQ4QnpkM1laUEdEbDBlZStqV0JwWjNkMzEzZ2hZWG1TNk1p?=
 =?utf-8?B?SW1NUGVoczcrRlFtd2FmMElaMUoxYjA0d1JGOFUwS2ZCaXI0a3dUcFhOQWNn?=
 =?utf-8?B?akRiYU1rYnhHQ29NcTNyWFJWRWFyY1VMT3ZyNWIzNE56UGdHL3htdURIU1lX?=
 =?utf-8?B?aHlGNlV6b3AwTnVyRVQzYi84QzNpM2JMaGxPVW5qekNoUzlqL2ZSZ2RCVWVz?=
 =?utf-8?B?QlpYYzF3dmU0NVhJOG9RNEFYcGRGK21zYmcxYXNqQmJYRmN4UWcwSU40T3VE?=
 =?utf-8?B?ak5weDZtdUZDVHR2VVltNEVtZFordURtTitkdzEreC90cDJ1SWU5US8xQ1pv?=
 =?utf-8?B?K0sxSkJLN3RHRVpxTFU2Y3FpcmJvc0FTNjFkdWpLM2VuNEIxc1o1RmpOa0tN?=
 =?utf-8?B?OVVqTlg3aURiZGdSU3FncTZYVnR3b1R5WjNpM0E5TmtPSU13Zm5xaHdrSHE1?=
 =?utf-8?B?RzlhMlB3Unk3aG1qdnJ5cmYyNXRsemNVclFMTk55UzJSZ3RtMDgrZEw3UjUz?=
 =?utf-8?B?ZER4dHRwR1dRUm9hSGlVajRFVjVwOEs3VERaRFRWaUdsNTE0ajM2VFJMdUs4?=
 =?utf-8?B?aEtSeGxIcXFaSTBkb3kvY0lLQWxUMXNYUm5VeGlmTDhMRkQraiszakpTODMw?=
 =?utf-8?Q?08X2C2ss9aFX/VmwHTWstXY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7ede03-d093-4fbc-19f8-08da82d4b50c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 17:52:10.8025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OK2t5xba3PtWVU9l4IdDx0sYMIJwRb/BTRXeSOCOMjAVxAyE8MSS9VzvSg/CGxV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2511
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amI0Lbkg4yFIyc7FoILryeW5QVyxyqoVpw4iNAIg55s=;
 b=08qdipzpU+FJ2Vwo3Z/6MyrnKK05siyzf01erJmpIG16d2NkZRxhG709eBZJCEPVrg9hnGIeTvXIGH6WC14mOFs1wwB1XsZuIULI3/brrQrIh5YlLhh/3GssheTDNp+gg18mGZ/pedsNYHtnxo5lTONiqL2Tk7bBW2Zdqbn+g4E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=08qdipzp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Neal, All,

> This patch adds support for downloading versal firmware binaries.
> These are necessary for booting Xilinx versal devices.
> diff --git a/package/versal-firmware/Config.in 
> b/package/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..9ca46b1d16
> --- /dev/null
> +++ b/package/versal-firmware/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_VERSAL_FIRMWARE
> +     bool "versal-firmware"
> +     depends on BR2_aarch64
> +     help
> +       Versal Firmware
> +
> +       Pre-built binaries of the current bootloader firmware
> +
> +       https://github.com/nealfrager/versal_boot

> This looks like your personal git tree, not the official one. (Yeah, I noticed your email address, but I would still have expected something under https://github.com/Xilinx/).

> The official images are there:
>    https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842316/Linux+Prebuilt+Images
>    https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2347204609/2022.1+Release

> If one tries to download any resource from there, they are redirected to a login screen, e.g.:
>    https://login.xilinx.com/app/xilinxinc_f5awsprod_1/exknv8ms950lm0Ldh0x7/sso/saml

> The licensing information is not clearly detailed in the portal, and being low-level firmware files, I'm afraid there might be restrictions on the redistribution og those files...

Yes, I agree that the boot.bin should come from a freely available official AMD/Xilinx source.

I am working on this and am using my own personal github location in the meantime to figure out how this could work with buildroot.

I understand that this patch set cannot be accepted until the boot.bin is available freely from an official source location.

> +if BR2_PACKAGE_VERSAL_FIRMWARE
> +
> +config BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION
> +     string "versal firmware location"

> The prompt should be "Custom git repository"

Could you clarify this a bit?  Are you speaking of the BR2 name or the string text when you say the prompt?

> +     help
> +       Location of a versal firmware boot.bin.
> +
> +       The value should be a git repository.

> So, there is not even a default location?

The official default solution (aside from petalinux) is to clone the embeddedsw github location and build the plm.elf and psmfw.elf from that with a microblaze compiler.
And then use bootgen to generate a boot.bin.

While I can build u-boot and atf easily with buildroot, I do not have a clean solution for building the plm and psmfw images and generating the boot.bin.
This is why I am looking for a short term solution of just downloading a prebuilt boot.bin.

At the moment, distribution of pre-built binaries requires the click-wrap downloading procedure which does not lend itself well for an automated buildroot download.

> +config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> +     string "versal board name"
> +     help
> +       Name of versal target board.
> +
> +       Used for installing the appropriate firmware boot.bin.
>
> +config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> +     string "versal firmware version"
> +     help
> +       Release version of versal firmware.

> The version entry should be just after the git tree entry.

Ok.  This is my first time doing this, so thank you for this feedback.

> +endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.mk 
> b/package/versal-firmware/versal-firmware.mk
> new file mode 100644
> index 0000000000..b465b2bd83
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,25 @@
> +#####################################################################
> +###########
> +#
> +# versal-firmware
> +#
> +#####################################################################
> +###########
> +
> +VERSAL_FIRMWARE_VERSION = $(call 
> +qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION)
> +
> +VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> +
> +VERSAL_FIRMWARE_FILES = \
> +     $(if $(BR2_PACKAGE_VERSAL_FIRMWARE), boot.bin)

This does not make sense: if the versal-firmware package is not enabled, then it will not be installed, so there is no need to condition some variables/values to the package being enabled or not.

> +define VERSAL_FIRMWARE_INSTALL_BIN
> +     $(foreach f,$(VERSAL_FIRMWARE_FILES), \
> +             $(INSTALL) -D -m 0644 
> +$(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(f) $(BINARIES_DIR)/$(f)

> VERSAL_FIRMWARE_FILES is only ever one item, boot.bin, the loop will always be on one item, so there is no need for the loop.

> Also, no need for a seaprate macro; just add this code to VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS.

Same comment as above.  I was working from other examples of firmware downloading to create this patch set, and I appreciate your feedback for making it simpler.

> In the end, I don't think we should apply this package, as it looks like it tries to circumvent the official distrobution restrictions on these firmware files.

I understand, and I hope to be able to come up with a solution.
If you have any ideas for how buildroot might be able to generate the boot.bin, I am happy to receive any help.

> Regards,
> Yann E. MORIN.

> +     )
> +endef
> +
> +define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
> +     $(VERSAL_FIRMWARE_INSTALL_BIN)
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
