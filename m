Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40219CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2057610D9;
	Sun, 31 Aug 2025 13:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEc8V_Lv67hn; Sun, 31 Aug 2025 13:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC49A61097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC49A61097;
	Sun, 31 Aug 2025 13:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1B9222
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4BAB82503
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA7MqXwot608 for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 13:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::61f;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14C74824F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C74824F4
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::61f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14C74824F4
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1NTTJ3oeUdekIrmGvWQFK2MSxlP5w6Irsbqw8uBXWR/enDeEnYWJs6mh6t7xPew5AQTjzRW/DjAxVmpsKRBhIzjGWersPY92E7xfXQKzo3PNHvQ+WTkf/DnrbPQjV90PPDc4tPhSRcdO7i0CPQQduj5JpDqEE/C0DXTfQOyyu1gGdYQHqJbPzJGR1hzpzxcl4NsZ7ZXQS6cc+Ewd8KuXjSTT78iUlMl8VmchhCIL6Jq+VmVzI7lpADSwfKorlQKfAIB/qYnLPm3VXpzAfG337sMqNCSPyWQgFj3hheHlOMw5YZ50cWdsJk7SODKq4B5V2es2RluWkQ9suCZipgkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhyqzqbQ5h4+fH9Jk4XxmATt5oPmhG+IFLynQaUr4c0=;
 b=pfZz/MzHDtRUPBnaz9FrWeTQsTPpKl0M+iRQOca8BWoHGwRP7PmsigCs9vi9iujpzmJg7j6OmKVYfImpVQZbbOamCCchLPRPU3gQir/gi7S63BtKpdP4Wr0L1BKaovJHrk0J1MSDGifyCsyTow/wyDYCKepXcwVWVflUfcZcml+CPOEduodhdHff6oYwg4ZHxoujERfjxqEiee2HBWcA+fIkW1c81xxN1e2iMZrPhyOBZ6fiutjxT/VR/v+4TAmZo7mJVM5b5RjLE7v8eAy7bbYW41FDdeIAwMt4RjuyG5oVeGxkuWuVspmk4iC6zU6Ygw5U2FMH9J46dj3B6MrzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sun, 31 Aug
 2025 13:28:33 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9073.021; Sun, 31 Aug 2025
 13:28:33 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 2/2] boot/uboot: add cpu dependency to
 BR2_TARGET_UBOOT_ZYNQ
Thread-Index: AQHcDHgAGdf0lmWCP0S10qNWBdYRDLR5X3uAgAN9t1A=
Date: Sun, 31 Aug 2025 13:28:33 +0000
Message-ID: <SA1PR12MB5615DA0709C26E684EBAFB94F004A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813173037.3052024-1-neal.frager@amd.com>
 <20250813173037.3052024-2-neal.frager@amd.com>
 <20250829100915.768e8207@booty>
