Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F73EC3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 12:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417D482C2E;
	Tue,  8 Apr 2025 12:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkPK4wWWDMtS; Tue,  8 Apr 2025 12:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4046F829BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4046F829BB;
	Tue,  8 Apr 2025 12:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A53E21F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9661C60655
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIATcW_CUBdg for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 12:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::60e;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D902B606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D902B606BD
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::60e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D902B606BD
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kp5xS5PRE25dwdOxKm+gT8oRFANNCKEI4se/W6Yy+xYQXfvzGLKFH0a6+I9PUmBC/Vql+5UlUENyz9aAq9o9/lHoGLxTWD4ED7ht04ag6+cg7LHb0Zhpn/zivJiibw1qcEjiHCv2g67fwZbvAuBzJnggqWvGohpduYI9GP3s4OedmDC820AuCadPm11aEurfv2figAXvQllf6c9iPvQYm2rEZD/qXXB+vJa13OUD6CRpcyEsOXmxykZ8kYkY9J8osvjZ3k49WEKjbtkXHfE6Vaa15Kxk/GGN388KLj0gC4iSPTirc/cOyi7JXvfDhTs7w0X+ObC7lRJqDSFTPXj95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INAKVj21opJ94MVtYC9mLLP1s93OjEnYrgikeOcIFmQ=;
 b=nT6P2wfq9hHGG/FZsZdPPAqXVRhFaqW8t29UlkAnL+pas6sEDfYo6HiaVY13r6pIdM2y1J0Eh2kqlSHdzRYtleYviVEYhcgxBNfjbOhoHVQOlNREuSmd/sKGHeX3aNDzioZi6iq078NbsZ0a3AElZTGLzt+nqQLAtDgoXNpj1i7Cs9/3aF9vzZHym7+qVeamoAuWVwAAtF4E0jOC3QqaUhj1Xsm3EIx4hLoc0n3o4ybQZSh4yy7MK8Ngz3P0gXjf5Sm05/xfEh4mQDAUtIbu5WfzHbMeD8FNQ0XQ/ShQVI9ljmN9mPbDAncJCdIzPLS8Vaz00p/XaY3AB4YfAhTZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 12:19:15 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 12:19:14 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/3] boot/xilinx-embeddedsw: rename toolchain vendor
 to buildroot
Thread-Index: AQHbnwnAsyh9xYkhAkKBH0vOKDydwbOZYqaAgAAAvBCAADsVAIAAIzpA
Date: Tue, 8 Apr 2025 12:19:14 +0000
Message-ID: <SA1PR12MB56159A09F9E41551CEA142C4F0B52@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250327111645.1430919-1-neal.frager@amd.com>
 <20250408083505.0a7ecfda@booty>
 <SA1PR12MB56151490BEC4B0D5D05E8991F0B52@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250408120910.5dc50b98@booty>
