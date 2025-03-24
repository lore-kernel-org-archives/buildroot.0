Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DADC36008
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 16:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FD58202F;
	Mon, 24 Mar 2025 16:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ik9s4Pyb7ga; Mon, 24 Mar 2025 16:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DB2820B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57DB2820B8;
	Mon, 24 Mar 2025 16:40:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C6D1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 118FB81F42
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAJi-tMDslGO for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 16:40:53 +0000 (UTC)
X-Greylist: delayed 555 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Mar 2025 16:40:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB792820B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB792820B8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.181.66;
 helo=mx07-0035d101.pphosted.com; envelope-from=gilles.bardoux@sagemcom.com;
 receiver=<UNKNOWN> 
Received: from mx07-0035d101.pphosted.com (mx07-0035d101.pphosted.com
 [185.132.181.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB792820B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:40:52 +0000 (UTC)
Received: from pps.filterd (m0166234.ppops.net [127.0.0.1])
 by mx07-0035d101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O0Zes8022513
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:31:35 +0100
Received: from pr0p264cu014.outbound.protection.outlook.com
 (mail-francecentralazlp17012049.outbound.protection.outlook.com
 [40.93.76.49])
 by mx07-0035d101.pphosted.com (PPS) with ESMTPS id 45hjcmj4ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:31:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVSR2cyacRs1RvvUFTwHwN2TSQcTer7wyGm0mzNSB8qUp6bXnpIlvEHzVAu/agwX8BrGmdjZcpWjqvp+lHkSByW+3+jOOpOmZkwlqg9OXlgEGu/OqzOVbwer3uaCpy76QfwAwhVG729U8Gu8aGqGArosoan4fD0wTCKL7UP2/wF7mJ+jnSkaN9glqf635mPBf6GBfjh6GuIyS2NZU/5SXkJ1IwdsriMgLcny7ixMMNHDOQfJZCfdHH2De9UB6QMefjNIZg1ziMEfGuKiQnygn1B2smwOnTdAGvn4FZGUgxAIH9SS2tGHCzSQiz5bnvBxd/qn5A0WYEzONkXo/CRZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsoKkoiUYKMxNaHN9cdvEvJTvPVGIOLvQ6TIpl7R9HQ=;
 b=pajXWWiC0YgmdhC+u2ntMW1wV/ZYAm0zvLGjCRWNralxNiZFyIc37rVGB9sWNbWFZE6GISuqepZIDz39YAxAQXAzMYJGCJ9B7ttG7yIwTGrkEhwXLVaLZavxBR146sCI7FLEsqcISgHnlzf1R8AgBY+tWH7mOfBbYcZN1SEs/mGabxci39DYRQmYYDyj69KAP1eltroxhirYJIdHO0KtOfUVa2VTUHUxj82Mma9zoZuM+Gs7S4D2RplTv4Q576c2nOHXO07RGlyQWhUpe66uvkdsbJJ4lXHIN1ua/5u5ScuXeHPZoXGK8w0+2MQfsqgiO+M8cBOvMlU/dMuK59rWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sagemcom.com; dmarc=pass action=none header.from=sagemcom.com;
 dkim=pass header.d=sagemcom.com; arc=none
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9)
 by MRZP264MB2794.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:31:32 +0000
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1]) by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:31:32 +0000
Message-ID: <825580dd-54a4-4c39-8ed1-2f2c0157968e@sagemcom.com>
Date: Mon, 24 Mar 2025 17:31:31 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
Autocrypt: addr=gilles.bardoux@sagemcom.com; keydata=
 xsBLBEjzGhEBCADAVAUqhr9fIVZnh2OlH4+IMEcEFuLP4vZUAUmhZ6n44r1PsAQ9GVYm1DJb
 8p41JRRC4BIfyHtL5A7g4JedYlSEI/NYyPK+r2swpms9lJ24wL5XpNfYP+h/WmWwY48lw9V1
 6pIiZB2eT2TzFH3q2DYXy4HK2zOvxVOScXev4vnlr6l4lNvuCre7R1iyPEQDpAIgGuIZogkK
 32N7A8RmhaCIgxD4Dd/zPwPIuI/ZYHeB6m4sFWtlChsyPfuWjofvdEcyDOFx+isCnta8dKPD
 h1bAoN4jLrevGVZWwCVNlPEZ6YHSxro8wqGhV0Giy8BZfiERpu/mlbzNxq1NEfQfLbdxAAYp
 zTdHaWxsZXMgQmFyZG91eCAoU2FnZW1Db20pIDxnaWxsZXMuYmFyZG91eEBzYWdlbWNvbS5j
 b20+wsByBBMBAgAcBQJK3FkLAhsPBAsHAwIDFQIDAxYCAQIeAQIXgAAKCRBucG6QhnQboUNo
 B/96YqjKnD5q53ZKYtv2FsAR4gNoLAjiK6KUXkgpZQearLM5TVRP1Vo2/T0Arehy+gHBJfmu
 d407CjmXIK/vKBFUtufVniUKyn6wfp0i6rdBerSsdx6cMDS4TLUfigR1QWPaBe0KrhyhUkFT
 XpanscgHA99zyjzEAZDNK9g5O1qGHe9CevZDAd8OTK4PAMqA8+sRJIHkMnGwUdI1usPoGTwO
 Xt/mPm8jvOZVKYyS0frzxUNEC208jxeR1fpPHb0BU+Z6LXbRKYL8M/ZbkawJskyeMRqkIGcW
 86wk4EXvQRFBhtpg1lBFkKf8RKadkjV1cH6gHnBdQ0pOjU92dII9VVM1zsBMBEjzGhMBCACf
 Jg1c+8U74IxG91wxhC+7j7Xs25r4mbJQs8NclZn16GUd3yykqw4VscNMSWHomXT3j6Q45QOa
 nzry38NYi768fNDYRqVZPrTjE2oUkas8uq9CZp+NYj/vMkjf2V+wi29XZ8LE0Yn+fpb9DORM
 4hZe/DEKvAIfC9O+9UyymoNNoxuPXg4QlYrbnH8uvnexhdxYLUQwEO03z38vMHVZQqILJiMD
 mMenzrB1990ij+fmOyMaNwqulNcAZGZ4ltfOOBwxpSK5yhvyHGf8oVc+EdBqzYzweyPMZ+NB
 VPAj4Wtl5yYJYUqET8cec0A9QCtMokHUV9+DJVhQ8dUOi0UUnjAVAAkBAcLAXAQYAQIABgUC
 SPMaEwAKCRBucG6QhnQbofhAB/sFZJZakJk9ARegRDk82OG7Cf/2oooK3NboxQUK9OI48nvy
 6ow+JfRkBHYfId9HbGP31ca94p1mkJoI/2wwo0KzSm7ke18pglHVe9PIvs9hiUQZd6D56nlO
 6mqnd5MTv5PN7hesjwmZYTT/S3xkzw/4nEcENBKK5B7V7JT5XydyM9YW/I98M/tWPt4DfJfZ
 VvMYpOZkiDGK1UJJCQwNdbfNR+XbMSLov98Nl+QAu3tbwPrFzDolB37q+l/sYMvXXZ89KPft
 qK2Am9oTKflG6Z25wrIQqxkEb/DNbcz9McOvVRqIoxIsMYUmv6bB7p8Lm3y5Nbfej2G7+MgB
 UfWmTKcF
