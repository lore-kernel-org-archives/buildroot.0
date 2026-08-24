Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0098DC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 13:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C083940652;
	Mon, 24 Aug 2026 13:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w9ZTs9WIZhS; Mon, 24 Aug 2026 13:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787577368;
	bh=dTHLOJo0W0IuI/j3ZyIz6tKTNi9VCnlWpcXfdSvu6Ag=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sz6tKULCjh4XbYJhR2n7cUdWrT7HWwfljyhT+ywzZwTRldgWbxqI1j7CCCfAx0R5a
	 X+ejvLF8guANleGNiUYDs7bmwrL5AgEvpJq0fIgXf9JQhNozIlnyuINU+SQb/r2mhv
	 wrhVGxsg3+gkVrGIHXfopf2n2IhcBPdAvtJpM2HJ0twhzvzq2+lUikfcT3J0+EYxDX
	 8MyWx8LnsTp/v918dBl/B9lJnBEjBuCPNFyn8C9HNdyCJfhjntg7ro1pFG9jeICoE5
	 OQJqZoRh/QTk620ReSlqcnk+qIHlx5eynUUPfagUqUHml2wakk2rDdZwPZ8kSE41kr
	 zn+b5Ivo1Gn+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C77B40637;
	Mon, 24 Aug 2026 13:16:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50C5E396
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E7D8605F0
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUm2e_XFV3R0 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 13:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CA7A605D3
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raCNmnekVLPZ7xXH5P5IVAeAnDLQtaardU8IvTgHTtaDvDQTqQbR3tu+MOXxGsm4kuIHO4WNRRZtDi8gfZjMz0rwQyLLUWJflva3l+g4I3UWPH+tMUaDg+Y8k8ncffpMvlY+8cYLfOwmHKMoeFbTRBdFWrJEp19ewVnE1PBIaZg+2xgs0A16m9ME7KIDr0DS3FSS/yrXvNitC/t+1V3Jb8w1yG9m9+3LzDafuU34hA/Pyfb8KbBz4ryin/dYTkybo3I3vflhnorOe7rj1OVZCzdPcWhPNjAAwMrf1reu2nieIk/JDnqlpwQKx6ejlCQP527yjUeExF39XuinBgLv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfLaNmCYy485xnUIO7Lrf261NBSIT8KaQNJmR0QZCwI=;
 b=kDzvGW2vDHh7c6d0eOFak62jrzQ83DTGJasnX2npSHerbb7lH+dASKbUbEO5gRsH+I0Dr5xeAJVwcIl3SriwNxLCMpr1iwbOhyuOOpn/r1CrApzZEtPQa8Km/aw2S18HXap7F92d8ne9I99S0oXpExQI5kIDrzHc5qAz/V1CRIk7s+UImLfba+rEFANnD4Netz6xAfPYTSWzSRmiJdQQ52Z6eZ2NzgqyBAZS8fA+WIdtZU49HJI6SiMkCiL6vCVD0DhSP5hx+hgcFz3ldK5F6E6fw08dzRF0Qu35mmrRLn46WXb9clo++ReIJOjl405OXbCStm3cuAyb4R2TRyF1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:15:58 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 13:15:58 +0000
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>, Matthew Weber
 <mathew.l.weber3@boeing.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "john.ernberg@actia.se" <john.ernberg@actia.se>, 
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v4 2/4] package/xen: add custom version
 support
Thread-Index: AQHdI1fE7w5qe47bn0WwEfPH+8We27atRQaAgAAJZSA=
Date: Mon, 24 Aug 2026 13:15:58 +0000
Message-ID: <BL1PR12MB503255A482B293C6457E06DBF0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-2-neal.frager@amd.com>
 <a880e3e6-f71f-45f4-aab9-9f434a65f9d0@amd.com>
