Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB63BC282D3
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 07:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E89860658;
	Wed,  5 Mar 2025 07:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6fx7O0Vfy4m; Wed,  5 Mar 2025 07:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C401606CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C401606CB;
	Wed,  5 Mar 2025 07:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E1CE95F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 07:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D684408E2
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 07:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kd-xTVbT37fe for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 07:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::601;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50B39407A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B39407A4
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50B39407A4
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 07:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSyE2RP6EjnYxY++Etmbu40OCkZbLCtxu8jv9Y6CS24wm0ej8a++Wo4mlI2U1eRTZSw+fgQrWr79fGCtwk/MamkN1bc4CE8GsFyZB3dr2MIQuehRpUJ+KcqA37E2G9dP8IPzNlO2UmyE+TkbqZGBFX01U3KBxiwwAqi4nqG+yPrR/wx6j3ChnOLEhGaOyGLRv4eEHPXBDsp2Kms2XWYjn81CqtAhQv/0oOT41mrAU5iDWY31xpWdYmGBaQjbLoJbdAtoDOQvsxXwlxUVgW28t6KhGGQnQjX/DL8R831ejHfwZvPiMrh6OooX2NBcWhQQ/4HtTHSy6anbVmgRACwbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9kjSsKMbl6ZM7YbbMyRN3q76WbV3yrdRlJQSPNcNd4=;
 b=GPJla8bMrj44xo6X2Wgcz7HaAyAvqW45KAzpfQQ9OBuC/DggNKhQoO746TglcJaTRny1pNpjuJFq/5CitcE74WGzvETlDo7X1ZoW1U2VIomY33XJdBfhfkZQnIhNE3XaSJqLxATypJVS8s/ZYNR/pdAJ4KhQchR0BERE9Z+Kd4uyjq1bUuSuI7GodrO2rVek/I7oVMT6w9ElqIYBp5zFx91kZ2eo9Irm2VzAdc2uhpYfoOzR3PeNysnTs8cy5IyY6QHrDE1Dt1BmczW4l4oLdj1AFlj2HhuzxEGVqrUfUJozrE/sOZ277dgwfcLFNPRvDyT4HkFdE2wlq8LR4/UBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 07:19:13 +0000
