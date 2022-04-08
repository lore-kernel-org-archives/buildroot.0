Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3332DC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 13:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A29841745;
	Fri,  8 Apr 2022 13:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8v8o0MEBS79z; Fri,  8 Apr 2022 13:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9660841726;
	Fri,  8 Apr 2022 13:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0778C1BF312
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA1E860D75
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 13:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQxPaWnNp8pK for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 13:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8C236133E
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 13:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5rKyvFJzrawauIF4rP1bDJ295Xa2B0jFLWZFvhSXigXk5Vuii54Esbdjbd7bC4aUsf6B23ANAowVze6bFX5qrlRHgo2zLo3WyER2opbIdFPfmxZFWfgc9M6V7juFYShL7bN/djKfa1sWO0fDERQRh8J9eccVDhfYBlnjsQzamj0s7vy8g4qdS4aspCFQYRbT1BWj7cGomaBOfC6SwrEPIv6lLdp3WM/Ri5lSDyj/Vf4B5VgETASRolrrRr+dhMKCCTxMfJrJljtWOtaX0HJ6x5P14vnDB66GSdhbBlg9DLWmfeVhbhX1nSEpL+FMMRthhc6xLKMQcbU98fGamQUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31KdImweX5u4Oa2luoGtflcUsWbNeleZvODt0us5ZSw=;
 b=UNr2CbarZz/R3EO52KCoea1OFRUCcog5zlGaA0g95jaJx31XwKYlbvH+8DmhyfIChSEJTEtA4QIPhInTjoGv97GI37Iy+3M6sVxjZMaLIv0rUVR5ypZnAooUKIMnrzLz18i/ST+//6EttWhmL1ahQmzSo/8ZfDKcIeO6EcbZsMwYNY13+TBTfyN55TQoKBkmdqvW7TnwsmBIfHhgdhNaMFAP2il7AmQaAYEl+6uI+wA3jwugyi1F8a9OvgJsIVWb+5kA9/DjEcWlaIKClvsEg5IGckESORC0R12CjpA9Tq3FfQlicxKUOnoDD/loBVmqW1c59NmLTF3qd+lMMKHZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31KdImweX5u4Oa2luoGtflcUsWbNeleZvODt0us5ZSw=;
 b=pGstKdwIrf+vbDxq6n2BjbmKm+ISvXF4ie/K5Ze5uzQtVRl2HD/uAhLAHIVybPngJ089FMfHMbIOpeXkrphmSYW6wmPeSMWWkd6EXxWZ6ExBvBIddV3qZvlJd1rUyLXp1e1uKXnyEHxb8AaVSW6U50aolSJRnwtP/UExdivDv4E=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MN2PR02MB5806.namprd02.prod.outlook.com (2603:10b6:208:111::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 13:49:23 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%5]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 13:49:23 +0000
From: Neal Frager <nealf@xilinx.com>
To: Arnout Vandecappelle <arnout@mind.be>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] configs/zynq_qmtech_defconfig: move
 post-image.sh to board/qmtech/zynq
Thread-Index: AQHYRTR39UuxMNiTQ0ufDAMNjdOO96zgEM0AgAYC+BA=
Date: Fri, 8 Apr 2022 13:49:23 +0000
Message-ID: <SJ0PR02MB7758E0A7BEC24612BEFDFB8DD7E99@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220331192030.3871720-1-neal.frager@amd.com>
 <18ef2499-bc59-7403-84d9-2cee63998ef7@mind.be>
