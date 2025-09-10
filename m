Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7FACA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 09:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45BE14120F;
	Wed, 10 Sep 2025 09:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiOUPqabcsNa; Wed, 10 Sep 2025 09:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C2A24148F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C2A24148F;
	Wed, 10 Sep 2025 09:44:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 634D410E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 09:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47D40405AE
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 09:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQEgQ9lR0fos for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 09:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::61f;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3F594051B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F594051B
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::61f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3F594051B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 09:44:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6mqUsZd1tKS2fWXvwPa0hRalEKqJBaopTrcY4EAiX9hKobQyv6D3GuEvyIxT2cAlsA1Rg/Qb85f76iP04X9HEvwSoZUW+wNwmNXInd2HHzGK914yyf4IgLGD+nBOeuITxanzHQ4UONgYsNrd+7gasZqWM4fXo/miw04bSTyG8fMsrtyqfLXnydcfAtVqGfg+AhHKN5J9CkXy5Vhb4eMxinUXMgxfKPlca3Rc3x5nrSFpKpw9rFCtwX6pwe4yaPR7rm9Qf7sGGzlwgyvN9MOae5Nlg5Akl+cMrm85Mv69L7HUnfA1S7DvfVzOx5/cOv0Ii82xHk2IOnBZbRKHNf/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkFk2kE4VY6mwydHY0AvSxsKzYD94v83DrENXpKB3xI=;
 b=h0KO7Xb4TO9XeGubyPf1crMa9ZuqCGvvUz/6KHpZUyXMKMEFgOPjZvoW3YHTKjP2QclmnFlOPn/toGOJfHRn8MXdeOBvbxPmvq8JZ1okHxNMzYDmPRysG43RFlsZsrEuR7oRgBGb5BDiFrxnbkMx4TAbH77YHgcU+W9cfa2ldYOh7BpnwRSjVWTMAzlf0N5InquKHa4f7lJDEmclj+v/e2bz/0MUp0yZs4TROPscSyQPJ7b0oNAQcR5NunEw2fVQaPJ+pJcZvtf38r4sAWmtU09KH5Hsr49tTHsy9dnvWsr0thvgO5Iu+3/sXvGcyXR2lD+w+Hq4MOF73EjRPFpUSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:44:10 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:44:10 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "arnout@rnout.be" <arnout@rnout.be>,
 "peter@korsgaard.com" <peter@korsgaard.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek, Michal"
 <michal.simek@amd.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>
Thread-Topic: [PATCH v2 1/1] boot/arm-trusted-firmware: override BL31
 environment variable error
Thread-Index: AQHcHmBHamoYtQehEUGa8BTs/mezGLSMGDaAgAAZfmA=
Date: Wed, 10 Sep 2025 09:44:10 +0000
Message-ID: <SA1PR12MB5615609D307A7FD4C9B17B74F00EA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250905122603.2521801-1-neal.frager@amd.com>
 <20250910101118.3bb72b85@booty>
