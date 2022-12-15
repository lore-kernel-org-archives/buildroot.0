Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673B4C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 11:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC16160F3F;
	Thu, 15 Dec 2022 11:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC16160F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7BqSYn16Rts; Thu, 15 Dec 2022 11:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D1B60E0D;
	Thu, 15 Dec 2022 11:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D1B60E0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3A91BF308
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 11:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7477C60E0D
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 11:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7477C60E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svtjAS4nfjKY for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 11:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF24A60A6B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF24A60A6B
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 11:12:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnsuqOLGxaPuTKnDTH+HrlagKcQvm0dD+GBYrXwYZ1IhN7C2nOI71EJoQQy8kNWh14B5wls6GSViV9/OSgpsKDPVtFW69V9/xBSJAti2v0cSomlQ9TGWrEMHC5yGjqMFeKXspJPgRO/QM9svqqfmQ56yNPXk3BVwKRwfXWUKMqh+GrQ01EBOX9Gi5XyOTQZ5rOhaSWKaGtgPDo0ethPr3bjyb/tVAsJ9GabkwzP4EWO/BmsFd60bZwUOFQwqSN5/T6WHZIKafD6GPOkMtFNooQ7ZKfEp1LrggvM1DRUjYsYRwOTDkqyVuxxYkTNaE4AZhEElUfnFMGz+sTJTD68Emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqmL3f6d0m9AoXXA4zQSP3+8g50nJksnejgAjTNGVVs=;
 b=j0OaBO92A7HHp2hd9D5wMu4Y6thJXmEviGXQavWYel0K2yqZX4X82AGe8I+Kj2YainP/wv4PhJxmKKHf3W5eeTWY4vFmBpqb6OGZuorHrmynzP+eLS1yZL4msxXEnMPuR7sLbPFgudt5m/qVPROIjAqYszML51M/Dcr0NTdXehamBiK/jm0sjoDy5fxrtQkYPdr0luMHg1bO4C8CvC9OkPm8KnoCL7pU0ya/P6gq8uV5qfD69rh3w53cp5Ilp7uxEWZ0ADdTXaDufDQpVzlSH/VMh9vqZSfRA8NJcjEyZbZDpKbU9lajz9J91gLwMxaF1ISC0sTjla6jZwJiVfm9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 11:12:20 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 11:12:20 +0000
To: "Simek, Michal" <michal.simek@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
Thread-Index: AQHZD8xsnYX2zpUQi0yi5QmLt3WkeK5tfpQAgAAAZ+CAAUI9YA==
Date: Thu, 15 Dec 2022 11:12:20 +0000
Message-ID: <CH2PR12MB50044D4AF65A0487013044CDF0E19@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221214145737.31849-1-neal.frager@amd.com>
 <7a46c290-f7cf-8783-2aab-a64f8718c694@amd.com>
 <CH2PR12MB50046DF3A11AFFCDC55B5774F0E09@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50046DF3A11AFFCDC55B5774F0E09@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM6PR12MB4500:EE_
