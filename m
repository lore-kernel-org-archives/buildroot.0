Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF382C3DA47
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C13606A9;
	Thu, 11 Jul 2024 10:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_gdvEATo3em; Thu, 11 Jul 2024 10:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E0260EA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E0260EA6;
	Thu, 11 Jul 2024 10:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81DC71BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C2E9410C5
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONOSeXnsBimB for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::3;
 helo=du2pr03cu002.outbound.protection.outlook.com;
 envelope-from=josua@solid-run.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AD0640D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD0640D83
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AD0640D83
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:15:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BM9GjROzBdj1h30qXRdgSNMuw9eD90FuRxPRG/PeBpBR36nBmZfMS/w82AiIzwhrQ+tyVNmo6Vcw359OwcprWArdt/ctN4EEpQaLyIfu6jEt9M/camuvsDiMfkICW8ywYtDSACcuBcjpGDf0N5wB3lEIeUUQtJ/yEHiOOvpteQrmtflDbyLs2aaUjHVFXfdHxVy3MejW7TNNLhAE433rNuToRWPeFDDaPPQTCpr84kd3tjDBWomdloO+ruwxFhc5m22TQgoyHGXwU1O2xQ22DvIi24SwPv7r4026Z34XjaoQtUdfr1ia96lAvs8lgf39SmODVPIB21i284LDJUvw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EG2mXY4OEuUbmLIfvAl3uGoOHI+LthZDdJdkpvTDZfQ=;
 b=gGu4Zz3mIYz0eKXg+/1amJ9R++nXQwFe61qCb+LqHcMPvBzyhHE+UmC4IihUJvr411wGNEQ92yIT2I9k6KZR3VpuKsP6+KfxjlF71BE3gr22RpIr6jAS+JQTO9Ruum4HHtmT+kVDC3mh4IwOQ60Mftdftd2BFtFwptUX7ethkXXTPOVcR9Y5zIweqEtTwv+ZqV9yvsYQfJ1yC3RDMnJPq+ZoS+rCVGSUyVsFNhsZpjd28ZxUHKvIIyi7T/9gsIzf91Sl4o7wQLFZDbopTBSszl6tNGTNF5nngWu+bOOh1H0v6gW6uyENFdyX/rHmGwutx/h8M7a01LaYRlvU62nzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by DB8PR04MB7113.eurprd04.prod.outlook.com (2603:10a6:10:12a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 10:15:50 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%6]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 10:15:49 +0000
From: Josua Mayer <josua@solid-run.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/openocd: add config variable for
 imx_gpio driver
Thread-Index: AQHa0td5F/esdU5Zi0ie6eigXqxv8LHwdjeAgADatIA=
Date: Thu, 11 Jul 2024 10:15:49 +0000
Message-ID: <eb542dc8-3db0-4c5a-b9d6-aef5c5a6be99@solid-run.com>
References: <20240710144257.27528-1-josua@solid-run.com>
 <20240710231303.118c44c9@windsurf>
