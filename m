Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2C3C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 08:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF32040569;
	Tue, 18 Feb 2025 08:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APz_cfVscZoK; Tue, 18 Feb 2025 08:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8A2405A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C8A2405A5;
	Tue, 18 Feb 2025 08:09:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAA4BE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDAD160FA4
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUCgpNvUjYaZ for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 08:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::614;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAB9260EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB9260EFB
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAB9260EFB
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx8azrSHzuLEHggk5lZpBGk3SGsckc+K+iLxzqP6koeYDZAAIXHIHRZp5Ur1EfHSmcb71x+aZKGBGnzbrWmpzSrkiQxZfFx+ccIM5qJc78aXLSrMfuu9R5cjbBrHcSip3pir3P92OrgFHeqKXGnpKYrFy/dvtIZjJ4tnZKANDgczBvxM4DPu+cwuf9hs6SHInCqykRBVW14rCzxBvvqT2/xJqB+zJi3jLTtuG6DEw7DAkN1b5Z04Od3kiv8W79pk3WcJH9WxrOA/I2l1Ss6IzdkSxeNapUKgf4m26nYY/0Id14MbRbBTjMpHiOhIdysVXtN04r6cJCmx/JgSEgj+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBjFEW9oETjN+S/mYYRyOwEYzh2/NdWiAntWaomCSWA=;
 b=iO9eanq8avl85mdwHCR7980UBXL4IvEfnYeCGZxMOqlMaVXqyrRWwoCIcMRhikUYZ2f0beXJdLA43lw4b8TAXgquJYJOIAICDo7DjEzvgHmDoQWFcJHlO3oBZXTrRg+zQxkYRce0Abq4qddrozBeuf/YtXISjdQuP7LwshdzJCC+vIfvxgc1SVgsd0OX/UO5zFuiOrOF4wjWImpMauqJv3FkjQqmdzyVuPTW7MLd3hSESh1I0hECWxsiYxMfiuYRvZlRQYmZlmGaQHfkvKXEw+/H1Uyz3mgYQiUmadLuO/DkZ9W+lsbCJm6a/IPSj098bFWOB3fuCT+gc/fQHVFnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 08:09:02 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:09:02 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 4/5] toolchain/toolchain-bare-metal-buildroot: update
 help text for multiple tuple support
Thread-Index: AQHbgTp11Y1IxdF6B0+vR9k9do66KrNMEuWAgAB/1eCAACEiAIAAAKPw
Date: Tue, 18 Feb 2025 08:09:02 +0000
Message-ID: <SA1PR12MB5615BD8CC8188A05A71DA016F0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
 <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
 <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
