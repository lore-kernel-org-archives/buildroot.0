Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286D2C35FFF
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 11:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E2140699;
	Fri, 21 Mar 2025 11:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCRVs3dlKQrL; Fri, 21 Mar 2025 11:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DDB1406C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DDB1406C2;
	Fri, 21 Mar 2025 11:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E17661A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 11:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7D1B83F45
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 11:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86hbpbioGVMy for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 11:33:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.183.28.205;
 helo=mx08-0035d101.pphosted.com; envelope-from=gilles.bardoux@sagemcom.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64D2E8144E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D2E8144E
Received: from mx08-0035d101.pphosted.com (mx08-0035d101.pphosted.com
 [185.183.28.205])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64D2E8144E
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 11:33:24 +0000 (UTC)
Received: from pps.filterd (m0166232.ppops.net [127.0.0.1])
 by mx08-0035d101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KMKuYL025217
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 12:33:22 +0100
Received: from pr0p264cu014.outbound.protection.outlook.com
 (mail-francecentralazlp17012050.outbound.protection.outlook.com
 [40.93.76.50])
 by mx08-0035d101.pphosted.com (PPS) with ESMTPS id 45gu7e0dsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 12:33:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndsCrUSUIrw37lyEllh2DBfoABMVVlh4WtQgsTTR1Kf4bj99ykm70OunATV9q55Mo3KB49uJMEgATEj9MnUNLlTDGncCKxJRtG0k7xGmH4oe+G1lZCAl+S8KdCscEtPzBI+TM5nhnRyYBmdn3//8LRRBZPCcp6lMQ9b43cD9GKz5qLbC2dqQ5Vpgu17RIhrTR3+o9oi/NzIfaCZTgNma6SLEw7WUvSlfX3Ii/4iS34P8PTJ6IiPXuCsvRN+6Y+5aMp3YVW663kV9EHDnsKZ7g+2mEzAKNg4MmqFqvJQtEtK8mkB1RXMy2Qm/ydTwUNDEIeuJKpkdIARSjjnTmZWJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjNqzMCaEDWYFfeNuWBSrgZYF70iA4ymmZaT0Wdfg/o=;
 b=XsgbQt7zWbNFPI9uq8bXbqtA43Zzuko9+zuucrqb4+N3zDjAUIiG0LdeR/oZ9ht/gu3Wv052slwZmEUHIvd3DcJFQI65jXWfq21YQLwCAaRZTNh3SeOlUNlr1fNKUM5317/5evCqY+O/ROlOqBnafv3tH/tXRSG8moYLnPb5qnwu6b/duMjq3n5YJUkIqladVyirkSMpgKogr1YEC6jOIz7HJ3zDarJlWfjnelozrkYfqr87fTRI/EwTIGI0ZTQJYSAREAOCY3Kmr023GcBhQt1cNH/j4NztP5cLAAmzRv1A9bg/r9TxC0kU8MrysN6AWOrNXaH8uHaPfN+u2GIVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sagemcom.com; dmarc=pass action=none header.from=sagemcom.com;
 dkim=pass header.d=sagemcom.com; arc=none
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9)
 by PATP264MB5239.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 11:33:19 +0000
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1]) by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 11:33:19 +0000
Message-ID: <76dd8fca-f33f-4c74-a36c-d2f91e1d9102@sagemcom.com>
Date: Fri, 21 Mar 2025 12:33:18 +0100
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
X-ClientProxiedBy: PR3P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::28) To PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3183:EE_|PATP264MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0ed33b-995c-47ef-90c4-08dd686c2ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWRtUGtzZ2JYU0RKQWs4b0RlZHJUNjZVcG9jTXJoa05wV28xVU13Z095MDhp?=
 =?utf-8?B?RTV1M3lHTUk2bStycW5HbUpwVVByWWhqZG04dDc2Nk1OdmVNNllYdnJPa21F?=
 =?utf-8?B?OEJZQW9hdnlVcjloQlY2dDJYdDFiMjRVT3I1bm1JWGhwNjJSSEhFWXBCRnIr?=
 =?utf-8?B?NGJwWTNXU2FWNUxiQW1KcUdmU3RkUjRsTnd0TGZhZWRpT2h1RmFycnhGbTd2?=
 =?utf-8?B?cXZXaGwxVEdWdmRQcElYSVZRNmZ0RXdscXRBVEZDNDh5c3BvbDV0SmJQMkZU?=
 =?utf-8?B?SVg2QVJUZWk3OFRncjBjL3ZqVlBaQnRzWXBUU3VwbWFpUmJvWGR4RVY4UkVT?=
 =?utf-8?B?M2dzMW1CVmJaMFB0UTNCdHpvMW42MXdPS0RQYUdiYmQ1K3k4NVVLTGc4MFJZ?=
 =?utf-8?B?SUZBZ0I1SVFZOVhxR0lGWEVzbmY0czdMV24yVS9ZUFBSOE1GcnJVQ3Q5U1Mw?=
 =?utf-8?B?SmZ3aWtYTVBsK052Zm9mSDh6b0hIMjZYYldkcDNIVWtraHNlTWlubnpvZXNS?=
 =?utf-8?B?VHRmWnR6UEw1RDZwNDh2ZWljWTFrdmdxbHcwZDUwVm54OU94U255YW1UNUNM?=
 =?utf-8?B?bERYVE10RUczSEtDejJvSnBOZXJDOS9NcWZ5V2h6L00yelFJaEl3Q3lZMVdJ?=
 =?utf-8?B?R1pyTEpPVTBDS2I5aFlVUlZ2QzVtclE3NzdYQWhBZHZ6cW9TcDJhdnFIdUlu?=
 =?utf-8?B?UCsrdW5MSEg5WGRJVnVEb1F6ZFhuS1NRMkhSY3luN1dwM1FkUUFsSElPcXcy?=
 =?utf-8?B?SVlDL1Urd1prWTc3aTlnVTBhL29ZSTc2TE51elFLcENvZkNGUWovMXpidEQz?=
 =?utf-8?B?NkFhOGJOYitpQjFZUkkyV0JHSHpHUm9DMXdWRVcxZjlSZStsZE9oWDhHV1Bu?=
 =?utf-8?B?cWNFOEJmUnMyTU1TK3JtY0hRR01TVG9KMnNjcmNrY0lmbUFOUENOcERCOGR5?=
 =?utf-8?B?RTd0L0YvT3BTYktURk1yV3F4VEtKYkNHUlBHbCs3Wk1mQkFDWTUzRlNwNDg3?=
 =?utf-8?B?MFhTUk9FNmRjMkZRUXd1dnRUYTEyU2ZBZ3pCUFJvZVdyRUxyS0JIeXJBaUE0?=
 =?utf-8?B?eWlUOVFQZzRpNWMvcGR4M0pYWGxWUWVaT216WXdxTkR6MHBhckJDaWpUYy94?=
 =?utf-8?B?ejBic3ZwendHNzg0a0tudll0UjQ1UmdFMVNNbS94NHRZR3Y3Zmx5UXVXbnBx?=
 =?utf-8?B?cVhpUktLTlhXNWoxQ1V4dXMwdG5BSTVkWFVmTklZWkNVbjladURSR0c4QnBK?=
 =?utf-8?B?UGRHNkxhaUZUbnIwaVdQUkcwWEM0M01oTVRtM3RmUWFQS0dXaGtSQzN2MnBJ?=
 =?utf-8?B?eStxUHB0T1VNWDdXMXNiQXhnVmZzellDbDhNK1laOUZDd1crUmhaRSt6dzVi?=
 =?utf-8?B?bDI3bHkwS3ZRb1lxYWdLTW5NUGJTTzFVeXhiMkM4djhnWEdPdWNEZ1RJcnRG?=
 =?utf-8?B?bjhSOTcrTlRvY0pyNVBzOFowcEdsdjVwNktSa3NuYTNFZEZDZkg1OUo0Z29x?=
 =?utf-8?B?eE0zQ0haNGc0aEd1K25kL3gvZ1ZGaFpUNDZ3azRoYlZBcjJURTlLUFlpNzBM?=
 =?utf-8?B?ZW1FMm1RUEtFNU5rRk41R3A5U2g2aVV6b0xDWU13azZiM3Z5aUdJd0RuMFFw?=
 =?utf-8?B?WmxkSmdCei9pWHBUZ0xtMlgwSHhZS2FMUWlSREZQM2JacnZLM1p4ODRrOEFL?=
 =?utf-8?B?OUltTUt2aEswS01VRUtnaklQMFlDMXBiMENlcSs1SCt4VFZzMTY0NzFBbHd5?=
 =?utf-8?B?QW4wZ3JRMFdxelEvMksweG1NZTEreWVvdmRiSXdRNU1MZTV6clR4ZXZ2Y25q?=
 =?utf-8?B?UEY0aC9WNjR4L2QrL3IvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRkNHVrMTZ3K0plUC9aOXZlTUIxYStVNE5VSXlzZnppTGFzaDdpaHFkSEh1?=
 =?utf-8?B?RG5Gd0tuSHVYSHFtYXowUWVpaWxwSjZ4UktZR3FrV09Ic0dLbmFFejdSOVI1?=
 =?utf-8?B?eFg2MVp1bzM5VVl2U3crbVdPbzNOYTh6elQ4THljNFNiZHZlVjFJM0FmMnYv?=
 =?utf-8?B?TmJJU2kzaUhzWUJXclV1b0JDMm5taXk3Y3d5a0VTbXZzM24vOXBqaXJFa1gx?=
 =?utf-8?B?cE5Qd1BNem9xTjdyYndySFNDK3JXSENBWStnNUFhNmlITThMeHIwUnRjbDcw?=
 =?utf-8?B?Q2U4K2ZQSTdEc2xIWmdVM1JhbzRGNDFpS1BCTFJoTjlMMmpsSHJyd2w5dS8v?=
 =?utf-8?B?TW94S3UxRVJTY2JJRjQzRHJYYy9JWXNwbngxMkwvVkttZVV0VFlkckRqeGZ0?=
 =?utf-8?B?RmxwRnlPRTFwUnc1cDVjN3JIaEZUNVNvRHN4M3RHY2w2blBIQUFIczdxRFVj?=
 =?utf-8?B?bDRQdmRMTFhqeExRZkhsYTc2VVNJTmlwSDNzV1NaUzBKZGx3VHFiRW4vS2xo?=
 =?utf-8?B?d2k1VFhacFBXcHh2b3N1dmNDa09pVXJiVzZNNlQ3TmlJRkQ0SERZZTJPV3Ez?=
 =?utf-8?B?TmMyODBqMXV6OWRCZ2l3MmgwQzNtRmtuTXljSkxGQmMrZnpDaXYzVmpjUmpJ?=
 =?utf-8?B?T0dOSmVaOFphclYxRHBETVRQVVlpZjZScTQxVDFxUDc3Y0tEN1E4V21LMTQ4?=
 =?utf-8?B?NlJEZ0QxdldFK0ZUWXAvWDNoS2RPNlZGUzA3eW1aaXZlUjhzWDRyUUJIL2d0?=
 =?utf-8?B?NlgvbDBtQWorOUtnK253UTljbmdhMXlnc0ErQ2o1b0cvNGN6S2prMk1MSmkw?=
 =?utf-8?B?VXNQamJBNGZUYW1SdGlQQUVaSmlVUmNOUEt1bVpIMVZyb3dLMytGQmpncC9U?=
 =?utf-8?B?UXJseWkxKzFZY0dmVFUzZG55V1AwTXpCVmM2cTEvQ3lLY2lhdEpDOUFyUTYy?=
 =?utf-8?B?bGFtMFAybGxtTTRmWUR5QWtVMkxDRk1wMWM3cGJPcitkSm16NytmNnZ6eExt?=
 =?utf-8?B?QmdtMk1qeU9xZFR3U242OXVnK1dlaVNwOU8wRHVsemY4QS9yZ244ZFpoZWZS?=
 =?utf-8?B?bDNsOVgwSUR1ZG9YRFNiVzBpZGZBcUNQelp1Mk01Z3puTUt0ZWx3bGRMVmxG?=
 =?utf-8?B?MU83eVVBWHVlRTRvMXkzUGpyQjdWODZybFlwTXJ0TjJIME43MUh5VFQyWENp?=
 =?utf-8?B?OExzVDdjVk0vWm5SeXdTR29yaUNQL0c2c3BVNGk2TFBUSHk5UzMxOE5zMmlG?=
 =?utf-8?B?WVVVK1B4czBCMzl2MjM3Y3FTS1NjRG1CQW5mYUgvanRKdmFncHlJa0lhQ0lK?=
 =?utf-8?B?TDJqb25QcW5aSjMrVDlwK1dEU0MvUkJVUEhOR0lnZDJUbHBCNGtLaVJGb1BY?=
 =?utf-8?B?TXZydmVQRnIyaE9sUGlnYnp3OHZhRzl0cE1VUGVBY0VJZy9LYThBU29YTkRm?=
 =?utf-8?B?a0o5bzFDdUUyMWtVdjQ3VWN6OEZIMFVxVTZzdkdURnorblkrVlVPOWtPMjN2?=
 =?utf-8?B?TkVxckxRU09lY3JzdzE3UEpha2g5WEdwdnI1Yy9maE1VZko3blRxRlNlREJS?=
 =?utf-8?B?cFo2bXh2TlFVYmhpT1lYalg0K1dCdWtUTnBteDVTTHVsSVIyL2QvMmYxTTdi?=
 =?utf-8?B?cFk0K2VrajVmOEwrUHBta3FhRjFua1FzS0gvYVk0eWxLRTVoVzIyZ09DVHBE?=
 =?utf-8?B?LzhRbUVWbDAwV2FNMW9ncU53eURKU21ybHVPVTNxT1BEczVnNExxZElYWlJq?=
 =?utf-8?B?WTRhZEZiZ2tuZkhJOHMyRk9CVloxU28xajdzUEJDekFtV3lnR084N09kcWRj?=
 =?utf-8?B?cGU2SVNDc21zRy9qR2oyc2ZhNjZmbHViZ09DUUptZURveWhEZHcyejRmQXB3?=
 =?utf-8?B?dmFUOWpIR01QbVFHTUl1d3p6ME4yNnlVeWR1K2FTa0ZJM0RPSG5VamQ3bHNs?=
 =?utf-8?B?T0k3Y0FybnNrZ1dUSXNtKzR2WWN2bFpaQTB6ZVYrdTFsLzR0YVhBN3N6NWxD?=
 =?utf-8?B?MjRZay9xZmpMdnhuMHZ4T3kwU2hnTjMzYm9sOXFtNUdIYnhVWXZKS3BZWGZJ?=
 =?utf-8?B?WFM4NXB0Y0kvOWRYZ0czQjBlWEdPUDNFcW5xeTJ3ZDBnQ2NFVjlOOXNua21W?=
 =?utf-8?B?WlMrL0VuVnVBQzB6K2I4c0hDdktWZG9GZTR4SXFwQTVEbjk2ajYyaW83RW04?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: sagemcom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0ed33b-995c-47ef-90c4-08dd686c2ddd
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 11:33:19.3418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f9ffeb1d-70f1-4c2c-b7e6-d080242df8d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzsoAoICAWKJoRuWqKeuTs/eoE9Yc9JIG3ctBgEjha2Fg4+mGv3r67DRCzltHjJsr9jaVEJD7xsuVf/yLcRpoQbekAvW5Df0H4AzjKfgDYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB5239
X-Proofpoint-ORIG-GUID: jQkMx9ZPWC4bdF0ieinQcGYVaFrEqoTX
X-Authority-Analysis: v=2.4 cv=AOo+RbRJ c=1 sm=1 tr=0 ts=67dd4e81 cx=c_pps
 a=PQIiV8Rxaxnts+KKxsrcAg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=cWJNfkV6-HgA:10 a=HbzeB9StAAAA:8
 a=Yh41P-WkAAAA:8 a=E7pngf0SD_r122e3BEYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=i9oqPCtDvve8OcjLCTCP:22 a=t-YQpmI8WX82GxrYqon6:22
