Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE69C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 09:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A9C4089C;
	Mon, 14 Apr 2025 09:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GBlr-7naJuL; Mon, 14 Apr 2025 09:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5F91407DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F91407DE;
	Mon, 14 Apr 2025 09:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 657EC250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F404011D
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq-VgaH4x3CA for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 09:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::60f;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 288D040530
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 288D040530
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 288D040530
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5tEWZq4hXwCGPpqgtZkCzQ+X61iLwqxRldLYb95QAm7m2GGfkcrmL7us6wIKj47Wt1DMi6n+8m+F5DIAMKlT8geObzluCzeUef7ISL4Smfwo2n9oKN0fVGDf2AIT0XgTQoaBpQfW07eSnK8r46NvNFIqPTMjOXe2s7KraAFK+S6KOSBXvHO+7qbQF3tyKjA2D4RqOXwSnCyE6IFDZ+kWYd21ibExK2WHjKNuvxP8TjjXl2GasRojWiqubq3hWuandk61A9pnoPcxyYSDAXZwvBaNCrp7R7/CML9h67CToM+v/+E1zkrt9D1OHDVjXQBak2KpAMsv+L+1oMzb+03nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEFp4owdqn0tOmLNw4UiIr8IDwisO1QIce+WSsotdLU=;
 b=n+oLxTKdK795AMPoz63aXB4wNlQ1HPqPNF7Kfhf0Kx02PXyX6S29Wi2HZRlDop2aMu+k3oqv47frducXkYITz3g/6/Pu/ngSAEtNr2MoZfUGMwNdUCKmzaiL6HAKVvKHYHBhRABoR7wHjWPhEmGVkhkFUmGwmeQvwEI4yDh+l9cJdTEdOR//HibARfM89PBcfhfIN6os02heLIf+Jry8QLa2zAZRmnbPhCYm5W6GWeCs1THtaU+2u5H3FuKQRvekfqTSnx1joFGW7gReZNnDY7jjozslYqoJxDHE8CVr8oelw5x4HndEmUtmosu40vThKosChnOvEx2PYtNZWuwl3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10247.eurprd04.prod.outlook.com (2603:10a6:150:1c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 14 Apr
 2025 09:08:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 09:08:06 +0000
Message-ID: <f04f3434-1f87-4b9b-b5b6-1c61cb874faf@cherry.de>
Date: Mon, 14 Apr 2025 11:08:04 +0200
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
 <20250410155431.2a343129@gmx.net>
