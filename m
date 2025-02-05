Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCFC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63F580E00;
	Wed,  5 Feb 2025 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlQdyOr9iMEf; Wed,  5 Feb 2025 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5835E80F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5835E80F0E;
	Wed,  5 Feb 2025 14:49:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFC012F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1DF060FEC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uC0Ieu6rbCx5 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.183.30.227;
 helo=mx08-0015a003.pphosted.com; envelope-from=ian.merin@entrust.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDF5360FE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF5360FE8
Received: from mx08-0015a003.pphosted.com (mx08-0015a003.pphosted.com
 [185.183.30.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDF5360FE8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:49:43 +0000 (UTC)
Received: from pps.filterd (m0242863.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51593lwE032369;
 Wed, 5 Feb 2025 08:49:40 -0600
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 44m51agym7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2025 08:49:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLjqwIRcAF5x9CagURd6GH9W8/ngL8uWXoCtigdzad/pUFuAaZjVCPvV3ssvl/+cuSCiitvnsXBi0RqqMtn8mw1NX3YVJFLoSGEpo/40ex1lSEd4PukOOSpBroq1C0MjBb6USOZIrOpjQKSugQ4jazdh51h/j/SyUNzKE38DxqN6Y74eRQ1uvY0msf9JCPKWA6Fm/lLSb9zHiEhLdn+aOf6ZXIsAGsogcyPw/9wswRf96iAvxPgl25htG19fFTdGil8IGGVKR3rjcYYZ+3t+2sI+wMfVd6sD7spa8yeF8BkRNOOyT8wmf/uX4l6c88MKsso4jEAJ3aqwsJk3A6zIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3JWXGU5et0F2izvlQ9sa10ksyCp1Z95VY5XX9k7wHY=;
 b=BU22JajlChP/xzs8ZtaCFbLrNh4Ci9k4XTiQ5eAAnRMr+nw7QRiFyaVgt9+nalgQ7m78Eg6jctgdqC426BiTyobJw7mi2lMqVL4psS38Lshryp2jy5QaPv9tkoqhp/9OeJzhVwbhIN1HYswtwodezIWq89DCOgdUH8RY0cLxNmrgR3qvgQjrETpzUtfQlsoWZPDLmSI1CKnGENWL4uoLDllCGPF7ZudWFhXEwUKbh7lLbXZ2knWGwkk4vMDEk5d5dguzuqKL8CWWF4ndPrYkkl6c81V5wy1VApcSN88kR5KWJ2KzQjEh4giGF6x694c+ikEPJaj3UB8J+NXgzSdrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 14:49:37 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 14:49:37 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Merin via buildroot
 <buildroot@buildroot.org>
CC: "jezz@sysmic.org" <jezz@sysmic.org>
Thread-Topic: [EXTERNAL] Re: [Buildroot] [PATCH] package/lxc: add libapparmor
 optional dependency
Thread-Index: AdtyhlQpJ6IRrcZ9T5SlFwYsoImpegFVKaGAAACCRMA=
Date: Wed, 5 Feb 2025 14:49:37 +0000
Message-ID: <BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72@BN7PR11MB2788.namprd11.prod.outlook.com>
References: <BN7PR11MB2788D839BE96640DA8286B62FFEE2@BN7PR11MB2788.namprd11.prod.outlook.com>
 <20250205153353.1f380f10@windsurf>
In-Reply-To: <20250205153353.1f380f10@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|DS0PR11MB8208:EE_
x-ms-office365-filtering-correlation-id: 5143973c-4733-493b-bef9-08dd45f45047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUZBRUF3ZzhBMUk0cGtBbGtGa1Q5REZ1K2Zqd1B0T3B2eUVHRWplN2psZFdG?=
 =?utf-8?B?WTU2Q1FMSHRwRllxUUZrTWVqaXhkbGNHRFQ4MUdFZkNBTXFaVVRwQVRjSEY5?=
 =?utf-8?B?a0gyODlOcjZNL25rK3JKSXpMUnNkbVVOTlRoYkJkeDA3dnc5ZWl6dERwYzYx?=
 =?utf-8?B?c3hmdWhTZlg3YmVJWWlPbXk1NFNza2RqUTJFV1UxNStUdW84ZEpKUWVPYXlG?=
 =?utf-8?B?NzF0Z1h6bTZDeGhhRHk0d0g4b3E3N1BPbm5valdDVXZnRC9ScjRSUFgzQ2Ra?=
 =?utf-8?B?UWhobXh6NGdFUFpEVllWWC9nYllIU0ZtTFVCajV0Y3ZGcGhneXhwZkJWQXp1?=
 =?utf-8?B?NXRBRGZpaUgxamNmQmpGcU9BZ1VWeStMNmx1QlFKclo4WjAvUkgybjlHcGVZ?=
 =?utf-8?B?ekExRmZxV3BxQlhpeWtHelBCUkJtd0FNMVVvOGxmZDlENFVMcW0wdlJHWmNL?=
 =?utf-8?B?TUlVM0YrOXgvaFlvZFFjcUdOYy9SSS8rM1pTY2FWKzMzekkvcVNTLzBwVmQx?=
 =?utf-8?B?ZjdoeFVFWWFGeFFRMTVxZGJLYWhud0duWjhJSGhGYkdEM2pmVUthN0NtNHFM?=
 =?utf-8?B?TEJDeTBIZmNkU0NBQ056aDV3d0NVNG1IUjQ1WVZpUTkwaFpONWxSZGN5YUhZ?=
 =?utf-8?B?c2F4cVFQWXlua1RGZnk4UFRHSWZKYlBtY0ZHL0MwZUZnc3BocUNTTTloYUp4?=
 =?utf-8?B?a0tUdk9ncmQyb1NrUTRqdkZvdTgzNGd0eTVzbmkxQ2dTUks3bFczNXg5U1Y0?=
 =?utf-8?B?YWYwRDZid1lLZjhIRzZZZ2cxZVBSUzlEM2FIYi9XWUJwN0RzblNvaGx5QlU4?=
 =?utf-8?B?aVVsL21nc3pXZkpRVWoraE93OUl4K3dJeThycU5LT2prQjhtTVZ0N0pDaEk5?=
 =?utf-8?B?NzBROGtLd3JTUUZYNWF2OXFPb3A1ZVcyelpvSTUzMUJUSkdHbFZWOXgvdGZB?=
 =?utf-8?B?bmh4VEsyb1U2aGprc2g5Q1VoZmJXSzg2K1FGNHVJSHVkL0EwRHluNWZuY2J4?=
 =?utf-8?B?SHE2Y1QvSXFWSmpqdU1yK2UxVlFwWVZqRWcxcEdoc01oYUhuVWxFWlJOZXl0?=
 =?utf-8?B?UGxqdElxa3JtOXRaZUJPRURVTXZHenkvOWtldHAwMEc4aVlOVWo1cjZDalFP?=
 =?utf-8?B?TGVaUk40UnYxd1lFcXB0eE0zYUFVbjBmU2lWRW1lNWM2bmVmZUhJWDNIaHkv?=
 =?utf-8?B?V3JJb2VzMTJwMTlUQU4zTitqaFl0MjF1Qk9QTTRNUkEvWU9uWWIvV3hUbURn?=
 =?utf-8?B?clFMNjk1WnQvRjh5Y0ZEaGMvQ1NFUFFzNHdiQU9IWkRqWDRJenU5czJ5Wkx0?=
 =?utf-8?B?bnBCZU9UQlZVY1daYW1aa0VtZTlwZFJPd21jNXFVWXNHNHhBUWtvRnUyajFS?=
 =?utf-8?B?TFNCSkJieThYQnFVNXFkMmlOSE1GYTlDUHJ5dWxFZkFuR2Z5KzNmV2xlVTU5?=
 =?utf-8?B?NTBtUkdJcVhMTFl3cTJMcWVTODUrYzJ0eHpsNGpuRGdKM0hjS0ZvSFNmWUxv?=
 =?utf-8?B?VXYrWVVnZExOc0ZQSGx6QWdXR1QvTjFWYWdST0ZqamhFZ1hnRE85anV6aHda?=
 =?utf-8?B?dnRqZi9qenhWV0d3T3ZheTVwSDhIbStmTmZoOUp5ZU56ZE94ejlJNzRSa2NM?=
 =?utf-8?B?WXZ2R2k4L2NzYlUvMmxDL0t5dWQ5L1lMZU43ems0bzlHaTFSTDI0UGVSLzc1?=
 =?utf-8?B?d1pURHlLUkttWVgwWm1aNFk0U21PWTJ2OWxXVDV3eVNUaEIvT3Y1eEdVZDQ5?=
 =?utf-8?B?VUY0ajFNRTc2N2tjcVFPSXgrTTltK0lnc29WWWZSdTZDYXJ0R1hyU2svTHBy?=
 =?utf-8?B?S0c3TVFSYmZBNkV0bTNvVjhBVEo0cWJmb2VtQXNFSDNlR2JsSWw3bXZoZ1Bn?=
 =?utf-8?Q?5b5/0peyRjcfe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2R5dzAzdVVBMVRvaGd3NGRKUDVHdVh2dURmT1RuQzdLQmVTYmN1QTZRNEN5?=
 =?utf-8?B?a2FYWGpycXVjSkZod0lEcVNHR2hFdllqMGR1UEdaenB1UGd1OElybTEyRm5T?=
 =?utf-8?B?T1BWQmtmOE5EelRIMDZFU3Fuay9TK1htdVVoU2l6SG1FQmFIcy94enBYU3BM?=
 =?utf-8?B?bFpzblZUckpiTW9sSWE3VmZaNHg4MWwyYWQ2dHYwQlJRLzNZNWdoLzRTQU4r?=
 =?utf-8?B?dVpXV1J3SzIyUFlPbWtiUVhlNWRKTzQyTnJBMm5EL09MSU1qTjFBU2l0bkpW?=
 =?utf-8?B?N0hhSjBRWEQ2VXo2TUc4TUpBMmhFckpleUw1MnNreExEOGcrM21zYzA5azBp?=
 =?utf-8?B?MUNGY2pDb1ZTUEg3djZRZEsyUWg2Vm1Qc3FGclZGT2U2Zy8zempBRnlvbGhv?=
 =?utf-8?B?bVZxZjRkVGtURVBWUk9xS0dveHQ4aFJLYXhjOUdBMGN2UTNyZHpHNjBIVCtG?=
 =?utf-8?B?eGRrTU80VU5GMG9JejBaR1NxeTBTNjk1ZUlFSGk3eWs5NkV0bWRNaTNodjlN?=
 =?utf-8?B?K1BRcjN1WVhaMmhucWNhcVJiUHF0RktwWFRBbzBpdzNrU0V4N1hVM1E4eVZk?=
 =?utf-8?B?TDUrblF5dGNscXRLdS82SVZzK0NqM0hObE5iNSthQWRNNkdSQW9tTEtmZFVE?=
 =?utf-8?B?RHVPUHNCN3lpdVFUYTdpWnFLN0dVcFZ3WSt6MXJnTTRtaE1hMWZ2Q1J0ajVL?=
 =?utf-8?B?Rm5sYldtRUlRemEvMnpPNlFLcEpnaldBMnFPZGxlWGtSV1lKR28xQnlBZVJr?=
 =?utf-8?B?RmgvaEFPSWdEcUozbm45S3FqN0kxMk5uNU5CTnpYYjJQSDlrbDdrUk0vd3B2?=
 =?utf-8?B?RHRUN1Q2STJTeXQwTUFSdHRGUC9DczJtdVNhREl3WTAxYzA3RUNjcTBod01H?=
 =?utf-8?B?YTdwaGdnZ1FIaHk2a0t5Z2h2QkhmMVlFVXI4aHRPWkFhNW8ycXlFNFYzSGNs?=
 =?utf-8?B?RnVwZ2RaWUNWRFVUdmNYWGsyZVRDaFY2cjlSZG11VUIwcCt5V012SkpUYU90?=
 =?utf-8?B?OTlWbklaWWJiSWNOdnhWak9KY3dxS3YzUUZmYjdQd09kcW9TYjQwdUFyNS82?=
 =?utf-8?B?RGdyRWVuNzY5Ykl5d0RxWHdwUVFqTjVRK1BCRE51aGJhWWlMbVo5c2lIMno4?=
 =?utf-8?B?YTFZVWl1WXRxNFRyZVh6ZFk0Zk54dEdaeVlxdE14YjlmS3gwc0k3TjlBVjl3?=
 =?utf-8?B?UkdHdHBZRXJYUUFPNkZmck5mdlYrd1JLbHY3TENKSHFjK1lQM2JLcXBYZmUr?=
 =?utf-8?B?NHZKVUxJOWx0dVo3UFRrTHNHQjRQOE9ycE5SdGI2U1Q2L3NTb1VLb0tiWXJn?=
 =?utf-8?B?WVNXRGFWdWYrTERFZklBZjg4ZldDQm9tUXdiNU5GNklVdnJQSm1JMi84NEJD?=
 =?utf-8?B?czVBTVFPTExCTER6ci80RGZLb1J6RzVNWVd0L2owb1dnWkd1ZXBvdjJuN0Na?=
 =?utf-8?B?aDlnTkwzL3FDZGpadU13L0tpRWgxN1JacDYvY3ZlaGE5L3c5b0xwUzFVc1JB?=
 =?utf-8?B?Mm9NaVJSN3d0K0VXUHB4U1F5MFdJckk2cDh0Slp3bmlXT3VReTkzY0ZMSzdO?=
 =?utf-8?B?UHdaZGwvcFc3bzJpdnRLRG5iTWt2QzA1TGczTFFSZUI1eGo5cnEvMU9YY3ZG?=
 =?utf-8?B?bzF5OUVYMnhKWHdIRUp6TTJvYUhqRGtiVk8vV2w2YmZUTmNvRElNR2N5Mmc0?=
 =?utf-8?B?cDE0aTdET09zTWhnekhKanpKVWtCYmcwSkdYUnJQY2c2Y1ZHQmFxcmExSDE2?=
 =?utf-8?B?bzl5WW13ajZjU29vN1RkcHl5Y1Q4UURQOXBnQlZheHdEbHcyOGFZdXhFM3V1?=
 =?utf-8?B?ZHRLL2RnZlJYWHNiZG9BdktZbWQ1VXhrWHVxVWJkcG9OTVN1UlRqUjM4em92?=
 =?utf-8?B?QlBtNllHaDVaL1prOE1hWjF1NnA2cUtBK1NFZjc1NzlYU3hKV2szcnk4UjE0?=
 =?utf-8?B?STVsOTFkVUhDZktaUnppcGYrakI3a3hxeWI0dkRoYzBEaGxuZXMvdkxDTmwz?=
 =?utf-8?B?YldCdUEzNUp1RktWOUFSZEszdmFQRUFMSWdDeDM0S2hlNDVtakMycFVOU1h0?=
 =?utf-8?B?d01GcEdQZDFsbDJqSE8wKzlYZlBCRUtJdTVVYmJvZ05JbktQaG45dGQ0MkUw?=
 =?utf-8?Q?kRjviPzKBV/qOGgnITnBl+Z5T?=
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5143973c-4733-493b-bef9-08dd45f45047
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 14:49:37.7542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZOb+Jv1evWhkW7evuC6kX5zXuCYM7UV2wrvvc5vqtQcvfmmyp8tpgRBQIlcCahZpjgyA7T05kGbgWZXR28g1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
X-Authority-Analysis: v=2.4 cv=JpMLrN4C c=1 sm=1 tr=0 ts=67a37a84 cx=c_pps
 a=DnJuoDeutjy/DnsrngHDCQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=dVDJzTMCqzgA:10 a=FEbzDYiKvWYA:10
 a=NEAV23lmAAAA:8 a=uherdBYGAAAA:8 a=P-IC7800AAAA:8 a=YRHvXXt1AAAA:8
 a=XUe_gMu_AAAA:8 a=tBO0m_CJAAAA:8 a=XDZnj_NiAAAA:8 a=noCsEomJGx7R8CxBR48A:9
 a=QEXdDO2ut3YA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=zYC3S-B9aJ0-iTnpxp0A:9
 a=lS7ugvt08p9MyW19:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=lqcHg5cX4UMA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=9bw_jnHfPby8klRCszyn:22
 a=Hyxxk7IO8alR8e2HbrPC:22 a=CCE6Xkpzxj1iii1W3FKS:22 a=Kam8I3mwdY3oFHMCdhp_:22
X-Proofpoint-ORIG-GUID: h2_3dwSstzV1GXnFzLgNTJe-jSnZR1k6
X-Proofpoint-GUID: h2_3dwSstzV1GXnFzLgNTJe-jSnZR1k6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502050116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=mail1; bh=L7rx9mZwHsbB3q+Nq/to6gIXWLXj
 nKq5WoKVlZQbWLg=; b=Vq4pN/y+gltqY/lWteNSMTPYaFH985etcEfNf+bLcPwq
 GYRdxSqac830ERIoYftlXba57XrpAPAL2G8VkTRoA6cm+VF9JZPGuwjbGVfkRp5l
 zM6JjBN2aMX++MdTqLD5jnXbIT1eZH4RbL1z+ks8SxHHW/a/kfJnmWUlmi4ye2SV
 dcqdIIxt3BFLr14wTuJUqBZsFQpf4zZcrz3GNDRN1cagmujIBK/FKQIPCf2NUMpv
 D0v9rA/WmHBaIY4FxwyuVi6VEGwAyNmJNsXCtSg9pyPD2hOdyoABcQKkrW+6cUMm
 vF/j7uQoVpdiBJuwPriMFjKb7XePZnfoI2kbZ5lplw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=entrust.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=entrust.com header.i=@entrust.com header.a=rsa-sha256
 header.s=mail1 header.b=Vq4pN/y+
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
Content-Type: multipart/mixed; boundary="===============1282804303924583307=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1282804303924583307==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72BN7PR11MB2788namp_"

--_000_BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72BN7PR11MB2788namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

BR2_PACKAGE_APPARMOR certainly does exist, and the patch works for me as wr=
itten:

https://github.com/buildroot/buildroot/blob/master/package/apparmor/Config.=
in#L1

BR2_PACKAGE_LIBAPPARMOR is selected as a dependency of BR2_PACKAGE_APPARMOR

Thanks,

Ian


From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Wednesday, February 5, 2025 9:34 AM
To: Ian Merin via buildroot <buildroot@buildroot.org>
Cc: Ian Merin <Ian.Merin@entrust.com>; jezz@sysmic.org
Subject: [EXTERNAL] Re: [Buildroot] [PATCH] package/lxc: add libapparmor op=
tional dependency

Hello Ian, Thanks for your patch! On Wed, 29 Jan 2025 19:=E2=80=8A46:=E2=80=
=8A22 +0000 Ian Merin via buildroot <buildroot@=E2=80=8Abuildroot.=E2=80=8A=
org> wrote: > From e56f77419a6516fef7f63746120755400948e5d3 Mon Sep 17 00:=
=E2=80=8A00:=E2=80=8A00 2001 > From: Ian Merin <Ian.=E2=80=8AMerin@=E2=80=
=8Ancipher.=E2=80=8Acom>


Hello Ian,



Thanks for your patch!



On Wed, 29 Jan 2025 19:46:22 +0000

Ian Merin via buildroot <buildroot@buildroot.org<mailto:buildroot@buildroot=
.org>> wrote:



> From e56f77419a6516fef7f63746120755400948e5d3 Mon Sep 17 00:00:00 2001

> From: Ian Merin <Ian.Merin@ncipher.com<mailto:Ian.Merin@ncipher.com>>

> Date: Wed, 29 Jan 2025 11:15:20 -0500

> Subject: [PATCH] package/lxc: add libapparmor optional dependency



You didn't use git send-email to send your patch, which made it

difficult to apply. Indeed, it looks like you pasted the output of "git

format-patch" into the body of an e-mail, making the resulting e-mail

unapplicable by "git am".



> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk

> index b2afb978e6..d2227c3760 100644

> --- a/package/lxc/lxc.mk

> +++ b/package/lxc/lxc.mk

> @@ -13,7 +13,6 @@ LXC_DEPENDENCIES =3D host-pkgconf

> LXC_INSTALL_STAGING =3D YES

>

> LXC_CONF_OPTS =3D \

> -       -Dapparmor=3Dfalse \

>        -Dexamples=3Dfalse \

>        -Dman=3Dfalse

>

> @@ -21,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)

> LXC_DEPENDENCIES +=3D bash-completion

> endif

>

> +ifeq ($(BR2_PACKAGE_APPARMOR),y)



           ^^^^^^^^ This option doesn't exist, so this never triggers.

           The option is named BR2_PACKAGE_LIBAPPARMOR.



I fixed both issues and applied. Thanks!



Best regards,



Thomas

--

Thomas Petazzoni, co-owner and CEO, Bootlin

Embedded Linux and Kernel engineering and training

https://urldefense.com/v3/__https://bootlin.com__;!!FJ-Y8qCqXTj2!a27zzMC5bn=
mcgIfJnM5qzXaB0youvYy9EZZn8UL41HtlZeUMJmh9OvHu05Aw4LluHWo8CDPFIKbHdsHe7kpzb=
_LIVNBz$<https://urldefense.com/v3/__https:/bootlin.com__;!!FJ-Y8qCqXTj2!a2=
7zzMC5bnmcgIfJnM5qzXaB0youvYy9EZZn8UL41HtlZeUMJmh9OvHu05Aw4LluHWo8CDPFIKbHd=
sHe7kpzb_LIVNBz$>

Any email and files/attachments transmitted with it are intended solely for=
 the use of the individual or entity to whom they are addressed. If this me=
ssage has been sent to you in error, you must not copy, distribute or discl=
ose of the information it contains. Please notify Entrust immediately and d=
elete the message from your system.


--_000_BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72BN7PR11MB2788namp_
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Thomas,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">BR2_PACKAGE_APPARMO=
R certainly does exist, and the patch works for me as written:<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><a href=3D"https://=
github.com/buildroot/buildroot/blob/master/package/apparmor/Config.in#L1">h=
ttps://github.com/buildroot/buildroot/blob/master/package/apparmor/Config.i=
n#L1</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">BR2_PACKAGE_LIBAPPA=
RMOR is selected as a dependency of BR2_PACKAGE_APPARMOR<o:p></o:p></span><=
/p>
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
<b>Sent:</b> Wednesday, February 5, 2025 9:34 AM<br>
<b>To:</b> Ian Merin via buildroot &lt;buildroot@buildroot.org&gt;<br>
<b>Cc:</b> Ian Merin &lt;Ian.Merin@entrust.com&gt;; jezz@sysmic.org<br>
<b>Subject:</b> [EXTERNAL] Re: [Buildroot] [PATCH] package/lxc: add libappa=
rmor optional dependency<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white">Hello Ian, Thanks for your patch! On Wed, 29 Ja=
n 2025 19:</span><span style=3D"font-size:1.0pt;font-family:&quot;Arial&quo=
t;,sans-serif;color:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;c=
olor:white">46:</span><span style=3D"font-size:1.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:white">=E2=80=8A</span><span style=3D"font-size:1.=
0pt;color:white">22
 +0000 Ian Merin via buildroot &lt;buildroot@</span><span style=3D"font-siz=
e:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</sp=
an><span style=3D"font-size:1.0pt;color:white">buildroot.</span><span style=
=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=
=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">org&gt;
 wrote: &gt; From e56f77419a6516fef7f63746120755400948e5d3 Mon Sep 17 00:</=
span><span style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-seri=
f;color:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">=
00:</span><span style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans=
-serif;color:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:wh=
ite">00
 2001 &gt; From: Ian Merin &lt;Ian.</span><span style=3D"font-size:1.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span><span s=
tyle=3D"font-size:1.0pt;color:white">Merin@</span><span style=3D"font-size:=
1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span=
><span style=3D"font-size:1.0pt;color:white">ncipher.</span><span style=3D"=
font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=
=80=8A</span><span style=3D"font-size:1.0pt;color:white">com&gt;<o:p></o:p>=
</span></p>
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
if">Thanks for your patch!<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">On Wed, 29 Jan 2025 19:46:22 +0000<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Ian Merin via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org">=
buildroot@buildroot.org</a>&gt; wrote:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; From e56f77419a6516fef7f63746120755400948e5d3 Mon Sep 17 00:00:00 =
2001<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; From: Ian Merin &lt;<a href=3D"mailto:Ian.Merin@ncipher.com">Ian.M=
erin@ncipher.com</a>&gt;<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Date: Wed, 29 Jan 2025 11:15:20 -0500<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Subject: [PATCH] package/lxc: add libapparmor optional dependency<=
o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">You didn't use git send-email to send your patch, which made it<o:p></o=
:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">difficult to apply. Indeed, it looks like you pasted the output of &quo=
t;git<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">format-patch&quot; into the body of an e-mail, making the resulting e-m=
ail<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">unapplicable by &quot;git am&quot;.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk<o:p></o:p></s=
pan></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; index b2afb978e6..d2227c3760 100644<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; --- a/package/lxc/lxc.mk<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +++ b/package/lxc/lxc.mk<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; @@ -13,7 +13,6 @@ LXC_DEPENDENCIES =3D host-pkgconf<o:p></o:p></sp=
an></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; LXC_INSTALL_STAGING =3D YES<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; <o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; LXC_CONF_OPTS =3D \<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dapparmor=3Dfalse \<o:p></o=
:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dexamples=3Dfalse \<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dman=3Dfalse<o:p></o:p>=
</span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; <o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; @@ -21,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)<o:p></o=
:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; LXC_DEPENDENCIES +=3D bash-completion<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; endif<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; <o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +ifeq ($(BR2_PACKAGE_APPARMOR),y)<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^ T=
his option doesn't exist, so this never triggers.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The option=
 is named BR2_PACKAGE_LIBAPPARMOR.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">I fixed both issues and applied. Thanks!<o:p></o:p></span></pre>
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
Tj2!a27zzMC5bnmcgIfJnM5qzXaB0youvYy9EZZn8UL41HtlZeUMJmh9OvHu05Aw4LluHWo8CDP=
FIKbHdsHe7kpzb_LIVNBz$">https://urldefense.com/v3/__https://bootlin.com__;!=
!FJ-Y8qCqXTj2!a27zzMC5bnmcgIfJnM5qzXaB0youvYy9EZZn8UL41HtlZeUMJmh9OvHu05Aw4=
LluHWo8CDPFIKbHdsHe7kpzb_LIVNBz$</a><o:p></o:p></span></pre>
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

--_000_BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72BN7PR11MB2788namp_--

--===============1282804303924583307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1282804303924583307==--
