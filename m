Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C54C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 15:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E2E80BDE;
	Wed, 14 Dec 2022 15:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E2E80BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4qus_37456Z; Wed, 14 Dec 2022 15:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A3180BC0;
	Wed, 14 Dec 2022 15:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A3180BC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 290CE1BF3C9
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 15:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E025B60B4E
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 15:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E025B60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5STpPnogW0OT for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 15:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A8760ACD
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A8760ACD
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 15:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFocWI+YTn1jqWdRqEC2GsTPxWtkUek9X7ssKn7E9WxAXDd3rtBvPZLNHK1nqIzGHp2o60zJUhdKi9zgIXYYnTjNlAjvgz2ScWdxZTnesKDEiR9lcQxkUoQSzDu8HuiDucwol2DPFOwPAnuAulY/r91CCKQgXxkd95uWqqOGzDpa36vwdHUw+9oGagfIhUcIFLAQBo0tDEKIXnIOMGo0E8L7s1y3yBDvszn/18UFlyW+BO5kD03UOk/6FP/2/KU8wUTQUxGhqx86bAYQlJSVwn5l/ZOIiuh+U0zR8uob5A4y2hva7Ihh/oX/E5xH2W4iNgzb4lu/W9FYUclnDVKQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w0xxt7IHL3x14VQKGzhIkmxDrHndMBHPtOO5YhcQ0I=;
 b=Km2R0QQMMVMbO/ossTx/O8xDbARPu8XZVyeNk8hES85e/2C0QQwYB0X8ulQdx92G6Du+qaL3P9M3pmKKbo4uiRNUnF2qa4ZSs0edFqyQ5IMI6FePEmbZSVluW0H8Ltf8lSFNpEY02WkrZpo/yUuM5dXr6AigzVPIjSK+l/98YnmhQFC04ZmAf4wD9w4pNrZBIdJtgnsEYo5Cm6BEaUW/x66oOd2Pv82lWghWVj0KcePH4uD5GRyu6nUPsJRuFu623xRIvP+Q6sda6F4+uwKNgIJC95RoECtlKhXzDsrLAW55bY8XbxO7/NMYdDW3n7vf4BM3/46lnQeV4noFOy6BuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 15:34:07 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 15:34:07 +0000
To: "Simek, Michal" <michal.simek@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
Thread-Index: AQHZD8xsnYX2zpUQi0yi5QmLt3WkeK5tfpQAgAAAZ+A=
Date: Wed, 14 Dec 2022 15:34:07 +0000
Message-ID: <CH2PR12MB50046DF3A11AFFCDC55B5774F0E09@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221214145737.31849-1-neal.frager@amd.com>
 <7a46c290-f7cf-8783-2aab-a64f8718c694@amd.com>