In-Reply-To: <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SA1PR12MB6919:EE_
x-ms-office365-filtering-correlation-id: cc7218c4-b89d-430c-580a-08dd4ff381a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?WVc5N0RBTFZ0eXpRalZjVDMzbENpRnFGMFVGS3lRKzkwWlcvbnRPeDhyRGhG?=
 =?utf-8?B?NkRnSWJ5Nzd3VFhhbHN2b1plc1FoWjFqaUZmYytad25MZnFxMzFubmgvMmQ4?=
 =?utf-8?B?Q05CZVZkRktqT0x0aXIycjNpOFQ4TnR0aGRiOWxwZUJNS0hyYVplT2Y1MjBE?=
 =?utf-8?B?dXpBazZkOUZPRnlFcUtpa1ptOEIvTFZ4MmdpWXRMMG4rekVDZC8wUXNNano3?=
 =?utf-8?B?Q1hMd3F3ZlVKL3M1ZUZXeXVEeVhLWEJGOHI0OCtackgxQzFJTTZEY3dPN1lr?=
 =?utf-8?B?ZUlKWnFnYytzOUY1aUIrSWJvYk1RRzVCcS9sem9BRStnYUM3d0gvTk82cDJD?=
 =?utf-8?B?cXJQT2tINjA2akQrc3dnQzRsQWU5ZCttSU5zNFF1OFdteWs5b05CR3ZlSjRI?=
 =?utf-8?B?MXZybGI0S244bUFBeUZCUTRIS3JmZnQxUk9IaWF4c293djNiQi9HNmYyeVFy?=
 =?utf-8?B?ZFY2VzYzcVBxeVZCOGszV1UrRHJ4OUp6a1BHNmIzTDJpQldWVXdZRHZWejZo?=
 =?utf-8?B?SDVWdDBHeVFzL051SjJBOVBSbUkzLzJzekF2VUxXK2JvY2lWZVdaY3dLaXcz?=
 =?utf-8?B?Q1JPOUZHOGE0NHhQaUdQYUs3enhQd0g0enB0SzJkOVdpY01DK05mcEUveDli?=
 =?utf-8?B?bEFXK0VhbVpJNjdSYmY0TlNTTU9MdElwOE5YVzRXS1BZREt1Qi9zUUJiMmZ5?=
 =?utf-8?B?dlAvTThwTnd1eFRLcW5XWlZEeW1EajFEK3BOY3REaCtlT2pnUVhYUUN6eTdY?=
 =?utf-8?B?UTJlMkhHdTAweU4wVnowTTBMeTNrVVROUzREc2dPTmRVcEtEendLQjZyRzgy?=
 =?utf-8?B?RnBwV0ZzOURsWkR0VHBWQUpHVWJFTEdsSi91MWVzWUZ6b3RyOHNkbFo3NGJZ?=
 =?utf-8?B?WVRjQ05TSE9XdU41bThmeFZBMVlPaTEweEtrbnFvQXR3K3lETGNuWVl6ZVU2?=
 =?utf-8?B?N2xmeDhvZ2UwTXpYV0Y2Y3NmUHd4bHBjM1NmMEowbjZCOHBrbUlKVTlNNVNi?=
 =?utf-8?B?dkxxYnRMeVBzMEVTWG9lY3d2UkphK0ZJMmVwL0s2QnZtSEpnTm1RbFFlUnU2?=
 =?utf-8?B?ekRiaU8vRGtDQ2prKzFBbW9KcWx0ejZ3VmhrbUVOdzRXYng2OEV6RGIrVnRE?=
 =?utf-8?B?NGZJMTkwa0dDK25VS0FyMEZwMC92ZURMQno2ZmhtdUVZc3dsYlNKZUxUa01V?=
 =?utf-8?B?M0JMNUhuQUpwU0YrQ2p5WE1sZloxU2RsMlZEZjcwQW0veW12N0hjamVqRzhm?=
 =?utf-8?B?d1JhSmt4Z0owaHdQK0JNV3NZMko1OHVVajQvdEFmbzErZEdTYnlDOStCVzRH?=
 =?utf-8?B?dEsvZTlPRURmUWJoL0Iva05ac1E5S2J1KzN1NGdmRXBpZDczREtMc0lwZzg0?=
 =?utf-8?B?eUxvMi9uc1hzUUIzSTVXYXg3ODFvdmRqcnFHeXpxUzdrY2dIbWtkbWZaTVdr?=
 =?utf-8?B?d2c0cjAxUCt2SzVJTElRLzRUUlYzUTRtdjl5czZ2cDd2RG5FaFV2R041djZD?=
 =?utf-8?B?MGFKeUN1Mm4vZkVpMHl1bFlyMUowQVgyQ08xVDNOTUcwYzJkUzdpcHNxY3JV?=
 =?utf-8?B?QUNiN21KeTViY2hWTmdYc2NuUm1hU2xCR3RpdWpHZnN6ZWdkVTZiSXRpZVdW?=
 =?utf-8?B?L202anBZMmFnWkZRbUZKaiswNmFycGtGdFdzZjgxNnpDMFI1b3VVa1VNZzNP?=
 =?utf-8?B?T1J3SzFvbW41VlpTMlh6UWhSaWYwR1k1Uk9RZmJ0OXpoWk5RQ2ovR1hsL2o5?=
 =?utf-8?B?RVpENmtia0kxRG5zSUQzTGdSRDlmeHhpWGpldTJrRWRVa1hjWjluRCtuTzAz?=
 =?utf-8?B?VmtwSXJnQncxM1RPRmovYm1NZzNveHErVUVhem41YjR0NXRCMG9Ec2Nydndj?=
 =?utf-8?B?WGpYS3VWWExZVkd2T1kwT3VJV09SeTRwRVVlQUxtNEphNkxLWHByVWlwYVAy?=
 =?utf-8?B?Z1JCbThsNXVMblZWYys3aDBqZnZDTEFzZWdETzRJTmo2WmhnZXpVbkR0akRF?=
 =?utf-8?B?VnJOOXZaUXpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkZHK2tuQzdrZ0hPOVpJOExFUjM0Y29zU3g3K0h0bkpNZC83NlRINjA3cW04?=
 =?utf-8?B?Z1RPRE9YSWdseUNHa2kwbWRFV1NteUwzWnZITGRRYWJFMW5nNHhRQ21nbjZE?=
 =?utf-8?B?Zlo5MGxtMWlld0NZMGxBaklheFArNVlmN1p1eExDKytkUlVOZHNTV1VMQ1J1?=
 =?utf-8?B?M1IycHFhbkM1NVJyeDZuL0Q2WVB2UitvQWc3TWhTSGUvSWVoL29xWU84c2Nx?=
 =?utf-8?B?dWpLRVVobEVXVTRWc05HOGVNV2Z6em9rOWQ4dUtEUTVsUzgxbDJwcm1ONEdG?=
 =?utf-8?B?TnJLRnZWNitodEFXYnljTkwxN25KMm5hYnVVdGxURWc3T0xOZ1dFMGhBakV3?=
 =?utf-8?B?ejJ1cUR5WEhFMGJZL2FJdzV6bUVVd3hyV2VXUFArdW9pYnZiRFpVdkFYejZj?=
 =?utf-8?B?eFBMUit0SXVDV1dWK1M0bTNWTGNGYTlKMzFWNm5SN0F4U0dzV1NhOVBoYWdQ?=
 =?utf-8?B?cWt4ZzBjNUxyWWRIV21aaHpKa1I3N0VXVkdTWU42YlJuSFZ6RmdxLzQ2Vit0?=
 =?utf-8?B?QytmcXF3KzFyUmlycnd2Y05XcjZXcXppYzFjUTIxUHh5dUdEOGZld1RSbG9L?=
 =?utf-8?B?NHFBd3VJWjFnSzBiR0QrM3Y3QnE5RitnSFJyRTF2Vm0yRG85bHk2M0NnM2o5?=
 =?utf-8?B?MDNYNmFuYTd2c2lMWXpmRTdvazE4K3Q1eW54RGsrRWltRXVQYTN6MWlSdUlx?=
 =?utf-8?B?SjN6K2g1eVpJUDM3U3EvQ2Q4dTZiQ1pId1ZIajNmNnRHUnhvME1YRURYcXVM?=
 =?utf-8?B?QTNCSkZxOFRScG5IUk5Cd0ZlYlpuRUJJRGFBR3djWE56NjY4ZEhiVlFrQlpm?=
 =?utf-8?B?MGdvd0NHL1l5Y1FSQW0vSGFxNjFUT1JCbjFPR3ZtMFdPS2QveWpkaHBKMFd1?=
 =?utf-8?B?QTF0K3VYcWplMnhpeXM1SFlQdGRiYU9BZW81ZHlaMkNVZWlka1ppS2NwYXNU?=
 =?utf-8?B?VlNQUkhha2NObHFKa3RiMzFvVGVqMVJ2Z0ZuS2V2eDZSMDh5K2R3b3cxaHBx?=
 =?utf-8?B?OG5XdU1XWitKVGJGc3ZHa0JBK052ZWs3UjdqdFRYN3NLVUFocitUT3JtMHlK?=
 =?utf-8?B?dC9KK1l2VkwrQ0RZNHBmT3R0V0h2TGlGMlAzbitrNHVvWUxoY0Y5SkRJbGFo?=
 =?utf-8?B?ZzZhTkR4QWUzWiszZXlpMkVLYkpoN3NGMFg1Q0lxQlNpQU5rRXFRZUNIRS82?=
 =?utf-8?B?QkNJTlhEeUIwU0ticHRnYk11dEJXMXcrank5Lzh4TDRKd05MU1pRYS8vTFEz?=
 =?utf-8?B?c2F4dFo3ZDZUU25SODVWZTZpQ3RUR29ZU2ZIVVFrM04wdzBja2lPR0NmSUdO?=
 =?utf-8?B?R1I4OUYwem9DQjN5SzJCUmgrbEhsZHhxV21LZFV3aXBoZC9JVmtCYkQwdVJJ?=
 =?utf-8?B?Si8ydVhIL1g2dklURG5kVmhmY1pzaWYwM01xZXhrNnlkVTNsMHhlZDRkeW5m?=
 =?utf-8?B?ajFEc1FUb2hFNXZaNzV6Szh0MFRVN0lZeXE2MStMYXJZV1FkMHZEdXBpL1J5?=
 =?utf-8?B?bk55clRyeUNCNVMvVnd5cUgwUVlJbFE1MkxXaVZCTlJoK04vcWN6MXRFdGJj?=
 =?utf-8?B?NXFJSW5BSXJVWVB3RlhPZkxhV2E1RnM2SDJOZVRKTGpQQ1JCc1V0WVRMZDgx?=
 =?utf-8?B?YTJLQ015TlVLWk9acFlIdDhnVWs4VGpuYTBxUTR0SjJpY1VibWFJbWxMV1lX?=
 =?utf-8?B?NjR1SmFkRnpXa1o5VXJwc1JtUWxmblFLd241cnFzblBlTXZkZUd4b0pDK090?=
 =?utf-8?B?R1dHYTdBZm1Cd0hkUzA4VFNMZUpuYVpOSEpFRUUvUm5mMXZSMkdpamhlNE9B?=
 =?utf-8?B?eENHRkl6NEdkNEpYTWN1K2FLQnBxTi9LK2kvSmlkdEtwRWVRVlRVZm1JMFcy?=
 =?utf-8?B?RFE2TFFuMSsySm9UTWcvM0NnYzZEeTJ4TVFzNllRWFhwRWJGNEMwUEpSMW5r?=
 =?utf-8?B?UWtoMkhqaDd2ZnVhTmFYeTBaOHI4N2lSTm04Y0pGMUU0ZkF3NnlGMzd6Mzdn?=
 =?utf-8?B?by9FL3dJWS9yRmdCSzJPWjd4MlhQSFUydXhWWGpwRXhLZTZ6c0QvM0pETVFa?=
 =?utf-8?B?MFIyQktaN1VOVEZvU0RSQlFJMklENGhDUU82WVdkejlJa1lDVnZOMVlFQ0VZ?=
 =?utf-8?Q?+MbM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7218c4-b89d-430c-580a-08dd4ff381a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 08:09:02.6750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kjcTIEs//mUBRbBhgf6VbKkJ0F7LmlDKi8uHEs32ArFfsvv21gw+7Sk93sHJaX+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBjFEW9oETjN+S/mYYRyOwEYzh2/NdWiAntWaomCSWA=;
 b=Af6sdXWvO5OjNR8eri03JHcEutkVH1R2IF6UmDpbHDV3+jtACYesWHVfRNTzazVP4xvsFYdOe8yQnv0NM5Amx4xPlAzqroLTSc2uUfokJUxxRGxXmp4RFTtnhJyNgBlUKc7PMy1wF/wzgKBGYePPpfpCkZ4d2I727231N+ssX7U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Af6sdXWv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 4/5]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Hi Arnout,