Received: from PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::81ec:c416:6667:bb81]) by PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::81ec:c416:6667:bb81%3]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 07:19:12 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: toolchain-bare-metal-buildroot
Thread-Index: AduJFiy8oFc3ROBmRFmVSI97y0+mlQEPp5AAABJH7QM=
Date: Wed, 5 Mar 2025 07:19:12 +0000
Message-ID: <PH7PR12MB5595CAA1848F4FA762A90771F0CB2@PH7PR12MB5595.namprd12.prod.outlook.com>
References: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
In-Reply-To: <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-05T07:12:12.3823747Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5595:EE_|SA3PR12MB9197:EE_
x-ms-office365-filtering-correlation-id: 05d1fc1a-1167-4dc9-44e7-08dd5bb607c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EEV3YnmOl7Za/D4ENZKwtoXFfd0PlabuYsZQy805kxAtqAu1negGRIb/vdZL?=
 =?us-ascii?Q?Vgd/xmd0auRosFsNYPnjGjlxjUjWjmcB78eqoCBc/i/YoQZebSD0fFE6tosL?=
 =?us-ascii?Q?aVqMpncCFtIlEFaxLZwdTmysdjvNAdSwisHYEf0xbA/CtfSx0oviJvDvDJoc?=
 =?us-ascii?Q?Owbs4Qj5zW6YQF3yLIUKMkqGgYVRfYqvFvsHJqav1ZvAAYNabXgXpSusega8?=
 =?us-ascii?Q?KhQXFDgD840XTgPLcTCdFtXKiO3HJypUKcEM/Tw1VH00Iq22fsecgd9j5OM/?=
 =?us-ascii?Q?A0D3DSWGdEi5TCLBu3o3Ha5wrpXQrBQ8ipNZJcQeqPbIwCRmvSOveNoXOETd?=
 =?us-ascii?Q?rMNqCEjYwABu6zcpcILm17dumm8/X/935OcLEcJEM20SJKj+ZjylnCSAfSqV?=
 =?us-ascii?Q?OM1+4oNhLCeevRZCFXM9V0S8B6eZB7hENRr/LWJDYL7kkeFI4V711tQgausU?=
 =?us-ascii?Q?nhFz4gsb9wnU42e4Y6jvLlPgcXJdKMkBzc9IYJAVZliivyGNvi1I7axrUoqC?=
 =?us-ascii?Q?TSUpDMMhDpgKJiu7++aNaFiBnaHeF56D33SzAjGXqnISif3wC5dQkpX1skdr?=
 =?us-ascii?Q?QsnZykwwGclYmxNhYXLtAzXkk/YkwdWXE8+h3y/k8jyU5I8IF+3FmTGWktB/?=
 =?us-ascii?Q?ngY/qZVpKeQK053A0xiuOnj3i8/xaQ+XJ70wuwYQQQKQiijQgZ5tlzmxwv5K?=
 =?us-ascii?Q?jjMRpDWnzit9sBXrNqFUn5rh9C0K4wG5BuGu6GqQRmMROU8/8bfY7GxWk9mg?=
 =?us-ascii?Q?7DlonJINIlqf+iYtPfcVAnAoXTh+lkzhT7zT4D6W6sfnD0JVssDpPdYZTNjb?=
 =?us-ascii?Q?vFM2+XW7KIcnTpJgaxK2hrjdUZOKwanXYOs85IgscyMj9//5D4q9W5q93oVM?=
 =?us-ascii?Q?UZyS78fn14LhIJa+qads5/F+bvQuj0uuNBTiGizE/yKWhEoz7p2RtGLQX6U6?=
 =?us-ascii?Q?7jqkBsCKC3ALnu5FNRDho6yrjk4By6WUEShwkuHmzm3qydYTmm4WwIGSNY4H?=
 =?us-ascii?Q?5ehoEk3MG+dkP/JajYH0aIrqpX82K8/6RoLwpxDbWdBdID86LyIYIfCRlxms?=
 =?us-ascii?Q?HUBs+cJrDtfeoCnrcKnfp16iNktEKkDo1P4hmx/NDhdZhsbkHdAmiMdUE9La?=
 =?us-ascii?Q?ANeMbJKMC866K+el9U7nJvg2O2YpB7i8GM6BvfuRug+KX8NhWgQjlcn33T3a?=
 =?us-ascii?Q?4NPcuJHiddp8Lr4sZAWDsC1QPwCJDXZgWlWbhOzxnfryUNIB2VDjVZZm2RXb?=
 =?us-ascii?Q?Lii1VfiqOp10uroh0Si82JMOEA4grmZBgv+EpmX1mmzCSsjpTrSeJnflJWZF?=
 =?us-ascii?Q?+mYTYR7ZtfE0jKaDGKmhnuhm/Of74/iu6iVeZ/G5VqzTzcrGv9NRbYfOJOyQ?=
 =?us-ascii?Q?kgOrH4Ki4V4Ur+uBIMJfTx2guvOTq5ixjQCrrT9rt3zG4N5hQfDOZMimmRLu?=
 =?us-ascii?Q?vG67yXCd+Sp8IDhdtuDTMQQBuW73ZVmb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5595.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aGY75q/qjk0GU8l8AICw06YF5dRo+CuG7LffjCleg8IFCgsicd6SpZha3Gw/?=
 =?us-ascii?Q?E6F/fGL9EL53cnKfsJVXxEOpstSf8z3oqV+xFxuOx6b8aY02IZkVGce8L6U9?=
 =?us-ascii?Q?DdeNHVni6qAjASPVkiJpvAxDUsRYUb0JsMi1GxlhS0LIXZ48AJvDCF8fnbAO?=
 =?us-ascii?Q?Im/A++rJBPe8c1MAMJU07W5yudck9M/eaTdkcJG1g50Mx7ESgNz2c6rBm9H2?=
 =?us-ascii?Q?dlyqZxfwKx2Zgb1I7j9s4kZpn9X03jTOQq2Fwl/T+u1QoZYXSFCuek+X2Gic?=
 =?us-ascii?Q?+/ToKI1XWJvWnNdC7FsGKvpgHQLSlOeQ/3kW5xWxeG0TXAZZfVtnq21cyzTR?=
 =?us-ascii?Q?RdDROiqthH8QPyZ0JwEjvaFFHR7jS2zn0BX1v5t/dVg8Dr1t54rDc9n2lOMM?=
 =?us-ascii?Q?p1h8m+34JHKzpC6wVDJJB8VIWr4uFi4GjudZbU9woSJ9o0ndJE9p9OnaX/d1?=
 =?us-ascii?Q?Vy+YpDqLSA/Q76pXsEpjVMrLnJWRUw9Hmo1azq/BWqQ76FG5Zo40UXIGu4tS?=
 =?us-ascii?Q?/zOL+aLgfDXJNda6zvBfBszL9lKpHve22jwW3D7qCeq2ZgygrZ5jjj3aqb8q?=
 =?us-ascii?Q?1OT9dH2+s1iXOlYZTetqIxMvZQ1l16xab+bQjlKHn9SHeP0jOw3o6vRjcBK7?=
 =?us-ascii?Q?R2X5gv8Gza+WzEAq0HkoJuPtFRKHKlpxeL7IRjGi6L5W8wmI72IZVp8BEB4J?=
 =?us-ascii?Q?QqYlzHhszGik4dvlNRpYX6HNKiMhma6ig0BxqQEM88s1G7QkvEq6LkyotGwM?=
 =?us-ascii?Q?SPkcOmLAwP8uYCU7JHd6TY9lc5H97TsLawJBxJBGXLWl7Ek/qfntM5NqKwH5?=
 =?us-ascii?Q?64bT1FLu5VwE9W4URt1t1pxb15LFqSDWgBDJlwn809Fvjo/ZxlhrSQO4RIqA?=
 =?us-ascii?Q?e1m0R86IX0N2HzGKgbeOGV8ufEwyQjtcMsWm9Sg3EjGZJQTTWjHOP2xIZomj?=
 =?us-ascii?Q?MyfVzP/8ahQP0ODS9GtfoqPG61p0rtV2kty+sbRLp8gf1Rgy6V4To7+ANKot?=
 =?us-ascii?Q?UfOGO6qfZkadgwUVLP3XCSPqNpq/irueAE8EZ8jgMS99erfx/tYXOGcOTiEQ?=
 =?us-ascii?Q?OLhfZv31z++RRLDr/6AYCJ8tvSR1Gl8nWb6USlccWVEfUQjZMqBYchuI9UmE?=
 =?us-ascii?Q?fsKpRW2yJxV4fda/1h1tlr73lrEMHpGmRskPC3B09OnbYhncYOWR7vSJJF2S?=
 =?us-ascii?Q?71mryHYj/c4Xta6awOSg0ntLYDFdyHYXH1JitJSi/Qip18w4lVnzrpZP+E6D?=
 =?us-ascii?Q?8gwa/ZB6Olipw9mUmcXC6jM8tCyj1nUb/4kpGKQkpqaVstxTn9MiwTxQ960e?=
 =?us-ascii?Q?xxBZhsKFJQ0WLbHXIDv0CDYduWWW79WOTkW8sh0FUuB2B/ZaNipw0IqSrE3s?=
 =?us-ascii?Q?Tt2fukJj7pK021umXfJrOPX5fSpotXt49j5ooNTHD5DKwHOt/2RJJEkVadiY?=
 =?us-ascii?Q?8YM4VLbWcU9nY+q2O55W5sTZwyetPBTSX+FvOLiHVmTJI5J2ftQhWNg5imFu?=
 =?us-ascii?Q?1WcmIRjbVvHHh370pkMU/sh/7yyVoD18Ioowl2jNc2BzOEchM/ZLnNdUtj23?=
 =?us-ascii?Q?CFJiMvLEZHpii14FWOAhRMGL3ZSljQF+I5v2zf7z/zAHK4yggeTdRulM9VIN?=
 =?us-ascii?Q?vbfaFphfv77kaP3xw2Ot2sFXPGEAT6zH0ODdid1cM1ui?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5595.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d1fc1a-1167-4dc9-44e7-08dd5bb607c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 07:19:12.8864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3fmngMvGfF7MgNYhfIActbapz1AxtWM9XauZM7tcQEQrNOMuuLETmGCwMuNYRmZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9kjSsKMbl6ZM7YbbMyRN3q76WbV3yrdRlJQSPNcNd4=;
 b=I7YImGAtR7/QP4JCABNajvSWHX5v/tQxXUW8NKX4upvgrYpgM83NjStEc9xPneFiLvlToQCUhPMAKelMnlc2RyoX4YjiCM2Njs19LOeI5FkFm26PC8SBm0GPHoK5tWKuHoFpY9qGXsHFXiEeYs/j0fPVXpUciMvNZiWjvmOokxg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I7YImGAt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] toolchain-bare-metal-buildroot
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
Content-Type: multipart/mixed; boundary="===============2125217189044611530=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2125217189044611530==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_PH7PR12MB5595CAA1848F4FA762A90771F0CB2PH7PR12MB5595namp_"

