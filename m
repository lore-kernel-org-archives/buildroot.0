Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA733CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 07:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8494A608F4;
	Wed,  3 Apr 2024 07:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hM7hbUOX7ng; Wed,  3 Apr 2024 07:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89AC760AB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AC760AB7;
	Wed,  3 Apr 2024 07:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B28C1BF36A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 07:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBC8160AB7
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 07:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DQqEaZlx-kV for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 07:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::700;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D297B608F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D297B608F4
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::700])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D297B608F4
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 07:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abrI7zlOPwcDks3RCysXhDivCyTqv/jmR0O7H783qMxs/h9LRe3W8ga/vpNGC2IIi9mGK3G/xslyGjLhA+LSzpseSLLluq2cVzPMYIBbLywBxJufTTP1ww1PB404NCT32UfKr9GBWbxucSMCHOwAjNFb3Tss9g2Ou2qLfHBbUVXOd1BB43fa7frdmwlSsGVRq9LlrA2lwjaVRZNeMGBN7ldqnNZhYDDYE7hNrxnOL/b+cgROaZzulrOC1kydG+sv8U8JYua4QNB0Vs40OQzaCHSf4QTyGmlhYWJHvC7HlnTO11TwVo5uiPislCE6PRqzDJod/N9g4UVLYvDaTyxGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYLBlHKU6HKzoslncW+ztcV6TVbFLqxpN5OOYPUh9Fc=;
 b=TmF62zC9JUyEPIfy4WHGI4Ug5oZvwhE1RzZFbT3GIMkWGhlTvYkAzWt8TTb+DTsihKcuS1hMloKK+xRwAVdA0VduMs8HlSHDhKmljTzv4UH6kF9e5aatlJVm4B9aLWXm3jED18xtvQi2+mR6lQfGSJW0PQJehVj1STB/ZeI+QvB0rq/Ubb3mB1GPRsUuWzwY1dA6Yso3MgYEL7nMsJrqPxP0xiuJpSL4yUqxFVcn9ZXhkhBEXyd4uLqBggu7uUsEZHKokJEXm2XL62Mja2and1e11QmnnVwb/fL3TZBLL1S76PFtQpj8GmZdiD1knUVcbQwR4oBa9ORUTn2Y2TA2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 07:47:19 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 07:47:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v1 1/1] package/binutils-bare-metal: apply binutils 2.42
 patches
