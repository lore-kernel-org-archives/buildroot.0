Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73AAC3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 06:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5693282194;
	Tue,  8 Apr 2025 06:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhWiWFBceZo6; Tue,  8 Apr 2025 06:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA616822E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA616822E1;
	Tue,  8 Apr 2025 06:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 269B31F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 036A881490
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfuAy6Vu50Nf for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 06:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::623;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2625F80FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2625F80FB2
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2625F80FB2
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnWaNuKo6O0OPmRN/Uj+AYPFiYwr9MXBL1EBIUc5oG53PBQjXHcOkenT8PlzEyRsll/H4SFEpmrsVWwCBhQTd4Qt1s55LSJ/msW/PpVXgSrM7u7i/8L5XHRvlvXRWH6b/VYKE1PlRJF6tt+wXBVzQiUkpi3c8LqpSANT7kqburuhbD4nv5fI3DqKmB9okA4E4OHeCnYQUMMKX3LgmjYWH6/RIdNEfMHKbdEMaNhtOZIkP7DXpcGUAc6UHBRWLReBXE5HmRYxMoSyb+X/1Qa/lncfn7tBTBN7ipHDnjN+1yhYzdPrQ+TYJWk+TmxFSY3scw3guJ1OOtThP6Fd5Fwqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlTEG+8VftPNGeFCKzUdYfr4XwHUsTZWlL5JnA1qU00=;
 b=reH3MK6vuCdZGRmyL58kXBFlwXoW6CPxrJPwmTZRcHgR6LcODJOgcTBT24Uev6CsedZwlOfwxJguly6qq0AsFlH9/kamLj2/mVapqOb6Zh8U+zb/udg4irZzQXbyXQYLEfsSOkcSqhxnfu6wfz9EWPpIXZ8sxLqbm9meNhipvqHx8qbO4kYcJlj0bhT8Ol7MqMeezbRmho6EhkbJJSNkOA0geqX06CnlW0HXqMgTYi08QK9N2KEgiRgPDHIlBFKrdK0QkU2l7ML9KuDcXj0JnTjk73Yp0M8yPJYwYgZZBvrvH08Sy47q9sG4a1+2kOc731BDG4ABpZLv22QTj8zXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 06:40:55 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 06:40:55 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/3] boot/xilinx-embeddedsw: rename toolchain vendor
 to buildroot
Thread-Index: AQHbnwnAsyh9xYkhAkKBH0vOKDydwbOZYqaAgAAAvBA=
Date: Tue, 8 Apr 2025 06:40:55 +0000
Message-ID: <SA1PR12MB56151490BEC4B0D5D05E8991F0B52@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250327111645.1430919-1-neal.frager@amd.com>
 <20250408083505.0a7ecfda@booty>
