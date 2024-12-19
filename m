Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B95E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 10:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E091661399;
	Thu, 19 Dec 2024 10:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6II6IcAabvo; Thu, 19 Dec 2024 10:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2C4613B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2C4613B3;
	Thu, 19 Dec 2024 10:30:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E12CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 10:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0DA1404CF
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 10:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USd8oWLSnh5I for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 10:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::603;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 675274012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675274012F
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::603])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 675274012F
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 10:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnHQ4wckK5XX4mSvfU8T9LhKXtVFWjQSJwivaZtl6AifZCLwg1b0qyjFOCHMTYpyT5ps9hy3G6/MYFXlKq3rhooHbEtrVblntQKVZ1qKr12o3a4rkYgF2DVKyPHh7IroAn471kkUsQIyVs+excpXSLEkctBatLu3OOf0d0pNpAua86vkE3MQrODFB2dyzqjeBERQoLME0Y/IASpX/VgfwER9PELzSZiTyMURUagh/wxZhFy46T9sgP+P7/lr36Ge254tkxWNHc9BCThRfQI/dUne90ock6IRiyu5mlTPlf0/zEWhJMns+f1+Y1hcAQ5IVBOGCVC8fPyC7kQQXovdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1mav5FylmLwwtlAypFvit524eOKlnJNLKZXjfZ+wbQ=;
 b=mQVKtTWLFiuSqmz6nEIn26L5T38kMp3Z2tgwIyd+jUtA2FadlvWE9J8Bu4ZzG8cfk9584j+3sP+WEf8i1o4nXDI0INGfM9P+9EGKLxfFHCtp1uN9K3wuvGTSDpe/qNqOK+KZx7vnWe0ooMoO+OFIstHi6ARXA5LccnAyn9lndIohFEMqYJYzoQpaOcAKgOZY1Mps1X6jTGmhwwyJfQGqy8Rdeh0Gwdf4c36FsR99ycNNKoFt7FcbXvu5YfNB+PI+1j+eYwOBQC6znUlZdPs4b5WDDDOzFJVG4fD4jegQxU8LOgbDNvH6DyxVW62WYJB412OL5ialOCEf2Gg6MYZAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM3PR12MB9327.namprd12.prod.outlook.com (2603:10b6:0:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:30:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 10:30:10 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 2/2] boot/uboot: add qspi.bin file support
Thread-Index: AQHbURl1Wc/g90dfEU6WgDAfGix1ELLtWUGAgAADmMA=
Date: Thu, 19 Dec 2024 10:30:09 +0000
Message-ID: <CH2PR12MB5004A6A41AFB5D27366A93F6F0062@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241218065239.503162-1-neal.frager@amd.com>
 <20241218065239.503162-2-neal.frager@amd.com> <20241219110653.37083055@booty>
