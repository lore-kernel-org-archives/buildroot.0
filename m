Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE1CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 08:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4F660ED4;
	Fri, 12 Jun 2026 08:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAlcJJUbFAi2; Fri, 12 Jun 2026 08:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92BE160ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781252239;
	bh=HG9Mv0DhJZDwb+t18gAbUZJiCIvtZGaH9kEHGV8hkfQ=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s8126jgIEaD3sKJU3gIxDw5Zye5my3A/2LQaH8efhhr0uZyKz7s+bJo+I7aF8inPJ
	 R1UawiOdgpPNbQpkYEH3dvRcXyfTvStQisjCQ1QeKxXoW31Vf3Q5ItwdYynyRGq15N
	 HSRtplT9Hf1Gxz+1MvDSpB0juDu9/ZBjdBSbUOK77s/8PRE2zHodMeFe1ulHSuhveS
	 VCj8DQXWit+akl9FjQfBFi6G7Q5SU9tgwe7cuNRWwwETCwmLCiiaX6/GK3zrMIF1sk
	 RuZRMJ6hgvqr8BXpkvaxtYmTotiHdWbs24ffv8BYagYospCYvZyNDY1kgqAVvtqNQj
	 +qOj+ry5w7ZMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BE160ED7;
	Fri, 12 Jun 2026 08:17:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DFD8F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F3A941004
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aK_Q9fU-e-RZ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 08:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EAD641002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EAD641002
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EAD641002
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9X8slRb4bq8nylcEG8nvmem0qjMXPNGKcbktAfupG3jmASeTuwH5pTmHZKCY0BxQxzvXvK9IH06Gl+QvoUMjh4dfLo73JDB1vLRwONKs9Hg39OMPTmMEYNxkOVuggs2adF9bq90mR1R6FRSwHkyWEr6jAcfh6O0mpAuwp6YbIyB976/b/JZautOFNh8P0PiuH74CqdbMMf7nqram78IPRHyTMDV/FAg7TgSo/EgPvguPwwBlCcFVInBCCop3QwKGNCoProfm2iNUVSj0XJpVqLXclAg4dbVzycO0sGQsKXVFo4zVtEbgOOnKwidtiCyiX7JoF3mfcS7zXByZhbDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FiBb7PR4jA/9B6gq1aKeJ49glDW7Yh4d+2GYrx7kMc=;
 b=tFufkBTUa5wZcVWmdeMj5b4a/OT0OqfpCjvMeXlUBIT3O282uted4cVWF8YB37AUqXCyW7D1bMVrypK/j9TfSiH5zOIkyLusgCuihg8yTo5sSF4Ni0rYCWXx0FHKXhy3y+ymlEcspqUmgDmD8Ys/sB69ouZqzb/z7uR+Rtd6I4bWj7Nm/e/HlXszXAKOZoZJpLfpdb5IdjTIcs1/nLM4hU1EFgrRiqm8ST7K/F0kT3C16oLjoFWo7HhcPrW2xyVOqYp6etzNN2NynjprRsHXbiTNzmyPSGzlWDvCUXSu1g7LXysdK+/59/lRyb46OP47Xai9yN8FX9dimT1apJ7FYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 08:17:11 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:17:11 +0000
To: John Ernberg <john.ernberg@actia.se>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Hildebrand, Stewart"
 <Stewart.Hildebrand@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