--_000_PH7PR12MB5595CAA1848F4FA762A90771F0CB2PH7PR12MB5595namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Arnout,


> [AMD Official Use Only - AMD Internal Distribution Only]

>  You know that buildroot@buildroot.org is in Cc, right? :-)

Yes, I included the community on purpose.
Nothing in my email is "internal only".

Since my original email was not sent from git,
AMD IT added this lovely footnote...

> Hi Thomas, Arnout,
>
> I am continuing the work on the toolchain-bare-metal-buildroot, and I hav=
e
> encountered a snag where I am hoping you can come up with a brilliant ide=
a
> to resolve.
>
> In addition to needing multiple bare-metal toolchains, the versal gen2 pr=
oducts
> need the riscv32 toolchain to have "--with-arch=3Drv32imc" included in th=
e
> configuration.  Just using the riscv32 tuple is not sufficient.
>
> Since the architecture tuples come as a list, do you have any ideas for
> how we can handle architectures that have many options beyond just the
> tuple, such as ARM and RISC-V?  Any additional variables we make will
> also need to be a list.

>  When all else fails, we can resort to hacks :-)

  > The target tuple components can only contain letters, digits and unders=
core,
> en they are separated with dashes. That leaves us with a lot of character=
s that
> we can use to add something extra that can be stripped off and treated
> differently. For example, OpenEmbedded uses ; in URLs to give additional
> information (like the download method or the hash). And URLs themselves h=
ave ?
> and & to add GET data. So we can use one of these to have additional data=
, like

