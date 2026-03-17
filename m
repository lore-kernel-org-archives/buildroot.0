Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67370F3381F
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 09:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C3583EBE;
	Tue, 17 Mar 2026 09:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vds78ZhqxTid; Tue, 17 Mar 2026 09:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D0683EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773739269;
	bh=NUq8LtoDigZFW2HHk89YhS+KbyQp69t9f3BnYv5FUZ8=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=s5tyiOiJvee3z/ntS2ugpnVIHsLX0JLh1nuy6tzI2AoAfdneRiyUVU7I7zbeNtASH
	 YO1/fet1gbcCwRklbsQF0pwbm5JiP0eDcOeJbHkvjhXsMuG8NiR0jirfEKXGxCyaa/
	 EeEodzyKW4dPBs/pc3RMmEYgG8xQAWfElY5Wiz/0rEKz/jrUNso1Z3has9YGsxcbI0
	 aGYffy8U8bSz5er0CWgi0XS3rO0jfx4u8V0Sakruz9W/mkgjnojxTlfTs+LW9BEHFU
	 oxjwtuwtQog8cA7xUgW/U9igNp0gQGznqKEmCw6jqWvbL6octKnUfQwZjUoAk7Ynhq
	 IHoKeJBkBRW6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D0683EBA;
	Tue, 17 Mar 2026 09:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A20C21B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B7640BF5
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dqa0mJO8UjtU for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 09:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D79334004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D79334004D
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D79334004D
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdekDKDdI4u6dxcxt4bHVc6WRgGMmlvLginEH+1kl23QdhdLKVBDASlJkM7O86+8d9MUI/XAcizrnB4RHklKWwoYcJ2f3A30qd9BdjRzx5k45rXMvnbYJKQWiotF+JyB4n/f182NDzhPT4aSoOaQwQGtO0wtEUcBkI4VWdUN6litkOsBVffi1odWiD1dHzQTlRWckv+ge4J79BlpJPMXG8N/ZD4vkTdMStuQWEPX8H4oaQdbWyon+3GZCCNw/+Jk7tyRsXisPiOXR5rWnWsvDkfbBfCCWL2VREoWCy9SHWIkT+59gJkH7ZZUujL57xb1bPe2wLDaHLA/YZBZEbSbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbld2kk1zOXrDLJkiHyAtBhXm3vHYJr3jWfAfKRS554=;
 b=GkWjtzVUZKJlrWJLWuC1BijiPR776jES8MuL1LYW0p/RhN/ih1MxgUTN0o/+rO4mmfd5DRxqQy/sJGf+DYdWB44VDgn4OfApriYsNXQEW24A1SQeUUjHcKGKpONayMsqsVjrH2YmURMNKxXYR535/6Kjh1zkURQKX2uPOqj36cHTRqiXSRiCup3vUIqJ9PP1B1aS2p/tDGk1p+r9OSvUPT/Z7TkFzjYpCgbVxsDj1IZku9ZrRLJvNjRPeCBglie0yH9Tb+v0QzfPl3IcCA2XEakHGqLngYFHs8SMCtyLeFTmiKNc4SLHvH1C7KzhQbnowLSEV4KvvuCQnkQNvkNKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 09:20:54 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 09:20:54 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 3/3] board/versal2/post-image.sh: add custom hardware
 support
Thread-Index: AQHctJKWHL7zj6lWEU2HCAdwsP/7H7WybZ+AgAAE2KA=
Date: Tue, 17 Mar 2026 09:20:53 +0000
Message-ID: <BL1PR12MB50322313F1AFF50C86700DCEF041A@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260315154343.3144013-1-neal.frager@amd.com>
 <20260315154343.3144013-3-neal.frager@amd.com>
 <DH4XHHBDH12D.1EWBIUX2NHFBJ@bootlin.com>
