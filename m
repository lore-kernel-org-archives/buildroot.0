Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6A2CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 14:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20CE608D8;
	Wed, 13 Aug 2025 14:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIH3qc3HOACT; Wed, 13 Aug 2025 14:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F179D608DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F179D608DF;
	Wed, 13 Aug 2025 14:22:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3374E1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FE04023F
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DvpWoRv-bLr for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 14:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::620;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDAF94091C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDAF94091C
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::620])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDAF94091C
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8MMiYN2iJUlJAGoiPVoD4+GjtSeY2oQMh3XW49HmN1WwGa+skMIwAv12GNfUBjt4Oc8uOj9/UG0DObo7DCe9/e8C+AVFIlCEwxKmdWKbCS4GbI288eAXnSc200LwHNudcF9z58nLyEWB06rbsFyhoJElhgIf5twHZP9rkYxpEBPPCebGZZS8ue+ini/21JLOAuNPGwZnX5m0+Q9IWbF0c8+6HjEySIc791vZawvMg8Qe9i3XV4aFxzb3bmImLla1k/lZ/3UcWKwLYRETBLex/9N3j3P/NmXNqjPtq7LEespAtPwXy4+Ipk80UkTQJO+zdEVX8PYLqUgn8PqLFpNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOL0Fqb6D/f9bdsPv2K+eJi78tQyWrIwGC7y3belleQ=;
 b=em3wah+D1l8L5QJ9aUnqkVaOgxAoLWqWMuArfpf878Bv0hI0va9ZWxjXqdZE8t3Ib5EigyCq7Pjl9QvXA6MUnyvN6n6PtxzHs9MTHHHW1llMsufDBdjRV4pi1VRk/KqvAKCXep2jagUQ7HMFVK/Pzh7H/A+IzyQ2xZ1sPnNw4q8PifHLgGFJTLy5H6lTxJom1H8SslvmJiijz5c41/PuI4Lv7tTuh/dCc6EUR/VkwaFFc/cutB3E+4CvsqZUCOX6n47VryD5kejMP4Z+PuEQn4/WN+IDEGhRXaV65joHbTjSIVQejd1HzYwvUB1wAEKM9cEo+ibrPeF57TJP0OtbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS2PR12MB9662.namprd12.prod.outlook.com (2603:10b6:8:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 14:22:39 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 14:22:39 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "yann.morin@orange.com" <yann.morin@orange.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTsyAgAAB8ICAAAOasIAABXwAgAAF3OCAAA29gIAACYbQgAAd3ACAAA2dQA==
Date: Wed, 13 Aug 2025 14:22:39 +0000
Message-ID: <SA1PR12MB5615D280061C41231F1D0DA3F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3>	<20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
 <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813153132.5942d8f7@booty>
In-Reply-To: <20250813153132.5942d8f7@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T14:20:16.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS2PR12MB9662:EE_
x-ms-office365-filtering-correlation-id: ef1ab117-b878-4d9d-c5bf-08ddda74dbf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Lds0u2kOZ4g66Te73DgimaQkIg+r4SMUgrCcIQLA7yeWADsY4Cv5apMpOIJd?=
 =?us-ascii?Q?OkLobi2FyirWYeDhLgOwG4G7ggIIxYiq9oBw+t7uiER8rnZOiEf4VX3F1HVU?=
 =?us-ascii?Q?Ei3T3Nzad7v47SOE7CvuD1bwLnCwptubRTIjq4zqb3jq25ya7eYBpVsWerli?=
 =?us-ascii?Q?NmoiizTiDrsPbHMt6CfmqR/SWLBL0JAiNEwfCYTP6fpuhuPLOTKOBrZ01bQU?=
 =?us-ascii?Q?nIHhpC95nWCG9RWGngecfh1KSD7VT7xcxm6CAYlXCxmOCj3zOOFL+5TwmrMF?=
 =?us-ascii?Q?u0wCHCcjT2Qaqk+YKboq0AeUqbFBdjUeuues7Syv2JnrkonWr9qsn9XMYuBF?=
 =?us-ascii?Q?1SMw0sMGdKPCLtVqPw5EpGgiX1hgTxAbUL2VXbH4mh5fxXL8QjUuc0ipNjUl?=
 =?us-ascii?Q?Yu61bunb7av8N9FLbPSteEDZZyyOmfuKIMTfgeLBpFcugASsEKshcnVI9Mqe?=
 =?us-ascii?Q?N7y2dyA1H5VXFt1WpKkUSzS++DdcjOUFYTgsngTXKMXD1SnjKMOxS0Kyk46s?=
 =?us-ascii?Q?aL7pZtiVC/kKkHHumiBI+w0uGIqpwG1YKIun1yuaXETGbm5f9wxTTwQ3z2c1?=
 =?us-ascii?Q?5Ee6N4353PMW55M8yvnpIu7is5SjnDXnkU2egO+dQpDbkQGShQoGTLt7Oeyr?=
 =?us-ascii?Q?p92Kx05wUexa6ssmTNC2S6coJMmROosjOjGW2OXtHhg5jHNGtfIUI8Kdvbjc?=
 =?us-ascii?Q?4w0gHI8cYGOoIYp1eHgoQdLhB2batP6kLzgZeSZjPnipF3fcc3JamzrUlJfP?=
 =?us-ascii?Q?+v/NKXDSkBZpav50s3qKgFNZA1L4lIRosW940+3VhvRzj795wmoDvOD22gL7?=
 =?us-ascii?Q?yf4/CKhEir2vftx5UUNfeE3S6Mjagw3XynD8puO/HAkKgPyFr/8QyE6toQoQ?=
 =?us-ascii?Q?U9uCT1cXlzUY5LNwOFx0GJvUrERMTWLOPvEW2BfDA4ijnuZ4aqT/8ksEoZht?=
 =?us-ascii?Q?rLGdsnm0xRgab5kJ2h1Em7eCUfYz/JBT0L9kYfp1u3HU0XfSqUv1GtaM20zQ?=
 =?us-ascii?Q?NowJnIC8nuvu8p72pjb/KepnZkJ5sfyDuIcJXUoF8aqU/GcBi3vbh/SYALNc?=
 =?us-ascii?Q?0hr2RmxalWjQfQVdKd5RJZbiuemrZXp6GMGs07gRPrv70VCfkh/JvLWGD6/T?=
 =?us-ascii?Q?2b9v9h81fXqThpD3PdRFYkjSgWfVVgZYJibbQvIjLlFIAp7oliogOh2uR2bc?=
 =?us-ascii?Q?ZAk9CAJXEXlL/4uteJ8ZT/0nbRQC+eDHZm/33wtdZBWu04YiWkZ25ok9le4R?=
 =?us-ascii?Q?tkfbRTMIGTFHzlUkamqyeZ0e9BDC/EP/krqo/gNdXazX3jDdiL4riXLcFKtl?=
 =?us-ascii?Q?3AvhmSSd/N64Q9fAbo9KSTN/M+yjlBvte+Bd41RIxW+E8cUSd5GDaHNWdFWe?=
 =?us-ascii?Q?g9TIQmDzGwOsirCHDGjw0puyMXee43CJcYAZf3ODUOoOK+vw4/tFqkzemCh3?=
 =?us-ascii?Q?z5TqN50tv0u4mrhMAbp0/4tn0NHTP93o93XLvI8ICeJ4/WHWJFDySxBHq+qV?=
 =?us-ascii?Q?Dgam3Ghavqxz4e018VAqfIn7p8oT+Fh0RmvQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GetZTarXehY0ZYD4mgUGyjRluyq7FcsNhRujDlaQyIBGg1P6tk6FnHEHinyU?=
 =?us-ascii?Q?ifnHUqn0z/HqNkI/tWdh3ZbF3gLJWJ4pBg7dI13DxoN4OHvR6YRLZGJIv2Eu?=
 =?us-ascii?Q?2UKocTDBq38nqne5YOkoOMxx0Ov+OrqB4vNz0k+NHT965jJj9stzBGBV++Mj?=
 =?us-ascii?Q?iw6IiV6jtGzu/HOpf+5nrHJ98fuK6R+Qv4LUnIpNuwLxeIJ2j/j7K6mF0UIq?=
 =?us-ascii?Q?KxiayDXe72FntViPcC08yoMC1uj8v0Rx1lMQ0nyKwvHTjQKi7itIZjNJI7OG?=
 =?us-ascii?Q?+9PRYenSKe/kCeUzeSwMiZZWjVLWxGUoIkcTS+aN9zCoOoqN8iDW0y6CfiBT?=
 =?us-ascii?Q?VQ8L9s1nN7YIFKmZlk9hWRwUKTZ/U6ffPATHSIj4fS+GUdp+xeBvmuXx7+zF?=
 =?us-ascii?Q?fjmM2mLPyrppJn5yhgaCjHXAR8iiFiH++qGM05nN9W7EcLGIBQoRNonqDpnM?=
 =?us-ascii?Q?OqIv0Zdquy/GdpQdsZ24URW32LyJAWq2k+T2v4Giz3NrqSTM4FM62/0Pzv7Y?=
 =?us-ascii?Q?nHmHy+a/ixWCJSPtSrfgROtYmal6Gu1S3bL+4w0v4wGocGMn7RQR1I68/aDY?=
 =?us-ascii?Q?QhuUYvRazCFcwDG4fGDF+EjIoDZBm0o4tWWoSbmCsQvZH7L8pICkUsgntR7y?=
 =?us-ascii?Q?iLoa9B+rF34fleh7LbqYoghSNn9MMB8XdSE/uXHWz+q2SC1bRuzH22nBog2j?=
 =?us-ascii?Q?AGwyHP2Oxg2HimzDB7EkGzlyR9yp+xdJhtzOYJc2A5y6L1ZKSTOO3brFpYsL?=
 =?us-ascii?Q?Vqfyg92kcWeM/5aeKbbX0s92vx7d4kMKSb2B/X+q566+dtizFb4IRjEJ/dKC?=
 =?us-ascii?Q?Q0bpv9UnbPk9SzmvqsBDuGDdRDwD9mUsRRVdjOarsi23aPcYOl/LAmo2ETPI?=
 =?us-ascii?Q?en5WWi8R+R4snK05Eiflh7MllLGgC7k3Q8PaONJ1kpWsAgYFIsnHzTMBdDL5?=
 =?us-ascii?Q?t6GFIhvc4brlfiIsKQBKNXzglsD1VwE7LqC1wm8xSv+2DvoTpDPFQO/AgYtq?=
 =?us-ascii?Q?yWw+8al6f6Qxme1jCATKKou2LxWDZaK67bRHSJYrNaEqSVbtNwB+k7y+3TnV?=
 =?us-ascii?Q?Rm3i/drU3lykV0nYAsTONOUJTmQ62xMGHKMV35NbKiC0qns/jxAtoIdfKdmy?=
 =?us-ascii?Q?CBxDLUGR/ITKHNYMkqf6fjr3OoGQKUoNoIW0apfHmXpbK2itpeyUTLOTl2Og?=
 =?us-ascii?Q?jwHfuFUUxC8y9XV6CYvaaS14HIpFQgu5p4914NiKYMGsbUnuJgQcKaEmf1RF?=
 =?us-ascii?Q?VYjkP3sBUaJNtbgmV53JS6s0i5niQghe1ehaqIf+Hbe3FW46ffhXKewjo8LV?=
 =?us-ascii?Q?4EvxO88faWxNHVXMtXs2mSOYE/d/9kTrY+1lrUTgi5C/wmKe+mKd5mGQDdNX?=
 =?us-ascii?Q?8D7oaxxj6BQa8FpuEigAz7XaO6wxMcVRsVMGzrP8KetCs8X21+zJXs+WIawP?=
 =?us-ascii?Q?INQSRFbUpStVIYCwa+9Lhay6/HqfmpBSzydHM+dBSG4XBisaZo5h5qnzp6zQ?=
 =?us-ascii?Q?rPoDpluUVSuDlk5ZDK0KHa+RFxIMutnoXYqnAt8koGeouyYC56IdPEUEo66g?=
 =?us-ascii?Q?6B2rm7MsFrhH/69/mPs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1ab117-b878-4d9d-c5bf-08ddda74dbf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 14:22:39.7179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1VzrsIgifYHmMmDFEUiy90ekFGv+DRlYtN8HnPPBHLhCroOOlAEBtAD02mnO9HuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOL0Fqb6D/f9bdsPv2K+eJi78tQyWrIwGC7y3belleQ=;
 b=Drh2dHxR35etGFvN09t3SlwdzNmdQLSoUy7kw4/6okDZi1MzD9ieRNqT/tloETL+CDL0MrTpMTrNfF6ILygWHQiv0ExV6rMNnDMS/vm7frhe7Y5x72CCiss769WPMYehVzmh6kb/RZMGr7RgrXENpCo6LX/j7Q18mhqKERy1448=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Drh2dHxR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

Hi Luca,

>
> Hi Yann,
>
> [--SNIP--]
> > > When the dependency is not tricvial, I think it is good to introduce an
> > > intermediate symbol:
> > >    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
> [--SNIP--]
> > I see your point, but don't you think adding another symbol is still
> > a bit overkill?  The dependencies are still only 3 lines and are rather
> > straight forward.
>
> > This would not be unheard of, there already are a few packages with very
> > few arch dependencies, but that still have a dedicated symbol, see for
> > example (some are more interesting, as they do have comments for each
> > dependency they carry):
> >  - bayer2rgb-neon
> >  - bitcoin
> >  - bpftrace
> >  - dpdk
> >  - host-flutter-sdk-bin
> >  - (host-)gdb
> >  - gtkiostream
> >  - ... and so on...
>
> > Note that we usually do that for libraries, so that it is easier to
> > inherit their dependencies in selecting packages, but of the above,
> > only two are libraries.
>
> > But maintainers will have to decide what they want. ;-)
>
> In the end, I changed my mind on the issue since there are two places where
> the arch dependency is used. The BR2_TARGET_XILINX_EMBEDDEDSW as well as the
> comment about the dependency needs.
>
> To avoid having the two be out of sync, it makes sense to create a
> symbol BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS that keeps all the arch
> dependencies in one place. This way, when I add BR2_cortex_a78 in the near
> future, I will only have one place to add it instead of two.