In-Reply-To: <20250408120910.5dc50b98@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=06bb9fb8-a8d1-4874-ad1a-5d698bd8fe46;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-08T12:15:14Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MN0PR12MB6077:EE_
x-ms-office365-filtering-correlation-id: 3cc0270f-ba77-4b75-a000-08dd769793c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qXQ0FVp1O+F3sJa3VuChgLXDva7Ha0aCoBQH6i7ek/6SwSQk2mZV4uARzO6E?=
 =?us-ascii?Q?ihl13gnuAmCnJLasCayciTOMTcvj3NJ3zwS0XuIGerl3m8xQlVcumYaEk9JE?=
 =?us-ascii?Q?QZ08JEM15oV8bWJ/2TrJxMrweKY9QhRmZeqBG6CH38TfBJzZS7xSe1WwdeRF?=
 =?us-ascii?Q?k4oy/mhYPqmr/hdgLrOIKjyCP9JFEM6u64M0EF4w1FEeVOqeSpeoKD29Y6P/?=
 =?us-ascii?Q?7a7K5hO/CRbWs4gR7PWBhz+zZMTgFrFA5ZCZFJPl6SToQ1U7mVOz6S+AL/fG?=
 =?us-ascii?Q?AWSCa8BO0qOaanpZ+etpisLaIDrz7ugS1SNkYzPcGMaU8yw4sdP/FjNYGka8?=
 =?us-ascii?Q?ODzJ5n6ByJv6TBkoAjhSrpkNx/V/gQOffr6LMjHNyUJQ4SDnTgoa0gmsksM/?=
 =?us-ascii?Q?b+il5ovsGCV1IjbYk/qfl2sMMsNJCLwtMKIy3xMwuKRinvOWvwDdWGRk9Pmd?=
 =?us-ascii?Q?YOI54+GLV0s5Ek0a9T4Ibs9c3hE36IjPdV09zbcuf93Nt2XopuJyJOlNfL5e?=
 =?us-ascii?Q?IblkDtMhGwFxFNf46VrEcfDXrc09NtHd6VvcR6AkxDwgfy/YyGsexMGO9xdz?=
 =?us-ascii?Q?gt/FdOyuUmWX6jiGVpd+36O4j83Vnx5VAZFa8EKyhSsPsjusFW7If5tg/rPZ?=
 =?us-ascii?Q?lke4zOWBtuOQNhHjFrxFzDAmQl+kXRVEumbLUg54ORBANWWRnzWrNoahgxJy?=
 =?us-ascii?Q?Z2cDFs1vGJAzhKAsECKm3BsRyou/LV3AFftchys1EF0wGeCUiUvFXPsj8m8k?=
 =?us-ascii?Q?NzGhP1ODT1CuM9TW5mwQKoPGNvneOsMeOJsV+26sQzt3URp1dj7Llsu6xpHS?=
 =?us-ascii?Q?2nk67QwzKBM7L/KgsOFBr8zxnHB02+Qlmf+8p6RS1xIIf0Oq8NF+NeiqhUy1?=
 =?us-ascii?Q?PpYmao4YXm7qSfeo8BY8OtmdbLmJ0TgQAFs4GUJK+cdQG5TCyhnWqcyiV9QR?=
 =?us-ascii?Q?eOE5ezgAaa+iU0lwyoov/UU5mCSF5bL/2aoWG4Sp3MMW7SJ5RectHxp6sUmN?=
 =?us-ascii?Q?zNsY/3Sftk2imz4Vva6XEgc0+l1sxmYMxAoE0aHYVYKzZKqAg0fOhYMjL2yt?=
 =?us-ascii?Q?z34ukCJUh3HLlLtN6vszw8qHjj3bGAAKXGZxi1t8GqYTMYzMpJzbeTvICIbZ?=
 =?us-ascii?Q?07m2ulxvIzmovpf2EGXyrpTjVceNMrtSdCUkACBnI1jXxxrqS8oVvnm9b5o9?=
 =?us-ascii?Q?sg2U2rmaJxfLvy/dcj4Qlgk/J2FU6mI+fOPsZiPcmQ3+SEcowLaPwzMBoA2G?=
 =?us-ascii?Q?wGVOBfj9iC6hssG1kjnNkEV0Uljc+rt4LigU+5zV4+wwZaGG3vK6e7OhI97W?=
 =?us-ascii?Q?ulr3d5j5LABYIXrlJ6J6CDn2iLNuOxX7vGvbO7jXhiv12hZcAfHF6bhb2oIA?=
 =?us-ascii?Q?GpGxK5csuOHWB13QHbxGW0lR0CQA52r6zzbOYOPcLa9DeOYtwogyx3zi77Yk?=
 =?us-ascii?Q?vcM8AEQ6ro5zX5lm1sIPqAvInW0jLeODem+x6mXWCNvK8PAiiCZNIg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v8JeCzaKOTGojP2Ff3y3rQiMEobeRkF6tg45nIT3osj5p5J1Ad3e9JJ5O8Ya?=
 =?us-ascii?Q?qz8DXNa2dxe/E3kIRQAfzZ8H32mAzhYQPIgwEnQEbNoiXiJkUBAD4dndTDte?=
 =?us-ascii?Q?7DS+VHdiyS2KHOwzcFSfjZMfEJd2i71aywlATrknX43LA30d7YFOp2isBHOG?=
 =?us-ascii?Q?UfHUjyV5fRFlqTEC34IIXlhS22cfFKDLq6LrpbyA3JGoV2YMLKU6DW3RNJo9?=
 =?us-ascii?Q?zpf3mw9+eH7eZuanACLaEx8R368eVGTXQ7RVjuAZgqZQp5eQPapJi/34flcs?=
 =?us-ascii?Q?PvZpUrp4jm1ZhjdEXhGYyARfoLHf8cPAmhFrgPCa4BMjcTQqqco1nH4SNRxB?=
 =?us-ascii?Q?RheFnPbhnQGfqBMgeHkNbzE0va1m4Ms1IWVEhnxkbRzu/MLERVbbZePvSe7Z?=
 =?us-ascii?Q?iD7gBJOrx+JVWyaM8RIcRCy0PjZSngTynDK/HfMnJM1Le2k19hP6gI0z/MqJ?=
 =?us-ascii?Q?2LeJwarRZJu1rt2GBiryss0L9GnnU9CihL0BY+uxSpuPfP0BFs1b0VP1ocv8?=
 =?us-ascii?Q?YT5AcYi+9AhjUBWJual3sD2V5NfuHHfQhg7AFlqdgdjv/b6nKj4PAGi5QI3h?=
 =?us-ascii?Q?t7uBYFhxMy8O6MOHZ7qPDEOI+h6UinuvUgohM56z+Ng10ge1vmtuYYuU4v9a?=
 =?us-ascii?Q?dgWAKi3nr4ifo9if9islg6kNT7hqhjXP/a2y2HgKe68dgDuP3AvzPp5Pg860?=
 =?us-ascii?Q?Sx7Nx1AwMAFRJnV9C271HWnMEEkznobsxasY2OY0suwLrjMLaCDalYTtv9Df?=
 =?us-ascii?Q?2ZKZK6HplmcWe4UVfzdw6stVSXV3X+JdncnLSr1dDgJDJeSif98StrHIC0iT?=
 =?us-ascii?Q?cnspHg6MR4vlu43aGDZzQgHnq9V71GKIPomd97y3EIBCs41qgjo2ryDeryCb?=
 =?us-ascii?Q?hYRyH4Ye461mkvKrlxlEOfbulaZq6K77xnv9+4C549zNU2Ld4l+x3JHEf4UW?=
 =?us-ascii?Q?axYVwkiRH6fkbVHEeRyWARF2BtdyikWSJfQHg0G3486YvVfixCciEmX2I/0v?=
 =?us-ascii?Q?I/eK/JHIJ5s38JOGWRHkSpvGrBGcPu5Fp0aIlhgpZXDcdtwu3F82RX5mmNEu?=
 =?us-ascii?Q?e1PInAnAgSOTBAB2jRd88iUBQbZJraYB47LbYf2DW5oiXfPCe/dSt4Tsz0cY?=
 =?us-ascii?Q?NB45E4JBh/jC1UZRySE01Rr+m7qzICVcN5xSYVuJFrCyvWe0WsvUEaHpM89K?=
 =?us-ascii?Q?Ys8ZbPKcVGsCYwe6dY2GEn+G7dcbia3fpbgaFoD82XnfV+zvM6gCKScuPwQb?=
 =?us-ascii?Q?ClicZ9pnvSebRf0UcJ4msDW4WsxYPVIQ1SlCIaP6Cpk7njHDz37Vf/n/zHY5?=
 =?us-ascii?Q?V6Nfu96l39etUh6A2ivOwz4rkyAQMEeLFislWk+d9LoHx7SslBSo4tPuE/Iq?=
 =?us-ascii?Q?J6WBKLT+ESBkPh++SnXDIvYBzH0vQ6s65apRDs5v0BsXgqb3y0FptikyvGx5?=
 =?us-ascii?Q?qCO3bYF/GjUC+XCiQZYJBtN5sZBIw1yNNEfuVlKgtn8S11Gx150ZfHKkXqgj?=
 =?us-ascii?Q?foLtHxWrXDtdKBxRA13pqoY9oweUpmpzKWUxPoFMhQexHdIPfCJFXBK6F3hE?=
 =?us-ascii?Q?0m/Ei3S1pR/ZTc/BSCo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc0270f-ba77-4b75-a000-08dd769793c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 12:19:14.7570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbrNk38F+LWpXtY88TcyhsOBqa/irqLBXVnF29RDJ5hCBifDNcnGqJbEIYDLRpT1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INAKVj21opJ94MVtYC9mLLP1s93OjEnYrgikeOcIFmQ=;
 b=Rr8eyHZQLcq4XQGx7P38DFo5P+1DCLejugg+V/4RKP8TPfrxLVlX8t+GCrOipOaPneEmv3Y7tMH8NNLUCA5uTHV/tAA6L1G5KMNxuPClwJqxUlcyH0dOzUqonv0Sp/qc5ZzEIKAUzSGKAwTmUU4G7B844VkgqdrgUmYE+CXksaA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Rr8eyHZQ
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

