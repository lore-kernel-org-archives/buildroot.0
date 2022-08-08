Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE5DC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 22:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B1760AEB;
	Mon,  8 Aug 2022 22:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B1760AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owkQxH-seDAA; Mon,  8 Aug 2022 22:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB31360B00;
	Mon,  8 Aug 2022 22:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB31360B00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD6D51BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 22:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCECA60ADB
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 22:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCECA60ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POVfIB7w9M7k for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 22:23:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D9766058B
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2102.outbound.protection.outlook.com [40.107.101.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D9766058B
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 22:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gh5BdzjPwL//yd4d1IL4/KlS49WkgPwaM0XiBR0ATIaJ6I+fvo8kUAkNlW2KISl7Vsb2FyeJLs30onn7XY2xzKzb0AY7uQ1PglS4nUUsJlM99wVJFE1Odc/+NvgLAd/z0mNKebSawUDFMPrJ9mwdYFzWebOM38aPDfM1CP1uFb8D93A6TN/SY0vcNAPTMQB/XSI4SYGjegekt7hqyhUNZawrpNQTKaLzBzPTKSgprpFnQJPeBL5DqBXb+NYDadFvbVTlthdkyHcHosMv0JWQ4KzhB+V4oDVjjqV1Io244NXbn0A9A7gUp5QcxzbKHc3qrzrYGaZDfO8B7WU2uTTy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23U0DAohAJ8MyAax+jchpc9iocMp6wNJ2cWH1Xp6io8=;
 b=SkKnRx9+k0LXy3El5qzB+FpdiC3PPCPI23BmtTFbMx7b2Om3b0wzwJ8Yk/Nuv1ONvJoWWPxhxlQIWcitFduYgUm0z6TxQhCzxXChZoJEJ9HhJpjWEj74DtxKV9qh5nMNuXmvF/A/PGvGtUITz4QBO0D/prxqzLp+mtbum2odo28YallRrI8+MPlqSagoEN1YftB89aaferFlSrKaaONIYztVxlpTzrlkg5JHgMwJQ1KxSjwGw4xWp3SbiuvDTX4p1kA8YcaQTpue4YPUWzsZgDPKr+BM9c8C2wGveVmO/wo6S8N8blAG5c1u/f6sGcNiRB/MLA2SVM1cu2VTyIVDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by CO6PR17MB4930.namprd17.prod.outlook.com (2603:10b6:5:35a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 8 Aug
 2022 22:23:40 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 22:23:40 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  8 Aug 2022 17:23:12 -0500
Message-Id: <20220808222312.19419-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808222312.19419-1-sen@phobosdpl.com>
References: <20220808222312.19419-1-sen@phobosdpl.com>
X-ClientProxiedBy: SA9PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:806:24::23) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a96a973-9f9c-4c45-e472-08da798ca54f
X-MS-TrafficTypeDiagnostic: CO6PR17MB4930:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xw82WVgSw9Bi0G5YR66QcLYvhQs12yTYIotaTILWiYWYK6FKuCHl2LJO4KP0732AgbwPf0uMzfAOqMsVW9w+VNrYIyhi34A9KnpPqWO/Vf+OZhyck9x2ePFt8Gyb4Yl9IeyBRDIBv6+xACx+iv4N3PZo+GrSc73LH4786n1vLSK8pc2giO64yQWBa7NcSZ9drJQv8QMc84DdDqmAKLA/EtKjBzntvj7IFJtFGEeTipNjovWCWM3EHtwQmLe+Kn2SDfwbcL6MxG3MSlrVk7lBy/ccYm3rh1y2BXg1z/WqFMgKwo/zaq2d72L4jJxA2rMCXxy4OwEh2B74XDRzeUcGqqqxTZN2rK6jclBgpq59IPvaPYBGss/KE9GecoQnO9sBLA/jrTx6YQ+74R3kQ5MSXbanRSbNR6D8raWJClQKuPGz5regl92idCSBCSTSDdtj8/gPikARLkLcgC2Nh/tQ5MtlZqj0rPamJwoEnTe7SSUTkzu2N3XZ9bAE6wOGwdtIiw09D6IL6FZOdnFQsKuefk1MO/ecRgnXLdn01pyUCx5afJ5Mgy0vWDaQyoQQc8Vot0RIXMMetaGbcOqopOJwmRaf0m4zPe9zpPXdgc78twK2ryKhbu1qiFgPg3/F4JSh0JnWUvVM3yMKxU6V/MHrfd9zvxdq7X+jBytfGH18w6yhTm8q+BoL2+h11KDHFLkJ00mvWtJFXmGXPEr5qDh7mHG2uu9fYx/XcRycEG7A9C9Ty854KD/NeMEwyLWpZfVboJyIRSpnbtdgx8WKf/PWAfhKnC8OttNBOu542jh32pp6rLogoNFhQPjrQa69KMuaZHOmWoaOyyt20cJ3Tt3GdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39830400003)(186003)(107886003)(41300700001)(36756003)(8936002)(5660300002)(1076003)(2616005)(83380400001)(38350700002)(2906002)(66476007)(66556008)(86362001)(66946007)(38100700002)(6916009)(6486002)(966005)(316002)(478600001)(52116002)(4326008)(8676002)(53546011)(6666004)(6506007)(166002)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gGyNvOydMX57g/X1CEGr5evU63lomabe+wQtPInZLIQ9l/zCJZiP+M7NhZOl?=
 =?us-ascii?Q?uDKGM8chAsYr+6XTkIWggUvAeym19QA6kHA30uB4CGrwDOO8i/Xs4rpP/4g1?=
 =?us-ascii?Q?t/2nU1bYxESP3VqWKA3iszTLbc2A/vOShRkaLO0unLi+SlTp3GwEIAw6FM76?=
 =?us-ascii?Q?V1bkrkhSLUOALZramunr9+/LeAZLKDp16E0yk2phPLptnhJWpuPxJ7gT95Ax?=
 =?us-ascii?Q?eUgKbOg8fEJWwGaQWYJ83fKYxU2mngyf6ZutRnCdr36iOtgPPVI1fxUG2SsJ?=
 =?us-ascii?Q?/406/360DeSt79sPVMPvhwQGWHzwbjS9n2HOLKloC8HnTZyJBPaXq5+eyt0S?=
 =?us-ascii?Q?rB3XaKWTxk6sLCx8w8mgoxBtCn51Fve8NYlLDETN2JC7/hwcxp97j+Ektpk5?=
 =?us-ascii?Q?ibG0QYpehl4DVxbeXx2nuOC6sdH66iQdmBxYI7zgb82tfMjhwHAUS824HHW2?=
 =?us-ascii?Q?8dudkcz+f4bPH5ceMCwe67qMTH+0v43IJbXjzGZz+xKUJkzjxAwDeIWTfQ2w?=
 =?us-ascii?Q?pD6xsN27tmujUzhjmI8lbXsIPXqtaUgJ2ErunrbC4g0r3M8i+VqPAKrV1nuk?=
 =?us-ascii?Q?JP3qTw1kCdGGecPphvJEef/ZOxLSvXH+foGlNc0N6EbJ94TmRqbjG0UYB1gJ?=
 =?us-ascii?Q?XOHbpNv4nQMFJgdvkDM0rnHe4l0uFwLCb/vTN4IWbFUR5qSh2bOZTMFDgQO3?=
 =?us-ascii?Q?Ry89PMpIsd2ZW+kxxTGYEexy5AdCNikJMTt4N9KoGxC+7MfRw4wF4k1A8Yaf?=
 =?us-ascii?Q?nO5ildz9cEnKcHansJrT3v6hQ0nVIb2P+uv2wI6tA1haIYWmkXOmEPJlurT9?=
 =?us-ascii?Q?RnoriwK1LXY5vgUfk1MgsS4etN/g4IP+lDr5GA3AwccA8hodV335J5+0vm58?=
 =?us-ascii?Q?adHt8lkCnkz2sZnxKsXLp3LprTOAegtSRvbcLgPHZfgzhier3lS4bUkwCGRN?=
 =?us-ascii?Q?/uPaLVORHrGY0h3S+7TCSntvPU4UtPi0MkuNTl+vJkrGFnrflDG8OmYltMGy?=
 =?us-ascii?Q?+KGITlnOapIdlbLqMa4OO95S0xGRAaYkaOUOddo99w1pa6oPBVwlEzO/WBMq?=
 =?us-ascii?Q?YS/Ymu7F0dzRmat3WA73+H1FLWDW86pt0yIfVLidWuSzxsTH51Alb8PPYWKd?=
 =?us-ascii?Q?Tk87R4rbb/eNQI1sARiZxX/pvEwiQt8G9srrPyDWsyL6skusY/5u6oUVKCOt?=
 =?us-ascii?Q?80IokGfxLv7GVQHXJuyNE9KsMPkkUNugUxOuO7Gqrjquhufkk13+n/lHaBlj?=
 =?us-ascii?Q?WsTLOAGPvXACldCnxaO99LdUEZvb8xCUwqma1SqIv8sblNgJXOrgIIBsHQmS?=
 =?us-ascii?Q?QXswsTEKagGUVUyXoQofCBPss09d+GJhwtFRzw7VglsZFBj69DgFqiBwHLQs?=
 =?us-ascii?Q?EXB2reVlrO8Xr4qTJCVtjq7tKpA7JWhLXISLhBDr+ByqPfXMJGZicwIzAUTx?=
 =?us-ascii?Q?r3ha5wLaESnQWuuQ8xRkit7KcC2vAuPdzvVzE5h407N/h42ls0Ce2brA3eAm?=
 =?us-ascii?Q?s4QSisojmpackQM+v0xfWwugNgB3IPkICxaWocgdjIBFtMvzYwwRm0O6/sCE?=
 =?us-ascii?Q?p7WzQG6yQrVgL0zE5Y2wiQezicsrY6qW7OH6P94C?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a96a973-9f9c-4c45-e472-08da798ca54f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 22:23:40.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO4yPgeSQN8krtyKc3YFPDGmfTmdeR26CjJ/txQWwSsJWJmlMQ8YKbBMwtGlyiRSqzFnSTh3S3fqDnk8j2qawQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23U0DAohAJ8MyAax+jchpc9iocMp6wNJ2cWH1Xp6io8=;
 b=g+QcJhR0jwZzckiForMTLMr8LkVW8nQe8x+KSpEBIShmycu4y0FpLF9Tkhdavqc/ZsRPa7w6esD6cA66SFZ0Ta1NhXJGjDrRBDI4bKMAle+vXumIbCx72ePIvX2TQJ3/SkgxfRvIlUogPw43huf+k9Fhjt70h+5KVsRPxcuwOGY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=g+QcJhR0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH v1 2/2] support/scripts/pkg-stats: optimize
 CSS selector usage
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
Cc: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/6/22 16:55, Thomas Petazzoni wrote:
> Hello Sen,
> 
> On Fri,  5 Aug 2022 15:01:14 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
> 
>> Having lots of CSS selector declarations adds up, especially at 70k+
>> elements.
>>
>> This reduces the number of CSS selectors printed in the markup
>> to the bare minimum, by using pseudo-classes and tag names as selectors.
> 
> Not sure how this works. 

