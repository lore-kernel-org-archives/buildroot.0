Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028F9C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 07:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E97141755;
	Fri,  2 May 2025 07:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wj7b9QVW_qQc; Fri,  2 May 2025 07:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31B141752
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31B141752;
	Fri,  2 May 2025 07:33:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E72B1A4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F7046079F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncQgCt3h6yas for <buildroot@buildroot.org>;
 Fri,  2 May 2025 07:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60a;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4ECF16077E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ECF16077E
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ECF16077E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow08JsEBpxqWwaOnCdZEPgo0dLKCyTHCXjhk9HfP+vNdHVbJdneft+1nVrbbK28JwGybE6ZP2ngh7PJC3Pfptj5rV1I06fogJVp0wBPe58KKdgtYZplGuzsgsrikgfMukjGziPfHczvHEeJdXZH46ec9bck4Ntkzhc5+UiaQDxZBsM8dt+AbIOJ+9lbdoCpcbt8m7rVawjMg1LFRpVKYagrMOlaW+/G+k62pQsEUqcQ4GxHhcFR41Lgylx2c4hdrS+hs0ItrB4wSLkXi1BCiuduS/DM8zAM/pXK1gUFx2HRf8UceREHVDictLH9N15kYuh592EEITpQiA6Y7XQUYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97DRpBIvfRc2amwyfKoLsYxEtd0rwIMocGne+Ql5Sc4=;
 b=UVez2lEXbCIn6+R2tcfuvn5mGXQkdVmTQ0JEZrdlq1OTpziN9x97WnRaAfiQsenc1iQ5aP4yr0HE7THSiegmi+C8TmCZuG2jWBM+UVaB3fttFHr2D8AmXJE5SCiEYhmQ862AB6xglkIRre24vvDUjLxCDegZAJERpF3iT9IUt2rsv9ZOyZoxAkspkAJb5U27HaAQf7LAujGfeSsms6wEOwGGBnhPLRh4rO88V/VgFXmBSoXHYNFzCJaQrCBfZccdbKZVxLJiUx8NpTrjsCGEKwlagmraB+oxd9KH5SzuWhgiYFdvmBr4bsiH8ZpP0EbrcDREjBZOzz7ObASCPO5hoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 2 May
 2025 07:33:36 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 07:33:36 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 1/2] package/xilinx-fpgautil: new package
Thread-Index: AQHbtOM3l/cHhDVJS0akcnp6falvMbO8N3KAgALHcfA=
Date: Fri, 2 May 2025 07:33:36 +0000
Message-ID: <SA1PR12MB56155B732CA8C04333BD21EDF08D2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250424063619.789456-1-neal.frager@amd.com>
 <20250430150557.4f8e7efe@booty>
