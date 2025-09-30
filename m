Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F091FCCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 12:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3A860ED4;
	Tue, 30 Sep 2025 12:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1sXlzDX8YoK; Tue, 30 Sep 2025 12:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBFAF60ED5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBFAF60ED5;
	Tue, 30 Sep 2025 12:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21250111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6C440AC7
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfLmMHkw8zNe for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 12:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 397F14096D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 397F14096D
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 397F14096D
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMETk/AQqgyW5rBZ041BLF+ICpgv1lhAlrFFQpKnkj0FMjXrlVPDODpj3g2oPKrEAkOwcyt/vzVygAtCNxKcVdE4vw1TM1NhCx1bV5ZWnc1Uf4yGsEXI+TygAyBiyIKbQAZh/u0xZg3a5NGbB/TQLuFpDdm4GgVGNoMN0BB0I58BpTDZaVua25daclqfeV14WpF4urc587nj/4O543XZ++4PHHPjuCOyrVWxSgR2B4mwWR8yTnrAlh9r0+rw6KtTE0cctOZ7AJBtPfvrmVLaewMcV8Nd46PV8oGq0lEPwTeq8O2ozcQ54FplnxWLj+FN8U5spy/PTc4ss1mL2hWqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED+tNfxrLrcYntrWUgiLWzEfdZLKZppTUtM4nzcFHoo=;
 b=HjnqOzIfUuW/UJlMz/HoIcGpNWQct5cdwTOjc1ZgETNt2zLw5Wlv2j7oe7Q5MKJsn+p661qhey2+9DfI5B4UmAStKWYiLzUxOiU8lkplRkcJB0dRcdtRDx+wgg85eMr+zSyWKgS1ed2vuzfih0P4e8lzZQx0hjpt0YPLqmroA9zTw1SoxRXA8L2Zq6FHsJHXy23nnxwA7WZhcQzwpEJCu5RHynVpdBC7hJ2z+cqRL1jbe6lhNSajoG3VXE1NJGz1iubQmzFbMfg7tAI15JToWNAnFV27wFy0Wxr3Frd645Au001QHC9K7kI3uzH254pTItj05STGjr5kmX5Ipa5eiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:33:02 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:33:02 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] boot/xilinx-prebuilt: simplify family logic
Thread-Index: AQHcMQ7Pp5L0bc9TV0yZgmZKcrHE+LSrkr8AgAAXSuA=
Date: Tue, 30 Sep 2025 12:33:02 +0000
Message-ID: <SA1PR12MB56156C8A1BEEDA8CED655A69F01AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250929070052.132796-1-neal.frager@amd.com>
 <20250930130738.4948264b@booty>
