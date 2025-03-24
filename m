Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775D6C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 11:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCD4A605AF;
	Mon, 24 Mar 2025 11:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLd8JoWrOZUi; Mon, 24 Mar 2025 11:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E301460826
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E301460826;
	Mon, 24 Mar 2025 11:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A9C61B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C445605AF
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs1XQH3RnAiC for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 11:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.183.28.205;
 helo=mx08-0035d101.pphosted.com; envelope-from=gilles.bardoux@sagemcom.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D343560826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D343560826
Received: from mx08-0035d101.pphosted.com (mx08-0035d101.pphosted.com
 [185.183.28.205])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D343560826
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:08:43 +0000 (UTC)
Received: from pps.filterd (m0166232.ppops.net [127.0.0.1])
 by mx08-0035d101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O7ttMb003485;
 Mon, 24 Mar 2025 12:08:41 +0100
Received: from pa5p264cu001.outbound.protection.outlook.com
 (mail-francecentralazlp17010000.outbound.protection.outlook.com [40.93.76.0])
 by mx08-0035d101.pphosted.com (PPS) with ESMTPS id 45k3ej84tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 12:08:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzJKdJ4TwT4i6s6cNG9gDTcxZqqKU5SOqAEsDtC+QRXyftiarptnTs4HytOijC2d8jDl2g5zWA12B2oZVQdHIPJrnQbnlMyIM/rRQkthtUOlBXbUNw1O1SpUYA/f6co/e8L8gspUtWO8Biyusxu/JoIH/MUZ9FMHcqQi+OmbSAkdYT3aZX1wEnHy4RBUYxeDkFZX/ntEAUZKEC0zQwpaWuSmW0tEf4jcA9vC5uDl4t1gcZzzbsKYDMpK8wp668nxMIYC3XdEO2kIa2nOcqocHjQTWms2jZgN+2+qhrADLcG2TS2jsY9mK5QdNufnrDi22WuZVZ9fk+twBPhsoxOykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOiKULsamQJYczuK2FD7aBelIV3DzaPwtTlw5Ra4aDY=;
 b=v2b6oGYxR2Z7UxsRSP0ohAQwWFDM/UGqb/kENMLudM2haCnLVixYurT9+EPqM6cYH2M0BbfwuGEKIpLcpUArSMF1vsBgtuFTZvot07hzl/+Q9g5oV3eGBKZZB1Ss5VVC1ycvvOfU8l++6H578JbOjyLq77QIaJRlCaEGjr+iA2DaTuUrqw95y/UOBjocSFNy90EWhFx1Dk0oxlv1c6Fjkxd38lz7h5ZMNjlDTZssPW0uYKE8Bj7kdS4NrYK7bFTxPWZ+XcZdILFs/5NeRbnLdwVvKeQOyE5MZD4E94fWlnQBwuMdRTfgv0zHvRuli8k7c9MXXDVR1tpkAutaOOzL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sagemcom.com; dmarc=pass action=none header.from=sagemcom.com;
 dkim=pass header.d=sagemcom.com; arc=none
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9)
 by PASP264MB5839.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:49a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:08:35 +0000
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1]) by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 11:08:35 +0000
Message-ID: <86b54323-b769-4e69-8e8b-ad7fcda512f4@sagemcom.com>
Date: Mon, 24 Mar 2025 12:08:34 +0100
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <76dd8fca-f33f-4c74-a36c-d2f91e1d9102@sagemcom.com>
 <33e771424610d57d3cfbc8d80383eb75@free.fr>
