Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FFEC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 00:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A36976067F;
	Mon, 25 Mar 2024 00:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aoKuzPJqyfJ; Mon, 25 Mar 2024 00:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A106606F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A106606F3;
	Mon, 25 Mar 2024 00:12:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 811311BF48D
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 00:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A738606F3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 00:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1v5_VOQ8JHu for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 00:12:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=807d59e1a=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEE5B6067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEE5B6067F
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEE5B6067F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 00:12:48 +0000 (UTC)
X-CSE-ConnectionGUID: fF6tvFlBTUG+JfYVkcS8kA==
X-CSE-MsgGUID: a1Ei+OEIR5Ssxb3MfoJlvQ==
X-IronPort-AV: E=Sophos;i="6.07,152,1708358400"; d="scan'208";a="12602183"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2024 08:12:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXkIXEJkfik+/ZKqEotBlnyMtE8eIGfkKyxbYG+jEu2OCQnGYwZaef8bV7UehsBlmt2MKZvHqC1OmrOQniL9wSebsznkmv4oXzD4kL4wU6KsKdOPD6SaFnwbucZbkmaeIpCcylrwtgP6GML5pH8w7AHN6WYrzrr4J1IplEa5XaiEdpc+3A/XI8f7PwuiCjlxoo1U1mZ1BAaq6AKX78hSd47Hbll7nTNEUKQpqPvlVM/cQG+EEPvAtdzTqfrCfiE1ujQGL4hjsXAMBdyM8kdKB4lPQOj9PyjsuVtAmdfM+ZAlF63keLxFGuc6SjUVuZPLoGM+q6qwjY4CR4l+KFkmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGludsTWcoPSLA0k5ruWeWFQ9cpj+OlzWZZyfjqdWus=;
 b=OYF7T/P1n6nZuq2n8++yTf12W6ZTh9MUjcIQKHvH0ROuCGgrFm0V0CUfHE5J7Y20PmLRHEUO63FwDgGVdX0uT7Ikl4yBTsPMKyVn+bz597byH616HPq540hXV/ocpnuQL3/HTUeqG78AXtr5v+uft4XXSPlbmhyLtFMUPPtIBzSKhleSCMn9WJpJsJt7tOVLg0bAkRX9exWTfcVkmPEbpfuXcxY47zv9DGid72GwO0HurkDvFpRdl0CTmSjfKO050IUELSk8h++vNqtkljDNHOfT7/DXR7487AHDwlrMpBdb71hiy5ltCFYU/CZUFzyAP3uf3GTJZ0ruIFGVjBbTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by MN2PR04MB6415.namprd04.prod.outlook.com (2603:10b6:208:1a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 00:12:45 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 00:12:45 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/spdm-utils: new package
Thread-Index: AQHadlghDrHHF7buD0yx3we6Y1LJ/rFHpaAA
Date: Mon, 25 Mar 2024 00:12:45 +0000
Message-ID: <3def495af659768fe80ab145589c2864a9604dd6.camel@wdc.com>
References: <20240314213913.535911-2-wilfred.mallawa@wdc.com>
In-Reply-To: <20240314213913.535911-2-wilfred.mallawa@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|MN2PR04MB6415:EE_
x-ms-office365-filtering-correlation-id: fa7127d1-b07d-4dc8-0b5b-08dc4c604c0d
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3tL+tZveBKlRlKjNWcQ3zDwBe+DNSuxUJSSqvKlb/fzh7Y3VdivUx5Vfm56ZzLiPjVcSMOnFJYzXDad2Px22ewCPxARa2XP/1odnACoROp+oAOIFoG+uccN7lTs4JFuSfxImdGMhBFjsE6kJ0pDnT3CyypaGzRdbq7tgcR52SHsH4AVMMPxXminpCe3VCTK6XzTv74DiU8435ZCkuoj3IgMXEBmLubCbPVBWtROLrSCRf+DYJh2HUINOiFaSRwRhZK2JSkW8pUKdcT/eW3enOj8pomvi7/NACoN+uGAjUeLbGsQe6hCSP0GXkVCVlwCkpt/+ap0GX/eDqSdkV77s4Wr5/MPfipcMnLq8qf4LmV0knptsOwBNR1dFD3nuYk53yTDMCOK0kYuhYnSS2FjMDIB2curRbbRJPhClaj0WujJzc0fYi9XQsHkc8jB3PqnNDdgtsJKlNepeftTMNwvaGmDuJ2evlC+dNORMJhlUyA2qQNKLraBNzti0MkcXaexS2S/tWrRrKmcV3xsdkafSb+5ovCeijJhjcle4G8hTewAVXQ7lxNhgVnmLfhXdUIP1OB4YQ5ihr9GUTjVywacb0XPiTD5GGNxHtalzEegAoS+bvX6/yst4VVwnc1rpgksakReBdhbvnuAJQLwvuO5xb9D2zyi9KSlm79Ad38vh5Lc5CiA4pYHxrhkH2zQ02993pMxE7S0C/qXwKJbt+OIq30hVBS5VMOfhE38GfLWawZA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0oyb1dZeGh4OTVyWmNlcXlGL3pITU45WmhTV1gvQXBQcFdKMVFTejJ4VWN5?=
 =?utf-8?B?QmVFUjRPWEltdTJreFZ3Y3d2dDdMaVNLNmk2RzFqb0lWREp3UVVDZkV3TTAv?=
 =?utf-8?B?Q0Y5TUp6NEpvZENBZ3BoZ3hQRkF6Y1J4OWRnM3F2MG5ydnc2V0RpQWFwMU5s?=
 =?utf-8?B?VVRXT3V0bmVOamdUb1JkcWhGNDhGQUVSbnMxVGEvTFlLOVloQmRVdGlmbFdz?=
 =?utf-8?B?S0owd3FrNXdFSkdQZitERHlGbEZPWEM2TXhMaWVhZThlV0VnWGZqMWRBdE1E?=
 =?utf-8?B?Z05oSFd0dXFwRnVmRE9jZUphdzZzWmVCbGFwaC9SLzhHd2Q5LzNQaDMvQkxp?=
 =?utf-8?B?aTJKTEhTSnNoRUdsL2thSThMblVSYjVLSDlTVUdTTUg4MHZTaThYL293ajRx?=
 =?utf-8?B?RFdiRUgzd1VKUklpZ0V3c2FtY2J6QW5zUmphSldUTkpteG1KNklkQ2FCaElh?=
 =?utf-8?B?R2RoaG9lb0VhV1dBSTR6QUZhK1pHbUs1czErckRTOUxYa24xU1JjVXFMUzhV?=
 =?utf-8?B?V3IzcWlsNzR6d1hqUDNjbXFrZEV3WkJ0MVMxZ2d1MGhPWGNET0NybzVkbzlu?=
 =?utf-8?B?NjZwTmJvNnIxYUMwYXVDeHNoR29lcFNBQXI4YzVMNVgxK1pUL3AreHRhWmsx?=
 =?utf-8?B?TXpxT2pCVjVFdGhtK3ZRYXd2bFFhSC9mT1c3Vy9VVndCRGpXL3B6VHhvS2F6?=
 =?utf-8?B?Smd1elp4U2FDTjhvdXhyNkVGa1ZLS3I3L05FNGZ3bmpPNGt5eXdaMUJrakFi?=
 =?utf-8?B?VXlibkJLdGtIT0hPeVBGem5NdmdOV3FPVTVOZy8vcUJHUHduZ21xY1ZMU0Mw?=
 =?utf-8?B?K3AyNXR1TElRdy9wMlV6QmhwNW9rNG5NcUtwYnRkS0JHN0NyL3JBcEJxQ0Jq?=
 =?utf-8?B?Y3FNN0Zzend4SndBbVE0MDEzY2hQZTJpTUhURk5ObkFpWXRlOERtMTlBeHZp?=
 =?utf-8?B?WlByMlNqSjY2eERLUDQ1NXNmOFMwT3Vxb2RVanJQanVVbExPcjdlSXEvN3Vq?=
 =?utf-8?B?Y3BEOS95clhMd25pbDhlSTlXTE9CclA4S1ZpSGNOM0loTjdYcEdGMWVrOThz?=
 =?utf-8?B?dWhYVk1WSU1aSEFnSkxDdVNWZnpLdFd2MUU3MGpzRmJCWFZqb2RkMFZNTHZa?=
 =?utf-8?B?T0MvaUMyRGRIb2YwUHh6dnJwT2lEVnhYc291Qm9tQ3ZZb3hqaG45TGw5YUky?=
 =?utf-8?B?U1lTb3hsQkRyZXc4aW1GOVpqUWMyb0F0ZmxuNVJ6TTM5UFo4N0pSMUU1Qmtt?=
 =?utf-8?B?ZFZzOHlJWllkL3VIdjNka2ovbzFHQWlOR05LME9aR3B0eTdEdGRabVhFUXBL?=
 =?utf-8?B?U2tuaG5WbXVHQUpPVHprdU5WeWlLWGZUOHhVVGNpbW1MdTNGUGQ2SkRyUEl2?=
 =?utf-8?B?U0htU01JTUZPUGsrVkJCR0VqTGRMRG8yYnJKSG5weXpoNUtIZTg1WERvdjQy?=
 =?utf-8?B?ZDBvVnB0KzJjczZEbWZZNE1wam82V2J2QW1jRThsQlROMzIyVU8vbnVqQUlH?=
 =?utf-8?B?dWlpSWRlQnZOeTVJM1pEVUNKUXFJZGthTDN0S0dnK0ZuT2MwZllaNzh0c1Jt?=
 =?utf-8?B?MmUrcFF6VGd5SGpzRUliZVZtdFRRK0VPNVpCSnRXS3g0Q1liczc2bzd6MDNv?=
 =?utf-8?B?TXROV1FXR0JYbE8rQnUvcTVKRmV6TjQ0Ni8vdWVKU3pNeTJ4OGdET29aaU1m?=
 =?utf-8?B?RktjR1J6SUhkZnZhUGlPNWh1aVliM2gwWVY5dEtidWFhWEhvbnFlY1p5VDlJ?=
 =?utf-8?B?QkZ6U2o0YlJpZCtTU2YzQXcxVjJScDJmaHhGeXVaaUp5RUVsREZDeUZYREdM?=
 =?utf-8?B?T0o4d2pNT3FFblU3aGlBYy8wVjBFZ2piaDFjUW5RL0lmVU5qWmZNZVVaVFBQ?=
 =?utf-8?B?YVYzaHBUZDNqczJJTU1Lc1pjU0Q5bXlSZXFhV004QXhzNXV4bE5xZGhlRFJR?=
 =?utf-8?B?MHB2L3V1Z25pbi8rZTdmZE94TGF3WnNGK2lwUjBXcVJ5SHJVSTAyYmRXUFNs?=
 =?utf-8?B?M25oQ2lNL3VBb01TeFd2UlUrK21SNEdQam1oWnpSaWllTnp4QkFBREdDYzRR?=
 =?utf-8?B?TGgwUU9sTWdkdncvY216Z3ArOGpXTUxtMVlvNmhlKzBNbEVMUVppemNTcDFI?=
 =?utf-8?B?RUZyZWlHZU9CbFdLVEZWL2kzT0krbVVHZHRhaFJjazIrTmdScXNkS1doaHYx?=
 =?utf-8?B?ZWc9PQ==?=
Content-ID: <44AC2FF2B6E4AA44962F58E8531D3ACB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GawVeQEBJ6gP71P+8lKlCZaHfrVtkC3Z51LPpv3Ze2KXYaxIWzbz7M8RMdZrIVerr+aC/IF5g+aOsHdnM4wMqt87APMZ9l4OPZYEZAU010Ow/WSr3cGUO70RYrkIj0SDWTXy5OyMKGqgRaW01WwyWXenyIG42aryAKP22tmqeF40kPpFuYVzUbzhDUDsb3D9bj4jPiCkeGjv7czdYTNpaj/qwCSt+5NMZ6OEzQrFvV4Nm2wTfgybt1bZuM2GP/KjuVEBDOEa+e09xpoC83L1qKo4b1cM8v3pjgq1d9YflRmcBW9GlGTculAUSrtZIXvroIfPdCSxIUw0KlMbav9D0GTC29mq6Pu1BqvCGhPAzVM3c0BSI8r9vVx4Ip1zOYLcJg909kECy/MjP3nKyh58fESxm4hBgOfm9UxcbJQ5nkMbA4TWcb+icdqSbSvOjQzv1VtJlpwrRJTz7fZgfiPdQUsW6rLCX3EzBlJdS1LqG9FdS1bpWiwaPAuBJTGbFcATc4frE7q89pR8uvVtkxIVgfXir10mugmxtJvYbREe4UWvMIoZrIA4SUaT7niZRQO0jGwAQ4K/tkmEZDvE9i4pRB4a0+/+MjFRUc+opGYQgO0NHFSQTpzvy5CLaJos0Ere
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7127d1-b07d-4dc8-0b5b-08dc4c604c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 00:12:45.5899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsA9cHg/dPjqvCIB9POz9BJD/Z/yRaerdpzS8VUHZR77wcOkE5CoFFNKPJLhG1QztalnrUznPmjhNaN6jlb3Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6415
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1711325568; x=1742861568;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=hGludsTWcoPSLA0k5ruWeWFQ9cpj+OlzWZZyfjqdWus=;
 b=KO2kzWJN2zTuqR63toUiBd0xqYovYKo2Gd8e8OWO22+Pr1ePIQghofzv
 etXvngNtLbBcDh8NHS2DsqWZC3QKlB/j5Kd7T2UseMyt7lRiT79s+5VRD
 83w7nZ5Sa39vU5CoTbBYaaiSgTpRk7KzHsui8xsl3mYwahKtYtYD0D4Qd
 JrqyEfmUcBCBcMMl0Svi7hHq1Etd2ri963nFG+atFC/Yhf4ZwBMeHLKkO
 BEonEsgIFgHqS6OBgsud+w2Quykw3/3sjXnnoClXW72squ7BtmwVJC05E
 FrSYgYzukeXOly7tFQp9HFrTKHhTqIL7eGDEftuDk0A/C1CGPQ7+l0/u0
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGludsTWcoPSLA0k5ruWeWFQ9cpj+OlzWZZyfjqdWus=;
 b=lcuZllh4x+kn/6031dsbyJWkI5zI9CvEuTmcaSMKU3A//CPr1086CiimtIyXcM26TMl6LmPZoEm4PnVgFWFyEdsv3PUf4sE7XoDFC2imZzI71uEyOrH5OYi7GSgtjgCE97sN9jBHu4QgtAZuR/IfMPOWZSI2Y/l+KRYGeDjA31s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=KO2kzWJN; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=lcuZllh4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2VudGxlIHBpbmcgb24gdGhpcyEgOikNCg0KT24gRnJpLCAyMDI0LTAzLTE1IGF0IDA3OjM5ICsx
MDAwLCBXaWxmcmVkIE1hbGxhd2EgdmlhIGJ1aWxkcm9vdCB3cm90ZToNCj4gU2lnbmVkLW9mZi1i
eTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiAtLS0N
Cj4gwqBwYWNrYWdlL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEgKw0KPiDCoHBhY2thZ2Uvc3BkbS11dGlscy9Db25maWcuaW7CoMKgwqDCoMKgwqAgfCAy
MCArKysrKysrKysrKysrKw0KPiDCoHBhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLmhhc2gg
fMKgIDIgKysNCj4gwqBwYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5ta8KgwqAgfCA0Mw0K
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDY2
IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zcGRtLXV0aWxz
L0NvbmZpZy5pbg0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NwZG0tdXRpbHMvc3Bk
bS11dGlscy5oYXNoDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3BkbS11dGlscy9z
cGRtLXV0aWxzLm1rDQo+IA0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNr
YWdlL0NvbmZpZy5pbg0KPiBpbmRleCBjNjc3YzNmZjRhLi4xYTMxZDQwYTBjIDEwMDY0NA0KPiAt
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbg0KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbg0KPiBAQCAt
MjY5Nyw2ICsyNjk3LDcgQEAgY29tbWVudCAiVXRpbGl0aWVzIg0KPiDCoAlzb3VyY2UgInBhY2th
Z2Uvc2NyZWVuL0NvbmZpZy5pbiINCj4gwqAJc291cmNlICJwYWNrYWdlL3NjcmVlbmZldGNoL0Nv
bmZpZy5pbiINCj4gwqAJc291cmNlICJwYWNrYWdlL3NleHBlY3QvQ29uZmlnLmluIg0KPiArCXNv
dXJjZSAicGFja2FnZS9zcGRtLXV0aWxzL0NvbmZpZy5pbiINCj4gwqAJc291cmNlICJwYWNrYWdl
L3N1ZG8vQ29uZmlnLmluIg0KPiDCoAlzb3VyY2UgInBhY2thZ2UvdGVybWlub2xvZ3kvQ29uZmln
LmluIg0KPiDCoAlzb3VyY2UgInBhY2thZ2UvdGltZS9Db25maWcuaW4iDQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3NwZG0tdXRpbHMvQ29uZmlnLmluIGIvcGFja2FnZS9zcGRtLQ0KPiB1dGlscy9D
b25maWcuaW4NCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uOTdk
YmM1MWM2ZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3BhY2thZ2Uvc3BkbS11dGlscy9Db25m
aWcuaW4NCj4gQEAgLTAsMCArMSwyMCBAQA0KPiArY29uZmlnIEJSMl9QQUNLQUdFX1NQRE1fVVRJ
TFMNCj4gKwlib29sICJzcGRtLXV0aWxzIg0KPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUw0KPiArCWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hB
UiAjIGV1ZGV2DQo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTDQo+ICsJZGVwZW5kcyBv
biBCUjJfVVNFX01NVSAjIGV1ZGV2DQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMN
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTA0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9Q
Q0lVVElMUw0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9FVURFVg0KPiArCXNlbGVjdCBCUjJfUEFD
S0FHRV9QWVRIT04zDQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlNQRE0NCj4gKwloZWxwDQo+
ICsJwqAgU1BETS1VdGlscyBpcyBhIExpbnV4IGFwcGxpY2F0aW9uIGRlc2lnbmVkIHRvIHN1cHBv
cnQsDQo+ICsJwqAgdGVzdCBhbmQgZGV2ZWxvcCBTUERNIHJlcXVlc3RlcnMgYW5kIHJlc3BvbmRl
cnMuDQo+ICsJwqAgU1BETS1VdGlscyB1c2VzIGxpYnNwZG0gYXMgdGhlIGJhY2tlbmQgdG8gcGVy
Zm9ybSBTUERNDQo+ICsJwqAgY29tbXVuaWNhdGlvbi4gU1BETS1VdGlscyBjdXJyZW50bHkgc3Vw
cG9ydHMgdGhlDQo+ICsJwqAgUENJZSBEYXRhIE9iamVjdCBFeGNoYW5nZSAoRE9FKSBDYXBhYmls
aXR5Lg0KPiArDQo+ICsJwqAgaHR0cHM6Ly9naXRodWIuY29tL3dlc3Rlcm5kaWdpdGFsY29ycG9y
YXRpb24vc3BkbS11dGlscw0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0t
dXRpbHMuaGFzaCBiL3BhY2thZ2Uvc3BkbS0NCj4gdXRpbHMvc3BkbS11dGlscy5oYXNoDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmFhYTI0MzMxNWUNCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9wYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5oYXNoDQo+
IEBAIC0wLDAgKzEsMiBAQA0KPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQNCj4gK3NoYTI1NsKgDQo+
IDNmMDZmMDg3MjIwYjEyNjI2MmEyYmVjZjY4YzllMDZhNTlkOGQ2MTM4MTZmODJhMTY4YzgxMDkz
ZGUwODdkMWHCoA0KPiBzcGRtLXV0aWxzLTAuMy4wLnRhci5neg0KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMubWsgYi9wYWNrYWdlL3NwZG0tDQo+IHV0aWxzL3Nw
ZG0tdXRpbHMubWsNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4u
NTEyOTYzNWIwNg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3BhY2thZ2Uvc3BkbS11dGlscy9z
cGRtLXV0aWxzLm1rDQo+IEBAIC0wLDAgKzEsNDMgQEANCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICMjIyMj
IyMjIyMjIw0KPiArIw0KPiArIyBzcGRtLXV0aWxzDQo+ICsjDQo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAj
IyMjIyMjIyMjIyMNCj4gKw0KPiArU1BETV9VVElMU19WRVJTSU9OID0gMC4zLjANCj4gK1NQRE1f
VVRJTFNfU0lURSA9ICQoY2FsbCBnaXRodWIsd2VzdGVybmRpZ2l0YWxjb3Jwb3JhdGlvbixzcGRt
LQ0KPiB1dGlscyx2JChTUERNX1VUSUxTX1ZFUlNJT04pKQ0KPiArU1BETV9VVElMU19MSUNFTlNF
ID0gQXBhY2hlLTIuMCBvciBNSVQNCj4gK1NQRE1fVVRJTFNfUE9TVF9QQVRDSF9IT09LUyArPSBT
UERNX1VUSUxTX0ZFVENIX0NSQVRFUw0KPiArU1BETV9VVElMU19QT1NUX0lOU1RBTExfVEFSR0VU
X0hPT0tTICs9IFNQRE1fVVRJTFNfSU5TVEFMTF9DRVJUUw0KPiArU1BETV9VVElMU19ERVBFTkRF
TkNJRVMgKz0gcGNpdXRpbHMgbGlic3BkbSBvcGVuc3NsDQo+ICsNCj4gKyMgV2Ugd2FudCB0byBy
dW4gdGhlIGNhcmdvLXBvc3QtcHJvY2VzcyBzY3JpcHQgd2hpY2ggaXMNCj4gKyMgbWFudWFsbHkg
cnVuIGluIGRsLXdyYXBwZXIgYWZ0ZXIgZG93bmxvYWRpbmcgdGhlIHRhcmJhbGwuDQo+ICsjIFRo
aXMgd2lsbCByZS12ZW5kb3IgaW4gdGhlIGNyYXRlcywgd2hpY2ggbmVlZHMgdG8gYmUgZG9uZQ0K
PiArIyBhZnRlciB3ZSBwYXRjaCBpbiBvdXIgZXh0cmEgZGVwZW5kZW5jaWVzLg0KPiArZGVmaW5l
IFNQRE1fVVRJTFNfRkVUQ0hfQ1JBVEVTDQo+ICsJY2QgJChTUERNX1VUSUxTX1NSQ0RJUikgJiYg
XA0KPiArCWNhcmdvIHZlbmRvciBcDQo+ICsJwqDCoMKgIC0tbWFuaWZlc3QtcGF0aCBDYXJnby50
b21sIFwNCj4gKwkJLS1sb2NrZWQgVkVORE9SDQo+ICtlbmRlZg0KPiArDQo+ICtkZWZpbmUgU1BE
TV9VVElMU19JTlNUQUxMX0NFUlRTDQo+ICsJJChJTlNUQUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VU
X0RJUikvcm9vdC9jZXJ0cw0KPiArCWNwIC1yICQoQEQpL2NlcnRzL2dlbmVyYXRlX2NlcnRzLnNo
DQo+ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy8NCj4gKwljcCAtciAkKEBEKS9jZXJ0cy9vcGVu
c3NsLmNuZiAkKFRBUkdFVF9ESVIpL3Jvb3QvY2VydHMvDQo+ICsJY3AgLXIgJChARCkvY2VydHMv
c2V0dXBfY2VydHMuc2ggJChUQVJHRVRfRElSKS9yb290L2NlcnRzLw0KPiArDQo+ICsJJChJTlNU
QUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy9zbG90MA0KPiArCWNwICQo
QEQpL2NlcnRzL3Nsb3QwL2ltbXV0YWJsZS5kZXINCj4gJChUQVJHRVRfRElSKS9yb290L2NlcnRz
L3Nsb3QwDQo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvZGV2aWNlLmNlcnQuZGVyDQo+ICQoVEFS
R0VUX0RJUikvcm9vdC9jZXJ0cy9zbG90MA0KPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2Rldmlj
ZS5kZXINCj4gJChUQVJHRVRfRElSKS9yb290L2NlcnRzL3Nsb3QwDQo+ICsJY3AgJChARCkvY2Vy
dHMvc2xvdDAvZGV2aWNlLmtleQ0KPiAkKFRBUkdFVF9ESVIpL3Jvb3QvY2VydHMvc2xvdDANCj4g
KwljcCAkKEBEKS9jZXJ0cy9zbG90MC9wYXJhbS5wZW0NCj4gJChUQVJHRVRfRElSKS9yb290L2Nl
cnRzL3Nsb3QwDQo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvYnVuZGxlX3Jlc3BvbmRlci5jZXJ0
Y2hhaW4uZGVyDQo+ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy9zbG90MA0KPiArDQo+ICsJJChJ
TlNUQUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvcm9vdC9tYW5pZmVzdA0KPiArCWNwICQo
QEQpL21hbmlmZXN0L21hbmlmZXN0Lm91dC5jYm9yDQo+ICQoVEFSR0VUX0RJUikvcm9vdC9tYW5p
ZmVzdA0KPiArZW5kZWYNCj4gKw0KPiArJChldmFsICQoY2FyZ28tcGFja2FnZSkpDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
