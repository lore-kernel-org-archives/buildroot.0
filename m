Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8ECC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 13:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F66817F2;
	Sun,  6 Feb 2022 13:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t40POOJLHuE5; Sun,  6 Feb 2022 13:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 736A9813C2;
	Sun,  6 Feb 2022 13:55:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEFC61BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F43818C9
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE3Yoir6eQlD for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 13:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 833EB818C4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 13:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwLc4d5nz1z3Up3tBj7TE/t3Nhx08Tj/NMl2DU8xRW7s2gqktpH7OX66oZx2AxqgU/lRlMPt8g1fj2iGNGC4BBNqKquebthogLSClJD8V/JKAR/44oa53VEBgNxWN02aPZJ9ftVaMNen2RQ6bg46PQW2UlS/TIMpXWfBz42Ytee90O0SD2oYYlDv9axgkOxIgKrePbrG+DN4BvMbWAiInEu0QTiImlpJme9umthun/KlQ4Ay3oJScPUip9qC1Fu9MhvYDl4jKyxmza+FTnHVSAQax17Wx7ri0rVMp4WWLolwpGFMT/UMUDeAVO2cJX6Zhbycm+Q1A/PNAdmS0JO5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sdcreXGDKv/xgUqLJHHubsW9p9Ynst05+8RzW9zLbo=;
 b=UhBW/9uWmEPsdUSS0v1y6Q49p8iqGIT588bmkOriTTYHkG4EffZ4vcZXXTPMTKlcfaI3hBXfpbtwRJRsNWNlPT6NWKZqIILjSChsDULpQ6esb21RRazmcDbIa7VznTPGbpRh6EqA/hRaVTBivBKdl5N4NCaZJlxN8hNptPVVO3n9wI3YnDtuCezsTG1KbIgmaIgECQrVG1QaaNfocKFNiIbSnPsYc9UBH+ofJUSU89S0SA5hNPDtmlmV90aap1y2drfbXgUTEfw2V2/S1a7cPxLkEuKnOW1U8hN1EaTm/GB5TSPmitc3vKtwHlboSAVUHosar/aaJROkbzEDNAFP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sdcreXGDKv/xgUqLJHHubsW9p9Ynst05+8RzW9zLbo=;
 b=iJKKhreH7sdXcRoiC+Vk9WStpf6TkPu+3sA47Mx5M/SeaGSQzO0GQAC6l/CoAxP2qGBWz865AP+2JQhGkQ5pSXaVVUAltlHK9Z924YcNIKfZ87k9+fhRfO6IlucvuZsaJnLvYMmV7uHqtyi5zjm3umMXZ08wahIA1ScQZgLcQMA=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by AM6PR02MB3719.eurprd02.prod.outlook.com (2603:10a6:209:37::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Sun, 6 Feb
 2022 13:55:29 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::2968:8915:8e21:a3c5]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::2968:8915:8e21:a3c5%5]) with mapi id 15.20.4951.018; Sun, 6 Feb 2022
 13:55:29 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Getting Buildroot-created binaries to work with the
 Intel (TI) Puma 5 ARM-based CPU?
