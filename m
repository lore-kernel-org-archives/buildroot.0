Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E8C3064D
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B867D4074E;
	Fri, 28 Jun 2024 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3sMZlCVtdZd; Fri, 28 Jun 2024 12:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FF840744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1FF840744;
	Fri, 28 Jun 2024 12:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB6941BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D64166079A
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uACuKWNIT7Z for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 12:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::600;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D7FD60829
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D7FD60829
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D7FD60829
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 12:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxgax+uQ+XEjlGwjTxSXGWwAK5hVQi68j2TYprXdZK+x9r7m9t6d4joyxTtaJtOK3dv036U3+jvJUOOwAdbKpgwoPBtSo6PBq3+bkQnDQC40/v9ZdBFmIqaWCYcZA8XLc3o0a7zURHDfMWnSWw/crfqqQH10+SOicx7REmYBN256lCjOnGuWzFlYfPmPtHddXKaiVCWlez7ikbP+ySPUAyWN/ux6ZUdFubMmS9H0m55WonvozO14yX50WBn6Fxdx5/0T6+0mMqnmn0cRQg7iIrqa35nj6FBGyRq3BUIhLjSqrKTTRsNPO+Il/yZlQ9aDggLdNWakHk232jfjaAYsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWJwZqI2Z65xFQbkrhyy0qD1ivbFvYCf93HBhfgfyXI=;
 b=NKPK/16bSPV9xj7U/xVC+PasLqlyBvP2cKiT2sCBatRh2MS4f5MmQ72HoTxMzssJL2Hk+kKCCLiO1Iouwu/JMfjoa1EgO0nES5yz3auxmgqZc6qAYOxGLvQZ+GnNEGqn79Jm6EnGIZtWcJH5oQnWrYZjiBk7lARrTDZ4uXHgc6BUL6ChfbeslROE1fwDQcqr5iqO0zwixN1opdcpIrgsqBs+oB4FpM6LjezW0sNFK8AcUsY34xnWFOE4qD4qkju23XG1jBisHGkgznbDOPhEdj267JP3KjhgTGXa0v8pc7h2T/PbXz5p4bHhg2GXWwGlvq5To1Klzi0iQPgPfeyAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Fri, 28 Jun 2024 12:50:05 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 12:50:05 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 2/4] boot/xilinx-prebuilt: wire up xilinx-source
Thread-Index: AQHawVQOdCpGIchNR0WnrmJjJXRHpbHc+ZAAgAA1IHA=
Date: Fri, 28 Jun 2024 12:50:04 +0000
Message-ID: <CH2PR12MB5004CCC69767D34B22960706F0D02@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
 <20240618074922.3555070-2-neal.frager@amd.com>
 <20240628113236.6a9d2448@booty>
