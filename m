Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E93C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 05:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E30380B5C;
	Wed, 26 Aug 2026 05:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBeIxo7j_bI3; Wed, 26 Aug 2026 05:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787721306;
	bh=Zl6RViKt/jl2dOwek9YEuTx/SFUDSt/WktDE5OKVOT8=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=prLd4QYdrX3iuWK1g1Qyw0pW8Jx8EnYKXifQq91g9RPT5FGR1WV5NIykVND3cf0pu
	 o6oFRfePMtL3wKCHv73D+PsX175fqvYx8Zt56j49Py8ljtJTaiVXZYcYUDUa2TN1Zl
	 kaIUeMi4/l0VJGCg1mucAs5qdGosvYEGniqiKpu8rf1NZh3AHd112RBJVz1CE/vqJE
	 n7OUfUD0QsBWfYanUgW0BNQkLD4Lj0/e/NF8RzgBU3wsxr8QVnpKlnJ3pI2+4282as
	 qE4Il+OT/cIWgbLY3v9f6Iv0qBUiwGAHJmNP4sskjSpYBbjacBvTKHHJIoJLBvmOdr
	 p6AdCX2JJGdgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B9480AE7;
	Wed, 26 Aug 2026 05:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A5A539E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809604054B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NQ91IRPYFa7 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 05:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CCD840547
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkDjaDHzHb5YQkrmnytW1bzN3AHpYCR27tf3n13slLczwRHdN0dcYrPb8nuA+n0qr2YJzyW0AlBJJRefIkeF1tpuqswG+92YM+vBylUNwwrDrKqZaQufRfzXM/GOz4uuQmxKvbfrHHB0Zqslzo3uA2xRW7hTGLFjpRRc5yyMNjDHkQsmzFBayU/yuaM/KLoudfv7mfZ3FGrnqXq8bTFqeP/ntIcOt6Jq/oaMHC03KZVJwawZuj+7DqUwKsavmW2dOHfG8wU9AZOTuJLAYDOcbAT/iAp8iRC8j3PObZKHODaDqfEy0Wv7qUtzirG9DHPCeKVTO2Zt8nmdBJrsszC4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1waYnPjDFS+Bf5AOSCKk/ckvZlqprwGz0yP0qzwZL4=;
 b=GM29InWIsDj0WmYBTEgQ23O/z0mOwMRKbm/brVtgqmJ1aPqpLEXVlPDdSbW+phh2KvySQFdC4+PEcUOcCNjDYzfh8G2j49sKmwg3LCT2VnYLCKmbXvow8tORXccvqt/g84YQRvExAeKeR+vPd76BEVtGBz20YqYO3FLDuoSbepLxpPJ8zZ+lKJJ7wWJdqu5cIJNON7kbozXryqieu92aujzNohUoks5LGw5OtTcQiZis0ds5HQbNh1RP67/+NQEKdVyzG9G5LWEW5OND42GtHnxvGvtX/5bdgXDVPk970IAfG38HMTgaFOIGkcYtkD3P6Du6iVrUYL7PKsEPQG9WLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 05:14:49 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 05:14:48 +0000
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v4 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
Thread-Index: AQHdI1etVPwadop6qEuBo1S6c50B3LatI6qAgALI54A=
Date: Wed, 26 Aug 2026 05:14:48 +0000
Message-ID: <BL1PR12MB5032890E5995DD9CC95D7E9DF0AE2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
 <85f125d6-df38-4e3d-a503-1b6443b939da@amd.com>
