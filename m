Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA9CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 06:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C88C4ED91;
	Wed, 17 Jun 2026 06:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1PlmE7vOVzM; Wed, 17 Jun 2026 06:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B5344ED8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781676831;
	bh=P5IFDfqOZZv6OFO+E9jBcZUt7+dBSKAXRwbYl/H2l6U=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WKrwqfvWe8/VPucHaSIkMmare7kv3758Gq9n+e4UKY6OnWn0WQScUBxqcvv7w6xMw
	 Yz+GfSNPBkpcHUlnhpjkv0eZ4RXcO6b3I63fIsfIb5ZDmXO0Uc15HZdNjAM/bpcbtI
	 9ovcX0s2vd1VKFS5A4TTgPY2ISTkLHMMRHerZZPRao0UMmAbsjT0lPDxFy+8TFhGIG
	 IIfmucaXcMC9RwQDortZ0jrfmeRFq3UQFsDale38B8DkoDqb82qmUazkc2K63QeFYP
	 OSadrRJ2VMhXSO0zZXdSr7b7CvxIEKP4AQMU2f7lQ3gIMTX/HfhFIlgxDSHdBSJuPT
	 sH+t/tQkR4tRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B5344ED8B;
	Wed, 17 Jun 2026 06:13:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A3AC33C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 06:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D7981129
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 06:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LJ5rlq0YAhT for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 06:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0544F81104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0544F81104
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0544F81104
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 06:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meG2cW2XM4cGaVPO476yI3ohwwwGIMLx3SLtdQkMjU5J7mwwzWVte9WO4HRDChrt1F9k8IMywANTvgwRxml3lPahzJtv4wRPIWnASgvMr4eWxk8hJ0HS7BCB5jYFtGBVn6a+edZHeF5t/3qDT5z1lMYoPhaUnenkeIdgRobmr7u8d+PTJRak2u/9AXj1/OT+R5LCA3I1gJO1IaucipuoMSp43fzJClv7S02fatgHAk+lA5DVheUqrimDbXXZab7RLf10LjMaFj7QXZZ9/qcv2W6hh1XSL8K6HMs4zq2UhL4VMsEhothgZXvkbgR1sPcfTEZbRLwSWvHOahwsriugLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcPVugd46fXCHntff97yqRzDQcEFHG/KzWshHA4jV+I=;
 b=jW+VIYKCOU1FxZf7S1+CdnmlfNC2yjHXq4jOiGijoE7QMqeS578GOYPIYO5BQ4hrxQuOhTA3+t9wvUPNxQMd+6jXC2/8zrnfSR6pK8mbGyZe19jRb38uHVZQIjx7Y0zajFYC6JbJ9ZfCLv0BioOvKo0sAyTmOv3Bpqrdt2ya9WlLAhUg1bM9Z0MEq0tOz3ab9BEhJdgncZ6xWjxGjjlpZyMj+6uswzoUHIJ93n7rxgg1ew5fohQHVEzYa7A39arwO/JLVQDzWVtVPccrqTqzwDZXLGSbqKGXow78TeSbHEWIOJCJ6N/NwLTOy0w6GneQawMZjkgMjJu+BeHmKbfB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 06:13:44 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 06:13:42 +0000
To: Baruch Siach <baruch@tkos.co.il>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/bootgen: bump to
 xilinx_v2026.1
Thread-Index: AQHc/hlP0cdaghjGbUqDA3/HC6O8FLZCPa9tgAAGsTA=
Date: Wed, 17 Jun 2026 06:13:42 +0000
Message-ID: <BL1PR12MB50329D5B7D89FDF6231B285CF0E42@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260617052225.2995453-1-neal.frager@amd.com>
 <87bjd9hg51.fsf@tarshish>