Thread-Index: AQHc+YuX4ZbUnC0k4kGRj6Tu9c1iTLY6jHqAgAAGpkA=
Date: Fri, 12 Jun 2026 08:17:11 +0000
Message-ID: <BL1PR12MB503266705EAD51DC752299B2F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <b2810e66-cb1b-434f-8991-3bffe94a5d80@actia.se>
In-Reply-To: <b2810e66-cb1b-434f-8991-3bffe94a5d80@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-12T08:11:44.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|MW6PR12MB9018:EE_
x-ms-office365-filtering-correlation-id: 3cef6f72-17d8-4709-cb62-08dec85b00e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|23010399003|13003099007|38070700021|22082099003|18002099003|11063799006|4143699003|56012099006|41080700001;
x-microsoft-antispam-message-info: C/SGgW2OfphgvsOQNFv5NoLc7gq+UR6xb40SK7ghinC6wWUWIPM3PAO+lVpkQSxR2B5YuZ5kDjz5SOonp3Ih8Uz65GMjS0f5DQYBuyZRKmHV27XmJtSkWfdsT4MIAOiWtFNOru5NpVW1T4gPa1dlQyWDUt7ulbi6FP4u3UWEQ3W2qLnGP4U5buWfZtOVrhgMJzQlpD5zQYuRS5OtvkD5CuXESyxZ8C0B7O2Zbbx7WX8ZzJVV0hDxnPcRV7fgl/WZve+JSDNOmMwMwNFwXOpeX5/7VF0xWoegurDaPXBseup4frnY6+7Vn9wWNqAONGxSzHlRM8qZw54POlgvxssUqs3yLKqGAV+V27I1shjy0GIvhQ3qtcjFH+WjWRtE17GbRO+BkpoT3OwPRfiqrh7uWNaa6BmpauYCcVzS2wdpbbnwaBTvHwGycHIpiOihNR5RpTFDyD6ld2KS1G0Ov/UuLERyfcsGZAuAPGe5hPrKdoXZn3KlDnM3TLU8UitvQO1R2hKd+witAaa40QJjokuLUjgHuC5GHDUQpXdzOWv+bTrnf8xq2DXQNYoitQ9Js96KX062fbZNbgdard9RGqCQ7FYf9hnKUqVuuEn0LIGQvBeMDewu1KX0xauP4S8iF9GWvszRkKN4MNtzES+EWdYZzPujxpDrTlNR2BxrZPzMndZp5E+7aibT8qk688CAkdnj5wAGuG4o9LaVGodNKg4KaQ5q61vnyHLjEWVQXDbCjFg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(13003099007)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlgrdlNyeE03QmFqeTFDTGRZYUZuRzVOQ0xIRnlyWS8wcW1XNEc4YVlnTnlK?=
 =?utf-8?B?OGU5K1JMQzRyRkJvbW13R0FocXo2UGNmeFR1M29YTm5NeWFCQWZkVDdhanBh?=
 =?utf-8?B?V0xPdHMvK2pYVUF5MnFKaUF6WVVIMUJVR1lyWHZjU05CMkxWclRZNW0xN0JY?=
 =?utf-8?B?aWE0SXBuWk41Nml6YW10MWdyeGFzWDdLeHJ6Smhvd1gvN21yaFJobVQ3Kzlq?=
 =?utf-8?B?ems2UkQ4bGtYNzhUUGNJQWdkek5Ma3M1T2pDWlRkMXhDZE5HUEE0elIxTjZD?=
 =?utf-8?B?YkFVMVV6YWlRL25WdlorVzNlM3dtUHMybEhjQVVmb3NkSzZVbnBSaWFLSStp?=
 =?utf-8?B?UHR6d05XaHdZdFg4eXZaK28yUEgyeUphVCtDZ3c0MUhwWDVXaVNSaDNUSFd4?=
 =?utf-8?B?WXhGT2FEcmJ4RmtBemtlWGxaRHcrQk9UQkFoU0Z4Zk9OSFdTVVRnR3RTdHNH?=
 =?utf-8?B?bUdBYlR0dW9MSkdvS2lTVnhqVm4zbjZPZzlpRVRLVjZaM0luSUpVQ3lVdFlJ?=
 =?utf-8?B?U1hRZGtvQkJIUkd6dFZibHUrRHE2dzlidXBnTzdlMDZ1dURIMDdXNHVQNFgr?=
 =?utf-8?B?R0hiYzFnRENCSU04Si85Y1VZSkVGdFluVC9aNjlhOG9MS3ZGeG5tbDY5VUMy?=
 =?utf-8?B?Ty9CbVZMQ0hMUnhjSDRjZTg0WEtwaXhFcGl3aXlaOU5jTFRIOGI2c1FDeCtm?=
 =?utf-8?B?OU52SzlnNXg0SUdmZlhNY1ovLzN3ZlRWdjZzWm9wNG9HR0NvbEtpZG0yem84?=
 =?utf-8?B?d1VPSk9BM3F1d0QwdzgrWCtVZXltQ1lud0lYdnErVXdCUmV4NGp5dTRReWlL?=
 =?utf-8?B?VFlITVZFa0cwdUlONlU4N3laVW56M3BCOXJYMUh5U2RkZ2tmeDNpT29GazBv?=
 =?utf-8?B?VWFPdHdybmtrRDBvRkxLYkp0UHBab0tKM1dMdVc4U1c1QnVSYllHbHFvNEJ3?=
 =?utf-8?B?bWxjbUlnbmVXWnozTDliV1hObzBvNE8zV3dTRmJrT0tXdVhrK2E1cVZ4MERH?=
 =?utf-8?B?RndVZVVjaXZ2ZVRYQkJhbkdBSHo1UGdRZnhDSHcyajBNU3EvRE96djh5ckd0?=
 =?utf-8?B?aEgzd3c5ek4zRVY2ZXAzSTlhd09BSWZLTzJNQ3lMZ2dVZ1BTQ3k0S1hoUms3?=
 =?utf-8?B?WVZqTS91bHdIY0hQN1R3RHpuS2FmVUR5ZXVZL3dSWDVWbWpac0hQNm9CT1lQ?=
 =?utf-8?B?Tm5LcU5MWVBoWkI1cGE1ZjNEeWR0eGg5N2QwencvYWVCWm1vc0RoVWRhNzZW?=
 =?utf-8?B?ekh0bnFPVGhyc09QeUowNjIwb3ZnbWNqcFBVT0RhMjZLY1lxeWEwVFBsMVBL?=
 =?utf-8?B?aFMrd1FQNytXVDdlQWlWaVZlR2NKdW12NWpOU09uMExQNnpJSllRU05WaDhG?=
 =?utf-8?B?ZGxBOHdhRjZlUy9vNU1FRnZ6MThTY3IwYU4rQUtEdFNITmgzV2JqaEJsWWE3?=
 =?utf-8?B?d2dZV3A3a1d4cGVBM0xQVlpaUWNZWm43enhCaVBWNXBZdFJtVlVDaVVkZk1T?=
 =?utf-8?B?YnJ6NHZ5U2kxQU12dis5ckhzUEc2dW5PWVIxa2RTUTArNHRiNkVoVzdQaFVl?=
 =?utf-8?B?eW81N09mc1UzbjdyUXRiZW85ZWFZQXpXd1hRdVIwMHZONndkYmtkaG5YRGwx?=
 =?utf-8?B?M05hdjZqdEwwT3IzWFd5WWdvcTROWVd4a1VhM2QvRElPYW1FdDJRUzFVa2ds?=
 =?utf-8?B?NEZ4YzVDVFVYaDVLUUdaajNkaTYwTkdNVkVHU1A2SGpNckNRNGcweDVKb000?=
 =?utf-8?B?VE5aeVZDcWY5ZFQrdk9kejV6dk0rdEppS24zU3dXUHhxZUtZeW5RbURvK0Y4?=
 =?utf-8?B?Q0FlU1BoZzRwaE43R3VlUFYrWFFkWlR5TGZ2ejFZRFUyOGJmUXJ2S1JoSG5W?=
 =?utf-8?B?SkpGdVhjNGtPZWI4N3VqVU0rcXdneE1ncmRmZ2FnK0VYWDk0MklNWVFQYW40?=
 =?utf-8?B?azlBQmU5RnF3N043YU03RlFsbHlObXRyMHdVNU9iTE03c0JCN0lBcndpVTZS?=
 =?utf-8?B?OVF2Q2VrTG04M1BLWnFVbmVSZGE0eFl3RUQ3MnQxWWlTOXR5NkRqem5FWkZG?=
 =?utf-8?B?SXd6UFpsR2d6bmYySnpiNWxPdnF2ODNBU0laUE1qTW9yaE1GNFd1MGc5eTZX?=
 =?utf-8?B?c2NwMC9XbERqRjNEcHVQVVBRWC9YZXdaTEpHQkVoMDRsR0p6SzRFVDQ5NDB3?=
 =?utf-8?B?blFNUHNBSTFMVjB2QkZvdUxmemE1c3pjaU00M2RRWDF3SmxwYjJkMHZUQUQ0?=
 =?utf-8?B?dFBwQjlvcEpiMzRDc1ozMWVTbFBpbXltYkVjT0xiUGZ1RnZTak1oVkZqSThm?=
 =?utf-8?Q?tNrsZBHdwuzhM6sC55?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cef6f72-17d8-4709-cb62-08dec85b00e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 08:17:11.5013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wp98DUgaRA9zDkm29VsliBwpjyUGNpYQ+ghoW9g23x1g/oSEz8Nw7ajDNhQiRzxo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FiBb7PR4jA/9B6gq1aKeJ49glDW7Yh4d+2GYrx7kMc=;
 b=bCiUTw4k3htApoSxinwixUWfQdL9726+g/DpE8MEbdI2FFAnZ6Vt3uTsdGCt6fuQjnLvj6UjcYCU1KXgaHettHurYVkg4LUUuohhnT8QOZVju9tRiX/KNA2HOTjQFbnvaQnIuLHAauDdY6GIYVDqG9Vq6AX7YQ9YrzUNNwmxpHw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bCiUTw4k
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
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

