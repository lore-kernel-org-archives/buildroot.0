Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD1FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 09:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE2160BFB;
	Fri,  6 May 2022 09:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeE9zAT7VeEb; Fri,  6 May 2022 09:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5197660AA0;
	Fri,  6 May 2022 09:25:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69E4E1BF575
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 09:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5707541910
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 09:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLvX91E3qSv5 for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 09:25:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B726418DE
 for <buildroot@buildroot.org>; Fri,  6 May 2022 09:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdwJuvHOggsshfo8ybr+w5qVw5pVMwH5qang1s5Vv0X5vlMtHSmXgqdhinpHXbpSyTh955UIYq9Y4HAoQHi1iO9lO59ryhjT/7lQtHD3gqDHZFRw0+EzRRJWrpSbjDS2wHMHRkw8kiT55/NZbU+3m60UT50L+rR1DWDsYOXu03raJ9FFMqQ/xUXH9augtOUM6NNjWq+CP1X+cKkpIjyIYyZfJCJZZ3vgPjQ77JTv8FjOp5IN41g52XGI5s9WvTyGy7d8ISvaUsgReSuKIYf6OQlnOlnvImx/bWZCwE8+NS31zOo4yMxcrClWsMtn+G53QFsRVmBc/9bg/KjFl6xE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTJq3hcviYQAOKiN9jHqQaZ+nSBPmBqrnIr+ROvW/N8=;
 b=f79FQVvLSUMaO7QNOjQdLpmRXwdF8pFeBiYmeKA9OhKJOHixCERqfr4P5jwYtHgNeZnXmPatFNUrCenOWkhvJjd3L1sd39+hViwn8JwI2L/hF2+DbsSm7s4InNJZgsfmal8XwBB7m1G/21F1f64b6a4HLELmIUB/eCYskPEqKyx3z40Z6yOckdtXtyEes+xSw0lhPIq7MhFaaNVw02HJN5w/GBXNln4KtTWVEMYw5DkFngGuzcm4h19qBQB5ZFWVB+dScv22XeG7JaVjUlPAZPEuvR341v9KBsR21xXqkyhCrMM982m8CzlwUdPHuW6z6jM8h1m+o2DiycoSjRvi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTJq3hcviYQAOKiN9jHqQaZ+nSBPmBqrnIr+ROvW/N8=;
 b=TtpvvX7irzHVXWFB4rbLQMZQLFahuVxfiqrDcZ0W1knY1YtJZEHmYzpJLQT1+HdJKBQYNpoTIxQM7YFSJ3CpjqsojaxJBatpoHIs83gSbq7raRC5aUi+TUOK32auVCABHcGV4OiF2QBwaHeraTa43UXQECcN11o8X4v2jnyx+Qg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 09:24:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb%5]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 09:24:54 +0000