In-Reply-To: <87bjd9hg51.fsf@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-17T06:12:33.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|SA1PR12MB9513:EE_
x-ms-office365-filtering-correlation-id: 316ce53d-06b5-45c5-943e-08decc3794bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|18002099003|22082099003|11063799006|56012099006|4143699003|41080700001;
x-microsoft-antispam-message-info: qZMIbovbDC3Aa3dWiSt6P6LPEQava1sno0R5wHWVE7THddWlsHpb+yEPjq/Oavk1hBNuveCMdKq4s8x23jt/OZRy8F+j0wVoOnkEOPXRcLDcqNFFdMZWgYRen85YbmJT6yTrC8XdVBt4EgSOUuvOSJ4EjfZw7f5C89lKD2cu15BHLONduOsFe4y5Ll2PBAUOX6Gp8b6mWkJDEjbN+oPh0RusNzybZHR2PYIjyeQjuvD47K+VOBcBZwrzJkMiXpn4aB/75SACYCpzGriv+E9C07Xu6waOqGAJmxJal0DDF7zY6vxtTgGxsT7bf3FYFXV9uMVRGlvQwPYQBSGzsrMCp1L3GfDQ7eIR6Z99Y9Hpxw0n71q/bQw2t1YJ6wwqn0z4WR2ixclxfLHzQCWwcmO13R99TD/OIqQGUmY8r1lHHbS1T7ay3pZEKydH0dFhcuRd5HeNaMmw7f13qwl0jfSFfIopdn5ZKLEqX0C9W1efAocEPcI91J2OQVFZwPrZsQqa5R5Onh6B4lSH4uH1yJFa8lEDPMyTdA6597srdQhW/C8/qS2meXise8Ewe2vIl8VnfPZ+U4wjWen8AIKoRVNgt17k1vubIcWGIj6HBeqzFO/2ClbVXvVpOz+vm3kj066n0vYfeIaiUU4CEiX9ETncSkZW60GuAA6pW7h3qEYLh+JL+U08X1TzO8cv9TlVqP8POuvlOmOOGcqEYG3dmj30LByMPOyy8lzsFhfLTZ8xIbJcamjRHf/noXXYx+rSr87nVVwvC3m6Ijf93z4yv/Xi+w9+NPkDSmNKP4Q0MSIgXa8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JjFm4IZm6hp09YxqWF+KGEj/H7uK+b+Gkl0Lt/xR3nnVBcrINDway/8mHgYF?=
 =?us-ascii?Q?MCS1HSOLtUD/8hRl13bgpvLjvaVMqO74kOZW7YcElQP26TLO/IOwcnecZa+t?=
 =?us-ascii?Q?Pepz84UJGzoX21MRRmCU5sqWFd+nBGIywwMDzIE4p2/JhA+FG3hupr5DoI4v?=
 =?us-ascii?Q?biODLCQTv2Jh9siXHJ1H2zYsz49KBCQ0mNrfNroH2fZmG/0rFQoYChT4e5el?=
 =?us-ascii?Q?QrcdDP4Uv76zbe8NilFqM4Bv5Vah+4VCzG57DtdhmMT6U8k4D11MTuA4GLox?=
 =?us-ascii?Q?suyNE3kUXsa5HPJW6KcuG5IA3YeY23vkfprpTkEZMPRHpD5PI3WKl2ItLwSm?=
 =?us-ascii?Q?lmtQVJtmfr4ZkCjjtw3FuGv+ckaOc6wJ/8M64EJjg1gFFeWWuW+LZ8joMzjP?=
 =?us-ascii?Q?f0L1PAJ1axISr6L+L7qzqNWCS4gmgNBXAQmDtGUlOrgNzZoKy78Q3uOsXwH3?=
 =?us-ascii?Q?xVBeUNln/BXj8V0ncEC0bCty+8hbSyqqwoM22rQW0VW6steyUzi5tH8fpGiD?=
 =?us-ascii?Q?8H/BlwPLni+iL01PX+t13ZQvi4yXmMHGMOBnlLozMv52c7rPlWuGTQA6wjfK?=
 =?us-ascii?Q?6LQQEthLPD4DcroLqY96rd7AKqqO1QCeiqH0sScIjlRkQ2dKtXVbdlS1zy7g?=
 =?us-ascii?Q?YS6vz+mT+cu23NBIYs3LXNzBjo1bbqqmVQqJWVXxA66AwDhugWVQcQ8RIVM7?=
 =?us-ascii?Q?mgYvrI+o4ASTu7rHrryFeF9UxQHMeyf+y+wa+CFQcitwUGd0Rj2IpGu/7zTn?=
 =?us-ascii?Q?+CsLaZ3bCDwJVQCgqUHkzBOuLjoDJj4mJobBBNbma+tibaen4IMEu9c2BYcd?=
 =?us-ascii?Q?fY7cxUzLOjF/emYy2gdtReQOkLJtizBAiYphusWEKpBS28qUKQu98TmddGGj?=
 =?us-ascii?Q?70cEkdk47TgSd90X1pqYBTilvIQLbfW8S8LmX5eyRIspYWu7hcSfs98788Vs?=
 =?us-ascii?Q?GR9E4T+rTRLFsWZIhMf+u4pfJlm+ITDxpP1nLoWHd+K0A8qaRTpp5v8GHuOP?=
 =?us-ascii?Q?tdRWL46EB11DpLmY6L4SPOBrI026pxh2hlO4lWRiAWuH/NSd2AtHNOrAZzDs?=
 =?us-ascii?Q?LwSaMD313y/J8N+uBvje4YsGlTGaqAYHV39DmNpYdB/WmsTCUWbUpm0Vhx0C?=
 =?us-ascii?Q?5TS55W3bxLzHYJfWWh5CPjowAZhp+vHmvLVAwengVGJwAMeiZbyxp+muw30l?=
 =?us-ascii?Q?Gg1qzyo3IF6CMoJGnnDW2v45GDOn6Cad2Cy/o81JSl0qNKHaEouqtjc7lCs2?=
 =?us-ascii?Q?U+5+OxrHBb77cq4KwS95vuqn0f08i5kT2xcA/SdGDyPSai+hsaOq81Wm2O56?=
 =?us-ascii?Q?N2jPnfTm5vNSGVLPMHSuL0UfQE51qip+R5Lt1h/8uuFNNNowWsYhrgYgiUkD?=
 =?us-ascii?Q?qvX8rdK3oV5tF8U1lo0VM1yrZu4j5NW74ymanBB0juolHIthARENxPClkc6h?=
 =?us-ascii?Q?aU55kgkwhjrPqRy4y5IGmAt8XXFpETMWtFjVQPE6MWDajmJTEd/gGG3aK1jh?=
 =?us-ascii?Q?7LV4h732444m1n13PEiQm5snuXlCACiEVVWj9shtrnv9tc5QEGneTd7jblqV?=
 =?us-ascii?Q?BSaQa9oX6ANGTPTjHTKXGoaujyOp6i1EyxXolBqFl6asCS+Qw6Vw0m42aO6J?=
 =?us-ascii?Q?OWSI9tm1P6JLmFuKmsXziCnoAMFvUWCKXR+5ruLLhnJ/lrWHDY3SMdD815R/?=
 =?us-ascii?Q?orThEqlHjov//ql4mIiwWKSxcjIJslUB+fq0lYDw1geg1TKQ?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316ce53d-06b5-45c5-943e-08decc3794bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 06:13:42.3793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scBZsQ4wbxaA11RZASSHotHdUziyhCYeAoEngbM5sW3etRQMn7MY91ZCnqkACa+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9513
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcPVugd46fXCHntff97yqRzDQcEFHG/KzWshHA4jV+I=;
 b=eATIpJTomLwmQjpFH/C7HZEdRg9OsLclBnIvHUstzAly30K461nmn/Ok8zp7gl0/lN2SPqCp8/JOsE2R9L0PxkegsFKdrpGCAOQU8Htb1uKRGoMZ9zj6rA5FOikmptipkxQ97tTg7CP7LiC3Yf/akCwQWbtUp8NV0GhXEj7kIl8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eATIpJTo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bootgen: bump to
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