Content-Language: en-US
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
In-Reply-To: <33e771424610d57d3cfbc8d80383eb75@free.fr>
X-ClientProxiedBy: PR1P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::15) To PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3183:EE_|PASP264MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: fd21df54-1455-4c40-d267-08dd6ac4388f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|7053199007|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzcrSGZIRFY4TG4xRVpabTRFS25YRm5wWVFHb2kzUzlxRlR5SUJjZFpIWnMv?=
 =?utf-8?B?Y3JkUlpsYllnYnZqd0xsdHFNazViMWZGbmExdXl0ZEZmdkNmSDBxdGtYU2ta?=
 =?utf-8?B?SklNMTZUcFNIZUJlb2F1S1U2WGQxaUJzTkhvcGRXeU9oV3ZnVkU5aDd6ZDBl?=
 =?utf-8?B?M0x2STYyWkJDS29zNys2VitRVVNwZEhSL2E0Y0tGYjAxN0V6ZDdURlNQUllx?=
 =?utf-8?B?VGpVUEVpckwxL3dmOHFLK08wN3pteFlPbVlRVC90d1V5N1hqOGdzZXZwdVNl?=
 =?utf-8?B?L0FmUHNxK1NIRnJ5N3R3QUNPM2grQjJqZ0I2d1ZpeHBCRFJBMVpyUlB4S2cz?=
 =?utf-8?B?dGVSMFdLaDFRRGQ3ajhKenNrcUFaZDI4dEdhQ01kdUxnSHBjWTNISDJwZ3pz?=
 =?utf-8?B?eVRENkpNUytiajRkYnB0RzRjOHBKSEhkcFB5UENkS25Edm1FVVc3MGF6TERv?=
 =?utf-8?B?UFp5d0IrSGIyYW9sbUtxcXZZMTAzMEFEeVJPRkpMN240ZGFCdmNkc3ozUExw?=
 =?utf-8?B?VzV5OFVRSnhDbklMQWowRUtaUlBMeFl4RFNEejNJMWlhY0hueWxPVytyeVBn?=
 =?utf-8?B?M2EwM3ArREdJVmhLYUNpU0ZQS1o1djltZjhxUmhpbkFQMjVBdXUxSjZiTnY1?=
 =?utf-8?B?SytvMUl2cnIxbzlrekxXUmNrN1lpUmh1dEgvbllQeFJqdUFHRlJQbmtQM3k3?=
 =?utf-8?B?Y0gxT1JkZXBFSVdwWDhnVTBGM1pzaGl0eWFleDZYNEdEZUw3dG9FZGtOc0pj?=
 =?utf-8?B?RzJMT0lDV0x4cFZqRnFETnAvNTFxL1BucWpFQ25NZzVRLzJvK0hORlpmMHNa?=
 =?utf-8?B?WWhvMXBaVHpUSW93MTJQbGlJQ2lPcWVsNG54Qy9WMjkwY0lxR0VPK0M3SlJs?=
 =?utf-8?B?bFNVaXFSNHk5cU5QeFpkaGs5MTA4VlM5ZUFTR0tGQjNVcDBMcy9IRm5zVGFl?=
 =?utf-8?B?Z1ozRkFkVTlKb01XOHFXYm5FcWlZMjh2dHhvNlkwUC91V25FRjRpWTB2aVo0?=
 =?utf-8?B?aUc1MmdYeHJLNkJUUDU4SFlnUDdRTDlLOTJIUURKK244eXZJZTkzREc4UFpV?=
 =?utf-8?B?UEdsejk4czVRZERHbEZZQ2p2WHlqRlljWHl5UFl1Sm1aMUxvMnlqVTNYdito?=
 =?utf-8?B?UVhycnVSU2ViMzlDOWtpM2lDTEVZVERDVkt2WnNiT0dvY2llZzJrdytMNDFL?=
 =?utf-8?B?dldROWR6b0JPUHhtQU12ZDlZd3VIWkxYazdHa3ltSjN5bEhHZFdIb3BZMnBp?=
 =?utf-8?B?aExKWE4rSU9POXRlVWpMT0tIbWs0VFFEc1JsZCtmZEJNdnJwWWxkc1FhaUoz?=
 =?utf-8?B?R1JmMlBGVU5RWXJ5NGh5RXRqNG9MM3hrQW9tTWE4cGFRZHhFendZejRweWRX?=
 =?utf-8?B?RFkwQXcxWGpjdlQzWW0zOU1TcU1xWHAwSGo4T3ZGMm5kS2pzZnhhaktFMlQw?=
 =?utf-8?B?SjNDOFMwa0lGckdNNllDcW44K2dGcjhpSXlvSEF2OFJLN211Mnk3bkJmaFNi?=
 =?utf-8?B?Qm9EV3lBbkVlT05YcEsvQTZuTUw4bjlTZjQyeUFqWDJqYWZxR1RQUHdqcEpB?=
 =?utf-8?B?R1htTWtvVFgzeDc0MWdyVldxUVFIZHNYSnB5c3JBK2ZqS2pVbCtqRGs3bk5z?=
 =?utf-8?B?Vk9qWUlmYWNRL1BjMXpEVHNtVE5POFVIR2Zxb3d4YVpvaVhZOW1sY3NkQ1Jp?=
 =?utf-8?B?bEk5M1hDT1F5M2xaMFoxWk84SzZON0ZFWkNoc0t1MWZkVGhWWXVFRUpZbnlM?=
 =?utf-8?B?cG0ydlNTTCtScDZDU25GYVd1RVUxQlF2MGRUaklPckRNS0cvZ3d1WC92QkMx?=
 =?utf-8?B?MWJHV0hYaFhVenVFUlUyUm1TSEJDL3JtSGJwVlA3a2ZIb3pRRkFQUFlEL1FF?=
 =?utf-8?B?bnhKOXBvam45T1VxaXk0dDFINDJxY2J3YS9ZWHI1OEl5WmhUQThNS3FreG5B?=
 =?utf-8?Q?wUYePO+PXig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(7053199007)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RQZ3Nkc3JvRnhVMWlKOHB5OXVoRmFBV3dZS1hXb2NZbFFZNElEWVV3OUpo?=
 =?utf-8?B?eGtxcUVZWGFYU3hHMHpIWWNlNitRZDFoa0RHTmNwZnVGUjVLcGVRd2NKZUFS?=
 =?utf-8?B?aGJTbUd3eWVrWDBpdWVUdTBoaUoxRlhJSEcrd0RCNk5wZTV5UWt5WVhaR1Rq?=
 =?utf-8?B?K0YyTCtEbEdOenQ2eldWMFpRcGFxc3dPdkMwQWlLVmpYRGxGSkxJbVoyQjlm?=
 =?utf-8?B?VVl4TGowR1JyTFJ4cE9CRnhCc3pWR04zdmZLM2xWVmVaUHZEN2tiWjRVZ1FR?=
 =?utf-8?B?MVlBSTdzZHBEWHhlQUlDSlpTeThEMG0rS041aDRUUUpFaklMVGZNK1hEd2lZ?=
 =?utf-8?B?WmJaenV4ZjA2VUdZVnpvb0M1WEFSN3h2QjVMVHF0TzhlN1pmUWlrejAyaXNP?=
 =?utf-8?B?M01IWEhRYityNHFaallyQ2NuTEppK3NEeC9CSDc1QytDUDFNdFBnMVFkaEgz?=
 =?utf-8?B?bHhsbjBxS21VTVFNYnpRREdweHpWU2hDeXY3Rzl6TURVLzF3QnphalFQeFRv?=
 =?utf-8?B?enNNZDVSTkRjTXIrVjcwMHhxMTl6TG5ZYlJVZkphS25Hb204L2lKeFBVcXli?=
 =?utf-8?B?ZHkyRGJhTE5wamJqdENzZUc1bWdUSWlaMnoyQ1R0L2JiRndkQnpudXNEWjd0?=
 =?utf-8?B?QVBjanhIbVNLZEhBOFU0MVpXb1gydHhDZlpUaDVLRUlveUl4bjM1ODZuT0ZX?=
 =?utf-8?B?YVcwZ3FvRlg5Y1JkQ2JpSXg3M09WZ3lYRVI1b21wblUvOFBaOEdPaGU4djVY?=
 =?utf-8?B?bDdNTFoyZ2c3Y1poc1VTNkZrOTlnMENHQklWM05Va2xlL0FFRGZiR0dJSkM0?=
 =?utf-8?B?ZVNRZlI3aXVRREN5T05VZmJRdXdPOEN5VDhUVTlaVEFXRUs0enZkKzI0NEJ6?=
 =?utf-8?B?ZFE5MFE4TVpaTFpNUUhJVVFHUjNWN1JUR0dJamk4UUlJQ2tPZUdhWlg0Z3ow?=
 =?utf-8?B?NWxWelZKZ2cvaThLQThva0h0Nk1TNDBkQ3diT0R0Vm1UcVd0N1NHcm4rN25S?=
 =?utf-8?B?aXFaUnRYMndMUXZveDlaQlc0THM4blRoeFkzSkRScFNGOXYzU21aTldmaGRu?=
 =?utf-8?B?d0hXYzVRYkgvT2h6cDNVbWZIdEZ3M1hmamY4aDdiUU1KYUxnQk16UFdjSlhm?=
 =?utf-8?B?dlo3MWF2SlgwbUJ5ZXRpWDJ0OU95M2kzV2xneDVMbnpnc3VsZ0RTMURFbzZr?=
 =?utf-8?B?bWxKN1RQdDhNT3FVUlpBUlRzVlhtc21kemJxU0c1UEVPYzdWQkw5TVV5cmd0?=
 =?utf-8?B?RjZKZ2dMOTN4by9VaG9XcjE1a2NPcTZrTkFhMVBnbm9sRWN2dFNMZGZRVVB0?=
 =?utf-8?B?alNKSk10Q2FNcHhPR2RnVWR6dVFUVHJGaW1NQUNaVFdMekozK3BRQ0JoQlNP?=
 =?utf-8?B?MGtlcVhOVkV2RVVhOTJiQ3pvMUh2eXpPbHJSTFdhN3N5WDZrdHIrNmpSaTJH?=
 =?utf-8?B?TjBZSzRseTNrbEZmYjd6anVzeTFlanlzZFFlQmMreVhlQ2tNT2toZVhjN1lV?=
 =?utf-8?B?SysrMEFJVHRZeUt0SHBZQ0EvNjVzUVZDY3I5NDVhS09Sa2o0M2JpaDIwNytQ?=
 =?utf-8?B?Sll0Zk82MFhhMDZBSG5hTm02YkpmL0M3V2RLeHBVTzd5aXI3TllzT3NqYXFP?=
 =?utf-8?B?bVFMaEhQVCtRQlVhaTBERG5rV2xGM1FNbWIwWk1JNjNydWVuV0lFc0JuMytY?=
 =?utf-8?B?LzR0NjZsWkhMM3p0N0hvdklnZ1pFYTgxUkNZcVRtSDlqNC9BbXhod1g5RkQv?=
 =?utf-8?B?bWpuVkYwNDVvVnZvaFhhT2wrQXRnbEdaaTJIUnZVM1lvYlFteVF2ZHNROERE?=
 =?utf-8?B?VjYva0FHb25zamgwQXF3STJzekRpekc2MlgvdDFsTFNHV0tYd0FIbllrTTI5?=
 =?utf-8?B?S290eUFBNHdMY2U5R0lxZHRoUmQzd2NPT2RvUjFwUnZHdW5hWUtXLzZkamZP?=
 =?utf-8?B?d215MFRGbUd5L01MSmV5R2xhdmxxd3ZjWnlYdmFZZHVDTmRROXQxalJWVm9H?=
 =?utf-8?B?ekd5NWlwbE9SakVuWE92REg2cnUveW12Si84amVmN0xYTyt1UmhkbzlhOElN?=
 =?utf-8?B?UUtMQklpYWlqU0pvQ1RBa2VhRTd2bUVVaXlOcFhsY3ZzbUpRa2xtV2NaUHhl?=
 =?utf-8?B?UWtlYU9LWVJoa1RqbmRkM2FNMTFHMUNvUnUwV3ZTU25LQkdjWG93SWwrRDF0?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: sagemcom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd21df54-1455-4c40-d267-08dd6ac4388f
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:08:35.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f9ffeb1d-70f1-4c2c-b7e6-d080242df8d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+J2EdzWgfavl7cvi4a3HrdWKgpVL8y9xp6aIbFErycrP4aSWl964h6br090lX3LPHPbXy3f2poewhkBZ0CdK0XISjye8Nv7r8MSQwA2r7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5839
X-Proofpoint-ORIG-GUID: DOwl0LuW9weLJ42SJiYzcWa5z-h8G5gs
X-Proofpoint-GUID: DOwl0LuW9weLJ42SJiYzcWa5z-h8G5gs
X-Authority-Analysis: v=2.4 cv=A/lsP7WG c=1 sm=1 tr=0 ts=67e13d38 cx=c_pps
 a=zkS8ay+g15U72O2Yqz03gw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=cWJNfkV6-HgA:10 a=HbzeB9StAAAA:8
 a=voM4FWlXAAAA:8 a=YRHvXXt1AAAA:8 a=Yh41P-WkAAAA:8 a=5Tm9Wl7-7fB7o4EwtNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=4BAkZkUG_uEA:10
 a=i9oqPCtDvve8OcjLCTCP:22 a=IC2XNlieTeVoXbcui8wp:22
 a=9bw_jnHfPby8klRCszyn:22 a=t-YQpmI8WX82GxrYqon6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 s1024; bh=gRICwvuXYHs1CgEihZ3YFwpVG/gfzpOy01RSJHqzLIQ=; b=VJMlby
 7+yado5WVo2Xa/TljduoNMpfzUxd+g9Oxu3FFpGApeMxeIQchMcLpwc4kZKzI4Gt
 0o7uKzyXbrn/1tOiQeRHOfirCeST3YFsLvJAhNj6aLeOdJL6qKIhmqTjhA043Xv0
 9Ynekbe+NnUFP0hfSHpehyreegVWP4FR/VcW7RisGDuKLQfwygukacAlqbV/6DRv
 D/hFrQi8u12pk3ajqRS/yZfMS3MUdNqogP0jWEGjoZGDhPRWLCHQspaK5rmFLc7S
 a0dkpXZxIL99Q2fYg8OH5rNm6j8ZGZRR7Kc1FZhtS+gUXK6YY9Ft2xA7IA8MEfSD
 Swssi1r8HJMab3Rw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom365.onmicrosoft.com; s=selector1-sagemcom365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOiKULsamQJYczuK2FD7aBelIV3DzaPwtTlw5Ra4aDY=;
 b=t7jkTuzZF06EgQYa2O0CbyoaHYHY5GG87/ffAbzMylyow9LQ1PG+MolM2BKA6fDNixy0Q01n4YlSney99MgM7sO+4EG7P8ycy74gVtmU2SXOtrXvwvQDC+RYB/GHioQ/6rX9s+MyT1Gzap70PwGaNE1TeMztbckaj7LAvmerlEk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sagemcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=sagemcom.com
 header.i=@sagemcom.com header.a=rsa-sha256 header.s=s1024 header.b=VJMlby7+; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=sagemcom365.onmicrosoft.com
 header.i=@sagemcom365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-sagemcom365-onmicrosoft-com header.b=t7jkTuzZ
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: fix cpe id vendor
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

