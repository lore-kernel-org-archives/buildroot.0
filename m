Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6827FECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 06:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAA684057A;
	Tue, 30 Aug 2022 06:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA684057A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfLygHvUGWuj; Tue, 30 Aug 2022 06:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4FA440545;
	Tue, 30 Aug 2022 06:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4FA440545
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 619EE1BF2E5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 06:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49DF540580
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 06:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DF540580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RcwfPffkGLV for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 06:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A2D4057A
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2106.outbound.protection.outlook.com [40.107.243.106])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06A2D4057A
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 06:34:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPxhblMyNbEdp2PKo//ZdkCWrsykbq8+eSHYYt+0xQeKN58Xn2Xb7+Jk6aXadxoWpA9NsOXp/e//B+qmrNX36vRWi9eV1iXNgIYZwaidQrV+75nA/VtY3rRxMRBIz0JtIHCljWNsykQuUUupEDiIt1vUD8zklSoPi8PP+Doiu1m6gUAlUiTltUuCQNMJSiAybRoyOWa9kEd9lVFxa3Lo04w2l6zCI1/GOZijbZ/0mPoePu/yv7eOvYVfK/19rrmtoml1EoAerzlq+YaF/z8rXqS+SWTr4C3XOLvHzSRF0x0kNbO8NeGd2UyDwuvbwtbgZTK6D1wzFt4Vm5wV+Jx9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGE4LWwZKaeIZpd5BQFL1PbFrifc7ACnILTPz71O7oE=;
 b=LvcexxUZLIDQEwmiYCoDszRxUMSgorliUF8BfZLNcmaW9utt/PZ+rCwoMoovvnggc0oas/ASU0vBlEURZRjeXpu9h9HNKf+rgqTjgkKi7NU22vd2H25VAEYkmNeFkBAaeS4x5aOmrcQEXbAM3jfZVNrdJHZ3SxWN8N5/8181y4/RNNGXDY9IdSrfyfip8jWgI085FNeOucmy7pwlvlqgHgdgypCx8hdecw8rWAkEcUfy+8JU9+6ZJxYwyJNZHm5xCO/SiEqr5UKy9j7fj6h78cRhughQb+d66QWCZvZEEmF8L8A1Audb0Czy+du/9M5/5ZoFFyk4JFH8KhbDV89bag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by MWHPR17MB1550.namprd17.prod.outlook.com (2603:10b6:300:cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 06:34:15 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:34:15 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: sen@phobosdpl.com
Date: Tue, 30 Aug 2022 01:34:07 -0500
Message-Id: <20220830063407.1671668-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808222312.19419-2-sen@phobosdpl.com>
References: <20220808222312.19419-2-sen@phobosdpl.com>
X-ClientProxiedBy: SA0PR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:806:d0::32) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72cc7168-486c-425c-eed6-08da8a51a86c
X-MS-TrafficTypeDiagnostic: MWHPR17MB1550:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NiWeSi6KpEqCu+j4Xib5UWt25PrR6cKKhrk/lpwtYdlt5c2/DOOaVhKbArlD1iRp3H4q6xhZ8nxuHx+vNW1Eg+BGq7FSYDj8hIVdXPVKLYutrFT9uk2PiE9AZXAjcqXy9qr7XTwXINkeCa3Mps06+LRjIG5TsmGF86h+0ma8oJV8dohL22i2yFJ/jnUV+jlHiQxgsgCFbNQ6lOG8x0/lvEVfpU3K1griQFVXUZMrFEXDLSu/e8NKBa3ssF4LORRBONyx2tMeb2NCZg1sO8ghDJlt6tL1SGneSzwHctfyQ+m9Pb/05QjJ7UBb48yhX9tL9XuPgMfYiHDfdKUGZDWkNTJD/Fl7YE/CaYAmp7wENidyfxLv+D7Uj5L2OCF2iqzvDtnSgraZ0kgxq08YO87R/oK6lzbszyj9XwiZUF5mm7sWXzZiHCWkOzwOxVjunFpsVTnU8a4Hql5hSgFeIv8fQxoE6PwsblNGRCHAsZLh9e+Vxn0qRJb88tseACA4NjYjwD6K+kgm5EISTn6FvfhTxJUtk2Z2F14ifHrMyTTJiN64LXTfZh5klKe/IzjElSozGZElbhHdjMP6gyfmziIbJDZZDQh/P82jfqOcFLSuwo1l8a50bZdiqpAlr2jcAvz1l9pfjvHYsertgKGTJ9t8gnM+C0dgG7lFdBP4MDlZmPz1TBr0Nz7iSoSijEVyv4ceGkF9Kw/3+2mPQ2MRMPv/w8kQYi6AaZtxvFfCXs3CKS4di/JO87awK35IL8yNh8OKewa3TxP6KyubhS31vSYwvVhVN9VfAzUndB1IijqrGCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(136003)(396003)(376002)(39830400003)(38100700002)(26005)(6512007)(166002)(316002)(38350700002)(34206002)(41300700001)(6666004)(5660300002)(478600001)(86362001)(8936002)(6506007)(4326008)(6486002)(8676002)(966005)(66476007)(2906002)(53546011)(52116002)(66946007)(37006003)(66556008)(2616005)(186003)(83380400001)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uju8hjv3F7Rc3bllM1GK9Qccb2Q2xql/LFqMVEoNQgrO3TVcZeTrvnJR7foz?=
 =?us-ascii?Q?Vy/6HQkQn+vF7Y2i7IM92K7R9wFGRSsqQugQgLzT4i+DFqGT0UCgGHs3ZDHb?=
 =?us-ascii?Q?kQGPcaHxmzDdOV4VcrmU8dDYS1xRzV3V8L6k7iSuimTqGfydY86G7YkQeBHR?=
 =?us-ascii?Q?ly8oE3CJMZ0gAH+1JbiwkJwzR/qecEtiEeTIWZfHe5YtmjjBy3UXyPjc+P9s?=
 =?us-ascii?Q?Pn2Dy8TEgpMqdGeA9o/C2rfWLdueJ7n8U01ZeHlksFjGUu0wv07A4P/rU9NY?=
 =?us-ascii?Q?EbNcEB/04vaJGQ5U5ycGi/bZn+inKN5uCxO87F9hrCjBUzXkI1ZqSaLa00Vw?=
 =?us-ascii?Q?oGhRo4YBFXUdf155YScW8//elz1rvSjdjhumzbouARaxWM3+ys/W34l73dsG?=
 =?us-ascii?Q?RnLJJp6kVGtOHSh7yenSPPg/Bo0MFjJ/nMWJBycyMO7FZ590idvHlwS7cANx?=
 =?us-ascii?Q?kTvqHLBZcLwm8wl0qNyY5JPoslU9Aar3r1gR/689OzcZYhCt2ptnHwTzCKi5?=
 =?us-ascii?Q?8nMXu5ofSt132mWjciUIPAt6ILvvcNSFffvuoE066nOTkZXxw21q24Xu/i+O?=
 =?us-ascii?Q?BV2WC1mnp9qulk1miHzAyMyOd6aa0NcTep9J5iNfye/d7uFpeJqxpW0f/X5I?=
 =?us-ascii?Q?RbTdSC+SvYcDQwOrymszvISoG1wAd9ko3mW+riGLyYr06f+4vcD8BJOBKC0e?=
 =?us-ascii?Q?HzyNzW+cHnHNQGpU9adRSdVvC71alkRccUj6bNVMvSq+Nssv4dNsgqux4q75?=
 =?us-ascii?Q?d6ZnhxJeN0r/274P6PV8aU2PvaTXzI/u/JkCwKST/6W9+T61HfTgJeBwcpwL?=
 =?us-ascii?Q?tUreXrkqJ+OipQamtl/Zt9eaIiiBh2jEretdOGBrJxbQoof3X+5mARjFClsM?=
 =?us-ascii?Q?h8rjwsWB4vCK5myWT9kyoZsfmOPXQ3vM3I7dmTo8hRsaLLWCa4PXYU+QFhcW?=
 =?us-ascii?Q?GNFh5eWmLXTFJRkDfiD+BFn77gfU6lzY/vRFAI3XerGE93ptIHcEW3Bcdh56?=
 =?us-ascii?Q?BxOy2BIH3emVoERADnJd+I246eue0Pb7xQsLWXcaGW9eQDbx8u5fsttLrIll?=
 =?us-ascii?Q?Q46QFRTPmhS907sBECsafRS2y9HPHbyhlHFL4w8h4R/+EWb/L5UkSGRFM0um?=
 =?us-ascii?Q?jibI1C4Bdi6A6XhX21MZHJKjnftOSKKlwebowqJnTg5S20XCoTfdFq0jPwWa?=
 =?us-ascii?Q?wEPw1po8QAGNL6e8Wxsr9WGnnRKGZ76eCzudf7UQkiJMqC5euQMex2IkQD9i?=
 =?us-ascii?Q?0mRc5UNWid41GS0ao3sf5JXUYo3hORkA1pJ1aDPiyxjE3kG/Syw/JkCeAA4Z?=
 =?us-ascii?Q?kkBGt3iWs5yRwbMT2sjH/OFnAVyYVeLjwr1jsbAFRRnfUUQG9K3Ci725oQiG?=
 =?us-ascii?Q?3CcCYRjuKRfKHvDFbxQWZkbafsmxKHF7A3pkfxF1sbbcG+dbEVgOWObHj4PU?=
 =?us-ascii?Q?TAu/Jg480GRPKiAqBuP8IKNFMOvkY6qwE+u5dswngJPcQqvMinmW8MlT6xGF?=
 =?us-ascii?Q?ksIxHDKSz7xFWiYj0jpoPLXywssHjgEa8uLTqfxkexeuLchJTXKNHnGRSQpy?=
 =?us-ascii?Q?4F2C8wVIuyr99VZqggrw+Ppnwl+h+uhfHFNL8UxT?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cc7168-486c-425c-eed6-08da8a51a86c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 06:34:15.0291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lifbTHWzyebGsu6xQz9GWtdJNLr5U2zH2JWTovHvtS3ldv/l+uCGmu18LvIi7cmFpOSG/qFyhkpdwHKRc6cWdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR17MB1550
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGE4LWwZKaeIZpd5BQFL1PbFrifc7ACnILTPz71O7oE=;
 b=MNQnllpmdSSIIeLuWst7crStbHrqD79UVPHyU2mSwrByMPZQdxX3/gemprOEzfifFqutB5/DUxajqK7TPlpSv1wGf8l4nP6t3qp6oCAeY75LpvXVx+kAXEBIkO1TrNuuNtvTImeyKJQKP3ey25Ax2r+ab6iot/Wmpy4qDvVdzlI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=MNQnllpm
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
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

[note: I originally sent this out on the 2022-08-08,
but not as reply to the previous message,
so it just showed up as a normal submission to the mailing list.
Re-submitting it for the sake of posterity.]


> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