In-Reply-To: <20240710231303.118c44c9@windsurf>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB7586:EE_|DB8PR04MB7113:EE_
x-ms-office365-filtering-correlation-id: d551dc3d-ee41-4a8a-cb1b-08dca192702a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWZXc3d3WkMrWkN4Y2VkMjZlNlFDY0FmeXc3Q1ZPWXRDYmY1RlQvSnJraG1N?=
 =?utf-8?B?NFpGY1lRVVZkelZld01aMmM3Y01mS0FWVVd2K0xtS2tIZUxZZS9KWDdWNVFp?=
 =?utf-8?B?YzFCMGFKVFZnd1FySTcvK3BwUXcrUVZJeitNL0diWjNGTGJSUnJqakpibEFZ?=
 =?utf-8?B?TmE0QlE4TjdwZmRSTWVRcThsb1RHY1NuV2VYWDZhemNVdjgxY3ZwMFRwQVF4?=
 =?utf-8?B?azBibmdPTEloQ3VHRmdHYk15akQ4YStCTlZhOWpSNUJPM2kzUDNnNC83NVNa?=
 =?utf-8?B?UWJLeVVaYlBwbnlzNU9jU05wMktCeERyUHJVUTFiQk1ua1ZjN1FmUHJKOFhG?=
 =?utf-8?B?N2hlQjAxVnVVN25UNHdVeGxaNnpmbmIza1BSeHgzTzRvTzNoNmVBN2pmU29X?=
 =?utf-8?B?VkZGaVgrOGlMOWFVQS9Rejd6TDN0L2wxdE9PRDFZaUxlS0pwSG1Id0JsbTNH?=
 =?utf-8?B?M1lhWmF4VU93NDlNNzd5SUJISHVTWEwrb0ZBVExxeHRLTnZqMXVTODZaZjNx?=
 =?utf-8?B?aVk5QlVuM1hUcXNudWd3L2lPRGZ6SWhMUTAyQzBuaXJ5OFJQN3d0Z1dHaXk2?=
 =?utf-8?B?ZW01am5jQVpqVWx5REVyaHhVRVFCR0ZMT1M0aVNyWlJtYnBPK0FTOTZ6UHFF?=
 =?utf-8?B?cWxjOW1McFI5Y2JnQUZwRWJIK29sR21hYlIwdnFlSGc1RzdoWkExOTRkMUwx?=
 =?utf-8?B?RnJPdlZRbnV5L0JMYXNWdzRSMVZ3VWhkOTg2U2ttRE9iYXRJbnlMMmVsS0JE?=
 =?utf-8?B?WTZRZzB2dmJCL25tYmxISXZ2dXZOeC82emw3S3ZnU1IydFMvbDJFTlpKV2hm?=
 =?utf-8?B?K1BNL01ickNTbEU2MndMbmF1SDlSMk5YVitrKzJtKzREWVFxTXBvMUFkSGov?=
 =?utf-8?B?djJJR05LQWlMckcvWU1sVEFuTjVmVGREUFN3VHJ0aWZTbnJkdVFLMlFyZmRQ?=
 =?utf-8?B?SDdtVXlUVUZmMFhXV2c1UVR4VERjM0hhZXM3QnFTWjZlb1JGVFdJZVdPWDRy?=
 =?utf-8?B?cUhWdWVTVVA2T3VwS3VWRDdXUmV2K3Q5U3MwWUY2bW93andBRG5udXJ6UVZp?=
 =?utf-8?B?YVdVUGxXSDVJeGlqQXBpblExNDdCOTBSdlF0NFJqRkVyd0JtdGpkUi95QzU1?=
 =?utf-8?B?eVk3dW1QaUNhQTRrTUIvZWRwMzNCaFRkcENyN05nNmhSb2QvVXRMU3YxdzZD?=
 =?utf-8?B?TFd1N1JUbDdEdHA0OVdSazNlVFBjaWtMd3FvNWU5TWpidDkyMWZ1U0tSYTZ4?=
 =?utf-8?B?cmhMUVNOT2kwNWJCc2w3L09tQkZmb1R2c29WZTlTZlp2RlNHMmtpaWZIK2pP?=
 =?utf-8?B?N1VXYUlEdmxYbkNGOEFIMXJ1KzBwM1hvQWNsL2hwdGE2MHZSK2tUc1dIOEda?=
 =?utf-8?B?N25IaHFwbHZxZWFncVVBdy83eGpDVTd0TUpVYzdLVkhROUkzdTRGR1RIaldI?=
 =?utf-8?B?c0t3SXBtSndhKytRNFhBTlNibGt6M2FBYmlDUmErVUo3M2JiZHVUK3dJaW0z?=
 =?utf-8?B?T2RFajUrT3djbEliU2kwRmVTbmdYTUl2T2UySXcwc2s0WmdraFZwcGtnNlVT?=
 =?utf-8?B?K0ZFVm9UK2pwNHNVd0tGSkJDYVVPT04rWnRsbDV2Q1B5UTR4UzU5TkN4Nlds?=
 =?utf-8?B?N1NQVHlMd295SnJ0VkVmNzZQWG4ySnhsRmJGMjI4a1RPR3ZKUnpaeWVSdUN6?=
 =?utf-8?B?QUhoV0YyY3gyQzJzRjBjcG9VdFVHUXRONmFRZnMrTHNNc0xpWkpTYmpEUE5y?=
 =?utf-8?B?RlZxL3VHTXgxS204K0MwRnc4V3VvZEw5OGtLTStoT0ZUNStqR2ErUk9IcVpy?=
 =?utf-8?B?TCsvckhBblEzM2xhYXJLakxKUkMrbTFXYUVFUzFHRzY2amZUY1k3b2I2R29j?=
 =?utf-8?B?RHdXdU5CekNQMWI0RWlPMTd4cXE5RUVPZjZLM1BTRHdOeWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB7586.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFMwQmR2cmhHVkxRWjZYSTBvWmVaRlkyTXl5ak5oaXZLb3V1QVpZSyswaTFz?=
 =?utf-8?B?a3pGUVNsVGthdUI2N25pakpLeTJpOWZNMTRDalk4UVErS0Rja29lVmR1ZDdK?=
 =?utf-8?B?NkdrZ1orTlc1SmU0YW1iMldwWG9rYzZ1c1JQV29jVnFXTHRsMFMwb1VNM2p0?=
 =?utf-8?B?UVVER2cxUEpEODViei94Zy80ZGtnNWJwNXI0MEt4MkJOUzVmL21IRElwS1Jn?=
 =?utf-8?B?Mmp6OG1nVXdVekRxbG9LU3d2bTNGdWgvTDBXdVpRK1FjN3lXZlRwYXBmSkc5?=
 =?utf-8?B?MWl3eEJyVnZpUWV6ZHVjWms4elR0Tk82eWs4SU9mcXdWSTFuZkVKK3Vucndr?=
 =?utf-8?B?SnRURjlGN3BYanFrV1poTjM0Zy96STJqZkxrRUFWK3IzUDNwVmZGeTNIeThq?=
 =?utf-8?B?T2R6T2tJY1ZEQmxOZ2g4blJXZ2ZBWnk4YmRMMjVlMnczbFhUVHFsZHpKRXhH?=
 =?utf-8?B?eTBzOEtlTXRJeDFsRjZNdUE2QzZZK0VjZmdpQ3l6YWg3YnFPVFdZeitkeEF0?=
 =?utf-8?B?T2FQS3p5eWlxWDJrYjdMd0NtWUdGSm1TQ2owT1FTY1ZPNERrckJ2QUNEaytl?=
 =?utf-8?B?aVJiV2YxYTlTbzdqQkh6Y2RJa2xJY1RvQm1KbVVmclM3emkrR1Z6TmVqT3Jl?=
 =?utf-8?B?NW5meGM4ZFJ1VVZZNTFHZmtmb1JHNUl6dGplemY5VnlCSWlmckQ2WUloZFpi?=
 =?utf-8?B?bTkzbExGVE1VMVlua1VHbEtqU3hka29iMXVyajZlajVzK1pGdGJwbkFlalVz?=
 =?utf-8?B?cnRiaHFabGJmalZYbm1ocFhmOUNWanRlNGIyNnRMaTMvNi9QaG8wdEh1TGJu?=
 =?utf-8?B?ZlN1eS8zOUtia3M3T3BCUVVzMlAyMGNBbHkwU2x0OEk3Y0NBd1hUbFdjK0ZL?=
 =?utf-8?B?NDVHNTV2RDIzdWUybytsWlNKd3JPZXRaSk1ybmZmcVBFSXlTSjlZUTVsemJT?=
 =?utf-8?B?RS9qa2wrdVgxcWdwVVBYOGtiRUVlcDZGVVhZZnhUYVNTSHBTUUwyTHNGaEd3?=
 =?utf-8?B?K1JoTytuVnZEeVo4WjRuWklXdmZrWmhvOFZQenUyTnprNWdqWjQ4RXF1UERu?=
 =?utf-8?B?WUxaa2diQzhNVkc1d0F2UjJCVHR0dkJEMHBNays0N3dzaGJjTzZOVlMzenR1?=
 =?utf-8?B?Q2I3MUVKQ3BGNnVRMGMwTUZjN3FjUk9KRVc0QmN4QzlsWFdPM3dJMHU5eExK?=
 =?utf-8?B?ZmZna0Eyd0xMVko3Vk9KdWV2MFFWSlBzbGMvcVZnTHJBNUlHYm1Ob1dHMTBt?=
 =?utf-8?B?QUFGaFNvbkl0OWtqaFpUTGRaamFtTDdycldLYUpDeVFCODdIZk5NamNpVXZT?=
 =?utf-8?B?UThaOHJrcWJkVzVnc2MzL25JQ0lranZHMXpWQ2ZtRVBNSFBQVVhlMDFOYm51?=
 =?utf-8?B?ODNTZEZteko1bEY5aGR0RDNpdmZYdVMxemlwcUI1U0Jld2FBTXNaVmZHUVJE?=
 =?utf-8?B?UUFKV3c4L3RPUDlScEdHTzNUMjNaNVNOdi9FSy95elFvaHVQWU1JSFdkRXlr?=
 =?utf-8?B?b1pIMGdNem9YV0pWNGpjWll5RmhLc283cFRUdTdFMmZyelo2dE5LaXVJdEts?=
 =?utf-8?B?UHlmbUxLa2FlM0dwc29nTXVud0xod25tS21xUGpnRlFWblFDSklNaGs1SEpm?=
 =?utf-8?B?MlNkK0NYczZWYXBrQUMya2VOb2krL2lEQ01FUVN2UFpkQ0UwcnFDL3Y3eUU0?=
 =?utf-8?B?L052azgrNEVhSFpWeGhHQ2RKTzV6TmphQW1UWCtiNEk4ZSs0QWVsTS9Cdm10?=
 =?utf-8?B?L3VlWXRDS1UreUZXdHBlVjBiSDNaM001N0ZHN25pWWZWaGRyMTNpcWltRUJB?=
 =?utf-8?B?NjB3ZUEzSUZBbGNRT0FhSks3ZmF0M3Y1ZlBXNS82Sk1nOElXbGFpaVlLYm93?=
 =?utf-8?B?VzlMbStKelJiR2dFVFlUTkV6cUp2Z3dFNkZ6TGh3Qm9pa0tmb1NmdkRDOEw0?=
 =?utf-8?B?aUZacG9xQ0lpdTJ0ZWlZY2RpdVFoQUpQQ0JNUlcrZ3lBbmxPTE1HRVBqUUV3?=
 =?utf-8?B?b2VQdkhHeW0rKzlHdlZIQnVYSTFvZ2t5MVVFTG5YOVYxZXdWKzFFTnFQNjV0?=
 =?utf-8?B?SkpteVJlRFBVTUVna0Y0U29HNkRYL2w0aSt6YVMwK1RjRm9aRllNR1QrZ3kw?=
 =?utf-8?Q?LRdRCS+W6k/A29Ge6a6uKgHMg?=