Organization: Sagemcom
X-ClientProxiedBy: PR0P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::15) To PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3183:EE_|MRZP264MB2794:EE_
X-MS-Office365-Filtering-Correlation-Id: 87211d97-2abe-4bb4-69e2-08dd6af15610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1FBbjArSUdxRHNaeUprTHV2cWRnaDA4cnBPOTdndUNha0luRkxKK2Z4S0dT?=
 =?utf-8?B?S0FUc2ZzTHlTb0x6bGhIWG9IZThkQzI4NXlNT1ZVYnowNmRJM0llWEJDTXJa?=
 =?utf-8?B?ZmhXOUx6Y3dVdVJrNmhuQlprUXZMaUc4V2E2ZkMxVkVBOG0xV1p4NjZ1S25l?=
 =?utf-8?B?cHRnWlFRQkZhNGtNRkFZRHVWZW9IQXIrSVFMblJiZHd4RkNQY1hZMkFqcWJ2?=
 =?utf-8?B?UHZRbXJUakNWR3ljZllOYnRoL2krNEpsamFKWVZ4aFVxNEJkMnNJNmtkaXVE?=
 =?utf-8?B?cDdoSGxLWTJwa05JYm1SZDM4b0JWclFZbElISjl0amJibzJWVWhEUDlxVXo2?=
 =?utf-8?B?N3E1WmRHeGRMOEJ0bnJubmk2enUwV2hrYXZLSDJ2SWhRM216NU4zWE80Wk9u?=
 =?utf-8?B?ZE5BbVhicVFYNG1lM1V3di9lZ3NQeENoUk9UbnRiZUZLaW42LzUra091c04y?=
 =?utf-8?B?a3ltVUV3TEsvdWE5RzV6VnEvVkEzZkI0dWNpTUowWUZaRzhtVnlVUGJ0TGdI?=
 =?utf-8?B?ZXpmOWo1eDIwbHBJbVNYc05JWnVrSGp0UUVqcUNSMlNUNVBpQjlBS3VBVEta?=
 =?utf-8?B?V2J6S3c2NjB3SGdydTFSZEtlejBQa1BGVmZHczVlcUZzMytxRXJmU0tmT1Nr?=
 =?utf-8?B?bmUvblU2T2xlaDcydklWaHM0WEw1VGprZ0U3Q1hVaEI1MjEreE83NUNRSlVV?=
 =?utf-8?B?NlluR1ZhR3VPUWpXbEdkYXdCMXNsQzQ5QUpydVZrTUswZWdDOENBSWZaY1Y5?=
 =?utf-8?B?RUwwSVZPMTdDZWZmakRSNzExU1pQM1VFSTZ2TnNRRzhOcnVzVU9aeHNsMlB2?=
 =?utf-8?B?MTVTdzBUZ25RTnp2eE5PMUZmRDNwMXRhcTEvMWdaTmNFZHlVQzU1Vm1nMWla?=
 =?utf-8?B?TkhyUzVrZ2c1ZFdhNm9mRlJhL0NCU2dXbEQ3V2VyMXk4aWkvek1xQVRPSXJa?=
 =?utf-8?B?dlJjblhMdmxrTVRFck5TYVR6OTB5bmlmalFmOXduV1dycEF2V0pCQzRTMWg2?=
 =?utf-8?B?ZUtwNU92WWxZeDYzU2ZibHhuUnErRzUybGRadTVpdFNTZmtPYTIxMFRDbXlV?=
 =?utf-8?B?bW9GUVNnQk1WRW1DSDVtSm05WWNkLytSaWR4MVp0R3hKUEpzNEVGZHhJZW91?=
 =?utf-8?B?VXdGKzY0ZnF6N2RSL3N2ZWlYRmlsUTRaT2hROFAyZUtrRUlkUHdpWVBpMGk2?=
 =?utf-8?B?SDhsSVRJSUtWK05JZS9KQWxHbnZUcVVTdUdKM3VUMUhaNGhhTWxJbS9IZ0tI?=
 =?utf-8?B?Qm93dnBmclFJdkdRaVBnc0tWbDhxMlNHcGtmU0N4NWxWbG01NDFNb0RUVnYr?=
 =?utf-8?B?bHBTOGRhcW1nR2lSSHdsbzJKMUJrVjloNmNJNWlGMWxGRzVRVENSVG94Sjho?=
 =?utf-8?B?TUZuR1Z0ZmJEM3E3cW0wOUpwdjJJNFRsN1NoV0JSRUVSQ0NqNVN2YzczMGJ4?=
 =?utf-8?B?alpFZ1ZkSk5rNllKSkFkcTNBSng4ZmpmRTBqQ09OTXA5d1lOTUkwWmJZNEJ2?=
 =?utf-8?B?dTQrNDdFeGhLVmFNWlAwaklVbFdvc0VpTVA0dEVMeDNianNleXhBK1FlNkMr?=
 =?utf-8?B?N0lONWpPb1YyalU2ZisvSlNabnExNldGaytTUWdXZmJMbDV2a0NYZ1FFdWFm?=
 =?utf-8?B?MEtpUWgrdFFsblNEejVmWml4Q29SNG0rVFhOQTRCNzZJVWtDZHc1enBwdG9C?=
 =?utf-8?B?bjBjaDZxa0V4cGZDMXdtNFlzT1VHN01wR1BQRUtlVGhRdDF2OGVRRm50N1pt?=
 =?utf-8?B?VWs1NlJPWkZYMnI2M2dwbFdHRXFDby84dXRaUmZXY0NHcnUxZm9OL3lHb25y?=
 =?utf-8?B?cmwzWUJSeVFzeGZyUVBOdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1yRzZ2aTF4N1JBeWhEajY0VG1aSFJUZExjSUVyekNOeWdoaDluckVDbHZS?=
 =?utf-8?B?dnNRNHVaTUEzeXMxR3Z5TVhHNTluRGtEVFhick5BeTFwUWN3K01jbTF1RFd6?=
 =?utf-8?B?eGJlR3JEUmJPSGRBTHBjUkpQOGpBN3NNSEwxUDc1L29SSUNmamU4K1dncXpq?=
 =?utf-8?B?VFBkVjVOV1YvZUxueWZpaGZ5WUovdE1lQi9kQTFoWmxhWllyQUxXbzZmWEVw?=
 =?utf-8?B?ZHByeC94ak1FeXQ3dHpjb3RnZHlCa05tZmxpSW9IS3pRTmFkSWpUTExuaFBR?=
 =?utf-8?B?KzRkR3Iwd1BuanNYei9DWEFzd0UvcmFsZkFiQkVqcDI4bDY5b3o4cERNaUtN?=
 =?utf-8?B?azNJRUE2V0YvTkZ0eXNCck9QR3hqNnZaSStuSitHRnUxRjJneHJiUkVNV3BH?=
 =?utf-8?B?SnhxRlY0UE5pNFkzMVJXZlZWQk90OFFicnFRdDBGbWlBQzA1ZXFqb2dkY2dO?=
 =?utf-8?B?Vk9vWWlxQk9UQ3pMR1FkNnBjR2V3T1BHdXI5bFhSWGptL0ZrSURPOXNFRjJz?=
 =?utf-8?B?Z0ZmSC9HQ3RGaCtHeTFKKy82NVZyS3Q4aDY3bVU5VGRiS2lFalJNODBNM1Mx?=
 =?utf-8?B?UU44bVcwd1FrTlhsOGtrRGtrT1Fxd2VheWZiWGlVVnU0bkt1b3RiWEQ2RFZQ?=
 =?utf-8?B?YlRzNzNTVTN3L2FaRk1Rb1hkblRYSUxJc3RXaUtWS2ZtbXJ3KzhOUFQ0bm5j?=
 =?utf-8?B?Tmh2TXR4bDlvbGkrQWM3YXBNUlhOMTlJbFlRMWMybm9NQTUrZDhFQ1EyN0Uz?=
 =?utf-8?B?aEJOZVBPOFdGSW1KUThQQWxKeXNtOGx4b0pLZnI4emt0L1BRRGQxVWFBUlFW?=
 =?utf-8?B?MzAxTWpQTm00dFd4ODE2eEdsTnA0Q21wTFFLd2pCMzA3VDZCMzVPcGFnRFJM?=
 =?utf-8?B?TnVMY1JNOWZNWjlEV1JoRThtRTZCK2FQQ3YxR1BwUUhCK3ZRUW5zRmZxY3Zr?=
 =?utf-8?B?Vk83Unc0eXFZcThkNUhUZFYzUDFkQ3VXZTc2VUJkY2dCTjFKZFpkY3dJakxI?=
 =?utf-8?B?UGZOYjA5WklyVCtGYit3TjRhSzFBUVN0bDZ4Y0pqbUVuTjJTbjI0OEV5dmM4?=
 =?utf-8?B?RlZnS29nMldhR3lwcWZ2UFQ1dENQNkRjaUlPdFFRUlcvVlRRbUJSaXFqK1Jk?=
 =?utf-8?B?MElYcHpIRGU3bjB0MGQzd0lFckkvR1RtOXBpb1hBWHpyVWg4S3FQcTJubG9W?=
 =?utf-8?B?blFKV0doRXlVQUtmOHZUaUNqQmZTOVNNcDNta05KNzdNQzZZbHFQTzZBRlo2?=
 =?utf-8?B?bDYvT2MreityOHZhNHpsd0ZZcU5wV3hsejQyZFlTS1hSN1ZaQ05lVE15alNB?=
 =?utf-8?B?VThPTWoxdDZCOEhlTnoyaGdFOGIzMzNnT3VwRjE1c1U1MjZkTGlJcFNQQ3lh?=
 =?utf-8?B?ZUhMbENZSDFSTjFUTW4xZXBMUU1RRkc3eEVMY3paVzBrWThGM1dzNlNaenpO?=
 =?utf-8?B?YUttdnk2Y05FT3J3UGpFZjZIVXVGT3NhdXpFWkRSVnJoMGJNUFdiTW9NUzlr?=
 =?utf-8?B?S3BkQklMb1AzbWNGQ1NNQTRtNG0xNUpTL0FPUFNSMjZURm12WkFrQlVHS2RB?=
 =?utf-8?B?MS9oYXA3WVYyMjh6Mk9JZFNpaVNVenhiU1VYbVpQc3JkSUIwaVpmM1hUelNL?=
 =?utf-8?B?U2ppUHREMW9ISjh1WVJQbFZXM0ZHZzJnWllBZnVxeEtoTGVjdmZITVR5WlhP?=
 =?utf-8?B?WkVFTHBrUFhyQnIrbmZteW1xcEZzMzc4VkUzalhlSmxiSkkxNENaNVRQMEZB?=
 =?utf-8?B?M3YyeUROWG8wcnJMNGp5UVFNcWxXREZoR0pJem5UTW0vS09tN0phMkxlRmxU?=
 =?utf-8?B?QUc0eHBseGM4aFFidE1JTGRWc0ZVQ29ZcDZ0a0hYdE5la29aZkkrZnBIQTlt?=
 =?utf-8?B?NUJLREFXdnhWTVRxS0x5K3pXUjlJR2RKSmNNK21UdzNJblpNbWFaMk9pVkxI?=
 =?utf-8?B?MVB0SmVUVHI1QkNrbDQ2TlpkdzcxVDB5N0tBK3JQS3FvTmtCa2R6MFl6THJa?=
 =?utf-8?B?L1F2TGdoTWJubEVsZ1hIaThCK2w4cWVHdlhvelBUU3hGM1ZEQkhhRHB4dHA3?=
 =?utf-8?B?L0hDMmVFZjJiaVoyOWtwWi9rM1lzck42TEg3VW9SdXNvc0lRU3I0cmtGUlZz?=
 =?utf-8?B?WGtQK3hFZWtoaGFGNmhQL3lCN25DM2ZrZmNTNU9LLzVhMnFiRFJMSlVZOFdK?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: sagemcom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87211d97-2abe-4bb4-69e2-08dd6af15610
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:31:32.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f9ffeb1d-70f1-4c2c-b7e6-d080242df8d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec9YJDUtsJOCqrBrKeGOZhmgKC0J7wYiPfiInrJO+mRE0AXqxsUePSacEVHJAOWgFdtOvYA2C9rfYXRv7JGV4redFWTWu3sddmtgxDywOAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2794
X-Proofpoint-GUID: BGayr_giVbOWSQzkKwtO5oV75oy-jCyz
X-Proofpoint-ORIG-GUID: BGayr_giVbOWSQzkKwtO5oV75oy-jCyz
X-Authority-Analysis: v=2.4 cv=fqncZE4f c=1 sm=1 tr=0 ts=67e188e7 cx=c_pps
 a=87MScklb5Sp+vdADSI+m6w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=cWJNfkV6-HgA:10 a=HbzeB9StAAAA:8
 a=Yh41P-WkAAAA:8 a=H9z3S6-JB1zLXO_UvNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=i9oqPCtDvve8OcjLCTCP:22 a=t-YQpmI8WX82GxrYqon6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=s1024; bh=e4clPsRk6Diz+DNRS
 +C74aCoLNqdmLOEdD9s3OnoXz0=; b=Mcuy1eVP5thu4+oh3XcjOOQVRUwKhbtkd
 TpEPhUOpuXIPyBf8CbH75e6R9A4qkqVpNumhqRrVT0NgIaqgr43oeZkfz2B+Okwz
 C6yo80UqbiBuIssA37Ue5A5OMcXlYYf6CmjkwTboBRLhoR2ydy7ZIj7Gf6IzGAtd
 kHh6EUwPdZnFaR3C+wZGNtvheFUKKPaxLpDFRY79CgTrz/ZoJ8C3/SSTijiqEgpF
 MMjXLXRHT6+zK7U526BsCAwat5Tm2VIICP13ojLlV/4NRIdag6sBcMBOJ+7GV09k
 +Ub4tNuQBlspaYFo49Gy5mSWTzuw+ZnqZXp+7gdAgB6B+y417YGtA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom365.onmicrosoft.com; s=selector1-sagemcom365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsoKkoiUYKMxNaHN9cdvEvJTvPVGIOLvQ6TIpl7R9HQ=;
 b=InJSotEKyVX+uz5c6X6mW0AO/5bFuj/D4xBmAMbduYtEsJzTh6UL2gWSAwOWpFBFYm6V5hGhKQUr7Dde8t5tMNXw678zj2RYTYkIvATFjvFT5ZIuAIXSQKukTyXfISkhvrtnUC6HOuyMBfUatRw3M+R+68VBD/g+x8tijUdtfsw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sagemcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=sagemcom.com
 header.i=@sagemcom.com header.a=rsa-sha256 header.s=s1024 header.b=Mcuy1eVP; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=sagemcom365.onmicrosoft.com
 header.i=@sagemcom365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-sagemcom365-onmicrosoft-com header.b=InJSotEK