> riscv32-buildroot-none-elf?with-arch=3Drv32imc&enable-initfini-array

> (not convincend if ?& or ; or something else is better; also I'm not sure=
 if
> it's better to include the -- or not).

>  It is obviously super ugly, but I can't think of anything better.

Thank you for this idea!

At the moment, I will keep this as a backup "if all else fails"
solution.  I am still working internally to see if we can
update the asufw application such that a standard
riscv32-buildroot-elf toolchain can do the job.

I hope to do it this way, so we can keep as many ugly
hacks out of Buildroot as we can...

Thanks again for your help!

Best regards,
Neal Frager
AMD


> Do you have any ideas for a clean way to handle this?  Perhaps arch
> specific configs that we can apply in the config loop should the tuple
> match the corresponding option?
>
> Thanks for any ideas!
>
> Best regards,
> Neal Frager
> AMD
>


--_000_PH7PR12MB5595CAA1848F4FA762A90771F0CB2PH7PR12MB5595namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Hi Arnout,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; [AMD Official Use =
Only - AMD Internal Distribution Only]<br>
<br>
&gt; &nbsp;You know that buildroot@buildroot.org is in Cc, right? :-)<br>
<br>
Yes, I included the community on purpose.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Nothing in my email is =
&quot;internal only&quot;.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Since my original email=
 was not sent from git,</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">AMD IT added this lovel=
