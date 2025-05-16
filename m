Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D39C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E7940C35;
	Fri, 16 May 2025 10:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6EzAFbEQb2u; Fri, 16 May 2025 10:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA6440C90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA6440C90;
	Fri, 16 May 2025 10:47:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5C821AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C1C940AC1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wd1Xzj8tlfrW for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:47:45 +0000 (UTC)
X-Greylist: delayed 1878 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 May 2025 10:47:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AB3B40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB3B40190
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.183.28.205;
 helo=mx08-0035d101.pphosted.com; envelope-from=gilles.bardoux@sagemcom.com;
 receiver=<UNKNOWN> 
Received: from mx08-0035d101.pphosted.com (mx08-0035d101.pphosted.com
 [185.183.28.205])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB3B40190
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:47:44 +0000 (UTC)
Received: from pps.filterd (m0166232.ppops.net [127.0.0.1])
 by mx08-0035d101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4dPQF007229
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:16:24 +0200
Received: from pr0p264cu014.outbound.protection.outlook.com
 (mail-francecentralazlp17012051.outbound.protection.outlook.com
 [40.93.76.51])
 by mx08-0035d101.pphosted.com (PPS) with ESMTPS id 46n9rhgyv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:16:24 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrxfJPFyjna6JxoF3U0Az919TYTFKD4FIn7hR+9YIYNt6L67g4qQF2gBqyY7mo4vzbPHOVfPgySYgtOUhkNi9Y+DKix9HEBzs1Dsa7b2LXAkjtVBU64urArCJLh6qsYm2S7HKHEWtZgH7ZHUSYeen5qhRqxpbiGY/vD8EwtsUYqCges7PF06xC8dMQDwPkRlOI1wPvp73c5qB3wA1Dq+E8K1nbRlxzXDQ1NXLGgTE37WAFclEKji3vValuQZjuf3KLMjt3KjgL3kmyfb7VnaZ4Ppk5j+eEVe6wcV5wEKYmYYkqRzemF/EcnUIACauzcaHnhjMdmI7mCs7tobF329kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY0rEAT2uQWRJitRdgYr7b4VtGF7SvhdAXl2Dk/8vnE=;
 b=HGmIWQesvze8KDEql1SkJ03MK+J8f0lQO500sdwFyaCzGp15q96GqFHiKj5sdMq/U508VLzOjKBbvl7xDxA6MChMxUAQaGmiicjqmk3+LVvNPxDrxKzy8S1gR8TlwXKeH/s9QBE9Pi/145WovfJJRaQGzJOqcceiaHjTEaoeA8ctCjyBouU4DLdnUwOt9GkMLZ8x8lEZERyhOpZYnOUVmLn3aFzmR6dQwOMHGr/zTw++cAzmQFjnlUrpyc+t5YpipFzW6Qn2vRFZfgOlo+d92Xq1LCeO2IY8bbOmlbXimwNCXFvWP698IJlIn5dxczhcyC7mYrwORtq9jIjffI7Z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sagemcom.com; dmarc=pass action=none header.from=sagemcom.com;
 dkim=pass header.d=sagemcom.com; arc=none
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9)
 by PR1P264MB3727.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 10:16:23 +0000
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1]) by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 10:16:23 +0000
Message-ID: <c566e9c8-e38c-4604-aad1-0b76f45fce98@sagemcom.com>
Date: Fri, 16 May 2025 12:16:22 +0200
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
X-ClientProxiedBy: PAZP264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::23) To PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3183:EE_|PR1P264MB3727:EE_
X-MS-Office365-Filtering-Correlation-Id: f5172cf2-30c4-49df-c78d-08dd9462b593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW8vT3FUcEcxT2hKOHoxTW83R1RCWVdHQVVPU21kNjF1MExORCtrZ0pGcGpq?=
 =?utf-8?B?YTZReEFMOVRYSUtsVytnM3Y1TlBraEVwbjV3aUVYb3NEbm92YkV1bTVwYStE?=
 =?utf-8?B?MktJRmVRRGc3OXhiYTBJbkxjdVg0VHcwU0ZId3Q1N1FJNTdseVJYb0g0QVFT?=
 =?utf-8?B?MVlJdHdhSVEzaEVQYS85eVNLRTBNbXhYWHFsVDNaekVpdzE4TG4zS0lvQ3Ur?=
 =?utf-8?B?YUZJTGJtTjN5MzB6UE56cHA2VGMySUF5SXE5aUpOdFA2ZXE4YTlrOVA0dlVh?=
 =?utf-8?B?aEhLaXNYK2pTNnFVbkVGYmlLQUFCZ2tGcFlpSHh0enhXOXZCWnludXZSdUtO?=
 =?utf-8?B?T3YxMkFtVGpSb3Y5UVR6Q1oxOXRBaGZIZnU5Qy8wc0xLUTBPUURyS2p3Mmxx?=
 =?utf-8?B?bGxQQm5sbGJYV3c0dUpNRStWS0RVU0lDZ285cXJrR2M1MGZwdXdtaDdjTUlO?=
 =?utf-8?B?VVUzRE9yZlhtWmVPY1dxMkpUU0RZekxYajE4Y0I2M0pwMHE3S1plY2I3TDhG?=
 =?utf-8?B?V0Y1eXZwU2dqc1NTZUtvNnRjdCs2cEJLRkZ2SVFuMHhsSzJTbjRoNjRnVlQw?=
 =?utf-8?B?NktEeUZVZ2hwUWlPNzBoNDZxSzNnL3Fjb0FpcjBBWWtSK1NWT0NEdHIzV1dG?=
 =?utf-8?B?V2Yva3JJV1VxcGdIUVpkQ0xSYzZqNC91cmRQQzlqRXcxQlRLb1RkOWFTd2NK?=
 =?utf-8?B?L2tJYlUyRGsrSlV1RTY2REpSZWtXNXNBd1FNejRsY2lxakF5MHMvcEZMMmEr?=
 =?utf-8?B?c1UvN2kxTXMzREptMFJHdy9SRUZFdlJKckMyZ1R0REJRUGNDaFNpUDVzOXl5?=
 =?utf-8?B?VE4vTDlkTk1mbnVQdTVpWG93NjQ3Q2U2YTRTdGpvQVpWNWQydW1oZXRLUUxh?=
 =?utf-8?B?eWpnSXVrdTVqZkpyVm40WENLV0pqZnA3bktkN0w3czg3Und4RUVBWGZCWW53?=
 =?utf-8?B?aW0xSFJ4UHNRcGhsZk1jREFZazZpODZCc2EyZGdsOEVYUWtrUWh1RHRyQlBr?=
 =?utf-8?B?SXVCcnhHOGpZVFNOdzdzdEwybzlScUtTSVhTKzBUeFB5NGpmMXkvRDlFVGdv?=
 =?utf-8?B?M0V5MGhkYnRBY01IUUN6dkwrSjFlMDV6c3RxaFlyYjdpNzl6amdHRXFwaWxm?=
 =?utf-8?B?M0s0YnNua05aVzlVakRvSjJzNTdJZzRENjEzMENZWkQvRERXVThlSy94M1o2?=
 =?utf-8?B?dmNraWdsbjdUempEbGVyamhFWTBVYVJNUHQ2NCtEaGdPQ2NSelZkaXd1OEdP?=
 =?utf-8?B?WW1iR2lUdDhzWTczUjBud2N0ZUF0Z1QxSzV0cW9TaVEyUHRmRU1xRlZrdEcz?=
 =?utf-8?B?bG9PR010ekhpSlhKMjY3dlJidmZyZk9yZk9MR1JiWnlFWGFKbVlKUXdSU1Jh?=
 =?utf-8?B?NTlhVXBoTzkrZFBFVGZVVUM3bjNlR2dxMWlBTWVjYjc3dk1wY1FNMnVMdHMz?=
 =?utf-8?B?bjNITGVGMmVYM0JMNEZ1aXduSUhEMm9Pcm52bVZqM0JvU0Z5b2o2dFhxU2ps?=
 =?utf-8?B?eGQ4OFhKS3JxOTBBelhTNzhlQkVIN1NLaG5hN0IrOENkVXNsVUNRanpRT0RD?=
 =?utf-8?B?QmF6amErUnEzOEYwajNwSXN3ekJSaVRtYmtxRjNOK0s5cVlTc3czdmRQbG50?=
 =?utf-8?B?RWs2Yy9UQVdkblAyYk1QZFh0cnQyc0xJdVNCaWNBT3d4R3FTa0xZeXg3M2Jt?=
 =?utf-8?B?UXZmdUdjdnUyeE1IR1NIbG1aaVlZckhsS3YrU3ppSWliU1VNaEIwUGJqNVdN?=
 =?utf-8?B?N0tBWjlka1ExQmtaTG5VRnhhRHhXWk1uSGI0QzVQSitaQ3hFaTAwT0w1RFUy?=
 =?utf-8?B?OVU2LzU0bkFsZVlISkZVWk5LdlhlRCtwbEJwMWI5RjFmakg4WTJMMzdjT1FT?=
 =?utf-8?B?eVRWTFJUOHpuQW5pTTM1anZ2dEwvOUVqRmpQRE8zdWJKbmFGWUlMRWZOUXN0?=
 =?utf-8?Q?9IgjHLE2pws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtjc0puSTJGU29DSjFlaEJEMlpZL0FySFpKMGJwV0czT2p5R1pOWVhBWDdZ?=
 =?utf-8?B?amxTUDJqaGVEQ3pRWEtGbzV6cVZOMGJtY2Fpa1BmcWV1Wjg1d2swak5zcXlv?=
 =?utf-8?B?Z0tvR3RjWW9YM0d6WUpDSmFMM2NjTTVBVU1weTI0Z0p6dW5NbkJsSkNaQXVS?=
 =?utf-8?B?c0F0SUF6R2tsUzJFbHBRWU8vME1HaFpTSFdZcFhHSTNlcWQrUWE0SlBlWTBQ?=
 =?utf-8?B?SlgzNlJVL0ZrMzdBcytuSUtBUkJSOUN3WFRwK3FNTlJJZlc1VDAvaTdab1Ay?=
 =?utf-8?B?VHJYMXIydDc4N3FTUUpZdEZjRWtiazdER1BxZFd6SEkxckRCSkp2bGx5TWFQ?=
 =?utf-8?B?MnBwVUNiVytrbHh3RzNqaFE5aFNXWDVneDdrMWZhMmJrK0xtY1daNlo0ZG1R?=
 =?utf-8?B?clliQzV5OXhDb1Z6NEV4eWR1N3NuSmxlejBOMVpjVkgxbGFUci9jT0E1SVpX?=
 =?utf-8?B?Z3lQUktFQ2JKdnZ2ckVETXBkcG9ydERxdWs1cThSRnVxMllxaXUzclFuYllT?=
 =?utf-8?B?aHQ5SitwMWoxQWlmMzlOWlk0MlY0RmcyNnd2ZDU5d3VFRE5BYW1nVVJMMkxm?=
 =?utf-8?B?bE1mQVVXajdaWmdDUHc3dVpWMkRFbi81aVFhZ0sxQjdSVGtqMnRtTVpMVVFK?=
 =?utf-8?B?NHhMa0R3enJJam9wWVhLSzFyWGpxVXkrT0JDNURDK3lwMWdNMW9GRGh5OEpF?=
 =?utf-8?B?RmJIaWNsRzJEaE1XdEhIRFgzcVVCSUxnRDJrdEl4OE9BWTk0WVppcUJvM1hN?=
 =?utf-8?B?bG9tUDlnOGFiSllFN0tBeEdWSml5RlZWNEJCWnBySGp4azB3ZVNHYVBmQXpU?=
 =?utf-8?B?ZVBWV1ZraE1zOUtMbjBvWlBaQ2ZnZ1RWMUhLclJUQzlOKzcyOGNCT3lNNnkw?=
 =?utf-8?B?Qmh3UnVGVHNsL011SFd0TWZpbTNhSWhoWDV2bkt1ZGdWWU10UmlQQ00xV3k0?=
 =?utf-8?B?TWhua2oxWjRVaW1FaEtBTGFmelk3Y2pJVXFKNER1WXptYUtyZnFHY21DaWI3?=
 =?utf-8?B?b2pRZVJ1M3hVUE1VU1dWK3F3OUEwQ3pneCtYTkdxWGc4WGJ3TFZKd2hFSi9v?=
 =?utf-8?B?bWJDcnJqMVNhVXNYTzNLVWcvNHRjdjRnZTFaemxjeHBDR0ZDSWUxUHNXZEQv?=
 =?utf-8?B?eXo4RWNYVzNsQTFxSGVHd0NxVkVaYWRGL0IyaWJBQU9Sb0xkZVZLWnpkbzk2?=
 =?utf-8?B?UXJtTDFvQVVKQlZML1VvU1laMVhJaWk0QVZ3VE9aTW5VRmhNcmlUaVdMWWww?=
 =?utf-8?B?Zzk1UXJKbndnSzg1cGdDQldtR25jdU85Mi9FL2NMN3p2MkNleXR1a2Y4SFlH?=
 =?utf-8?B?R3hFcnNvcVh0clQzWU9BNDRYdkl2OFMwQlF0TFJyamFYdzZ1RUVjb0ZLSVBp?=
 =?utf-8?B?TGd1WVROelUvRCtqSFI0WHZCd0JUT1BUYXFVeGlrVDBDUzdiUkpERnA5MkJS?=
 =?utf-8?B?MGlMakFmM2g1cytocDFwek1XTnAxdXdZWktDdFBxandCUUlJTk84NVVQQStp?=
 =?utf-8?B?dUFscDZObVR2dUMvWDN6bDBURlVnRVB5S2htbXV0cWlxZEMxNG03WUh2eVlT?=
 =?utf-8?B?dnhxVC9xZEhJRGZ6dWl3VEY0ektQdnY2V0l5Z0FrVjQreHZQZ3lURjBPSVpO?=
 =?utf-8?B?RTRkbEZQTTY3MUphK1VCelhlTXF3M2tVTGNWcGxsUDlENzFibFB3WmN3SFFl?=
 =?utf-8?B?MTAwMUplcUJKaEZoMzVZNm1yR0U0WE5QWlNHeHpJU0lQeHJTSXF6Nzd2TERD?=
 =?utf-8?B?SnZBQUhmMEI2NDNkNENJSFEzdUgxemN3cS84dXZ0SzFMMk9UOVN6ZkduMytK?=
 =?utf-8?B?SjVNb0ZFV0xOZDlTNXhiRnBBMmtkQSttRyswemNkT1QxSmVLNW5DcHB3VUw3?=
 =?utf-8?B?R214ZUpKL0JaV2dFQmdGNnhWbUI5ZFhHT1VENFlMRmYybjlJNnVTOFVqUFVk?=
 =?utf-8?B?L0xxSDRqaUt2Z2FDWFJVQSs1amNaWm51WE80bWJOWmF0b2svVkdxQXZyeDBE?=
 =?utf-8?B?YkNCMW0wMFRzdzVKaXliaDRuZnNrNUJRTnJFY3hrUlhaUEcwZlZHTjJibWtS?=
 =?utf-8?B?ZUJEbWY3YjRYeUVzN3RDVFZSYk55S2RJWXEzU0UydU1yVzN6UThmWnY2UHM1?=
 =?utf-8?B?NGNGeFovWDhxR1AvSU4vS0pBYkNSVk52Zis4UmZCdkJIQUZaTG80T0hoMCtR?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: sagemcom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5172cf2-30c4-49df-c78d-08dd9462b593
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:16:23.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f9ffeb1d-70f1-4c2c-b7e6-d080242df8d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7qndmBdy6Tvl4PJ3qKrRJGiDiL8yfN+fuRQ/8HlOPwRrRG4EBQ3Jo5cqr6Bbfdb4Fw0wG7p7JLe/6bNkvD7HDZf1OOAI526ucQ0noBC4qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3727
X-Proofpoint-ORIG-GUID: ygHLD_UpP1lqyV-AdYTfy1aosadcX6I5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5NyBTYWx0ZWRfX1HGN1Wh5hkmk
 4KmNqbesxAOoVL/fEze4mS0qf/nBV5JgfbJR6CXCWFcezp42Pjb4Qz9nj6x50fwes/FmZiXZaOc
 TO41DhavZrqQKdpYJcCCSQ01jUVhfVLxTb67C6FEVRbivXQZnf0NLCrALF5lE0x+9r5wKQTy+XM
 R0pil7lVmMfqO4t99QO+jV5qS6g0Fcf1PrIbjWzD2V8B2McC5RJnJ9yk8RNXOORT5mG6iP/xrqv
 8YVXrVX7CB1x7CWndFXDAIdeA62ahOH8zfHJyBzXxZwPK77Y6wkTkDchvtOUA3Yj1E7TiPpZLKW
 vGEs6bGnxlo9J/1NrRfV5SlMDf/1Br4AXTWoRfDlHhpayJTWbFLIvM7Rz8L+4kNAIpKfhoHZuJh
 qb8VHbTE4pJ2PC8ql+39aesOe1cOd+QwX2sKL9l7cU0rKK1wQmQEU+CfX/Nw6EL32B235+34
