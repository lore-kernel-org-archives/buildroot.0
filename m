Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E6BC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 16:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6A6040519;
	Wed, 24 Aug 2022 16:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A6040519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0onbEx-PxW2; Wed, 24 Aug 2022 16:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5F124053E;
	Wed, 24 Aug 2022 16:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5F124053E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2CE11BF5A6
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 16:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A94660FB9
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 16:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A94660FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JuTYHDqWhKJ for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 16:20:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628DB60BE9
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 628DB60BE9
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 16:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zm6kdSihwe81sfD/uJ71DAch/Ydj95v+vYHAhVwIWY987qM9UanR+xFcfCD2RkiRSf7+NeXMxtU2ITwm7NIehCnDk7VGZGNd1WmlmpHpiNCJ5B+KJdlInPXiFboGy1QTgmBUeWt++TkRLJvqQyNPs5HNrn9NG9Y/W6K6vkPdOqhdLDE+doJAWPYEXPENiBxolzsii8Fc3E6QRVz07vGtzoQLbsGjz8pui8Rb8Z3PFy3h36Lkxr+0q/NvAEg0sZpq4pqUdB4EyZguX8SugotztZ3md3qj0qoFNK2+pJV3XSByIvNpAwY/O26pzTJmJONf7E0A8oIvXBLVQbHDLwX4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjT9st6gcRljHtmUEYw1aruzDc6NMpv6KMqVBTovKv0=;
 b=l/X7H7wh9EVJyh4F9wkGnKrkfYGa/Y0aP/WqBhJBSIhWXA5cZepr8dShFIbk7Y8TT7HBTwUpDTndsLBlCdU6G3McWUjxW5Kg8G3os2P0c2kY8ucML1L2cCI+E2ZZiBz4FIPSA/fbXGQy9Mm7Qw4XLsIBvbRGq8KARHGgrnfNBOsDSfMEAKd4RAa64iu8pBYgO2+29IPBtWhK5Oi1bEXx2SAe0ci0ntDmJX0NqE1Y8Udq2qqK9bDlO7IVJFWEpoHUbMAX0/2NfauHmZ8+ljg94hY53VQaaxCwx/r9r6lUj/RwpmYC/Kalq+dr4qbcMzyq+bBDyYoVkCiS4l6BSSslrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB6PR04MB3269.eurprd04.prod.outlook.com (2603:10a6:6:7::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.21; Wed, 24 Aug 2022 16:20:29 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 16:20:28 +0000
Message-ID: <f882f86c-31f2-55b4-e3f4-9a64e93bd0e9@theobroma-systems.com>
Date: Wed, 24 Aug 2022 18:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry GUIBERT <thierry.guibert@free.fr>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220823164040.GH2167049@scaer>
X-ClientProxiedBy: AS9PR06CA0657.eurprd06.prod.outlook.com
 (2603:10a6:20b:46f::29) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e78ea08-610a-4b63-8986-08da85ec8f3a
X-MS-TrafficTypeDiagnostic: DB6PR04MB3269:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ie/O43HnXZNNIilCoJtEBXhZiayApNxWhMFxVkefOiFHHlESBJxAeTiuo2Pp4u13dTOWGvuwh3drSa/deT9gw84A7SAOGYSuCYrrYXyfzYYoOvnaC+o7blOouG3iS/lmZGMLkHt+IiE30lX0KqXWKtZfsxFIB+FR97lsS6lqgzFvfzR/Fh7WXczPJyPnwdTakzERCVz3xkA29OxOkJ5RdFbCM9iii1N9Pff9D97Z4cqGOpbI+fAjPVLQQ0EujHMBNtDNiiEI4me/zt7Dsn+kdN+V3Z/c44uJ/xwMT9kCicxxBeBbh+8f+YfRLhWxlDDpwA+GEIQyn4uspt+GJF6Nh0j3PdPTLNSSQIynqFnfk20btrS8su+8D7UCZfN+kL+aAWbt7/mqlg7y+TBr04kkziRCwxdjztF9bohgYjRJgtjTIu3YR7n4drPzGy0ZNsLv9TfAbB/bcur0I+7Hwxq8pQqFo8HeXdI9kVuJn4grIsn75eo6HuTTAC4o/ueNaGM9kEspKzZA2Wr14ZhIFIQ0DodgncUlEFYTKCEJ8SYB9/hjKwW5AO+9csgA1nNcJsR82gwb79hQbPhAO2niqm6dyLOczXqqCD6DhTTmF8WwDlE22NJcneEUKKn7Eq7pwuhuJY6b29/p9RaHxiZoW0Yndkx10iIsDTKLkdY5zOr2LVNBomXM81WB27n9U9gZyArJDVyAzkz6xy8ErUFUyVEm+BXpyGOTqctlBO2WSTaV+iL5LgHOM0Hj4yFtwzMnxUyRNONziHI3dQX/wAIEQShcxocYxmd5omqJ6uFsxLucdVFOyD/iVwAvQRzHJ2HZa7Oy8CBdLwYT+4wnF2jBfSBor4gPsW2iWkzKPVXsjCPYeGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(346002)(39840400004)(136003)(41300700001)(8676002)(6486002)(316002)(966005)(38100700002)(110136005)(4326008)(478600001)(4744005)(8936002)(66946007)(66476007)(186003)(66556008)(83380400001)(44832011)(6512007)(6506007)(86362001)(31686004)(26005)(31696002)(2906002)(36756003)(5660300002)(53546011)(2616005)(43740500002)(45980500001)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhQV29ubm1oaGREVm4xVmN2QmlDcmJlSzNNdm5ENmw4SkI3OUdLcmp1ZTQ3?=
 =?utf-8?B?Vk12RWE5RE1JRnZQQTBNbjFZY3RYRncweFhUbE1NelhVYlRxaTVFTTA2YzVJ?=
 =?utf-8?B?ckN5ZWIwUEh3blN0dHNYOUJnTmZseGgxSUJibndid0lXTERka1FPY0QzS2VV?=
 =?utf-8?B?VnpheFVUcjZmeTJjV0dsd0Fpd1JZaW1jbElFTjluMGcxK3lOV3dEYm5uZm1m?=
 =?utf-8?B?dC90NUxLczFYUWNTRmZ2U2xScGlQVUs0bjVqS2w0b21kNVBZbkVOaDVPUlNV?=
 =?utf-8?B?NjJDdzF3NEZ6K0l1OEErZGlITWU3YzlFdmFHaTRBNkdOTXZ6REptSENraGw0?=
 =?utf-8?B?Sjg1dDhyanY0Zm1tSXE1OCsxam0yTmdaaUs0dS80L2wrT1ltVWRFUE1KUkdJ?=
 =?utf-8?B?cXoyeXNLV1krT3RNRnAxUWtpK2NjbjNGUXE2cVhCbmUvdE9CUEVYTnd2emta?=
 =?utf-8?B?QjBVZzc4cDRtUUdkM0QwOUJ2Yzk5aGl2WFpWUUFXS0tuSXBvZUJUTC9hWXh4?=
 =?utf-8?B?aEVRT0lnWkdtODFGc0ZWYmJWbE5nZ2Z4bW4rMzM5MEN3Y0hxVm05cElrMWlj?=
 =?utf-8?B?TTdrSXExOG5DL3pxbDZxdmhTVzdYWGVUVkJQNnJFR1pWOWVoZmhMb2lkYVI0?=
 =?utf-8?B?TE0rYmkxV2E1VFZEdGNWWHU0ZExpYzIvb0ZGWkJaR2h1L2dWdVpzUzZ6ajRt?=
 =?utf-8?B?dklaNE55MFBra1d1WWtTZmw5WjRFVlVLTWZtOGVhM0JWcHlQOGR4OVN4dVRT?=
 =?utf-8?B?ckFTQzhFTDhsRWd0WGx2WGpuTm1kVFppczQ3aiszY3FnWVRYbHh0Z2NlYk1k?=
 =?utf-8?B?K2dlc2FXSEtSRWlZYzBkdFVocmY2YWt2dDNTTFV2UzUvSkpRWUNoMWlCTHBt?=
 =?utf-8?B?cCs0R1k4UGJUbmx0TThUM1JtZjRMWmNMMG9VbEN4WUtjTVBhMXpqcUMrSmlP?=
 =?utf-8?B?K21XQWY5TFFHRFYrTS9jL0RsTnFUazc3Wlp3Nm5YQXY5cW8rM05ZcGczS0tV?=
 =?utf-8?B?SklMMVVPZnBRQ1NFeEM1MkM2emVaa1Q5bXJsK3V5V3JmaHQ0QTdWWmo5cmEw?=
 =?utf-8?B?VnNxSWFwV0h0cGI4OUxld0Z6M0dTRjMvV2RKaC92Q0RiazJQemFxNUN2MUFD?=
 =?utf-8?B?NTJWZitKQ1Y4Q2FMTTJMcTB2M2g1SlMyMU1QbjNNTGovanMxN3RJaTNhdUxo?=
 =?utf-8?B?U0ZUYWtGU3A5bFlhVURrWTVjRTJMK2tkQklmdjFVN2d2Z3dPbm54RUdnNU9q?=
 =?utf-8?B?QmozcHRCZStOYjZPRHNIUEoxY2YvdHNucGZiUEtVMENhVWpNOWl0cUhZa3Ra?=
 =?utf-8?B?SURzb0QxNXVlN3B1a00ySXlYY2JVbVBmbUlMdGtIVU1sU2ZJdUxlc24vcDRZ?=
 =?utf-8?B?UmpMckJSdFRHaiszQTFuc29DeTFxTTFlSVdEaVhpdGI0blc0Q2c3Zy9pcFQx?=
 =?utf-8?B?N1poM1B5RTlzbmVmU0NhUnVmWnlKenI5Qjh0REV5dWJEM1ZvZWREMk5wNmVa?=
 =?utf-8?B?ZjM2cnhna1RHSEVrN2pRN24yZmxQd3RmZDVVU3pidCttWm43c085L01WMjE5?=
 =?utf-8?B?OWVseVNMWEljUVdhcVk1amxOR2pjNjhzNis3YnFXUnJvKzVzOGxRbjZyOWhJ?=
 =?utf-8?B?Rk1kRFR1ekw5SXh3NjFEZHRaMVAxQ3kzQlphKytuWHZmbmpJSzhJUmh3TC9P?=
 =?utf-8?B?VlY2Yzd1Rk9naEpuSlNoTmxQWGtseWduMWsxc3NFYmcyU002aVk5KzF2K2Vl?=
 =?utf-8?B?cis4SW9qUkV5NSswRHp6K3J1QkI1a0R6d0R5R0NPSGx4bWFscW1UenF0ZHQ1?=
 =?utf-8?B?QUJFRVVxWXQyaGtBN0ZVU0RtRyt2cUZuY3NVeXBRcnFZalluOWVvTEp2dC82?=
 =?utf-8?B?QjFnZHEzWTdXSVFwNCsvcTJHSlQyUWdrSHUwUXRHMHRuSFNERG15M3dLMlFO?=
 =?utf-8?B?QlpQM0o1VDVxdkwydDJPTmtrZFNiMENGa0dydE4vcG5yT0FFZk5DWmV6WnND?=
 =?utf-8?B?YUIwb0NSVlVjVzhQamIwWUJZWlJ3R0xVVythMkd4SU40Qmk1T2g5K2twdnR2?=
 =?utf-8?B?Zmc0YzZTNWxTL2ZjSTcwc2JJWkFxUTNNK3pDL0M3WW9CeTNoSEo2V0pveDBJ?=
 =?utf-8?B?ZWFJcUptbkJuV0lxbStESUZNay9MUDZKUmdLa1IxUHpOK3ByTWZSdTR1M1px?=
 =?utf-8?Q?M4ocSukglMAZ35xlcugM6ww=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e78ea08-610a-4b63-8986-08da85ec8f3a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 16:20:28.9194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+7jlPvvoOeheMkiA56BdMsUzyPBsf9SUy3CKar1mybSA5jgWgcwdpM4T5zCR7ccTSQXRCaJ8K846DG+eSMvzWB8bx64gLyyD72hfKWuznS01hKdWSY3Rp3+P320hKbG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjT9st6gcRljHtmUEYw1aruzDc6NMpv6KMqVBTovKv0=;
 b=X2M4pY7dve1PzgFBZ2Qima9fXF791ZdeQv8b1cPhpseeDrqHZ0s8NeHOL2rdHFCVVNuoKwaATVE1M68zaf94oL/2/Uln05/xF10vbupSr7GcL6uE1v1oY+dlTmjOkODZ1oVoBKO/Ei5ANv8CnFv4PD+3+l4EsijfH/4vtm07xi4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=X2M4pY7d
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 8/23/22 18:40, Yann E. MORIN wrote:
> Thierry, All,
> 
> On 2022-08-23 15:13 +0200, Thierry GUIBERT spake thusly:
>> I'm using buildroot to build raspberry pi rootfs for the french red cross.
> 
> A noble endeavour, thank you!
> 
>> Is there any reason for buildroot/base:20220206.1756 not to be published in
>> the docker hub ?
> 
> The rationale behind our docker image, is to be able to run our own CI
> jobs, that runs in gitlab-CI. Since Docker hub now limits the number of
> downloads permonth per image (on fre etier), the CI was very often

Could Buildroot fit the Docker Open Source Program criteria by any 
chance? https://www.docker.com/community/open-source/application/

That would remove those limitations.

If that is not possible or not wanted by the project, I guess that 
pushing to hub.docker.com but have the Overview page state that this is 
pull-limited and recommend using the gitlab registry instead? 
https://hub.docker.com/r/buildroot/base

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