In-Reply-To: <20250910101118.3bb72b85@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-10T09:42:31.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB6415:EE_
x-ms-office365-filtering-correlation-id: a73cbb65-10ad-4f0b-438b-08ddf04e97e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2lcMAIqEzByR7JrW0G5Ca8FY8dqOjqz4ch+i1Rbv58xr2v2ScD4/8DNuMPVb?=
 =?us-ascii?Q?xs+yNTmb64j8jidFniH6TYRJCN4qcPqMrxGrfbDH/mWKsszzSAoCWwFyRxu7?=
 =?us-ascii?Q?jYUHTUzY09k6UGdyl7exe7/yd1LIDRGo3/FkbrrFZm0plw7ky0FGtcGyzkyv?=
 =?us-ascii?Q?F2ZEoinSXjmnkGkFc8v66t6h4QoP61h8m2iZyvQxSeUweO0UQ95sx2PZPy9I?=
 =?us-ascii?Q?W91OlHS7toPajvP7V+HLATSCVmwvt4/n9X4n+7jonYMzjjhM6pVsayF2szS+?=
 =?us-ascii?Q?WdD2ydpuM3yfBGEjZ1Lpa5X/hNpgHYCNudVT1PEqrd/E6VWd4xu73+mtCLXX?=
 =?us-ascii?Q?QZuEZ0wDK7ID7xJIJp7iXb9S2mljbfufon30Kfx2SoDlG9iSXej8DuhInoP/?=
 =?us-ascii?Q?6GIEAoY7NBfEfZptY5f3W5CogPra+Ej6QHfsZ8Yog8awmKadSYjAf7dPYIoN?=
 =?us-ascii?Q?6g5ivMIkxdSyesAjnMZGbun3Qz74HvZL07K6WMvi+6vx4IKdNHQ4UyTfHvvL?=
 =?us-ascii?Q?rndFc2T/5xrL56cbvFJTdE2bwhyAMdOGIirIBDHBkvNsjJpW5Jh4OxjrQiGh?=
 =?us-ascii?Q?5+2Q8dQTmpha6LMdLKOXGCNnkWHpXELS1tbg06jl29aP5gCIQoEBpvV7JWOt?=
 =?us-ascii?Q?lDXZta3qvXfweS4Sm1Ren7V0n9+EZ2CVDqsmvo0B99C/1OUq2bO8/dPPz4RH?=
 =?us-ascii?Q?4Ho4wiVFVr0/Ceohv9bd44WFtwOxR1ULQhcCDjZauf4QJ2eEjyotX4TuNwXu?=
 =?us-ascii?Q?r2yUqtqcclHZVRbTLbg6/YK8K9x284eRkcgpz/WSyaQ3KL/aOU1V5UjKBeTE?=
 =?us-ascii?Q?znYLUIRgIqwW9hfhNkxxHvcuVR2bWdZw1rdRlKWpF3WDIndCsEga9D27hDu+?=
 =?us-ascii?Q?BaDQJSpf3j1iCEjwJkkcm4MjSS29F+G5r79n050ZJCGXf9f1mjuFKh80Xkxm?=
 =?us-ascii?Q?DHRZF9HWcS4SfCChAmoel91gZBhcNGYe2zT80/jpzogxfDp+AIAoTmWQAWat?=
 =?us-ascii?Q?soC29udk7YwFxxmZ6gKVLJMGCogOwVoKWkWb9f6AfY8nE0aG8SD7abCZU7/8?=
 =?us-ascii?Q?+8ZCilEWE473TOLpzwFslJGZI4OG+AvePM2V5phhsuvNVOfnbGv8hLdFKXgX?=
 =?us-ascii?Q?ZIRUf4Gf5uTAKmXp1aSYMMBFFjklYv0wkuBU9gXqbHj8IR9CgWmBOe5yg1xN?=
 =?us-ascii?Q?hZDPLnFCLz6ffHyg3WZGkpI16iO2p3QnZLlh5BSPey6Z1HQOpW0ZcMLBRfe2?=
 =?us-ascii?Q?Su+b/dvMvXy4bh4zjqp/F1Yzb6MkXXYj2028HOUQIzSfHQRPT3k7c2qvhGQU?=
 =?us-ascii?Q?O1KByu+0UdpZ0ykKbh2+DUBY3TiIsgQ7i4XtLaVa++Nr4ur2DfdbSEfzSR/H?=
 =?us-ascii?Q?rPKFkQw6CQxlFDHPFQSSC4JuYtaVA73yXwO6ZvxrwCcZFIEsXsnQJQyoDVEQ?=
 =?us-ascii?Q?4j/x7VR9YDAQcvrmuvb4o9Fqd71czF+3KNr1dYRHCqIBcGtPN8almeVc8h9h?=
 =?us-ascii?Q?GxqbLDkVeyZHbCtuIRpKqluy/PQkRpZ6+jLw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZcMQoiTaa/TjkyQi+zNt0MdiuBl8mDYp1TmMFNcx6IbWjEKpdSAKAlmUGUj8?=
 =?us-ascii?Q?1gjZpGoX09UETDOi0DJ0jsMhWnvzBgs7PPkSoJtCOWw2hnDbjLlO1JQr0Yu8?=
 =?us-ascii?Q?OYJoMbltT9nIpvySYHLToL8i8LwDX9NOcHQdbc+ap8c9og9vh+vVhy1TmiNn?=
 =?us-ascii?Q?9hoPSX7rXuQ1ZVGBRus+kxWnVAvkllL8QseeyhY61gWxt66DX+U8CJrdGu6j?=
 =?us-ascii?Q?lrs3um8MC4TTCsQ7y8e4tzhnTsPxqz3S/VPcchV0pRP3yGyVBlempSAbVGyj?=
 =?us-ascii?Q?KoS4WJszbOZMV4TFUisdNcGAH8cJNOPMQxGxo2ZOr/uLhoJIh0XEK8xjEn/2?=
 =?us-ascii?Q?85gwLjMRg0cztE9G/ZlAKToqmGzSfEbSF9RS1d/lN2t8oK8Q+8DC23D+L/Mt?=
 =?us-ascii?Q?IbK4p1LTqN669YJh9YEYYAZfvEXoMlPqn4intX7rDffuOxL3ln0ko7ElY4nr?=
 =?us-ascii?Q?yYvrj/k/tEmCxQlXJkBwiFYKgqHx4skCgqo4JjLTgstefh49lK0/yh9sNXHv?=
 =?us-ascii?Q?L9wuHwAc8RNHtYrnLMT3co4LtGrCLWKCav5cXoIdjK8Zey3webV9db+P2r5j?=
 =?us-ascii?Q?PLO3fQI/+e4kdHShJ7d5OWa9LWLJ6TyNAs/alQsWrSygulBFO7x8DRl0yNpk?=
 =?us-ascii?Q?ipu/izgLvJT2k2BOOZ20cY/8vGRWwyykdyGspYG/bEqnXmO3wO9F1b72BcYq?=
 =?us-ascii?Q?kOBbr7F14er43PzXoZCmslQzzMlG0ihGy5fypUoTUlKIkEkZWKcKlMJpAr0j?=
 =?us-ascii?Q?m5XN6Nf0ncBFefoNyOo1vjBNf7fE7Dk+53EsMvBLl+El8cnzTq1VeIvDZ9RY?=
 =?us-ascii?Q?HzfUB6y7sfruNe9LmUiqcsNJytMfglvDaPZMoMqzOUm1HAXfGzhLX/iUi4MV?=
 =?us-ascii?Q?+k8EWWeiqPd4aGZT6Bsy18/D4Hx/FIjFbS7poIAkbku4l0TTNH4IEnxX3wAs?=
 =?us-ascii?Q?5ZvL0fiE4Ts5n/uvmVdfNoogreFZJWD2TFkVtHjZ1zx0kMjP1xzT0s05OWb5?=
 =?us-ascii?Q?9D3d/tu+GPh47lcOS8KVdoXU5TP1tGnkBxbU7NtjRa4XIiKNKWQ1wEjB8hnS?=
 =?us-ascii?Q?b+SvGsfZJEfKzlhARTSYH416pFOQQ4kVdVzN1pZt+JAm5K23PNGhXtDNFCbw?=
 =?us-ascii?Q?1028oY/xcUrnIjhRh0a8qwN/S+n6PANaO0PW/zRK+dG0GhlBRtKhfpxEU0VG?=
 =?us-ascii?Q?m/BXrv3LjvM/tZgIY2qS47IKSCdFNfXv25EK+C41xGZQPtFZGi+LRZDhGOI0?=
 =?us-ascii?Q?/jlL9EM4s5VjEJ8BQMnOfqFsRNbCplSH5svwseo/mH1CudLu/OqXLIRcGrsa?=
 =?us-ascii?Q?ydqNpe/aae7srPxc8ngnpbiG/8ZvTU1TJxAyUALBzAKLVYE/kpVUvD48IP61?=
 =?us-ascii?Q?8wm+KWwsy2ObqNPQvRptBoUak1GtKDzGmQroFTJPRUAU74QHW28KrHdo5D8v?=
 =?us-ascii?Q?UHpI8qsMQWwMkkTIcoo+ChNqjaq9neJ9cFIa/2qQ1uVcSGG0nzerxtT7/+f5?=
 =?us-ascii?Q?4GaXBYy3GW0u57wFcmEwnM9yDzezhOuztC2kCUxxqZuDmW7pHG7uWR04ajeW?=
 =?us-ascii?Q?Hul8f6KEwfFsXTPm2d0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73cbb65-10ad-4f0b-438b-08ddf04e97e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:44:10.2451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hub3n/n4iOzQ1kk8MBeV4oXfZg2IQ06mUCYsoGmIPn65g1pTkIfwYKJqaMyv6ZcC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkFk2kE4VY6mwydHY0AvSxsKzYD94v83DrENXpKB3xI=;
 b=gbAkecFj5EJfG3CR9RMZAyJlyoFpxNbsDxz5e/qrI4jNmfqALfWcAskKtpRLNIvIttr9/2hCiW6g09/TEjcdqfEh/NoS1kw7OrXGDc9ONCN1hLKzPb9EdjRTeXK6sk2Bd5U9D3ugIj0OUzG73qkt+kkEoaBnP5JycESfeCESlyU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gbAkecFj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: override
 BL31 environment variable error
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> When building the arm-trusted-firmware, if the host environment has a value
> configured in the BL31 variable such as the following:
>
> export BL31=/tmp/bl31.elf
>
> This will cause the build of the bl31.elf to be skipped leading to the
> following build error:
>
> make[1]: Nothing to be done for 'bl31'.
> And then:
> readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file
>
> To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
> arm-trusted-firmware will build regardless of the host environment.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Nice bug!

> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> I'm not sure whether this is the correct solution or rather we should
> unexport BL31 in the main Makefile (in the "Hide troublesome environment
> variables from sub processes" section). However as far as I can say
> this is OK, and definitely self-contained since it's likely that other
> packages won't be affected by a BL31 host environment variable, so:

Either solution is ok with me.
Perhaps a maintainer can weigh in?

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> Luca

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