In-Reply-To: <20250430150557.4f8e7efe@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=895a9a9f-9fde-4e02-8e15-49cf6591e2d0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-02T07:32:17Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SN7PR12MB7154:EE_
x-ms-office365-filtering-correlation-id: 334ba9ca-e8af-4438-1966-08dd894ba688
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uQBOQVllxVDdGfPZ42cWLTgi9SSU+CdOg1PbF/wcMGcSutDgPtfflQ3aZzVn?=
 =?us-ascii?Q?T90UYOaXsjqLa8Ps2WMZqxw7sCnEbxw0iu098U29gGjZkL6ySYzM8NbXUYfR?=
 =?us-ascii?Q?0SDy3zl2nBdxQATHbyecQ3owF9kDvoKWs0TvdNredOQmsZ/g2xnijpph/l4R?=
 =?us-ascii?Q?9zLUgxOhR344BQ0vJMeNsHf2o37y/xhKvguAKQVTmU/QNiPIQFXaNUQhw3Tz?=
 =?us-ascii?Q?KwztoNC64uJ+fj/Owbq9LRTZKCm6aQIPECALPFAPg3yCtNUHl8kOM9azlARW?=
 =?us-ascii?Q?gv5Th5RTGp2pqzOM+1LJqd3XSEBWNRIgvOkqB8C2U5JjgobLcpSy62wZ7arx?=
 =?us-ascii?Q?bdaQPh2RASdIANTsV4SQgBKiZu1dKhQlvEX2BX+iuOStKoBj7JbrE7/QeeaE?=
 =?us-ascii?Q?4HLp1H+quLSBfAy5kDebR/9odGINTKbSPNauaJpQBWV6z99gU7mama+zXlbC?=
 =?us-ascii?Q?F00ePG7UlrxBygIdbyrXNnSGGTgy5qiq6OHRZNixE+YWJlf2L7cm1e8oHPkB?=
 =?us-ascii?Q?+WrsQGRemmuXHG77XsMFEYv5LTqoJa1nDWifxyY2zQjE5CTT8kQRV/5QBdMW?=
 =?us-ascii?Q?bAQsMJKJxKy579GGSBsdkEX28RPKxbM4IkKvmCLNWzZ/6oBsnng/dlAxIJ1e?=
 =?us-ascii?Q?YTQKWgRzmqdl9C/PoFz27K7kDK5R/EXnVdxy4t7hPBYFZkU8fPpV+hEOSzDQ?=
 =?us-ascii?Q?tODmtWZgpmGGKGsXqhD9wpJtCFSh+q3mrJ3lZNjCWD4JkcajB+TtQS16z2nz?=
 =?us-ascii?Q?GgYOs6N3LCpzQ1nQ/TA/Uf+HncPwvTZZu6jBb5inYNZPjHN7LfF+G5+Rtwox?=
 =?us-ascii?Q?ys+GsBrt+psBLSwuv3QiHkJSSXVMk7s9AIRSLGZXGbno5qewOB1P/jzqOJaa?=
 =?us-ascii?Q?U1FSdexKR8FpyeAm7OXL8mLN9QDQH/heyWngqFu9Kbf3qoOPkr7NuAqfSNDX?=
 =?us-ascii?Q?N3mO6Bn6fB1YAA8QXfD/hSeQLm6SIzFxdsjXfSeg1b4ED7/NKlHH7Zic+m0D?=
 =?us-ascii?Q?NqUJIOZGIOJqn5GO58rIhAP8mrtssV6uQ0hapBfyPDxV61KMcaP2ttJDgtKU?=
 =?us-ascii?Q?6ZZFMWeqbUwe8gJEvIsC3z3iUxk8yohehTi9FqORNOJX7R39Je/dJB+klVhT?=
 =?us-ascii?Q?ChfUNyNJQcssc5Et+M7/lKV3xljllGZzypGopftPRU7QrWLTFrFTDGygRrQQ?=
 =?us-ascii?Q?rtGK0ewZHkxuxNSAB/y6/5ZWwuAzz8mj9MC/H0yFj2jmKQC1ZKAFYdNbdHJT?=
 =?us-ascii?Q?5drNV9WNNZq4ybZk4TBAnf9oJ50c92+nJvtEIpPN/vVQ+W9CF8kfqn88S9Rt?=
 =?us-ascii?Q?lQpzJstZ/vJ16p6sUWyfvjfHq32GsAiqMQf1RvSJEIIxLQ4vlHFoP9TZ8BH8?=
 =?us-ascii?Q?yF0eEQaZT/pEyzGbbmdryku3Q748QlSApMk3Urp504c5gw1AuVUWrx7qaHKh?=
 =?us-ascii?Q?mmmnHDpf3MGYfhz3+6nU7kGjmOOT6V9vhsQXso/ifT5Wwk6+naP6PA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lfI01Q4d5IlHWPo1Ap5B3KuZS72SkfHw7+KzaK4ds+64RSEtuFDWLyB6g4Mp?=
 =?us-ascii?Q?ekcIfX/OiVbLK7SxKwE8aVoH7RiKvdlSML33zHMShMIwbjjbGmGR/prxycmv?=
 =?us-ascii?Q?niXMWwOGEUuOOaoLGJS8yWFomveXhVHpc4FC91WwnNcLRuMY1xk9S2PPU/dK?=
 =?us-ascii?Q?NEww+guw7vyiFO54yvdeJoQHBQ5pPV3pVHD9ddc3mCw06biVmtFUI8Uwuhox?=
 =?us-ascii?Q?sH+3veaaVlBoeNzupM16FhZWHcPVSk5npNn2J4Fozi8y/m7N4h5i1b0EKA14?=
 =?us-ascii?Q?mMY5fKJ35tW0CLcaJ/Q5KZZhs0HmFM53EPC+UfEbRBvE5QplAN1G/oaBoP0A?=
 =?us-ascii?Q?0omaE0wQ/TcXMLdyA5tPiKNMQib/MMHpXdVrpEQ42QeVMoblHTkAX8eUyF2H?=
 =?us-ascii?Q?eJ/9vIU0N9nyjtZQc1ybwAGHbyiLacJKl6GbICmuHSScljfyvhaFVSF2z1EN?=
 =?us-ascii?Q?dfk8YBHEFfl9eNJJVZ6qi6jQvh+h8xgL+ksNa3wDYZEpha8dsXdksS5Lidvt?=
 =?us-ascii?Q?OetUDChOGfTae4C0+r5VZaNyrmHj1GqQv01CDl3yUvWKDdOpyGsFZBUIPKUF?=
 =?us-ascii?Q?SzbMWiTSmHNazeV6CWMun88gv72fsHPmwubBen7+TgbMR+o7pnkjgYPuX6wM?=
 =?us-ascii?Q?0o+rx8D2Tu1v6cyLEkebFWyIk5ijrTW8t/XuJz55rUz8gfDKNJfuxnlN5oSB?=
 =?us-ascii?Q?rYI1nHEyUyBl800OrapI0AKJjs1dzKDcwDa6OOByhpaHrqINfth65TXYOzSI?=
 =?us-ascii?Q?RFhiRVhX4lGQeIlQKb2WIkJSjtpI0XWKrdTBFI+CKHKS9RfC/znHoYhFygY6?=
 =?us-ascii?Q?QWmY0u4F5gDU5evZKgzK4ICC41DJXlaYdPZ3utzD3FxVN3glAEc1UnBD3vGb?=
 =?us-ascii?Q?yPS2gEA61pNz+aDP2c8nOgTAmPElYpAuvrcnpAeWtNznQVGmPgbPpS3hq9Bs?=
 =?us-ascii?Q?NrJHgCQl4w52D8mBvOejmLpBMiZJIvWnKlUUuwl/1H3s5uzOpRhdXbIYiS+h?=
 =?us-ascii?Q?2f3O0H3vCY7W9BNXbVqfmIZmiRIUrK+z9WKV+y3K99Qik5GxbpCNckZJZ+9O?=
 =?us-ascii?Q?UJr6xMY6OWpipEQxI1w1oYrpsh96fJ4Yh4hBWYGIou2+1iTkCqQmEKnagA9U?=
 =?us-ascii?Q?38SEkQ0CY1iwDn3wa4oUFXq5bDbn946A9p/A3YCw5i1VKXldlPUe0voj0ZIY?=
 =?us-ascii?Q?xioJ1egWMddySu+AvBGlJMG0OjwlLvzjHQyw+DZWXmNvrCUeepjy6o4YJEpM?=
 =?us-ascii?Q?eQELk+euvPvB8Jb/edmmtmR2wETRUaPFus0rKpg+OyHqx5EpzfbUhDQrPPHL?=
 =?us-ascii?Q?z1tE/77wFOE22Nkn74cHAwq6Pw7XbfkncPOoz1f0KqU9DS8QGj4PsZVrgQq4?=
 =?us-ascii?Q?Wphf/yAKECsHBuLh/cxtgKrvjF7LCAJMZUuStYMxjtbE2Na0ZEdNN4kLI0GA?=
 =?us-ascii?Q?8R8/c1X+wmjC0cYKVdtjyRBW5HMUFY8gV8RjdEfo2r7WFb81pCMallQsy3ch?=
 =?us-ascii?Q?LtGtHfyLUR3RLCKcfq22SWeBVCflpa50aI+vLBZb7+sIR0H187S/OmUNmF6H?=
 =?us-ascii?Q?xfyjp4ioIVfesP0FxGE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334ba9ca-e8af-4438-1966-08dd894ba688
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 07:33:36.5444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6f0q1aiBqnKj4aBcUjFupw+ETh7c1xHZlpPIgoaXMeO1zbK12RmhDBHgOmlQrPV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97DRpBIvfRc2amwyfKoLsYxEtd0rwIMocGne+Ql5Sc4=;
 b=2ErT11QlLMc6D5xikSAGtavsE3MrcHx2uxebVGrt9lu2ucBEt92yVGMHh5ovYIZB3sMSrN1Z0tsk+KP3AY1XCTZ9zYAuhPHel196VorN7wXrrKcblhxu1AVDyLeBpyunWuvXsKZmcd1C9gZ/r/T//HBizXOiDyWOS2ak9quYQe8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2ErT11Ql
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xilinx-fpgautil: new package
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Caccamo,
 Fabio" <fabio.caccamo@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> Add a new package to Buildroot called xilinx-fpgautil which builds the Xilinx
