Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9BC43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 13:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0943083227;
	Mon, 11 Jul 2022 13:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0943083227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJaJdQx0-9Kk; Mon, 11 Jul 2022 13:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE25831E3;
	Mon, 11 Jul 2022 13:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE25831E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 596851BF20F
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3177741705
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3177741705
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-y2G1PBSP8b for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 13:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 941C241701
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 941C241701
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 13:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqUFhpGoDyUcXVvsaRadFywzLPTWGgoe7ZvZK4R3xliDwaITtaFFCJ705MZ/ZEdaHD6bdXuxDQebSpWE/Cepd+6O+TNR33tsgneZ/qmHgNpIbL/1PjumrNXGESV6vXHuRutUizs7O+7tnFKLy/r/esvThnDiAoKO3/AeEOurUMKMl/jMJa+KUSgDMlBA77afA9cd3HuBtC5K1NCYoNDkCcgvD3K/iZzrkllMbdr3Zs7+pDCAJ49lG9FCc9oy9a/CTzdEu2XrIVSi49xBgzWfW3dBLiJWidsyCH0d7e2eB81CPSpJWqkCq8+Q8xKjzbCJooFsHWURn8FyhjEWZ7guTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hie/R4oImmNwtvWPHoC57u/7KmdYSkqN97K4JKA2iAI=;
 b=PPl/XFrralhE4D4V9agEA8JyZtXdIn0bZWKLBs4t6S4iWlsNXzfYJ1cbahzJlN3HEpQoKW3Zd//Xz9PQjEvoGjOqDO7mr4opeJ9EM3yykZRAvjfAYzhobri7u7o0Zqb1eedMlPSJDCSypbgvD6NS2JVaxRlmOi5G6F7zaxGoJvJwt2uv7vajmf4YdAZ2XX/76B9KPHG7dTlo7FSU7CeTNLWDx8BuBdjbuhER8PuH4XKgO0pcAkujrk1lceS1ct4YkaEVOkri+6sQoMbYFjGfewFTCYxRp9whyhrGrrPhgz0zRI0iTm0ygux71MZ6YoRo4jZfc8nnRi97FrWUw14UBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 13:11:33 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 13:11:33 +0000
Message-ID: <a2c47071-f64f-356e-31f2-4eecf7c3fb27@theobroma-systems.com>
Date: Mon, 11 Jul 2022 15:11:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
References: <20220711130054.110406-1-foss+buildroot@0leil.net>
 <CADvTj4rXHbym30M=8wypZSC6GeH++C-h1OHcd_7O44eWC+pUhw@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CADvTj4rXHbym30M=8wypZSC6GeH++C-h1OHcd_7O44eWC+pUhw@mail.gmail.com>
