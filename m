Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA663E77183
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 08:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B35884AED;
	Wed, 18 Dec 2024 08:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kI3vy-G-Q1us; Wed, 18 Dec 2024 08:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8301B84AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8301B84AF2;
	Wed, 18 Dec 2024 08:12:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05804E3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2606613A4
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwDohs1ext17 for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 08:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::61a;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB0B2613AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB0B2613AB
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::61a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB0B2613AB
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUuzJT9PKcAJS7yN+JCXcAobCG3oCz1wjIhXMNyQgSPVlxsNW3/hZiQMLZqSG7F0QKK62ChavwEDqwGfauoLsQvZV4T4Tiu3SWbg/52a+moJDdAGpmPW5WIOjZxeve/dYV7Ji49++4tRPjN3eGcpYvoSjYM9uCVueNnzXmUmEX4+fbmBjvkjOX5TTvZ+fdEhX3V9EzYiTxjeowzaEs+4VrGObEDDdjvKjr1dwwaDEkdjCVDsJPNvfqCaRWhj09cvPBmpeVXQedh3MOGhnHYnzG4ShCcqqe1Jipu4nWDkYAog3KzB2AHq/r2oO9llwOJgJ2WbVybe5ksu84dm+D5kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZtPEtMgAjlWN4H4f25kWNYP6zW+whMG3cozPBTzSro=;
 b=QWhfdH0J+xLIhQg96UQdW/pwisTZL+yqT/Igfbpreb0xrbqfm78B/Ypb+/DR4H/Ryi84+rqGPKo87ZqQikZviFRF+nQWg3ccYTe6RzG/E9ihLCtQ/dY3NvzZbnbzXXFvLISWbN3WdpHHgiLIaaMbjqQ6LYGGkUSTh/XcapBrhakhrqH8FWKtpo8S+elay9wpG9PTHnhcyJ8E9jKIQoTtEj73R4cTKkVgfevIGaiwhSWTZn2C4GooxPqw/PT5jwYW/RjzaHK5d5APg6KJSt8oLgL6jsSGwe7W4m9Dtp6z9ocSsQk+dIm2swRAQwitLcLcWtzmoBRmdZB88kqkZRev/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 18 Dec
 2024 08:12:06 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 08:12:06 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig: bump to
 xilinx-v2024.2
Thread-Index: AQHbQkSKtlWfmoUmN0SctSPGEEbRO7Lq0m+AgADwB2A=
Date: Wed, 18 Dec 2024 08:12:06 +0000
Message-ID: <CH2PR12MB500477CB18DAB3EF269AB9A8F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
 <20241129095304.950313-3-neal.frager@amd.com> <20241217184539.3f3c0bb4@booty>