> fpgautil script which can be used for loading FPGA bitstreams on zynq, zynqmp
> and versal products at run-time.  This is a handy application for loading
> FPGA bitstreams and their corresponding device tree overlays.
>
> An explanation of how this script can be used for each type of product can be
> found on the wiki pages below.
>
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
>
> In addition, the source code for xilinx-fpgautil can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
>
> The Xilinx fpgautil script can be used hand in hand with the Versal Segmented
> Configuration with the following example command for programming the pld.pdi
> file to the Versal FPGA:
>
> fpgautil -b /lib/firmware/xilinx/<design-name>_pld.pdi -o /lib/firmware/xilinx/<dtbo-name>.dtbo
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> [...]

> --- /dev/null
> +++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# xilinx-fpgautil
> +#
> +################################################################################
> +
> +XILINX_FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
> +XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
> +XILINX_FPGAUTIL_LICENSE = MIT
> +XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
> +
> +define XILINX_FPGAUTIL_BUILD_CMDS
> +     $(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_LDFLAGS) \
> +             $(@D)/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c \
> +             -o $(@D)/fpgautil
> +endef
> +
> +define XILINX_FPGAUTIL_INSTALL_TARGET_CMDS
> +     $(INSTALL) -m 0755 -D $(@D)/fpgautil $(TARGET_DIR)/bin/fpgautil
                                                          ^^^^

> Are you installing in /bin for some reason? /usr/bin seems the right
> place.

Thanks for catching this.  I made the change in v3.

> Otherwise looks good, so in case you send v3 with only the /usr/bin
> change, you can add:

> [build-tested only]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Added to commit message.  Thanks again!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