Thread-Index: AdgZ59CpwoDph7O9RfedaA99hM5qWQBZ8x4AAACvLyA=
Date: Sun, 6 Feb 2022 13:55:29 +0000
Message-ID: <AM6PR02MB48841BC55D50D047E0C48D73DA2B9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <AM6PR02MB4884FDD984AFCD1A4DC6B30CDA299@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <53fa9f43-8aa2-4820-70e9-365e22b3408c@mind.be>
In-Reply-To: <53fa9f43-8aa2-4820-70e9-365e22b3408c@mind.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 546a7ebf-ca2d-4d70-4957-08d9e9785616
x-ms-traffictypediagnostic: AM6PR02MB3719:EE_
x-microsoft-antispam-prvs: <AM6PR02MB37196B3C4DC7CA2A6F987B47DA2B9@AM6PR02MB3719.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +dkbPb8b/mUfsor9RnUUksOR6Ag2MPtESLMQBITDNJ9LV1FDFfMYOTMAmBB7xuyBDFBM12nzjtsdcRChb5bIdnPvL+VVHGlWtalyNkEeBqrOUGeJcFqMvfnshX67bfvOO4eIAduf6xj7Wzq9EmUEkSY7iLxM9X1Ze07YnLgPklUVYrbTGpDgILJWu4am/Xk4Jex2VEayqhhVYBR175sfoEMoDKQtncSj4Wik4i7nBvmfQapzR473PlbOEI4+JXn//dXOpnstsCw3YjOBwXxV+RBqR2acvKjLPCZjVcfAF27dQRsHzgjwBHn+L0pGPAkU7WPsFas7J0WZcOY8iDUukQLzpxv/OfPsEMW6bM+QjtSYXrg0Yn6/ShZqBZ3GxSsqQLPe8tMp/mxkVnvaVTmVoePdjT161vehyzqHzPZ8oEPzLsXu4k2mqOuZEzIUNZsB3EEkdetW894pz5JOGaJ5YH2Vz5oL395L/WDRnfbuc7MWqwzLSlAqbM0lxhfsB2pInc5bxdMGvXYBSOlj1PvBZvuK7xWOExO/uv57DTtFChRH26M1RELZ+UxelN9r7dJON8aziQ2VibEqX3SisbRVb8X0sdIYEoXxPX90bXd0C3MOFAnJX8A0ToagCBYgijycRtu980Cone4NfeKy8/nyvELCoo+jDgxDJFYBrDw+9mJJD970hu5Kh2tIoYB1E/fEmM+vHb6UUrFbwW9LiryOkkhjtnFvoT/28BYcbUT3veDY4EwebypRkn9M/kAHWfvnLkvvUte+3p5NM8b6bwtKLMfVbpONvlZ/jo3dS15M+jk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(136003)(366004)(396003)(376002)(346002)(2906002)(966005)(55016003)(52536014)(5660300002)(33656002)(122000001)(71200400001)(83380400001)(8936002)(8676002)(66946007)(76116006)(38070700005)(7696005)(9686003)(508600001)(6506007)(53546011)(26005)(186003)(316002)(86362001)(38100700002)(110136005)(66556008)(66446008)(64756008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnVhYjlJcVY3djhpdXk2TmNxeTdPbWtRazg0eFRORG80YkRDSU9RTlhpZjRy?=
 =?utf-8?B?NG14RmdQd2trVURqb0U2YnBPaWoyQTdqblhuTzB2enkyWGt1bGM3K1VxNEpB?=
 =?utf-8?B?b3d6QWlXQjVTWlV4ZENlY2pHY3ZSbk1PN1FoS3F2NXRYbnd6czlzQkVGZUZo?=
 =?utf-8?B?U2thR0JLaStwT1B4amtBOVM2T2ZVV0ZHdE9RY2lkaWZtL2poMFBKSHJqZnpQ?=
 =?utf-8?B?TW8wbldQdmUvdnQvSHhpR1ZaS2F1QWlBQ082RHRvakgrby84dzA3QTA5cnln?=
 =?utf-8?B?MUdwekxTSkNwMXNhQVFYd1AvYTVmZ1ZxRkxHSTF0YVV1TE5EQk9WbEdncXdE?=
 =?utf-8?B?Q1NXTTBjVkFoZkU4WS9KbkZ0VTVSUHNzQ09CUGJyU3ZIYitUc05NS01VZW5s?=
 =?utf-8?B?cjVIZ1ZTcTNnSmxIUEdLb0JBeFlEMFJBTm1OVXVDaFU0MERidmtyNlV6cEdS?=
 =?utf-8?B?eFhKVmFqZU5jVEVLT0RDbERiaVRUUmJVSFZOSWdrU21Na2pXcXQ1YWE3UDFa?=
 =?utf-8?B?SzlienJpbEtGYTdWVS9DbytyekFNYlUwMURjVmhEbWxyckM3SmsrdXdUZThx?=
 =?utf-8?B?dFg5bzhVeUgwdlhxY25zajcvWXByaHdtMTN6OFZLcm9hY0ljdDczT1cweHdj?=
 =?utf-8?B?QXl5QkVEb0FBMm1TRzE3UkM3Z0Y0bTZkVnRpbGp4WUNMbmdDazhKRTlSTnlX?=
 =?utf-8?B?MGIwdnJSdnJqa3BqL09sNHRrSmxndFcwNGx1ZnFoZng0b3FLaDZhc1hvODQ4?=
 =?utf-8?B?TldlK3FLN29IYUVWSzVZTkVVeGwrTW9xTk04K0twejdtY1oyOGVsMDFXTHB5?=
 =?utf-8?B?djl1VWd3K3pvUG9UQUlpbTAxQm1yVXRvWG5FOWRmcnB6RmJ4UnlJT1QxK3Nw?=
 =?utf-8?B?Wnk3bWdoVXo5ZnJxWG5oM2Fqand6NTRSRWZDbEZ5NFQxWWxML1RETmxIMVh1?=
 =?utf-8?B?dGJmQkVWVExSdnE3SEpwaURDOHdxRTR4N2paVDJmTlhaelN4MG1aa3ZBWW4z?=
 =?utf-8?B?MnEyeDBaZnQ4TXpoVm9pSHBONVJnY2xnMmlhdHRPUmtQM3VZWWdSQ0dtdElu?=
 =?utf-8?B?TUQzd24wZ0tKVCt5V01ZcXBxTmx5N3R5TWZSdE9PdjYvTzJzWWsxL2Q5Q2ND?=
 =?utf-8?B?Q210bXJ2SDNhRzJBYlFjMlhtN3NPV0JwdVhtTTBwSyswV2hROUlDM3RpREV6?=
 =?utf-8?B?cEYvR2U1MjJaeTVUVjVHNEQvYktRcjl1b0tzbmF5K25QR2dyQWhtdElLYk9M?=
 =?utf-8?B?cVVOSDVGdXlOMzYwK1ZhMTd1SngzTG9jR2tld1VYMmVDZTlTeko5K3Bublgr?=
 =?utf-8?B?eDUwYVVRNUFWVlc4b2dKbnpoVUJSWEFBbjFoTUxuTzBOTUtnV2Y4RkhEemtI?=
 =?utf-8?B?cDhOYUw5cGtObmptWWZPSjBkdHF6Y0gxSmVIbW41MW5YT0F1NFlrSFg5aWhr?=
 =?utf-8?B?RUJIdzFOQmhzc3ZPYmRYZGVka0JZME9GYjZmQ0NDNkVWYlNzYzIwZWlTbHp4?=
 =?utf-8?B?Ync3RTVYV1U2TnMxSXRMM3NYSjJpNGRUNjdJdFNGdmhRbkxUYktGOU04ckZY?=
 =?utf-8?B?RmYrTnA5SjhiMGd0ZE14aFBGVGtzVEdVWFhBUHUrZmhranVld2hMU0Y3dlR0?=
 =?utf-8?B?SHlnUmZwTEpGbjVEZlQ4U2d3RXlZbVVRN1ZaQ1ZNbGtuT1N1Z0laV0tBTGJM?=
 =?utf-8?B?SEQ1ZUdZZWpJNGErcmRnbXBtb0pISkZXYS93dThQZm5ycVU1L2h4aHdPbU00?=
 =?utf-8?B?SWI0TktRYldRNXJRR2hDVzlNV2NyRUhnSFI2NEdERWUyY01pZDZzSUtkNEFq?=
 =?utf-8?B?K0VxMGZJY00wOEQrK2VZRStDazFSMU5XUVFDOVlBbWhaeEptRVZ3NEZSODg4?=
 =?utf-8?B?bkthMUdFUWRLcDJiVjFrU21NOUszY3BzQ0ZFZXkyQ1BTNXVpdHhTakZIN3hW?=
 =?utf-8?B?M0kzbGlHMHpSWUhkbGNZV1ViL3FaOEtoVzFtWmFDSzZSVExqWFpWbENyOS9C?=
 =?utf-8?B?TjJvb1BnTGxqSUtmaTRVT2p6bmVZakF4SzhRNXdYTzJxWDdDODB6MWtJYUJM?=
 =?utf-8?B?dzRVK3hFbmNRUWEzbS9MTmlZejFvOFRiUm9kVml5bjN5b0dqNzY3a0g5U3Ju?=
 =?utf-8?B?bUlQcXdVNTlaeCsycW9KajNpQzNlYzRsK0ZGMHVYRVg2b3o2SFhvTmJMOTk0?=
 =?utf-8?B?bVE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546a7ebf-ca2d-4d70-4957-08d9e9785616
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2022 13:55:29.8815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZu/z/d7gDmcE4rmagI14k8M8cgdE2xj4alUVSmvGDlo7MQi0ynvwiI2oLYftDKi1LgjALEWnfyQJeu+5YKgmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB3719
Subject: Re: [Buildroot] Getting Buildroot-created binaries to work with the
 Intel (TI) Puma 5 ARM-based CPU?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: 06 February 2022 11:50
