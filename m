Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD4C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 10:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DDE340D50;
	Tue, 13 May 2025 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dREL1SFiwmvW; Tue, 13 May 2025 10:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E5040D5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E5040D5C;
	Tue, 13 May 2025 10:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D9E12A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098B840BFF
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_v55jfTmvxt for <buildroot@buildroot.org>;
 Tue, 13 May 2025 10:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::615;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2563440A37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2563440A37
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::615])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2563440A37
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaLElqVWXfICtMKN6yBcx9+Hy/s7Y1qQKbkZXO2tC9HXqD+NJpR0CvCSbFqjPc9hUCjFPaFCkCCymlEvcRTg6iDRy/uree1c5UVJq3Hg6ClFB/tc5YnUc5WFAeauhxV2VtDDxu7wUS6DdPClxvVmGuBZsaxsWMJGVgtuz7Pk/Qm0TgVa3qIhiFAy+rRtJE4PTA7CGK/m+vV9wnGQaVQD0M/enJG8mBwU8XP2Pr6Eie4BYf62sV8w509Ew+AQh1zeW7xVuK10lswS5pziBDAdahVBsf8N3GeGpYL/z7mQWTEEjmCbAhCMzKOWJvz/t+VvN2wuaJe+JGK+ifOFh9HPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkltUwbwnlrcJcx9V5buAV/z9T/ap7YLI+iJG7HGwA=;
 b=CMMIoXiDmuQSkVkN9zNzn8qjMsVImpmoT6exRSbhRxDi5c5DOP8oSwg2SBiPzvNG5r9bkXCy3BkCI1OtviwP5qiqrKW9qleANrbiDe3kHS6SUjpOMF2tDFCLttpN8a2AzVpDe3K+GHwA4c3SHy4PjeTh44Pw/QkTKMFj/QpnYVMOUe1VLTqCbYuMSvp2nk5y1jDcmeDnG5wLE6OpXCPPw5yejEvN1PXPGkhKPoBM+0SSEh6GAocNBMS+F+5oCCYv2yU91x1dIpKCryZ6TJ/QiQPF3pGIVfitRl+LCIFY06bZ5mQZD6pJOFzGTa43XJZW/fXsd4UsGVSoXskw+RJQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 13 May 2025 10:32:42 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 10:32:42 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/3] boot/xilinx-prebuilt: add segmented config support