X-Proofpoint-GUID: jQkMx9ZPWC4bdF0ieinQcGYVaFrEqoTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=s1024; bh=Ax6uplCEXtK4+4As0
 KNGLXVwUg1cfVOvWg5V57Hmebk=; b=IBHXbHyxI7illRZB6i1hFrJZ7jQapjtWr
 W5CP2ZNu0WPQyUY1Oy6BsHdig/ZDGZr8fSagdaFXfNo7peQtNURKg5GYINjPYPp+
 GQy8XSxpAdaR+OIO/11EX7Z3pc682tzr4zSgUJJczaAD7qV14rHVW5liZFUgXax3
 FvN2nVzPShDpsGJf3doE+t/vwTns3vQZGs8YM3XLlDW20uUisYQ+XisYjk/p9Kgh
 eE9BGEXhA1Oa/6RI+WL7LL0sYv5f2LLeEm5i057GJaWTUJtoDt8lioKDDm4fqLpz
 zdl8sKL+CQT1ZU0E0B3W4dphPSba2phs7BL7HUlbQelipvSKZw4Bg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom365.onmicrosoft.com; s=selector1-sagemcom365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjNqzMCaEDWYFfeNuWBSrgZYF70iA4ymmZaT0Wdfg/o=;
 b=DWcMKgI5KHu7MbB0hhaHvIZY+h3ByuoZiC02CRBAx3kxfhMYZrZ7N1x0r2ZbY0/AgiMihyUUtXKHzn0u7TlhcxJSoGpuiNTNmM490ANtMhcBtALw5+1fqUw7Z/ILyhhdcK85+TERj/e4wKPlWsM1ZnyMaGMUJdQageR4JZPo7Oc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sagemcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=sagemcom.com
 header.i=@sagemcom.com header.a=rsa-sha256 header.s=s1024 header.b=IBHXbHyx; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=sagemcom365.onmicrosoft.com
 header.i=@sagemcom365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-sagemcom365-onmicrosoft-com header.b=DWcMKgI5
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