Content-Language: en-US
In-Reply-To: <20250410155431.2a343129@gmx.net>
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10247:EE_
X-MS-Office365-Filtering-Correlation-Id: de233e1f-649c-4aa1-a365-08dd7b33ddcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|41080700001;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z01FYkE2Yi8vWWRDUmV2Tk1UeWkvdmhFdjJOWHpjWWNELzNmd25WREtGdERF?=
 =?utf-8?B?Zzd0OWxRVk5YcUlOZXUvS2U3WjYxMmg4cE5uVEIyZjVCaFk1RHFiVENGcCtn?=
 =?utf-8?B?REJ1eHY4WXpIR0E4Vy9oc3ZySm5kVzQvWkJhekEyU3BFMlhyZmpGQ1AxTmlC?=
 =?utf-8?B?N3hzRmZmWkdzMW9Dai9LSTlRS0dmMis4ZUxEMU9xTEdRODdmb25NenQ4d1BY?=
 =?utf-8?B?TkhYTEJSTHdXUDNmUWlDVXh2QVRDelBwMGRlVFVrMlM4WGJSaWhGRDRzTlNX?=
 =?utf-8?B?alpMUk5qZzBUN0lWTkN1NWdxVTc0QzZNUHdqZ29VUlB6YytiT3R6Uy9KaExv?=
 =?utf-8?B?amduaUdWM2E3dGpjbWhqQlk1b3pzWFk3OHhVc0o4Q1V0YkE2NGpUVjluS1cr?=
 =?utf-8?B?aTh0aytpNlFBd0hSeEY1TmRlUzdNWTNCNTRIaHZWYit1V1Jld1dBYVIzSGV3?=
 =?utf-8?B?U0Fjb0k0ZEg4eURiNjEwQmVjY00zNTZ3RThGZ3VkOHFrQk5qcWFFb2VYd2xi?=
 =?utf-8?B?OXJsR0pOelk3eGhvcWt1elJrWG1mZ20zUDRQeHIxZTBueVFHLy9oemtEU3h4?=
 =?utf-8?B?N2JVL3VpZ21sVi9uV09sK3FyZWFFRjVYWHE5cXgrVUtzdTl5S1YrL0cxSTNJ?=
 =?utf-8?B?dFFtNTJrYUNuRmlZV1IxYlBPbGdQM2U3dkFZZnB6ZTJmSkNpQkFEWFdzenBv?=
 =?utf-8?B?bGtrYmE2cVprbytuN3dKSzZJS2FtZGdnQ0NaWjY4YWNOcDZ5T3NZMERVNEts?=
 =?utf-8?B?cW1TdGVmVzYxMlg5VlRnYUtSVldud0hXTEJ1OGZwQ1BNYXIxQ3R6LytsenZT?=
 =?utf-8?B?cmRIR1BLcW8xcTk1QTR1TStvVFRacXo3M0NpcDE3U3h2YzVCZGVOZWJTemg5?=
 =?utf-8?B?UmFuMS8wOTFsd1pkWWRBVU1aSE42MGxCVEZJNjg3bnc0VVFNMGNNelNyckpm?=
 =?utf-8?B?K1lZWjdRWmxZb1U4RUJ4c2F4Zmd1Y1dFWEVUeURmRUdDQk1ZeVlJSURKc01t?=
 =?utf-8?B?RzFsbzN6ZHA3VjdmUlZOenRZd1BvQlRkL1d6M21UR0ZJVm9wK2JMQW9GMHFF?=
 =?utf-8?B?NjRNLzIyYXMxNDJ3LzhLaWM3ckk5bW01UUIzNkdxYi9DK2pXOUxhSHJhK3ZU?=
 =?utf-8?B?OG03US9Xb0pvVWN1Y2Rkcy9kZmNDbUJ6SytFQ1pBaFp1V2VsSDVXSnA1QU1s?=
 =?utf-8?B?OTNHU0Z1UEttS21LUnNvUEtYWmxwaXlJTk9NaktsUEdkUUk0MjVrZVlkblB2?=
 =?utf-8?B?RWtpcUJzRUhRc2tSTmkrNEt2allYTzNkam9iTWZGYnB3cm5lYjNtZWIzVmpi?=
 =?utf-8?B?WnV3MzFUOFQxVW0xMzEyenhFVkVBckhQSDAvYzV0ZktuZDVubmVQVnhwMUJ2?=
 =?utf-8?B?V05wREZTTjJCcWdOa0U0OExVMzFVL3BrZld6TlllZnhvMlZSR09sTU1UYlUy?=
 =?utf-8?B?QnFiQVorN0tDK2FPUFNIK1d4MXpBVjRrcktqVEVOKzA0QVlXUDNnVUFqeDll?=
 =?utf-8?B?bytROEdvc25OTGtjZml0Ukc0UE1rN3J4SDRnMVVCSjRzU2xZMFArMDM3NENY?=
 =?utf-8?B?YzB3ZFlkeC92b2RFblRDZ1J5M1Y3NThTQzd6VGt1NTZwR0hvQzQreUhYOFlT?=
 =?utf-8?B?b3QwbmhyMjg4S3dlbmRwQ3d0RkZUSWdHbmljWEFrSURZZHc4VmpxcmpsMzFn?=
 =?utf-8?B?UzBORTNuN3Nhd2lVaFdRSmZnTjNBNG4yNXhlRExQOFQwTkhtNzBWZCtaRW5K?=
 =?utf-8?B?RE15dXpUSFpRM3JMSEVOU3VjSXIyQmNhZnkwR09SRUtjeGtNbzNicy9ESDJ0?=
 =?utf-8?B?N0RnK1p0SVpqSHdMTWJiNjdBKytaaWhTcmJOUS9YWWlicHVHT1g2eVFwam16?=
 =?utf-8?B?eERxOUtoMEc4dTlTY1czdDAzdU5GYy9pVnFHT3hCRldBWFlEUDJITVdtSWcy?=
 =?utf-8?B?V2o2dUtkTmFicEJwOHM5UVZvMjZFV0pEZVBOR2VseUtuSTBnM2wzVzJFU3hq?=
 =?utf-8?B?c0hPMG5wNXJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(41080700001); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VNRmxsNWhYV2h3NjBqajVINXFzN2xXb0M3ak9FcFhIeFpGQVNqMytkYjc0?=
 =?utf-8?B?eHZocTdlT1J2SzZKcU1ySFJKUmM5S29jY0dyMVFzN2M3SFdhdnVsMjF4WmtK?=
 =?utf-8?B?N2VmeEZENktqM2hNcFdJSmlwdGY2d0t3blc0Q09ITUw5dUtMenUrUG1mLzlP?=
 =?utf-8?B?dEFxQVhVc3VMcEYwcWxIdHdaOEpER1psUmR5eWlwMjJ0TGJaSlNiSlpINlhO?=
 =?utf-8?B?U0VhanRpRTEzQjJUMHdYeXZsUUlITFFKQXFneGx5YzVlWGpwNTdDZmlxcFZS?=
 =?utf-8?B?YngxNmNPNTBPUDNMaGhWSHlMSWlqME1UL2R0ZmJEOU9mTTh2QXhYY2F2Um5K?=
 =?utf-8?B?MHk3cEM2SU55dXNta0RERFF1eVJJZ1VPRDYzNWt6UDRNdnRJMzM3bTZTUDdJ?=
 =?utf-8?B?SlBZVlZ0dGxkQ0Jtay9uVnhpTnB1QWljb3YwQXpaUkoyYkpraFJ0ZmhWTW1K?=
 =?utf-8?B?OStzNnlXcEs3TElTS0RQMjY4a1BmKzNYVGhTN3R2U1VPTmVtUnAxeVBqamlH?=
 =?utf-8?B?QXNwQ3M1cmcwbkZLRUlZa05DVUdLQktKRktZMHFZQk9PcnBNdW5xZWllTWVR?=
 =?utf-8?B?MW9tK3JEbG14NFNKMWZmMDdVVENTVXNmRUJpZXNLSEp6TmV6emRpT0FsTkxB?=
 =?utf-8?B?NUxNZlp3NzZmTkQwa08rSXBOWmJzUmt1OHZGOUdBZHMvYTZjclRWRHIybkRG?=
 =?utf-8?B?ejVkUkhBOEtQSi9DS1RRQytRcDE2R1REalZWZTNDV2RlUzR3dUYvY1RidTNy?=
 =?utf-8?B?cDBVT2x3NmV2eEkvL3JmZExxcHgwS1h3blVWNHVaSHRPTGpKOHVsNGFsbERH?=
 =?utf-8?B?TmFFZS9UbjNhNjlTT2p0blRiK0tpbnhqQzUxRkIzMzRtclRuVWkxMDJMTVZJ?=
 =?utf-8?B?azEyN1IzRld6MkNKWTgyRHlDdEE5WkVjdTg3UkRka0kxbVF2cUF1MVRtaDFp?=
 =?utf-8?B?WEFXUTlEUDI3VlV6dGllaW1PK2hmVGtQUFBXSzE2emtLNDl2U2h4WUhvZ2lv?=
 =?utf-8?B?VHBMSUNMVzVQc1cyeXpCLzJzVEhOaCtkMkcwL2lDcXc2ekZZQXN6TEVzODRQ?=
 =?utf-8?B?Uy81cUhMMUMwbkh5aHBqY3R6Zm9OV0g0SzJGWHF3RUFXQUlwQ2xHL3VzeGxI?=
 =?utf-8?B?S1JFc0dQWUIxcWZzdXZ6Ly81bzRIZW5XSW1MeDB4SkdQZGRpOEdSeWk5eEpp?=
 =?utf-8?B?NVpjdVc4Qi9XOC93dXhFRFhBWEVYaTEwUyt3Q0lzWkZyS3RFQldWNEpMeFRo?=
 =?utf-8?B?Ky96Rk1UaTE0cW9jZkNSYTlTK0hlNDhxbkdHaXkzTEhjTU9wTUNRREpjU1RQ?=
 =?utf-8?B?dmgwR0U4dXVwVnJGQTRSYTBneFF2V25hMDhNbkV2Y2lvTWUyeEdUY1dCTmdD?=
 =?utf-8?B?RFBjU203Z0VvTUw3aGZyQ3lEN28vZmFkY0hOY29QUWZCVXI5ajJnOFR6ZGgx?=
 =?utf-8?B?STFxa0pHRlIrdzVhWEtWbWozUjNSVFpYVWEyaHlaQzFZcnFTNmllK0hwOGlt?=
 =?utf-8?B?N2orK2g4L0hEakdMZStwQlpJak9weXBxUkNFMjI1YnA1c1dZUzhtamp6ZTVl?=
 =?utf-8?B?Tm80TnVIV29rbXNZclZGekhkdXRCVEFseDRKSUpZYnNrMG01Z0g5ZktvWTl0?=
 =?utf-8?B?Ull1TmJpaHBtRnp4MVpvV3ZQUHdUWmtKWHdZVUVzZnpaSkNUU3Z6dDN3Y1Bq?=
 =?utf-8?B?SHl3R1I3TENFbTR3WTBYTVdGRnNkU0Y5K250YUJYVTFNaWxheHByL3BLc2VZ?=
 =?utf-8?B?MzNmYzNoclFteUhWL0ZhNlVuL2dNMWhvaUo5ZWF1enZMSlB0WVhMK1hZL21a?=
 =?utf-8?B?UkU4cGFqL1c3S1AzYmFYTm1tOElhODVUTUR2bFBRZGZ3Mittd0RXV2VsSDZG?=
 =?utf-8?B?Mit6N1NtNnorWTlyVDlmZThOQzhoMmx3RENJalRLVGxLZnRGTGJtMFB2WDZD?=
 =?utf-8?B?M0lnTG96cDVFZjRTSWN3Tld6QW9MSXhlbkhMeVNjdlJ2Qkk2b1IzNlp2bzhU?=
 =?utf-8?B?a2IzcTVKdFA0RjM2emdabC82cGdKMUpnL2hHRVNYZ1ZEcEozMnA0VDAvTmJi?=
 =?utf-8?B?SXNzeDNjVE5xWXZkN0k4Vk9rc0ZRY2ZuNmFjYTJVK1BIVXFCOE81ZHNpK1Vr?=
 =?utf-8?B?TUNuRXpnMVdlaC8wTFZYTElITGpJTDlPM1F2amYzT3VUYng0MGtscXJTMTFT?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: de233e1f-649c-4aa1-a365-08dd7b33ddcc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:08:06.0573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0iIAvZZkLUJrlqDflkfTPoSqQYbpa/ZblForkOp0BRmRLPnizHIdwgPfTjInTNGBTUE8H2rL0dEPXDQ4SNQI7T80Q7AF9/4WIk8xsuXjBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEFp4owdqn0tOmLNw4UiIr8IDwisO1QIce+WSsotdLU=;
 b=IthcTzmRDlpXUO959GhYwoMghTIZsZa5IZkfTNbNpxKxf3srGsdZMbUItrsfxsYuh+FzDl39861ptdqdyEM3478me9II+T+2jO6Q5ScTuFR82mUoSUXr7YtyuCMJud0AGgJf8b5re7pHm7OciLhJBO+jbHFzM875IvKD2ccatPQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=IthcTzmR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH RFC 0/2] add initial support for libcamera's
 qcam
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 4/10/25 3:54 PM, Peter Seiderer wrote:
> Hello Quentin,
> 
> On Tue, 08 Apr 2025 17:16:39 +0200, Quentin Schulz <foss+buildroot@0leil.net> wrote:
> 
>> This adds initial support for qcam example GUI from libcamera. It is
>> based on Qt6 and uses openGL.
>>
>> Sadly, the qt module from meson is currently broken (see first patch in
>> the series) and requires patching. Upstream isn't really happy with what
>> I suggested but I haven't understood what they don't like about it so
>> cannot currently suggest anything better, hence the RFC.
> 
> The following buildroot patch works for me (for the qcam case):
> 
> diff --git a/Makefile b/Makefile
> index 5bf5abfe3b..8787a9065f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -468,7 +468,7 @@ $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
>          ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
> 
>   # Quotes are needed for spaces and all in the original PATH content.
> -BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
> +BR_PATH = "$(HOST_DIR)/libexec:$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
> 
>   # Location of a file giving a big fat warning that output/target
>   # should not be used as the root filesystem.
> 