x-ms-office365-filtering-correlation-id: 415f965b-27f4-43bb-cee2-08dade8d3c0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OD0nohJdemQKsP7mrox0alTd+96dryqhj4xcfIbe/vq60P6jTFq9Zhh2SXavUNATcAWlpg2flLTZI2B43cJI1FJCNZMVZENn6ULTq8HxFY+9Sy/9q9K6+L7L7lekXt8Rg87fZId1MwwjpjQN1AlJdvxIyD2IgPaMMmHULfgWgOwNLAwm3CaWZ28nwExD+DVDb/+WCtY2TJ2sgrS+ZC6+aRi0chF2OieTPlc1Nzo0h6IDIgyZP3URVwXmJ0pxJo2uyY4J21BldVsuhVdUvR5pqLezzOfKlGjo78B3W0RnpCCEnDhyZ3Ik/1AQyM7W46oZwwR33SzrCaWVuZWNxvgiB3XSi9lCyehdeIrta07uGSbQwCgjOgfEaF9ot3Uk09CtneldiHUICNaT8V/OtmcJPOqZjxgg4E/vPd9fVR7Sde1TQDnYSx5gAOggyPYtQ8zkVn1AYRfIgOVF2nZ/zBOHW0PdIaxFYihA9nRTr0nsOITES0d8XMFm2YE+9YGsYkcxYPAa0Nzv86KNBcDlDgUMRezW3cH4wMh9x1OnyVEPI/zgfMiL817WP9Zq0/pRW7yibn5Y3cklvNaMVuEEZINk7wjnxvW8A6/pa0HXjYxaj7rHQ6wPH4MnceTKVWKf81BYOpR49ADkJETo2WwguL8DwhOv2rRNE4F48hmeSimiM2CUbcnKKx4j0Hr0oQF1PuaxtAO5lzqDAK5alO8kD1BSLWSu38XNylPLopQGrQNQy80=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(71200400001)(478600001)(966005)(186003)(6506007)(7696005)(9686003)(38070700005)(316002)(66899015)(5660300002)(55016003)(2906002)(33656002)(54906003)(64756008)(83380400001)(76116006)(66446008)(66946007)(110136005)(66476007)(8676002)(4326008)(52536014)(66556008)(86362001)(8936002)(41300700001)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjFMbG5sencxZkIydkE5NjMwMnpqTTg1OHV2RXlOOU05RlRILzRTUlBBa2kw?=
 =?utf-8?B?SGpuUDRSSUJxUS9BNGt5Y1VVbEtmN0J0YTQ5TkRoN240RUJMRzAxelIxQjdG?=
 =?utf-8?B?MHlad2JrQWhIRFFvRnZ6cmpYTUtDMGFGWGphU1Q4K3JyTDJxUm9zdFoyNXAy?=
 =?utf-8?B?MitRR3dKZ2x2Z09NK3d1NlAyUHpXMGpmTHhkaG1TZDNjbGV0M1NGbnVvejFj?=
 =?utf-8?B?WmgwaE5UUWFpWmZWVDJJajV0dHQxdmJucXBicGpEOHBYQ2huQzJoMFpaTDhR?=
 =?utf-8?B?MDhGalE0YkxtYXpNbG1uVFFiZ1hva0EwRmJaRTY2elNGaUJiOVVZTm5XdFFB?=
 =?utf-8?B?eWVUV0Q4M2pZbXRKcWZXRE4yVHVhYXBIQ0tKYklMcy9WbEJ1Y2RFUzNKRGhk?=
 =?utf-8?B?MnJ3dXRlWmtiVzhuaWtHNmQvR3dNUXp0OUV2TlkzTU9TSE1vS0hoSlNab2Vp?=
 =?utf-8?B?NUJtL0RBcFMxWkVBSGxXc2JsaHVUWUIyaDRQYkVvdnRkQUZGSUNhL05VT3dD?=
 =?utf-8?B?SVI5aXRMcXl0dS8xZk1LUmNpbTBmeFdEQTRHcEd5OUpSWlVnSFlLOUpyRE5m?=
 =?utf-8?B?ZHI0V2NXdHZEM2NFcUhMM0NMaWlRTFd6bDUyRVFDQm1kNjIzUTdXWEtwbERK?=
 =?utf-8?B?Syt5UTc5VTZPSVVEOGRvRHE3MitXRy84VUVEbUZtcnVEbCt6Mkh2T1NCVWN3?=
 =?utf-8?B?SyswMjJJNHZzRHpmeVlpYUFPc2xpdXB6SGpzdzZmK2o3ZDh4M25WSm8wZXRS?=
 =?utf-8?B?QkF1aXE5WjNFRXkxUzVBWHFISnVXQSt5amZsKzlRTHUvWUpucFRaanNNMTU4?=
 =?utf-8?B?b0p2MSsycHIzQlo5QnFzUXcwVnZ5bnlMeCtkbnVRYUwxSG1pVTdyMmtONEsy?=
 =?utf-8?B?eHRudEF5ak1ROVRheDl3Z0JoUkFuVDhPQzF2aHdDVHdBdXNHNVE5cktDVXRh?=
 =?utf-8?B?RmNyNHlwRVlld2x5eVg0MFlmb3JNYnczOU5zWjhLSWZWSzZaMlM1Z0FHaHVX?=
 =?utf-8?B?QnhkYUJpT1ZteE05ZHV1QmZZbkNLakJuSU1VM3JkNzR0djROdXRWRnNjMFZP?=
 =?utf-8?B?WUxoQnN1RjlrVUN6dGlqanB5UEpDWEU0Z0o4WTBUNW95L2cyVWlDcjlGRDdB?=
 =?utf-8?B?S1pOTXJ6UFhoU0ZydzZhL3ZIckJZekNSQjRNZmZIWDVab016bVhnQWp1S1My?=
 =?utf-8?B?TlRCb1dsbDE0d3lsSnp2S2JPQUN0TmlyLzF2Uk1BWnoySVRENWdiaHNkMU1V?=
 =?utf-8?B?NjVVWXNNOFdhV0dRSW51V2MwdkR5dFladUF5WEg4d2cvcmk0UWFLWEpYWXBv?=
 =?utf-8?B?NFdBRlRhQ3dicGRrSm9mZjhhTVorMlNMWWFzSDhFSHYydkwxQW42MDNIRjN2?=
 =?utf-8?B?OVVuTWRmZm5vQVd4RURUM0ZBSDBCMTFkZ0JUNGRPbTdSbnU0SmgvZ05sZ0dr?=
 =?utf-8?B?a2NqMUJBSXNnbWFVYWtnTzZZNWlCWnNhNlpmZUdvZXVxL0FnK0RkY2lBL2dj?=
 =?utf-8?B?VUVJTXdzbzFUUk1GTWh1RGFPeVppSVVuc3hHWE1KK3B0cDhoTlZGSDFFeEw4?=
 =?utf-8?B?V3pwMjZhR3d0WUVjRFIxWlkrTFppVmhnUEp4ejU0bWNMZjlvcjFackVTUVJ5?=
 =?utf-8?B?L052cE04M2c1alpwVWx0UG41OWFaNS9lSVVLNjkxV29sdGY4cDljRUZhaGhz?=
 =?utf-8?B?YVlpSDhVQ1JubWdXcktIVnlzMiswNEJrSG9ueWRaQXlDOHR5Q1ozUHBJQ2Fl?=
 =?utf-8?B?d3FITHkyRmpiNUYzZVg0WDhqcDdNdFRBQ1B6ajdZeHRaR0FnTFdLVjJ2V25T?=
 =?utf-8?B?ZFlOcElOVkcvbUtaMzlmY1BHMlFMY0dETjRIM1poeGU4em01OFlCYkxleSto?=
 =?utf-8?B?SmtlYTkwMHgzak9VMXVZNmhOSkFPcUxNL1BmNnFNRXBLeHU2L1pnVlNzd3U1?=
 =?utf-8?B?cFhBd1JYWm9rSWZxQ1JNNGxsK0k5WGhxV2VKcEtadlo5M3B2RExTQTgzVVNB?=
 =?utf-8?B?QWoxYkxWZkxWVE9OMGs0QXI4ejF6SktnMEtaYTJ6ZWdpK0pGZyt5UFlLMGFo?=
 =?utf-8?B?cHdYc3B5b0ZNcFA5Ni9LRklLVnFDMGQ4SCtpZUVoeFYxd1hSb2M3cGxFYXg4?=
 =?utf-8?B?VmRlZHJRTzI2bGFUZWRkd1pMZDI5Yy9lbTVkV1dhenc2T3Zudk83Mno4SS84?=
 =?utf-8?Q?O/GGuka7hphyqAyDbH3/eRg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415f965b-27f4-43bb-cee2-08dade8d3c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 11:12:20.5304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhzNlekCeolPC63VRZdxyyASaqvX30gKNJUAe4agkaANKGoNp6m+r7Co5q5wgL4s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqmL3f6d0m9AoXXA4zQSP3+8g50nJksnejgAjTNGVVs=;
 b=Fs4dD6lEjhz3Pq9jlfzAjkOU+jjt0kEWDmOydxlsrcE7x2rucgQianJhOSp6hLyw5p823ZaXaB/NeLeVSo93JMn8lOGeM5NENDFZdJjVmjGcPw9wzwztrj0XreLd00qiHrMyYa9lHl2UM0PXll64uI3dCzc51BmXp+P+ZuIJ6Sc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Fs4dD6lE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> Reduce the configs in the kria/uboot.fragment to only what is necessary.
