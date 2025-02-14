Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F533C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 15:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5B740CC6;
	Fri, 14 Feb 2025 15:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blbxYbyf3NEv; Fri, 14 Feb 2025 15:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E20E40CCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E20E40CCE;
	Fri, 14 Feb 2025 15:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6326C1C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4735C40CBC
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSEFFlsGViTQ for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 15:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::608;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 461BC40CC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461BC40CC6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 461BC40CC6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSt48SOayCNURAYVnf7Brxlldztir61ypuyeVw7o6bgL7b1swShGhXKcEvG0EWGzAhXitOX1ILy+oFkId7PtRPsDtTcVeaA09WAvUya1zag5sddY6zHBrvtmp+BqjSnEB3mZM8KV/MxVKso1l/4Z5l3qcss7UZN7MiiOHBYBnZ9eyx41BiBCl4650CffCF6+jxicLVKRadLb3UoKN2e5m80EWVHQhpafNm/wejJFi69zroQP7hVz4qclLtZZNE0Yqxf6IkZzmZU5Fh7cFLkEgp/qoEk4Iavk8OIQ09OiNYBHL3E/I3CCvCQ45uCvftBSUjhBsu14l+DZPxxQaNhfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8jYtMlRIr+yB8Bau8BkH2zFvB/TykabwvrvUOELzZU=;
 b=ENgNIEDlpbxg1CUs/TjOKZWp6vYnyIQWNAJ5D9OpqQ0MYBHUik4d41ZgJPiQtlUsOrK9whj88x4lx20tP7ItSniY1T60EAj91ucSGYHpVG/J3dROBS+cVUKUlkvMTDlcTY4hHpSj1WmT82/d6NcU2Ghb9Un9vRB6q8+oBnBKfCTbzUsFh4XCydGkdpgLuvRTjpamMDuCkteeCr9sjqJ+jHR+r6960hp61deqzyhBXrMsobTPUqfFD+TInUw165xPpMh/sf654H0COefnY67hPVdplpWDP6SeB5PuinzNj/MbTuv7j8KJGr0y4I2H14mk3XeV4HWbxbO86u1fzNXPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW4PR12MB6923.namprd12.prod.outlook.com (2603:10b6:303:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 15:38:07 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 15:38:07 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: Example of running a host-autotools-package several times with
 different configs
Thread-Index: Adt+tqXxjQdaN+RgSxS5d4rmTSozLwAAkGEAAAAk6mAAAUx8gAANwt6g
Date: Fri, 14 Feb 2025 15:38:07 +0000
Message-ID: <SA1PR12MB5615B192D40B73B15C94F179F0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <SA1PR12MB561545FCE581A3061A9C6BFBF0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <c102f1f0-9737-415e-9f51-8e98888a37dd@mind.be>
 <SA1PR12MB5615EF0BB95C7BE3F02229E5F0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <9d11aa2f-64e7-4827-a006-6d3fa8b6d332@mind.be>
In-Reply-To: <9d11aa2f-64e7-4827-a006-6d3fa8b6d332@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW4PR12MB6923:EE_
x-ms-office365-filtering-correlation-id: 4d41ca30-a92d-44c5-7eaa-08dd4d0d945b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NlNtaW1ld2lFbE8vVDE0V2pxUXNGU25heTdRSWtMMFVKNFk4S205bkxEZzhh?=
 =?utf-8?B?ZXhYeUFkNmJWaTZTNEdBRXFJTTZvR2RYY3BLM2RKbmx3Rnl4alFuT0hGeVZB?=
 =?utf-8?B?VFBEYnhWRmk2ODNyZmp2bHg4NlNMTi9XQlI4MkxtRXBvOHpEWmRvRjBMQnJH?=
 =?utf-8?B?Rm41b3MreUZJQ3ZvbEFxM2tHaDEybldmMjhHcHBVZGJqK3VCenY5dFYrWGlj?=
 =?utf-8?B?NThza3VHS1hXVUQ0T1JxaXdVYnpBdzh6NE9CTkZTRDVQMHFIY09aOWsrY0dW?=
 =?utf-8?B?dGFqaUwvN091VmROcGllb1pkZjlrTU5UTWxsV0U4ZkUySGh6OStZbVkrcE1S?=
 =?utf-8?B?MlJWa1R1elphcGFqdGlRTVA5S3YwajJBWWsybGRMNjJWbHNERC9pZStuM01S?=
 =?utf-8?B?Q3lRN0dQcFJybEx4WkczR0l3WUl0L3JrTW1xaStZSWtEbWkrUjJZMC9tbzFJ?=
 =?utf-8?B?QS9NVDJkdzlleGdrbDFDTTQrTUFoR3E5U3pya2VtU0M3ZjZzYjdyOFZHdTZR?=
 =?utf-8?B?T0svZ04vOTA3a1puS24wbmN5cS9FS0gwMDVIRkJHWTVVSW5LV2JKcHhWSXZx?=
 =?utf-8?B?KzRiZmd6aEtXQ3h5T0FLNmliVHdSZnhDUmxKbXNDVkI0TkQ1NEJoWTJSQlE4?=
 =?utf-8?B?aks5aWthS3YyV29UbzBDWUUzUUFSMjlVUTJ0ZzFGb1ZrWGVDMGo0ZTJFdnVZ?=
 =?utf-8?B?dm9Uai9HSmhSZ0l0WW4rdFRmbEk2anNPRGRrQ1orS0JQeWJLYnN3S1R1SXpE?=
 =?utf-8?B?QUZ0VFd0b29BRG1rV1YvYm5Ja2lyaFgrZVdyOTR3VEZkNFY3SmpsSHhqaklH?=
 =?utf-8?B?dHVXaThudmRCcUZhOHp5T0lmUTAwMlVtU0JDeHhhdHlwcTF3bmxPZnN6U2F0?=
 =?utf-8?B?WnBUelVYL3ZmMGxFNmpjeDlEcytMa0hKUkgwdmRjU2JRdE10QkF3UXloNUEv?=
 =?utf-8?B?dnJGZi9qbmNDbDlGdi93YWZmZVdKUEdZN1dpaXg0MFE3MXJ4V05LbndYL05h?=
 =?utf-8?B?TTNITkQ1MnhFaE5IbXczS2hWRVNzcHVpTUhNZkMybnU5RDRaTER6SEpLV3VD?=
 =?utf-8?B?dVVobGhIVi92YWNEVFNESlE2Ulp3QzlCQzNjdUFiY3FvYlhvdW5sdWRjRnVw?=
 =?utf-8?B?SUh6a3hyQVdmWUMxR1djNERpWUZDQlQvbjlhNXZtaFJ4T2hxeFE0bmdiQ2Jx?=
 =?utf-8?B?a1RiN1hnNTd2TXFIVmpwMUNSSTJlL25jSlZTYytYeGFvelcrRW5UZ3pPZHhX?=
 =?utf-8?B?RG8ycHJUWVBmUUM1RVFjQklaSzNjblNKS1dDdFJ6ZlptQ1F0dXBBb0F1NzdT?=
 =?utf-8?B?TmZnZTUxYm13ZVZZWGtUcDZMdjUzVjBVN0JRYkQzbGdVL1IycUowUTFCcnQ5?=
 =?utf-8?B?OUUxQWRUU2RuVTlQdFBnbzBLSVUxVmFnUmt4MStKNnZOSUlnWXBSc2JIZEUr?=
 =?utf-8?B?N3VncVJQZXZkd3FZYlhJMVJpTlVzVWkxVmJ5eEhuMFBSUWVBY2lOYTFlekVh?=
 =?utf-8?B?aGVJZmh0VG5FQlVqSEwwdWp5WjJodkgwYTdwZTFKL0Rva2czNVFWeHZ2RGZL?=
 =?utf-8?B?emo2T1pPV0UvMWY0VDRxbnpPMU5UdjRETm00YktHeGNLM2lKbTdUU0J6TEUy?=
 =?utf-8?B?b2VoczN6T09EY21KZ0p6OEt5K1kyd1kvNGQxTFZ3K0xGTGJSTXdIYktxNDAx?=
 =?utf-8?B?eWw4Z1ROY01TS2ttSWxsUjRZbVNYZHdXb09oTDgxbXRCQ29uN0tVZkF0bFN5?=
 =?utf-8?B?WkhOOThGdU5CLzE4Z3pKVEVudEpUcUY4K24wYW5Cb05tNklvSU9WMHdpbG5a?=
 =?utf-8?B?Y3hla1hJZWRoWmQ3RXFnTGJ1Q2FId1dJemQ5NnRtbXR4OThLNkJIWlJyU25z?=
 =?utf-8?B?SVlEYXE4QmpNOHhEM1FiOUVZVFd2ekxPcy9NVzVJaVVqM251T1FoVVBZMElQ?=
 =?utf-8?Q?mY/Dq2uKRUWx/YnFasn8BfGwYeqS6uII?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1RHTUx0SXJqNnlvVmFOaGptZkkydE1lZnp2TzdUaW5DMHpEVndCaSt2T0lJ?=
 =?utf-8?B?SU5LVitWeDJwVzNKR2JrUWVBVU5RU3NjQXFJSnQ5SVZMOVhRZ2hFRUxzVElH?=
 =?utf-8?B?WkdBRnNQbFc5cG5QOUE0THE0Zlp6bWtHK2pIUjVIWmJZL1M1d1hsL0J0TkNo?=
 =?utf-8?B?bmtwZk1kMmJPZ3dLcEpFd3RmZmtKSmwzY3I3Q3o5cW9zOEhDVXdEUmRnSlJB?=
 =?utf-8?B?TlhuTTBTZTE1QnlrRWswUVprbjRqTjhxeHZWMWRZYWxncGtwSjFLUTNIMTA0?=
 =?utf-8?B?TDZlMVZ1b2F4SWhUVlFZSjlxdGkxa2wyZ2dwWU9PSE9BMFNDWVY4OU9YbHdV?=
 =?utf-8?B?aXYyRnNzWS9JT0NRM3dFV0hTQkpYeGhnanFndVNtMVYrNEd1d3NoRDEwbldR?=
 =?utf-8?B?Z1VZUzFRRUw2RGVJbkhmdjNXNk1BN29WOVJiQnZQTjFuWCtoc0NnVGFXbVVO?=
 =?utf-8?B?TVlEMUtveGZZK3dyTmRMdHBEWXE0VDV5OW53d1RKb1pIUlBSQVEvdlZjUjJy?=
 =?utf-8?B?aXUwamdHYzNYQU94Tmc3cjduSy91a3VOclU1MStMR1JXR3pPc0U5NEZRc2Y4?=
 =?utf-8?B?RHhTTTFuR2o4RldLRTZSSy8zK0d1UEZjTWNqQ1lIS04yZVIvUlRrVU1sSFYr?=
 =?utf-8?B?QURTQjVvcE9xWmZJN09QbEt1YllqWGdXVEdZRmt1My9ROFI0ZmsxUi84WGRj?=
 =?utf-8?B?SHZEWm4xaUpVeFdkdmovbDJaVlorNWZybjNHblZOUzdWQUE0eFlJMCtFVHlx?=
 =?utf-8?B?K0V0NXM0eERmVU14ZVVBR0NrTnpSVzhKNWhvMTNUL2RZL1pybkpLWWhVT1pt?=
 =?utf-8?B?U3lIbURzeDNOdWpTbFU0TUJMUFIwTHdUVHM4aDBXVE5sUi9vOElnRnFLWEZZ?=
 =?utf-8?B?VGo2cGI5Q1MyWUlUMWxsYjJWQUNrd3VjaXFUQUgvTDVxRFc0eGFpeWkrcWJH?=
 =?utf-8?B?UmZwWnFHZWhqR0dJZ3hway9HWG9FUXIvdmhmTGZMek85VDRhMWlxZ3JES1F3?=
 =?utf-8?B?TExtQUpOc09vRzVFUDhvSHpzS0VHMGdOT3duZkdEdHZYUnNONmNnL1hqRVFP?=
 =?utf-8?B?ZEFsWHlIOG10ejE1cG5VbmgwV2VjblhZNXFNRStSdFdtaCtTUHNKeFJVVS9r?=
 =?utf-8?B?YXpDSXZGSWZUTkhJdmRuT2ZEeWtlbkNhR3AwSVRHMFBsaW1HWEw4YmNRV2hv?=
 =?utf-8?B?S3hKS1dJN1ZOZ2FzNkpFSS82QW9Pd1g5WHJpbzc5OTJqV2dBZnVkUjlzWjNv?=
 =?utf-8?B?ek9BUm11Z2xZQjd0U25lYk1jV2Y1eWwwZjV2dDZHNHgzWlRsQlNkSGlkYlEw?=
 =?utf-8?B?WSs5aS9XM0ZxNHdDUzVWaVVKVkFjZlp2UUI2NmNwdjlSaWVHakU2dEZ6dWEr?=
 =?utf-8?B?ODJGdHFVdUNKYTNQTEZhR0pQMCtTRVhXQWI4MG8yejV2UWxaNW11UG1PK2dN?=
 =?utf-8?B?TW1hNXdvZGZVclluZXhNN2VWT0pMaGdxWC8vREUrYTcwUW1YSFZieldnaHdq?=
 =?utf-8?B?YzgyV2NsS29CaG4rZUxlUDFIRWVXTzdCVVcrUmVuNDFwaWY2RUtOeWlqRmE0?=
 =?utf-8?B?UHlESitKUmhEbUkwR1h2MW5VSUtrc0s1TnM3WUNIS1FFb0hjZzBCRDhwNlMx?=
 =?utf-8?B?ZUlQaUYvbU1sUVNLeUZDbDI4OTBtSEFVcXgwSzJqeStYdDZjYXNoRkdwMjhP?=
 =?utf-8?B?ajlRcHNzV1FsNTZrUzlGdWpySnlqR0VBcVdjblc5Rnp3YS9mRk5MWVJ0eUpq?=
 =?utf-8?B?V3crZ0hsdUlWcHlRN3BabzhZWVVLTFhtd0xBQnpIa1dFdnpXdFlOamRTYUlI?=
 =?utf-8?B?WUMzRWNVaEtiS0lFNlp3M1E5aHFOTTNIbjd6TVhOcmVXdzRaMFE5cDVGVElP?=
 =?utf-8?B?d1hCdzR1SFllQ05TU2VEMVFXSnpvcFlONFllcUM1WVlrOEpSL1RRZzUzUms1?=
 =?utf-8?B?anYxdXMybjZEVlF2dUFJdkNpZlFIOEtmU0hibUtRa21vUVhJUVFMNEJkd3FY?=
 =?utf-8?B?dzVTVS8wZ2hpRisySUlGbzA2WHlCTUp4SUtHa0E1aERNWUcxcUZvKy9hczFP?=
 =?utf-8?B?bGNoTU5pdHZKK0ovbWhEdFhqNHUrQWdBTTdvMWI2cGxEK2hMdzBsbUxiZzdK?=
 =?utf-8?Q?WMSA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d41ca30-a92d-44c5-7eaa-08dd4d0d945b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 15:38:07.5330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bH73EqkJAgxFZPBXbB40xlpva277sqyu5Co2X2bT8FxQswo+9+pk4KsLbKp/byur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8jYtMlRIr+yB8Bau8BkH2zFvB/TykabwvrvUOELzZU=;
 b=jgPanKVcUjwPDBVsS0pn0VzBH6H0G1fjJ5Gan3yvLk1CQo1ZzDOKR8fCrEm4eaXwQMczI3wmkGYCwV5+zEWOZx6L/CJoa4SuVkSKitvnDBeJ0nk79jCB3JAZHqzIWGgKXk0iLK3zHY+EtJ6VLqnpmYCOuE9rQqRWVDYXoz1qIQk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jgPanKVc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] Example of running a host-autotools-package several
 times with different configs
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