In-Reply-To: <20250930130738.4948264b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-30T12:30:59.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MN0PR12MB5931:EE_
x-ms-office365-filtering-correlation-id: 4406a102-b291-4e6b-f5ca-08de001d7f90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UemolwIDVUoC5vz01OL6BiNvU8ZChzS50cl8E9lD0ZeISJoqLtp0lf+qHlvl?=
 =?us-ascii?Q?BXDAyYWrzuLJvyFHRBmP3gqyhQrZzITbiE4WXNN0+JM2opVeHjKrgRiphmLN?=
 =?us-ascii?Q?8H5C+WW8Th0CqNh+DYN3Qo1O3yLRjU34v5VOzl+TtX4RDuXe1G6s7UKW70WS?=
 =?us-ascii?Q?FBa3SgbGPLlunG+swpRGDrOLsQlcW0g/C0PLplVpWWga4SRgJUl+PuG97EPs?=
 =?us-ascii?Q?tIgscIo9CsWcbskWtZYIKoiqknrqXugVxlPL1AIeADcHQfUq87Io3iiNnSpU?=
 =?us-ascii?Q?ZidCxypDoHeyqV1qyWtkwbXq4nVFDXsam1jZvIej9f0MdfIjRay32TGsFLZd?=
 =?us-ascii?Q?+hmqJCH3BKzVpdCuqCa5xUZaJHkJTUjkSUa+E/TqRFgjB49M41UtKwIv8z9I?=
 =?us-ascii?Q?914l8RZLhqJnuaKvwX+0M3iS4/6unI66BV2QWfSrBIMUKsEF+Le71vmv3JAZ?=
 =?us-ascii?Q?iNUqFj23jLTRaty9k3aYI0Ad7cqZW3Hox2KDPegcoU3GcbmBo3VuCvGViiq2?=
 =?us-ascii?Q?8RJC9AafzUUmXUcZmyvNb8h3N6c3PtjUO4nckD36AAibnvNn4vgBMYtfPMUK?=
 =?us-ascii?Q?JbFUtEhoZ6oqiX7zMmxKuPXWRYVjCIdRBu8Nn+CtVkRj48nHB1OcFZJ4KJjh?=
 =?us-ascii?Q?d6LA7humOZI5zWOFqXsfChwiYaeeC7EVJhz/dY/flcvEEngy4tIbPsblaLcn?=
 =?us-ascii?Q?HUll+Zckyg7Y6MOUcG2elISVsw5TI4XxEGMNGWRHDO/bqgGY95NwmZu8bYGf?=
 =?us-ascii?Q?38yjkv/erdlKZbl1iuNfNgqA6ot7nxPWhWunfAwCVg+R4MIY/kddpyhwZpMZ?=
 =?us-ascii?Q?qgSXpLBQ153SmSeJmbhKb8ReFfLEIWS3188AU/OsXdG0Qkv72YZmJ70/WcUe?=
 =?us-ascii?Q?KuU+UICeFmwoL2gRBBrgFfU+ErSebmW3hONlmjxUTu+My/NqR0Y2MGz8nVgt?=
 =?us-ascii?Q?d83IcXDUZEwLsL7XzMBNJmT2KjNACROQUTUD9lzWjcuN5vZpS9hUZ6Mo00dP?=
 =?us-ascii?Q?baBynXwllsLwWVW7zQVJaKQNnU84CuDPt+/O/dU3U7PjFM5EnehrWQ7cSpA1?=
 =?us-ascii?Q?/BOQzABfWNtKbfIPV5tVgp/gHg0tpnV/dindVpIp6qGgpxASh0yO9miEwhSC?=
 =?us-ascii?Q?Nx5aZ2GhGdCOrbRv5vA7oP910lPwkfCjJXJD/Jc7SwfoX2G6vLmhM2Pr2VZB?=
 =?us-ascii?Q?B6hz5Rwqij3XdzjPwKpTuFZqm1JEq8POTA0JKbUjqJ8DaLXMrKqp8vluPXjG?=
 =?us-ascii?Q?bvh+Gg1U+B++A/TaPf8SPaU8I17beppZ1Uc9Dm79YkBP1zF08lEI9HHpDgC5?=
 =?us-ascii?Q?Rqi1qzISdL79rlYVQWV2ijp7d9eu6cgpn7mbMPDKh3iUo4eaOJvOVdp3Ujpj?=
 =?us-ascii?Q?Hazjk5PtGM8sD0P8JYNeffLxeAaIdqdt8KAIjs8e6+598A5imFEKyxYOMi1J?=
 =?us-ascii?Q?uTKBfqXfJC+9E3fjXZqDbcVMMODC3Co0ZRR+DblVbHZAaxb66uT9jF+K3+nQ?=
 =?us-ascii?Q?bBtJjnhF3W7nbHKi+Bv7nh1PNrd3NR9O5/xqi1kVQZmrVdaxqcTWhwYKR6au?=
 =?us-ascii?Q?uAOmMsZ/vOZKYaVCIcU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BAYMSJXYqOd+8qR9/oljbQN8tWsTClw0KmfUKJdt2NsKjQXNhFYJqJhUsrOJ?=
 =?us-ascii?Q?+ZTBqeFO5PdRLOXYxi8YDYdgFgeJz0EQOXUXvm52Q1d/8Co/gHdyNE6pUPO8?=
 =?us-ascii?Q?NY3BhjzoPMQblmbPValo7CX/MoRxao3r+uPTGKH8m4w2EKcOBBmaKiEeydTZ?=
 =?us-ascii?Q?JvuPGL0/79UyfJXzYA4JDTd5kdd6DHRSoDlpAQo36yWAi/CWewnkH8lYSO+r?=
 =?us-ascii?Q?kZ7JTEpIEveilQGZ3KImf58CNsmzQpyo1XdSbjfzjhkOZ7It1l5BMp5v/6/3?=
 =?us-ascii?Q?e7G19KDevO2MrzFHpDN+tlRw6NCGWc0FyqYI1XaJkRp99IxOx3Epin299RjS?=
 =?us-ascii?Q?bFzNbCLhUF1cgMa2+6QTsqOMVjvaBWtswbeHKXKkmHJYbsaWGfCQeVTkqrnb?=
 =?us-ascii?Q?UuDO7VLHilBljyVH6haxlQg88ay0hIEWRRU5KoixmtsYLl/3DAHBY7SnBZj7?=
 =?us-ascii?Q?Oe9NeuYsalfaG2jZSv0sXZ9D+OC3dzLsm/byaiIvIzNjSPgxcjbkRkL0zGzt?=
 =?us-ascii?Q?tosoz1NK4wOPcDEaZjIF+f211Dwde5XLfV5L+d3yILYQLUlklX2lBYHGkMQY?=
 =?us-ascii?Q?CgUHLxXBRG5/4xUJFnbIQ+xkBpB+rU7fcidoacKs4MrZ7pxH05Pspa4M7KP+?=
 =?us-ascii?Q?dfMLkvibNbqrlIdvkWmalEiNzjYyJPQD/yL/g7TGin/lnnnS4K3UN0zzSqLd?=
 =?us-ascii?Q?5Pml9BIORDamZTo1hkljFCMfspTy23N9Pu6P9+X3uQQqB6XnrHN+zx7DiT+F?=
 =?us-ascii?Q?YtB4/zcO3P/392wSAAP76K/RUwGaMWADhmYjwklNggtlSTkAgkzWGZ5aqrUg?=
 =?us-ascii?Q?pngVaaAyX5VDNtYLgl/CHS1l/NLxuCQ3scuKvLqfoAuGV3WHdInNVKwdLMw2?=
 =?us-ascii?Q?M/HPim+j75y/LYQewT7xvPvcpSXKvFQR+pwh0x7nssWvwW7Db/j+tlhp9EwC?=
 =?us-ascii?Q?qG6Q930dhs3c0KqbFSfF8j9+eAUF/DI0aB+VuPDoX0X5pKp9lB8Q/wIruMB+?=
 =?us-ascii?Q?0MS6pSKGkmBBQ16NC8ikxbYsPklfaaNH4R9KBmVUGvO1GUf7lgrUYZ7m8Uwj?=
 =?us-ascii?Q?ZXFeCPFmVC5FbDxCtBCFrBbsQ/UhoOkzusp83qCu43QRH9Rj6koxdSc5mNky?=
 =?us-ascii?Q?wVq5veOFvqICqGokDqNt5CiQSzKiQhBnn7qulRSfWtqpc+9O6LBbr0YQ6IKz?=
 =?us-ascii?Q?LDa79flHCXj3Ag5PIcL4x6KFrJbZmwkt1Qn2xqFwgSN3jXQ0zmu/L7uMapPj?=
 =?us-ascii?Q?vF5qmCg7zyPTyLRykC33erLFIG8i1sFS0+4JiylGPM0cBGLFLnq+9Z3+V8E9?=
 =?us-ascii?Q?omYvf1zzeXsOLIyabLDzseWhGqIAi4sADB31xpYnJ2Ii6xQem2MeGeEhY9ZL?=
 =?us-ascii?Q?X7H/LIMIlaviFUnC9NNJ48Zz9j3WC3acY8BWShX48WWa0ExlOZukOvrUADol?=
 =?us-ascii?Q?z55T+n3vYe742KAS9kKflj0uRCWd+Z+0YM4s4BScHih8EHgvalLozg9Dsaf5?=
 =?us-ascii?Q?yRGyOag/cdG4xrmEItxr5XM3PRs2HcnrzJYaf35OfHv7943bwxTUxiRv6W1j?=
 =?us-ascii?Q?1nwQRBj5V514CIgtlBI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4406a102-b291-4e6b-f5ca-08de001d7f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 12:33:02.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0GOTWle6WDU9+AEt1HmVbpaBwU7Oi28KTD35N0yHVDZmQzpli5UO4qJKtBr6GQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED+tNfxrLrcYntrWUgiLWzEfdZLKZppTUtM4nzcFHoo=;
 b=r52wUWm3PYiVJpIrxrYIOq4DRDwMToQvPemZcqxqCiRuRcjUr0KybfTg/71dW3YX6lb/Arg+SqPgIZLVYyK31YBFi0mRmO3+a64mlajPyjBIxc5Z06DsuL6ZBWP5fz0sc70wagRTFLV0VsGT7T8lbu+SCfk5zsyQnAszqOjq3cE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=r52wUWm3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: simplify
 family logic
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> Currently, the xilinx-prebuilt package uses an if-then-else statement for
> deciding which files need to be installed from the xilinx-prebuilt repo. This
> works fine for now because there are really only two options, either versal or
> zynqmp/kria.
>
> Starting with the xilinx_v2025.2 release, the versal2 family along with the
> vek385 board will be added to Buildroot and thus the xilinx-prebuilt package
> as well. In the future, additional families will also probably be added to
> this package.
>
> To avoid creating a long if-then-else-then-else statement which will only grow
> in complexity over time, simplify the logic of the xilinx-prebuilt package by
> giving each xilinx family its own if statement. In the long term, this will
> make the xilinx-prebuilt package easier to understand and maintain.

