Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2167C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 07:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D23983AD0;
	Tue, 10 Jun 2025 07:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vM6tUiFA84_0; Tue, 10 Jun 2025 07:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD4583A91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD4583A91;
	Tue, 10 Jun 2025 07:23:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C61D71F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 07:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB8F683A91
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 07:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8aviZdO1rd9 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 07:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::616;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8D13839E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D13839E6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8D13839E6
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 07:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rA7az/sIJW9DdK9Aqi30DRZg7WeCubxyo5gi+Y3tm3T0zbrKksSnzgcPHpQP+XxSGYe8O8S+E9xu0Aido25knxAkSBGPWoQirGveFzS1cBRSyzsXQm4nX8bgjw5uboJBlMoH7x2rWYpOyft6WhJ/pjRHW6P8Bqqym2FGnbAaT1bVt3A+SHt+zSJWXfdOF+DT9M5WyVQCUF9rJyzVZeS+a4TFg3on7cdRsxhOyQwvdA3JG3vw7XuAVHNtg8eDX16XpnhK4JvUaQycH0W3SItObiSu9nk/OwAvHGtM9n6TSxLP2V4COrePmS/IDhAovlx3sxw4G9CyH+KUdknt5OoF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9GMWuiJfP3kaLDNsc5Dticl3JtMfwV/ERftG7XxBkE=;
 b=BHnN7djl+ptcFYV5aymoUuMcRp7qA8xkfuX/3fvs95LE0cb7VN1htuwRzgqsyBG5Vb9yVSsCu+B+d4OAdCe/pi5mUGS/Dtot3QqupmL07UmzZVCK7rS7bMXmIsJjwwMPrRrGq0QsiLwlxJkDyW7fREAw0Xsu8i8KFs6nmJWmUCkmyUjACgrQMPbkHYRTqS0fjnNJHAIaqL3yrOjUIR2rPDxD4fFp894dsoVwtOBJA0zW4HVlzJBivdaNwoG8OZuMaUeR0kNc2vSi7jUJH7llvmhI3VTJ6CxuExDK8zF3gZdqse+aOyZDfWkk+LwzlAs46XMOcd3ba3RHr8inPMTJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 07:23:44 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 07:23:44 +0000
To: Julien Olivain <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>, 
 "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support for
 xilinx_v2025.1
Thread-Index: AQHb1d17/RoIx/yLCEit50h80i1Fk7P7a4+AgACAVnCAABNGIA==
Date: Tue, 10 Jun 2025 07:23:44 +0000
Message-ID: <SA1PR12MB561527943CBC8A786BA9325FF06AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
 <f70d093a5f7d73c8c6bcb15472a5e330@free.fr>
 <SA1PR12MB56153CE78D06255C22A29513F06AA@SA1PR12MB5615.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB56153CE78D06255C22A29513F06AA@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0c575883-4edf-4e79-80ea-faffc1a5bae6;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-10T05:52:13Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM4PR12MB5721:EE_