X-ClientProxiedBy: VI1PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::30) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3baa2237-a0c7-4367-e81a-08da633ee07c
X-MS-TrafficTypeDiagnostic: PAXPR04MB8366:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6t5J+a3utmRO5lXhhzw0vAqTeJaLrdwMTEgrCWEN+w9ENXj3u51PR4kN2jpRXUertRFdMcat5dA8kqtsiAL/n2UhXW/YsWqzPJTLKMDkmQeDLz22V5YaFWk7CYJ/W5sNEGjpsVx5mLKRvLTTDgFZdwa701xbhA1aYQXDpSEWU3ze4RzotdDmTUTsFejickqi61gfvAdTNJ7iSR4f2yBo4nUcGCVlaAerxX2jpSNfvc1I+N9ve6KTLlBvo/15DuAPKQCWw8RojVOdTc6YiSZoB6DZ5FqntmuRvj/nTGXhTCaPyzX3UKFMrSdJOGn3vAub118mu0wMNwiU7ftbDROZoMP0YundlA4MFGVzFdsCa9eETtFj1/2GTy6rlQP2xEp5FO6KFmhCF+Zh0MXatb6+zagj4ejRRgMjIyCEdkvLbrmHF9TEr2rOejCeiJuRu45CC8D8DPAk7T7ZUN0Z1YpYGp4DmL/4kFW3HDutworBTOOfjRrGg3Ct2K1yLNqpzASvQ25P7bAh/akQ6BV5RX6+HNc8EAzLn8yyVNUmTaSYC1J0cssz+bXTNarokISwzsVCsL44kr+BBjIw+u99+Xo9u355K6Q0RxIUJKdKWdOlQpM7+Zbx6Uj8gClkuFO2zyiJ91LaTWdXH/wgRhdylWfYm0eszvWbqwVcSoFqi65NihfX5SdijGNt+8SRL91IC3wUzWrKy51IoUpFTAh7nnCuAza4cOK/feXzPSQd0X5gHUWFrvPM+oaHlMcz7EN0xC45rqMwlSCvFjpH1HU4TQKocWRhEHrRy2IZb6AIX11e3dHzrPRNZ3peoSeeumuyeK56lDEMHpPca48/ojaJNtgbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(39850400004)(346002)(376002)(186003)(53546011)(66946007)(66476007)(66556008)(2616005)(6512007)(6506007)(31696002)(86362001)(478600001)(38100700002)(83380400001)(44832011)(6486002)(31686004)(110136005)(5660300002)(8936002)(54906003)(8676002)(36756003)(4326008)(2906002)(41300700001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVp5RWhsaGdwQ0RZcE5ZNkEwSHIweTliZkpJMUVlSUZadThGQjBxd3RaTkRH?=
 =?utf-8?B?blZmeWlmb2NVcEUwbXUzV0loZVpPKzlJbHN3T1k0eUdWWHVtU3k1UTVGc2ho?=
 =?utf-8?B?ZWE4QVAxS3JPQ2E1L05EcUpEbG1VOHJLdUx6WjNDaHNNR3M4MXJXbHZvekJ6?=
 =?utf-8?B?N2FjbE9QSm1lTVlIVTUyZyt2OFQveFl6Nm9JcGxKd3ZRbXFFZ3ZOS2xXSElt?=
 =?utf-8?B?eFpkb3M2SDNFR2o5SDROemRkY3ZKb2dkVWNDOUl5a200WWdUcVBhMUZ6T1Bn?=
 =?utf-8?B?ZzU4QVR0cUpTQzNXMjJHdXJwRzJJdFBhTzF2WE8rWTV4UXlOWDdpZUZoaGs1?=
 =?utf-8?B?UzU1eFBHWjBScnVyMmFqSDFnTkVTYmw2VHNjTWRKYTM5NDRSaEhDelZPQVNs?=
 =?utf-8?B?b0dDVUwwKzVSVTY2Tkwwb28yWEpjS1hya1BxU2xaSmFjbEN2NGhLN1UzeHlQ?=
 =?utf-8?B?NGJ2Ry83eFhZL001WVVIWjFORUFCY2FJNi81czM3K1VQNVFvZnBub0NOZEli?=
 =?utf-8?B?RGtHVnJySTY2cVJ6alJEQlRCV21jQ0toM1licjBlQWtSQXArc1lYNWpqOEdS?=
 =?utf-8?B?b3Fab2YvVjJYekZBSnljeUtJemVyc3ZPeW1QTlhGQ095a2ZZbnB6TVJiWENM?=
 =?utf-8?B?R3c1Rkt5M0RCQU02REYwbzRpYTlicGlUL0VZU25xd085dTNQclFPVlhTbE1Q?=
 =?utf-8?B?TG5DNmNZekJXWGpjM0kzN09tVW5xaldkdFFiTFlPV3NqU1ZvSXlzdDI1T0sr?=
 =?utf-8?B?d3VhR2xqRkw0WHFNL0tYa25IOGdVN0JSSEFRK3dnSTdZSWpIbDIwQ2ZuSjVP?=
 =?utf-8?B?NHo3YitCMklNMndyR05LaU9OQmpydGtMQWc2bEVjdjhZK1BlUW9QcklySllB?=
 =?utf-8?B?OXFGZWtYQ2l2S1JmbDdLNnVjZTFDV3RxQ3F6TTRQakthQ0l3aTVwNFN6SFFy?=
 =?utf-8?B?NTdRV1VBdHNNL3VGcXlFall1U1pibkRqd2tud0RqTnQzeW5KRlpWcy9ZS2VV?=
 =?utf-8?B?alByMDJ6Qk1OWVZwZkk0bGR3NjdEVDlBV0FBSzJDeHdOaE1kL0NWbkJIOFJT?=
 =?utf-8?B?MzcyVXVZZ1dRY2s3UHgyNUNvYXNBTnBpcVFaUjk2MFAvWHorTXhoWVQ3TCtw?=
 =?utf-8?B?eWUwdW8xcWJRZS9vbWlxK2x4NDlhdnBRaTBuTmMyZldFNmxTV2RuK3I5VTNS?=
 =?utf-8?B?TWRHSUVqVUhqaXBjcmRPcFZCR2xNbzlJR2xkMkhXME11R0ZCakR5aTBqOGQ2?=
 =?utf-8?B?UlJrM3R5QlduNWtUNSsrTitFVlRkVHdOWFdQR1YzZXlkR1I1K1U3Rnp6VllK?=
 =?utf-8?B?WUFjOWxySzdtUUNqQlhpaFc5Uk9Md2xsUlE3czIrcVdyeFZqdFhrK3h6WUxU?=
 =?utf-8?B?TE41Z1R4eVIwTWtvTzR5TU1XU2lpWFJES01waHR0M1RlWk9IaGRQcVhDbkI0?=
 =?utf-8?B?Wjg3OTZOQ3lyaUtJVzZEZWJBNGI1WHhlVkoxUEhmWm5qZUNBa0R5UkpVelJE?=
 =?utf-8?B?VlUvZCtJTE1hSitFRmp0N1BtdzlTT1gxWjFEeTU4S3V5RTBmbHdPU3RhbS91?=
 =?utf-8?B?TVFodFNzTWFLbkx1clVDbVRWQ1FEcVpIbzVibjN1YVdGZmpick5UcnVFNUky?=
 =?utf-8?B?dmlyM1puT1pNdGdsVStFYktHSHBGRUhwUysybEVEbTd0MmNsdjRCQlQ5dzR3?=
 =?utf-8?B?WU5nQUJUV1ZFZFFnbW1NbDdjUmVGbWZzLzBYeGl0NXhnUnp0cEQ2QVl0RFM4?=
 =?utf-8?B?THdOS3FNSW9TcDU2Mmx0SFprSEpuNVI2bGdxWUMra1RDdHpWUk90N2kxQVcr?=
 =?utf-8?B?MWtaVnk3eG9NR09LancwRGRXUWMwQkZuS1Eza2xsYjZIZG1pbGxKOVErbzdy?=
 =?utf-8?B?Y05vSXkzVjFvajBGeVRuY3lLTkJ3VUtDdEJ0RXVEeW5iNkRhcU1JSmJyTDdJ?=
 =?utf-8?B?bGEySHhPVU8vUGdTSEtFMFJNdUg2TVJvcTM3WW5ZcE55N2JwQm1TMG5QejJL?=
 =?utf-8?B?RUpwQ0I5dk9mS25xYWRTZm1welNIL2psV3hmYWwxWVQ1NFpFZDhOSWd0QSsz?=
 =?utf-8?B?emYyVkREZitKdEdhb2pqSnE4dXJxSXlUOHpLYytPUzN2QUtXdnZzanc5SU5Y?=
 =?utf-8?B?TU8vT3hidFJDdVJTQWRVWHdKejdaK1lSRHcxemg4SzFIcDZaV0FINnQ3RTRa?=
 =?utf-8?Q?XiX5hXdtBzz5eIYOXelqzU+cu6LvKQac9Qzwsu19ah9Z?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa2237-a0c7-4367-e81a-08da633ee07c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 13:11:33.2844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/p4U/ZpGj7v2o+8z4HynFVmNl5MOXJiW2blYfbi1plRx0jvnwLk9tnBX0//HqOSYWn8RVyljQEsxguMPaOLnOV3hryKq0Ly6/Bc4VaE+8L5WlbnLFm9nOFgla3+FZpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hie/R4oImmNwtvWPHoC57u/7KmdYSkqN97K4JKA2iAI=;
 b=MoPfWYYWVQtyAjjN0t39/sDhkxuoGiFXVn0EXZ/tXd7KUuB1aHF9+6joOmDDvzNEhJyGBP9AsrM4y9MN+H+uhF4oA7fsEs1VMDM+88NlC+EhLslYnWMD34tjpaQN5zUFG3t2tETGeTUsod3sjgvhCdUBp6uQBmH2Gh7UsUlTBNM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=MoPfWYYW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] package/libcamera: add explicit dependency
 on libevent if libevent package to be built
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 7/11/22 15:05, James Hilliard wrote:
> On Mon, Jul 11, 2022 at 7:01 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
>>
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> The cam application requires libevent. Since there's no Kconfig option
>> for it, cam building ability is checked by meson build system by default.
>>
>> If libevent is present in the sysroot, cam is built.
>>
>> The issue is that there's no explicit dependency on libevent in
>> libcamera package. This means that it is possible for libevent AND
>> libcamera to be built, but have libcamera be built before libevent.
>> Meaning that even if all requirements seem to be fulfilled, cam still
>> won't be enabled in some cases.
>>
>> This fixes the possible race by expliciting the dependency to libevent
>> if the libevent package is enabled. Otherwise, explicitly disable cam
>> building as it's already known that it isn't going to build.
>>
>> Cc: Quentin Schulz <foss+buildroot@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>   package/libcamera/libcamera.mk | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>> index 41d6a5abef..78243add18 100644
>> --- a/package/libcamera/libcamera.mk
>> +++ b/package/libcamera/libcamera.mk
>> @@ -84,6 +84,12 @@ else
>>   LIBCAMERA_CONF_OPTS += -Dqcam=disabled
>>   endif
>>
>> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
>> +LIBCAMERA_DEPENDENCIES += libevent
> 
> You should also explicitly add this as autodetection logic may
> otherwise mask errors:
> LIBCAMERA_CONF_OPTS += -Dcam=enabled
> 

Where do we draw the line between implicit enabling of build options and 
adding a proper Kconfig option? Because if the list of dependencies for 
cam increases, it'll get less and less obvious to the user how to enable 
cam support without reading the makefile of the package.

But adding this line to the makefile makes the maintainer's life easier 
as it'll fail to build next time there's an upgrade and cam has added 
dependencies. So that's already a win :)

Thanks,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