In-Reply-To: <7a46c290-f7cf-8783-2aab-a64f8718c694@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB8274:EE_
x-ms-office365-filtering-correlation-id: 8da3a6fe-130a-49ea-4f3a-08dadde8a3c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zovqGIQpDTyMRiSXGgssqe8+jKF3voct9z50fkf4q9kZRxaHcdM1ZwlaTZx4qjVDKIN3Yi67tYiorhJ0mpPQCLYI22bSnSNG8C/GrW3SyrsX9Lp30erlIxBFaH5xdmb/JVg1rKkdVYLMHCJICwRq09A/OzMHlSjLv97uX2TO4lfMekatWhk5SehSRFNoYO8W9is+7szLJ3owlX9HKDBW8hgJGpQrXDabPKcQAGEtiLXLue9T12dmdRT7wuLMiPQjBl8cG6MKzi6UESK1/6LO3Ln6rC05VgK3Fx5wBz5SeTCvDNklrjY/KEMXfpST+V39iVs8nb2XxDjeeKfMtlUEG6p3j1yZ8EA0LLvw/37L83Dadq6fwayJqYXmspbDdreRqryvnUX6uzg35UdCzWLdYnldrVzaBzdwxXDj/NPqH7LEZ9hzqQjL/o41jVI+PPWVLAvGusrYj4tJZYPEHeeXJB0nS+ngvWHCjQZnKsREU2AvzIyXEunwKxOvkQ2JamHMJ1DqjnW8fppQLc5jmIkpFdD5ctdDEWfIAcddgalqIA7JW1RLD8fw5fPhQ/OZvtOfzBagD7DBsU6Y3PQWaFvHxP1ZLV5Sm6U/Djto4GcHNpgQU54BYpNKwMNPfNSMpB5GOs3a1xqVy7hn9lK9iRqVZ/zQUXj5PtAIkXMy/LiyQ5slM3TmbVg1VH9uu8rrXQJJajVYLyrbYdK0ee+ud3cicfzMjRaTv9fzhX2yBNHQjWI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(76116006)(4326008)(2906002)(966005)(6506007)(66946007)(186003)(66556008)(71200400001)(41300700001)(478600001)(38070700005)(54906003)(316002)(110136005)(122000001)(7696005)(64756008)(8676002)(9686003)(86362001)(66476007)(66446008)(33656002)(38100700002)(83380400001)(5660300002)(55016003)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWdmM2s4ak9wbHFaRzhFSU1RV3ZTamJWZ1pEYjBzRWxOc0psVXRHL0FoZ09t?=
 =?utf-8?B?Q3dybGhlNjRMS1lNZm5rVmI1VXJPdGxrc2pGdE5xclBVaHBoaUl2QkFUNmVl?=
 =?utf-8?B?YmlWUm5KZnV3ejVUcFZ5UVduM3k1Z1F5MGI2YWJMRGJXVDZUTG5YOHBqNTlr?=
 =?utf-8?B?TkJkeTVldEhFbFNUbzZLUitWWE10eERiRnZPWnNOSXVoSkw3SEsvNGQxNnFN?=
 =?utf-8?B?ajFpOW1idDVpSlNQbElHY2tGamxmMWhKdmNTWGZoRVpJcEhYTHFGU0ZYUFFR?=
 =?utf-8?B?WWNnVTFNdXJIMWJQRkFLekVDOHZJcnd1VmswakY4MTY4Zm56ZHFqNFJKbDdJ?=
 =?utf-8?B?aUNQeHpNenhPOCtWVFc0WFhDNmhxcGs4UXZMR3RaU3FDWUhzWTRDdTFBbE0r?=
 =?utf-8?B?VitWNzExNHBDNDdxaDM3RzAyTFVCeVl5VjMvYmRpUWE0b2JpZVBqekVpL3hv?=
 =?utf-8?B?OGtGa0F1QVRZVW53MUVXOUlqSjZKT1g3aU9uRU9VM3p3SXpaQXd4R1dQaVl6?=
 =?utf-8?B?MGQzVUxPNS9OaDAyQ2dsN0NQK212UkFaUHZORnFQd2VGbGZLYUs4Q1ZaOWdW?=
 =?utf-8?B?SDE0SldlbVBKb2FNS0RnRk5WNW9JNUVvMzU0Z2xJTmxqa1pOVll6em1wbE4y?=
 =?utf-8?B?bnBzWHhIS2cwKzdJNmtUNzNqUDNwcEhWTGNvaUo2OGFoMHBOR0syckdHbGNr?=
 =?utf-8?B?NmFmZklTM2ZuSzYvWFhFQThDWlFpOEN4a3g3T01XSlhBVURxQUFQVDFaeGJU?=
 =?utf-8?B?dmk4WEJiZkl0MjI4Y3NJTmFlTEdPeFFrSENWYzN6RjJoNktkRGhvdDI2elp2?=
 =?utf-8?B?RUZoYk13SW9YbmZyREFWeStzK09wZ2tCb1g1Q0thY2V6RElEQnRjU3A3TjIv?=
 =?utf-8?B?RWxVTHhQZ3VIK2tyTzdCYWZEL2FWYUdMSmNZeHNiYjNhbzgwUXcweHJuajZm?=
 =?utf-8?B?UDh1aUlQZWY3NEVLb1hRTGh4TTdENVBnMlFrQVNwUzl4NXRCWXVjaW9iUUF1?=
 =?utf-8?B?ejhCVWlLNGpDMnY4c0ErdFUxVnpCN3FwTTd2QXNNL2VFc3FVeHlpNVN6R1FS?=
 =?utf-8?B?NThaNXlmaE9GUFVkNlJjWDdNc2F0cmI0VVYvaWhNekRyZkUxa1ZISFFxeHEr?=
 =?utf-8?B?M2o4Zm16b2wxRnhwNDlkRDNVNUREeEpHRGVwRi9QQkV1T2JuOWU0V0R1QXM0?=
 =?utf-8?B?Mmc5dStVM245bFJlcjlYZWtSR3R1K0ZPalhWVGdQRk9yaGM2elRYTEtkVVNH?=
 =?utf-8?B?UzFjQzVyVzhJUWRsU3VtcWUvLzVBTUlzVWxzZ3FyQk4yMTlyazdRWHBhUmlp?=
 =?utf-8?B?VlRYTzM3L2JFeXEzLy9KeWNVeDh5ZnNRcUtsVDZlQmF4QlVmT01nQWZHS2w2?=
 =?utf-8?B?azFtK3RhdlNpUzFlakJGVWVJc3lJZGFBcnVKTlI1MkRZRkUvRnlRVUVTVS9r?=
 =?utf-8?B?bkNBUGJhS3VQSnJvdVAxUmlTLzVLZWJsR1RYdUZ0MWMxSGMzWkRiRlR5MElu?=
 =?utf-8?B?SnZwVEhYTjA1NHg4SUM5emE2cXVmYVBaaDUzMjBvRnJFZlhRRWsrOXNKZDFl?=
 =?utf-8?B?RVloUXdSTkhJeDNScDZHM3crcEZ2Zno5WjZqcHNzQWIzZVRxTkNtUFJVcEQ5?=
 =?utf-8?B?OGFlaWh3aWx2L3pmZ3FubEdnNk80TnEwSGhGQmdlVWtzcDlGMlhLalVZaTJO?=
 =?utf-8?B?dmhweW1qSlExQmhlbVZ6QytudkVEQk9YRGpuOGtpSXdISHl2R0YxZWEyQmRt?=
 =?utf-8?B?Zm1GeUNxODNuTzVoNGVSS1JzcElST1RRMS9EeEhlTENqdExFY2ZudlZ4ZVcy?=
 =?utf-8?B?NHowZVMrS2tSRC9pd0s0dHMzSnJnck5oOFliRmJSekRPMjNrajVITFI5N1A0?=
 =?utf-8?B?QnZ4RTFoS0t5MlVMZ1NKZWhnd0hQdDNFMlFmTTBPUEY0K1k3TGlLcXErcXMw?=
 =?utf-8?B?bjlZNUI1SWtGc2srQ3RkYkRBRGRxNnRLdlZhcE40S3ovaldxTDBCcksvMUZH?=
 =?utf-8?B?Qi9LRWY0b04xSFdEb1ltZWtpRmIvSTNYb2FHTjJvR1pQY25scTUzNWJ2S3Mw?=
 =?utf-8?B?ZlhBV0VWdnhiSlRiaTZMVjhyc3lCRVJ2Qk1RREJRK0ZWK0duOU9GbXFlNE0x?=
 =?utf-8?B?eU55U3hTWnlQRFVTQjZQOGp5K202NmpCbUoxMGthblNSTldhUldvbVJocVNV?=
 =?utf-8?Q?PrPiBTcUqJVZ89Cl3tIP4S8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da3a6fe-130a-49ea-4f3a-08dadde8a3c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 15:34:07.5449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zqZRP6cUkmgrvHB22Hpf56JdOM4n+VH5wJE79ssnG4Bk5cKQhwyOrzk8UAauVL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w0xxt7IHL3x14VQKGzhIkmxDrHndMBHPtOO5YhcQ0I=;
 b=LdHYxLNeUxXEigfB+NkLA4HgpLRGoMpyadfREdXbxOp9jOp3wWY/QxQQIpMLHZBl0amYJPNXKQKnofXRzvakLniOiRT4cbnZqKfGKWG69Tt/3Gscjz4zbj7x4pQBFGYWydkhdx8q+3wnS9fXaLdX2GHHISc+0PMXiGmB9AYrqN0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LdHYxLNe
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

For some reason, the CONFIG_MULTI_DTB_FIT option is not building properly with buildroot.  Could you look into it?

I get the following error on first build with CONFIG_MULTI_DTB_FIT enabled:
FATAL ERROR: Couldn't open "fit-dtb.blob": No such file or directory
./tools/mkimage: Can't open u-boot.itb.tmp: No such file or directory
Makefile:1429: recipe for target 'u-boot.itb' failed
make[1]: *** [u-boot.itb] Error 255

When the CONFIG_MULTI_DTB_FIT is not enabled, the CONFIG_DTB_RESELECT does not exist as an option.

I work around the issue in buildroot by overlaying the carrier board dtbo directly into the som dtb as you can see here:
https://git.busybox.net/buildroot/tree/board/zynqmp/kria/kv260/kv260.sh

Could you look into why the CONFIG_MULTI_DTB_FIT option fails to build with the buildroot compiler?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