Hi Arnout,

> Hi Arnout,
> 
>> Hello everyone,
>>
>> I am looking into expanding the toolchain-bare-metal-buildroot package to
>> define multiple bare-metal architectures in a list and build several
>> bare-metal toolchains with the single set of packages.
>>
>> Since binutils and gcc are host-autotools packages, I am wondering if
>> we have any examples for a single host-autotools package being used
>> several times with different configure options.  Is there already another
>> package which does this?
> 
>>   No, there isn't, and the Buildroot infra is actively hostile against such a
>> concept due to the splitting of configure, build and install steps.
> 
>>   You would have to define custom commands for each step and then run them in a
>> loop with a different output directory. I.e. something like
> 
>> 	mkdir ${$(PKG)_BUILD_DIR)/build-$(arch)
>>          cd ${$(PKG)_BUILD_DIR)/build-$(arch)
>> 	$($(PKG)_SRC_DIR)/configure --etc
> 
> Thank you for the rapid feedback!
> 
> Regarding the custom commands, I see how I could do this with using
> host-generic packages because I can define my own configure, build and
> install commands.  Is it possible to re-define binutils-bare-metal and
> gcc-bare-metal as host-generic packages instead of host-autotools?

>  Yes it is. However, it starts to diverge so much from normal autotools that it 
> doesn't make a lot o sense to keep using host-autotoos-package.

I see what you mean.

> 
> With host-autotools, it is not clear to me how I can implement my own
> commands since the commands come from the infrastructure itself.

> ifndef $(2)_BUILD_CMDS
> ifeq ($(4),target)
> define $(2)_BUILD_CMDS
>         $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) 
> $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
> endef
> else
> define $(2)_BUILD_CMDS
>         $$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) 
> $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
> endef
> endif
> endif

> i.e. if you define _CMDS in the package.mk file, that will take precedence over 
> the "predefined" commands in autotools-package.

This was very helpful!  Actually, implementing multiple tuple support for
the buildroot-bare-metal-buildroot toolchain was much easier than I thought!

As long as separate build directories are used, we can easily configure and
build a single package multiple times.  We just configure several times in
a row, then build several times in a row, and then install several times.

Thank you for your support!  I look forward to your review of my solution.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