X-Proofpoint-GUID: ygHLD_UpP1lqyV-AdYTfy1aosadcX6I5
X-Authority-Analysis: v=2.4 cv=AZWxH2XG c=1 sm=1 tr=0 ts=68271078 cx=c_pps
 a=ZUwsUiDMoAmSoHipjvv96w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=cWJNfkV6-HgA:10 a=P-IC7800AAAA:8 a=o68JtSYN79BQ6mhkWPwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=s1024; bh=I/it9vfJBQd5WFjPL
 ZobpdNJSBw5C1WSa+JX1S+11Gk=; b=FZnYFPuZSPBqYLWzLRTi83DeDZBNnu1GB
 uO/PaqpPWJyPaqRUeQptdFlif/8k2tTdHs2IeGfHdgaQCK1BlQU83dznFj1hsOxa
 V1hEiEzBYmi1NRkAKtLa7o6Gb6l950b3/kA1xhX3zUg+xL50XBzXe3Gu07v3n/ff
 tAx1+btdCIjEqv3iTZIvgUuvxzomafZKhWACt4DzKiFaLvPm6HZAV7zJ/bjB9Ukn
 5bvfd4BmMftdJYSHnTp515AH4pYBos0PjhLXKwbNDr4WpR3pmbS397D+AvkLJoAK
 JaiLiS3iJ5KWSVyBKOdy8gaR0kowsRueouK4FY84cwAK0gcTOAagg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom365.onmicrosoft.com; s=selector1-sagemcom365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pY0rEAT2uQWRJitRdgYr7b4VtGF7SvhdAXl2Dk/8vnE=;
 b=1FMpwjWpXa5lGvfKTN9DN4al+OgMB1cBlkrXBqgDfHOf+WQAa4q+AC7p7wzZBIpMwiOxQsrOJqBFsqH8j/I6o5a0L88NnRygAXTzKHLiY612c+rUW8ZEbxraw5Np7NlxTJhP0CJipaL1Vm8YjwoU3wqrb/A6uBbYrYbdMyy6pQM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sagemcom.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=sagemcom.com
 header.i=@sagemcom.com header.a=rsa-sha256 header.s=s1024 header.b=FZnYFPuZ; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=sagemcom365.onmicrosoft.com
 header.i=@sagemcom365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-sagemcom365-onmicrosoft-com header.b=1FMpwjWp