> 
> This patch has been build and run tested on a kria kv260 starter kit.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/zynqmp/kria/uboot.fragment | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
> index 9e32edfb36..f91baa2d8b 100644
> --- a/board/zynqmp/kria/uboot.fragment
> +++ b/board/zynqmp/kria/uboot.fragment
> @@ -1,14 +1,9 @@
>   CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
> -CONFIG_DTB_RESELECT=y

> This should be enabled only for kria but not for others.

> For some reason, the CONFIG_MULTI_DTB_FIT option is not building properly with buildroot.  Could you look into it?

> I get the following error on first build with CONFIG_MULTI_DTB_FIT enabled:
> FATAL ERROR: Couldn't open "fit-dtb.blob": No such file or directory
> ./tools/mkimage: Can't open u-boot.itb.tmp: No such file or directory
> Makefile:1429: recipe for target 'u-boot.itb' failed
> make[1]: *** [u-boot.itb] Error 255

> When the CONFIG_MULTI_DTB_FIT is not enabled, the CONFIG_DTB_RESELECT does not exist as an option.

> I work around the issue in buildroot by overlaying the carrier board dtbo directly into the som dtb as you can see here:
> https://git.busybox.net/buildroot/tree/board/zynqmp/kria/kv260/kv260.sh

I have identified another way of dealing with this issue.

The problem appears to be compiler related in that the buildroot compiler attempts to generate the u-boot.itb too soon after the fit-dtb.blob is built.
Using the Xilinx compiler, the mkimage call to create the u-boot.itb is the very last step after building the spl, so there is plenty of time between building the fit-dtb.blob and u-boot.itb.

However, even if we fix this, the u-boot.itb that is built will be wrong anyway because the fit-dtb.blob will not have a dtb containing the kria som dtb along with the carrier board dtbo.

So to solve the problem, I propose the following:

1. We turn off creation of the u-boot.itb at u-boot build time by adding the following to uboot.fragment:
CONFIG_BUILD_TARGET=""

2. We use the kv260.sh for generating the correct fit-dtb.blob and u-boot.itb files:
fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb

Using this method, we can include the following u-boot configs without any build failures:
CONFIG_MULTI_DTB_FIT
CONFIG_DTB_RESELECT

Long term, the u-boot.itb build process is going to be re-worked anyway, so that a combined som dtb and carrier board dtb overlay be can be used at build time.
When this happens, it should replace the above work around enabling us to generate a correct u-boot.itb without needing the kv260.sh post-build script.

Is everyone ok with this this short term work around?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
