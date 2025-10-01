Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0EBCCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905B083C8C;
	Wed,  1 Oct 2025 14:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o79Z6sqoXfZ1; Wed,  1 Oct 2025 14:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80FA83CAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80FA83CAA;
	Wed,  1 Oct 2025 14:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74893E26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B4F66126C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1xmtiUUZ3WJ for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d120::;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=ohitsdylan@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFCE561241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFCE561241
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d120::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFCE561241
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pauXFr68vP3rlzDXEzijWQiNJ9m9s1LyXj1Se0L6gHWyqoHsgC7shdmUYaQ2zjwXgvEIJ5+NZMpARgUkMSWyyofqXv47GP+AxYMS4sbIlrjGQn00DzZ/OnL7Rq/Y/ky/+AL/COclCWhM8h0Dd8YA8h7LQDqvhO9+T3t/gbrj3lruQ/V+O/v3Fgagi5FmSJYmvbKqrugrpI2ofr4oaFCQlzx2cB61+bT+kxptqNlS8Uv1CczA+3JZTcMTnhm/jyAt5rjK0k++Js2f9EaPn082HskmSnluIAe5PZ8O1LZSiRZ2SpUzzaQMW0L/C7fx74kujDAdMkx4Zacw+KBP75NDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ53ODfBT8NFH63lSIupz1fnjFGJYPwxEPyOYO5Ve0A=;
 b=i+/o4M/fsryFiUHhODYJP7lw4a7wQeySnu7ziiIRN1M+DTHQwaYX0nyLZYMIPE81NJKqgHyuO/PeOLh8evn+J/6tVolMIifYePt1mGjl0D88a7pkBtqaiRqCVveBAEi9NUL8+iZw4/O+w9UDJrX3aplKO8MsWQfvUw9uDk8he5HnOtkgI8M9hGp+NKt4kBXBzFvZ4HJb26aae8QdO+9IwFJyObv/qyqRw0iMG082053doHBgf08UXjmb/KCEU/9I+mAndOLn4vT3qz1RHa6Dh1sIpUDRPUuIPOQWaSw+l9JrHssJNWjK+aiigt0rbgZGPCT7D1auwld7xDJbscFn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH3PPFC54E34861.namprd19.prod.outlook.com
 (2603:10b6:518:1::c4d) by MW4PR19MB7005.namprd19.prod.outlook.com
 (2603:10b6:303:224::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 14:45:39 +0000
Received: from PH3PPFC54E34861.namprd19.prod.outlook.com
 ([fe80::81d8:307c:9747:d61c]) by PH3PPFC54E34861.namprd19.prod.outlook.com
 ([fe80::81d8:307c:9747:d61c%7]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 14:45:39 +0000
Message-ID: <PH3PPFC54E34861A59B7681B6056310CB5ACBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
Date: Wed, 1 Oct 2025 10:45:40 -0400
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <36eaf2d2-2da7-f000-4851-c1129a701b13@heine.tech>
Content-Language: en-US
From: Dylan <ohitsdylan@outlook.com>
In-Reply-To: <36eaf2d2-2da7-f000-4851-c1129a701b13@heine.tech>
X-ClientProxiedBy: CH0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:610:b0::10) To PH3PPFC54E34861.namprd19.prod.outlook.com
 (2603:10b6:518:1::c4d)
X-Microsoft-Original-Message-ID: <fd9480e3-f242-4a98-9609-a245cfa7f633@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFC54E34861:EE_|MW4PR19MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f30f9bc-6547-4cf1-1f73-08de00f93058
X-MS-Exchange-SLBlob-MailProps: quCBMN2EvO+pPRgpcRKeMpPKDEKjvqeWjqTA9ivklEmk44CkN/tQ/EIrzwNT8X0JeyX2VLJh79FNqlJdHboIL5W5/bJDs1+EjfaSayCPNLyB+RO64V03D+lG5W3QWMhYiOUxzL2JwSFGinglThtacVZBTGZdLIAeKnGHZLJ2Dyw+TQpeKgm/zMuKrLNsf0GIBzuA9ovVcc8VnEDo1w/LJPwB/SLEeU8fWPp883Rxsby/AsEQHGHnKV5TO7LWK8pr0NTT45LsZIFt4g9GF0pAIpQG6aeGaouRFoAmGEEYZ+XJ/P/1OyhvuHZipLd2Ea+7qN9VSW0AO2AasCRtmOur7m9jn+Ob/sBYQRNT663TsHjN6bgH/ooBJtXya05oqtsmq34vBqohiYou+o139J5CYW+UDXq+83cqqYSef80ELVFqqqqkSBnYEyIoXIz32Jh41WopWWumffUGCdGc2/23MiJA4P9JQGdhrVA7ND/9TZY3udiOiNBakN1DQrPR5vV9nh477NJqa3tzdybpEhIdOaLRUyMRZuuR+nNV/a6PlS3MsaEO/nZBvd4guw4T1mpjQU3q1LoKeKF2/dl4RIR3yD+lClVa/jbrXN1mdprla+qVMhvMzZUdYCDvwJUVCvqa3/QO3U7n9gcty5PdpaGiYmkbB5dMxRw5bzlMkUIN8JBut0VbQJSm7cYHNZ4qJ/cvHOKqiMUjPkrjOq3Q4UBnLQ==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|23021999003|15080799012|5072599009|8060799015|6090799003|19110799012|13041999003|440099028|52005399003|40105399003|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFDRE9TVzNsUmU5MzNCMEdWWUlIYnBZRXJYV2c5dUdrZGdEMi9kdWN0c3Uv?=
 =?utf-8?B?cDBSREduNnNEOXkrQlRUNFJwWnh0NENPVVh2VFVhRDc0eWZPRWx5MjZVbHJw?=
 =?utf-8?B?Rnh3UCtzNlZwL2JTSTdnWEZmVXJhUlMyL2RJNUNLODFmWDRWK3ZKWW9pdzZ5?=
 =?utf-8?B?dGQ1OGwzYmh0eXhXTUc4TVl3UUVjVkQ2cWNhWUZpTE1iak1iZmIxTG1rTVlD?=
 =?utf-8?B?cXhzN282bU9KUDVsZllCZmhiYk01NGNGZWhYUGo2V091RHJDTDFObEo0dVVD?=
 =?utf-8?B?Vmo0TFlVVjIrVjJhc3JKWmhBQ3dQckR4U1k3cGNiajlPNU45cFNPN1NOS2dI?=
 =?utf-8?B?d2k4OVBBMUtCeng3QjIydmJRb29zOE1ZclBaa2pEUVNoRmY3Z0ZhdjdkRThq?=
 =?utf-8?B?c2w1UlM2cDEzSy9XamMwdGlUb3lHNmd2SDJGdFhVQ3ZsKzRTeHFxS01vWEFt?=
 =?utf-8?B?V0h6cnE5OUoveG5yMnpjSDV2OXIzTm1HSUhjVnJEeEJOQjNqODBRV1U3WjVZ?=
 =?utf-8?B?bk05MG5nNG93M2lGcFhZM3d6OHlLeFpoMDVCUDdGR0NBV1RoLy9YK2ZZbXBW?=
 =?utf-8?B?NThhOGxBbFAyTnJjc1ZWcExyYXczNGVNTTAzVExmeG5NWjBwdXpCRXRuaEFp?=
 =?utf-8?B?bEtCSURBc0RHTXBWbW9qTXYxSS9kM3FZOFVWMU5pYm1GQ0FDdm12RndLUXNp?=
 =?utf-8?B?TWtsWkp3NFd2c0lFcy9BN0JSM29DWE9kWWpxTmJjOG1weENqUTl1Y1NUNDg1?=
 =?utf-8?B?YzhSRHdWVGhYZ3oxVm84bE5VY0JVcWc2OEdUWFFyazl3S0NvN0hhbFZmV25Z?=
 =?utf-8?B?TVk4b09OdHpCRkh6VitvNHBjNzR5N1RBK0tUNXV2Y0pZOTJrOU9IMUJxaFlQ?=
 =?utf-8?B?a2srTTBORmIycUd6dTNhd2tWQVBTcmlsSURhRUpuVzExM1BIL1NLbTY0clpR?=
 =?utf-8?B?WEg5MmpVS254bThuN2ZQY0t3T08yazFSUE1STGRsUmhBYXhrVTlLVnRtL1pN?=
 =?utf-8?B?VVQrSTllQmQvdzRSYzhKaTZqbjJ3SWoyZmNtMkcwVEliNE5CY2RKM3hzeFc2?=
 =?utf-8?B?REJqdnR1UWtOVjN0TEFKblZ6bHpNVk1HY3p5V090MjRsM2JQS2lyYW4wMVlO?=
 =?utf-8?B?c0JwcGZJUGhrMS9KWlhkQ1Zrdk5hZ2NLbzhuUHA2VGJxVDh0cDVkOWI5ZXpz?=
 =?utf-8?B?UGFGdFBDVjdqZ2RWU3U4ZGoxclhDa0RBbzhmajJUY1lOYTZUK0RwellPNUxt?=
 =?utf-8?B?RVVMV1NRRzRzcUVYSU1CWHFBYTFZenpXdGNodHZsbGhvL0tBSVFPSlRQdEQ1?=
 =?utf-8?B?RWgyZEFjRUNUeE5acEU2MEhBWG05NnN6RWo3RWhJV3UyREtSbHlDaXkwQnBh?=
 =?utf-8?B?MHdxdktGOThHSVlIcVQ3cTZjM3gyb1B5OHlvaUVDcWNzS3BNejUxOE1qMFE2?=
 =?utf-8?B?ajBRaXFyc3Zod0ZLdTdLMk93MFBpS2tLeXNIR3pHcWtteDgwN3pvK0wwa1M5?=
 =?utf-8?B?TUtocnhIeEVIaFpXZGV2WUEzZkVQMkdOS3FZb3lJY0trcERlNUdXeDkvWXVu?=
 =?utf-8?B?SU9lQ2U4dEI1V0JjWjFrMEFucFpxckprQ2tKZHZYWis5T3k5VVpzRFJwR0E2?=
 =?utf-8?B?Rm9JQldWT1NCU2JoUURYUkJySDZXUTZibnJaeFc4S2gwT2lKWDV6Q09XT2pl?=
 =?utf-8?B?VkdkYVRYVy9EWG9nYmlBWWt3dTNwMVI3dXV5ZnBlWmxXT0hpdWlOL29nPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdNUENLRXg4VFdPc09FdzV5V3Rvd2FpaHF5WGY3MXF6cjZFOW15KzQrdzdv?=
 =?utf-8?B?bTVZZDA1dkVoTkZvQ1ZFckZDQkFLRXRJcnhiMDM5OFF1b01iZUo3bUc1bENy?=
 =?utf-8?B?b3I0dXpVY2p2c3hYaHNlYjkxUUFHZ1N3VERHazZlRFR0enU0cDVrNkxNOTJu?=
 =?utf-8?B?WXBYQUxiMVlqcjZxTk9VU3RIUm9TSmQxOEVSZkk3M2h3d2dwQ3lNcktYbkVU?=
 =?utf-8?B?T2hxcUl2aFhLTzdYM05qK2hpdDVLbU02RVZudS9YcXlJS2xCL2NrNmhDcC9V?=
 =?utf-8?B?K05NRzVxb1FLL01jblBqV0ZQbTR5b3hheENkM3YxT2RuRUd5Q3ZwZEN6Ly93?=
 =?utf-8?B?VHZiYm8rRjVod3NkWktQWGJLZWtNSk8zakcvK0oxS21nYzJiQ0g0Z0ZnOFBF?=
 =?utf-8?B?Q2xYbEJ1YmltL2Nhb29hOHZCTWlNREhsV1YyR2ZYNVZZdHdpWENQNjJnTy9r?=
 =?utf-8?B?UnNXdW5YdFFHQUxVSWJQZXJVWUJYRlEzbE1SY1F2a2VuZzJvSEViT1hGdzNL?=
 =?utf-8?B?MUJBUkQ4WFgwTkJpSGFFUldEYmx2eW9QYVM4RTVVcGtRMEhXdGNTRHJhVm1R?=
 =?utf-8?B?VXBZcTY4aUxEcnN3dGI5bzMxNmJUcHFSTUZzMlNQWG9oSUFLT3owTC9kQVpZ?=
 =?utf-8?B?MFB3VVRVQXl5ZXhhc3M5NkZNWG5RTG5Cby8zTU5CWDNzQmdyN01JL0JMajhJ?=
 =?utf-8?B?dTVlRmlxY0k1WkJTSkxzMDJUbG0xcmdmSit3MEk5Vzg3clNPdHZ6WDBONzF3?=
 =?utf-8?B?L0NXVWNHdVRNWkE1SjMyTWJyRHRPSWliaHMyMXlOSEJ4eU1RV3JiS1RIMGlB?=
 =?utf-8?B?eld0WVhQeTlqdGhKbU9JdFpPZE44MlU1WHdXTEFiWVgrMFJFNHQxQ3pyMVl2?=
 =?utf-8?B?a1U3K2ZFclhEdXdCc05IZzNOMi92b3VlalV4N0YybFBkd2U2YzJtc1V3NjZQ?=
 =?utf-8?B?VGgrSGc0ajBpNVBaV0NUQ1pseHVWaUhxT0ttUjEwd2NYMnArckJIU2dUT1pl?=
 =?utf-8?B?SXg1cVFJNHlXM0NDeFc3UkIrSzV0MW5TYXE2aDlOaHdleDFmbkRhcGF1UFlF?=
 =?utf-8?B?ZjU0cGpBZ25Galc4WkxQbU9MeEUxKzNURE1KbExiR29CaVlhT2JUTUNiV1BW?=
 =?utf-8?B?RWJORXJWclVLK3NPUzlDSE11bThHVWd3QXF2VnJGNHIvRkNUbTJidDAvTHZB?=
 =?utf-8?B?QmhGSXhSTWo0MytZY2laOTFwL21lMDF0Q2lEVVZoQ2JwOUhwM20wK0gvVjN3?=
 =?utf-8?B?bU00ZmpsUEs0K3BCQmFuaVBoS2ZvU2hiUTJBNUlxQ2RXbDdBVnhPNW5xSWxC?=
 =?utf-8?B?dFZpQjlBMlJ5dGxxTXZhMkdOMGxmNXVMN010aGRjaFYzMGlBa3dHTWlZN09z?=
 =?utf-8?B?dTNBYllDSXNFZEpvMDY1Zjcwa2hvNjhSYjY3eURpTE8yQ0loL3RXWW9Rd0dl?=
 =?utf-8?B?WjJXSWlDcXJXc1cvYzdJTVFiZnVGczBkZmowb295d2M4b1BVZ0Z5czZzcHpD?=
 =?utf-8?B?NkYwK0ZBMUdDRlJlOGo4TnBROE1EeE1RUm9PRU5KVVV5OUMvUmV3VkwxdVdY?=
 =?utf-8?B?VkJWZG1BQ0ZKSjI1SUhDUU5iYXp5aXBHRVVnMW1kQVVhUENvSnIydWE0Tzh5?=
 =?utf-8?Q?Db2yTVXImclntixB7ayKL/dBEqJ1f4vREaXbyW5K2s2A=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f30f9bc-6547-4cf1-1f73-08de00f93058
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFC54E34861.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:45:39.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ53ODfBT8NFH63lSIupz1fnjFGJYPwxEPyOYO5Ve0A=;
 b=e/VxdarepEqWwqjVk4kmjmzbhkOVnR5j5LiUJQ8TODO2dikzLMMXotmZTsyXEMdj3cA3EkkUKG3WGsumpmSXo924+/jQEl8HFqTWCFARuPOj5PwtkOjkK5Xc/4p11Hs09sSQuN87ynkSKEEJvtOyp1lQhLLkYVb5gvmONRX4eH3CDD53df0tMBBIPOyvB5PAz1vlY8aGulDXvJBjgxkQr+p7XmoHbP8D8ZpSFNcM1H4BwAQDZM3E5BKmeE3FdzUg65cwSjuLU9CjPWwj4/XHjYYxeczZRj5Jn4+Y9a8wfMvGuT/vM+K1EtJSDUVJ4/uAe0LpY2jnTo9S9c/Eq3DCcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=e/Vxdare
Subject: Re: [Buildroot] Issue Applying Patches to Package
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
Cc: ohitsdylan@outlook.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKClRoYW5rIHlvdSBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlIQoKSSd2ZSByZW1v
dmVkIHRoZSBvdGhlciBmaWxlcyBmcm9tIG15IHBhdGNoIGRpcmVjdG9yeTsgdGhleSB3ZXJlIGxl
ZnRvdmVyIApmcm9tIHRyb3VibGVzaG9vdGluZy4KCkkgYWRqdXN0ZWQgdGhlIGxpbmUgaW4gbXkg
cGF0Y2ggZmlsZSB0byByZW1vdmUgdGhlIC5vcmlnIGZpbGUgZXh0ZW5zaW9uLCAKYnV0IGl0IHN0
aWxsIHRocm93cyB0aGUgc2FtZSBlcnJvcjoKCkFwcGx5aW5nIDAwMDEtcHNwbGFzaC1jb25maWcu
cGF0Y2ggdXNpbmcgcGF0Y2g6CmNhbid0IGZpbmQgZmlsZSB0byBwYXRjaCBhdCBpbnB1dCBsaW5l
IDMKUGVyaGFwcyB5b3UgdXNlZCB0aGUgd3JvbmcgLXAgb3IgLS1zdHJpcCBvcHRpb24/ClRoZSB0
ZXh0IGxlYWRpbmcgdXAgdG8gdGhpcyB3YXM6Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnwt
LS0gcHNwbGFzaC1jb25maWcuaMKgIMKgMjAyNS0wOS0wMyAxNTowMToyMS4yODI1MzE3NjYgLTA0
MDAKfCsrKyBwc3BsYXNoLWNvbmZpZy5owqAgwqAyMDI1LTA5LTAzIDE1OjEwOjE4LjQ0NTExNjA2
NiAtMDQwMAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpObyBmaWxlIHRvIHBhdGNoLsKgIFNr
aXBwaW5nIHBhdGNoLgoxIG91dCBvZiAxIGh1bmsgaWdub3JlZAoKQ291bGQgaXQgYmUgdGhlIHdh
eSB0aGF0IEkndmUgY3JlYXRlZCB0aGUgcGF0Y2g/IEkgaGFkIHRoZSBvcmlnaW5hbCBmaWxlIAoo
Lm9yaWcpIGFuZCBteSBtb2RpZmljYXRpb25zIGluIHRoZSBzYW1lIGZvbGRlciBhbmQgcmFuIHRo
ZSBkaWZmIGNvbW1hbmQgCmZyb20gdGhhdCBmb2xkZXIgdG8gZ2VuZXJhdGUgdGhlIHBhdGNoLgoK
VGhhbmsgeW91LApEeWxhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
