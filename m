Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ED8CD98EE
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CAE60E32;
	Wed, 17 Jun 2026 05:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpQEh_rYtKxW; Wed, 17 Jun 2026 05:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F8760A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781673842;
	bh=w57C5ojZ9gtwgXAFWyu8Q+Tr/0206AhKemoFQx2AKrU=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cAM7g076o+Lf0AonvXMNXAe7HbXCZszvouSCNTjqwTx+jZ55+vD2pet9O6xNHYbnt
	 WKW+4IOWHCPAEHx17Ho0o8YngPERhWL2B/Q/p2aRE9AT4Edq8HPAqzc2uXl3MXezua
	 VMnH2PhogyQqR8QYbLHgovO8d8/+79GbbESbXVegv1WB75PZcIaFsrGPyBWJuxBMyQ
	 gRPg/ojLVBx2wvMHgDV3DkfZDKsuBdxy3GShoJ7PvQDKXzcLYcUI5ttWs/rzjlaDxS
	 ZMIHmoPTZ2NqshShy7sUo/iIhTSxjhKcpOFq3bE/ppx4WKKMM513LD9Z5jeJKbvk9g
	 HMg6aJl2lo0UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F8760A3B;
	Wed, 17 Jun 2026 05:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 495A8347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F69A40718
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6FcOl70TkI6 for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85E46406A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E46406A8
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85E46406A8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZb6A51+SAYHaTaxq4BUEHvJeaKbTK+I1WPgI0ch9mIDV6Rh+G8Ni7eEQfKdgsXwBcokm9d2FMGEylyfG2Ov3D8K0IsztV++M9G9KKR44zsPeFkW01/qYN07pFdOmQw1kXWjFEVG78AHydt3AC6BE89JgT28rTj2MjqPVMEvdGClFL3ygxxbC3T02TRsQZ8VwFs7cMIN7ix0sv6smERjAYLt8PWQQ68/3FxqdLKGxIQo9is+9FPX/ELLajd5T3ijzASk9gGYsTlOZHGboJwNmXEpjVy+zJHXyCvA2trqRxSkhRazdTLUt30K7ReWcOZ99JQ9txVf202F8ZvfSXNk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frp0njO2BOGKqCFhkNiyc/nmmX2FWNxRHh/lTagXDvs=;
 b=IbRGRAMTeLt1UGoHkO/Q3C3lMF/tCz4YAWXBgPFSxdKV8zQY5LdJHXTb8J23/nq05MFwiccizIBYZxCdeIldZ3C66GJIMyHBcvd6H3B/7T8qO1Y/fFRAJIpw73HR3yvrNtUl7JrF4Jdf+5FAWRubJXT6weO8YkDxedtpcdYDq/PZ1Xqd1Zw4XT/hE1NVqzKWsdc/TdO/kEFDAJjLU3bQQRJfaHf6yMs42yko45VuhDzT/OBZIVa16eHWBAEUOkk3+sp4l9yJoc/G2RbtL0MzD9MLIg5l7MQEFs2PG5PQ7lk4WIBrc1HxhnqMSBNq0TgW3pSZG8BRovI4WJ2BfHM0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Wed, 17 Jun
 2026 05:23:54 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 05:23:54 +0000
To: Julien Olivain <ju.o@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2026.1
Thread-Index: AQHc/VSdjlUi01EHAUmKebpyRM75T7ZBhLuAgACzTsA=
Date: Wed, 17 Jun 2026 05:23:54 +0000
Message-ID: <BL1PR12MB50325BE55436ED1AE4C3CE9AF0E42@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260616055422.3688535-1-neal.frager@amd.com>
 <fefb2dbfced24bda58bd733bef949fbd@free.fr>