>
> Hi Luca,
>
> > This patch renames the bare-metal toolchain vendor used by the
> > xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> > other toolchains built by Buildroot.
> >
> > To build the Microblaze applications available with the xilinx-embeddedsw
> > package, the following config is now needed:
> >
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> >
> > This change keeps backwards compatibility for users already using the
> > following architecture tuple:
> >
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> >
> > Either vendor name is now valid, but the documentation will describe using
> > the Buildroot vendor name.
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
>
> > I don't have a strong opinion about this series. Definitely the
> > "buildroot" vendor name is more appropriate than "xilinx", and the
> > patches look clean enough, but I'll let the maintainers decide whether
> > it's worth the extra effort.
>
> > If this is accepted, however, I think we should remove the "xilinx"
> > vendor support after 1y~1.5y and not carry the maintenance burden
> > indefinitely. Do you think this can be handled by Config.in.legacy, so
> > in the transition phase users of the old tuple are notified?
>
> Yes, I agree with this.  Probably the sooner we transition over the better,
> in order to limit the number of users of the xilinx vendor name.

> I don't think the number of users is very relevant, and we cannot
> control or even know that anyway. If a kconfig value was valid in a
> Buildroot release, then we need to handle the transition before it is
> made invalid.

> Config.in.legacy is the primary tool for this, but I'm not sure it will
> work for this specific change which is not removing a kconfig symbol
> but rather one of the possible entries within its value.

Good point.  Yes, I agree.

> Maybe you could emit a warning in case the old vendor string is used,
> suggesting to switch to the new vendor string, and after 1y+ make it an
> error.

Yes, I could already add a build time warning message with v5 that emits
whenever someone uses the xilinx vendor name.  This is a good idea.

Would it be standard practice to add a deprecation date in this warning
message?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