Thread-Index: AQHbqT8/+ze1kVb7xEe/hXcWtzZlWrPQkbHA
Date: Tue, 13 May 2025 10:32:42 +0000
Message-ID: <SA1PR12MB56159489D389FE1012747FBEF096A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409110455.3850790-1-neal.frager@amd.com>
In-Reply-To: <20250409110455.3850790-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b32884d4-aaf6-4b8b-8d25-cbdf66f34e6a;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-13T10:30:48Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS7PR12MB5814:EE_
x-ms-office365-filtering-correlation-id: 6e973945-1efb-4a89-da63-08dd92097e47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0qSgSsr2Pqt/8fOP7qUNdC26rnw47JoYB1VU3wOcUas4Mo7d+26rJq3q0mun?=
 =?us-ascii?Q?CCrrfjsUDtLlpELGwzEawhsOS2ffhEdVPEAodyQ9gs3uojImFIYEA96DcgdZ?=
 =?us-ascii?Q?24ssSEY0d00+waMse8R8kC5HW7+ECBpA4JuE0JVTAlNMSxyVFkvOZhhtMpJD?=
 =?us-ascii?Q?Ng23NWA5/JevMWvuPsXcru1PSkI5RiufaHfpWQMyORtGWHWWKJ+hiDGgo3Jo?=
 =?us-ascii?Q?8FW3n1v+bye37O9j0g4loW7DSt3mVmhx+0JDqe8oHB8cSwQo4pxMjlipMGsr?=
 =?us-ascii?Q?3j6EqPEYq/A0UL4V8yPPoI7E03ylDcrCQbbqXoeFMlnAbpboCg+/lfo6IXCE?=
 =?us-ascii?Q?Sgq5zdHW2V2Gm4f5h9U2+cK5eyhThO1FPzmKDq+rs+9eo+TG7igTJ5Xji9cj?=
 =?us-ascii?Q?fjvStNG3XmYYqH1K+0d2duHCtpD5VVadpnf+BKXdgPW9Eq8VKaqdD2F6mOdJ?=
 =?us-ascii?Q?He44pGdJtEciCvmT4+Ifw82KovyFmPGhDx1qWF0fXOGt7owVW4eHwof8Go3b?=
 =?us-ascii?Q?LJTxovAhqLRvVKmE+jz3jy65idQmaLuhnWN3Ch1uzFsiqwZVQMx3VgkD7E4h?=
 =?us-ascii?Q?/tI4qgbxzRMn2kI9GQZxqOUInB0ePePPD6p68UtwGwRwULFaXVbQDVMRkWRg?=
 =?us-ascii?Q?bn7BDLuIIG2QjwoafiM3tdZxQhuK/ijs0L6jjHHcM+1u8Gy+9yButHfH5egb?=
 =?us-ascii?Q?0rXC2Kou3ZXlYW6Jn+q04CLZIKeyFE+mxisO9FLStxlZJaDV4qRaHJ63mLy5?=
 =?us-ascii?Q?Ukl3PDKLV38LCrAy9qi1zdgxA8DQ/ErlJ3SNVJksHlmQ42HCYTM6esb53AkM?=
 =?us-ascii?Q?Kkk0mzQisQ2MoBMPtFQLu9dxnwmUGzBcHA/eYIgP8fWYcR2mzp6IgxXpArtg?=
 =?us-ascii?Q?vWXaL7WaB/Sk6iWzaD8TiBsg5ksf5xFpMDcDxbHXdTvLJMQTK45cE0uw6Evu?=
 =?us-ascii?Q?64i+L2ItKc2L7LYjdBU9pw5QMf8ZISgjslqsh/GqlCtzYcapRAeBfT/6IXP9?=
 =?us-ascii?Q?Yqa6yfCFXqAlVtu1UPFz6NT6jcMX/iDTvWWiQykmjFiPENeJauASnPbeFN64?=
 =?us-ascii?Q?g4wP4x/Yxuphr43APPxwitblqwlSksIvhduQu3YJA75jyiGxvCdiZVfaAedm?=
 =?us-ascii?Q?wX3pR7KwrjkaxAonxsvqMiJh504e/QTJfyojBKAaC/IVGvqRbTqguamHApgg?=
 =?us-ascii?Q?pqu/rMIT7Thr7zqAazFxC544XyNVFr67jKGbCMBf8705nD79GyYIg9gsf1wC?=
 =?us-ascii?Q?5q1IU7JFaccqTYdux59+BRgoZstgqLcz+xIkhR6bzlNZFILzk4r5Sw+MBKek?=
 =?us-ascii?Q?FQFYD6Yo8+bkO/rFOBPFvycyp+KiiHpXXPpO0yw8YapFIQkLDmJFQM0JzuUw?=
 =?us-ascii?Q?5GgnMh4eRPWPNbcm5QxcJ03eLsbkdveR4RSTKh3SCyDL4+C1BmwCebyXbykH?=
 =?us-ascii?Q?sRSEsLN0mC5FTSWX183obMLacj+19AbrfmbKH+rLnWleOigt0XsDkc07X9o5?=
 =?us-ascii?Q?Xbc2E3EAjAk/CWh1C03DgOAcFFq8e7xKIwF+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Pp1ANgRnqFnpYx4qgUK3SedMs3BVTq8320ZScnOV22L2NgDGSFJt5Y4/ElT?=
 =?us-ascii?Q?oUvun9ePxWNgiNBt2VfKf/y5E7/DdL8i9z00xLWGNdWqpZE2A4EhLfpqpJL6?=
 =?us-ascii?Q?rn3+2XS21CX953fuJWqoydawWxXbgqQl1wX/2AY++BMhl+4qfFMy/xXEapNI?=
 =?us-ascii?Q?vIfR4xYo/VWNhStHEzWOnVlrLxkaDSieanJurAwLtI7pDSOJeI+HaSTZT2SS?=
 =?us-ascii?Q?Gceeiy7HlH9RdcmfyhxYRHve9TfJ6gRCxUdeE6q64W/zSCazrhv86i5K8Yx3?=
 =?us-ascii?Q?BiGgq2zRQlIAtZGAOl3GbzXbPCmps71aIKWilwTSSuIdftm9GpeeIpFcai8k?=
 =?us-ascii?Q?kCyXvP9NOZnpRpjsCesUophV4Rdua6m0pKXzMTFyM8BnulACBa83M6nlX/Uc?=
 =?us-ascii?Q?Hgge+idkNdwySLDBacByRVlZTqNSj4s3RaPquvfF3utcLrsTzcjSksZAN26L?=
 =?us-ascii?Q?AGERm8IPZ9dRxs35a6sXsChIs2lxTX7TLndfjnHoblIx5hYQ8dTNuaaV9ZFv?=
 =?us-ascii?Q?Am7xHPQJFJzqAOenpgbyM/kAW4sKkyNQS96eW7UKSBcaN9gZYrYFX91ev/CA?=
 =?us-ascii?Q?GYQ7svHYk7UUw3vUw/gQ1mtRnTq2rIuhxYFjkSTM4TbJmS/CIdJVuqmJ3wGy?=
 =?us-ascii?Q?DmpHMsfP+J6phO2pvffT0rCv+WD7P/w2t0Fw6sZaBryoxEKCsIMjzX0NiEnc?=
 =?us-ascii?Q?IY3JNxffSTHZJO2zMuCV90KQNNJn8FZk1bgkoRB8Q0ZOrINo3AzxpWnCBDQX?=
 =?us-ascii?Q?pqZz67wqEI4lAHk/Zllp4B3hBomPUH87JQ4ntEfXjVDZ2N4uT4O0ocTlsp59?=
 =?us-ascii?Q?GfUvY1JCzzttEHOOl9rwVegIliMlj2CIvmMxcOhHe3og5YUb1JkbsxvcDoc+?=
 =?us-ascii?Q?m2gUoJF6X1AmbhMYPAv28MAFo+Xor2L4x/iktxEMUpuZZyt2VZPFsvOSkzkq?=
 =?us-ascii?Q?OdKbqxcicNsHdYXgWaYCN5B0zER1dPBa1xQvU6FzKNPUQQyFDtQaTqt+ri6j?=
 =?us-ascii?Q?5Lzzaubj6/HP52k9MLmh8zOsf7ocwNbMMk2s1Vkw5NDg4ytQMnmKCtycJ4gz?=
 =?us-ascii?Q?/X1sTkcIXfQY3HwBgrc5ictw/3xsDUfMQ2keR03OFxoxGW+7kElSX2hO73MZ?=
 =?us-ascii?Q?BltZNX2Rbh/aacD9BIng2y2XFC1cIp0X8m/7BTtXXBJVZ0jp1h4flx5wMSNT?=
 =?us-ascii?Q?hT7Hgh98d9SrTkdUJ5TGK89accRyJKfoDOzlzB3GzQuxEQ9RtvVSJvsFhKWv?=
 =?us-ascii?Q?BnXBj5qrf2x48KHHHdjiarK7KOWP+v4ZW8AJJ5JWL8yHaQfdb69GdRo3cEcL?=
 =?us-ascii?Q?ia3KcsoCCcjcw4S98+/yDfbg9849xwrIHT4qwlBc4iaAmDLGsN+MTmunNP/N?=
 =?us-ascii?Q?Cl5eGwIl2mrifPFpLUMC4P/E/Yt1iTr/RKkrh0xPwGn3s67ZGQInBVPKunJc?=
 =?us-ascii?Q?x4tvrmAMx/UxSVQwsZsTa3LsQK7EQORP3yr5fQucAAZAF/u5xyRom6L7uVyH?=
 =?us-ascii?Q?cYtQojgvuPNaICJ+OuKxrIm7uGiu8Uw7auKtV+yD+pR9q0tMyv4f9YLMbHur?=
 =?us-ascii?Q?jLV6UaDRYD55MYZW5bI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e973945-1efb-4a89-da63-08dd92097e47
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 10:32:42.7316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cezgAisUPyIFOv2LRPLQDSwdViH3uYFUaeXXosvrXLOQEvt6OJ6phixoKdYnDV4O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkltUwbwnlrcJcx9V5buAV/z9T/ap7YLI+iJG7HGwA=;
 b=iyrr1aQpC4x80JEjdH+2ARwuODCf44f6Of0WPYerP6YA06Wj8QrGkUDXF9CEAIZd3L6X071AvWjwkfdE7Gl2q0kNmgB7pu4L+nPgAo7fLLWKCXKfrm9Svo8/S89SeAZ8gfVWA+0vFu4XeW+U++paS1KXFUh/ADmksv2aB2TlS+c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iyrr1aQp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/3] boot/xilinx-prebuilt: add segmented
 config support
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Caccamo,
 Fabio" <fabio.caccamo@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>, "arnout@mind.be" <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

