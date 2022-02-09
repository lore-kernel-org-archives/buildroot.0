Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B18C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BD06400D0;
	Wed,  9 Feb 2022 17:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ab1bwx4cuuC; Wed,  9 Feb 2022 17:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF50140146;
	Wed,  9 Feb 2022 17:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC3D31BF3F9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 17:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD9EB607BC
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYlqPgtFb9tN for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 17:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::628])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62E6360073
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 17:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhnTRF8cWEgEV12plJdtnuONPqmqlfb6EmhCReACvKdFhoOYXelOXD7t88PDyeTgxO+sLpYjbkUHlb90uvVVEN4a0jg1wnwJpBAII7fyxhm+FRUTVFhTXc4iWIZ2xWaz+72Mi8NbDjXS0KAZmydxAz8dsJcyIV0imubvyvJgNVatn2JgRO6SzQdtxkzgoCde2UV0m4XFc1ojSeyhhYIptAj6ADYTLtSQ3amj7Wetf/fBNo7LVUAT4c/atD9c30kk+4eVWZ0GZJNRyTnHSruhM2ZNfKUBxoCGLnUwqaws+TU0l8fv1VdEXZOf0OMvoTMZYPvASWHkLNG/E7roCdNawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEHfw+voIdsJOPuaugZ6lavFbRI+TFT4pwWDL/LEGYw=;
 b=AdpMMKwoj7FrTv1qTFHR00OYxkghGlJQSbqLelZFmA2X2uScZjr4+wBqUtWV5NhWtrZcyzMkYZbaGFBwtT8Mpq1pdSggTe62l1OIY1avwUm8a7i/7/p5rsUaLyFCDVgR3OTMpp/m56qBof914kwMsPWQnfEwBQtFpA8z0Bt9SaGxFi6S4ETXJLpO1MyKy0WTW7MfWp63VF9Smp8lyrlEOdFoK5PcsGNctGFmXNV+54JiRfriu2eAX32eMDZ4/P5An4RGucpt87JaE/4j0R6lc7SOvngoWm15LW9lFQy/8WUDdXk8Yvsco0rrEYP9wwMSvFOa2HQP46R+lJtwcW5c3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEHfw+voIdsJOPuaugZ6lavFbRI+TFT4pwWDL/LEGYw=;
 b=bwqhG47WHjum2ZzYPaH/xug8UcXFisdnGdDTN3pjM+X2oZyVEBycrZQFXFWK/ic+WVkQtjEvscH65AxJoxJNTJQWOS92QY+MC5a2al5ItcS5G/CHF3g3jDI84k1oxS1ZUt7lw4zKguFQY8blSSf8xXVXhUG6Odi3ef98ec1lmkY=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN7PR02MB5154.namprd02.prod.outlook.com (2603:10b6:408:21::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 17:15:16 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 17:15:16 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] configs/zynqmp_zcu106: Bump ATF/U-Boot/Linux to
 Xilinx 2022 -v2
Thread-Index: AQHYHY8FGHgav4D6lEO4V7jynTkte6yLcTYAgAABuuA=
Date: Wed, 9 Feb 2022 17:15:16 +0000
Message-ID: <SJ0PR02MB77581F1CFC21CBF348FB5330D72E9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220209082821.72879-1-neal.frager@xilinx.com>
 <c51f3e2f-80ac-185c-99ef-fc3012fca9ae@benettiengineering.com>