In-Reply-To: <20241219110653.37083055@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM3PR12MB9327:EE_
x-ms-office365-filtering-correlation-id: b2e366c0-2c53-4977-0af3-08dd20181d5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?u4jkhLgdNq1qTWuINx9Rcl8hh5jCDXpNZwGOGAjnkCM7wZ89RmF8ChMmIrwc?=
 =?us-ascii?Q?L0gKaxwMsagxqn4CioaEhzvwCpmAD1WsosoGBeu4j/ObR0pzPd/ZPlu1KKWw?=
 =?us-ascii?Q?XUlWhLWoRNpbxfP5rr6UPZlOo+JLUiguVxkjSkBNcmLptLxfNyW+eZmywvBb?=
 =?us-ascii?Q?kWQVf+HZe/hNJni3g4WLcY8W5oqUA6XPZ7G4Ts59rf7351qdKTRPle/UeSQR?=
 =?us-ascii?Q?3mXbFAu1WGf5cVR8R/bfIQxMUMVOEm+/YC3ExC4LLFJVvhOTIJDfICRfbS2H?=
 =?us-ascii?Q?5smAOn1KHWMzIm6akWhFwqrkwZCo6L0/zhbosenjr+pHVWpbX/C6sp+iTS+j?=
 =?us-ascii?Q?+aou2xVMt+WJ2ooJimcg01vVO0FSoRNxgsQMWUwV391mlygYYt2ZjeC8KkZ3?=
 =?us-ascii?Q?pDJ480wgknTdBIikSFdDTKggFzi5GYGLYo12P3/GIqbwn4Aq6cEhnl1lOhTC?=
 =?us-ascii?Q?b86CAsnnSIdWBPMYcLPmbyyNs9+Jafyp5NSi/UXVgIwlI2+2dSwUStDZxDor?=
 =?us-ascii?Q?qIfAw0rweFFjvyg6MKpDFRw8b13h4wfvkn1ct0XFv5rT95Y8b7pUBuU5IFL7?=
 =?us-ascii?Q?dZlTYVZcOTJW6h/5G5ClO5Fz/2lMmbbCWUeZhWwBx6cd3Uj/e8Ts4w0QfFph?=
 =?us-ascii?Q?q+g4V4wYBVeGqijECEobH2Wx6lLnzk/krFjITkZeQr21VTWGmqBcU0fW3IdA?=
 =?us-ascii?Q?rRO/BYnMeO+4j29u3zxEAWaBPEqbg+EMRys5vLpoAFfeofVYHk9/4ERtaAKn?=
 =?us-ascii?Q?nCR74nLmgtv88ojxvewxZ5OlzOhjcOCMF6olNa/VECptdeOycyroqQ1qZmG/?=
 =?us-ascii?Q?unATnj9jji5etP8TaWpgTkPcz2okjHQSdjs6tBEJFzFqQViBrPjAttE35h9+?=
 =?us-ascii?Q?6RWalaewsIqzvWOt23yAC38tXr9ePfWVNeHZ+CXVIT4aG1Y2WKgzTeAqHr1s?=
 =?us-ascii?Q?2WUk53nanwe6ft+wpCDCPCzN20Y5aNPUNAkWbmZUk3zFYReAgcfDTWre4zIR?=
 =?us-ascii?Q?Lfby+f7/g0q1bgmuahAy3ypp0oxHvyZxsbwo9NI1xLWuGvvIYSF8X8H44z1s?=
 =?us-ascii?Q?HPnUBB4i0Hjl1FXTbDN5jZ9kBSt9e01v0+UbO47zWFN0SlMTDGoz81k4DbCc?=
 =?us-ascii?Q?8qOlvrk5ixODUoGlF3uUU+43ENAo03ARHsryYucIgFM7tENFPXJalpE2XZny?=
 =?us-ascii?Q?Nh6XQAiqZx7RqflpYZpPfS/l7TDxzlBcxvI7jyIygVjfS7ZpST4KDgdqWj7W?=
 =?us-ascii?Q?h8bcA07iZeyOC+ji/SqmkZcV0SgpApxL5j3EJmSwpk29GLrIM2HkllknNIvi?=
 =?us-ascii?Q?v1hnrA1Qo311BZdZvn3IWSEQRvrd/LXI35j+jqSzlxD7+AXQsCnfRdmfnny9?=
 =?us-ascii?Q?zmc06ItxD5tQj6XO/xRJVJkrECpTayCHV1GiE+J+fGHOM/5LWEpAFXlvLEtL?=
 =?us-ascii?Q?dB5syM+qgjlls9bx+i0DUinwTCI7uZSDtcK6DsS4VS12GklBHKJBZ1VXn8VK?=
 =?us-ascii?Q?GWCY24yqw4ZGm/4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?obJHStFkP1XxruLd2Alm9+weo194k7/yJHif9MtQ4nEF+kdtBmAiPCh1BLcS?=
 =?us-ascii?Q?ohut8VR5bRmWBHMaGVxkVc9610vTS0pba+AEwZO0IJ3gIopNH14Jm01EIwbg?=
 =?us-ascii?Q?b5A5HbGZrLYV+hfp5l87O1s8AbpLbyh+iL483gP6Rlwm3ohGuLsRQSfQy12j?=
 =?us-ascii?Q?D8Y+K3c8QxakagqY7tVNbgn6AYsFKLbPZtxBTkyCPU6JgzhvHplVKaSqA3fb?=
 =?us-ascii?Q?gOvZGekZGhiI1bxvqnPmeIzhDaEOkNzSskNWSOuJqferAWFJJ/Kx9/OkYy2o?=
 =?us-ascii?Q?CWfpxA/bQJb+IMUApWxU9dpOYJTDkWsOsIuMDXjn4B5KalT6eyWg+1ZNbYEu?=
 =?us-ascii?Q?YdryWYSaUx2iKF+nUw7s7ulgp9+Yj9pjIOXzWVRhbq91bNaSakDp9zA/6r4/?=
 =?us-ascii?Q?rXIFu3LvKMn+NqnK0UmaWUtNL22zM1frQYTzBEBSmeocFeb4N3VDBtznWIgf?=
 =?us-ascii?Q?ZJzNFcu2h8bfXbLA2NOqvht7aGcUTJyiGnXJpJGz7G3zPzkO6+96KuLGd6YD?=
 =?us-ascii?Q?hdWB0CdauwVLP/1vlBdHRaW60Xik3xsmvt7e448zd0XYx+rOef9hm6YrJyyV?=
 =?us-ascii?Q?wewF5rwQ+05UFGDq5aKmZwHrKaLyjVQaymlERxd90hksgCKfGiF9vttX7xPm?=
 =?us-ascii?Q?7y2jNAvv+EZPPMKMb/Ar4NkGZcPsbPQVufv+pYbL01JRSLJkCNkHsO5+DQ+6?=
 =?us-ascii?Q?u55sfMQJMcjF4t4XNVFZGwKdM69PedKfDWnAl6VvNpYzYAmGIEJYhs24/hZt?=
 =?us-ascii?Q?UOoW4vi1BkNE/9k33348sBkFvi7cwN4Ys231MmMRX+FiOCh4OTnFJJ4l1VE+?=
 =?us-ascii?Q?cRtvAiqbrTnk+/m+w74tvBkD8TBmbA1gxaPftabUW+B0DyMWQszhbVaYey32?=
 =?us-ascii?Q?z7lxxRZjbM5J9XqsvYtU9jWKtq6qqSmLErtJ9bpH/J3BLSwkC3CY1HjC7Lmr?=
 =?us-ascii?Q?Ni+afIsjtYNQQ8LOcbchVK/9ZjBhWwvT+SMy89t17DLiKZ7uTqr4la7jtoiK?=
 =?us-ascii?Q?TgXqiHiPm3O6EyHjZzPzfGE/BLdMLNsMPjsCdAlnu2WS0rq9SjFcHiqMo2lK?=
 =?us-ascii?Q?8/rWiduVOKrpXWLrndo2UQK+YDrBAH+ksd++TZWX+1WUMlr2KbxrR1yJIf63?=
 =?us-ascii?Q?BlbH1RpQpp1l1X3dESBnvI7lDhFhRYhC6VTCCtBokwBoZApYBgTLyy59vyid?=
 =?us-ascii?Q?LCPqizEoe8BHGV6TnOMzjoPR7XumsFX7oqaWccPlgJST06tMDEgcX17R2wNh?=
 =?us-ascii?Q?+s88w2H/rso9DUo6zK3jv0+1QbALvYx2AmuTIDV4YoUh/415PTVjUFfBKdMj?=
 =?us-ascii?Q?134r2BPu3uWsrIL+HsENsSz3dV9oaRCoPgzncBsQrQbm+mHkULrteQKaEJuN?=
 =?us-ascii?Q?t2TJDd0dTX1KpBQeg+7WUgU0S52FF9oqJJhp5kGIJMwYnsRgetHC1qwjRh7G?=
 =?us-ascii?Q?sEI046WZ8/AKR6OiX9ZZHz2hGkPHv/qps1e5yqYvlnvgcL5Z7AW0IKJobVf4?=
 =?us-ascii?Q?RlVopL+1UlmQcMvazyTyBgiXUkVAVB/8ET0UHmYgrUAfNe2jFjlgU9u8WDB8?=
 =?us-ascii?Q?0aqTtpDqMjGdISh3EmE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e366c0-2c53-4977-0af3-08dd20181d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 10:30:10.0016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KUq4KUbu/yjktKR8Wu94+HyGc55zRDljmmpqbVcUa6NKEq/727SjkClIreo1qeM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9327
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1mav5FylmLwwtlAypFvit524eOKlnJNLKZXjfZ+wbQ=;
 b=xOF0dIHTXGjKJtS80FJNEJSD9rtiFdsGc4N3pHF3O+Wrj8mTQs1QzKnfGhEwwNUj/GCH6prCBVq1jfDIC9zScki7W+CEPfcgrbLEehjaIMUWaZQ9uGfZpBPqQanIAyRG2s/ZV683L255oA3cxCtlrCQrApHdI9r2hrqGbYUcYWU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xOF0dIHT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/2] boot/uboot: add qspi.bin file support
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> u-boot has introduced a new file called qspi.bin for users who boot from a
> qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
> single binary that can be written to the qspi flash.
> 
> Here is an example of how binman generates the qspi.bin:
> https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> 
> This patch adds the necessary support for buildroot to install this binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Do I understand correctly that this requires U-Boot support which is
> not currently available, at least not in U-Boot master nor in the
> version used by zynqmp_kria_kv260_defconfig?