Hi Baruch,

> Hi Neal,

> Bump bootgen to xilinx_v2026.1 release.
>
> The following patches are now included and can be removed:
> 0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
> 0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
>
> bootgen xilinx_v2026.1 now requires C++ version 14, so the build command has
> been updated to reflect this.
>
> Add dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_5 as gcc v5 is needed for C++
> version 14 support.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---

> [...]

> diff --git a/package/bootgen/Config.in.host b/package/bootgen/Config.in.host
> index 0acb58dee0..151d6ae0a2 100644
> --- a/package/bootgen/Config.in.host
> +++ b/package/bootgen/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_BOOTGEN
>       bool "host bootgen"
> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14

> This is a host package. I think you need BR2_HOST_GCC_AT_LEAST_5 here.

Yes, you are right. My mistake.

>       help
>         bootgen is a tool to generate a boot.bin firmware
>         for Xilinx versal, zynqmp and zynq product families.
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_HOST_BOOTGEN
>         what is included with u-boot mkimage.
>
>         https://github.com/Xilinx/bootgen
> +
> +comment "host-bootgen needs a host gcc >= 5"
> +     depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5

> Comment is not needed for host dependencies. See manual section 18.2.4
> (Dependencies on target and toolchain options).

Ok. I will remove the comment.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