Message-ID: <3c4db24e-541a-a10e-0821-f4e87ef034bf@theobroma-systems.com>
Date: Fri, 6 May 2022 11:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220505120138.493950-1-foss+buildroot@0leil.net>
 <c30dd1d2-4087-edb4-6f62-ffe8d213a48c@mind.be>
 <c02e5e65-9bdf-f13f-d152-e3a1c800277c@theobroma-systems.com>
 <165182787021.1423360.10913459195965786963@Monstersaurus>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <165182787021.1423360.10913459195965786963@Monstersaurus>
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29201386-b974-4139-7d03-08da2f42478b
X-MS-TrafficTypeDiagnostic: DBBPR04MB7675:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB76755868754507AED8885490C2C59@DBBPR04MB7675.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41udCbehF5B0rE4CvlpAk6vNVI98KcAkM3ybUnDybg6T8L/5qy4SL42Q5S8wMK177eXcT1GjKV1ArD8cLJ7poQOdC5KpX93kFCwmY1G96+AjE/pIJpNFaRgQKyjoxp+X0+pSjHxzFAj1nYBfPz7Lpz9Da21AiepEvEddzd5f1hutFItcDIB9kUFCl6uQPRPIK/nhjZ2+RdWfQPRMXPFMnq7fUZPCAjOpi/AQgRuuJ6xlZ7h8bwSwU2FgEJdDASLVXok8Rp2/N7Uzix6n/N7CCJhub0E1Mp/E9IBgXhb8INDB1teGxAQ25+SNMECSBP+5rm82pNjWMO6aRWpp0+YqTZeLlDT4PEay4q5u/uPcLKKpAByiI2Ufon+InhkQlDRxQgCUv/4ttnkKiwuhYNxvmV8Gjzij48X9x+TMvx8WhvYxkkHss0eYA5fu9dOWyBJyHfR78lUAUK8/g5ZtduQe+da9mQdvP/UNsja2Zy0dgtiqhts9n9aF9lAOnzws4USbTZ1jFuQTshUTP9pYfTjwjv1FwnqsF0dm18/V3C+DpinMWzKczE4hLe0LiCtLiFK4RXHM2EjXd6PMrJFn9ED0B4H8pSOVmcFJB4lsHWQ6nEqrPZRyAVgHn6nkfrU4jNlnVdn2Oz6cKqP3rOYmUSvuXJ3V8ja/uZivCYspzqTjMI1YeI26B1eRc89JfmC53QCOclrjQZB6PYzZg3EXSGIjHlwPW2ko+EXtN9U39wqJVgVmIEcPN8RDUEoWT7fJhCa6A/0tnjKGI6CMJ20jki0ajSZLLaORCwfGYW0BoNTpKGPPndV7OwN9XdQ1/5AcUf7z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2616005)(31696002)(6486002)(966005)(508600001)(186003)(36756003)(86362001)(31686004)(44832011)(38100700002)(66556008)(66946007)(66476007)(5660300002)(110136005)(8676002)(316002)(2906002)(83380400001)(6506007)(53546011)(4326008)(8936002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2FiYXgxUWMxZXRpVTN4ZVFyU04xUFR0RW1IVlZaamlreXhDaHoxZUw5Mmdl?=
 =?utf-8?B?bVR6QUxkc3F6QTZMSE8wMUVLNzF5d3h0SUhIQ2VUSU1DYm1naHhrOVp0UmlO?=
 =?utf-8?B?K1kvQ1lJdnBxZ3ZnMFByWWpDaTY4aHpYQldFS1dnbmw2UjRubmp1Kzl3Sms3?=
 =?utf-8?B?SXJWU1l2QW5ENDhsNnJxc0JXUTF3YVdrbXZSWUFWNTcyQkNSYnBnV1J5cVdR?=
 =?utf-8?B?cmpsMXAvcTg3aDRwcERuZUt1eHBlTUlsTkF5Rit3MUJFUUQxeUp6WWVoTkdB?=
 =?utf-8?B?amhHVWsreTdSSUlzeW1ic0lFMjBvTUxkbzcwcVNGWE9YUmQ1WEtOQVVlMlB0?=
 =?utf-8?B?WkR3ejhoVHgyY0pQR3ZQYmxteEFOZEpZTDVvSjVTcXB1K3J6YTJ6c2ZybEpY?=
 =?utf-8?B?SVhDTk01aytSRVpSelF6Tms4VnQ1K3RrTVlRWFJvMkpYL3hjMGpScmc1M2Vk?=
 =?utf-8?B?WEJvMWtsUXQ5bjVuZStqckZuY1FxY1d6eWhubHpVQ3ovZE0wcm9vZUJFTXha?=
 =?utf-8?B?bDlkN2d5Y3JEVGVibUdkbWNRQmhKbm5SaVBLRUhUQVhUYzNUZTJ5ZVM5RWhE?=
 =?utf-8?B?NEhlN0xDSHVlT3Znb3dtOUR1dHpwdmJKaHVReVZ5MnFUSExIb3pOVWsrZXZn?=
 =?utf-8?B?Ym5IOGtNRG9WbkpDSkRyMVliRUErNmlXaHh0YkxVR29rOW10UEx2ZW80K2s4?=
 =?utf-8?B?UFNKZ0NvcUt1ZmJXSVAyWEUyMm5SNzFDSmlqUlBjQk1SUTlxemR1VHhrWnNX?=
 =?utf-8?B?ZHAzYmtPU3BROXpUMGRkSE9mY2htMVZ1dkFjNUtxL21Tc2p4QkhibXNjWWVI?=
 =?utf-8?B?cW0vcmpkV0lrdHpsZGVtSmNrRmlEL2JuZm53cFUwSG0veC8wb3IyUlBWSFdp?=
 =?utf-8?B?SmNXV2FxbFpEaDB3dFJnc0RGTXROMjN4V0dLdTBleWlPb1ZucGx4RDh3UVlK?=
 =?utf-8?B?eFN0M1p4cnN4ZHN2Rm0zOXJoY2xuWm52ek9xbEphdXl1NVZzQkQrR1VFS2cw?=
 =?utf-8?B?dlUramdpWXA2WEExMzJmcmhBVG5PK2sxa1RXaXIrWkttMU5YL2J2VjYzZE81?=
 =?utf-8?B?eWlBZXVjMXJCRXg3aVhjblpoN1BXM1o5Vzdpc3p2UXk5TGFxbXlZY0ZEcEQ0?=
 =?utf-8?B?SWpLWFN2bzVWdVFYc3hyL3JxcGJxYUlqNjlQS1hBT0UvNmw0OThrV0tkTk1F?=
 =?utf-8?B?YVE0NStNd1dnSmg3czd5QUlSeUdRc2FNNFlkeERhY2tTNXlIdEVZZEhoSC9r?=
 =?utf-8?B?L3BHekpWOUpQbXNMbGQ4Yk9ZNmd4UWFlR2JoUGhvek9DMzVyZDJOeC9Md0to?=
 =?utf-8?B?MjhPQnVqT0IvK1FwU0h5L3dxdkM4QXNZZ2FVWGp3a1NLL1Y5VTdPek43T2dD?=
 =?utf-8?B?dmRieDF5V0tRU2ZqWFNQcnpvWFBkei9Lam1UQXJFMk1uRTBxRE1ocmtoQi82?=
 =?utf-8?B?WE9qVGtONUNib2xvdzdpVUpwMTNCRXlPeEZTMkNCUVhTcklSSElyOTNlM29Y?=
 =?utf-8?B?cXlFbVRLM1l0OXJYd0xqSXdqSHV1UFllQW5MdjNnWithV2lvbGhTSm03RFdV?=
 =?utf-8?B?L1p0QkJveURZbUZNeStaRzJvdmNEQlE2dTNJTWRVRVlaV1JPM3lDcGNoS0Iw?=
 =?utf-8?B?ckQ0TzdUTktVTXBwVGJNZ3NIaHl1WWhveERkYTdVWXJKay83NDU3c3JyZFFa?=
 =?utf-8?B?Zm9HZ25xMlZpNXE2QVV1czhVZExDVjF3ODZPZlhoZm1NYkpKVzgyYk5DOFhw?=
 =?utf-8?B?UEpyMFVzcERscUlnZE1zVDRCK2IxakFHQVBRM2sxZHVVc1FWK2VKamR2Tyth?=
 =?utf-8?B?dGJiQ3Y1UzV5aHRLUHZhQ2lZY3NxT0F2VHVJc0ZueE1ScFpkV3hPTFhUU3lL?=
 =?utf-8?B?YmRsRXhoRnlBMUZ6dTlPVXlKWU1FS0F1SGJGcjA4T1BOd0pCdEl6eGhSV3BI?=
 =?utf-8?B?NXdHTVJmVWltK09wZTlmdVJlK0graGdueE9idlNQRHVGeDViaTlOYWNpMGZr?=
 =?utf-8?B?US9oSmg0WFZCMmgyZ1BqaHdseTRzYkNLOUNoMy9IdFhDekNaTU00azdKaWsx?=
 =?utf-8?B?UFNGdUpaRmtDTjN4TDE1Nkp4bTlKZGxzM1F0VHpHaWxHOXU1YzVHR2pKZlBL?=
 =?utf-8?B?VkVwT09wUGFBbHVpODdnbHF2Q1NGZ0Mxb2ovSGhMbzBDTnNiZEV5Y1V1SlVX?=
 =?utf-8?B?cFFqQ1FBcFBySjNWZGNsKytKNE5CKzhvU3laSnlnOXhQMFM5WGdKQldJK1BM?=
 =?utf-8?B?SUExTnVBYlhoL3lGcDh0ZzE0NlB3cWpZYkZIZUhwRXc5QlFDVjdQdFJnaVFS?=
 =?utf-8?B?QVFVQUlqUjVhUEluYzFSeHllMTRaRTVERklOMzRBRFVacXNxVTdXZ1ZFTklT?=
 =?utf-8?Q?RkKZ92Ggr34wbq9y+5hmhqY/cqv+aKGcVwmwe?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29201386-b974-4139-7d03-08da2f42478b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 09:24:54.3194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFFEqVCB8rSpKHpn2UCQYBR91mQnJSOjI3I2v1A2Lmc3gt6+B0VprLYLwC0tFlSCG8iyod5IU1sYDg1s6EpKE7w1OqGOw/EHZ0IhEINJMNiVYJo3hA7qMqh4tp2cmBFa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675
Subject: Re: [Buildroot] [RFC PATCH] package/libcamera: remove rpath and
 strip debug symbols before signing IPA libs
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgS2llcmFuLAoKT24gNS82LzIyIDExOjA0LCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKPiBRdW90
aW5nIFF1ZW50aW4gU2NodWx6ICgyMDIyLTA1LTA2IDA5OjU2OjM2KQo+PiBIaSBBcm5vdXQsCj4+
Cj4+IE9uIDUvNS8yMiAyMjo1NywgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+PiAgIMKg
SGkgUXVlbnRpbiwKPj4+Cj4+PiBPbiAwNS8wNS8yMDIyIDE0OjAxLCBRdWVudGluIFNjaHVseiB3
cm90ZToKPj4+PiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21h
LXN5c3RlbXMuY29tPgo+Pj4+Cj4+Pj4gT3Blbi1Tb3VyY2UgSVBBIHNobGlicyBuZWVkIHRvIGJl
IHNpZ25lZCBpbiBvcmRlciB0byBiZSBydW5uYWJsZSB3aXRoaW4KPj4+PiB0aGUgc2FtZSBwcm9j
ZXNzLCBvdGhlcndpc2UgdGhleSBhcmUgZGVlbWVkIENsb3NlZC1Tb3VyY2UgYW5kIHJ1biBpbgo+
Pj4+IGFub3RoZXIgcHJvY2VzcyBhbmQgY29tbXVuaWNhdGUgb3ZlciBJUEMuCj4+Pj4gQnVpbGRy
b290IHN0cmlwcyBkZWJ1ZyBzeW1ib2xzIGFuZCBzYW5pdGl6ZXMgUlBBVEggaW4gYSBwb3N0IGJ1
aWxkCj4+Pj4gcHJvY2Vzcy4gV2UgbmVlZCB0byBkbyB0aGUgc2FtZSBiZWZvcmUgc2lnbmluZyB0
aGUgSVBBIHNobGlicyBvdGhlcndpc2UKPj4+PiB0aGUgc2lnbmF0dXJlIHdvbid0IG1hdGNoIHRo
ZSBzaGxpYiBvbiB0aGUgcm9vdGZzLgo+Pj4+Cj4+Pj4gbWVzb24gZ2V0cyByaWQgb2YgcnBhdGgg
d2hpbGUgaW5zdGFsbGluZyBzbyB3ZSBkb24ndCBuZWVkIHRvIGRvIGl0Cj4+Pj4gbWFudWFsbHku
Cj4+Pj4gSG93ZXZlciB0aGUgc2lnbmluZyBwcm9jZXNzIGlzIGFsc28gcGFydCBvZiB0aGUgbWVz
b24gaW5zdGFsbCB0YXJnZXQsIHNvCj4+Pj4gd2UgaGF2ZSBhIGNoaWNrZW4gYW5kIHRoZSBlZ2cg
cHJvYmxlbS4gTGV0J3MgaW5zdGFsbCB0aGUgbGlicyBpbiB0aGUKPj4+PiB0YXJnZXQgZGlyZWN0
b3J5IChhbmQgZG8gYSB1c2VsZXNzIHNpZ25pbmcpIHRvIGdldCByaWQgb2YgcnBhdGgsIHRoZW4K
Pj4+PiBzdHJpcCBkZWJ1ZyBzeW1ib2xzIHRoZSBzYW1lIHdheSBCdWlsZHJvb3QgZG9lcyBpbiBw
b3N0IGJ1aWxkIHN0ZXAsIHRoZW4KPj4+PiByZS1zaWduIHNobGlicyBkaXJlY3RseSBpbiBUQVJH
RVRfRElSIHdpdGggc2lnbmluZyBzY3JpcHQgZnJvbQo+Pj4+IGxpYmNhbWVyYS4KPj4+Pgo+Pj4+
IENjOiBRdWVudGluIFNjaHVseiA8Zm9zcytidWlsZHJvb3RAMGxlaWwubmV0Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekB0aGVvYnJvbWEtc3lzdGVt
cy5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgIHBhY2thZ2UvbGliY2FtZXJhL2xpYmNhbWVyYS5tayB8
IDIxICsrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliY2FtZXJhL2xpYmNh
bWVyYS5tawo+Pj4+IGIvcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rCj4+Pj4gaW5kZXgg
NzczODFhYjNjYS4uZDEzMDNhMmZmNSAxMDA2NDQKPj4+PiAtLS0gYS9wYWNrYWdlL2xpYmNhbWVy
YS9saWJjYW1lcmEubWsKPj4+PiArKysgYi9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsK
Pj4+PiBAQCAtMTA0LDQgKzEwNCwyNSBAQCBMSUJDQU1FUkFfREVQRU5ERU5DSUVTICs9IGxpYmV4
ZWNpbmZvCj4+Pj4gIMKgIExJQkNBTUVSQV9MREZMQUdTID0gJChUQVJHRVRfTERGTEFHUykgLWxl
eGVjaW5mbwo+Pj4+ICDCoCBlbmRpZgo+Pj4+ICsjIE9wZW4tU291cmNlIElQQSBzaGxpYnMgbmVl
ZCB0byBiZSBzaWduZWQgaW4gb3JkZXIgdG8gYmUgcnVubmFibGUKPj4+PiB3aXRoaW4gdGhlCj4+
Pj4gKyMgc2FtZSBwcm9jZXNzLCBvdGhlcndpc2UgdGhleSBhcmUgZGVlbWVkIENsb3NlZC1Tb3Vy
Y2UgYW5kIHJ1biBpbgo+Pj4+IGFub3RoZXIKPj4+PiArIyBwcm9jZXNzIGFuZCBjb21tdW5pY2F0
ZSBvdmVyIElQQy4KPj4+PiArIyBCdWlsZHJvb3Qgc3RyaXBzIGRlYnVnIHN5bWJvbHMgYW5kIHNh
bml0aXplcyBSUEFUSCBpbiBhIHBvc3QgYnVpbGQKPj4+PiBwcm9jZXNzLiBXZQo+Pj4+ICsjIG5l
ZWQgdG8gZG8gdGhlIHNhbWUgYmVmb3JlIHNpZ25pbmcgdGhlIElQQSBzaGxpYnMgb3RoZXJ3aXNl
IHRoZQo+Pj4+IHNpZ25hdHVyZQo+Pj4+ICsjIHdvbid0IG1hdGNoIHRoZSBzaGxpYiBvbiB0aGUg
cm9vdGZzLgo+Pj4+ICsjCj4+Pj4gKyMgbWVzb24gZ2V0cyByaWQgb2YgcnBhdGggd2hpbGUgaW5z
dGFsbGluZyBzbyB3ZSBkb24ndCBuZWVkIHRvIGRvIGl0Cj4+Pj4gbWFudWFsbHkuCj4+Pj4gKyMg
SG93ZXZlciB0aGUgc2lnbmluZyBwcm9jZXNzIGlzIGFsc28gcGFydCBvZiB0aGUgbWVzb24gaW5z
dGFsbAo+Pj4+IHRhcmdldCwgc28gd2UKPj4+PiArIyBoYXZlIGEgY2hpY2tlbiBhbmQgdGhlIGVn
ZyBwcm9ibGVtLiBMZXQncyBpbnN0YWxsIHRoZSBsaWJzIGluIHRoZQo+Pj4+IHRhcmdldAo+Pj4+
ICsjIGRpcmVjdG9yeSAoYW5kIGRvIGEgdXNlbGVzcyBzaWduaW5nKSB0byBnZXQgcmlkIG9mIHJw
YXRoLCB0aGVuCj4+Pj4gc3RyaXAgZGVidWcKPj4+PiArIyBzeW1ib2xzIHRoZSBzYW1lIHdheSBC
dWlsZHJvb3QgZG9lcyBpbiBwb3N0IGJ1aWxkIHN0ZXAsIHRoZW4KPj4+PiByZS1zaWduIHNobGli
cwo+Pj4+ICsjIGRpcmVjdGx5IGluIFRBUkdFVF9ESVIgd2l0aCBzaWduaW5nIHNjcmlwdCBmcm9t
IGxpYmNhbWVyYS4KPj4+PiArZGVmaW5lIExJQkNBTUVSQV9JTlNUQUxMX1RBUkdFVF9DTURTCj4+
Pj4gK8KgwqDCoCAkKFRBUkdFVF9NQUtFX0VOVikgJChMSUJDQU1FUkFfTklOSkFfRU5WKSBERVNU
RElSPSQoVEFSR0VUX0RJUikgXAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAkKE5JTkpBKSAkKE5JTkpB
X09QVFMpIC1DICQoTElCQ0FNRVJBX1NSQ0RJUikvYnVpbGQgaW5zdGFsbAo+Pj4+ICvCoMKgwqAg
ZmluZCAkKFRBUkdFVF9ESVIpIC10eXBlIGYgLW5hbWUgImlwYV8qLnNvIiAtcHJpbnQwIHwgeGFy
Z3MgLTAKPj4+PiAkKFNUUklQQ01EKSAyPi9kZXYvbnVsbCB8fCB0cnVlCj4+Pgo+Pj4gICDCoFlv
dSBzaG91bGQgYWRkIC0tbm8tcnVuLWlmLWVtcHR5IHRvIHhhcmdzLCBpbiBjYXNlIHRoZXJlIGlz
IG5vIGxpYnJhcnkKPj4+IGF0IGFsbCAodW5sZXNzIHlvdSdyZSB2ZXJ5IHN1cmUgdGhhdCBkb2Vz
bid0IGhhcHBlbikuIEFsc28sIHdoeSBpcyB0aGUKPj4+IHx8IHRydWUgbmVlZGVkPwo+Pj4KPj4K
Pj4gU2hhbWVsZXNzbHkgc3RvbGVuIGZyb20gbWFpbiBNYWtlZmlsZSA6KQo+PiBodHRwczovL3Vy
bGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dpdC5idXN5Ym94Lm5l
dF9idWlsZHJvb3RfdHJlZV9NYWtlZmlsZS0yM243NTgmZD1Ed0lGYVEmYz1fc0VyNXg5a1VXaHVr
NF9uRndqSnRBJnI9TFlqTGV4RG43clhJelZta05Qdnc1eW1BMVhUU3FIR3E4eUJQNm02cVpaNG5q
Wmd1UWhaaGtJXy0xNzJJSXkxdCZtPXY3d0tMdmIyZFNFY2E1cW9FeTI3dTFHbGx0d1dway1vcy1n
REVQOHhQZ0lOaVB4X1dpMHNsMzNIOXAwSVdiaEImcz0xY2RHSFNHeE1ZaElKQmYyNzZTOVBaakd0
TnVTUm1JY2VCX29MMWJJNEZZJmU9Cj4+Cj4+IEJ1dCB5ZXMsIG5vIGd1YXJhbnRlZSB0b2RheSB0
aGF0IGFuIElQQSBzaGxpYiB3aWxsIGJlIGluc3RhbGxlZCBieQo+PiBsaWJjYW1lcmEgcGFja2Fn
ZSwgc28gSSdsbCBhZGQgdGhpcyBvcHRpb24gdG8geGFyZ3MgY29tbWFuZC4gVGhhbmtzIGZvcgo+
PiB0aGUgaGVhZHMgdXAuCj4+Cj4+IFdpbGwgcmVtb3ZlIHRoZSByZWRpcmVjdCBhbmQgdGhlIHx8
IHRydWUgYXMgdGhleSBhcmUgbm90IHJlYWxseSB1c2VmdWwKPj4gaW4gdGhhdCBwYWNrYWdlLgo+
Pgo+Pj4+ICvCoMKgwqAgTUVTT05fSU5TVEFMTF9ERVNURElSX1BSRUZJWD0kKFRBUkdFVF9ESVIp
L3Vzci9saWIvbGliY2FtZXJhLwo+Pj4+ICQoQEQpL3NyYy9pcGEvaXBhLXNpZ24taW5zdGFsbC5z
aCAkKEBEKS9idWlsZC9zcmMvaXBhLXByaXYta2V5LnBlbQo+Pj4+ICQoYWRkcHJlZml4IGlwYV8s
JChhZGRzdWZmaXggLnNvLCQoTElCQ0FNRVJBX1BJUEVMSU5FUy15KSkpCj4+Pj4gK8KgwqDCoCBN
RVNPTl9JTlNUQUxMX0RFU1RESVJfUFJFRklYPSQoVEFSR0VUX0RJUikvdXNyL2xpYjY0L2xpYmNh
bWVyYS8KPj4+PiAkKEBEKS9zcmMvaXBhL2lwYS1zaWduLWluc3RhbGwuc2ggJChARCkvYnVpbGQv
c3JjL2lwYS1wcml2LWtleS5wZW0KPj4+PiAkKGFkZHByZWZpeCBpcGFfLCQoYWRkc3VmZml4IC5z
bywkKExJQkNBTUVSQV9QSVBFTElORVMteSkpKQo+Pj4KPj4+ICAgwqBJbnN0ZWFkIG9mIG92ZXJy
aWRpbmcgSU5TVEFMTF9UQVJHRVRfQ01EUywgeW91IGNvdWxkIGFsc28gZG8gdGhlCj4+PiBhZGRp
dGlvbmFsIHN0ZXBzIGluIFBPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MuCj4+Pgo+Pgo+PiBXYXMg
bm90IGF3YXJlIG9mIHRob3NlIGhvb2tzLCBuZWF0IDopCj4gCj4gQXJlIHRoZXNlIGhvb2tzIGNh
bGxlZCBhZnRlciBhbnkgbW9kaWZjYXRpb25zIHRvIHRoZSBmaWxlcyBieSBidWlsZHJvb3QsCj4g
b3IgYmVmb3JlPwo+ICA+IElmIGl0J3MgYWZ0ZXIgdGhlbiByZXNpZ25pbmcgYXQgdGhhdCBwb2lu
dCB3b3VsZCBiZSByZWFzb25hYmxlIEkgdGhpbmsuCj4gCgpBRkFJSywgYmVmb3JlLgoKQnVpbGRy
b290IHJ1bnMgYWxsIHJlcXVlc3RlZCB0YXNrcy9zdGVwcyBmb3IgZWFjaCBwYWNrYWdlLCB0aGVu
IHJlbW92ZSAKcnBhdGggYW5kIHN0cmlwcyBzeW1ib2xzIGluIHRhcmdldC8gZGlyZWN0b3J5LgoK
UE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyBpcyBydW4gcmlnaHQgYWZ0ZXIgdGhlIGluc3RhbGwg
dGFzay9zdGVwIGZvciAKdGhlIHBhY2thZ2UgaXMgcnVuIChiYXNpY2FsbHkgYWZ0ZXIgbmluamEg
aW5zdGFsbCBpcyBleGVjdXRlZCkuCgpQT1NUX0JVSUxEX0hPT0sgaXMgaGFwcGVuaW5nIHJpZ2h0
IGFmdGVyIHRoZSBidWlsZCB0YXNrL3N0ZXAgKGFmdGVyIApuaW5qYSBpcyBleGVjdXRlZCkgb2Yg
dGhlIHBhY2thZ2UgaXMgcnVuLgoKV2UgYW55d2F5IG5lZWQgdG8gc3RyaXAgdGhlIHNobGlicyBt
YW51YWxseSBpbiB0aGUgcGFja2FnZSBtYWtlZmlsZSAKYmVjYXVzZSBub3RoaW5nIGRvZXMgaXQg
YW5kIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIHdheSB0byBob29rIApzb21ldGhpbmcgZnJvbSBh
IHBhY2thZ2UgbWFrZWZpbGUgdG8gaGFwcGVuIGFmdGVyIEJ1aWxkcm9vdCAibWFpbiIgcG9zdCAK
YnVpbGQgc2NyaXB0IGlzIHJ1biAobm90IHRoZSBvbmUgaW4gcGFja2FnZSBtYWtlZmlsZXMsIHRo
ZSBvbmUgcnVuIHJpZ2h0IApiZWZvcmUgY3JlYXRpbmcgdGhlIHJvb3RmcykuCgo+Pgo+Pj4gICDC
oEhvd2V2ZXIsIEkgdGhpbmsgaXQgbWF5IGJlIHNpbXBsZXIgdG8gZG8gdGhlIHN0cmlwcGluZyBp
biBhCj4+PiBQT1NUX0JVSUxEX0hPT0suIFRoYXQgd2F5LCB5b3Ugb25seSBuZWVkIHRvIGRvIHRo
ZSBzdHJpcDsgdGhlIHNpZ25pbmcgaXMKPj4+IGRvbmUgaW4gdGhlIGluc3RhbGwgc3RlcCwgc28g
aWYgd2UgbWFrZSBzdXJlIHRoZSAuc28gaXMgc3RyaXBwZWQgYnkKPj4+IHRoZW4sIGFsbCBzaG91
bGQgYmUgd2VsbCwgcmlnaHQ/Cj4+Pgo+Pgo+PiBJZiBoYXZpbmcgdGhlIHN0YWdpbmcgc2hsaWJz
IHN0cmlwcGVkIGlzIGZpbmUsIHRoZW4gdGhpcyBzaG91bGRuJ3QgYmUgYW4KPj4gaXNzdWUgaW5k
ZWVkLgo+IAo+IFRoaXMgc291bmRzIGZpbmUgdG8gbWUgdG9vIHRob3VnaC4KPiAKPiAKPj4KPj4+
ICAgwqBGaW5hbGx5LCB0aGVyZSBpcyBvbmUgbGl0dGxlIGNhdmVhdDogaWYgdGhlIGxpYnJhcmll
cyBhcmUgaW5zdGFsbGVkIGluCj4+PiBCUjJfU1RSSVBfRVhDTFVERV9ESVJTIChpLmUuIGlmIEJS
Ml9TVFJJUF9FWENMVURFX0RJUlMgaXMgc2V0IHRvCj4+PiAvdXNyL2xpYiksIG9yIGlmIHRoZXkg
bWF0Y2ggQlIyX1NUUklQX0VYQ0xVREVfRklMRVMgKGUuZy4gaWYgaXQgaXMgc2V0Cj4+PiB0byAi
aXBhXyouc28iKSwgdGhlbiB0aGUgbGlicyB3b3VsZCBiZSBzdHJpcHBlZCB3aGlsZSB0aGV5IHNo
b3VsZG4ndCBiZS4KPj4+IEhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIGEgYmlnIGRlYWwu
Cj4+Pgo+Pgo+PiBEb2VzIG5vdCBodXJ0IHRvIHVzZSB0aGUgc2FtZSBsb2dpYyBhcyBpbiBTVFJJ
UF9GSU5EX0NNRCBpbiBtYWluCj4+IE1ha2VmaWxlLCBzbyB3aWxsIGRvLgo+PgoKQ2FuJ3QgdXNl
IHRoZSBsb2dpYyBmb3IgQlIyX1NUUklQX0VYQ0xVREVfRElSUyBiZWNhdXNlIHRoZSBkaXIgaW4g
dGhlIApidWlsZCBkaXJlY3Rvcnkgb2YgbGliY2FtZXJhIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBv
bmUgaW5zdGFsbGVkIG9uIHRoZSAKcm9vdGZzIChpLmUuIGJ1aWxkL3NyYy9pcGEvKi9pcGFfKi5z
byB3aGlsZSBvbiB0aGUgdGFyZ2V0IGl0J2QgYmUgCi91c3IvbGliezY0LH0vbGliY2FtZXJhL2lw
YV8qLnNvKS4KCkZvciBCUjJfU1RSSVBfRVhDTFVERV9GSUxFUywgaWYganVzdCBhIGZpbGVuYW1l
IHNob3VsZCBiZSBnaXZlbiwgdGhlIApmaW5kIGNvbW1hbmQgd2lsbCBub3QgY2FyZSBhYm91dCBp
bnRlcm1lZGlhcnkgZGlyZWN0b3JpZXMgc28gd2UncmUgZmluZS4KCk1lYW53aGlsZSwgSSByZWFs
aXNlZCB0aGF0IFNUUklQQ01EIGluIHBhY2thZ2UgbWFrZWZpbGVzIG1pZ2h0IG5vdCBiZSAKdGhl
IHNhbWUgYXMgdGhlIG9uZSBpbiB0aGUgbWFpbiBNYWtlZmlsZS4gTmFtZWx5LCBpdCdzIC9iaW4v
dHJ1ZSBpZiAKQlIyX1NUUklQX3N0cmlwIGlzIHVuc2V0LiBTbyBJJ2xsIG5lZWQgdG8gdXNlIGEg
aGFyZGNvZGVkIHZlcnNpb24gCmluc3RlYWQgb2YgU1RSSVBDTUQgdmFyaWFibGUgdW5mb3J0dW5h
dGVseSA6LyBUZXN0aW5nIHRoaXMgdG8gbWFrZSBzdXJlIApJIGRpZG4ndCBtaXNyZWFkIHRoZSBj
b2RlLgoKQ2hlZXJzLApRdWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