In-Reply-To: <20241217184539.3f3c0bb4@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB9525:EE_
x-ms-office365-filtering-correlation-id: 5eafc56c-74db-4dc7-ed05-08dd1f3ba953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kKnb7IISofBZM0+Pc0mx9FKuQGODVMgDbjLWVuXN3Yl21EkTnGA4fZ2t/ZxA?=
 =?us-ascii?Q?UHX/9O8hyaylkKd7oARpEGQ4S8AvWZo43wSue5UfY5O6For6Nu5O/8dJdj5t?=
 =?us-ascii?Q?c/uItKPdyvH4iNENXtYyyfOObQ9gYZ+UfoNhchEto07m5lGvucLYg8henDbW?=
 =?us-ascii?Q?ec8S9VtjiG0ch51IHPd1zytEb6byO81TfYgYEPFMZvO6bNKFehKKIHIy7609?=
 =?us-ascii?Q?DphhXJTEWVag4VWtq/jwVlpBB1sxVisoidMHsZY5+WSi/zE86G7U7yNjJQal?=
 =?us-ascii?Q?G2kSYAnOctlYKctHgYx/lQPttuYOnBzOrnmAmJ/z2mo8MWW2q+MM46KXZCcn?=
 =?us-ascii?Q?xdJE9hh6SHuu0R9BqIy58/p5QxivqTlDhj2hwKPYIjAXPM4PrtM+6JFt1HcZ?=
 =?us-ascii?Q?+9mI+HMJYwQry7iyCJBQcWdyxQQ1xybymkPV9EG7waM3x4NxQ+EPOR+OgSvW?=
 =?us-ascii?Q?5hUXu/a3HNItXtiWtD6oqKn1b0aoqD7KhOKJp0XiVn0rNu2fuSXtP8TKY4vT?=
 =?us-ascii?Q?AU0tX70+Pe8ICp6aT459Vre6pkoy1EA5dVCfmgAcXJ2C7sNcD8UuIE2HqHNt?=
 =?us-ascii?Q?MfXeAfyC7YqF4STCUk1qdX2Nap6d7mjTeuGJCqOIjXjbOrFhvpfy9cMTeJXA?=
 =?us-ascii?Q?Xkuvc8SufJH/svW3rbUd/GgRjPD6zuMAiCumsSXcmz785iBf/MNTQKsSJcwp?=
 =?us-ascii?Q?BZDW5V4qlmgd6EPBByCIBe4fZ8DA/+lqNeYDHB1PAh29OTcyZgdB4F7OddnR?=
 =?us-ascii?Q?jk5cpzW/oOIL8vV34xSFtIoHMygmLS7SO+Q/B91XqangWBZC2nuY0t5V9lZO?=
 =?us-ascii?Q?/XRFReWPtGcs7Dbg/mdrXo3DEpW7vfXrvNMqsHWqqhYD8DNrmgHPCyoYrMay?=
 =?us-ascii?Q?8fPqAP5Zir2C7AOCUgUSolWsqe0Ham186xD/ZqdMKJ+Q45laHR8T0fGUVdde?=
 =?us-ascii?Q?IWqV6ZDU0m3AJJJBB2kSFzG9sb6aO3NIOzBymuNa0nVhCg8BbKglvD9rMEJq?=
 =?us-ascii?Q?MHCQDs+8JYCuaNwO3P9L+NOtHOH2+xL8IyHhe/tNtQ0cGIKEd/am9wMVgRQ7?=
 =?us-ascii?Q?C9s6uQvmHuM9fbpCj2twwCFCE/+9UYk4/hC6oKDFX9JJLaIadAdVQoBPbv/Z?=
 =?us-ascii?Q?MEwhFh+3SJcKbRai8Dj2gBBCEPuQfEhbaEz97+0tfL3fhIOuVYyCs+5b/CXs?=
 =?us-ascii?Q?RhRZ3Yc2ukwYduv8z6kD5UsStJFOsPUVtMeo+GxofCpe3G8xdhI/8tQUfeZR?=
 =?us-ascii?Q?AEqCJX5gaKwDOnnuoF38FO32A69WCtAt6WueUr7Xuidnq0jYjwScOqBlBi1P?=
 =?us-ascii?Q?7iuKp6YNqnkWhYB5X9bqOEC+jbUtt8wQeN52WuYlcuuqcloYd1eKvmhdzJXM?=
 =?us-ascii?Q?xDdMXiuOYQepMmCJghMRUDrbG+j2uxSiAsk8X0foou/9DP2/LdkSTG46Sa2A?=
 =?us-ascii?Q?xZqH1kLwGFuiBKcTMuxpCUOl6YfpdnE8w0i8P1IOZWgq+brXYOLOJA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uAUPDKCCexXU32Lfpi3mPtM25CPVj6OyVFgM4eHCM7bL6hxIieilgzbsF+jC?=
 =?us-ascii?Q?ps/L6y4fAi/Wo+vHGR9fn1UTSKNN8+sPa7ulNPtZsTEXPW2hj/xT2a13NoLl?=
 =?us-ascii?Q?0V1dmMFtybyQxxyEnYbQRVVADYz5/5MDt+vOrUDHx8jcijMf00zdgk6AI7lB?=
 =?us-ascii?Q?n8+DRvAoubHoBC69o28hHGi6RGYxd7OHIDFYz+OkVRkAoQx44I/DeZElBLkn?=
 =?us-ascii?Q?QKjhrDsvjMb+yIDe9xBlI+0UwPOC98I4xfHCf39ODJrsU89oPrUqavEOdbK5?=
 =?us-ascii?Q?T6ItOY5qvFUoLRqNTwN+wtlNWB8P93JFzWulJhWFFCw5FW5ZwqEA4E4CbUmg?=
 =?us-ascii?Q?aigHmWOlMyAnYNZ5/yffAwbbrN7PM/SJER4v++7Fl3ZbECiJjQQIjeQbPHcy?=
 =?us-ascii?Q?ULrqvYoFYMgMAjGF308WdTv1FsCRgcxBnYhla1I4FMOh4p3smfADmQRMwgv+?=
 =?us-ascii?Q?PwpyVROoy2aXqLh+mhqxvhWC3YzpComamLhqZUlQpp9DQExPjaIkRsGCqZgh?=
 =?us-ascii?Q?XE8GGKhnAfR24d6PCs1osOkaNAdPuXvjI3Y0od8KlkGwoK15c9lvEjR9UJhY?=
 =?us-ascii?Q?EalTB0gR43ihXPrP9uHqNlttWTv6pHiSiNfplOxhSsmFfoPNzzO3SOwB4l1a?=
 =?us-ascii?Q?+/Qcqif8a5LpR3BmVFCIb17H8IRQUvuL5wSP7unUOAj3K6GSdHQMK6vvYLd+?=
 =?us-ascii?Q?efn1+rqShaH0GRCXNhfZabYCqkc+osfHk32OKJonGiUG2GtHyUtj/RLXyv0Y?=
 =?us-ascii?Q?Ve4zNBmL2UTXD0QBBR5cHy9SAUFDyzlNGIMsbvAHqb/pOOIEXegi01E6uf1/?=
 =?us-ascii?Q?GQNyOp7q38G8sUjUfoJ5qgmc7WyJ+7Gm9OYLiiTAVDPcbRUO8Mz+M2w2baNL?=
 =?us-ascii?Q?j0GfdMBslsJ+tuhl7pSbo8ehMOmKqp0nJQx8yfSZEWtCqjGKWvgBcWcRK6gw?=
 =?us-ascii?Q?ndKu6Us36/jMtkXYaPbsxMQViQija1I3qtyRsXa4LXGlqgrAB0cRsfUcPYXz?=
 =?us-ascii?Q?p3nIFbZqN6PT6pe+QZDaL4Ue3r1fyTpLqWaKlFjPVWZyzQwYuHzyYiwBV5uq?=
 =?us-ascii?Q?bL43tzvIpV7LzgtRB2mF1bHO/0GbpcL1EF03Tc1Tuw4bNlAgU6Sbb5ko/MLd?=
 =?us-ascii?Q?H2jgJCWQysiVvt6GUp1TRhey4AF0xgH0S1AY36VnO30rTIaK8KEiI0IBsiA2?=
 =?us-ascii?Q?vVIRMUlFKWpRcP9lum5nxMe5GmTrhMn+UjUOtauNz1t3nDqbSNTNV3T8WMjo?=
 =?us-ascii?Q?ZJU2YxUF8cSRVZDcU9Ywk/RLRxZjnEJcbTtODC8vEBwNfvXvMex1zWpLMVex?=
 =?us-ascii?Q?ozu0BbvJEtxdv1rlIkpGq5pjPo++4Hq63YWiy4kst8uvgz3XIhWZ6HnvQtzH?=
 =?us-ascii?Q?VbmlwhNQTLK5h/knMBmPmL4+kRVG8QEi0SyjhmOHDmFgXmksvDqdK8TfZh/W?=
 =?us-ascii?Q?nu1AEVTLShTO/RhyitZdGjQg9otmu9h/rzM1Lku7LwTcb5JIqdc2WIuktapD?=
 =?us-ascii?Q?RcuDV9RW5bduMTUWZjU3QLXWUQVAF9oLEL2NIHpdvY3yJVOYQunI9b1wWOGw?=
 =?us-ascii?Q?Rx/+2XHrEGbreu/vdF0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eafc56c-74db-4dc7-ed05-08dd1f3ba953
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 08:12:06.0480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XmE9TNVO5+1T2RGEu4b2VTLxInXvnpxAlq7pFCBEkzV1hNnFeM7mdbspNtrbolSz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZtPEtMgAjlWN4H4f25kWNYP6zW+whMG3cozPBTzSro=;
 b=ERUrN7G5k3D36AIs1FenWivt7cZmk8S6j4nTHmgewOqoPm+YGGGz3pqlY6c65kk/daDiT5BG4nTFx6ds1mRn/dUgveqsCtz7UC82FDOeSTOnU2nrO4Mi9TCJnj0LtQdycA3U1hsq/xjozgQ6iISXzy6u9DNTLq93+NzDHNyOCa4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ERUrN7G5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2024.2
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