In-Reply-To: <20240628113236.6a9d2448@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB8289:EE_
x-ms-office365-filtering-correlation-id: 3096907d-1086-46c7-c0ac-08dc9770d53c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oTmP2tuVo3AnVxmF6PVpwE9xBiK9fIiWsIB45D212TG2mQslIvi6dgqtIh9Z?=
 =?us-ascii?Q?VXGgh+7jOs30sAVzl1/z0zQ90nfJY5zwctMmmNScjCRRpQQHwR2u+pjhHbi/?=
 =?us-ascii?Q?qnCpbV8lUcA/LjOk45D586l/emvMl6vk2zsKj9ct6eUHwMdowXRaITBTryWq?=
 =?us-ascii?Q?B5prrmG3AzGhmdIjA+XtpPcSMjY+9ui+w2oJA9mDkFtlhSS16ISuVC6z3aXc?=
 =?us-ascii?Q?5R4gPR76w+28eRxlMs0d3GyT9rLil9OZ8Os8rEEILmXdzEnYXEyAXjIcdXBT?=
 =?us-ascii?Q?a+gW4BhG1dvJdkOSxo/IoaxvEHUDMm47mcuHf1pOrEMcp2CJd9lwWlUTzMBS?=
 =?us-ascii?Q?7YOIXa8mMG/CB+I4dCPA2JwbM+9bzg5aJl9AGg8b4pEq26/zfuhnPak44EBI?=
 =?us-ascii?Q?tWoo3W8B6o2YBnc5ptQ3+E4zN201ek95C+igKp1TIRC3lxQANMbboww5m9hg?=
 =?us-ascii?Q?PewAx4avKxXTYPMqIUQpfrpFBJC6dzbohAojebHsAks46xMim4hG070OBtGV?=
 =?us-ascii?Q?6A0a56UK79jAT+yeWMDLfYUvGq2poW5wabSAhOE2zAtBQP+1xNt+RxiSHWUZ?=
 =?us-ascii?Q?aiNaA4v6943bHIHwwGICJOG+QxsdoFBNUiIpYEMvQ2aO1FL5yG3mdGWmYvo/?=
 =?us-ascii?Q?zjFrm+BQrtHIIvFPP0SFV+2voFzDHM8xPCAL/MkautyNNdiSm/nMK6fBsJIa?=
 =?us-ascii?Q?x7LctwAPNCnHECuTBfXIxvwn+eJJJDm3DWySJRjK3KVsxlYUmvUXMkUbZtZE?=
 =?us-ascii?Q?HUsYAKtSdCr7C+zZtu7jlN4WUJwDsIVE6bnBMffKhsUZWnvCVyNw7vmYk+vS?=
 =?us-ascii?Q?74Ahtf9QwD8jvbHiNT+tgYx7JvUHfRypGNLSjT9VEEik0bXyoNC7pszKftI+?=
 =?us-ascii?Q?DghZnA9SugV1FamqsSjtTfFMQgZSQmrrq2W0UxguETqbUqZ9TpfU0xOoOW4e?=
 =?us-ascii?Q?VF067JTRzifTkGFF3DgFnmK+IABPkH73DkcyPg023I+jDRkKgNVFf1QWiVd+?=
 =?us-ascii?Q?eHrNJ55cJTkfONzxl1WqeuX+7YZN0Ao7BCk1IelZa0fimgHEzi3P+UZGNVPg?=
 =?us-ascii?Q?1MfHbqJ/OiJJ+4zEdRlQPTc5SPAu3UyOzhKOKXzIDp4Q5bICUj/xM7hM5hNN?=
 =?us-ascii?Q?w4n5gtGWLW1HrV+vfMPmo9PHSZhX42Izn0tXnPWUwBmtau6Mf+qZYhYGmd3D?=
 =?us-ascii?Q?gIZAxbKLn2HcWMq8TIBEwytBA2/t49O2ii2N5gNkVT3APZTCvv1EtfopjLga?=
 =?us-ascii?Q?PAIqA88MWXAvv+yFKDHHAOcz96tVnGq3MHfX+qlHFckz0KdaO4GlbWWmnzXA?=
 =?us-ascii?Q?3HSs4GYgeUZEw/gEDU8I/4Aw8wgTaWmjghros169Mhulcg0gngkrm0eizV6P?=
 =?us-ascii?Q?MMdlEREOmnOR1NCIzrgja0jtFVcktDuXkl6e1+hrwFvVDt1bFuxjU7YOP+g0?=
 =?us-ascii?Q?KqxdE+tqd1s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gemGj4E5mexSGxXWK+z9Q2Eh2sCd9YnNJiI5T7ww4S20YZhU1LQKx8+aMUcW?=
 =?us-ascii?Q?oRzGP485NPzor6q17VuuM5mMt4zbrPBJA5qMNiQO/Kkcr5KKXuAaTVjG93x9?=
 =?us-ascii?Q?fl94xcDm9/6ucYb5NH5VbKIPqmYCzJkvjbtg7Q0VeVFmrKFaHTHlyBSXeQIA?=
 =?us-ascii?Q?sUf2/kpcilonGyQBwm9aTuhk+C+pasnQqMGDItce2cYGDo0qrIqi6Ke9ui++?=
 =?us-ascii?Q?bYUjEOMKLOvvIxMBoaRvqWLF0Mey5em1CtheGHlprq60JkT6Z49JnIhKGrUq?=
 =?us-ascii?Q?bYolXMO1XFWqAHzB/RDrzv+CcH95K8UQX5i9vUQCLV6LqIJqrFwI+L6C9lw8?=
 =?us-ascii?Q?MNMLsFmgvTdoLCXqgl8itZfEjvnsbrxNKfuSPl5Y8PACN9Pk89/OiknjKBMI?=
 =?us-ascii?Q?a6Pp8/dkcq9k8ORqzT0tnTsaCNvo3L2MAYCeEPw7DUlny+y9HusYBFldqh/J?=
 =?us-ascii?Q?vL32OQ0a+rQ8tYyJuqT5c8wBYop90oPrMfzoG952vMasVy03ZTAU3qCf9RQ0?=
 =?us-ascii?Q?hIkfPJ0NT9Am17BYzwt1wu0n79AJEfThsVpyoSSkXg2PdgCGhoTRkPx/5/S1?=
 =?us-ascii?Q?TKzfWefufZBiynRIdn9pPalMCID2ErEhifACxH5qVlYdTGsZPfqZ1EFcthrL?=
 =?us-ascii?Q?TBChSdr+TqYFwmXila6EAfLVfUuTlrvxwHoIjPyJJWunyuHJ/4XwBDhtBeiN?=
 =?us-ascii?Q?TgoAxH4lpSmPhNB7NYUyRVntGmYLcqIQDurCYo5g/6rEtqiyTKwd/VZvTRdw?=
 =?us-ascii?Q?zY2regqRyYOT7GkpCfB9dE6AknFrlZV0iKDWA9ljOqpItoN3VuZjeZbKcMqN?=
 =?us-ascii?Q?VwOxnX/htJhpP0fI7UtubeugMDWBervgF5xqyyxLynKRnTLzgWgB8rplacL3?=
 =?us-ascii?Q?pb2zshkgA9WD68v7NK3ww3SdWFeps2zG/TIMS+wPoPrt/+c3b1pUFJMqYWJj?=
 =?us-ascii?Q?y7VR8dySZ74n5/RuN3s4YFA9BkJQanMb6H5q18YnUGqlWlRlgnhWws62EY2b?=
 =?us-ascii?Q?Xl8D6e0uX7ipLeDgn2cehq/vyj7vbrXMwqWTzBncUCkUhj9nFilS0jaHR0Zk?=
 =?us-ascii?Q?9V5qNbefe6N6eziGr1y0svLADNwHmvhCNQa2nds+ePw8ZJUfiMglSeeV6/zo?=
 =?us-ascii?Q?zRwJLfUKDJ49Zivcee2NaKr10LpZ2ve/4kS2gyWWuYOXECQCsP4zUbDHtTVu?=
 =?us-ascii?Q?5/suzG+QHaW29YKJRMH0BZIRuSmCehvMc7M3c7dRD04ACoG5G6XDJWhKbkAw?=
 =?us-ascii?Q?4CrnCTLt9v8Cj9M5e5N2vZBBKMazVQPx0w6lQSR1NcY7eAftThdoXS9eDzQS?=
 =?us-ascii?Q?jtep8JgJOfdjf0kgi09SNm+SDTJD/OKTB4Ydo5ulVzi3wCF+jK+ww6Qz2kLg?=
 =?us-ascii?Q?prImNS8m0WKVMh1FCrT5R6ZRuzOxpbfygdB/us4M/dfeFEJJYI4OHbINr0mf?=
 =?us-ascii?Q?QohuEoQlw4NiJbRsrQ7R5nVhApKbXZZoSAObs2Q458ZSn8CyL+ah0Utbckr2?=
 =?us-ascii?Q?MM+nTM0kmjDqzEcEEiu8dB3stF3VUVb2WOeiBisEi0ejepw4VAYHsyDpZIgk?=
 =?us-ascii?Q?gGeAAgYyujXFDc9jawE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3096907d-1086-46c7-c0ac-08dc9770d53c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 12:50:04.9025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qynuJE8JPQ5mpRyArr1cRycFp1F79kISAA70kFYteJQUDCvgBQqh6SZn3pJBrDre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWJwZqI2Z65xFQbkrhyy0qD1ivbFvYCf93HBhfgfyXI=;
 b=ot5b+A/RZzbZDn3J82ljhNe5O5P0ldDQEQTCeED6nQn4+z4k8ak8YasT6Clv2+VS/vXWJYHUnKj5wwDrD+j2fzb6gaszz85uUfRQz4ljQ/qOwx8oERMVbGDZt23qPwUpJ2CweLAH/qX4/m7eKVdM5K6I74yODaelU61sda3reUU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ot5b+A/R
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 2/4] boot/xilinx-prebuilt: wire up
 xilinx-source
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch wires up the xilinx-prebuilt with xilinx-source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V3:
> - no changes
> ---
>  boot/xilinx-prebuilt/Config.in          |  3 +++
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 13 ++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
> index d3df1c06e7..34b89337fa 100644
> --- a/boot/xilinx-prebuilt/Config.in
> +++ b/boot/xilinx-prebuilt/Config.in
> @@ -22,12 +22,15 @@ choice
>  
>  config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
>  	bool "zynqmp"
> +	depends on !BR2_TARGET_XILINX_SOURCE
>  
>  config BR2_TARGET_XILINX_PREBUILT_KRIA
>  	bool "kria"
> +	depends on !BR2_TARGET_XILINX_SOURCE
>  
>  config BR2_TARGET_XILINX_PREBUILT_VERSAL
>  	bool "versal"
> +	depends on BR2_PACKAGE_HOST_BOOTGEN