See my explination below about magic number 13. :-)

>Is there a significant size benefit? 

Absolutely. I actually had a cover letter for v0 of the patchset:
https://lore.kernel.org/buildroot/20220805185821.261049-1-sen@phobosdpl.com/

Just as a quick rundown:

The old pkg-stats,
(https://git.buildroot.net/buildroot/commit/?id=eae86599ca81c943821bac33f424669520a3fa8c)

when given the current package list gives me an html file sitting at about 2.9MB.
example: https://sen-h.github.io/pkg-stats/eae86599ca81c943821bac33f424669520a3fa8c.html

The current pkg-stats gives me a whopping 7MB file.
example: https://sen-h.github.io/pkg-stats/c245575.html

but you can see this whittled down by [PATCH v2 1/2]:
https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html
(3.2M)

and then by [PATCH v1 2/2]:
https://sen-h.github.io/pkg-stats/9ad05210dcd9e4fb6b6a45be87c0fbb3e022085b.html
(2.6M)

> Sometimes having a dumb but obvious solution is better than having a
> smart but convoluted solution.

Although I admit nth-child seems exotic, I think it's actually pretty straightforward. 
CSS is of course all about cascade and layers of specificity,
and I definitely think the size savings is worth it.

> 
>> +div {
>> +  text-align: center;
>> +  border: solid 1px gray;
>> +}
>> +#results-grid div{
>> +  text-align: left;
>> +}
>> +#package-grid div:nth-child(13n+1), #package-grid div:nth-child(13n+13)  {
>> +  text-align: left;
>> +}
>> +#package-grid div:nth-child(13){
>> +  text-align: center;
> 
> What is this 13 magic number?