> OK for splitting the if/then construct which is not very readable as of
> now.

Agreed.

> For this reason, this patch moves the zynqmp/kria families from the "else"
> statement to having their own if statement.

> Not sure about this, see below.

Yes, you are right.

> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -103,21 +103,32 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
>               $(BINARIES_DIR)/psmfw.elf
>  endef
>  endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
> +endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
> +
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
> +ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
> +define XILINX_PREBUILT_INSTALL_KRIA_PMUFW
> +     $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
> +             $(BINARIES_DIR)/pmufw.elf
> +endef
> +endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> +endif # BR2_TARGET_XILINX_PREBUILT_KRIA
>
> -else # BR2_TARGET_XILINX_PREBUILT_VERSAL
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
>  ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
>  define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
>       $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
>               $(BINARIES_DIR)/pmufw.elf
>  endef
>  endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> -endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
> +endif # BR2_TARGET_XILINX_PREBUILT_ZYNQMP

> zynqmp and kria are doing the same thing (normal, as kria is a zynqmp),
> so those are duplicated function. Unless you expect them to become
> different, then I'd leave them as a single function. One of these
> should work:

zynqmp and kria will always be the same.

> ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP)$(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
> ...
> endif

I will give this one a try.

> ifneq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP)$(BR2_TARGET_XILINX_PREBUILT_KRIA),)
>...
> endif

Thanks for your help!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