Hi John,

> Add the ability to configure specific Xen versions while leaving the default
> version unchanged to avoid breaking any builds already using Xen 4.19.5.
>
> Since the version can be configured, the 3 patches need to be moved to the
> 4.19.5 directory, so they are only applied when using this version.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   .../{ => 4.19.5}/0001-No-trace-backend.patch  |  0
>   ...2-Arm-platforms-fix-build-with-gcc15.patch |  0
>   .../0003-Update-linker-flags.patch            |  0
>   package/xen/Config.in                         | 25 +++++++++++++++++++
>   package/xen/xen.mk                            |  6 +++--
>   5 files changed, 29 insertions(+), 2 deletions(-)
>   rename package/xen/{ => 4.19.5}/0001-No-trace-backend.patch (100%)
>   rename package/xen/{ => 4.19.5}/0002-Arm-platforms-fix-build-with-gcc15.patch (100%)
>   rename package/xen/{ => 4.19.5}/0003-Update-linker-flags.patch (100%)
>
> diff --git a/package/xen/0001-No-trace-backend.patch b/package/xen/4.19.5/0001-No-trace-backend.patch
> similarity index 100%
> rename from package/xen/0001-No-trace-backend.patch
> rename to package/xen/4.19.5/0001-No-trace-backend.patch
> diff --git a/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
> similarity index 100%
> rename from package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
> rename to package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
> diff --git a/package/xen/0003-Update-linker-flags.patch b/package/xen/4.19.5/0003-Update-linker-flags.patch
> similarity index 100%
> rename from package/xen/0003-Update-linker-flags.patch
> rename to package/xen/4.19.5/0003-Update-linker-flags.patch
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> index dc4d434810..bb44202824 100644
> --- a/package/xen/Config.in
> +++ b/package/xen/Config.in
> @@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
>
>   if BR2_PACKAGE_XEN
>
> +choice
> +       prompt "Xen Version"
> +       help
> +         Select the specific Xen version you want to use
> +
> +config BR2_PACKAGE_XEN_LATEST_VERSION
> +       bool "4.19.5"
> +
> +config BR2_PACKAGE_XEN_CUSTOM_VERSION
> +       bool "Custom version"
> +       help
> +         This option allows to use a specific official version
> +
> +endchoice
> +
> +config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
> +       string "Xen version"
> +       depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_XEN_VERSION
> +       string
> +       default "4.19.5"        if BR2_PACKAGE_XEN_LATEST_VERSION
> +       default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
> +                               if BR2_PACKAGE_XEN_CUSTOM_VERSION
> +
>   config BR2_PACKAGE_XEN_HYPERVISOR
>          bool "Xen hypervisor"
>          help
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 5756dfc68c..e354718021 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,8 +4,7 @@
>   #
>   ################################################################################
>
> -XEN_VERSION = 4.19.5
> -XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> +XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
>   XEN_SELINUX_MODULES = systemd udev xen
>   XEN_LICENSE = GPL-2.0
>   XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
> @@ -13,6 +12,9 @@ XEN_CPE_ID_VENDOR = xen
>   XEN_CPE_ID_PREFIX = cpe:2.3:o
>   XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
>
> +# Handle stable official Xen versions
> +XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> +

> Moving this seems like it should be part of the next patch.

> But doesn't matter that much to me, so, with or without:

> Reviewed-by: John Ernberg <john.ernberg@actia.se>

I see your point.  If someone finds something that really does require a
change, I will include this change in a v2. Otherwise, I agree that it is not
so important.

To be honest, my original development had patches 1 and 2 squashed together
because the second patch was the one I really wanted to test and verify. This
move in the first patch is a remnant of my splitting the patch in two before
submission.

>   # Calculate XEN_ARCH
>   ifeq ($(ARCH),aarch64)
>   XEN_ARCH = arm64
> --
> 2.25.1
>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