Thread-Index: AQHacKjqD0NUOqYq9kSZ3nZk0tTQ87FWVKUA
Date: Wed, 3 Apr 2024 07:47:19 +0000
Message-ID: <CH2PR12MB50042F5B14D12C450E5B1EB8F03D2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240307160204.1923757-1-neal.frager@amd.com>
In-Reply-To: <20240307160204.1923757-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB5877:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k8Vfi/cnyeH06C1REXT9MK2WKF6bHOYobmrySdiXkht+uU6oKlWmbyuKNi1QYX/fIXyPZtp2zosdvUY4H3kULrsK9Bo/KR/5O0S5DmURbwDwwqrDifVf4JeUAozWnRF9rXbnAV4Nmx+t6eFLpRBAKyhbxLgg/dAK4p9pbQTsbaRwZWxslRMxs2zujdlln4AtyHt1P+KSn+6h9Nk0p6grmWKtc3uUWIdmDZRXRgt9xhKMwk7WbvpxU9rymV5psJ01D7D/L1guQ2vFuJujjVLdZjuMP5OsaUvLOdTFYWcjDmY94Fg3q0gcSOgHA04heMoB5jIC26dWfXhvaeffCr7dYY0g6vYwe+Eq9CkAE4Wkpbnw5pf+ZHXYSVN/MPWqfzS46vayUv9mfRwNaitHsUm77N5i7CEjsWJ7sWgWKSMMVFCHj/Fgd1INrjgXc2Vc8mYeDRxt8yY4OiBowR2RQFYdYcld7JFuWRwEamwlIkX0DPbSaMTKgQHih3U44ibS6xGbY/CVe1JMkQScyRUdqrlWCbRtYFnpfxDpRoeopHr2gVcseesGSohPkO9adfyinJh91luUzcMx28zgjr71eSBn7q8iY1XKMce81+n3bxTV/4L0hM3nty1MlBuyP9ZdaFAot2qY5gpq6Hifs5Cv9IRu61wxH4hPsMz1rQq59mPyCho=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZkvHjaUUadoi2BBMYP2YgFAeo4hIRGSHSIeyOwVVd36GKclQq0XWnL3RdxM9?=
 =?us-ascii?Q?SDYgjuWtiwsZeNuGiFDdPQD7c4dgLdI63FYblQK5aEFKgYT/hqf6J4oasREg?=
 =?us-ascii?Q?xmJk8K5oS7PI8Gv2DXiUd9pSM5R+A93JGKnOx55xkXbYbpJ8fW6P7IJsSvX0?=
 =?us-ascii?Q?VnMqJ9WzKOGPNevFTqzhflbN126IsSKdjZ3Kpp7Y6wDdHo/QqCefL3z2+dJN?=
 =?us-ascii?Q?pswBIHaHlefqns3LcE5rw7bTiDEVW22IT1YooO59Ru2Fm0IWC7cJXe+rUABO?=
 =?us-ascii?Q?FD/wRwlfW7W/eIhVlJ/mQHu/b1z3Dmg2JoD5bc2sW4Z9cSSzok2OC3BWCUBq?=
 =?us-ascii?Q?nvTSlMiug6cqKMmZksmCYAFs28f0hi4FJ44OBFeuY1qMyH/dBxsZWjMcBdhV?=
 =?us-ascii?Q?6uI6tYgRlqxDsO8422ueYZdAmo2pElZ11fOn0l4NzgJCu3dm29fxi476fsS8?=
 =?us-ascii?Q?qNhgQCp7/+XRxdFl1Lt8SKssAcrwoQO8bgAtfAnlt+qO/uf4608yz4YuY41I?=
 =?us-ascii?Q?BcBGmVZ1h29RTC68+Db4gOPdmdbJV5OnayBE+9c/oyqRx6uz+sAe9pqqs3cN?=
 =?us-ascii?Q?1yapTJHkL2Btvu+DcMFfLaBc30mHb9KVhKaeuu3rxdhADIu3Jnm3osL9Vqxx?=
 =?us-ascii?Q?ChYogJdINRW9BJOk3jacC88qwMfUGgsO09r7FlbqmYy0LR6SuQ4vWxoPmZD+?=
 =?us-ascii?Q?VxjHwPdPi0bTUypqAkSKdXawXxiAFWEyeIpSxwIaEzBxi9Jv/eT4WUjQ76NB?=
 =?us-ascii?Q?1qegWne9b76HrdsQKTj/2bGgRQ5zFqnu5i54d/vWBa7onZ9blvjBupVxbMVo?=
 =?us-ascii?Q?wZUjwvEiD5n/c6yH8xJ/Rl5kcdQk5lM6dR2v+6qOlItbX2K5zwW5KezWld1d?=
 =?us-ascii?Q?dtWR7SEI6n+IR6AfzH/RiZBNhWGTynyv6GEHp/EDtHcOMNhrsqoyvh/L8Qwk?=
 =?us-ascii?Q?hqRLvgIxKEd/2RzQqCHhsH7z7St2CNJjG3bIVoeDeuVUQKypk4ei5kDP558L?=
 =?us-ascii?Q?+36IK3Tvsyj5e/H2E9nBVTNyB/dwwwBJcAl0xtcrJmfdMqxc4OXx3F+vAWiY?=
 =?us-ascii?Q?n5HNe5VwBKpjuG7Tpn0CiwEHJHrApRaU0JbB5HnOzqiagj148Wm2LmcI5sIl?=
 =?us-ascii?Q?sgvf7OsnTUk6u0iRUolpa9woLeD7pmvunC3is/FpJgF0o0BS/4WP1d4g0GEw?=
 =?us-ascii?Q?dupRc5s0RmVS10YYjbBrooM9QUAfjAC2+lSwBXkjOye9GzO5KDb/k0RE7t5e?=
 =?us-ascii?Q?5DdAV1CCz3iuAz3SskyDJTnJNs3GfuoRAGXKIm7dcKNMnYyAzszs0PXlWatk?=
 =?us-ascii?Q?BgDbch9ug3OK2RogsUAAVX4F27GP0WEPsK6Tbe3D1+HTibOi1FFAXUavZhEc?=
 =?us-ascii?Q?EPmYK9YhTvugKcR4P1R89LwZivai0zdZPeiuhAP+dC6boYjbW7vQ6NmXO77g?=
 =?us-ascii?Q?1m+I+gduvs5Hd+cMMhPyVsuhPbRwLxqv1YngREYu7GepXNtjPwKaOWe6IW94?=
 =?us-ascii?Q?CQq9jVI46DZdDIJVp2aVhqw+DXA0jYTlwPZYZSdNj3GcWKzhL7MfsABr1Fif?=
 =?us-ascii?Q?aeIThGNCrf0scImiit5xuER8sDZfC0IxrfoFtlHMTQ6XUOcz5kJkLgvwYfZN?=
 =?us-ascii?Q?ajPdON7Be0jQud5l1sq5QK4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14413057-5dc1-4eed-d842-08dc53b24a46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 07:47:19.4644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MR2Z9d15BhQlJRwkG1epnzo3/KzOfimbJ14KfTonqTaUR0IeZy0kAnu/0rqZP/dE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYLBlHKU6HKzoslncW+ztcV6TVbFLqxpN5OOYPUh9Fc=;
 b=k2vHd+nu5aEfjTlKTk+QF1GMTQJVWd2VA6wNHovfy+XdXIEd6lpQhWqXRyo4H1QOh6X5Py+j3TZX7SZPt2rKW56KwiB6aQUTmcTB3bmUf+2Eg/q0aePQ5j7AXfL4TIlLe2ILA7sMru7S3ERToONtnXXtR5wNHlzo6UA1Rg3Rt14=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=k2vHd+nu
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: apply
 binutils 2.42 patches
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Apply the same patches to binutils-bare-metal as binutils.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> package/binutils-bare-metal/2.42 | 1 +
> 1 file changed, 1 insertion(+)
> create mode 120000 package/binutils-bare-metal/2.42

> diff --git a/package/binutils-bare-metal/2.42 b/package/binutils-bare-metal/2.42
> new file mode 120000
> index 0000000000..dfad0ed2f4
> --- /dev/null
> +++ b/package/binutils-bare-metal/2.42
> @@ -0,0 +1 @@
> +../binutils/2.42
> \ No newline at end of file
> -- 
> 2.25.1

Do you have any thoughts about this patch?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