y footnote...<br>
<br>
&gt; Hi Thomas, Arnout,<br>
&gt;<br>
&gt; I am continuing the work on the toolchain-bare-metal-buildroot, and I =
have<br>
&gt; encountered a snag where I am hoping you can come up with a brilliant =
idea<br>
&gt; to resolve.<br>
&gt;<br>
&gt; In addition to needing multiple bare-metal toolchains, the versal gen2=
 products<br>
&gt; need the riscv32 toolchain to have &quot;--with-arch=3Drv32imc&quot; i=
ncluded in the<br>
&gt; configuration.&nbsp; Just using the riscv32 tuple is not sufficient.<b=
r>
&gt;<br>
&gt; Since the architecture tuples come as a list, do you have any ideas fo=
r<br>
&gt; how we can handle architectures that have many options beyond just the=
<br>
&gt; tuple, such as ARM and RISC-V?&nbsp; Any additional variables we make =
will<br>
&gt; also need to be a list.<br>
<br>
&gt; &nbsp;When all else fails, we can resort to hacks :-)<br>
<br>
&nbsp; &gt; The target tuple components can only contain letters, digits an=
d underscore,<br>
&gt; en they are separated with dashes. That leaves us with a lot of charac=
ters that<br>
&gt; we can use to add something extra that can be stripped off and treated=
<br>
&gt; differently. For example, OpenEmbedded uses ; in URLs to give addition=
al<br>
&gt; information (like the download method or the hash). And URLs themselve=
s have ?<br>
&gt; and &amp; to add GET data. So we can use one of these to have addition=
al data, like<br>
<br>
&gt; riscv32-buildroot-none-elf?with-arch=3Drv32imc&amp;enable-initfini-arr=
ay<br>
<br>
&gt; (not convincend if ?&amp; or ; or something else is better; also I'm n=
ot sure if<br>
&gt; it's better to include the -- or not).<br>
<br>
&gt; &nbsp;It is obviously super ugly, but I can't think of anything better=
.<br>
<br>
Thank you for this idea!</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">At the moment, I will k=
eep this as a backup &quot;if all else fails&quot;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">solution. &nbsp;I am st=
ill working internally to see if we can</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">update the asufw applic=
ation such that a standard</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">riscv32-buildroot-elf t=
oolchain can do the job.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">I hope to do it this wa=
y, so we can keep as many ugly</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">hacks out of Buildroot =
as we can...<br>
<br>
Thanks again for your help!</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Best regards,</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Neal Frager</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">AMD<br>
<br>
<br>
&gt; Do you have any ideas for a clean way to handle this?&nbsp; Perhaps ar=
ch<br>
&gt; specific configs that we can apply in the config loop should the tuple=
<br>
&gt; match the corresponding option?<br>
&gt;<br>
&gt; Thanks for any ideas!<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Neal Frager<br>
&gt; AMD<br>
&gt;<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_PH7PR12MB5595CAA1848F4FA762A90771F0CB2PH7PR12MB5595namp_--

--===============2125217189044611530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2125217189044611530==--