Subject: [Buildroot] [branch/2025.02.x] backport package/mpv: switch to
 meson from waf
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

SGVsbG8sCgpDb3VsZCB5b3UgcGxlYXNlIGJhY2twb3J0ICI4ZjY5OTc0YzIwZmJjN2RjNjQyYmU2
MmEwZWYzZmIyOTQxZjViYjM1OiAKcGFja2FnZS9tcHY6IHN3aXRjaCB0byBtZXNvbiBmcm9tIHdh
ZiIgdG8gdGhlIGJyYW5jaCAyMDI1LjAyLng/IFdpdGggCnRoaXMgY29tbWl0LCB0aGUgYnVpbGQg
b2YgbXB2IGZhaWxzIG9uIGJyYW5jaCAyMDI1LjAyLnguCgpjb21taXQgOGY2OTk3NGMyMGZiYzdk
YzY0MmJlNjJhMGVmM2ZiMjk0MWY1YmIzNQpBdXRob3I6IFRob21hcyBCb25uZWZpbGxlIDx0aG9t
YXMuYm9ubmVmaWxsZUBib290bGluLmNvbT4KRGF0ZTrCoMKgIFNhdCBBcHIgMTkgMTc6NTY6MDcg
MjAyNSArMDIwMAoKIMKgwqDCoCBwYWNrYWdlL21wdjogc3dpdGNoIHRvIG1lc29uIGZyb20gd2Fm
CgpUaGFua3MKCkdpbGxlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ2UgY291cnJpZWwgZXQgbGVzIGRvY3Vt
ZW50cyBxdWkgbHVpIHNvbnQgam9pbnRzIHNvbnQsIHNhdWYgbWVudGlvbiBjb250cmFpcmUsIHBy
w6lzdW3DqXMgZGUgbmF0dXJlIGNvbmZpZGVudGllbGxlIGV0IGRlc3RpbsOpZXMgw6AgbCd1c2Fn
ZSBleGNsdXNpZiBkdSBvdSBkZXMgZGVzdGluYXRhaXJlKHMpIG1lbnRpb25uw6kocykuIFNpIHZv
dXMgbifDqnRlcyBwYXMgbGUgb3UgbGVzIGRlc3RpbmF0YWlyZShzKSwgdm91cyDDqnRlcyBpbmZv
cm3DqShlKSBxdWUgdG91dGUgZGl2dWxnYXRpb24sIHJlcHJvZHVjdGlvbiwgZGlzdHJpYnV0aW9u
LCB0b3V0ZSBhdXRyZSBkaWZmdXNpb24gb3UgdXRpbGlzYXRpb24gZGUgY2V0dGUgY29tbXVuaWNh
dGlvbiBvdSBkZSB0b3V0IG91IHBhcnRpZSBkZSBjZXMgaW5mb3JtYXRpb25zIGVzdCBzdHJpY3Rl
bWVudCBpbnRlcmRpdGUsIHNhdWYgYWNjb3JkIHByw6lhbGFibGUgZGUgbOKAmWV4cMOpZGl0ZXVy
LiBTaSBjZSBtZXNzYWdlIHZvdXMgYSDDqXTDqSB0cmFuc21pcyBwYXIgZXJyZXVyLCBtZXJjaSBk
4oCZaW1tw6lkaWF0ZW1lbnQgZW4gaW5mb3JtZXIgbCdleHDDqWRpdGV1ciBldCBzdXBwcmltZXIg
ZGUgdm90cmUgc3lzdMOobWUgaW5mb3JtYXRpcXVlIGNlIGNvdXJyaWVsIGFpbnNpIHF1ZSB0b3Vz
IGxlcyBkb2N1bWVudHMgcXVpIHkgc29udCBhdHRhY2jDqXMuIEVuIHZvdXMgcmVtZXJjaWFudCBk
ZSB2b3RyZSBjb29ww6lyYXRpb24uCgpUaGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNoZWQgZG9jdW1l
bnRzIGFyZSwgdW5sZXNzIG90aGVyd2lzZSBzdGF0ZWQsIHByZXN1bWVkIHRvIGJlIGNvbmZpZGVu
dGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBleGNsdXNpdmUgdXNlIG9mIHRoZSByZWNpcGllbnQo
cykgbWVudGlvbmVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgcmVjaXBpZW50KHMpLCB5b3UgYXJlIGlu
Zm9ybWVkIHRoYXQgYW55IGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgZGlzdHJpYnV0aW9uLCBh
bnkgb3RoZXIgZGlzc2VtaW5hdGlvbiBvciB1c2Ugb2YgdGhpcyBjb21tdW5pY2F0aW9uIG9yIGFs
bCBvciBwYXJ0IG9mIHRoaXMgaW5mb3JtYXRpb24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZCwgdW5s
ZXNzIGFncmVlZCBiZWZvcmVoYW5kIGJ5IHRoZSBzZW5kZXIuIElmIHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2UgaW1tZWRpYXRlbHkgYWR2aXNlIHRoZSBzZW5k
ZXIgYW5kIGRlbGV0ZSB0aGlzIGUtbWFpbCBhbmQgYWxsIHRoZSBhdHRhY2hlZCBkb2N1bWVudHMg
ZnJvbSB5b3VyIGNvbXB1dGVyIHN5c3RlbS4gVGhhbmtpbmcgeW91IGZvciB5b3VyIGNvb3BlcmF0
aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
