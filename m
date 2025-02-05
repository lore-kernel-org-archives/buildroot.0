Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1729DC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F3C83F0F;
	Wed,  5 Feb 2025 15:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jUTV3QImH3V; Wed,  5 Feb 2025 15:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C9A683EE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9A683EE5;
	Wed,  5 Feb 2025 15:19:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6305CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06C94187B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTcXF7kTvyq4 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.183.30.227;
 helo=mx08-0015a003.pphosted.com; envelope-from=ian.merin@entrust.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E63F541259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63F541259
Received: from mx08-0015a003.pphosted.com (mx08-0015a003.pphosted.com
 [185.183.30.227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E63F541259
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:48 +0000 (UTC)
Received: from pps.filterd (m0242863.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51593iJ9032280;
 Wed, 5 Feb 2025 09:19:46 -0600
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 44m51ah2x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2025 09:19:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KicNmdAXjzIs5mryUeSiuG6fx8cGd8ZHjJj5iAbcToTbILSU0Qcda9yzrgwK5ekIILnMzfnOexFs+YQ2ZeXa8iGQKNpxPtr+p41HDEAuZtrSDx/jHxNz8JZPeUtaragWuq06Tb+hQdTt6fFC4MRLrJ739YYoIXgHvW2g+Xqzx2yGP/gYEc0Hs8E7+fk7nuY4xBP5KS83Jaf0atBaMmDZbyeb7wYgozA3SR70N1peUCW+NvNCYhuAlJooyef+rP4X3SNT0Bqf6soPBRn115+EdCjB4tQMalj7cZyrTmWQJ831wM7NpvjogHZTGFdOphbs3Vwki78ac3tp2l1bMUM9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyNPfFmS6OoxwM1sjmR1hzQIBTCgCM4lWN9TBxqoXvk=;
 b=yVcEiS9ZqPTTuqok8062W7nlbMvFRi6fT4IISD9zOiul6JnhvTGbNYlDzzJvS3IVSyvndL0tcT2JyzmzBDt8hrsmghYPcRGP+ZDqwt9yKLGAZLodiNv1ELe+WVo4NSOVtgrEL9Dev4hhUwRFyv+owp6ojlKivC4vgJrBcr40jSqpFn9v7VUf774fNxYLXoCBD79wO6gkz6zOmuQ/ltJm0xpep9ocTwQFH4V3ZC9BsbCSUpen8249DmGwbGK34n8ct2pR6j35Q7XfhcwSqiPK2H2YcRIesRdTj9cMM1AT4bF0y2ZhpFsXk7NrWuHu/pUMULH9PSeaR73QORDz4QJtwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by DS0PR11MB6373.namprd11.prod.outlook.com (2603:10b6:8:cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 15:19:41 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 15:19:41 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Ian Merin via buildroot <buildroot@buildroot.org>, "jezz@sysmic.org"
 <jezz@sysmic.org>
Thread-Topic: [EXTERNAL] Re: [Buildroot] [PATCH] package/lxc: add libapparmor
 optional dependency
Thread-Index: AdtyhlQpJ6IRrcZ9T5SlFwYsoImpegFVKaGAAACCRMAAAG2lgAAAX4BA
Date: Wed, 5 Feb 2025 15:19:41 +0000
Message-ID: <BN7PR11MB2788AFEE49955B7EA4544769FFF72@BN7PR11MB2788.namprd11.prod.outlook.com>
References: <BN7PR11MB2788D839BE96640DA8286B62FFEE2@BN7PR11MB2788.namprd11.prod.outlook.com>
 <20250205153353.1f380f10@windsurf>
 <BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72@BN7PR11MB2788.namprd11.prod.outlook.com>
 <20250205160043.288fabbf@windsurf>
In-Reply-To: <20250205160043.288fabbf@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|DS0PR11MB6373:EE_
x-ms-office365-filtering-correlation-id: 6a1e0b6b-9e77-4c98-8817-08dd45f88360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: =?utf-8?B?WUxXdmJoRGZyTUNhR2UxanlXWG50VUV5cU1oUmZ6azY0QlVld1BzcE84Q0dV?=
 =?utf-8?B?T3NkTDJscFRuRDdyWWVWMFAzNkg4WC80MkVXV0xXL3l3K0lnWHVCTXVvTS9K?=
 =?utf-8?B?MEkyTWFBUGJhZ3lKa0p5a3g4cVVxYWpjV3o5WVVEakhSNklRbWVwUHFJbDZF?=
 =?utf-8?B?aDR3U2RVdU9WQ2NjWmlXMXdFR1BRVkNPSE93Nk1kdVo3bXNsTzJSdmV2MUh5?=
 =?utf-8?B?UHp2S2Z6TCtPNEd4dzIyY1I4RTUrK0tKRE1KYlNOaUhrcmh6WDJUMS9FUGh3?=
 =?utf-8?B?blNDcGErYXZCbEpQRll0K0NmNTVrVDRUQTY1V1ZXSWtiL29FRFJxTC9KTDRw?=
 =?utf-8?B?bGI1dklsb2V5TnNxa0xKL0xwQXlSbUwrcEs0RnhseWpDK0N5UDRLcmQ5UWVm?=
 =?utf-8?B?QTZpb0J6NlFLR3VLL0JJbmhlb0JoWktJL2hHcUpGQ2JmNFdTNW1qNWIrVGtk?=
 =?utf-8?B?QnNtRmw0Z0RrR2ZBNi93QjlXaXU4RWltUEJkYW10RE82dVdmZWZnR0p0UlR2?=
 =?utf-8?B?NnhOMWZ0RGR4SXhxYkpIZUFSYjlvYXV0aGYxS0tvWmtqdTR1Ty83SnRJSkxy?=
 =?utf-8?B?aWhqWTZEZXZtSFhQNkRkdUZxTWFRL1FMa0plVXIzOTJJdlI2MkdsTTVQeWR4?=
 =?utf-8?B?SDQ5MVhIYjU0R2cxZGN4cmFNWi8vL2VMZkhZNnhvYjVKemQrVUUwMXJIN0x4?=
 =?utf-8?B?dDNpb0V3b0xwVFhvQkhBQitXZUczTjY0dGdlWVFDdjMyLzVncXN5VUZwaXo5?=
 =?utf-8?B?cUk0SU9HdE56UEMvME9QVEpYS0hMSDUxQnpnU2kvc1NzeHJCeU5Ga0xFSHF6?=
 =?utf-8?B?bW1IaWVqclNyWW1ZYzlJSDhjU3lTWjhTZ29HVitVMGlYMVQvOWxNV2FZRE0x?=
 =?utf-8?B?Z0s0VjNhckdkWWtuUDY3RDlnZFhJcitNOGYwTENXVzVZd2ZSNmdyKzdMVVNJ?=
 =?utf-8?B?MDd4VGhOaStDWC9OaEpaZlhTMnFSRzlOL1JkOTNQYmkxM1dIVFdTd1ZueDhu?=
 =?utf-8?B?WnV3Ym91dVFGeituYUs0eGFYWWdWbW9TVWsvUDltWi9vNGZmYUVqTGh4TmRk?=
 =?utf-8?B?c200NTBFaEF6alorcDNneW1IMk14ekhrRWJpQ1BNOVNRMUJUNUFIV2lMMS9u?=
 =?utf-8?B?aVJHcGFDcWJHQjFqcmMySkZMVFRmdzdnakNvRThPTGx5SFNmTW51cFF2dXpK?=
 =?utf-8?B?RGFpdnFTdGlXclMzM0dtZnRtbGpuT3Bad05HYTh6eW41UVdvNzFmMkkrVUZx?=
 =?utf-8?B?ZjN0K0ZBNGhhMlFUVjA0NDExWlFNTWFZa2JDb1Bnak0yb3k1V1ZlUEJ6akoy?=
 =?utf-8?B?c1pWSmhmTnVoTkltbVpSWXNPTGt0VEsyU3RFTFdoU1lHTm82WGR3Y3JKQXZL?=
 =?utf-8?B?aUVoMWE2WEJucEJMN01GUWNrcjhSK2NoaG12ZXIzekNEeWp0ekd2elgyNEtI?=
 =?utf-8?B?MldWK2hjdWdNTURLT1FMV2I5cnJlSjdxSDh5d2sxYW0vUFNIeFhXdUR1Sy9p?=
 =?utf-8?B?TnNiWDJia3R2VTl2dlZYNVBTUTRGLzBBckEyWWMzL21SRXNmVG5JMWExWWpI?=
 =?utf-8?B?K0RJVnl0bVJvQTBnR2Y4SWc5VjM5bzZVRmF3ZUdoTEFLTTdCM2RRUUlQYXpx?=
 =?utf-8?B?cW5YUkxSbG1aWHhBSHFDc3dHaENrdE5uNXpBQmdXSVRPdldRMVNwTFV5bFlP?=
 =?utf-8?B?REtzTnMzT3MwNXh6akdOYjZVTFdHZmRTQ2JSN3Bxa3Q2cy95WXRJY243OS9m?=
 =?utf-8?B?QU9QaVdma09mVkY2cDZ1Q2d1Z2pmbVM5TEc1SFJ2TzFzY1k2dW1MT3pCS1Rv?=
 =?utf-8?B?ZmFBY1VkQ1Z0YVBVUXpPRUxzM2RqeHo2SmVydm5kVHJuTmp4RDhod3ZmaUlU?=
 =?utf-8?Q?yKsTS8u9yDNTE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007)(7053199007)(8096899003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDgzUkQ4Rmh4SEFPaXlsWlM2ZCtWWkcxb2RvYit5cWFnSGJtS3p3MzhxcmQ1?=
 =?utf-8?B?aWE2cXorRlY4TnBqcWhOSmFXang1WmwyTHVHb2NsQ3Y0UEhmdEI2WEVoMFRw?=
 =?utf-8?B?L0EyaXVKYlZhdHYrYmxLU25odVpUekFIeWRaRFpTaHlhbEtnSUl2aXVqTjVr?=
 =?utf-8?B?dUI0aVlNcXZKUzVodGtaK04xNjNzMDlyWEtoYk1adEVid1lPNFQ0dDFCaVZx?=
 =?utf-8?B?L0dyS2N0ZS9Mdyt1OE5SSkNTYTZFcE9ZdmFpRy9rUlpBQnoyVE1qUFlNWGVN?=
 =?utf-8?B?bTc2QWlUNWpjM0loRWZYMERqbXB6bWhqWlJoNEhCWDJzcGZwNGJlbHlEbFhF?=
 =?utf-8?B?YTVpSUtvREpDUzZuVFZCT3lBWTlpZTc1MDF2RVQra2c5bityTXpadXNobWRR?=
 =?utf-8?B?MG1RVC9HWi9sbzVHS293UEF5VkUxNTBkeVd6WGdOM2dkVTkyZmNFV2FSL1gr?=
 =?utf-8?B?WWsxYmlQSEt2dVh6cDFaVURWUHg5VHFmKzVsaE4zTmhUOGtOSjBPYlpqTEc5?=
 =?utf-8?B?U1FPek5oTUZXeU1yUCtiOVNDVzdRN2tZemJmbGhMOXR4aU5lWkR1KzZhRVU2?=
 =?utf-8?B?Wk5WWHB3YjdWaEUwODVKY0FWVkJTL05ibUxHZE1NSUZraUcrZTJiNjE4WDc0?=
 =?utf-8?B?N2JYSk9LcjZWNlpuTVVCdVZySFpLZGMxdWtkcHNXQkNUbXhySWsrTHpZR3dG?=
 =?utf-8?B?NjIwYnp2UnB2SWN1TnRxTnVyaHNMbU1ia2FNcHBtQUoydjRONm13SWFOdnNU?=
 =?utf-8?B?bjVsK0dBbVE3ZkFOamd4VDh2NzBmdFBXU3BTUEFSMTdhc1FId2JqQ29KVmxL?=
 =?utf-8?B?cjFzZ2o1QWJwYUtSWnlleUc3YWpTNEFxVzNmL0M1UjlrZFRWUEJzRjBVT3ky?=
 =?utf-8?B?c0Jmb3RvQXpyeVdBbllFbUlBckFSTXNQU0tDampjemNnVnRDOFlwRFFOMUVm?=
 =?utf-8?B?dG5wNlAxd1EyeE5OQWt6VFlUd1ZoS0s1M3NPdC9QYUlPR1NUVzBaODl6Rk53?=
 =?utf-8?B?RmtlcjVnc1IyL092WDRTQVY2d2hJR25lWjRKWVFCajdBSEswNU5jVEFlNWVo?=
 =?utf-8?B?TjVodFE1UHoycnFMaTR0TTFSL0pPdEQzTEp3d2R2QWxQSzRlZ1N6SlJVYTZm?=
 =?utf-8?B?WEdWYjdKL0hvMGxmdm9pWm9CWHlycWJYbzVtbUZDRzZuamZNM01Pa3ZlSjQ1?=
 =?utf-8?B?V0NOMU95UTFLUzA4TVlwYTZXcVpjUmFYQlZ3RjZrTnZqVjVsRXc3YUlGUTZz?=
 =?utf-8?B?SlowSy9NTlhVQmliSFZwUy95OWhON01rZ2ZaSUlvZWYwSlVHZFEvV3RhWWdp?=
 =?utf-8?B?aDdVcU5ueXpvU2l3QXNEdmpZOENCMzVuay83bk15WFlKd0FiYXBuWWxDN2Fr?=
 =?utf-8?B?blUzZ0xncW1nSEZPSmJ2bFJlM3B1UDdkR1JJeCtMZk0zbjh5TlFpR0tqWWRa?=
 =?utf-8?B?aktYL0NFQXpjMTd1aVVqWFZ1SDBkQ1Z0U3JEUXpmZEQvVzJYWCtCc3VoQkk3?=
 =?utf-8?B?eUFzbnpwV2kzNlU5ajJHTng0Nm55azJwSzM4dVhwZk92dEVGeVFUR3VxVUpY?=
 =?utf-8?B?YUNuejROL0xjNHZGQ3hMcDNxZHo2OEl0dG9hcHJrdHpyYTF2RDZLdXkramgw?=
 =?utf-8?B?bjg1QjZVWFIybWxRWHJuTW5vODExb2tyekhuVFV6Ylc0VWRsOEZiN1FaNUNz?=
 =?utf-8?B?a2ZvUHgrZDI2MERobTIxQi84ZGJISGdVWlZOblZpdjJmSUU0ZkJXYjBPTHBp?=
 =?utf-8?B?OE1weWNtSlYvSERDbjYvMTg2KzJVbjB6c1paSHFKK3d2VHFIaER2LzFHNGMv?=
 =?utf-8?B?MzBYODdQWExIY0NDR2JHWFA4aWVYWGNjMG9MWkJTdC9QKytxa3BaN1RjV0JR?=
 =?utf-8?B?blpLdC95Q1Y0eUkwTlhERjl1M0tsKy93cEZwamI1OXRYcHRHclNMbE90UnNu?=
 =?utf-8?B?TUpnTXhubG9maEp5aUFaWVA0dTMvYlFjZnV4eUNNR2pmb09jWFIyVlpHZDJ6?=
 =?utf-8?B?THEwNHNyVzAxMGV1eXhLeUJ3aDVPbmVjSUZDTXdsb1N4SjI1SS9INGdtUUhD?=
 =?utf-8?B?ZURMMUd1aU40N1c1RFpVZWwzRXNORCtWOTBqb1ZiYkMxZ0dSYVJhNTdLRWZu?=
 =?utf-8?Q?jOU8BSvbA9eIi4ms4v/IWYnUk?=
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1e0b6b-9e77-4c98-8817-08dd45f88360
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 15:19:41.4533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rgvgZRdYU469JV48j2WpUek3riEE5RrCQA7VIRIOGpkPufF+v7NOqCiTkihQkyI5PM7gapeDy/GGYQWNtSnew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6373
X-Authority-Analysis: v=2.4 cv=JpMLrN4C c=1 sm=1 tr=0 ts=67a38191 cx=c_pps
 a=o1gEiTSI8oSw7jzABoeZjA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=dVDJzTMCqzgA:10 a=FEbzDYiKvWYA:10
 a=uherdBYGAAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=XUe_gMu_AAAA:8
 a=YRHvXXt1AAAA:8 a=tBO0m_CJAAAA:8 a=0xsSthMigwn1J8KkzKoA:9 a=lqcHg5cX4UMA:10
 a=PRpDppDLrCsA:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=kGbcBPvywYossJQZYK8A:9 a=mEeZ9kFnNUEhiv11:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=Hyxxk7IO8alR8e2HbrPC:22 a=9bw_jnHfPby8klRCszyn:22
 a=CCE6Xkpzxj1iii1W3FKS:22
X-Proofpoint-ORIG-GUID: yyJhVhfG7k6NBXdvORm1K4ob0bSirfgW
X-Proofpoint-GUID: yyJhVhfG7k6NBXdvORm1K4ob0bSirfgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502050119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=mail1; bh=JLOELgZ+4x+0MgAaeRFbL1Xxxnjl
 C3QOrKh6DbAxCKc=; b=Fv7wvJla6d8gZvq0KPHWzYnORJdZhC0WcS1GDw3eDxIY
 R+YA+p1GMk15CJq3in6okkJkafmn72zN3xCqrUNc1IDDH56zhEepDx6cJYFNO/kh
 w0eExgvOFZiqpM69nTU+A2Xt+W/rKTVQlSGqKHOOkq98KS1vQmTlWpygMxoSgPW0
 SSUd21D4jutv/WhtK3HHhinyHFFKYgceXt5aYRZIvkGwqUdb9LWEf8AhpXY/AFg1
 Q/Hkm/rdZ+Q+f7iRsJt9ht7BAwhTd7R2xpTwZVylE+jBBdfMCXq4uiriExNBNZb0
 YOinsFHW6lMMMC4tXiUsM+TGxMpIEMy2PGeUQiKchw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=entrust.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=entrust.com header.i=@entrust.com header.a=rsa-sha256
 header.s=mail1 header.b=Fv7wvJla
Subject: Re: [Buildroot] [EXTERNAL] Re: [PATCH] package/lxc: add libapparmor
 optional dependency
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
From: Ian Merin via buildroot <buildroot@buildroot.org>
Reply-To: Ian Merin <Ian.Merin@entrust.com>
Content-Type: multipart/mixed; boundary="===============5064425638508303712=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5064425638508303712==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR11MB2788AFEE49955B7EA4544769FFF72BN7PR11MB2788namp_"

--_000_BN7PR11MB2788AFEE49955B7EA4544769FFF72BN7PR11MB2788namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I will defer to your judgment as a maintainer of this project, but I would =
suggest that you leave it as it was originally because I have tested and ve=
rified the functionality of AppArmor enabled LXC containers as the patch is=
 currently written. I have not validated that the AppArmor integration work=
s appropriately with BR2_PACKAGE_LIBAPPARMOR=3Dy and BR2_PACKAGE_APPARMOR n=
ot set.

Given that BR2_PACKAGE_LIBAPPARMOR is a dependency of BR2_PACKAGE_APPARMOR,=
 it is guaranteed to work.

Thanks,

Ian


From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Wednesday, February 5, 2025 10:01 AM
To: Ian Merin <Ian.Merin@entrust.com>
Cc: Ian Merin via buildroot <buildroot@buildroot.org>; jezz@sysmic.org
Subject: Re: [EXTERNAL] Re: [Buildroot] [PATCH] package/lxc: add libapparmo=
r optional dependency

Hello Ian, On Wed, 5 Feb 2025 14:=E2=80=8A49:=E2=80=8A37 +0000 Ian Merin <I=
an.=E2=80=8AMerin@=E2=80=8Aentrust.=E2=80=8Acom> wrote: > BR2_PACKAGE_APPAR=
MOR certainly does exist, and the patch works for me as written: > > https:=
=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//github.=E2=80=8Aco=
m/buildroot/buildroot/blob/master/package/apparmor/Config.=E2=80=8Ain*L1__;=
Iw!!FJ-Y8qCqXTj2!c9eCbVFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN8=
0e2Fs8G8nXUh935m5ctcz-spEpgvoFE0E-$


Hello Ian,



On Wed, 5 Feb 2025 14:49:37 +0000

Ian Merin <Ian.Merin@entrust.com<mailto:Ian.Merin@entrust.com>> wrote:



> BR2_PACKAGE_APPARMOR certainly does exist, and the patch works for me as =
written:

>

> https://urldefense.com/v3/__https://github.com/buildroot/buildroot/blob/m=
aster/package/apparmor/Config.in*L1__;Iw!!FJ-Y8qCqXTj2!c9eCbVFhm-fDJrbCWm9n=
8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh935m5ctcz-spEpgvoFE0E-$<h=
ttps://urldefense.com/v3/__https:/github.com/buildroot/buildroot/blob/maste=
r/package/apparmor/Config.in*L1__;Iw!!FJ-Y8qCqXTj2!c9eCbVFhm-fDJrbCWm9n8w6s=
yQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh935m5ctcz-spEpgvoFE0E-$>

>

> BR2_PACKAGE_LIBAPPARMOR is selected as a dependency of BR2_PACKAGE_APPARM=
OR



Sorry, I missed that. I had only enabled BR2_PACKAGE_LIBAPPARMOR in my

configuration. However, it doesn't really make sense to have a

condition on option XYZ and then depend on another package. Here the

dependency that's needed by lxc is indeed libapparmor, which is the

dependency you added in LXC_DEPENDENCIES:



+LXC_DEPENDENCIES +=3D libapparmor



Best regards,



Thomas

--

Thomas Petazzoni, co-owner and CEO, Bootlin

Embedded Linux and Kernel engineering and training

https://urldefense.com/v3/__https://bootlin.com__;!!FJ-Y8qCqXTj2!c9eCbVFhm-=
fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh935m5ctcz-spEpg=
tbW5g-6$<https://urldefense.com/v3/__https:/bootlin.com__;!!FJ-Y8qCqXTj2!c9=
eCbVFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh935m5ct=
cz-spEpgtbW5g-6$>

Any email and files/attachments transmitted with it are intended solely for=
 the use of the individual or entity to whom they are addressed. If this me=
ssage has been sent to you in error, you must not copy, distribute or discl=
ose of the information it contains. Please notify Entrust immediately and d=
elete the message from your system.


--_000_BN7PR11MB2788AFEE49955B7EA4544769FFF72BN7PR11MB2788namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I will defer to you=
r judgment as a maintainer of this project, but I would suggest that you le=
ave it as it was originally because I have tested and verified the function=
ality of AppArmor enabled LXC containers
 as the patch is currently written. I have not validated that the AppArmor =
integration works appropriately with BR2_PACKAGE_LIBAPPARMOR=3Dy and BR2_PA=
CKAGE_APPARMOR not set.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Given that BR2_PACK=
AGE_LIBAPPARMOR is a dependency of BR2_PACKAGE_APPARMOR, it is guaranteed t=
o work.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ian<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Thomas Petazzoni &lt;thomas.pe=
tazzoni@bootlin.com&gt;
<br>
<b>Sent:</b> Wednesday, February 5, 2025 10:01 AM<br>
<b>To:</b> Ian Merin &lt;Ian.Merin@entrust.com&gt;<br>
<b>Cc:</b> Ian Merin via buildroot &lt;buildroot@buildroot.org&gt;; jezz@sy=
smic.org<br>
<b>Subject:</b> Re: [EXTERNAL] Re: [Buildroot] [PATCH] package/lxc: add lib=
apparmor optional dependency<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white">Hello Ian, On Wed, 5 Feb 2025 14:</span><span s=
tyle=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:whit=
e">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">49:</span><s=
pan style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color=
:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">37
 +0000 Ian Merin &lt;Ian.</span><span style=3D"font-size:1.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span><span style=3D"fo=
nt-size:1.0pt;color:white">Merin@</span><span style=3D"font-size:1.0pt;font=
-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span><span sty=
le=3D"font-size:1.0pt;color:white">entrust.</span><span style=3D"font-size:=
1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span=
><span style=3D"font-size:1.0pt;color:white">com&gt;
 wrote: &gt; BR2_PACKAGE_APPARMOR certainly does exist, and the patch works=
 for me as written: &gt; &gt; https:</span><span style=3D"font-size:1.0pt;f=
ont-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span><span =
style=3D"font-size:1.0pt;color:white">//urldefense.</span><span style=3D"fo=
nt-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=
=8A</span><span style=3D"font-size:1.0pt;color:white">com/v3/__https:</span=
><span style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">//gi=
thub.</span><span style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif;color:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:=
white">com/buildroot/buildroot/blob/master/package/apparmor/Config.</span><=
span style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;colo=
r:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">in*L1_=
_;Iw!!FJ-Y8qCqXTj2!c9eCbVFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3h=
N80e2Fs8G8nXUh935m5ctcz-spEpgvoFE0E-$<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white"><o:p></o:p></span></p>
</div>
<pre style=3D"white-space:pre-wrap"><span style=3D"font-size:12.0pt;font-fa=
mily:&quot;Arial&quot;,sans-serif">Hello Ian,<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">On Wed, 5 Feb 2025 14:49:37 +0000<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Ian Merin &lt;<a href=3D"mailto:Ian.Merin@entrust.com">Ian.Merin@entrus=
t.com</a>&gt; wrote:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; BR2_PACKAGE_APPARMOR certainly does exist, and the patch works for=
 me as written:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; <o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; <a href=3D"https://urldefense.com/v3/__https:/github.com/buildroot=
/buildroot/blob/master/package/apparmor/Config.in*L1__;Iw!!FJ-Y8qCqXTj2!c9e=
CbVFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh935m5ctc=
z-spEpgvoFE0E-$">https://urldefense.com/v3/__https://github.com/buildroot/b=
uildroot/blob/master/package/apparmor/Config.in*L1__;Iw!!FJ-Y8qCqXTj2!c9eCb=
VFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh935m5ctcz-=
spEpgvoFE0E-$</a><o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; <o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; BR2_PACKAGE_LIBAPPARMOR is selected as a dependency of BR2_PACKAGE=
_APPARMOR<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Sorry, I missed that. I had only enabled BR2_PACKAGE_LIBAPPARMOR in my<=
o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">configuration. However, it doesn't really make sense to have a<o:p></o:=
p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">condition on option XYZ and then depend on another package. Here the<o:=
p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">dependency that's needed by lxc is indeed libapparmor, which is the<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">dependency you added in LXC_DEPENDENCIES:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">+LXC_DEPENDENCIES +=3D libapparmor<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Best regards,<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Thomas<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">-- <o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Thomas Petazzoni, co-owner and CEO, Bootlin<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Embedded Linux and Kernel engineering and training<o:p></o:p></span></p=
re>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><a href=3D"https://urldefense.com/v3/__https:/bootlin.com__;!!FJ-Y8qCqX=
Tj2!c9eCbVFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2Fs8G8nXUh9=
35m5ctcz-spEpgtbW5g-6$">https://urldefense.com/v3/__https://bootlin.com__;!=
!FJ-Y8qCqXTj2!c9eCbVFhm-fDJrbCWm9n8w6syQX0VGWVTJe2CpzAhq5UXqo0BdN9OU3hN80e2=
Fs8G8nXUh935m5ctcz-spEpgtbW5g-6$</a><o:p></o:p></span></pre>
</div>
<i>Any email and files/attachments transmitted with it are intended solely =
for the use of the individual or entity to whom they are addressed. If this=
 message has been sent to you in error, you must not copy, distribute or di=
sclose of the information it contains.
<u>Please notify Entrust immediately and delete the message from your syste=
m.</u></i><br>
<br>
</body>
</html>

--_000_BN7PR11MB2788AFEE49955B7EA4544769FFF72BN7PR11MB2788namp_--

--===============5064425638508303712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5064425638508303712==--