> I agree this is a good idea.

> However the same logic can apply to other Xilinx firmware and related
> packages, such as xilinx-prebuilt. Thus I'd rather create a single
> symbol that can be reused for both packages, and it should probably be
> in boot/Config.in. It should be also named without "EMBEDDEDSW", e.g.
> BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS.

> Side note: I personally don't recommend sending new iterations so
> quickly, without letting the discussion settle, it produces a lot of
> noise. I'd wait at least a few days after the latest e-mail in the
> discussion before sending a new version.

Yes, you are right that we can create a global symbol in boot/Config.in called:
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS

This symbol could be used for both xilinx-embeddedsw and xilinx-prebuilt.

Not only would this enable us to only show the xilinx-prebuilt package as an
option when one of the correct cpus is selected, but we could also use the
BR2_cortex_a53 and BR2_cortex_a72 to limit the available choices in the
family variant selector. This would prevent selecting BR2_cortex_a72 and
having a zynqmp or kria xilinx-prebuilt family selection or vice versa.

It would not change the need for having the family and board information
because the xilinx-prebuilt treats zynqmp and kria boards differently due to
the directory names where the pmufw.elf files are located even though these
are both based on BR2_cortex_a53.

But at least creating a BR2_TARGET_XILINX_ARCH_SUPPORTS would put the arch
dependencies of Xilinx components in one place. We could even update the
uboot package BR2_TARGET_UBOOT_ZYNQMP symbol to be dependent on
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS instead of BR2_aarch64 as well.

The only exception would be the zynq platform. The BR2_TARGET_UBOOT_ZYNQ
symbol would stay dependent on BR2_arm because it is the only family that is
not an aarch64. I suppose I should add a BR2_cortex_a9 dependency to
BR2_TARGET_UBOOT_ZYNQ as well, so that it limits the option appearing even
more.

https://patchwork.ozlabs.org/project/buildroot/patch/20250619153922.891360-1-neal.frager@amd.com/

Thanks for the constructive discussion!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