In-Reply-To: <85f125d6-df38-4e3d-a503-1b6443b939da@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-26T05:13:27.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA1PR12MB9029:EE_
x-ms-office365-filtering-correlation-id: d27d60a6-335b-4dbe-959f-08df0330f358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007|38070700021|41080700001;
x-microsoft-antispam-message-info: +chs8JZ4ALfIWM/0qZHRbkdL2+M4tq3SZjbI+N4wpwJv1ELjFAhSwkypI24PJlsHxoTWaemGfePgthmWJVUyX2D3mGSqvlrF5L9JPYQWzzHf+jE23Vl2lTkX03SW7EYXhU79AdZ+WSbdr/AL1MnVQG7TNPqh2lc5tLVii7jum3eOyOaI14mEn+RWYWJAZy9l5+U5gNeA9s4f4GHOTmmq4l/8pYfUVRmXx984M/3d3LKuMM2U8NCd0P9sxwS0j9ED/4dVpQnS2QOXrFEZU4NJmUtXS91udRSRsDf7leXNIr3HIykx1uPq6LDfwgOvAIXGNp6nZPFH0HiTyZ/2yMa0QFS/0Mdiy6Q3cMAEZAIn1FAzhFW8l81dZJPDTf8luRf7t0G5AXCyzALwhYC83P67cV5QrZTYMuQ3oknGu0Uh0SVJGR7BFPt+cl7yof2wqpLqG8Ka6gOD4ankpYRFQTW3AKKzWzbiInfcesBKKy+X/XbTZM6I2hM2NjbutxtVq2ph90UVDKxE+L+62nz4wNthAYbEcSPvzeAx7hlckXojPkzW/kX5Q7RFgUL/H8E/XZaZHWY5p74z5wB1QNxSrPzgAtE/DiUauP9fCd8wpyM53bbEmA6SPn9wFmocm/Cer4xgwD5kerw8nWMKWX4Gp8Tnq2SF7Rs8kz4iJWnk9dLSPs1NQs+2DpJ2jN+wlUdDUZ74Lj8R+I2BJBtWMHsCeK1XMqWsxUcWHra+shYPx/btgUQ4BlTumhK/EbhlNPygPwOQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDZEQk5OaHc1YStRWXI1bWNzYjlGaFJ1OWZETExnUDVob25JNkowY0ltOENw?=
 =?utf-8?B?TFl2OUtpclBxaU1sTTAvUitOZSt0WDdDT3AvOFV5akQzTXJuQnRESFNkL05V?=
 =?utf-8?B?UGtiWisxakFjTllmcXFnVUVJZ0s4cEVRUEZYODlBYitwVEFuSXE2T1M1ZEVP?=
 =?utf-8?B?RlRvd0trc3pML2ZxT3dXU05Oay9nUlI3S1dpdVNzYWpnbW9RMnN1Y2wzOE41?=
 =?utf-8?B?YTRZdm5QUllYaEErK0Z0dnR5UWhlMkhSMkorcllCaWdqeHJGOWNwZFgrWEJp?=
 =?utf-8?B?ZW0yd28vaTUwQVc3dk0yNGNUV21haG9BMFZjNC9DbklPM1c4azc4Rlo0ZHBI?=
 =?utf-8?B?MXRza1djWCt1eVA1elRQZWE4NmhUd2Fsdmduck1hVjlPZWE3RXgwOFdLQWR4?=
 =?utf-8?B?bHAyM2gwS1hJRllkQURaMmNRQlVWd3k0eWVCR1NHNXJQTEh2U01YYS93bzli?=
 =?utf-8?B?d29oZU9yUzF2WHNpMWp1VE9XRkFhQVR5cXdTaGw5eGxrQTROTmpmMDdkVDYr?=
 =?utf-8?B?ZVh5ei8yZUNHd1EyZnlZNjhDU3NUN1dsYUR3WVc4QWdUKzNFdTQya01tTndz?=
 =?utf-8?B?clluQXBWN05tUDNsUmRBdm9PbDd5YjVtRlFvR0JWUmNrMENUNzl6c3lXckp1?=
 =?utf-8?B?dWpYNzZha1pUdHNQTlBJZ21MNGUvQ3lYanRnSVR3M2ppSTJoeUxUbkE0bG80?=
 =?utf-8?B?SVNTQVpLN0JnaVd3NVBGcXliOTNMRFVVNDRSMzVIUXI0VXMzQmNBZGZsUlph?=
 =?utf-8?B?Y1FKYkV6SExUV0VXakJyVWJ6aDkrWGpJNXgzVjZ5b0NZUDNrSC80dkpVSlpr?=
 =?utf-8?B?Rjc1dXhXRHdiVnhsNXNoVHNsSGJKYlpTWGFIeVdqclluVUx6UTZQT1YralJW?=
 =?utf-8?B?WmhUNjQzdGR2ZitFZEx5Vkx6UkUxY2tjVWpEUUhRbnV0bzNyL2ErQUZtZGxu?=
 =?utf-8?B?L2lETVpqc0wvQ21TY2tqd090UUhHSVpqWjk1TnIrQktBM2Vock5RbG5IVFho?=
 =?utf-8?B?Y3YrNXA2eFhjbk9QSFZRQk93VjE1K1hKdUtITW8rbEJRdHl2OTUyRXFMRm4w?=
 =?utf-8?B?SllzekpnYkRScWhwaVB3allacEwweER6b0NzWUd0Q1FPYjVtSjFSRmc5eHhn?=
 =?utf-8?B?Ym1ZQUtublR5QVV5VXdjTEZieE43aVBsZE9lT3pHa1Nic0hMSWpDbzBOVWpr?=
 =?utf-8?B?YWlvSXJ4OEFXdWYvbEJTRS9uNjFVTWl4RkRBZWZVaXRqK1FXNld6azd3Wit2?=
 =?utf-8?B?eVVocDJKMkpUa0E1eVAxRE9tMzd2RXVYY3JtRStKZHpEeFVnMVhQditOOTcz?=
 =?utf-8?B?TXk1UVVVbjVrMWFPWWM3NFNiQldJUVE4Wnp3KzFPc2VaMHc1dTg5RnFMbXdY?=
 =?utf-8?B?RWlRRDR5UFRKWWQwU0QzeDhoK29DSUJMZWlFK3c5L0dxTnZlS05lWWs4Szhp?=
 =?utf-8?B?NDFFVHd0cjhmcnNpNWRkZ0xsY2Y0UGU4SkhXeU5Zb0JXL1ZsY3FxcWw0NzJH?=
 =?utf-8?B?ZzNHUGVQNXdFNUdudGdRM2liTStORDlLTm5HZmp6SWF1WVJpTlZVR0pGV2pO?=
 =?utf-8?B?bUtBMHZINkFRdGJSdytvSHVwQ3F2UURtOEF6bWljNndtb3VBQlRObE9CZURC?=
 =?utf-8?B?cG5RcmYzTDhYYVdrdFkvQzRuT2I0dVdhSFVPWlVvdm1yYkpFdGt5UUlUaTFU?=
 =?utf-8?B?dUdnbWpLV0pSS0pyanhJTDdHZTJMZ1VIQzdBcjZIbnI2amFQWFlnN0Fza0Nt?=
 =?utf-8?B?L1YyM2FkVUtyWm4wRjBGWmxySmY4SVUxWHoyTlRCeHNrdERrcHpzbTMrRDVy?=
 =?utf-8?B?T2JnVWJ0ZU4xV2FGMTkvSkVjaXBpaS9leW9FejZ0dUxNYUJLZkM4UFpMbmVU?=
 =?utf-8?B?YUFsaWNtQVA2SFJlVFBZRlYvd0dSYm1CaVN3cHQxUDJmUzNmU0h5UjFOeHBk?=
 =?utf-8?B?c0poMU9CcmEzV21wYTVGVU9obnNXaEtPTXMwYUREaENLbncweTF0c0hpeml1?=
 =?utf-8?B?blY2YlBqbUYrUmFPZHo2N0xKODQ2NjNyQloydUxIdE1MTWxYeGM2V1JvNUo3?=
 =?utf-8?B?ZndGc29xTlhhWlRqZkVmaHlVNFplQTU3dDduVHhVaHlXSXFtd2tRUzZVSWtn?=
 =?utf-8?B?Zk8zRTgvQzZYTXV3OXdCS29HMVBraG1tNWQ2SzdUNEdNMXQ3YjFyL0RPbXRH?=
 =?utf-8?B?V3dZRVR0WUo2NUJ0UUxpSTdRMTJrTGxOaFYzbWtKUlhEY2h6dFVINWh3ck1Q?=
 =?utf-8?B?NS8vQkd3Z0pibGdjV2phdS9aVVZVMDkvZjhRdnFKOFlpMGVvc3lqTzVJN1A3?=
 =?utf-8?Q?pJse7GZT8R34PF7vpH?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27d60a6-335b-4dbe-959f-08df0330f358
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 05:14:48.5736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r375hNJw+4aAuw9FynvnzJDWww8vjqiRiIyLKxNz8ttEA4VMu/sYFYMAyRf18cSQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029
Subject: Re: [Buildroot] [PATCH v4 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Saleab,
 Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "john.ernberg@actia.se" <john.ernberg@actia.se>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Stewart,

> The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
> in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
> qemu-xen dependency will not be handled and the patch will fail to apply with
> the following error.
>
> Fixes: build error below
> Applying 0002-Update-linker-flags.patch using patch:
> patching file tools/Makefile
> Hunk #1 succeeded at 36 (offset -1 lines).
> Hunk #2 succeeded at 185 (offset -8 lines).
> can't find file to patch at input line 76
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
> |index 6bcc83ba..2590904e 100644
> |--- a/tools/qemu-xen/include/hw/xen/xen_native.h
> |+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1
>
> To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
> 0002-Update-linker-flags.patch so that the part that modifies the qemu-xen
> sources is correctly moved to a patch in the qemu-xen package.
>
> Move this:
>  #define QEMU_HW_XEN_NATIVE_H
>
>  #ifdef __XEN_INTERFACE_VERSION__
> -#error In Xen native files, include xen_native.h before other Xen headers
> +#warning In Xen native files, include xen_native.h before other Xen headers
>  #endif
>
>  /*
>
> to:
> package/qemu-xen/0001-Update-linker-flags.patch


> Can you undefine __XEN_INTERFACE_VERSION__, and drop the xen_native.h hunk
> altogether?

> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 75252d1123b7..bddfdbba38a6 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -40,7 +40,8 @@ XEN_MAKE_ENV = \
>       CROSS_COMPILE=$(TARGET_CROSS) \
>       HOST_EXTRACFLAGS="-Wno-error" \
>       XEN_HAS_CHECKPOLICY=n \
> -     $(TARGET_CONFIGURE_OPTS)
> +     $(TARGET_CONFIGURE_OPTS) \
> +     EXTRA_CFLAGS_QEMU_XEN="-U__XEN_INTERFACE_VERSION__"

> ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> XEN_MAKE_OPTS += dist-xen

Yes, this is a much better solution!

I will include it in v5.  Thank you!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