Content-ID: <29D3A037A0725247AB9E5E35A2007560@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d551dc3d-ee41-4a8a-cb1b-08dca192702a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 10:15:49.8465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNP985SYUeRPSZRnZOSLnJ8ammU/fqaOdDZYXKuOfrKFlb9AqhMuI7MAD60LioYLqWQMd1TOYvKAFH3CfWxIog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG2mXY4OEuUbmLIfvAl3uGoOHI+LthZDdJdkpvTDZfQ=;
 b=AGMIFz4VlCuA74DgrrJaDPkxpDpx/K/cYlJpjnNnPguUKXHeyO+DVzvWp9HhdfwVTKcgmMXIw7t8NpKv0hx+RQ6KEhm2K0qkEkym9P3qkuegfuVVG3cmAXN7mNOcbRfivY6/PRF/7SpT6/NWvn24Z0O/wLY6CahoHUj6XOVZ9po=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=solid-run.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=solidrn.onmicrosoft.com
 header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-solidrn-onmicrosoft-com header.b=AGMIFz4V
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: add config variable
 for imx_gpio driver
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 10.07.24 um 23:13 schrieb Thomas Petazzoni:
> On Wed, 10 Jul 2024 16:42:57 +0200
> Josua Mayer <josua@solid-run.com> wrote:
>
>> +config BR2_PACKAGE_OPENOCD_IMXGPIO
>> +	bool "Enable support for bitbanging on NXP i.MX family"
> Simplified to:
>
> 	bool "bitbanging on NXP i.MX family"
>
> to be like the other options in OpenOCD, and applied your patch. Thanks
> a lot!
Thank you!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