In-Reply-To: <20250829100915.768e8207@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-31T13:27:58.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB6653:EE_
x-ms-office365-filtering-correlation-id: a63748d5-6c29-45ff-0288-08dde8924868
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rYwRXlhp9fqlbw4yFe6V/TmhgO5e6w5QmkgxJzBHsneFgBlGUJk7YsMVdInR?=
 =?us-ascii?Q?9w/xeYKh7KbsJXBr8mZdHJQJthBlQuD/bpk+6BDOObnt37cdx2o/NSiSSVU8?=
 =?us-ascii?Q?UJdubU7catv1d3575Stndv33o+7tssT7DCXNh9AWGYLfpXzVl4+jMgY4lQvl?=
 =?us-ascii?Q?Ki7D8/glOfHaG6HG06yWcYxCP26iV9rwi5YgMpOMOEH4NnV4WYKHm3p0+6OQ?=
 =?us-ascii?Q?tUeEjFFVRc4Jm6d3vT5aNjdgris7oWxenaxyB9LRoRRsBTml3hRGEOHHgXp7?=
 =?us-ascii?Q?0cOFmrvFVS5cqFcn9dEXKbEEJMWRE9KuNkrkzGZvDALffw0DJGm8D6tOY1eu?=
 =?us-ascii?Q?OvjtWfF7q+hlsEGVasSegUfJT4qZiOMR8PwrSXEoC0fNAKGWK1ioBE6wSLw4?=
 =?us-ascii?Q?2KABSaX5Gqmf/Hsz3dWN+POujQX8R4Yng8sf3oUCQnX1i885LpUC8lZq9z4F?=
 =?us-ascii?Q?fxNnEF6fmBjs+DZZhRQOg5F7O/5pNbqAaDB0/x8MOyVpiYk0FKxU9fOO3xP/?=
 =?us-ascii?Q?lrC05L7u8cGHb2fqR6Dzd6PAlo49KetKpYSTQgtV5OWtkLEBzziiq89ksEm4?=
 =?us-ascii?Q?kYyhyprmQLJ3Ks36drTFdFj2iLiWxo58x7tr6c2FxeKkCES3LEB37d1fdcRi?=
 =?us-ascii?Q?4ndJsuISo8JBVwcuJRMfatRnVTBojBfjaK+rAPEF3NrDYm5ZQOn60U88mdUO?=
 =?us-ascii?Q?06SvUJkyi7+LzpawxOEEMUMIE7zq8WzRXqi8eqxVBwGGAOUM18VCfIn5vVuU?=
 =?us-ascii?Q?KOn8HHB8TzTkO2L/HPyRUMBIqVpJ9MfEkHFTUPbdqixLdz8NL9ZKJb7yOIYv?=
 =?us-ascii?Q?UuSfh8cCl55tMWRFoJAEdRvrwxg45Q/09wGH3NTipK+aZBFtnLhW7Tuvc1hl?=
 =?us-ascii?Q?bVqnepe8lhSjld+850yCa0V5eBUz3o8xJ5LmGsIHqQAyfjuKs6eDpWAPJrZR?=
 =?us-ascii?Q?/9n2LqV72Q1ah5THdVp8Va6YP5MwdEc9SEl9DXUa9c/ZW64mL7HGbuy+9XP6?=
 =?us-ascii?Q?iEIzP0frAueASIdp+SQuOsv3qKPSWXAYnpm/C//7R0sttrGi6cn6q5NVhEsf?=
 =?us-ascii?Q?lwm470ZdDNss6UhdOSDSHcrtrzxj6tjIxZFdbJ80rjESZ4NZ/FfQOQdRk0FE?=
 =?us-ascii?Q?1RZHm3JHlotT8X/Vdoc69s6WQqXEbvQvrgF0sCy8P522ve4l8S3Vn6y2tTwh?=
 =?us-ascii?Q?dLnIF6XV0rnHF5otTA3G2hXuH0I6fgfm539449+W7EHx/hXZbNXEOsVpXVnj?=
 =?us-ascii?Q?rGaevM477C7pi+60X0TUChWy11uZPa8v/2pPHkaxNatoqj6H5ckVXXakBkGK?=
 =?us-ascii?Q?bowzJbiWOVHIq9VStoczzUhBHECHPthf6x8U2u7fuM8lbysM6X/zXLkNSB+Z?=
 =?us-ascii?Q?VDVn5HVYBShAcFJwUJveFNGVBN1vyS/HyB7xW8xnkRANLhFB9GiorxH4e9MN?=
 =?us-ascii?Q?ESlQD16KRoy7jrN+1+wEN1H8ns9xSKc9Ja0ha0Po1z9hTgasc9muMTefX/C3?=
 =?us-ascii?Q?9YjYP0pFG1db8y2pJyeVWw81fdMQUCp+DCyS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6e75PmWonmExd7SjsZM8beIHEWkTdxJ/Up97m6FyvJ+5U+B5Qa+AtiSltdAH?=
 =?us-ascii?Q?SkZQuHDZ/QhLGRcDthL7ykyPlIH2M7TUFfegU8xFaunxVoxhcxyr9kK+HVg8?=
 =?us-ascii?Q?Ck34edq5iay/ofnfPXdSPpGPc3EO3r0VMBIQOC3/JMrUfle0Xo2du8toaxAN?=
 =?us-ascii?Q?Y6jX040t7qhHtIPqFkDpV/rTiRSuwTzrRNX2kYFQFqCvfDAnRfs00XT2/krz?=
 =?us-ascii?Q?1t+uehrHruhgPeWDVAz3ZDWML0X8wMBUMAQcSTI/hbhczDEXlbx73eAmmDpd?=
 =?us-ascii?Q?Wed1lLe7Y3YFWWqqlNnggiiZAAT+Pq6SYWxixJWbC+UrraTSd9od3aFrilTs?=
 =?us-ascii?Q?G0oEHqBOiZK2Ox5BIkddupitplvXupPTCh7cNIbRhba48GeRkSu4m6j10RjO?=
 =?us-ascii?Q?UlWHrOOtaYqSbIEPNwZrr8/GyXRkAaqqm//wXt3kV1aVu2ghlWq4aNU4Yzk3?=
 =?us-ascii?Q?TRveGjhiQbHJ1+m3gnTl4sq/5jLHv563x422bEajlfthvSs/N31KCC0OlHoD?=
 =?us-ascii?Q?kfKX1LdCXW5AtCLnbqU5EjXGdBGrAPnXiP76pzB+7hz6g28vpjwiupufNJ4y?=
 =?us-ascii?Q?25N2NSWPjzflqshIBl1e3rL442iMX/KdxaRZoga1ePlU2KVoOnK2yFAyGkns?=
 =?us-ascii?Q?JmsPg29ZX+WemFX7vP+JfAkwz8qVOHO8qmVSLZOjHhubNx2nMCPR3iYoD82I?=
 =?us-ascii?Q?5PjDE7OaHaXCRnG72ba/RPJzb7H4LaNeUUmu7AlyypaHPsU5p3DocyKZE/mq?=
 =?us-ascii?Q?GfD2HLNoZqJkeB8uZs6GJV3Pyze1SuDVG3T05j4WaXQeJqvCa8mr+FIGFRu8?=
 =?us-ascii?Q?kSo59Uv7mBxQm8OfmqZ8lN3g+AY7X8lmrPn4yvgAhUW+fE0JtGoPzHzNbrYk?=
 =?us-ascii?Q?+MkhqtWhDEggHwlHmfNuQRJFWRELOCIarti5DurODYcr47NEo+YWfYsjooBK?=
 =?us-ascii?Q?tPgCpTLzSFBQGa6YNAHigHD8t+i0LPL0qJqtgCPFvYrMTB9iQqdWKNVj7tdo?=
 =?us-ascii?Q?gJwR1oX6ZGGZ55aEbk+E8SY3yRh7mNg7kJABITg48+fcfSrjXuEPuIUuku5U?=
 =?us-ascii?Q?pB930aXs3pgnbz+gvWCa+8s/WislvLBxTISI96sht8zoDjYf5F7u3knZuE/h?=
 =?us-ascii?Q?oSaQrOuh/ddchMNy3l/Uz3A26LPERb53QJjc2OR7wiGLN+i9j8SmVgsEla7v?=
 =?us-ascii?Q?0V5fNZcuMrNi9LXd+0KMvMz1HzJ0vP7CFFFBXX5BYHg3k0NoegCscbU/Yqxa?=
 =?us-ascii?Q?PZLuHs+XmiKKv08NxCPAxajt9hszIlt9zkJroM3BgY9iTag4eClVeZnGXckE?=
 =?us-ascii?Q?1sAHHYpqq8oqm/PZA24KQ+fJSMelnvxKD4W0agoBtYsq5l0r3Qw0pDnWL162?=
 =?us-ascii?Q?GfC25gIfUwGUnlM199W0B1bsDZn3M0/3ugYSiPqBLPieYMTBJjVCA8ppoIhm?=
 =?us-ascii?Q?UjfE87klSkfvcgst007AyeM7bExACZHvemnMHSx0dQiwk8hUAyJgaJI6pK39?=
 =?us-ascii?Q?zoVfnv8P0u86+sdfILmHplH97f4zEv3JQZcdq94BUlSVTNhAmmXyagudRhkB?=
 =?us-ascii?Q?QVWa41pxwgAYLG2MsIw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63748d5-6c29-45ff-0288-08dde8924868
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2025 13:28:33.3991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/uHtyDzFDLvVP/Q5zT0IL3sfa5JhBf4Fj/hdMwl9yYE1LXvW9SVtg9l3Js+smVd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhyqzqbQ5h4+fH9Jk4XxmATt5oPmhG+IFLynQaUr4c0=;
 b=Cf20TAAUAlaZVTGYuLpiucqxsQkMDpo4SIZx85s6ADyvUcyP91/vrPhi43mYO4KJJLc0LW2/Ye807ywmxg+I9MsM80Xp1DUNDNEbP7aav6QjpWOhIX57c66tsVRgRXsiV2v/TzXytkz7393/NdE3TwzPVbVE77LeferZ6N0JUCQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Cf20TAAU
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 2/2] boot/uboot: add cpu dependency to
 BR2_TARGET_UBOOT_ZYNQ
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
Cc: "martin.chabot@gmail.com" <martin.chabot@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "juju@cotds.org" <juju@cotds.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> This patch adds a BR2_cortex_a9 cpu dependency to BR2_TARGET_UBOOT_ZYNQ.

> The commit message should describe why, not what. What the patch does
> is clearly visible in the diff. Why it does it need to to be clarified
> in the commit message, e.g.:

>  Zynq SoCs are all based on Cortex-A9, thus showing this option for
>  other cores is useless.

Thank you for your feedback.  I will make a better commit message for v4.

I will also be more careful to use the imperative tense in my commit messages
from now on.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