In-Reply-To: <20250408083505.0a7ecfda@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=7c5ff6d3-c0ea-49da-bf66-8120bef93bc5;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-08T06:37:42Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|IA0PR12MB8208:EE_
x-ms-office365-filtering-correlation-id: 4235bf46-c7cd-4ae9-25b1-08dd76685049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3Vh9OpRz/fdcS5vz5lb/yer83ekrLmnN9tHeBMB32upUIX7oLCBq08o3waZk?=
 =?us-ascii?Q?E00ZQhC+IRLjsYz4mkHpMCquf22R005kgALhXkeyku1aot53S9naSFNhS0ax?=
 =?us-ascii?Q?RW1XsJxAQ2VOHxwYd1uONjSdHjcnB2lw2Wchuu0hgXw7xE7nCZTNSWRXxzuc?=
 =?us-ascii?Q?2NzDp5ijZnwoqa+OEdZp+ZBecYRLk4J9xy5bfAP0InVktGrPywzb38bkbJrN?=
 =?us-ascii?Q?J6ewBxKfEVt0C2QqjJUhRHfrXKznX6NXP0bh0nH5h/mw1rEMxPkqWgFAEGpq?=
 =?us-ascii?Q?+vxFJzceraVGjEf1viroKrRv8ZQDqs0pGe30Lt1p4/7n3vnvZsRr9utvQRNR?=
 =?us-ascii?Q?MYW15cgJhshCOA+Tzi20XT8b0pcsq1LvQUWT768hhwoqxo7MhLy4Jd+yIdDy?=
 =?us-ascii?Q?hFLdwVQedT0BeaLXCZX7bvqcXT4u15iZHzrpkx7gL+qwJrnm5O/NQTpszdOl?=
 =?us-ascii?Q?6QlcXrl5Oy91Es2c3aXBKEAtoZ46neGLH5BVzczAWeRVCJgTKjc4CV8Cefh6?=
 =?us-ascii?Q?AWxUFsdfQJ49moss4uEjlltzE8NTiWUBv1uMs3PUrmA6mJAkxj2UTxnlrqwE?=
 =?us-ascii?Q?RAtgzbDHsAJBb64B0Oz4jwnRTXpviG2jIb02qlNx5a/tNvaHf+jEdv2iizzp?=
 =?us-ascii?Q?LeSKj14AYm6NMi3mDN8rjjD9Jl9uLEVKHFhFMq+tk7BYpqaJaL/5cXqUCom9?=
 =?us-ascii?Q?1+otb7MQwxCysZ++m/05cz8JyITg5k4Gp0aWA/ogMAQFyOt/mA/LjbxKVOAO?=
 =?us-ascii?Q?GjltVZjG+HmGkTmv024rj+hYCwwWLqUzRnCY40KShaxctauVBAcW66ZfGu+K?=
 =?us-ascii?Q?Q9YthQZ9glqmP+6tOGaIsj6vFVGATJRWOmH0aFgROK+h5YyxAp0iscwGZhe0?=
 =?us-ascii?Q?8aOMI2XUuPnBNKnJ3LK9g8KHydhb4UsSaWsmSfxkigL72kF0BlZ7eI6lTZ92?=
 =?us-ascii?Q?bcOLXo1Bqrw1uXeVzAjqh2YJDHOlS7Lb1yn+5WmioPO3vcMXvz/Ciga0Wub9?=
 =?us-ascii?Q?hzh3WlSZwLClThAWNcCqWjeaFQFehWGyF17RkVGb7mB06VDcqdEhoQ67PYhZ?=
 =?us-ascii?Q?j5MEWSHbfxqEdStyI/6197kt5xIw66II/EVUwNr9fjGPl170WRe4+G/Iq/hr?=
 =?us-ascii?Q?ofRdEcI58o+VQY2dg6N9CXFPDkKzT7iD0s5MHzyuVZI5uBI4gV7BjhQzYfNk?=
 =?us-ascii?Q?4OLpSquyFxPBfmATp56MVl0tPjSf6U44KjXJ0dUXswqftbbaFzVuLaTM7fyk?=
 =?us-ascii?Q?gE941T8t4fTyUnDJquNxkEpAYqE/Sh3yvm1NiFyhIbVKuGaOdhwYl0SY+ERH?=
 =?us-ascii?Q?V1il8mK3/VOByD4dsdEV4Q0FiG0NGBDaWxgmqftkctfXUksAbwJbJGLNU7j6?=
 =?us-ascii?Q?SDP0DP+KmDPyEJVShJN7u9AwjZ1PC4yf/jRBop04t/kevERzuz1rk8ciVHii?=
 =?us-ascii?Q?tPMC5AeBTha8DY43YHR22DN4s92WYMaFHzJU+RUHI2GYM/2mRIPQqA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w8EBbBy7FPdsG1/9L5gmAx8wyxdnkHaxgY81/6tjChPFG7ACoGCiUjsLHVJB?=
 =?us-ascii?Q?ts7ZPqPxcvmXIvysxdpjHOjpUtaTcUtPIgtUaxM4CN3FNvVhFwHT33A1jeY6?=
 =?us-ascii?Q?Bnk5/I5zT9i0GeO3uIcqHwXAO7UqMvLq8sux4H91f9Hzv+DEHagZ5AcuiAO1?=
 =?us-ascii?Q?Aoc1blwOvcWdxaY1cUFA3vOBkuiNoplfGepb0OX573/Oa/vT+L6r++oUbkcs?=
 =?us-ascii?Q?JgUhRT46NIyOXLzl7KBLvq+YcCuwvTdLqcSWR+j2uTqDRZ/nhHkk2uWU0R2c?=
 =?us-ascii?Q?nVWtzkQSr8wkDN43DqJ1fyd9FBc2ptJ0lnSfvoDKZvCYtRpPeM7FTOdJJOHY?=
 =?us-ascii?Q?HB+J8vOXVn9N/CCoGUcaseEfk+Mrt8cZvRbh6dNT1kbqQSqRSAjHXQIx1KVH?=
 =?us-ascii?Q?NQJ5FrB/kSl9w3RbKXTeSFtE7g/tSUupzYkSKZbWJ8KuWIQ1vkFq82muGC5U?=
 =?us-ascii?Q?iJxQagUwLZkPZ1/tvDdhtM+sDhJIpJaHhGpz3ZuCjIicbeCKdaguen3jp2cY?=
 =?us-ascii?Q?GNkVkgr0TMcl87tAi+UNLIBYbOsh6hbo+ms01wIB7jS5upNRDhIeMa03GNIE?=
 =?us-ascii?Q?nELrBTz/6nigwn35U2Je2Ml06jqg1XieV0fjxmnLmnUUqJVXj/6JsfA38x0h?=
 =?us-ascii?Q?2ivcbfrVAy9CzxtR4M7HHJM0XyerBR/6KF0nA/rDwt9AX3pvgrpjfYziEsCX?=
 =?us-ascii?Q?EZWOSCgaocdu6myPEAqhVqcuNkiErL3vTwbAY/Fit8R+y4kluTt2XgZDRGSq?=
 =?us-ascii?Q?YkauS/z7wVrFIIf/+G7VSwhFYDx76rc1jRAaTMVI0vgYT6u8c5Z5LZ8bxhBI?=
 =?us-ascii?Q?seNG5btuR1Z1VTWx0EFhtEcuugYOAToG0ha2qT5DrKjpVgc/cYsgyTAC53oE?=
 =?us-ascii?Q?pdsAMRFCU/xCL0e23NDumh4zJoxJQvplI8jEdrScUnForD2jg+Y11CUVOvMu?=
 =?us-ascii?Q?UUvdKtc+tzxc9r88jkaicbrSEo7hdiVWuPhYl1Q15qZM9A8D8KUAhx+2sQ0b?=
 =?us-ascii?Q?CidLxWmjWItNZoNEq8U1IXw5FgT4CkkOoUzKTy7nVl62LZ9ceB24PHyL7Vau?=
 =?us-ascii?Q?az4wJk4GcmrE5tMV4TiXLY3aWuxxdjNhz5i5cFJjC6AGzb8pMxjgTlJ7Sd8e?=
 =?us-ascii?Q?crIoDQAjNpf1ueojvX5+PTF39QmSZZdOXc5jR0rt1P/OrhDmr3PX86NRkZWA?=
 =?us-ascii?Q?tC0jw2Ui78sec9G7NIaiWOC/DibSp5t+wZQK/Ubj8XOo+FKjz+c6Q2JCi6sd?=
 =?us-ascii?Q?xV0dTk0QCA7trLPSfTPVtEYC412O0f8/XRHh+DTdgCBOrxOzMoIqYI6afBYK?=
 =?us-ascii?Q?2vyoKfZSAMLP6HwnuKdTUplLYb0DHIoN/wZPn2WefHH3fH2Zfd5zax+LZO6i?=
 =?us-ascii?Q?186L1xyjue69yCEx4j/NcEfIFAODep+23xg3+RhHSgf+8EJNq2eUkVTHk1WT?=
 =?us-ascii?Q?LhTumsflSA4wI9UjHkf+wB2zv6UU7IGCW25/GBe4MwOLgT4ctcGIUmzatZDS?=
 =?us-ascii?Q?PEjeAIaWAaGHmxyRJ+kV31n3UkGHw+sbQtc9vUpdgmItGF1fyuaPOCv0LuzV?=
 =?us-ascii?Q?kmbsexLCg6KFWuuqD+4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4235bf46-c7cd-4ae9-25b1-08dd76685049
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 06:40:55.1713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dp3Oil3j77HGsg0OHIqc48jVIqnVGQyQr75dajywEEI0Gpzo0/IXv8zHyTOZcuET
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlTEG+8VftPNGeFCKzUdYfr4XwHUsTZWlL5JnA1qU00=;
 b=FNYEsyiySKmexJtCYwPRK1HNX6kVTupmhK/5qlfDxkF4G3xxCcajOvRy2RHS7NgI327yQZVbxy0EAVieUPbnxe5KfFSKqeb33z25zgqtylUDeVFMAsq1iL/nwSpd5hp1aVPq0FRMpBc2oVvdAoQEb/v5LLpENltu7IbvjAz5WNU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FNYEsyiy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> other toolchains built by Buildroot.
>
> To build the Microblaze applications available with the xilinx-embeddedsw
> package, the following config is now needed:
>
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
>
> This change keeps backwards compatibility for users already using the
> following architecture tuple:
>
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>
> Either vendor name is now valid, but the documentation will describe using
> the Buildroot vendor name.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I don't have a strong opinion about this series. Definitely the
> "buildroot" vendor name is more appropriate than "xilinx", and the
> patches look clean enough, but I'll let the maintainers decide whether
> it's worth the extra effort.

> If this is accepted, however, I think we should remove the "xilinx"
> vendor support after 1y~1.5y and not carry the maintenance burden
> indefinitely. Do you think this can be handled by Config.in.legacy, so
> in the transition phase users of the old tuple are notified?

Yes, I agree with this.  Probably the sooner we transition over the better,
in order to limit the number of users of the xilinx vendor name.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