In-Reply-To: <fefb2dbfced24bda58bd733bef949fbd@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-17T05:22:53.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|CH3PR12MB9121:EE_
x-ms-office365-filtering-correlation-id: 64d18be3-53d8-410a-b968-08decc309f95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006|41080700001;
x-microsoft-antispam-message-info: +Hty7WzmoW0sqt14aN7guCl2JQJ7irWKUyGzaifPVPntY6ETsvXqgzTDlck5yoXGlVBD2Vk2yYVKUoDrEKPjRpCFYPSqpmYaoTIzkyokrf10in9fUiesiXrDVmqLgIlaQ2lbdjBsC7gaxYVCMNj45y5zc1W2r8ZKaA/AaUe/hDa83ZNSCqYRASYnm+7ajW8F+WEsPczKgmdMaYBICYig2OR6n/T0ce4nFhggI0Df07aecMK0nFi8PuDrr50BKWcNwOcPJnFvTVInGyvyOH8jgN44Gy8TQpq/veu3jo5u4OVTJjLJnrgY4dNiEAzqAbEeGCvAHljf5nlCM3Ip//RbqxU7at5RZSdESz37Y4Ojiy/vtuRYROutsHEwpyoP46gWhebBeTuj+O7rLRTQByu/y9vCSyfVZH20oTfTzQaN6VfZeYiocTpNL0dr2FD2l8WkZLKY2PDg0b6bbc8olVjd3M+R/vHbF5JfvZC9FN+9ydqO+B2slrimvkn5jCeLl3GLbLoB5FouKNXH0FO4KkzDosjZ1+Bvt3NtQ+BtDeKcLvZ1b4i6zy4ThOuDqD22DN+wCeMul6oBmCNjEkic61pUh373eP+CFBvB3a/C4QIxzXS/zldbQ83dka3XXQxwyasUfELbQZepffzYIqOHC+Ii5Bo9dczoqcwgFwBtMYUoV5z5VlNWuqlKVupzP3Q2tmOXOF/eEohpN2PmHfDDbkji0aHSec65RYAx9kB0YazPq1jP5gLXukpYizMyo4CO0jCEC8jnC+BEIPU+aoanwEoQjvSakgaBhJrncpLqUlEqkBs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0Eu2w4O/tx/rwUg7/FxSGuraYK24TTkeIAOmaro5alb4ufJVk8ZDn2sj9tZu?=
 =?us-ascii?Q?9qpFceX7UdTJLCv09sxn+OtjNgoIq4xSlUrAbVkc5Pjp65UYXYF3J2FuFtjS?=
 =?us-ascii?Q?ZdMuAoC7dFBK8nkdtO0Rs/M4PQLZ5IsHMe2LWR7KYVDHLMqQkUeVGQQrDQb3?=
 =?us-ascii?Q?SnVIao/QBgN8Gltx4+I9MgLrtxpKffsBzlSg44kYS/I414oWL4ZjZcDalCny?=
 =?us-ascii?Q?50QxSbimguyZSwEv9TwP+j1yoos+cCaf55kCJGNRqFS/a4axVb3cH0DSI9i9?=
 =?us-ascii?Q?YekBXndi2sSd30QGTLdfD8Sk+EliSS9Ac/eJZ+exzWfsTL86bLiSlayB6jyn?=
 =?us-ascii?Q?rnW5zAzfpUxbplbaKJbbRlQkrTUuW9ldwlkQf+YcvUGXChqOumhSY7JpB+f2?=
 =?us-ascii?Q?7oAUclMd9vRHumRLuCzZjtZOky6FFACZ5UZCHdO3zPROANvNgL8ZhVPaN2UT?=
 =?us-ascii?Q?uAYK+kCb5SVt22F9cx+y30Kf0tWNKnZYA8VmiPpBhENR/qmEekjOMN6K2ESX?=
 =?us-ascii?Q?mRHPwRnL2Sb9pxCniTXwwBewhQW1JaOSTNtiZIhdkW4pIeIBxtCSvPeoWvfh?=
 =?us-ascii?Q?xBL4FFgP3Tax9Zdv3/mEHG0E6XWrMlkc42x0BgTCIqLU+Z+UHW1mcRALDuGD?=
 =?us-ascii?Q?kHpZnd+SD4CcctWHrh9mdTeM9pe6DX0HNcMtru2pAINoQpwxgCdSVDWDisQ6?=
 =?us-ascii?Q?P2cIl+sVKjKjkYc5f3hs2s0CoaC4MqHNYn6DMQUWL+qIdsIwHQGj0wvT4NzH?=
 =?us-ascii?Q?JugrU1xKej3N+VszCbS9u8VWTD0UISFu7pjfFqu3upPMcWrI9MnkAr8fo866?=
 =?us-ascii?Q?7cdGFXdvazJ2sV86O5fJpnTXh0YdbBbKXqHqjnt2Dv86/cCvlaNOvvJ/6+kF?=
 =?us-ascii?Q?KGUgBJgyJWYApmKeNMif9c7hGablLLQmbL/qgRzONHqMnbJTq2QKIQvJIWqT?=
 =?us-ascii?Q?gquASGS9fjRTpLTVS66DQqkTLbejf0zRSChhE545bwYWKeiInSysIisoByUQ?=
 =?us-ascii?Q?qXiXinvYoTvScRVKfDM8FeNvQ4lqsY0bk+FBz378X1xDqlvdbGNecMPQ8bzm?=
 =?us-ascii?Q?94YtqzTRsH66Nnf14Y3V5drW9r5y7xzDbtAAZQ+g2GvWOMSpp7NvDJHR2996?=
 =?us-ascii?Q?9qkKWHgOHIxWr0M07IqP4qxPTd6FAf2W6dENncSXcEnSgUnMct8HsJ8CzuOg?=
 =?us-ascii?Q?qyx4zW3+MXgsQfoDn7kCLAPv8X9HKhKZoffE3on/DYg3zEGOQf9OZGspmJoy?=
 =?us-ascii?Q?QaIwMwEvylwciIt2qKNhz/fi0kdZLOL5C1jxKpSauPChBP/aTGYhus08+vyQ?=
 =?us-ascii?Q?hzrsqQ2G4T9ApxIYzc2pMsl/X0ZjmiGNoklU6prrDxheLMpTkiMOY7JQ/MTf?=
 =?us-ascii?Q?kBIeguoSFSMH1RemyUZVOD0nNX3GUOYKF3NP5e328KiL+1N4Jm61Cr3W0QyD?=
 =?us-ascii?Q?o8XZgkVtxGUoo6uK0cwooPVK3mwBlRk1bGF1k7zh+5W5mL/V+MBCAMAMzQxo?=
 =?us-ascii?Q?d2cqiSE18pbv868leEE4xAI3KmwNCCiF2tApa68nm0bk66McXRUnrQmdb7hN?=
 =?us-ascii?Q?xoisDu7ZVMhDCPv5FxWVqZynxOiNKm2x8otoh1vgC3IeHt/iMYzx8NV1DIgZ?=
 =?us-ascii?Q?0T1s6xpuj/4ZOTunD1GsohS+TKa49PKQ9WwIVy9wZmr37ZbMkeGv0TDG6LER?=
 =?us-ascii?Q?8bJtLJMnaRrltbkftQ07He/IGdKIq06FdsuUXZgZTTOHze/U?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d18be3-53d8-410a-b968-08decc309f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 05:23:54.0798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+Mj8FqEek3zBxwc/PybbJ2UshVDZvHjB0EueXICq6Q3ayGswJ/KI6BgSxuadIEL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frp0njO2BOGKqCFhkNiyc/nmmX2FWNxRHh/lTagXDvs=;
 b=mWZo02p2VK3yVvHjrrQu7UNbX30gEK5eFsxlHcw6gAsa2AHo8R6yx11yTSW/gKVLgY0LXn9VXiwyBRaH5n8JA8SlF00UGHOO2YD7FbFABSg8bRT3rqmCQJsv/jLDdwYIcGxdXG16T99w3jMxJDQdD+kLamqNbHN1YZE6abFC1D8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mWZo02p2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2026.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Julien,

> Thanks for the patch. I have one comment, see below.


> Bump bootgen to xilinx_v2026.1 release.
>
> The following patches are now included and can be removed:
> 0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
> 0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
>
> bootgen xilinx_v2026.1 now requires C++ version 14, so the build
> command has
> been updated to reflect this.

> Since this host package has a Config.in.host Kconfig entry,
> this new C++14 requirement could be reflected there. For ex:

> config BR2_PACKAGE_HOST_BOOTGEN
>       bool "host bootgen"
>       depends on BR2_HOST_GCC_AT_LEAST_5 # C++14
>       ...

> comment "host-bootgen needs a host gcc >= 5"
>       depends on !BR2_HOST_GCC_AT_LEAST_5

Thank you for catching this!

> Could you send a v2 with those changes please?

Yes sure.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