> Otherwise, who is supposed to build qspi.bin?

Yes, you are correct that binman support has been committed after our
xilinx_v2024.2 release tag.  My idea with this patch is to already
prepare the support for using u-boot binman and the qspi.bin file.

My next step is to cherry pick the upstream patches for binman in
order to migrate the 6 zynqmp defconfigs to binman even before it is
included in the xilinx_v2025.1 release.

You are right that until I add these upstream patches, no one will
be able to actually use this qspi.bin option.  In any case, I believe
it is better to keep the option generic in case other platforms adopt it.


> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
>  endif
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI),y)
> +UBOOT_BINS += qspi.bin

> 'UBOOT_MAKE_TARGET += qspi.bin' shoudl be added here? This is assuming
> there is U-Boot support, see above.

When using binman, it generates the desired output files such as u-boot.itb
and qspi.bin.  In other words, there is no make rule for qspi.bin.  For this
reason, if we include 'UBOOT_MAKE_TARGET += qspi.bin', the build will fail
with the error "No make rule for qspi.bin".  See the first patch of this patch
set which is needed because there will no longer be a make rule for u-boot.itb
either.

Since the u-boot community is promoting binman over mkimage for new binary
generation, I do not expect there will ever be a make rule for generating
the qspi.bin.  But I can imagine that other suppliers may copy our idea and
generate a qspi.bin binary for their platforms, which is why I kept it
generic and not focused on zynqmp.  Even though only zynqmp will support the
qspi.bin in the beginning.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