Just a friendly reminder for this patch set...

> AMD has created a new segmented configuration for Versal products.  It splits
> the Vivado hardware design into two PDI files, one containing the minimal
> required configuration for the DDR and booting the processors, and a second PDI
> file which contains the rest of the FPGA design and can be loaded at run-time
> via U-boot or Linux.

> The file names generated when using the Vivado Segmented Configuration are as
> follows:

> <design>_boot.pdi - Minimal DDR and PS config for booting
> <design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

> Since two PDI files will be included in the XSA file when using Segmented
> Configuration, the xilinx-prebuilt package needs to be updated to support
> this feature.

> For Buildroot purposes, the <design>_boot.pdi is the file that needs to be
> included in the boot.bin for booting the processors, so this patch checks
> for a file named *boot*.pdi which will indicate that Segmented Configuration
> is being used and will make sure to use the <design>_boot.pdi file and not
> the <design>_pld.pdi file when generating the boot.bin image.

> If no pdi files contain the word "boot" in the filename, it can be assumed
> that Segmented Configuration is not being used, so the single file *.pdi
> method is the appropriate one for this case, and this patch is thus
> backwards compatible with prior designs not using Segmented Configuration.

>Also, Segmented Configuration is going to become the default mode for Versal
> products, so the xilinx-prebuilt github location will also soon have two PDI
> files for each board.  For this reason, this patch is also handling Segmented
> Configuration for files downloaded from the xilinx-prebuilt repo.

> For further information about the AMD Segmented Configuration, please see the
> github tutorial below.

> https://github.com/Xilinx/Vivado-Design-Tutorials/tree/2024.2/Versal/Boot_and_Config/Segmented_Configuration

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