ZmFzdGFwaV9wcm9qZWN0IGlzIGRlcHJlY2F0ZWQsIHRpYW5nb2xvIGlzIHRoZSBjdXJyZW50IGNw
ZSBpZCB2ZW5kb3IgZm9yIApweXRob24tZmFzdGFwaQpTaWduZWQtb2ZmLWJ5OiBnaWxsZXMuYmFy
ZG91eEBzYWdlbWNvbS5jb20KLS0tCiDCoHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZh
c3RhcGkubWvCoHzCoDLCoCstCiDCoDHCoGZpbGXCoGNoYW5nZWQswqAxwqBpbnNlcnRpb24oKyks
wqAxwqBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0
aG9uLWZhc3RhcGkubWsgCmIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5t
awppbmRleMKgMDhmZTU2MjNjYi4uMjY2MmYzZGRhZsKgMTAwNjQ0Ci0tLcKgYS9wYWNrYWdlL3B5
dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rCisrK8KgYi9wYWNrYWdlL3B5dGhvbi1mYXN0
YXBpL3B5dGhvbi1mYXN0YXBpLm1rCkBAIC0xMCw3ICsxMCw3IEBAIFBZVEhPTl9GQVNUQVBJX1NJ
VEUgPSAKaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2EyL2IyLzVhNWRj
NGFmZmRiNgogwqBQWVRIT05fRkFTVEFQSV9TRVRVUF9UWVBFwqA9wqBwZXA1MTcKIMKgUFlUSE9O
X0ZBU1RBUElfTElDRU5TRcKgPcKgTUlUCiDCoFBZVEhPTl9GQVNUQVBJX0xJQ0VOU0VfRklMRVPC
oD3CoExJQ0VOU0UKLVBZVEhPTl9GQVNUQVBJX0NQRV9JRF9WRU5ET1LCoD3CoGZhc3RhcGlfcHJv
amVjdAorUFlUSE9OX0ZBU1RBUElfQ1BFX0lEX1ZFTkRPUsKgPcKgdGlhbmdvbG8KIMKgUFlUSE9O
X0ZBU1RBUElfQ1BFX0lEX1BST0RVQ1TCoD3CoGZhc3RhcGkKIMKgUFlUSE9OX0ZBU1RBUElfREVQ
RU5ERU5DSUVTwqA9wqBob3N0LXB5dGhvbi1wZG0tYmFja2VuZAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ2Ug
Y291cnJpZWwgZXQgbGVzIGRvY3VtZW50cyBxdWkgbHVpIHNvbnQgam9pbnRzIHNvbnQsIHNhdWYg
bWVudGlvbiBjb250cmFpcmUsIHByw6lzdW3DqXMgZGUgbmF0dXJlIGNvbmZpZGVudGllbGxlIGV0
IGRlc3RpbsOpZXMgw6AgbCd1c2FnZSBleGNsdXNpZiBkdSBvdSBkZXMgZGVzdGluYXRhaXJlKHMp
IG1lbnRpb25uw6kocykuIFNpIHZvdXMgbifDqnRlcyBwYXMgbGUgb3UgbGVzIGRlc3RpbmF0YWly
ZShzKSwgdm91cyDDqnRlcyBpbmZvcm3DqShlKSBxdWUgdG91dGUgZGl2dWxnYXRpb24sIHJlcHJv
ZHVjdGlvbiwgZGlzdHJpYnV0aW9uLCB0b3V0ZSBhdXRyZSBkaWZmdXNpb24gb3UgdXRpbGlzYXRp
b24gZGUgY2V0dGUgY29tbXVuaWNhdGlvbiBvdSBkZSB0b3V0IG91IHBhcnRpZSBkZSBjZXMgaW5m
b3JtYXRpb25zIGVzdCBzdHJpY3RlbWVudCBpbnRlcmRpdGUsIHNhdWYgYWNjb3JkIHByw6lhbGFi
bGUgZGUgbOKAmWV4cMOpZGl0ZXVyLiBTaSBjZSBtZXNzYWdlIHZvdXMgYSDDqXTDqSB0cmFuc21p
cyBwYXIgZXJyZXVyLCBtZXJjaSBk4oCZaW1tw6lkaWF0ZW1lbnQgZW4gaW5mb3JtZXIgbCdleHDD
qWRpdGV1ciBldCBzdXBwcmltZXIgZGUgdm90cmUgc3lzdMOobWUgaW5mb3JtYXRpcXVlIGNlIGNv
dXJyaWVsIGFpbnNpIHF1ZSB0b3VzIGxlcyBkb2N1bWVudHMgcXVpIHkgc29udCBhdHRhY2jDqXMu
IEVuIHZvdXMgcmVtZXJjaWFudCBkZSB2b3RyZSBjb29ww6lyYXRpb24uCgpUaGlzIGVtYWlsIGFu
ZCBhbnkgYXR0YWNoZWQgZG9jdW1lbnRzIGFyZSwgdW5sZXNzIG90aGVyd2lzZSBzdGF0ZWQsIHBy
ZXN1bWVkIHRvIGJlIGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBleGNsdXNpdmUg
dXNlIG9mIHRoZSByZWNpcGllbnQocykgbWVudGlvbmVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgcmVj
aXBpZW50KHMpLCB5b3UgYXJlIGluZm9ybWVkIHRoYXQgYW55IGRpc2Nsb3N1cmUsIHJlcHJvZHVj
dGlvbiwgZGlzdHJpYnV0aW9uLCBhbnkgb3RoZXIgZGlzc2VtaW5hdGlvbiBvciB1c2Ugb2YgdGhp
cyBjb21tdW5pY2F0aW9uIG9yIGFsbCBvciBwYXJ0IG9mIHRoaXMgaW5mb3JtYXRpb24gaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZCwgdW5sZXNzIGFncmVlZCBiZWZvcmVoYW5kIGJ5IHRoZSBzZW5kZXIu
IElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2UgaW1tZWRp
YXRlbHkgYWR2aXNlIHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIGUtbWFpbCBhbmQgYWxsIHRo
ZSBhdHRhY2hlZCBkb2N1bWVudHMgZnJvbSB5b3VyIGNvbXB1dGVyIHN5c3RlbS4gVGhhbmtpbmcg
eW91IGZvciB5b3VyIGNvb3BlcmF0aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