In-Reply-To: <DH4XHHBDH12D.1EWBIUX2NHFBJ@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-17T09:09:48.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|BL3PR12MB6524:EE_
x-ms-office365-filtering-correlation-id: 293a5779-244f-4edc-898d-08de84067d41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|18002099003|56012099003|41080700001;
x-microsoft-antispam-message-info: FIFxhYGjOkhphnVvAEaL3emrd+aQuw1it+UGAgbgm9kezfaNc4pJv6bJBO4GzMp+9zUEZQ3Y5OSDqhzs8SUgs1L4SsbzcrcfiiPYICSNYS7GXe51EoOFdwfx+tAPbLQMnhXNMBjK+q+L0ye9DmxLYMit8E8KeweKsyqqcrvysG/dczcWHJfkZE7vZ593ddRjuxwZFCkUJByz7kgoH5m513XsiC6vq8jSad7P4tpMgRQTP0g0tOscAvpjwLV9apT9c1zwVhDJRNQI7d3G7lExlo+sEtEkMcs6L31badgrIYvtaNfO2hnFQfACUsBTAsr0snpG3SwRQTM7qTrjxIh4spvPEKfdymGFRBPKUM+lIlM3eCAHRu9UL/KRJnYiaXMks2Ef4aQPX8FSqZaIiY6kbsUNUG+mfPTc5hZs8sjAKAkRnXRGLmZnS9rAwAoesJMJBV1DUEpa9NBoD34PGyf4Lmkcj7nM8cdEgSYatUVlkgp+gXYkLQBYN5Ko+BRbh2kuKJu5IgdyDOBNHUz/ZPJEMiZQsa9dDHSfdizprXkV6SArKkWUGRYdXPxEgMzYuq8xnVj8JWUKpx0aacyNSnjFAAJy7Nxy2Uihs/dhmE3hhMYxRzGNfq3VDndFZ9GqdFm7zsoW7zoZgfDdmRRLRm2VrxMIgMe5ocVC04B2L8yhIkIrXSvuh8gBBjKYbKVtQXspjFvcmUurw8kbSICQ7YbLKsL+1o7HI7DEHlRQWos3qE+Z8QQ+OHpsvVKlNetvyKY8ShH7NZY5aLUJu9wl7z5IDqRms95EL/QEMjAwEj7Glc9kE2BC05TIDKZGLpioJ1oLmpckDMlYUmV/AdcxfRG6Rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eThxc3V0cEI3N2dPOWtWbndnY0NRclpTdDcxUE00Y2Q1YkJlaXV3ckNzb0dS?=
 =?utf-8?B?NExLbGY2NVgyMHJuZEl5THUrVFhXbjR1VDVNSEVZYnY4N2tjaTBZdnVjMFNT?=
 =?utf-8?B?VWJ3SUJQQ3duRUZOa0FlS2xDam9MczhPSExxUTUwekRINCtEbWp4eHhUYVRV?=
 =?utf-8?B?ZUpveWRvKzlSUWFTMXg5VktrWXVNT2RzeXBQMjIxMUFkaHVkbFE5MTlxVG9H?=
 =?utf-8?B?UG1lV1RkR0xIZVJuNUVIYk10Nnh0bUR0SVNCRE1SYmEra3RBZWNHWWpZR0hH?=
 =?utf-8?B?VW1YQWRic0svM1B6Wi9qNFlIbEV0NXowVUdldk9PODBCMytIV3Z3VmV4TFV2?=
 =?utf-8?B?K0VKUmdkNFBxQitRbnFHa0dxOWUzUmZQb3R1QkhtQ1VFaTZZTDd2UTZHaTRH?=
 =?utf-8?B?aElDTXhMQjd6enMrdjZYNzVQODRIZ0QwOGVERmkyVi9Ed21hWFRxTW1mdXRy?=
 =?utf-8?B?RXF6QS9EZC9sT21BdmlTZGFCOERHSkF5QnBlN0xSOHRSKzNiUjgrc1hkUHdY?=
 =?utf-8?B?c1I5RDZEVzhFWWpOOHVseXNsNUFqZkE0RDJ6UFA5bGgxeU5WMlJNdk5SclUx?=
 =?utf-8?B?VzV3MjlNTUcvTzVkZTROQ2F2cE9aUFNwZGJmUFQ3MlFJR215NGpqWXVKLzdI?=
 =?utf-8?B?VXlSdk5rbG9TMEFUZmZCYWRQaWtqRkpsYWJxNEJsYklESXlldlVDaXpkSzAv?=
 =?utf-8?B?QUxBcUxDbVZ2RzlmMDJadUJ2d1hzQm9QZHFtYUUzeTBnTzluMzZ6VUhMby9u?=
 =?utf-8?B?VDh2cGN3aXlybzhtWkNDMTRTbis2azFXd2xtVzBRVnJhckNibFpsOVRhTmRQ?=
 =?utf-8?B?Z2lxVkU0ZzlQNmhTNzJSUzN3Ym5QNVJwSzNLaEd3S3I5Z3M1R1RuK1FtUjIy?=
 =?utf-8?B?aSszZGNMNEVIYjR0UFhKSytkZDQzZjJ6d0xtVXJNWjNXVzVjbThnYXBEYzl5?=
 =?utf-8?B?akNjbkVhcnIzLzNMeFp5cGZSRUFyZ3VSZUF0S3J2d2hkaXBBMGJxa0NieFNp?=
 =?utf-8?B?cW9RR3VlaW5DdEkvU3dIYTcvbCtDbjRlanM4MVh5cWNvZlJ5NmpEaFJaQ2RO?=
 =?utf-8?B?eUFXa0EyNE1JMlUxK3BHb0NYNEdvZzA4Z0xGWENhdW5FbENaTjRNdDZiY0oy?=
 =?utf-8?B?b0RmU3VVWHBoMmhLdm5vSy9RSHFEODYrVjIzTjB3SVZCT3JIUTd4UzJYVUE4?=
 =?utf-8?B?VFE0YTcvVlJjTUFQSzFkUUFwQmJVMGxzbzBvWVdhQWlQeFI2bVZuNjQzQ2xP?=
 =?utf-8?B?Yjh3MlhNYUZsZkFzZFFFRnNyQTg3OVBQMDlvRlJud2I1bUVZTDNQTlRBVGhC?=
 =?utf-8?B?YnM1dm1PaHovRFgyME5QYnZXd2x2K2R1RlQxUmlTODE5a1JCWVF4M05XV3Fo?=
 =?utf-8?B?S2ZPK0FrTkt5NEtBMVJISnVrRVBHWHErejYxRE51ODZ1bDVPMUk5Rm14SEs1?=
 =?utf-8?B?cG5XMVFpV3Qxd1QrWEFWYXhDUUdTeXBya0hNamF3Z3VkQkpvbHpDdmh1ZU8x?=
 =?utf-8?B?MVNnNnZSNllPc1NwSHlraDBKOWE0RFE0MEw2aXhvSXg2empPRGgyU2p5bnhS?=
 =?utf-8?B?OURudWVGMWNOZ05iV0RUR1YxSHRsZVFESE5mZVlLQkVVOWhYOSt4TEVYQWhs?=
 =?utf-8?B?RENoVlEzMlpSWG1BWGpQQ1BWL3FzQzFKOXdiQWZROE9XNnR6OTRHcGlKTXB3?=
 =?utf-8?B?bks2K1NPRUJmK2czMTc0em5ackgrdCtEM1lLZkhnYVJ4ZkFSRmFPQjRQYWpi?=
 =?utf-8?B?aUlrK2lXUFVsMEhzMmlaUmg0OWZ6ajdFL3M5eFZLTFFpWjB3blE1QmpKMEtR?=
 =?utf-8?B?cGw1YktyWWJIcjRCTHJ2WjU2UGU0cmF4NjRkTnQ5YTRMQ2ZUakZoMUo3UURM?=
 =?utf-8?B?Q3VRVFdZMzNvdUE4LzNvd1lQRzBrY0NVL3E1YjBzS3pibENXRTZUMGYxY2c2?=
 =?utf-8?B?bTBsOWhiYXRzeEFDRG0zVVpZL2ZDNXA5endYWXl6VklvVDR6TTZTM1FVOEhZ?=
 =?utf-8?B?b2kzUGxJRmVoTXhaTjl6TTB5blk5UzJuZXdrOXFxYVpLdWpYQUtPV2VDaDQ3?=
 =?utf-8?B?VnNHUGxWWmxGQlk3aEVvaThCNkxSRG1hbVR4KzJGZStRdCtMcHpRQWwyeExy?=
 =?utf-8?B?VElMWG9oVzBOS096UHNobzF5OVVBTXNNK0NnTFdoRnJ2QXNXSzR3WGhZZXFk?=
 =?utf-8?B?M0tKcGtMV2o3b0toRDNtR2FDWk1aTGlKalRtM3kwM3d6MDJqMTF3MFUxc041?=
 =?utf-8?B?Rlp3WWFjZHRvOWZTbWxFZ25xT2pWMkQ2TXZZMkN2R3NabnRlSk5PcER0cjhX?=
 =?utf-8?Q?CmV439cY2DcIUjy8Ik?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293a5779-244f-4edc-898d-08de84067d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 09:20:53.9105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHr7SH3W2u5oGnrmRCxs5NjDBcjXnGO5UglwoZqFHntwXhw749HuoerMB41qm2tc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbld2kk1zOXrDLJkiHyAtBhXm3vHYJr3jWfAfKRS554=;
 b=y139+OBKuLKopY2V/9Iep48FiAQrQ7aZmwhz8zOKW091yBzmLaG78bcqzY+tpbyochJrwvwQpM9uwD71Z00dRCOYgIidfWV1SL9z091ownQrkI7wtY96VOwAQl3AOH+k03/TSYDz4R2j5gSSsbuHD3WMoaoygQszLnviTp7r184=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=y139+OBK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 3/3] board/versal2/post-image.sh: add
 custom hardware support
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
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "fiona.klute@gmx.de" <fiona.klute@gmx.de>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> Users will ultimately need the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config to
> import custom dts files for custom versal2 hardware. Improve the post-image.sh
> to support either the default device tree which comes from u-boot or a
> custom device tree for custom hardware.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs or overlays.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - new to patch series
> V2->V5:
> - fixed shellcheck issue
> - merged with zynqmp and versal patch set
> ---
>  board/versal2/post-image.sh | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
> index af50909fb1..3037e0a5ab 100755
> --- a/board/versal2/post-image.sh
> +++ b/board/versal2/post-image.sh
> @@ -1,9 +1,17 @@
>  #!/bin/sh
>
> -# By default U-Boot loads DTB from a file named "system.dtb", and
> -# with versal2, the Linux DTB is the same as the U-Boot DTB, so
> -# let's use a symlink since the DTB is the same.
> -ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
> +# By default U-Boot loads DTB from a file named "system.dtb".
> +# With versal2, there is no default dts in the Linux kernel tree
> +# because the default is the same as the u-boot.dtb. This means
> +# it is necessary to cover two cases, a custom dts or the default.
> +# The BR2_LINUX_KERNEL_DTS_SUPPORT will only be set for custom dts
> +# files

> Out of my ignorance, is this assumption always correct? What if the main
> dtb comes from u-boot but the kernel package is used to build some overlays
> (and no dtb)? This patch would break such configs, because is would link
> system.dtb to some dtbo instead of u-boot.dtb.

> Is this a valid use case in the first place?

Yes, I didn't think of this use case.

My goal was to try to keep the script as simple as possible, so I was only
trying to cover the case where someone migrates from the vek385 to a custom
versal2 board where the device tree is different, and not just an overlay on
top of the vek385 base dtb which is included with u-boot.  Or an overlay on
top of a custom u-boot.dtb.

In the end, this comes back to the same question for the other patches. Should
we improve the script to handle the full list of LINUX_DTBS? In other words,
we would assume that we would want to combine any dtbos and create a
system.dtb that contains everything in the LINUX_DTBS list, including the
original u-boot.dtb in case there are no dtbs in LINUX_DTBS?

It would make the script more complex, so is it worth it?

> , so it can be used for checking which case is configured.
> +if grep -Eq "^BR2_LINUX_KERNEL_DTS_SUPPORT=y$" "${BR2_CONFIG}"; then
> +     LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
> +     ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
> +else
> +     ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
> +fi

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