> [snip]
> Even though Microblaze only ever exists on Xilinx silicon, if someone
> wanted to run Linux on a Microblaze core, they would get a toolchain
> named microblazeel-buildroot-linux-gnu and not microblazeel-xilinx-linux-gnu.
> 
> Since we are using Buildroot as the build system, and since the vendor name
> does not change functionality, it is probably better if we re-name the
> bare-metal toolchain to microblazeel-buildroot-elf instead of
> microblazeel-xilinx-elf as it is named today.

>  It might have been better, but changing it now means that anybody who has a 
> current config which includes xilinx-embeddedsw will also already have the tuple 
> set to microblazeel-xilinx-elf and will get a build failure when 
> xilinx-embeddedsw tries to build with microblazeel-buildroot-elf.

I understand.  However, unless I am wrong, we have not yet issued any
release tags with xilinx-embeddedsw included.

This means that anyone working with xilinx-embeddedsw already is working
from the buildroot master branch, and would probably catch the name change.

Do you think it is really too late to change this?

> The toolchain package is called toolchain-bare-metal-buildroot and not
> toolchain-bare-metal-xilinx after all...
> 
> Assuming you agree with this, I will submit a patch that changes the name.

>  I don't think the consistency aspect is important enough to be worth the churn 
> and the backward incompatibility.

I understand.  It is a bit of a shame to have to live with it.

I suppose another solution is creating a symlink for backwards
compatibility, but not sure if this is better...

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
