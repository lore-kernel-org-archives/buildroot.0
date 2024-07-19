Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E23C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 23:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F4A40CE7;
	Fri, 19 Jul 2024 23:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRoD9mrocQNj; Fri, 19 Jul 2024 23:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB0D40CF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDB0D40CF3;
	Fri, 19 Jul 2024 23:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 248EB1BF33C
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 23:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A6683F11
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 23:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elLw_nkO8B2I for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 23:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=923d17285=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1544483F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1544483F10
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1544483F10
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 23:09:05 +0000 (UTC)
X-CSE-ConnectionGUID: E6T31QjgQgCEnj/IwEpavw==
X-CSE-MsgGUID: hSs9CpBpTLi87Z/qGiV4/A==
X-IronPort-AV: E=Sophos;i="6.09,221,1716220800"; d="scan'208";a="21674208"
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2024 07:09:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9RJiqyUbRucgG12VUTkvr3C2YW/E4E2tehtu2hBNla/XYxk75m6iARG1PUm02pEa7gBT/fWyAHte87P7umB+7UDeKOwxvktFiN/ISr9N/ehMquIhNSzk/eViVm4BWEmi/4ikiIPrxXnvdWeHToTaKEzCkIz6RvJd8XaZ0EukoaKqqvPD5zZ+1Zsek5I5VitxNnMtkkY1iN5fkwuDqLoFvylX7cKMS29YwfBiLE4p8ZdlB9/3g6mIYua92lF4kIoqV+majV4wl7BqKb66NL3OEKn2Q9bO4GQqm+Tqg9WQTsUmBr6TIT2mR5aASg1krLnC5xw6LoqYJydjgepoVnXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZ36P73Wol6iyclj7iAvghk12qPSTuPWS/rW2Ul4/Jk=;
 b=Dw0ykCDEoZiQacavamA9Ej0dQ0qZIQXBxyvATw8LTTqXGHDVaQIYOsJXaayUjSshn4ithqY3WfWqqHH9Qk+Vh9Ep4uHdVRdSwMLByH7o/TiHGRGHyjSo7koW6s2Z/VBOuhM+LXPGujO+gE5FB2m7BgY/c3irdVFgFwnhQikQZYnpHh1MNsUBh+DhCwMawsMenXSbcVbYuHmtn3XAjAQ72cyqSGVREqW1HjcNvm0Bc33CaVu5wA0RQnHcFv9QTC8IlXSJhOmm+1zUnDbt2OuM0FVoYuqax+zWWyzBoHKoV/cIo7JnRIZasuWQpA5X16RjT8PORFQcELOHH9S5IMfJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by BN0PR04MB7950.namprd04.prod.outlook.com (2603:10b6:408:155::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 23:09:01 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 23:09:00 +0000
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
Thread-Index: AQHahLFKJA9MVUO4kEyJU6Zmju/7DrH0QtiAgAoHn4CAAAZvgIABBv2A
Date: Fri, 19 Jul 2024 23:09:00 +0000
Message-ID: <09526dc47eea86809dfc6925f7f2c74a31789ba4.camel@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
 <20240712235449.766c2931@windsurf>
 <84d8e2b1a0be113655ef7b8fff876a141128b42c.camel@wdc.com>
 <20240719092743.3933eba5@windsurf>
In-Reply-To: <20240719092743.3933eba5@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|BN0PR04MB7950:EE_
x-ms-office365-filtering-correlation-id: efd0968f-edb2-42d3-65fd-08dca847c6a7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?bTcwa2hkNFgveFJTMU93UkpUM3VGaGNKVCtQVjd2SHRoV2pMaTBCakFTMTNr?=
 =?utf-8?B?cWVQa0ZQaHJOV0t6TURwSDhpa3pMVkE1dnFKcDdiOU5ubDFUNk9OSXB4TVJE?=
 =?utf-8?B?bGVtd0NBaU9GeGJCejNmOGJjVjFFUkRyMTQ2em1jUkc0dDEwQjcxTUlPcGJ4?=
 =?utf-8?B?T1ozWmVVam1JMm5MeCtiUW0rNlJNeEViUzU2M0hIdGxObjF4YUMyT2V1ejhh?=
 =?utf-8?B?WUxYaHZuUWN0VnlaaGVjTlZITkI4VW5EOGVZRUlJZmo5Wm9QeE15VTV5VS9J?=
 =?utf-8?B?RDZhVkFLeUdkdTAvdjAreUJiUEVBcDV3MHpnRTlUeTdoRFZUU1FLblFEM3Q5?=
 =?utf-8?B?Tnl0eFU2ZisrREVqVkoraHlDOWFCQ1o4bDgva3dzZGZXRWZWdlRWWFN0RGxN?=
 =?utf-8?B?UmNmYTFoeFFOUGxQVTJHdVNOUFZkVWREODZIZjZ1K3pWQnZqOWFWYXBGYS8v?=
 =?utf-8?B?YmtBSlMvZ2xQdFhoTVp3cmRXSk5BOCsxTTlScGNmd0FIZVBocEE1WmJXT0pO?=
 =?utf-8?B?Nm9wMUNZVmY0WFBsdENGOW44S0VHOStSVjZXNFBmWmVleEJqVTJ0RUNxNkh2?=
 =?utf-8?B?UkpuNjdHZytQcTRORnlwUndlMWh3ZWpZVDNYWXhoYWd6VkFBMnI4ZnAyV3Ft?=
 =?utf-8?B?MlJ2RlExNSs5bDdqWENMYlB2c09XY1dnWVQvWXlHZlN1czVka3dDT21CY2dG?=
 =?utf-8?B?bk9QcG1tcFZZVHBrYVc5VkoycEtBYW96RHhVL2pJS3FnRkwyMmFEVkpzRi9y?=
 =?utf-8?B?UVVyYVpIQmZrVmd2N0RmcEdndmRYaG45WkdUdDh5T0VHNGZJSVY3Z2R2Rlh4?=
 =?utf-8?B?WWxQR0c1R3dZVm5aTC95RFFpV1d4Qit6RTJiR1FQT0RIUWhpRVZTQ1FoRTVM?=
 =?utf-8?B?WlpjZFA2bTJHQUJBNVJoVGZmdnduTENTVk9WV24vQzY3c3J1OEZPTmtLMTZ3?=
 =?utf-8?B?L1JKa0dCMkU5cVIzelJFSjIvcitJUDZjNmtQcG8wY0d3M21PRHJFQmdhVnQ0?=
 =?utf-8?B?WmJBUjlnekxBT1ZOeTM2cTdxRUx1WVFaN1VjOE5meG5BYUNqbkt3STc1UUN4?=
 =?utf-8?B?N2ttNlRwVWZGRWtCQkNvS3N2aEs4eHFCWEg4VGJlRm9mTFo2T2hGdEUzOTI0?=
 =?utf-8?B?SmNIc0p5VHNPVC9ZM1BUcWlrcVd0ZHZheWN5VWZ5ZUpzZGlINVNLYnB2RHpa?=
 =?utf-8?B?dDl2VDlkL1ZOcHBMSG9hVS9CdE5xSEl4QVVTNGx4ZDNqaFlFUm1XNExrWXEr?=
 =?utf-8?B?RGtmMCt2Q1RyMFBidW5tUXZoVW9mczRubmZrOUs1SGwrQzlHdU1EdFZFeTJk?=
 =?utf-8?B?UVk4aTV1OGRzWDkvREpWSXlRSXdZamtCYWNCSGlLM1BuNVJaYWdhb1FydEVa?=
 =?utf-8?B?Uy85cmk1MEhsWWhMdEhHa3VBdUlobS9WQ3Y2WTZOSCtPR1F6NXZjaXlUdlZW?=
 =?utf-8?B?NjZjUlRUemdwYkEwSFNSbUVBMFdDYWkrRXhtZ0d2MGRXRXFjYzlhTmtCVGMz?=
 =?utf-8?B?a1kyYmtjMTNqOS92M2FRQzNGbzJqUTNzdmFpMWxJK0JmT0p2d2g4bFE2b2tn?=
 =?utf-8?B?V2VWU3M5UEhhQ2s3S2o3TUdmRnBwZlgzYWl5OUJCVlpTMUVFZ0RvazhhL3E2?=
 =?utf-8?B?UFZaZWh3UFZiRzIzRTFtczBRSENkQVMxbG5lMTBHYzVpL0tmcHZ5WDFyckpa?=
 =?utf-8?B?ZnBUSHc2aVBSWGZEb1hwamxLSkRoeXdEek5HaGVHNm1rSVFnb3NhRVREendp?=
 =?utf-8?B?K2tNaFpYSlRoelNNMFYyUmpXbDFodzVha2JtUXhYaS9rODdDc3VObG42ZEJ6?=
 =?utf-8?B?UUlPVTJSNTlYaTQyNWdmQ0pHd2tRR2NGeWM3bUhyRmFMZzNNTmhWbDhmUm81?=
 =?utf-8?B?OFluc2pEQWtnYlNWalprNjljc1JwOWN6dmJuMXNXR2dvVDNCeCtreUVpWXYw?=
 =?utf-8?Q?e/4oZdq2E9+aZITlTTk5Owac6VT8cUwQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmlrYm1XanVwdDluSVdsZ3B0akVtOVJtL2NVUkFtaVRTVGNKd213MnNETGJR?=
 =?utf-8?B?bmJXb0NKTkRBenh5SXlXTWdjT3VqSy9WQndkQTBpWXBOczJzd0VJQmFkdzdp?=
 =?utf-8?B?NStORWhxaDZUbzk5ZmZEbkdiSno1d0E3TDFJVktubnRseFlYczh3Q2daWTlx?=
 =?utf-8?B?S1JuOVhPbjhuSHhKTS8wM3NFek45OEhrdlkxVjczTkpQcWZ3Tm43NDA0NStR?=
 =?utf-8?B?YUVxVkRHYzgrS1A2VGk5NHowc2Y1Q0o0SHNKUTRHQ21DaHRzc1VPa0FaNkc5?=
 =?utf-8?B?N0JlZmt5Z1pNQlZjTlRSWDdCcHJpZ2xaVDAzRmlEQVZ5cUg2a0o0RitjNExN?=
 =?utf-8?B?VUtCR0FvMlVQeExzZ0ZJNGRUNytLbHl3cW1JamNnMUlEWk10N1BjK3RPUk5w?=
 =?utf-8?B?ZGo0T1hpa0F2UlRrRk1wUllhZUZwbUJEWVpFMUhDeDNlZ1ZYZUxSb041Mzd0?=
 =?utf-8?B?S0ZFK3RnSmxoTnFHR21YS2NlcnhXdS9wQmNRdmNhWmwwaVhpN0twNEZjRTYx?=
 =?utf-8?B?WGhwaC82NU9GQ2Y5NlFCbEtqQTZLOHFkNjhmRXovNThxSmFaTXdyUElrYk93?=
 =?utf-8?B?aTVnOGswdGFqZnVqZVorZk9OM2hLNEZjYVRoREVGdmxNK21VelA1ZjBpY2wx?=
 =?utf-8?B?ZldvMjJ5a3RLL0d0UnV1c3JiUnNlZTJSWWRwYktoc2FhTysyN2prQTBOeGd4?=
 =?utf-8?B?eWxRekRNTUZWa0lYRm9FNExpVHBGdkZuMkE5ZmlGVklnekdIdDNNSXQvVjJs?=
 =?utf-8?B?dWtkK2R1dXRkbis1OWJ3RFdpZXlSWEFNWGl3VzVubFpHeDlHQmhDZ3cwMm8z?=
 =?utf-8?B?WFBReGhuWnlXRHlwRU53cjFmc2NtTlQ4UHNRTHF5TXhkQm04Sm81cWIyVE5E?=
 =?utf-8?B?d3RNVGpBV05oQlpiYk9aOEZEWTJ3MmpSaU1XdXpqQTE0Y2Q0Nm12RFlTcUdo?=
 =?utf-8?B?NGJ1L3JNSmRrZjFEdGw3bVZmdXpUSXpvYkVQNHc1K0tKa2hlNGlPQlc2VkU2?=
 =?utf-8?B?Uno5dHNlYW5FSWlFT1g4cGlnbkpEQllYalNVckdVUXpxVVJEWjVOUnJHV2ZZ?=
 =?utf-8?B?Y0FIV3R5cVdhbXhJd09VaEdkVEhBUUhWcTBRSEx4TWFnbDBXdjIrRnVTeENH?=
 =?utf-8?B?NjlqbmhFeE1iUEc4RjhiR1V2U1EwUGtVdCtpZEp4aWZmVDk3MUZFR3BUSVBJ?=
 =?utf-8?B?U0EwWnhkclYyUnAyY2hucjBNUGJlRjJVbzRlekxHcjUwREF0NElYc2cyVkV3?=
 =?utf-8?B?WlJLanZjeSt3ZUMxZXMwWDNRWGtkZ0d1Z1Q0eXV1V2pzMjNzMVk5RHVoTU1D?=
 =?utf-8?B?a3g3aHo4Qmx1SGZrc3NoTHMrclgvK2hHeGt2UTBKMFVaRWdyaGRlQUtSeGNX?=
 =?utf-8?B?VllkWGw3c01FN3dkZUJwL2xtQkM0NWQ3Qkc2Nk5EbEVNRHpDUHozTHlQdTZn?=
 =?utf-8?B?YndUL0RUa2VzVGlRaHpmTUFKVHNoUWVycDRXMVJOY2lrUGphZTZWOGI3OTRO?=
 =?utf-8?B?bFhLaDlHSkorOTlpOEhnNVc1dU5sVFljdHFXanBCT3BXR3cxUVFxWkZ0dnVS?=
 =?utf-8?B?c2JHUFNad0c0MFQ2ODJ0akRHdVBBRU1VQ1VTTzRlZDJHd1RhQURKMGR2RFhV?=
 =?utf-8?B?Y3F2aGQxN1dzT0FXdGhtY2pUVi8vK2NhY0RkdUlhY1dPakZ5MW5xSnlDVTNQ?=
 =?utf-8?B?d0EyeW1RdUJHbVdjOGk1bkZzeGNhQzRhc1hndlNpSllLNlVGZXpGUFNEdnVH?=
 =?utf-8?B?NjYyb2c0M3pxbGJiVlBXVUh5WS9LbUppazVOMi9XVWlhQWJkMXlNaklURGF4?=
 =?utf-8?B?RDdDK0k4aVhQY1QwRHpQQkpqWmNOL0hUSUgyWU1aeGZZb2dIcWYwdkxaSVN3?=
 =?utf-8?B?Y0RGTVpiQ20rcDZxN1dNN2dUVnJRcEV1ZEIrRGcwUUpmMDJrenRJVTB6c2ow?=
 =?utf-8?B?cTliN3ZSWWxabEFHVTJXejh3YXFiRzh1aXZyeml5MnVWYVRNbFA3aDVqYlA4?=
 =?utf-8?B?RURSMURqZ3AvNUhTbmRKeCs4NktLSFl1YnFKcnVQMksxdGE2NHlGSDF0VVZR?=
 =?utf-8?B?S2NzKzF5bHZXRHAxR0YvNTdWdkMyNEtSOE1tRldtWHk3SEloNWNBVUdTaVNt?=
 =?utf-8?B?Z0xzTkFLL2VZaGRlU2VKVU5Da2daNnpFRThUSmtBQnpobzZKT3RjL2FILy9r?=
 =?utf-8?B?blE9PQ==?=
Content-ID: <C6E6B9A27762BC489CC21C753DF45101@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: D9meUFuBWUb2lmFF+ZpTYnU+8ye26D2bZpF8K1GA63JOpImBy8FHtlokXH2MMK9oAf02MWD6hMU3i5NcRIyGhimLhF9pRb+VNE77cL+n5redUyvTWwDcF46Y0EdBawCkYMJvgWne2Eopn+NPFrPPpXEWIBfEaj1NsqxgY2h5lLJ6C6e2uO/Ye58avM2GXYiBvDKa+uU3MiAZdUjHKzhoFWTQSyKsp7FAULmotnsHJmGDVxzyMyTbmn3c/EQnoecfQm3x2VdMEHSjd3flP4V9eMaL/YJ4dbJHgC1k1OnNEhVtrUv79SsRNusw/iVAMtWkyo3eLnyRFkMrRvZmY5lNMZ/IK883+w+w55SpumrKYdFfvQ985UZmKase+V0cIZptRNfA/okZ7KjxkUFRtYkHRLlmGPyGJO8Jn0U8ntY0MW1zf+DMJY3WTekG4SXUEoHpIV/SC6WVze5K17qHE0fZeANTqHbbaN/6k7rfRFliOBbPoQ/LYS1cDwg0JYOL5fSc/bE5CBDOJ3B4WCJe6qmZ+F9eHlBd9g0NT3tQweZIBBk/tDeJHxuFk80FCsIazn5tZoz9Q9MlmxqSQ0VPZwIGmE8n6FdvcQngG/ajdSX/7RojEdL26sJ/s5kF9Gy65CH/
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd0968f-edb2-42d3-65fd-08dca847c6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 23:09:00.8428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZsfhYJPUmkZ450+byVXXVEzgEbuH0fnxOezegSIaDgeuxMyqChWBbfVPO89+Ld1vXnN50mKpivrl+njPi4f3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1721430546; x=1752966546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=DZ36P73Wol6iyclj7iAvghk12qPSTuPWS/rW2Ul4/Jk=;
 b=oHgyB7Vb5NFuWyPTXkdPhqJnUz+3PCtNsVGNhPuGMLKmuKWeEX6Ao1DT
 uNTwi1lm91DcF6rFVACHWxT1YTQ4hnthpiw3JWJfkk9tm8lR64FsXU5Np
 PJXpnA360m6vwc/dsBsfCet/MzGlPcQf1JcXkOart/G1RcpsSqLJov8Nm
 /RD+M+j1W3vXbUlv+GaO0cIqiKOrYwqNkL7S+cbYKZ6H3/ojU4+HnF1qb
 of7gjPHsWXH2q/mcRCCwqXjqVYl/VvPnaM7lBSDdNIaG8IPngsICG8f7B
 vfmKk080nvQBTxu3VJZW7ig5YPrkLrU450VgVxZsp2i/9UyAtET8XwYFH
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ36P73Wol6iyclj7iAvghk12qPSTuPWS/rW2Ul4/Jk=;
 b=cP1JhhoHm8ued/+bFSSunP/fLkOmeeK/LzaSSlJjJpSeXKN8yubUsX/6RF9PBY02S02fwHp8OLM/NVevH6Yft2meXHu/Ea/Ks8UASHXFyg6ymk22HinwTnO9QcuD/SQBubVnPgQZGUy1w8pzm+xQgNF6G+IJtIoWj8SYFrcWgj4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=oHgyB7Vb; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=cP1JhhoH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 2024-07-19 at 09:27 +0200, Thomas Petazzoni via buildroot
wrote:
> Hello Wilfred,
> 
> On Fri, 19 Jul 2024 07:04:44 +0000
> Wilfred Mallawa <wilfred.mallawa@wdc.com> wrote:
> 
> > `spdm-utils` uses the `bindgen` crate, that required clang. Which I
> > believe is likely where this is coming from. I added it as a
> > dependency
> > in V3. Which should fix this issue, however, I was not able to
> > locally
> > reproduce it. Unsure why, I tried doing a minimal build with the
> > config
> > you suggested... it still worked (odd!). Perhaps it was somehow
> > being
> > pulled in as a dependency to another package. Let me know your
> > thoughts
> > on the V3 changes.
> 
> Possibly because you have clang installed on your host system. In
> order
> to isolate yourself for such issues, use the ./utils/docker-run
> helper
> to do your build in a minimal Docker container:
> 
> $ make clean
> $ ./utils/docker-run make menuconfig
> ...
> $ ./utils/docker-run make
> 
Hey Thomas,

That must've been it, I was able to reproduce it within the Docker.
Thanks for the tip! I noticed that with the `host-clang` dependency
added in V3 this particular issue was fixed, but there was another
error which I will address in a V4, please disregard V3.

Regards,
Wilfred
> Best regards,
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