In-Reply-To: <18ef2499-bc59-7403-84d9-2cee63998ef7@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ab66d6c-87a1-4094-bb7a-08da196696bd
x-ms-traffictypediagnostic: MN2PR02MB5806:EE_
x-microsoft-antispam-prvs: <MN2PR02MB58068DAEA9DD28C385D3615BD7E99@MN2PR02MB5806.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1m9RlhhI+8YCzzkQhMuZbUT8FUUctxlD43eBWCwXH8GiBmUSd06am0pCpDVxe3aaYM1emxPSNGhnN0KIbU4n8zn+ut7NtrXdjTFTg5c/grMoURWNJEFSzgig4cG7VJZQyEPZ/95EZ3396LfIOUWJguwTeK4PWZPfjZgk8G+LgpYUBIalzsLLaX1ErIH8hCPE/63HRKy4o8xH5gdKRIAZQCP97joBLcSdoXTnXfucfTROCdJ9hcvBigyLpwawAv/C7vFVu40vmv51k4EctSQ4/pBdduNlN/BpiJ+AXR9peXNY3a1x/+htKE3ZtRxJxzdvrrbbkkUjWWzJf9wrKD1VSdTbFOCxD9uY/VfSUjK0FeuoM91Uzc9me193isOqlDjj4YdVwajcvAYf1RL+lhUoCVw1rm5Xxk9zIROmy98ydPwPiLrubJHtX5d78yLkskq5lnG8UYhk2k6ysc/eqjuf8PmQF2fiLf+4BOZYUVK1cYC3rpGoD7BWjYJM2XxP4lgsvhNWjwkqtC9ENnSHWkvCMQIs5jeFrSCO5WsenyYs8o8GrVKzthl4LB68XXaKqC6o7ifpFb/qwo70eB5DqmgcF3U/jUP1bW0goITR3I+4f0qIHgzAU1OeDhPBxKgb93vTGQHfNGiPZvyUupZxD5ELukiC6cBxMltAv2ape2GpOcfNiKKfcsZQWCAFPMGrJU9N9XvZfGX5cHcoqYrSQJuDr0PXq1wopBGvFzCpAaTNc+D6XnfhTcYKwUVLLAzVDm+g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(55016003)(33656002)(76116006)(4326008)(86362001)(26005)(66476007)(66946007)(66556008)(66446008)(64756008)(316002)(83380400001)(122000001)(8676002)(186003)(38070700005)(71200400001)(508600001)(5660300002)(7696005)(9686003)(6506007)(8936002)(2906002)(52536014)(38100700002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHhieVlIcnJBMzErVTB5Um44Z0JLRDM2d2VFeFB5TnBoTmxoWXBwbU9HL0xU?=
 =?utf-8?B?bTc0ekRJWXdMaUNhRC9JNGdIT0FWYitmQnZZNEl0OHNQYlNUQlVxV1hXVzN3?=
 =?utf-8?B?YjB6eFE4ZlVOeS9qdmwvQy9NOThpZEQ4ZTByVS9xaDJwK2VxWnRSMFBEeVBX?=
 =?utf-8?B?OGY1dzlpc3U2OWduNlZoK2hVUlpKOURUZDBSOUhZdUxCMWpFdE96Q0h4VW1J?=
 =?utf-8?B?dy80L0VSVTFwWi9sSjJVQWFua2l6a1lGT000c2RTQVdJVVJZNDhqSmU5eVRr?=
 =?utf-8?B?TjVLUWM0SzZsN3V6SmF2Y1FCN2dmWkFvQXZxaWRNQUlXc3JIdEs3c3JGSFZ5?=
 =?utf-8?B?YmcxSFR3MnBWZFhPWEZQWVdwb3ZzSDJVSjBPaTJUa1lnbDZMU1Qxa3E2aVJR?=
 =?utf-8?B?U1dpSys4cXdTR3BtdjB4TUhlS2hBNVoweWQybjZYTnlGQTVUMldHWDh5ZHYz?=
 =?utf-8?B?cHg4amV4QU1nbmFWQjhYQXAxa2NWQS9pY2ZjNnd3YVVuRlNFTXpuV2pVaXNx?=
 =?utf-8?B?bUxIVEZWR1VSSkFMbE9lY0NTRVRYTGplRzZoaExUbjVwMDhuejNaNmlsSFZ3?=
 =?utf-8?B?WS9aVGpibHdodmFsSDVraCtBSGtzWkhUSVFWOCtRWUR0RnB3V2RCWHYybGdh?=
 =?utf-8?B?VGg5UFIxR2xQeVRqYmgzU2VNalA5YzhFRURTanNtQ01JWC9uUllxVEFQQ25t?=
 =?utf-8?B?WW90VTdNdE5FSExHSmNrWEtBOGprOTdHQnk4VU5pdzVDQkxnbGhsdU9rVHFW?=
 =?utf-8?B?TGh6VjRGTUR6dlRSMXI3Mk03N3F6Wko4SEZoNnBsdlR6cm1TalUrUVRQQzhT?=
 =?utf-8?B?aFh0UVNZUWJJd0gzYUVzNmU1MUxxbzRobmJ2Z21PblFvM3hCQUNacHBVSlFu?=
 =?utf-8?B?SGZlMklaaTdRdTUySkp4MnRHc1Y2RjJCZE9jejN6RmJBK1pnT09UcTMrNWw5?=
 =?utf-8?B?T3FJOWJoamZNdWk1LzNMMGR4clMzMTZUbno0TlRRU0ZFeDl4SW8yRDR1ZXg3?=
 =?utf-8?B?TUU4R0tNSGV4Y1lCQjBxRFlnbUFLa0tLVmdqUVoyQXZwMytrTmJ0ZUNPNjlx?=
 =?utf-8?B?Y1RsQUFnOUVYMjZvbHFzbnMwdzU0VzVyUkczWmwxN1lGNHdORjZPdVlqMmxm?=
 =?utf-8?B?czA1bmFWdnJtaTdIcXlvSU9BV1c2dDBzeStaOTlsRXQ3dFI2Qm82TFA4TlFi?=
 =?utf-8?B?UlhGek9CSFNIWjEzSWd0amc5MTB5VXYybVhxOHBXd3BmTXdaMGt2NWx2bDZk?=
 =?utf-8?B?VXZVYy9WZ2h6MW93SWJOSm1rODlEanlRZnFHeHlhdzFDNFpIQktSVXlPUFZW?=
 =?utf-8?B?QkpPUTM2aHBuV2EydU5ITXpOUjlqYTNFd3QxZlZERE1FMkpsVEVPdlE5cCsx?=
 =?utf-8?B?d2N0VENUWCtqRmVoK0oxUENPRFd4VUV5UTRWbmlDa1NsVVl6M1k0VGFKOWVH?=
 =?utf-8?B?VDVLTlVvVEZDcGk5WHBEY0FJdkZkV3hHNzhYNXg2c1gxeVJFYkw1U1NpR01H?=
 =?utf-8?B?ZGxXeWZUQlJXdktiN2tIanFLd1VXL3IxSUpXL2tkM2VRWXhzdzF3QkM2YzR3?=
 =?utf-8?B?NHNuNHFEQUtaR0dac1lST2g4ekFxVURsVm5ldmUvbEc4NENmWnI5dkdZK2VN?=
 =?utf-8?B?SCtqSExwdWpDQTdxR3pJT0VDUTZ6NEhFSWMzZDNGaWR6ek5ZUHlnZ3RCWlRY?=
 =?utf-8?B?TVRNL3NkWWhxZlo4Y1Aya1hGZ2VHK3V2blAzU3dnd3Z2UjlCc0hBeXRHV0pI?=
 =?utf-8?B?S2lxQnFBTEp2TWxlaUM5TFJYa2lUYXh3UitTZkhvYzVrOFNHeE1tenZqTDRE?=
 =?utf-8?B?VmM1NlJKTHNKUTBNSWtmdmV1Rlh3QjBzcGN4SzlsWTlVbEZVODV5L2VxQ1B3?=
 =?utf-8?B?b2xhTm82THVFbUVWK1ZaQmwwdklYNnFtci9tUEplZlRaUlY0akZ4d1ArMjdw?=
 =?utf-8?B?VEZWRHRLZVgrb21PTitIZHhqWmlWYzl0L1NNUmszR0RVZ3ByWEI3cWxjL01X?=
 =?utf-8?B?Z0VTdlVZaXhqYjdHU2xYenRLR1VhNlp3K3RLSHNUU3diQ2oyRE9OZ1grLzFo?=
 =?utf-8?B?VXR4L09BQVFXUGVYU1RxMjdYZUo3OVFJNVd3cU1CRzhDR05yMXhFZHo1Q2xM?=
 =?utf-8?B?Y3Riek51cXlEdkRNRnpPU2R6VVpka2haUDVFZVdXMWZ1b0ZmbjI0enU0TU5E?=
 =?utf-8?B?NU50dWFIelpPM1hlamh5UEJvdFd3bmxyNkVSQ1pIQmdUQUF6a0lUYVZlcjhr?=
 =?utf-8?B?M1VFVk1MOFdYcmtFK1dxNWt5MU1jWEtNN0JOaU9aa3JCVUQ3VGExWFFaOEE2?=
 =?utf-8?B?MmxybitjZCtRN0NxeTZvaWtsT0VHTDNTa012MHpEUGhFQzU4QWFVdz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab66d6c-87a1-4094-bb7a-08da196696bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 13:49:23.1784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxLK3D4kueT4dM0d44OxLU1GLo7a8kNsw1oFbhVf+q6Dmpx9MHm1aRH+NFvvRCboRKfeJ1sYyVRyCUJFPuqlMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5806
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynq_qmtech_defconfig: move
 post-image.sh to board/qmtech/zynq
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

>  Since you're not actually making any change that makes a difference between the qmtech and other zynq boards, I don't see the point. In the other mail you mention something like "because the device tree is not in mainline", but that doesn't really > change anything, does it? Other then maybe the device tree having a different name, but that's already handled by the script.

>  Instead of forking, it would be preferable to still use the same script and genimage but just make it configurable.

>  That said, making things configurable may also unnecessarily complicate things. It's a difficult balance to make. And impossible for me to evaluate without seeing what changes need to be made to the other zynq scripts.

>  So, for now I've marked it as Rejected. Feel free to re-post as part of a series that also updates the zynq defconfigs, or replace it with a patch that makes board/zynq/genimage.cfg configurable in the way it needs to be.

I have found a better solution for this where we no longer need to fork the qmtech board to a separate post-image.sh.

My new patch set updating all 4 zynq boards is coming shortly as soon as I finish my test and verification.

Best regards,
Neal Frager
AMD

>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/qmtech/zynq/genimage.cfg  | 27 +++++++++++++++++++++++++++
>   board/qmtech/zynq/post-image.sh | 13 +++++++++++++
>   configs/zynq_qmtech_defconfig   |  2 +-
>   3 files changed, 41 insertions(+), 1 deletion(-)
>   create mode 100644 board/qmtech/zynq/genimage.cfg
>   create mode 100755 board/qmtech/zynq/post-image.sh
>
> diff --git a/board/qmtech/zynq/genimage.cfg 
> b/board/qmtech/zynq/genimage.cfg new file mode 100644 index 
> 0000000000..67baca795e
> --- /dev/null
> +++ b/board/qmtech/zynq/genimage.cfg
> @@ -0,0 +1,27 @@
> +image boot.vfat {
> +     vfat {
> +             files = {
> +                     "boot.bin",
> +                     "u-boot.img",
> +                     "devicetree.dtb",
> +                     "uImage"
> +             }
> +
> +             file uramdisk.image.gz {
> +                     image = "rootfs.cpio.uboot"
> +             }
> +     }
> +
> +     size = 32M
> +}
> +
> +image sdcard.img {
> +     hdimage {
> +     }
> +
> +     partition boot {
> +             partition-type = 0xC
> +             bootable = "true"
> +             image = "boot.vfat"
> +     }
> +}
> diff --git a/board/qmtech/zynq/post-image.sh 
> b/board/qmtech/zynq/post-image.sh new file mode 100755 index 
> 0000000000..54c5493b4e
> --- /dev/null
> +++ b/board/qmtech/zynq/post-image.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +# By default U-Boot loads DTB from a file named "devicetree.dtb", so 
> +# let's use a symlink with that name that points to the *first* # 
> +devicetree listed in the config.
> +
> +FIRST_DT=$(sed -n \
> +           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
> +           ${BR2_CONFIG})
> +
> +[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb 
> +${BINARIES_DIR}/devicetree.dtb
> +
> +support/scripts/genimage.sh -c board/qmtech/zynq/genimage.cfg
> diff --git a/configs/zynq_qmtech_defconfig 
> b/configs/zynq_qmtech_defconfig index 4db3f68b1f..dc3b22c876 100644
> --- a/configs/zynq_qmtech_defconfig
> +++ b/configs/zynq_qmtech_defconfig
> @@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
>   BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qmtech/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2019.2.01)/linux-xilinx-v2019.2.01.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