In-Reply-To: <c51f3e2f-80ac-185c-99ef-fc3012fca9ae@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c50953e9-9b48-4732-2603-08d9ebefbe00
x-ms-traffictypediagnostic: BN7PR02MB5154:EE_
x-microsoft-antispam-prvs: <BN7PR02MB515421DD7DECEB687707E0B4D72E9@BN7PR02MB5154.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TfNUJv5XlTKNvwCIqb1AWi6CgkrkWehl4W+BQKHNq1WIBNdhxX7m8ZDQ29WJoV5Qj/SqC89qQH7b6w9Dy6TOk1Gt7vty2Ylh6j8ZqRV4LpjDlIzKGFTnEBFb2iV5WIKacCYfX+JSLTDQx73Rx5KCW0XWJ2tJkvReRiwPCgmownvpknGSq25At6nE5daEC3K+/wTeIsGugCvCdgJanMssXQRgBU3z2H3V4UZap3NAj3Z2iJEn4MMCfdZlOp2Iyeuo/SJqVdohibN28EPj0uLX66stZWCsZgywFigDs9OxVU5V/Ion88+t7xZHnbrt2dVFxCfOfBBpotPIIKT3dR/J0scffAE4T06m2Mm+FDMpSluSHVdWr3VOJCxHfmVtuDKdz/P2GQ0WwB3EqwfVbSlz3UaMvcWrFC5rkpYzGYICQsYXCDBOt2s7FthXeb12WBZZT136+5YydJiVAzcx8Iqnw79hX/KtAPdJhba2q1jCxY/ZW+SRZdMLAWrAmojjPHViMfV0VRZXqDo5F3hyoUCl472A4IV6qHYZlsnoxrTqoije4GjA4FoLraompT7ASVW5crxgdcorWsOlJYAd+kd1w7MUHQUZTH68jRqtfHzT7t2pSaI2xxVcWkws5OVeZ/RcfU43YylY+PIMCkAVkuM8bh2qS4zobXIsjtYjehZIIdXkrN6Y4B10T8wYyRgVpoMecADxuUWRa8WAi67Ue6p5N3uqN5ylhAJH/aR3BVioLaA/ElrU9bkwDMlja2k58IhjjB/Jyvyo+TZzBLlr3ZusCuaCztMiUuU9nSv7gX225opuwvo1mwzlup0RKdKhOUiJ/EFx+yxhV2AFctEHDu6bzvQuCdA+s95NXoQUIGzn4/o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66446008)(66476007)(66556008)(8676002)(64756008)(76116006)(508600001)(66946007)(54906003)(110136005)(316002)(6506007)(7696005)(9686003)(2906002)(30864003)(107886003)(83380400001)(26005)(186003)(53546011)(38100700002)(33656002)(86362001)(52536014)(55016003)(8936002)(71200400001)(5660300002)(38070700005)(122000001)(579004)(559001)(139555002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZtdVFGTkhiV1J6TmtUMURaQmNvT3Zpd3VJZkp5NGZKVjBOQXR3OWplTnFS?=
 =?utf-8?B?eEtMTkhHeXZLRi9iWVNzYlVLY3UyWWFtcXhXc3VWcEVQVFRPYWMyUDE2U3lK?=
 =?utf-8?B?c0lubDVvVzczZExWYjV1SmVWMVB5N1Q1bjZmNmpxNHJkWEVqaXVFeFBkUWUx?=
 =?utf-8?B?WXY4c0NKNUgrT2NmaFNscWh5aGwxUFp5WWgvcUNGa3dsb0tZLy9wZFhlT0FQ?=
 =?utf-8?B?QnhESWQyNE5HcWtkUnBFOU9Qb0xDeGY0cUlzdDRtRENJVXJNK2VZalNRbTN4?=
 =?utf-8?B?NEQ5UnE0Z2lwMGtDaWNiWTlEZGszbEtkVGhHRmJmbDkwWDRTMkF3UHluZmwv?=
 =?utf-8?B?Umk0WXNYeTJXRlc5ei90djF6b0dpWFR4R0FwT3ZGR085cW5xWFNMM1N0SHRE?=
 =?utf-8?B?UmE0MkdBbERKS00xT3VEOFBhTWJ1WHc2YWlBZjh1bEJNTEJnaVh0RlpEd3lJ?=
 =?utf-8?B?cDZ3NDR4dlRIOHB1V1piK2ltTUlGb0hvKzRjdUdIcXBCd0pGb20vclJQV0pq?=
 =?utf-8?B?eS83OU43UzdublQvenVWRzF2TXVRcTdvbFh6dmJBeFU2TmJ0OW1QL3Irc1NZ?=
 =?utf-8?B?RloxUllsQUorYjlCNUkwOXJPV3VULzk3OTJaN0w3OXBiZGJjS05xRHgvUXRQ?=
 =?utf-8?B?SGVBTnhabXFsaVVhRFpEWnJseDlLamFDM2hKMEdGSFJLbXh1UWdJMEpIV0tH?=
 =?utf-8?B?ZDM3ZnlndHJxOCtoQWVuTnVtalhiVmp0UkIyZzhrUWhSYmVtcVJ3cU1ad1p1?=
 =?utf-8?B?Snpjc094MW5QRTZFbDFhak92NDZpZFc1T0t2Ym5MdUZxMHN2YWZvVnZDcXRV?=
 =?utf-8?B?Rk9mOWpUaml6dnVvckFkWFdEd1pNWmFiSWVxOXZreERqaytqOUV5Tk5TaU8y?=
 =?utf-8?B?R2NOYnJkVktNeXdqY280Zm1vNGxpRjFEZWpiZ0JlTnpMdHNZcFVpc2J5T014?=
 =?utf-8?B?RWdlL0pxb0ZNQnVhSzBCOHA2MkkrQjRoZ3NWbEdiN05rWmlTKzRxbFpPV3M2?=
 =?utf-8?B?MzNaYXFqRzE3TjNWcEx5VE9VdXkwejR6UzBqS1ZBVERuQlVKWDM4SzZ2MXR4?=
 =?utf-8?B?bjZxUkJpWWJ3cTlNakhralB3UnVOTVFjZjM0NDBVUG1ZejhXUzdWK2FFaXQr?=
 =?utf-8?B?K3hIWEhKUmY2T280elo2azRNVjgwUHdiVS9nN2txOGpDMVd3U0dUNDU2ekdx?=
 =?utf-8?B?eVhYZXNzdW1OS1c2UGRyQTgwMkZ1U0trSC84bGNGSlg3U0l6dTJrcEU2TTB2?=
 =?utf-8?B?Vy8rL2l5VGRVeDFmc29xanMyOWZHTWFoUkxTZFR2alVWUUxJNUdWenBNN28x?=
 =?utf-8?B?QU9ha1piYmxWOGJBc3ZSV2pQNjhjRnhPNGZOMWExdHVuSUkxSWZGS0dGZHpx?=
 =?utf-8?B?SkNlbUgzUWlpNDZxY2FkZE9UZzRSNUJQTDBhaGdTenlRMmpLd0lodC81M0tG?=
 =?utf-8?B?c09Jb1FKbmNMamoxRDhJcFZibURRMnBsQjgvMEhRZlUrekg0bTdhN0N0d21q?=
 =?utf-8?B?Q0ZCcFc0VDVsVzN4dFBucWhrWDVFV3VIYVZnOGNMNFd0UTFFZ2I0WEdTaXZU?=
 =?utf-8?B?dnplVW50ZWI0YTJBdkhRTUs4cWF6b3NRK3kxaEcrZklmRkJoNmR5d0h3emZG?=
 =?utf-8?B?dFBlcEpDS016WjAvTHdteGVIWm5TcU1udnFURmZGTHJDZ2Z6R2Y5aTVyN0hm?=
 =?utf-8?B?NDBzOUErRnVMSmNIajNXeDZMUE5iaWRBWjZUUHMzR1ExQnBUV0RKTGNrZ0My?=
 =?utf-8?B?bDNObSt4RUFOVGMraDlxRlUxYlQwbXlkOE51RU8zek1sSUNHVW0rTzI2ZjBk?=
 =?utf-8?B?MkY3VFJZK3NEUmJ1RHhNS0kyelptQ2U2VE1hdkFVaHFYY3NJbU0rSFRnS1ZN?=
 =?utf-8?B?Smc3bDBJL3hSNE1jR2hRQnRRQkREOHY1c1JRcHE1YVEwTGxjSEhFRXdaRkZM?=
 =?utf-8?B?bkJPVi9DUFVFWUEzanl1YW9aZlhnNFdpVWlqRUxFRE03L203OWVVYkltK2p6?=
 =?utf-8?B?WmtEd3VSam1lM01hOUgrV1pwR1JBMkZKY1FIdFg1OXpkT1A2di80bi9VODR0?=
 =?utf-8?B?VGtJV1NRQXNZVnU2R1E3d3hhaCtGNEdaZlRhNFVpYSswanZla0NFbG56WEJx?=
 =?utf-8?B?SGNUMHFrTkR3T0NlRWplZmtUOEozbXF2Nk1PSWphYUMvT0o1QVNGMmRZckwr?=
 =?utf-8?Q?DA+iGatblk+q/XF2s5U8W1I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50953e9-9b48-4732-2603-08d9ebefbe00
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 17:15:16.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugf1DFdrFzuTcrlkqObchSSHps/kCGyQYAFxxC8MXJTwFCdLwNjvxUeiymsI8/ttadYxNB1KihjaQTfdufMS+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5154
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022 -v2
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
 Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> the subject doesn't need "-v2" in it. I'm pretty sure you've used the wrong command to generate the V2 patchset.
> This are the correct commands:
> # cd buildroot
> # git format-patch -s -M -o . -2

Thank you for the command.  I misunderstood what you meant in your previous email, as I was just creating the whole patch set again from the beginning.

On 09/02/22 09:28, Neal Frager wrote:
> This patch:
> - bumps configs/zynqmp_zcu106_defconfig to Xilinx 2022

> What does this ^^^ line means? Xilinx 2022? Maybe it is what it's already below, Linux, u-boot, ATF. So I think you can drop it

I wanted the defconfigs to match a Xilinx software release.  We have two releases per year, 2022.1 and 2022.2.  Neither of these has happened yet, which is why originally, I wanted to just bump buildroot to 2021.2.  Unfortunately, to get a perfectly clean build without the patches directory, I needed the updated pm_cfg_obj_convert.py script, which forced me into U-Boot 2022.01.  So in the end, these defconfigs use all Xilinx software versions (ATF, U-Boot and Linux) that will eventually come with Xilinx 2022.1.  My long term plan is to maintain these zynqmp_zcu10x_defconfigs with each Xilinx software release.  Eventually, I will be bumping to Xilinx 2022.1 and Xilinx 2022.2, etc.  Since these current patches are not tied directly to a Xilinx software release, I suppose it is easier to just remove this comment from the log.

> - bumps ATF to Xilinx v2.6: mainline v2.6 requires patch to build
> - bumps U-Boot to Xilinx 2022.01: important drivers not in mainline
> - bumps Linux to Xilinx 5.15: important drivers not in mainline
> - deletes board/zynqmp/patches directory: patches already in mainline

> as you see below, this patch doesn't delete those patches and folder

With v3 that I will be sending shortly, I am going to fix this.

> - modifies board/zynqmp/genimage.cfg: U-Boot 2022.01 uses u-boot.itb 
> format
> - adds extlinux.conf to vfat bootfs

> it's worth mentioning that it switches from boot.scr to extlinux.conf also

How come?  boot.scr was never used with the zynqmp devices on buildroot before.  I was considering using boot.scr, but since this was never part of buildroot, why mention it?

> - modifies U-Boot to unified xilinx_zynqmp_virt_defconfig (supports 
> all boards)
> - adds support for SPL pm_cfg_obj.c loading to PMU firmware
> - adds support for host machines without SSL

>     ^^^ - enable support for host machines without OpenSSL required by u-boot Because you don't add support and it's OpenSSL that is required by u-boot

Ok.  I will update this comment.

>
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>
> ---
>   board/zynqmp/extlinux.conf      |   4 +
>   board/zynqmp/genimage.cfg       |   6 +-
>   board/zynqmp/pm_cfg_obj.c       | 614 ++++++++++++++++++++++++++++++++
>   board/zynqmp/post-build.sh      |  10 +
>   board/zynqmp/post-image.sh      |   4 +-
>   board/zynqmp/readme.txt         |  23 +-
>   configs/zynqmp_zcu106_defconfig |  23 +-
>   7 files changed, 665 insertions(+), 19 deletions(-)
>   create mode 100644 board/zynqmp/extlinux.conf
>   create mode 100644 board/zynqmp/pm_cfg_obj.c
>   create mode 100755 board/zynqmp/post-build.sh

> As mentioned above deletes are missing

As mentioned, I will fix this with v3.

> diff --git a/board/zynqmp/extlinux.conf b/board/zynqmp/extlinux.conf 
> new file mode 100644 index 0000000000..15ef707ea2
> --- /dev/null
> +++ b/board/zynqmp/extlinux.conf
> @@ -0,0 +1,4 @@
> +label linux
> +  kernel /Image
> +  devicetree /system.dtb
> +  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg 
> index ed202f4550..20d8352c08 100644
> --- a/board/zynqmp/genimage.cfg
> +++ b/board/zynqmp/genimage.cfg
> @@ -2,11 +2,13 @@ image boot.vfat {
>       vfat {
>               files = {
>                       "boot.bin",
> -                     "u-boot.bin",
> -                     "atf-uboot.ub",
> +                     "u-boot.itb",
>                       "system.dtb",
>                       "Image"
>               }
> +             file extlinux/extlinux.conf {
> +                     image = extlinux.conf
> +             }
>       }
>
>       size = 32M
> diff --git a/board/zynqmp/pm_cfg_obj.c b/board/zynqmp/pm_cfg_obj.c new 
> file mode 100644 index 0000000000..7566b3236a
> --- /dev/null
> +++ b/board/zynqmp/pm_cfg_obj.c
> @@ -0,0 +1,614 @@
> +/********************************************************************
> +**********
> +* Copyright (c) 2017 - 2020 Xilinx, Inc.  All rights reserved.
> +* SPDX-License-Identifier: MIT
> +*********************************************************************
> +*********/
> +
> +
> +#include "xil_types.h"
> +#include "pm_defs.h"
> +
> +#define PM_CONFIG_MASTER_SECTION_ID  0x101U
> +#define PM_CONFIG_SLAVE_SECTION_ID   0x102U
> +#define PM_CONFIG_PREALLOC_SECTION_ID        0x103U
> +#define PM_CONFIG_POWER_SECTION_ID   0x104U
> +#define PM_CONFIG_RESET_SECTION_ID   0x105U
> +#define PM_CONFIG_SHUTDOWN_SECTION_ID        0x106U
> +#define PM_CONFIG_SET_CONFIG_SECTION_ID      0x107U
> +#define PM_CONFIG_GPO_SECTION_ID     0x108U
> +
> +#define PM_SLAVE_FLAG_IS_SHAREABLE   0x1U
> +#define PM_MASTER_USING_SLAVE_MASK   0x2U
> +
> +#define PM_CONFIG_GPO1_MIO_PIN_34_MAP        (1U << 10U)
> +#define PM_CONFIG_GPO1_MIO_PIN_35_MAP        (1U << 11U)
> +#define PM_CONFIG_GPO1_MIO_PIN_36_MAP        (1U << 12U)
> +#define PM_CONFIG_GPO1_MIO_PIN_37_MAP        (1U << 13U)
> +
> +#define PM_CONFIG_GPO1_BIT_2_MASK    (1U << 2U)
> +#define PM_CONFIG_GPO1_BIT_3_MASK    (1U << 3U)
> +#define PM_CONFIG_GPO1_BIT_4_MASK    (1U << 4U)
> +#define PM_CONFIG_GPO1_BIT_5_MASK    (1U << 5U)
> +
> +#define SUSPEND_TIMEOUT      0xFFFFFFFFU
> +
> +
> +#define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
> +#define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
> +#define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
> +
> +
> +
> +#if defined (__ICCARM__)
> +#pragma language=save
> +#pragma language=extended
> +#endif
> +#if defined (__GNUC__)
> +    const u32 XPm_ConfigObject[] __attribute__((used, 
> +section(".sys_cfg_data"))) = #elif defined (__ICCARM__) #pragma 
> +location = ".sys_cfg_data"
> +__root const u32 XPm_ConfigObject[] = #endif {
> +     /**********************************************************************/
> +     /* HEADER */
> +     1,      /* Number of remaining words in the header */
> +     8,      /* Number of sections included in config object */
> +     /**********************************************************************/
> +     /* MASTER SECTION */
> +     PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
> +     3U, /* No. of Masters*/
> +
> +     NODE_APU, /* Master Node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask of this master */
> +     SUSPEND_TIMEOUT, /* Suspend timeout */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
> +
> +     NODE_RPU_0, /* Master Node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask of this master */
> +     SUSPEND_TIMEOUT, /* Suspend timeout */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
> +
> +     NODE_RPU_1, /* Master Node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask of this master */
> +     SUSPEND_TIMEOUT, /* Suspend timeout */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Suspend permissions */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Wake permissions */
> +
> +
> +     /**********************************************************************/
> +     /* SLAVE SECTION */
> +
> +
> +     PM_CONFIG_SLAVE_SECTION_ID,     /* Section ID */
> +     49,                             /* Number of slaves */
> +
> +     NODE_OCM_BANK_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_OCM_BANK_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_OCM_BANK_2,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_OCM_BANK_3,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_TCM_0_A,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
> +
> +     NODE_TCM_0_B,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
> +
> +     NODE_TCM_1_A,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_TCM_1_B,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_L2,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_GPU_PP_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_GPU_PP_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_USB_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_USB_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_TTC_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_TTC_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_TTC_2,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_TTC_3,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_SATA,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_ETH_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_ETH_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_ETH_2,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_ETH_3,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_UART_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_UART_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_SPI_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_SPI_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_I2C_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_I2C_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_SD_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_SD_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_DP,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_GDMA,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_ADMA,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_NAND,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_QSPI,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_GPIO,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_CAN_0,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_CAN_1,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_EXTERN,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_DDR,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_IPI_APU,
> +     0U,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask */
> +
> +     NODE_IPI_RPU_0,
> +     0U,
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
> +
> +     NODE_IPI_RPU_1,
> +     0U,
> +     PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_GPU,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_PCIE,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_PCAP,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_RTC,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +     NODE_VCU,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     0U, /* IPI Mask */
> +
> +     NODE_PL,
> +     PM_SLAVE_FLAG_IS_SHAREABLE,
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
> +
> +
> +     /**********************************************************************/
> +     /* PREALLOC SECTION */
> +
> +     PM_CONFIG_PREALLOC_SECTION_ID, /* Preallaoc SectionID */
> +     3U, /* No. of Masters*/
> +
> +/* Prealloc for psu_cortexa53_0 */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK,
> +     12,
> +     NODE_DDR,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_L2,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_0,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_2,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_3,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_I2C_0,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_I2C_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_SD_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_QSPI,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_PL,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_IPI_APU,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +
> +     /* Prealloc for psu_cortexr5_0 */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
> +     14,
> +     NODE_TCM_0_A,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_TCM_0_B,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_DDR,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_0,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_2,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_OCM_BANK_3,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_I2C_0,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_I2C_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_SD_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_QSPI,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_PL,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_ADMA,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_IPI_RPU_0,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +
> +     /* Prealloc for psu_cortexr5_1 */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     3,
> +     NODE_TCM_1_A,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_TCM_1_B,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +     NODE_IPI_RPU_1,
> +     PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
> +     PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
> +
> +
> +     /**********************************************************************/
> +     /* POWER SECTION */
> +
> +     PM_CONFIG_POWER_SECTION_ID, /* Power Section ID */
> +     4U, /* Number of power nodes */
> +
> +     NODE_APU, /* Power node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions 
> + */
> +
> +     NODE_RPU, /* Power node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions 
> + */
> +
> +     NODE_FPD, /* Power node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions 
> + */
> +
> +     NODE_PLD, /* Power node ID */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions 
> + */
> +
> +
> +     /**********************************************************************/
> +     /* RESET SECTION */
> +
> +     PM_CONFIG_RESET_SECTION_ID, /* Reset Section ID */
> +     120U, /* Number of resets */
> +
> +     XILPM_RESET_PCIE_CFG, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_PCIE_BRIDGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_PCIE_CTRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_DP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SWDT_CRF, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_AFI_FM5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_AFI_FM4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_AFI_FM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_AFI_FM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_AFI_FM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_AFI_FM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GDMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPU_PP1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPU_PP0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPU, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SATA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU3_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU2_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU1_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU0_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_APU_L2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ACPU0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_DDR, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_APM_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SOFT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GEM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GEM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GEM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GEM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_QSPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_UART0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_UART1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SPI0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SPI1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SDIO0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SDIO1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_CAN0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_CAN1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_I2C0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_I2C1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_TTC0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_TTC1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_TTC2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_TTC3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SWDT_CRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_NAND, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_ADMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPIO, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_IOU_CC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_TIMESTAMP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPU_R50, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPU_R51, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPU_AMBA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_OCM, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPU_PGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_USB0_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_USB1_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_USB0_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_USB1_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_USB0_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_USB1_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_IPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_APM_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RTC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_SYSMON, 0,
> +     XILPM_RESET_AFI_FM6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_LPD_SWDT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_FPD, PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
> +     XILPM_RESET_RPU_DBG1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPU_DBG0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_DBG_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_DBG_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_APLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_DPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_VPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_IOPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_7, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_8, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_9, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_10, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_11, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_12, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_13, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_14, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_15, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_16, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_17, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_18, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_19, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_20, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_21, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_22, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_23, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_24, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_25, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_26, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_27, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_28, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_29, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_30, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPO3_PL_31, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_RPU_LS, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_PS_ONLY, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_PL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPIO5_EMIO_92, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPIO5_EMIO_93, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPIO5_EMIO_94, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +     XILPM_RESET_GPIO5_EMIO_95, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
> +
> +     /**********************************************************************/
> +     /* SET CONFIG SECTION */
> +     PM_CONFIG_SET_CONFIG_SECTION_ID,        /* Section ID */
> +     0,                                      /* Permissions to set config */
> +     /**********************************************************************/
> +     /* SHUTDOWN SECTION */
> +     PM_CONFIG_SHUTDOWN_SECTION_ID,          /* Section ID */
> +     PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | 
> + PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* System Shutdown/Restart 
> + Permission */
> +
> +     /**********************************************************************/
> +     /* GPO SECTION */
> +     PM_CONFIG_GPO_SECTION_ID,               /* GPO Section ID */
> +     PM_CONFIG_GPO1_BIT_2_MASK |
> +     PM_CONFIG_GPO1_MIO_PIN_34_MAP |
> +     PM_CONFIG_GPO1_MIO_PIN_35_MAP |
> +     PM_CONFIG_GPO1_MIO_PIN_36_MAP |
> +     PM_CONFIG_GPO1_MIO_PIN_37_MAP |
> +     0,                                      /* State of GPO pins */
> +};
> +#if defined (__ICCARM__)
> +#pragma language=restore
> +#endif
> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh 
> new file mode 100755 index 0000000000..ef55f49376
> --- /dev/null
> +++ b/board/zynqmp/post-build.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +
> +# genimage will need to find the extlinux.conf # in the binaries 
> +directory
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf 
> +$BINARIES_DIR/extlinux.conf
> +
> +

> please remove useless whiteline, we only need 1 at the end of the file

Ok, no problem.

> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh 
> index b2b99fed01..ed6dbe188c 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -10,4 +10,6 @@ FIRST_DT=$(sed -nr \
>
>   [ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb 
> ${BINARIES_DIR}/system.dtb
>
> -support/scripts/genimage.sh -c board/zynqmp/genimage.cfg
> +BOARD_DIR="$(dirname $0)"
> +
> +support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
> diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt index 
> da37f4ccc9..0dc1793e03 100644
> --- a/board/zynqmp/readme.txt
> +++ b/board/zynqmp/readme.txt
> @@ -1,10 +1,19 @@
> -********************************
> -Xilinx ZCU106 board - ZynqMP SoC
> -********************************
> +******************************************
> +Xilinx ZCU102 / ZCU106 boards - ZynqMP SoC
> +******************************************

> This ^^^ must be moved to next patch since this patch only deals with
> zcu106 and not with zcu102

Good catch.  I will move the updated readme.txt file into the zcu102 patch with v3.

> +
> +This document describes the Buildroot support for the ZCU102 and 
> +ZCU106 boards by Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP).
> +It has been tested with the ZCU102 and ZCU106 production boards.

> Same here ^^^

> +
> +Evaluation board features can be found here with the links below.
> +
> +ZCU102:
> +https://www.xilinx.com/products/boards-and-kits/zcu102.html

> Ditto

> +ZCU106:
> +https://www.xilinx.com/products/boards-and-kits/zcu106.html
>
> -This document describes the Buildroot support for the ZCU106 board by 
> -Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP). It has been 
> -tested with the EK-U1-ZCU106-ES2 pre-production board.
>
>   How to build it
>   ===============
> @@ -32,7 +41,7 @@ After building, you should get a tree like this:
>       +-- rootfs.ext4 -> rootfs.ext2
>       +-- sdcard.img
>       +-- system.dtb -> zynqmp-zcu106-revA.dtb
> -    +-- u-boot.bin
> +    +-- u-boot.itb
>       `-- zynqmp-zcu106-revA.dtb
>
>   How to write the SD card
> diff --git a/configs/zynqmp_zcu106_defconfig 
> b/configs/zynqmp_zcu106_defconfig index bee7c1daf7..2026f60bd1 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -1,34 +1,39 @@
>   BR2_aarch64=y
> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>   BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>   BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/pm_cfg_obj.c"
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y

> For the rest it looks good to me and it builds correctly using docker.

Thanks for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