> To: Dan Jackson <dan@thejacksons.uk>; buildroot@buildroot.org
> Subject: Re: [Buildroot] Getting Buildroot-created binaries to work with the
> Intel (TI) Puma 5 ARM-based CPU?
> 

[...snip...]

> >
> > Links to the two toolchains I mentioned:
> > https://github.com/bmaia/cross-
> utils/tree/master/armeb/puma5_toolchain (uses Buildroot 2009.02)
> 
>   This one uses
> 
> BR2_armeb=y
> BR2_arm1176jz_s=y
> BR2_ARM_EABI=y
> 
> It's not clear if there's an FPU, so use soft float.

From /proc/cpuinfo on the target device I can see:

	Features        : swp half thumb fastmult edsp java

It's my understanding this line would include "vfp" if there was an FPU, so I don't believe there is one.

> 
>   That should be enough to build a toolchain and userspace with current
> Buildroot.

I tried creating a fresh Buildroot using the current stable version 2021.11 and only the above options.

I then tried transferring the files from the generated rootfs.tar to a directory /var/tmp/test on the device (the reason for this is that / is a read-only file system, so /bin, /lib, /usr are not writable, but /var is a read-write file system).

I then attempted to execute it in the following manner (accounting for the fact that Buildroot builds dynamically linked executables by default):

	/var/tmp/test/lib/ld-uClibc-1.0.39.so --library-path /var/tmp/test/lib /var/tmp/test/bin/busybox

(this method was suggested in the section LD_LIBRARY_PATH on this page: https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)

However this did not work and in fact produced a "Segmentation fault" error.

Have I made some kind of obvious error or mistake?

Thanks,
Dan Jackson.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