> Is this bootgen line unrelated to this series? It appears as something
> that was needed before and it is being fixed now. If it is the case,
> then it should be a separate patch.

Yes, you are right about bootgen.  I have just submitted a patch for this
in order to separate it from everything else.

> Also, I don't like very much how the "family variant" will look like if
> we apply this patch. Now if enabling both xilinx-prebuilt and
> xilinx-source we will have one "family variant" choice for each. And if
> host-bootgen is enabled, the one for xilinx-prebuilt has no selectable
> options, which looks very weird.

> I'm not sure what is the best thing to do here, but it seems wrong to
> have two selectable variants where having different values does not
> make sense. What about moving the "family variant" choice before the
> two packages and use it for both?

I agree.  Perhaps the cleanest solution is to create a versal-pdi
package.  Then xilinx-source and xilinx-prebuilt would be mutually
exclusive all the time, and if xilinx-source is for versal, it
would depend on a versal-pdi package that downloads just the pdi
file.

While this adds a third package, I think it will probably make
everything easier to understand, so I think it is worth it.

> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index eb78ed10cd..4cb3e2a33e 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -18,8 +18,17 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
>  
>  ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
>  # We need the *.pdi glob, because the file has different names for the
> -# different boards, but htere is only one, and it has to be named
> +# different boards, but there is only one, and it has to be named
>  # vpl_gen_fixed.pdi when installed.
> +
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
> +# The plm.elf and psmfw.elf images will come from xilinx-source, so only
> +# the *.pdi needs to be installed.
> +define XILINX_PREBUILT_INSTALL_VERSAL
> +	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
> +		$(BINARIES_DIR)/vpl_gen_fixed.pdi