x-ms-office365-filtering-correlation-id: 8e5181f0-6606-4213-8151-08dda7efbba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0nu96fmYOPox1i0ped2msO99nMhi1apnmRrnGD55T0nPhzlImaTv3qv+hmgH?=
 =?us-ascii?Q?UDI24abHvqtIlwsCxj7HdDmbKz28Mpi3mvWmKnf3bTefZnxtmFbqbJu0po99?=
 =?us-ascii?Q?y89h3jBMbGncSj/zGxiuY7RlJ++JZ2TzreegFuLx16QXHV724cQPw4MffYuP?=
 =?us-ascii?Q?KszTHLaE5MmqWZHstno6Z/2AsLqZcClTX0g5cPpouT4GuX8POGR26Yv3Xq7F?=
 =?us-ascii?Q?Ep7xcdpflyUhsLsqUru7udznH1SQo5f0CzXt4GpZ50JZ03F9oeOWKW369kHr?=
 =?us-ascii?Q?c4WUzcSM0alw3b+54/kcZgWYUG7co6VSKu58aoRb3U1Iqt8edGh3CNBOgqcM?=
 =?us-ascii?Q?5I15VGY7oJSJsQ7oqgsW794ikx57097jy1go9PagZpWW6+FrGTXPCerx05+o?=
 =?us-ascii?Q?aBDmNxyQ4qRhJgk4S0afxhR4Wa+veY4G7dSVioUK8BpT9v42GopUtNTQxQ7k?=
 =?us-ascii?Q?3j+7BHyPKbldoS8/AHnm4BYG/ZiEFjUZhtFlGS3SsCo7JNjif9yAGCD812rv?=
 =?us-ascii?Q?Layk7TdrUc8gR5lou0pj0VqHFr6qZEqIWwgRSTRiln74WPLl6uNCJR+tNrvK?=
 =?us-ascii?Q?/N4Pz/waJocT2zVQpcg0ayOq7yj1WZ8DCALaS5tgR2BPrcnO3IJlGuXDfhpU?=
 =?us-ascii?Q?Evs+HUJJF/smgudcxq5E4SbqZYid3le11UThib+6a6+22eZkpuvwlNdvbdvi?=
 =?us-ascii?Q?8kWU/PyUa4zOGvXDotiiMdXe5WGFmJgvd5wui8P5yUvaGV+1cVylnG/coAkt?=
 =?us-ascii?Q?V5flYyJYeppbuwDQ5o7U7VxFQsKS3XCvLSw0oPLv8NdIFikSB0Hj0BCBY8aI?=
 =?us-ascii?Q?Ik4EURknw3IIBxRH544h5xjliDXCWlyvIStX2+IJdeS5TTAleCYUymk03RFv?=
 =?us-ascii?Q?U20M5hX+tfO5tQzE6fDQwV3YZZtfWPs3JpSvWnkwsmh3WdpcWTGY2fJYlcOS?=
 =?us-ascii?Q?MqhwVyhxfdYJ38BV/YWKtLPUq8wZTP9diysVrKO2u7Ywq8rZUeL/Rou1HeWz?=
 =?us-ascii?Q?jz8cR+iB4Wjot9ctc8YygMW207YXo+w8jo7T5gK4D0eWqXi7wwEnfLTudUHh?=
 =?us-ascii?Q?rLJbjMq2hs4N5WV87hxRmxYR7w/XboKJRzW+npbf1cq3jU+NMrvzY9m1SYgi?=
 =?us-ascii?Q?8fM1FrpHIbPYHOfhLbb6ngocubb3W29MicoqOa8rnV8ozT2jlhSABMIBmEDP?=
 =?us-ascii?Q?krpLlbCBOkz1rxWYboITiwQFZGbCi1fR7bzFnckHBi9Da7MF6W0qYUH99cO8?=
 =?us-ascii?Q?OIGfjbEP3WfWlJyuTG5Uy1CDLdXIJOkHh8wcVYLe7gK/M8kPtmdhXhcxgGbM?=
 =?us-ascii?Q?X7Gy4gO+QRBJlL61UKiAw+INKB4EuQ/HxwR7JYI0UdQTNsGKT2cz4oAXwXZG?=
 =?us-ascii?Q?cW7XwCVdhEs+eFY/ZiaKXtIzumpA9ryH9ufltmjcxkYuFXr18ToUYF0lbT4u?=
 =?us-ascii?Q?7xngP/rZfR9oPtN+lWGUAfvcSBixmURPQLr5Ed/9n4USkoW51DQf7Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w2VpprloKTCjB0MY3eFIj+MRlWYBHuXc83cJLqjwu4Hflhi9EGCBYja6TulZ?=
 =?us-ascii?Q?88TcCdR+ruL8VLIdOp6Q6vHYSy31IvkpyL+p07kCT7uniO+KiX28NoPO+A4C?=
 =?us-ascii?Q?PNcSGoaKrppzIGngdpN54a/hJ/3OZj/ixngXHOlRmJ+s5HpBIwA8uV1s1GqK?=
 =?us-ascii?Q?JRmWwJPW3VOaSWf+T1W8VlMSdii123a2ctn5vp0ma03B+SvtjpW77qP8JyW9?=
 =?us-ascii?Q?QQCzfSUIv2ZMB8TWU5km4/JTuJuMx9tAxrmjcIOT1OyXrIe+nwQ8U1qejiBm?=
 =?us-ascii?Q?L51SqBX77Uzo3oWPQHflIWohXLQBI+mdwLF8vEy/9QF4e6Ki95o0UMrbCyw2?=
 =?us-ascii?Q?Xokjyz5B94CF1SYfglELDqsv9zfrmCau0vEwx+9FjcfjBgXBJL2x8cO5qCMx?=
 =?us-ascii?Q?tCDhfuRD2sYtVSsMMAoaZ1UMaOykenU7bEWFCvEL7VLsgw3sEOutsamNritO?=
 =?us-ascii?Q?qv2ZV3mIUCg89m7y8/9Sy3T3yzvIsAreXKNX0NlOkm6WxaQHJHICdFpduiew?=
 =?us-ascii?Q?mzekonplp2ksNLjrJpBL59f/A+CyhoUthG29/+Q7Po7gumAjsK58UXUBcBxR?=
 =?us-ascii?Q?i7M999NMvaSdKY4r00jFy7sEksSamIT6Cl070WkV4tjZMEtMjBKc0IpRcA8v?=
 =?us-ascii?Q?M3q14WU2RwqSRRa9wQRtg7TJnIpZf7suDGcbE0KOcKJaHednzAGJ4+htL5rG?=
 =?us-ascii?Q?6S7w+VpdvAiZ/FPwh2XfGWICSws6xMCklX9Iub7QW1lhwUyXGiRiqs+bPrL2?=
 =?us-ascii?Q?EUsn/Q52GicZUdyofZdXRXap0tYcaqwJVXgVP8G5HLSiqtHuX9uEHHRZT5KZ?=
 =?us-ascii?Q?C2RietSL01kf0VdqObUlHVr2+c7M1cu/gi1ibojOpJkQ+jIApeukYIPmGJ9E?=
 =?us-ascii?Q?bgcQgm0pCJb7AW92tABjH7nrquAyUtyTECPnQ6bWNj8U4G4+fwOkaBCPrJTs?=
 =?us-ascii?Q?UVcvNGKK1JuA7rc1R+zqHucE+RFP0ASuud5EXZ4G3tyt1Z9xea6AsMSfCNTi?=
 =?us-ascii?Q?F1iWKtuefHed7TAzsFcViTLtRxkbg2oA0Zv+t+Hk0OVWMeyahgyMrcDQrHcq?=
 =?us-ascii?Q?Gyuhz7PL7JiiiWkrbWbS/L3G04oGDaj8+VHoEPN+JTsJrQ0MVp3YJrhTa6zR?=
 =?us-ascii?Q?ZWLW8WSGvYpIdVUGQJd0V8ZM++8xOTX6NTxQGB1zMtMv/epZOeQCDxsFhTKR?=
 =?us-ascii?Q?42HZdzwEZpoPy3B5/UGxBPPjttaHuPmitRBDybOmA0dWgwE2RXRe5hg6cCfv?=
 =?us-ascii?Q?vIsGsbiszRMKWvR4WBgbFm2+r2wLcjy/K5PfORC6Ebb/nLTNtmAtOuyEBJpO?=
 =?us-ascii?Q?OEgGRxFIDX9mGPzsXCJr8fmUqRV4lPnkoGgQPj1ZlDTFrBqtCX08fc8RyMce?=
 =?us-ascii?Q?dkXajSvJZY+etxNH/8bbAKg+ec4zT8wuyc9gSy8k76OkJHiwzHgi3M6xNOZG?=
 =?us-ascii?Q?B/DK4jUX8XBNLhm/qxkmVoBuHhSaGjUE5r7b/6WnNdOcfQyiDy5M87pgdlYY?=
 =?us-ascii?Q?4ykQtPD4lM772aIVbYvkorwF1x6Ym7wH81MvfDVfqlk90c8Ff3BuuPjaLL6N?=
 =?us-ascii?Q?eD01BoxJ7NXWH3JGNok=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5181f0-6606-4213-8151-08dda7efbba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 07:23:44.3277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRiGmGz4+1/q+Aawb0iw5nVi0vn/6mvBefE4kMNnD7q3b0D+WmOlyqxh4q9If30t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9GMWuiJfP3kaLDNsc5Dticl3JtMfwV/ERftG7XxBkE=;
 b=MZsCvNKcZn4EoR02EDRQ61oiseIDuQJKqFFQxQKz3eCzT1t3233A7m4VeaMOYBLahWrD162jx7ZxFaAyrzvtmCq2h4TGssj6c5bx5HHE4+Kq9SWnYrHs6UBpqVI9aUEoWyH/Z14wxPsi3VqIt67mC5nOOBKBZTdxk0HOdQK12BI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MZsCvNKc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support
 for xilinx_v2025.1
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

Hi Julien, Thomas,

> Also, as a comment for future defconfig maintenance, we are trying to
> move the defconfigs to use a stable Bootlin external toolchain. See
> for example the commit:
> https://gitlab.com/buildroot.org/buildroot/-/commit/310ab7d53393288aba5c574c49a6cae1bf1e1a1d

> I see that the Linux headers config is removed when migrating the rasberrypi
> defconfigs from the buildroot toolchain to the bootlin toolchain.  I get that
> glibc is already built, so the Linux headers are not needed for glibc, but
> what about user space applications?  Do we really want to remove Linux headers
> from the defconfigs?

> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

> I am wondering whether or not to keep Linux headers with the Xilinx defconfigs,
> so I would appreciate your input.

> Thanks!

Nevermind my question.  I see now that the package/linux-headers/Config.in.host
only gets sourced if the toolchain-buildroot is selected.  With an external
bootlin toolchain, there is no option for keeping the Linux headers package.

> So it would nice to do this switch during one of the next updates,
> to make sure this change is runtime tested.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