IEZyb20gYjM3NjIwZDkyMjhiYWVjZmY4YjczZjlkNjAxODI5MGMxN2JhMDdkZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogR2lsbGVzIEJhcmRvdXggPGdpbGxlcy5iYXJkb3V4QHNhZ2Vt
Y29tLmNvbT4KRGF0ZTogRnJpLCAyMSBNYXIgMjAyNSAxMTowNjo0NCArMDEwMApTdWJqZWN0OiBb
UEFUQ0ggMS8xXSBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpOiBmaXggY3BlIGlkIHZlbmRvcgoKZmFz
dGFwaV9wcm9qZWN0IGlzIGRlcHJlY2F0ZWQsIHRpYW5nb2xvIGlzIHRoZSBjdXJyZW50IGNwZSBp
ZCB2ZW5kb3IgZm9yIApweXRob24tZmFzdGFwaQoKU2lnbmVkLW9mZi1ieTogR2lsbGVzIEJhcmRv
dXggPGdpbGxlcy5iYXJkb3V4QHNhZ2VtY29tLmNvbT4KLS0tCiDCoHBhY2thZ2UvcHl0aG9uLWZh
c3RhcGkvcHl0aG9uLWZhc3RhcGkubWsgfCAyICstCiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZhc3Rh
cGkvcHl0aG9uLWZhc3RhcGkubWsgCmIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFz
dGFwaS5tawppbmRleCAwOGZlNTYyM2NiLi4yNjYyZjNkZGFmIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWZh
c3RhcGkvcHl0aG9uLWZhc3RhcGkubWsKQEAgLTEwLDcgKzEwLDcgQEAgUFlUSE9OX0ZBU1RBUElf
U0lURSA9IApodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYTIvYjIvNWE1
ZGM0YWZmZGI2CiDCoFBZVEhPTl9GQVNUQVBJX1NFVFVQX1RZUEUgPSBwZXA1MTcKIMKgUFlUSE9O
X0ZBU1RBUElfTElDRU5TRSA9IE1JVAogwqBQWVRIT05fRkFTVEFQSV9MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQotUFlUSE9OX0ZBU1RBUElfQ1BFX0lEX1ZFTkRPUiA9IGZhc3RhcGlfcHJvamVjdAor
UFlUSE9OX0ZBU1RBUElfQ1BFX0lEX1ZFTkRPUiA9IHRpYW5nb2xvCiDCoFBZVEhPTl9GQVNUQVBJ
X0NQRV9JRF9QUk9EVUNUID0gZmFzdGFwaQogwqBQWVRIT05fRkFTVEFQSV9ERVBFTkRFTkNJRVMg
PSBob3N0LXB5dGhvbi1wZG0tYmFja2VuZAoKLS0gCjIuMzkuNQoKT24gMy8yMi8yNSAwMDozNywg
SnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gW0VYVEVSTkFMXS1SZWFsIHNlbmRlciBpczoganUub0Bm
cmVlLmZyCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gSGkgR2lsbGVzLAo+Cj4gVGhhbmsgeW91IGZvciB5
b3VyIHN1Ym1pc3Npb24uCj4KPiBUaGUgcGF0Y2ggaXMgbm90IGFwcGVhcmluZyBpbiBwYXRjaHdv
cms6Cj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC9fXzshIU1OQ3g5NXZHSFEhU0pScklRZlVGaTVB
eEllU2RqdzNnSG9MbnpWbmlONWFKUTd3a2RJOUJDaFRPV21Ydjh6VFNIYVJQZHRfS2ZoSEJkX0Z5
cVFid2dOdWtaWVRrQSQgCj4KPiBJdCBzZWVtcyBpbmNvcnJlY3RseSBmb3JtYXR0ZWQuIENvdWxk
IHlvdSByZXNlbmQgaXQgdXNpbmcKPiAiZ2l0IHNlbmQtZW1haWwiLiBTZWU6Cj4gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFs
L21hbnVhbC5odG1sKnN1Ym1pdHRpbmctcGF0Y2hlc19fO0l3ISFNTkN4OTV2R0hRIVNKUnJJUWZV
Rmk1QXhJZVNkanczZ0hvTG56Vm5pTjVhSlE3d2tkSTlCQ2hUT1dtWHY4elRTSGFSUGR0X0tmaEhC
ZF9GeXFRYndnT0JQZWF4TlEkIAo+Cj4gT24gMjEvMDMvMjAyNSAxMjozMywgR2lsbGVzIEJhcmRv
dXggdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gZmFzdGFwaV9wcm9qZWN0IGlzIGRlcHJlY2F0ZWQs
IHRpYW5nb2xvIGlzIHRoZSBjdXJyZW50IGNwZSBpZCB2ZW5kb3IgCj4+IGZvciBweXRob24tZmFz
dGFwaQo+PiBTaWduZWQtb2ZmLWJ5OiBnaWxsZXMuYmFyZG91eEBzYWdlbWNvbS5jb20KPj4gLS0t
Cj4+IMKgcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5ta8KgfMKgMsKgKy0K
Pj4gwqAxwqBmaWxlwqBjaGFuZ2VkLMKgMcKgaW5zZXJ0aW9uKCspLMKgMcKgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGku
bWsgCj4+IGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5tawo+PiBpbmRl
eMKgMDhmZTU2MjNjYi4uMjY2MmYzZGRhZsKgMTAwNjQ0Cj4+IC0tLcKgYS9wYWNrYWdlL3B5dGhv
bi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rCj4+ICsrK8KgYi9wYWNrYWdlL3B5dGhvbi1mYXN0
YXBpL3B5dGhvbi1mYXN0YXBpLm1rCj4+IEBAIC0xMCw3ICsxMCw3IEBAIFBZVEhPTl9GQVNUQVBJ
X1NJVEUgPSAKPj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9hMi9iMi81YTVkYzRhZmZkYjZfXzshIU1OQ3g5NXZHSFEh
U0pScklRZlVGaTVBeEllU2RqdzNnSG9MbnpWbmlONWFKUTd3a2RJOUJDaFRPV21Ydjh6VFNIYVJQ
ZHRfS2ZoSEJkX0Z5cVFid2dPQzhhQURzdyQgCj4+IMKgUFlUSE9OX0ZBU1RBUElfU0VUVVBfVFlQ
RcKgPcKgcGVwNTE3Cj4+IMKgUFlUSE9OX0ZBU1RBUElfTElDRU5TRcKgPcKgTUlUCj4+IMKgUFlU
SE9OX0ZBU1RBUElfTElDRU5TRV9GSUxFU8KgPcKgTElDRU5TRQo+PiAtUFlUSE9OX0ZBU1RBUElf
Q1BFX0lEX1ZFTkRPUsKgPcKgZmFzdGFwaV9wcm9qZWN0Cj4+ICtQWVRIT05fRkFTVEFQSV9DUEVf
SURfVkVORE9SwqA9wqB0aWFuZ29sbwo+PiDCoFBZVEhPTl9GQVNUQVBJX0NQRV9JRF9QUk9EVUNU
wqA9wqBmYXN0YXBpCj4+IMKgUFlUSE9OX0ZBU1RBUElfREVQRU5ERU5DSUVTwqA9wqBob3N0LXB5
dGhvbi1wZG0tYmFja2VuZAo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpDZSBjb3VycmllbCBldCBsZXMgZG9jdW1lbnRzIHF1aSBsdWkgc29udCBqb2ludHMgc29u
dCwgc2F1ZiBtZW50aW9uIGNvbnRyYWlyZSwgcHLDqXN1bcOpcyBkZSBuYXR1cmUgY29uZmlkZW50
aWVsbGUgZXQgZGVzdGluw6llcyDDoCBsJ3VzYWdlIGV4Y2x1c2lmIGR1IG91IGRlcyBkZXN0aW5h
dGFpcmUocykgbWVudGlvbm7DqShzKS4gU2kgdm91cyBuJ8OqdGVzIHBhcyBsZSBvdSBsZXMgZGVz
dGluYXRhaXJlKHMpLCB2b3VzIMOqdGVzIGluZm9ybcOpKGUpIHF1ZSB0b3V0ZSBkaXZ1bGdhdGlv
biwgcmVwcm9kdWN0aW9uLCBkaXN0cmlidXRpb24sIHRvdXRlIGF1dHJlIGRpZmZ1c2lvbiBvdSB1
dGlsaXNhdGlvbiBkZSBjZXR0ZSBjb21tdW5pY2F0aW9uIG91IGRlIHRvdXQgb3UgcGFydGllIGRl
IGNlcyBpbmZvcm1hdGlvbnMgZXN0IHN0cmljdGVtZW50IGludGVyZGl0ZSwgc2F1ZiBhY2NvcmQg
cHLDqWFsYWJsZSBkZSBs4oCZZXhww6lkaXRldXIuIFNpIGNlIG1lc3NhZ2Ugdm91cyBhIMOpdMOp
IHRyYW5zbWlzIHBhciBlcnJldXIsIG1lcmNpIGTigJlpbW3DqWRpYXRlbWVudCBlbiBpbmZvcm1l
ciBsJ2V4cMOpZGl0ZXVyIGV0IHN1cHByaW1lciBkZSB2b3RyZSBzeXN0w6htZSBpbmZvcm1hdGlx
dWUgY2UgY291cnJpZWwgYWluc2kgcXVlIHRvdXMgbGVzIGRvY3VtZW50cyBxdWkgeSBzb250IGF0
dGFjaMOpcy4gRW4gdm91cyByZW1lcmNpYW50IGRlIHZvdHJlIGNvb3DDqXJhdGlvbi4KClRoaXMg
ZW1haWwgYW5kIGFueSBhdHRhY2hlZCBkb2N1bWVudHMgYXJlLCB1bmxlc3Mgb3RoZXJ3aXNlIHN0
YXRlZCwgcHJlc3VtZWQgdG8gYmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIGV4
Y2x1c2l2ZSB1c2Ugb2YgdGhlIHJlY2lwaWVudChzKSBtZW50aW9uZWQuIElmIHlvdSBhcmUgbm90
IHRoZSByZWNpcGllbnQocyksIHlvdSBhcmUgaW5mb3JtZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwg
cmVwcm9kdWN0aW9uLCBkaXN0cmlidXRpb24sIGFueSBvdGhlciBkaXNzZW1pbmF0aW9uIG9yIHVz
ZSBvZiB0aGlzIGNvbW11bmljYXRpb24gb3IgYWxsIG9yIHBhcnQgb2YgdGhpcyBpbmZvcm1hdGlv
biBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLCB1bmxlc3MgYWdyZWVkIGJlZm9yZWhhbmQgYnkgdGhl
IHNlbmRlci4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBpbW1lZGlhdGVseSBhZHZpc2UgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgZS1tYWlsIGFu
ZCBhbGwgdGhlIGF0dGFjaGVkIGRvY3VtZW50cyBmcm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVtLiBU
aGFua2luZyB5b3UgZm9yIHlvdXIgY29vcGVyYXRpb24uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