In-Reply-To: <a880e3e6-f71f-45f4-aab9-9f434a65f9d0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-24T13:14:54.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|DS7PR12MB5984:EE_
x-ms-office365-filtering-correlation-id: 506a4434-128e-4712-ceeb-08df01e1d627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006|38070700021|41080700001;
x-microsoft-antispam-message-info: ul3pL5JXBxc1dhp5jFWmaXpETm1PR2ie2k3cM+pXJm6+M0cEUyklYeeV/QUCs2Udpn1A2ztrWZ47JhOIBqbAjSbabM+28LNKv5OYhlhUCm9UwL9Ve6Tkqcuz51egalgoguk8tt2os8QAWJw+j+L+UttY9D8yeWP6XiAxiQE1dtkpQOuY1zvdtGJWumGhdCwHRsEZH+ijzZMBB5MVJOZZBE4DvD8i+W4KnWMgYstkqrAElA5hsDDix1xh0cLEaJifgvm5HGaXnNzDgeIjrvap+5fO729/IBTKikOE9Ojs16SMTxmU+6BXNiAEHjixbhFs+1LYetqVbYoLZ61szemVazXpvSdvjvCpJGBv0he1gdHmE2kVV4u54RAA4PItT2J6sYKTYPH3PHlhTELCXWeu0vGacXSC8PIrWuZRrahl8R/NJGHVtoWgOrDwtSJZAqDHXcZp6AoeSKNcKZ4II1CXHxZ28QeZJKQiK2W9AfKAUpam+xx6X5JuAeqsq5gr/iyi/ruwEv7XC68MD6FbQZMkCf4DuJugFcFbmzf9hEIAMcB6JJL/MRZtbfu6C8eAYA5MUG4rCSMIZw3Bds9ECxVo/lVwftO+Ra1SrFw+exgJwg/UOHXfe+nwRl9mJZa2NvIyHY4s72Oyz+IVmq5FjWxv5po/q1fX6sfPgIf6aWiqvqbFiTG5iQmQoJYvpNa491eG4TaSJWRvQiWs4+vKYBM32ue7/bHULUhveFBRL5wx5v3o//1AREmImAOE/gL93uwN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3pma1VFVnBhbXlmaVk5OUQySHlodFdtb2tieWxmdVppaVdyVGRCWGE3K3BV?=
 =?utf-8?B?bkh3ayt1Qm9RbitYa0w0TUxIYVNvWjlDYktYTXpMeEpxMHZGczEwTHIwdkx2?=
 =?utf-8?B?dlVUVVlaQlR4Q3dpV1paK2puQWdMRFRvdUtvaitEVHE2UG11NGsrRVpNRnRG?=
 =?utf-8?B?dndneUJZbGtkNnNhNjZ4Vjc1Wnd3MlMyVTFTclRPWVIwWSthOHQ2NHZPTWFt?=
 =?utf-8?B?ekc1NHU3eVo3aGZYTUVzdC81ZlZ3RWRIN2RjZTRYbEk2TzZaeU1CLzdaRXpy?=
 =?utf-8?B?c2tzb09nbkJYTzd0dmsxbDVMWmZORzgvZXU0dFFVK0Q4YlZrTERMeFBlTWVt?=
 =?utf-8?B?S2dZbnpoYldtaVNnQ05UZnJKZVpXMklQaUdKNVR3Q2RaQXRqQUJOU1AzQWZS?=
 =?utf-8?B?dmgvL1hTaklFOFE5WHkxWW11Um5ETGtJV1k3VExOVytKQWZGWk01bm00Sytn?=
 =?utf-8?B?aDRWeEtkSEI4bHpkcU52Z2g1Uzl2UjhMSjI0SFdkb200VXhNVitBcVJJL1hi?=
 =?utf-8?B?OXoyaFhPZjF2WkQ1d0luTHg5ZEZwdzhCeE0xZC9NWDlnYzh5SytmRkJFalJH?=
 =?utf-8?B?WUtyREZrL1RnYWw2aTVyWkQvUWpvTXVSc3JBV09FcHZYbzVJK3B3TGd2cWFD?=
 =?utf-8?B?WXhRbGlJUTJtN3lBVWNqUFd2RG9UQ1FoczY5b0Z5SFRNWXFsZ0xpbVEwdkF6?=
 =?utf-8?B?VVNqdnRkWVc3WWlUM0x2Q1JYV1QzWVNoaFB5Z0RMbjdDS0U5aEloWkwxd0d5?=
 =?utf-8?B?aXZjVndra1Nia1k1UzhLOXUwbjlYWW53aTczZGpxelBURkJxK1hyb1Q2dzkv?=
 =?utf-8?B?bVpYbnVKUGwxNSt4VjB1bXpBbTVQZEg4aVZBSWd5YlZ3VmFWa0NRbkdQTkF5?=
 =?utf-8?B?UXBrREpGZXJCSmtxVEpiOThlb0RwOG1rWHcrLy9XYWpxU0tmQlVLOVlncnF5?=
 =?utf-8?B?Zk9CSXpZcVJ4WVdoRHdsYThDYVhmTC9vNlMrWU5IaUI1WEc1ZkVjV1FTNWdw?=
 =?utf-8?B?cExpajR5NzRFTE5iTDBEeUh1aitXQmJoRjl2NTViYTdTM0ZBLzlPckV6aUJF?=
 =?utf-8?B?YWExaG1hYkQvWWc3NWJBelVNTW5uU3ZzN2R5QWJyY3J4YjdWOU9HZ3ZsVVNP?=
 =?utf-8?B?Z0txRkNQOGRrTWJ0amYvRkR5UTBud0VGbVVFOTFDL2dwU3ZrQ2NjV2N2dzlM?=
 =?utf-8?B?b0thWDRTTWFsRVBSNXhPYU9GSHkwSXJNUnVZSFBkVHFtVDRjdXVucGY0a0RG?=
 =?utf-8?B?Nis2dGlNSVFhamhONFpudDN6VTM2UFhQU29CeGgvc0t1anhoeWVkaEQrSWUw?=
 =?utf-8?B?STJvd2ZmTm1zTWpYbWUvQXh3aXg4Y2R2dVF1dnphZHpheGRCeFU4NmdzaVdT?=
 =?utf-8?B?OEhUK1JMa0F3Tk9TaldSQ2JVK0NoSnZFUW5kRjdFWDROek52c1pxRUFKS0E1?=
 =?utf-8?B?ZFNBdDd1YzVwU2JxSjAzRHdvT1YzVUt0QmpvOG9CQ2ZEN0E5TXZLK0NOMHFv?=
 =?utf-8?B?UzBGNWFqTkdkTm5jQ3RMYmR6SGordm9VSWRKVXlWZUlyakNTZ0FKVk1PZWVN?=
 =?utf-8?B?STdLclZhTStOaVo2dU52RnQ1b3owSUUzcW1DQm9zdXFreFdER1BlaVlHakNJ?=
 =?utf-8?B?b05DaUdLclEwanBqUlJXUGZHWGNaZWJ6RWxyYjcrRXROVTZSbGxkRm90dm1N?=
 =?utf-8?B?MElmQ0FON1FiN2s1WTFFdFQ5VmxERDdCRnJGK0RScWdydE1Yak16V1M1TXRy?=
 =?utf-8?B?U1BiUTVqWWRmTkNzOEErMmhPSmIvbEt5Z2JuMW03bHBKbW5UYTV1VlJmUVJ5?=
 =?utf-8?B?S0FNYWk3UXFDemJQZjR2RFFyanZWaU03TFRYY0hBOXNRNnF1SHRSdGpIUHcv?=
 =?utf-8?B?M3JEY3hLVU1ZM1ZHVnQ5QjZLajczY3FDUXZCc3Bmb0VWSllJbTZiaFFzZFFh?=
 =?utf-8?B?UDd6a0pVRlg3WmROU25iQ0ZRYjZHMDdXRW9YWWhZeFBRbFQ2V2QwRjhXRmZp?=
 =?utf-8?B?VzFTZEhucHlKbi9hOW0wME9JbjVMdWlXWEZzTWFJOE1VNm0xVytidDFOUSt6?=
 =?utf-8?B?SzVwek9LbU9FdWJadWt4Q1hZM0tuMk9xSElibDVGeEZ0LzZXQnZXaFp3ay9n?=
 =?utf-8?B?R0NIMTU0NWlObGcwY2JxUk9xRVBMWnZJMGNpVDdlZWliUVpDSzErQUlFNlpL?=
 =?utf-8?B?MmdqVVZHUVhNQWk2Y2NkdTZna1NmeW5UYW1qWTJSWUY0K0RrLzU3MVBkTHdW?=
 =?utf-8?B?Zi9BaE80SlQ5WTlJQk5KQlhzMmJLbXpJdVAzTDZoSTBxc1N6aXhFZVJGdXg1?=
 =?utf-8?Q?jXj/BNTmufRcgLC4Iu?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506a4434-128e-4712-ceeb-08df01e1d627
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 13:15:58.2039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6BncOSpK0KM+0dhWLbxbmIkoys6qXU+GzyZGIihBhBdcQwpDH1UxA4V49s/BLfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984
Subject: Re: [Buildroot] [PATCH v4 2/4] package/xen: add custom version
 support
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

Hi Stewart,

> Add the ability to configure specific Xen versions while leaving the default
> version unchanged to avoid breaking any builds already using Xen 4.21.1.
>
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y

> Nit: perhaps mention how to test the custom version feature? E.g.:
> BR2_PACKAGE_XEN_CUSTOM_VERSION=y
> BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.22.0"

If I need to support a v5 for another reason, I will include this.

>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
> Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
> Reviewed-by: John Ernberg <john.ernberg@actia.se>

> With or without the commit message adjustment:
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Thanks!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