OK so this "works".

The issue is that meson still believes it's looking for a runtime 
dependency (though it finds the binaries and runs them on Buildroot host 
machine).

I guess this is possibly more acceptable for Buildroot (and in any case 
not exclusive with the meson patch) as /libexec stores binaries that 
could be executed? Though [1] says "internal binaries that are not 
intended to be executed directly by users or shell scripts".

[1] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html

> 
>>
>> While qcam currently renders the camera liveview, all characters of the
>> GUI are squares. I have enabled fontconfig and UTF-8 locales but after
>> building everything (though I dircleaned qt6base once), so not entirely
>> sure what's missing or if it's PEBKAC, hence the RFC. Though that may be
>> acceptable? Do not know. Would appreciate pointers on how to debug this
>> (assumed) font issue.
> 
> Font rendering (and video output from a cheap USB cam) seems to work with
> the following RPi4 defconfig (and additional 'dtoverlay=vc4-kms-v3d-pi4'):
> 
> BR2_arm=y
> BR2_cortex_a72=y
> BR2_ARM_FPU_NEON_VFPV4=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> BR2_PACKAGE_GLIBC_UTILS=y
> BR2_BINUTILS_VERSION_2_44_X=y
> BR2_GCC_VERSION_14_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_GDB_VERSION_16=y
> BR2_ENABLE_DEBUG=y
> BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_SYSTEM_DHCP="eth0"
> BR2_GENERATE_LOCALE="C en_US"
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
> BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_XZ=y
> BR2_PACKAGE_STRACE=y
> BR2_PACKAGE_DEJAVU=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_QT6BASE_GUI=y
> BR2_PACKAGE_QT6BASE_EGLFS=y
> BR2_PACKAGE_QT6BASE_DEFAULT_QPA="eglfs"
> BR2_PACKAGE_QT6BASE_FONTCONFIG=y
> BR2_PACKAGE_QT6BASE_HARFBUZZ=y
> BR2_PACKAGE_QT6BASE_GIF=y
> BR2_PACKAGE_QT6BASE_JPEG=y
> BR2_PACKAGE_QT6BASE_PNG=y
> BR2_PACKAGE_QT6BASE_WIDGETS=y
> BR2_PACKAGE_QT6BASE_NETWORK=y
> BR2_PACKAGE_RPI_FIRMWARE=y
> BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
> BR2_PACKAGE_LIBEXIF=y
> BR2_PACKAGE_TIFF=y
> BR2_PACKAGE_LIBV4L=y
> BR2_PACKAGE_LIBV4L_UTILS=y
> BR2_PACKAGE_LIBXKBCOMMON=y
> BR2_PACKAGE_LIBCAMERA=y
> BR2_PACKAGE_OPENSSH=y
> BR2_PACKAGE_BASH=y
> BR2_PACKAGE_SUDO=y
> BR2_PACKAGE_KMOD_TOOLS=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_HOST_KMOD_XZ=y
> BR2_PACKAGE_HOST_MTOOLS=y
> 
> The UTF-8 locale warning vanishes if I start qcam with
> 
> 	$ LANG=C.UTF-8 qcam
> 
> or
> 
> 	$ LANG=en_US.UTF-8 qcam
> 

Removed all the BSP parts and could generate a rootfs for my PX30 
Ringneck that displayed everything...

Looking into which exact package/symbol is actually required to make 
this work so I can add it as a dependency. Or... is that expected from 
the user to figure out what exactly is needed and compile the app with 
broken font-rendering (though working camera preview)?

Thanks for the hints,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