> This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2024.2 which
> includes the following updates:
> 
> - ATF v2.10
> - Linux v6.6.40
> - U-Boot v2024.01
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I noticed I am unable to boot a Kria KV260 Vision AI Starter kit after
> this series. The symptom is the boot process hungs after:

--- snip ---

> I tested the following versions:

> 1. 2024.11-rc1-36-ga6db4cde0fcb (just before the bump)  -> OK
> 2. 2024.11-rc1-41-gd33a2cd51a3f (just after the bump)   -> hangs
> 3. 2024.11-187-gf97b67be7429 (current Buildroot master) -> hangs

> Steps I took to test:

>  git checkout <commit>
>  git clean -xdf
>  git checkout -- .
>  make zynqmp_kria_kv260_defconfig
>  grep BR2_TARGET_UBOOT_ZYNQMP_PMUFW .config  # => always shows BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  utils/brmake
>  ( cd output/images; cp boot.bin sbirt.bin; dd if=u-boot.itb seek=128 bs=4k of=sbirt.bin )
>  # Upgrade sbirt.bin using the SBIRT tool
  
>  # The following three lines are not really needed: the problem happens
>  # before actually reading the uSD card:
>  umount /media/$USER/*
>  sudo dd if=output/images/sdcard.img of=/dev/sdb
>  umount /media/$USER/* && sync

> Do you have any clues?

Thank you for reporting this!

Unfortunately, it appears that our kria software is not quite as mature as I
believed.  When I bumped the defconfigs to xilinx_v2024.2, I only actually
run tested one defconfig per family.  For kria, I tested the kd240 starter kit
and it boots as expected.  I thought this meant that the kv260 and kr260 would
be fine by association.

I have just run tested the kv260, and I have duplicated your issue, so we do
indeed have a problem here.  I am working on it with high priority.

I am going to run test the kr260 now as well.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