> These two lines are a duplicate of...

> +endef
> +else # BR2_TARGET_XILINX_SOURCE_VERSAL
>  define XILINX_PREBUILT_INSTALL_VERSAL
>  	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
>  		$(BINARIES_DIR)/plm.elf
> @@ -28,6 +37,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL
>  	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
>  		$(BINARIES_DIR)/vpl_gen_fixed.pdi

> ...these two lines. It's not a big deal, but I'd consider defining once
> the lines for the pdi and conditionally the other two lines:

> # if BR2_TARGET_XILINX_SOURCE_VERSAL=y the plm.elf and psmfw.elf images
> # will come from xilinx-source, so only the *.pdi needs to be installed.
> ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),)
> define XILINX_PREBUILT_INSTALL_VERSAL_PLM_PSMFW
>        $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
>                $(BINARIES_DIR)/plm.elf
>        $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
>                $(BINARIES_DIR)/psmfw.elf
> endef
> endif # !BR2_TARGET_XILINX_SOURCE_VERSAL

> define XILINX_PREBUILT_INSTALL_VERSAL_PDI
>        $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
>                $(BINARIES_DIR)/vpl_gen_fixed.pdi
> #endef

> ...

> define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
>        $(XILINX_PREBUILT_INSTALL_VERSAL_PLM_PSMFW)
>        $(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
>        $(XILINX_PREBUILT_INSTALL_OTHERS)
> endef

> Luca

This problem goes away if we separate the pdi install to a versal-pdi
package.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