Subject: [Buildroot] [PATCH] package/python-fastapi: fix cpe id vendor
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
From: Gilles Bardoux via buildroot <buildroot@buildroot.org>
Reply-To: gilles.bardoux@sagemcom.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGFja2FnZS9weXRob24tZmFzdGFwaTogZml4IGNwZSBpZCB2ZW5kb3IKCmZhc3RhcGlfcHJvamVj
dCBpcyBkZXByZWNhdGVkLCB0aWFuZ29sbyBpcyB0aGUgY3VycmVudCBjcGUgaWQgdmVuZG9yIGZv
ciAKcHl0aG9uLWZhc3RhcGkKClNpZ25lZC1vZmYtYnk6IEdpbGxlcyBCYXJkb3V4IDxnaWxsZXMu
YmFyZG91eEBzYWdlbWNvbS5jb20+Ci0tLQogwqBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhv
bi1mYXN0YXBpLm1rIHwgMiArLQogwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1m
YXN0YXBpLm1rIApiL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsKaW5k
ZXggMDhmZTU2MjNjYi4uMjY2MmYzZGRhZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tZmFz
dGFwaS9weXRob24tZmFzdGFwaS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhv
bi1mYXN0YXBpLm1rCkBAIC0xMCw3ICsxMCw3IEBAIFBZVEhPTl9GQVNUQVBJX1NJVEUgPSAKaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2EyL2IyLzVhNWRjNGFmZmRiNgog
wqBQWVRIT05fRkFTVEFQSV9TRVRVUF9UWVBFID0gcGVwNTE3CiDCoFBZVEhPTl9GQVNUQVBJX0xJ
Q0VOU0UgPSBNSVQKIMKgUFlUSE9OX0ZBU1RBUElfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLVBZ
VEhPTl9GQVNUQVBJX0NQRV9JRF9WRU5ET1IgPSBmYXN0YXBpX3Byb2plY3QKK1BZVEhPTl9GQVNU
QVBJX0NQRV9JRF9WRU5ET1IgPSB0aWFuZ29sbwogwqBQWVRIT05fRkFTVEFQSV9DUEVfSURfUFJP
RFVDVCA9IGZhc3RhcGkKIMKgUFlUSE9OX0ZBU1RBUElfREVQRU5ERU5DSUVTID0gaG9zdC1weXRo
b24tcGRtLWJhY2tlbmQKCi0tIAoyLjM5LjUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNlIGNvdXJyaWVsIGV0
IGxlcyBkb2N1bWVudHMgcXVpIGx1aSBzb250IGpvaW50cyBzb250LCBzYXVmIG1lbnRpb24gY29u
dHJhaXJlLCBwcsOpc3Vtw6lzIGRlIG5hdHVyZSBjb25maWRlbnRpZWxsZSBldCBkZXN0aW7DqWVz
IMOgIGwndXNhZ2UgZXhjbHVzaWYgZHUgb3UgZGVzIGRlc3RpbmF0YWlyZShzKSBtZW50aW9ubsOp
KHMpLiBTaSB2b3VzIG4nw6p0ZXMgcGFzIGxlIG91IGxlcyBkZXN0aW5hdGFpcmUocyksIHZvdXMg
w6p0ZXMgaW5mb3Jtw6koZSkgcXVlIHRvdXRlIGRpdnVsZ2F0aW9uLCByZXByb2R1Y3Rpb24sIGRp
c3RyaWJ1dGlvbiwgdG91dGUgYXV0cmUgZGlmZnVzaW9uIG91IHV0aWxpc2F0aW9uIGRlIGNldHRl
IGNvbW11bmljYXRpb24gb3UgZGUgdG91dCBvdSBwYXJ0aWUgZGUgY2VzIGluZm9ybWF0aW9ucyBl
c3Qgc3RyaWN0ZW1lbnQgaW50ZXJkaXRlLCBzYXVmIGFjY29yZCBwcsOpYWxhYmxlIGRlIGzigJll
eHDDqWRpdGV1ci4gU2kgY2UgbWVzc2FnZSB2b3VzIGEgw6l0w6kgdHJhbnNtaXMgcGFyIGVycmV1
ciwgbWVyY2kgZOKAmWltbcOpZGlhdGVtZW50IGVuIGluZm9ybWVyIGwnZXhww6lkaXRldXIgZXQg
c3VwcHJpbWVyIGRlIHZvdHJlIHN5c3TDqG1lIGluZm9ybWF0aXF1ZSBjZSBjb3VycmllbCBhaW5z
aSBxdWUgdG91cyBsZXMgZG9jdW1lbnRzIHF1aSB5IHNvbnQgYXR0YWNow6lzLiBFbiB2b3VzIHJl
bWVyY2lhbnQgZGUgdm90cmUgY29vcMOpcmF0aW9uLgoKVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFj
aGVkIGRvY3VtZW50cyBhcmUsIHVubGVzcyBvdGhlcndpc2Ugc3RhdGVkLCBwcmVzdW1lZCB0byBi
ZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgZXhjbHVzaXZlIHVzZSBvZiB0aGUg
cmVjaXBpZW50KHMpIG1lbnRpb25lZC4gSWYgeW91IGFyZSBub3QgdGhlIHJlY2lwaWVudChzKSwg
eW91IGFyZSBpbmZvcm1lZCB0aGF0IGFueSBkaXNjbG9zdXJlLCByZXByb2R1Y3Rpb24sIGRpc3Ry
aWJ1dGlvbiwgYW55IG90aGVyIGRpc3NlbWluYXRpb24gb3IgdXNlIG9mIHRoaXMgY29tbXVuaWNh
dGlvbiBvciBhbGwgb3IgcGFydCBvZiB0aGlzIGluZm9ybWF0aW9uIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQsIHVubGVzcyBhZ3JlZWQgYmVmb3JlaGFuZCBieSB0aGUgc2VuZGVyLiBJZiB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIGltbWVkaWF0ZWx5IGFkdmlz
ZSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBlLW1haWwgYW5kIGFsbCB0aGUgYXR0YWNoZWQg
ZG9jdW1lbnRzIGZyb20geW91ciBjb21wdXRlciBzeXN0ZW0uIFRoYW5raW5nIHlvdSBmb3IgeW91
ciBjb29wZXJhdGlvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