13 is the the number of columns.

Rather than giving every item that needs to be centered a "centered"
class selector, we center all div elements and then selectively
left-align the ones we want. 

	div { text-align: center;}:

centers all div elements, which includes the cells in the grid.

	#package-grid div:nth-child(13n+1):

selects the first element in the grid and then every 13th+1 element
thereafter:

(13*0)+1 = 1, (13*1)+1 = 14, (13*2)+1 = 27 etc...

this effectively targets every cell in the left-most column.

	#package-grid div:nth-child(13n+13):

selects the 13th element in the grid and then every 13th element
thereafter:

(13*0)+13 = 13, (13*1)+13 = 26, (13*2)+13 = 39 etc...

this effectively targets every cell in the right-most column.

so our columns go from this:

      1		   2		3	4-12	 13
|   label    |   label    |   label    |...|   label    |
|    data    |    data    |    data    |...|    data    |

to this:

      1		   2		3	4-12	 13
|label       |   label    |   label    |...|label       |
|data        |    data    |    data    |...|data        |

Except that traditionally the right-most column label is centered.
(at least that's how it was when I started)

so we use:

	#package-grid div:nth-child(13){text-align: center;}

to center *just* the right-most column label (the 13th element) 

so now it's:

      1		   2		3	4-12	 13
|label       |   label    |   label    |...|   label    |
|data        |    data    |    data    |...|data        |

see: https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-child#examples

> 
> Also, unrelated to this, when I look at the currently generated HTML,
> it looks odd. I see things like this:
> 
>   <div id="upstream_url__package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream" class="centered upstream_url data _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream good_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>
> 
> Why do we have these crazy id values now? why does the class property
> contain a value such as
> _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream?

Good question. It has to do with sortGrid() needing unique class
selectors per row.

see: https://git.buildroot.net/buildroot/commit/?id=786f8b45672ebdd432f6af5b7595d3d16013433b

sortGrid() sorts by virtue of all the elements in a column sharing the
same class (which orginally was also the column label)
and all the elements in a row also sharing the same class
(which originally was also the package name).

The problem (previously) was that some package names were duplicated across rows.

For instance look at these two cells in the package column:

<div id="package_barebox" class="package data barebox">boot/barebox/barebox.mk</div>

<div id="package_barebox" class="package data barebox">boot/barebox/barebox/barebox.mk</div>

these are the beginning cells of two rows and they both share the
*same* class selector "barebox".

Can't have that because we need every row to have a unique class
assigned to it.

Otherwise when we sort this happens:

|label         |     label    |     label    |...|     label    |
|class1        |    class1    |    class1    |...|class1        |
|class1        |    class1    |    class1    |...|class1        |

becomes:

|label         |     label    |     label    |...|     label    |
|class1        |    class1    |    class1    |...|class1        |class1        |    class1    |    class1    |...|class1        |

sortGrid pulls all elements by row class selector and gives them
an explicit grid-row assignment.

So now we have 26 elements in a row instead of 13 :p

The fix at the time,was to use the package path but with "_" instead
of "/", so:

boot_barebox_barebox and boot_barebox_barebox_barebox
respectively.

Also class selectors can't start with numbers so we prepend an "_"
to for the sake of packages like 4th and 18xx-ti-utils.

sortGrid (used to) derive the package class selector for the whole row by stripping it out of the id.

	sortArr[0] = listing.id.replace(sortLabel+"_", "");
so:
	sortArr[0] = "upstream_url__package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream".replace("upstream_url_", "") 
yielding:
	sortArr[0] = "_package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream" 

PATCH v2 1/2 does away with this and uses programmatically generated
column/row class selectors.

I understand that javascript probably isn't a langauge most people on
the mailing list are familiar with, especially when it comes to the DOM
api.

So this email (and the previous one) are more of "why" and less of a
"how", but if it would be helpful I could do a line-by-line walkthrough
of sortGrid() just to go through how everything works.

Hope that helps.

> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
