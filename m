Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E349C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1A342443;
	Sun, 24 Jul 2022 14:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1A342443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4KWmC-vJ-_9; Sun, 24 Jul 2022 14:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D53D4242B;
	Sun, 24 Jul 2022 14:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D53D4242B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 210361BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089A640443
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 089A640443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UzCri5xlkGF5 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFDCC400B9
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2129.outbound.protection.outlook.com [40.107.102.129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFDCC400B9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL0YRLNNn+crfvlSizd6whoSno+bFYBjO/Lpm0iJL5fgO/MhYD7XO1NBxpZxT8WloT/nhNaoEXpehY6FKVMUWtTPmrPWlcryWHXSpwh8FLnlzAnVqDr0tMG1qOpmxc2K9SMUo3SvxNzGmnKJcTsAAmf8A0yDd2AWhoZDESSHivuEgdcACSzv4ejI6H8Mf6fWZcqleFHWi8jQDVNc027TUshk6UgH/uTQ1iliUkfSOmBe+KPxKRu0hwZ2Msk1aRzPO4uWtpaMDD3M/NOLJJgfUKSPDQhsMNsH9QCO1QehVkFCzqOAMAJd679NfMRy1S0cMTWKFG/PJPyrKJ6oT9Eb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThO7TSFHS8vLHueFzF2fmHll1bO0on4iEYrl48WU5i4=;
 b=AV4mWs6+/AkJTCOaORdzicTUD1EraScrgT8L9KZW2kJDUvWyglQc2VpiZ4K5I47VpQVrMWRZA6s9WEeC8QrmvmglWx1Drvq4Br48PzzsCP4R4M/jzLPhcPSFZNL8cSPWXNK5qbkqQSO5HBlQ7/myRJn/KLpsJ49OSZMzhnd0r3KzkdRcAJ4AM5uHBGNtd4zGK9IPMRRXDPf7JfC77f+tuWEA51vGrhtr7zCg+9rcGaipozS1YUEV4iESyqPizmjiF00XYkJJPe4jbCIJSECczhlvJEPNqDr61ikAsbfwwgYhYOG+VmPD4wzOtFMEJzJpaLGz6zX1joTOfiwHbBpMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BYAPR17MB2213.namprd17.prod.outlook.com (2603:10b6:a02:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Sun, 24 Jul
 2022 14:36:23 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.023; Sun, 24 Jul 2022
 14:36:22 +0000
Message-ID: <e7d99988-6353-5cb8-0202-5a045eb57a88@phobosdpl.com>
Date: Sun, 24 Jul 2022 09:36:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Sen Hastings <sen@phobosdpl.com>
References: <394b4fbb-5d72-92ea-ccf3-3cbc47a0c1a9@phobosdpl.com>
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
In-Reply-To: <394b4fbb-5d72-92ea-ccf3-3cbc47a0c1a9@phobosdpl.com>
X-ClientProxiedBy: SN6PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:805:f2::45) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6a47657-c972-424e-7a24-08da6d81e12a
X-MS-TrafficTypeDiagnostic: BYAPR17MB2213:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prCPyJW1bEWlFcp898C7N3zJI2Zn4RjdjvTGDAJ7uXfpST9xxgxgbLCkiwhohGe47rUH0Ae/eNFuNMEMshK/HHN2UAoHN3fqnMcZOm11JaxEYsS/cH1+YOAIbDUOcPxj4Ub1GzoTjM+w8AJ0vZq7A5lXQmdXbL3a0Ywf50B999MrKyjf8FGn/k3yOkeuzVocec2BK3D6OVk/DXFBw4kanLZON1v1d6vxmtCyaOO/Uk+1iW9pz8stuGW82Qn5jX2uHnec198TYs5vEULvCLJepYdKr1yICTYsxRXrofNSos/Pe7xCoDv7Xh4Mk/24wXRSIcUg7/DK+ZP9OEGAGjGAePVJw6/BnVrqQ89oprtxbaUb/k/0ESd97Uo/7Vh9XM+HcPr5Akg8jDJ0GxJl5H3aK5VeYEtbtonSeRUvJy8SC1dmGvv9WyNwleHYRbKx7AAiBgGxii7n8/NHOCQ3Xqb8FqDyHIEAB44XDOpKRw7RQJ7rPsUaaiJDqiaSfaj012T8v1TxUgalpW+GaNjrJMolKKHpuueJW2dmR01jygOXx+69ODhMm7xd4J3ysrNMWqM6crsEIKHjWigl1Ml6T8UBbEPst7QZbILUyvYchKDm+sdCY0W/QUzpsVTFje59PsC3q6WPGPuGIVoN30x7lBOJ/k8nn9l/9kf1ZhosQueBixy2fA3bULTvRYrxVrKx6iBZWHw8umfiQ97CwJy6hU4K+/49Pt6yniFE5Zigw92rY7jt8iXJWwjFE9EUS2XUahx+K2T1JM3N4kxyeMgpEI91j5hvUyPzKNRXSoLUmFbcUxFzFBpJ7BTT6tHzAFF9prus09xgIp8e2ikXEoKL9fD75H9OxzCqxIVcs7HXIHYO3r8y2LzyjTYGFYFmnuL+jzT2j9pP3PtlBdjqlpzoi3NkjDxp09qFeoNkuRTL8mQHXYvVl4E40P6+dsg5AbeYejG6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(376002)(39830400003)(396003)(346002)(31696002)(86362001)(19273905006)(52116002)(26005)(6506007)(186003)(53546011)(38350700002)(36756003)(83380400001)(66574015)(2616005)(6512007)(38100700002)(31686004)(41300700001)(3450700001)(478600001)(6486002)(966005)(316002)(66946007)(8936002)(66476007)(8676002)(2906002)(66556008)(5660300002)(45980500001)(562404015)(43740500002)(563064011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlk1dEl1TDl6MVFiVzlaZkF3NWRNL0ZWR2NkTjREODNlV0VmcHRxVGpjK0VW?=
 =?utf-8?B?d0theE15bUxZakVZZ2tPcDk2OEE1dDNwV3Rmb1Y4VEdnNVpWN2IrSmdieUdi?=
 =?utf-8?B?QnlIY3VRcC9EZEg5MW1Oc1VHSDVZM2NBVFZaWStjNU9HbWtreUxENHo5MmFw?=
 =?utf-8?B?L2thSGw5Sms3OS9wZkhmSmNiaVFMOTgzOEloa2wvREpZbitUYm1wSkIxaWZ2?=
 =?utf-8?B?SFo3eUY0RVg4aEFzVlFiRUlFWUY5WGFlNDlSc2h0TnppaUNxbElVbTBpblRX?=
 =?utf-8?B?ZXpFeG5iSTNRRmhSeWs2NTZMSlllZEM0S2VvMkZMbGRIUDQzdDkwYlJZbFJj?=
 =?utf-8?B?alQzT2FEOVNDRnlWdXU4UmpZNEVBWTN3MStuQkxSQ2lkUDVlYzZrcUw5eFFD?=
 =?utf-8?B?RHdjTm5ScXRLNk5VZ3FHSG0yTFdwSTdtQm8xVnJVYTJBN21hdlBKSXdDMUda?=
 =?utf-8?B?OUt0N3RZV2lTMzBSVW9CSFBJWW9qUFgxMzRqMFRvbm1TcDRPZE9PQ2VLMGlU?=
 =?utf-8?B?TnRKK0M5NVVpRjBsaWwrZFVFNXNlUVdINmgvSWVBTk5vVHZyNmYyMVFiU25s?=
 =?utf-8?B?Ty9jQ1VscnorL2JrNUNDa0NudFovOUlJell6Y0EyUm4wL2lEZ21FYXIxeUE5?=
 =?utf-8?B?OVZ2TTFiaGFPTHBqZHZrSWFCSCtQcmlVUEFoc2dDUlVHcFVEVGEyU2o3Slkr?=
 =?utf-8?B?TUo2ZVVoczFPV0l6L1AyQ3BRVXM0N3gvTlJiMU1KejB6WndGaENBeC9kTG9h?=
 =?utf-8?B?Q2ROMlhUZURYUkxGdlRmTWhBOURqYjA1cjdqTFZnZG40V1Y0VXRpaTJ6L0o1?=
 =?utf-8?B?akdEZTlnNmxsVzJvS1BsZndPSmlOeG45eitmK3VQWXJkSTc0SEt2bU4zcUxR?=
 =?utf-8?B?d2Q1WTJuUng3QmhPOVFIYy92QjVOdjdqSkhqNkszRzNCRGNiWlpCWDF5bndL?=
 =?utf-8?B?Q3lOWmZpYVNzV1lwZmN4SEtPNHNnaVZJdStnQkhqUUF1aE1KeUhmaFpMY3Jp?=
 =?utf-8?B?M3pFSHdBYW9MTk5GbVBHRCtjUlMyNllpMHJoUDhzeDFVTTZKR1NNcHRZcjhw?=
 =?utf-8?B?U1N5SnZNdFZMZVg5aWFObzc3M3g1dHVhYzdWNlQzWGhRQys2Z0Y1K1ZZSWZy?=
 =?utf-8?B?MXVKZHl4eStDUVRCcmtzWmFIcjF0WnVDS1hkUTB3U0FNOHFKdFEvUXZLMExx?=
 =?utf-8?B?MWFoY1BvYUQ0NUdQUVhFRVV3ajRmNEZzTkJJVCt3S0t3aWFVZ1U1bXRJd0Nq?=
 =?utf-8?B?MDFyREJrZEU4dFQ3ckd4OEdVajdvZTh5Y2xqcGVXMTFhd0hTTGpGUjMzK2l1?=
 =?utf-8?B?K3J6MXhDV0ZUVzg1YWNHd2xlcVhhY2VOaXoyM2lYL2R1YmxDN2FtbGJEQ21B?=
 =?utf-8?B?OHN1WTMzY1M5NHE1TWdGbjY0SUlaekF3Z2JlbzFJV2ZaM2lTbzhJYmZDeGEr?=
 =?utf-8?B?TzFtN21JS0tQOEliOGhNMUk3UmRwWXNRUnEyWDhnK0I4SjJXVFJmOUZ2ZWpa?=
 =?utf-8?B?YW1QeUhIcEZrNkJOajBuMGNGMno1WHplVkNOdG1BcXp1aitJazVLNnc2WkVp?=
 =?utf-8?B?eEFXbXMwNWVsNlJkNzZIWUlvTmdIMjdqU01nK0VpYTZzWlM0ZUR0SE1udllZ?=
 =?utf-8?B?TGVqRVBEbklmcjZ2NmhsNUlKN3hHZkdZYjF0WFlEanJja2Qrdi9qUC9qQ2tM?=
 =?utf-8?B?TnZwSkVEbktQalBjd2pJTmF5MXhaU2NoVkd2ZWNzN0lLVnBXZXE0aVN2MlFF?=
 =?utf-8?B?L3BWa0dORzV4TEJWRGFlQWNXU3lOck5PZXZoNnMwME5NM3VpL24yeVdlQmd2?=
 =?utf-8?B?UFZBdWFjYnVYTlRucUdWNVl3d1ZvVkFSTFFMTXZwQVREYVRNejdMWGk4WGJS?=
 =?utf-8?B?SnVSZis3WWxrL0pvOFJnbGd0MFhwKzFxU3ZHWE1wMStYWlpHQjlsNWdHbDIx?=
 =?utf-8?B?SmZ6UHZ3TDlIbm40YXQrN1BiRTFsK0ppenlRS3hvWUtka3dxd2EvbjBMRHVn?=
 =?utf-8?B?VVYwZ0c1TU5YY0RVSXlWSkZIUjh4NnNvV0RrblQ5eWVxRDNDUmkvV1NpQ3Jm?=
 =?utf-8?B?QlhlMXVOTjM5VmV3T3RWek8vMnZURFV6eVNEWjRPMHBFbGJMcHJhaXdndVRM?=
 =?utf-8?Q?5QZIyvsjhkziXC/FERxjsV6Ic?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a47657-c972-424e-7a24-08da6d81e12a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2022 14:36:22.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm9XipHpGPK5+us6qQVDkVxCQzrNQVp+T1D0UF4p2wP5P0DvwFvJgmiqZBlFEA71F2sPO3/H8bYnQSQWN3J1iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR17MB2213
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThO7TSFHS8vLHueFzF2fmHll1bO0on4iEYrl48WU5i4=;
 b=aP22SUGZEqhlQRjluGpGjoPg89/oLhhE3eABHP3TTfx658sbAAYj1C/9xnpT1T6dj6OGWmjUufAJK/3DHoNuJCxJZRDwftSSj+buWLowSn7zlV4df31Z9J5fJ4drDYBrr36TNwUeD1vwPo5BBnirIJ0pZUt7xLqiUIiDC2TcG+M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=aP22SUGZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH v3] support/scripts/pkg-stats: migrate to
 CSS grid and inline javascript
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
Reply-To: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/24/22 05:29, Thomas Petazzoni wrote:
> Hello Sen,
> 
Howdy!
> On Fri, 22 Jul 2022 14:15:58 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
> 
>> This migrates pkg-stats.html from html tables to CSS grid, allowing
>> the use of newer, simpler javascript that is short enough to be
>> inlined, instead of relying on externally hosted javascript.
>>
>> Javascript sorting function was rewritten from scratch in ~55 lines,
>> short enough to be inlined directly in the html.
>>
>> Tables were redone in CSS grid, but with care taken to mimic existing
>> "look and feel" of prevous implementation, albeit with slightly
>> better responsive behavior and default styling characteristics.
>>
>> Column labels are now "sticky" and stay stuck to the top of the
>> viewport as you scroll down the page.
>>
>> Also, css was rewritten in fewer lines and table elements were changed
>> to divs (for grid support).
>>
>> Other small misc fixes include quoted hrefs and document language
>> declarations to make the w3c html validator happy.
>>
>> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> 
> Thanks for this patch, but I'm seeing several issues now when I compare:
> 
>   http://autobuild.buildroot.net/stats/master.html (which uses your new code)
> 
> and
> 
>   http://autobuild.buildroot.net/stats/2022.02.x.html (which uses the old code)
> 
> Here is the list of issues:
> 
>  * Sorting is now very slow, to the point that Firefox complains that
>    the page is slowing down the web browser. It was instantaneous in
>    the old code, but way faster.>

Wow, dang I see what you mean. I was doing testing with relatively
*small* defconfigs. Looks like the bottleneck is actually at the end
when calling packageGrid.append(element). I'll dig into it.

>  * The "Latest version" cell is no longer with a dark orange/red
>    background when the version doesn't match with the "Current
>    version", these cells now have a green background, making one think
>    that the package is up-to-date in Buildroot.
> 
Ah, that's a cascade order issue. Fix is to move the
".correct, .nopatches, .good_url..." rule above the
".wrong, .lotsofpatches, .invalid_url..." rule.

>  * When sorting on a column, a small arrow appears indicating that the
>    sorting has been done based on this column. But then when you sort
>    by another column, the arrow appears on this new column, but doesn't
>    disappear on the old one, so you no longer know which column was
>    using for the sorting.
> 
This is *kind of* a feature? sortGrid()'s sorting is cumulative, so they
are all *technically* being used for sorting. This means the table is
not *reset* to its original state before every sort.
For example, sorting by (clicking on) "Infrastructure", then "License"
will yield a different sort (row order) than sorting by "License",
*then* "Infrastructure". An actual table "reset" is achieved with
sorting by "Package" ascending (down arrow). I must admit though, after
the table is reset the other arrows are meaningless until clicked on
again. That is definitely misleading, so no matter what arrows *should*
be reset after a table reset. I guess I didn't realize my sort behaved
differently in this regard. Whatever behaviour you think is most
appropriate (the original or cumulative), I'll make it do that.

> Do you think you could have a look at those issues?
> 
Yes. As a clerical note, should I do multiple patches, a patch series or
one big one?

> Thanks a lot!
> 
Sure thing!

> Thomas

Sen H.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
