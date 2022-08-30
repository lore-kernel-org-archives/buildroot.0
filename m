Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB52ECAAD1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 06:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B2D404B9;
	Tue, 30 Aug 2022 06:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B2D404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 662VW_vy8uWk; Tue, 30 Aug 2022 06:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9E034097E;
	Tue, 30 Aug 2022 06:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E034097E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12D571BF2E5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 06:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E197760E0D
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 06:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E197760E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NgnzaGddC9U for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 06:32:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 669A960BC6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2137.outbound.protection.outlook.com [40.107.243.137])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 669A960BC6
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 06:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjLfe4wiu/OKzHOYZXLNbaeSNnPppLDLWCgRjGzT/eRJHmB1QLhCfp752QzcUYdJeQGbSP3unyZD1sNkBwLnguZ7lQ2O+Zjg3rXx/ipfYaPjcXKU+QwfOR2QDhXDfX+gj5OxNykaIzfHuqnrgL/J3x2Res7lzyYJia8HD836AHCmdbnUEPcW+Bu0pnyra2aDj/HlgWYgXR+dcd53wTj9JDKXcZYW7bKmgISkCf8ARArRDkr8YRS6Vag4QE9FyhkhL73miB13Az6lNerzcUerpLL8uR6m4RAmYqBvj4NZZlcRltJAPqeOT6nwFe+1Z8YWaYGmnN0Blbhm3LSEV/rCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQvTvg+tlQFZjbZ8rS5aEfz4SaGQDIcu67PCejGgqyE=;
 b=OKqxM7rt9IYF3KrpNlz+Sv+3NFMoia7VVKKqRvTbFXz2ea3So819DHEShPcMkAHjE29DAO/LS2EFInpw/f+nUSuiADAuY7o6BpmFPMCtE9kyBeNuvei9ISytttr0jKyJNt1F8Py/jFdNaLOi0PvIOnSX7tckrOuji7ySwCsA3lk7ji8MXL3vGN6jTrU/X5Txw50f01Qzj1AHzCPFht+r9rM75oFcWff/ER0/IBTw5bfik6wUupd3AW98+YyBbU5oUurS64P8Ah0hLksvepwwMXqZUZpBfwjDw7elhqGdck2ssptV06gUrf55BY0xOktibdMXIU9GVLcjkgAcoEYCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by MWHPR17MB1550.namprd17.prod.outlook.com (2603:10b6:300:cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 06:32:40 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:32:40 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 01:32:32 -0500
Message-Id: <20220830063232.1671322-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220806235127.220d5546@windsurf>
References: <20220806235127.220d5546@windsurf>
X-ClientProxiedBy: SA0PR11CA0173.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::28) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80ccccc-27cc-4054-58a6-08da8a516fd5
X-MS-TrafficTypeDiagnostic: MWHPR17MB1550:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/okwpy9AWv8iWgdzjggtLMpJInWPcGqJePF4GJP2fiRGaLhtsKqnT9BC8Dokxel2I08VsLK6g2ul3sAbwmFVuYLJDztncsUUb9a9olp+jKxW1LCOmDuIv8oFaGKT7CnDgkbN7dAMKC3rDJGBrypT1O1IngLXe+z7CeodnqYjKDk/N4wgkGwxoci9DdxUYaXm8MjaRXfdrHRKprX/frY2wgoC31ls3CXcfSkPghwjsiFhKDUnO58Zhdc0fesPcHMIojeJZJqedbOjcQKan4SqBL6YlJUlmmb7tibIffHgLzZjyqHX4O4TnizW2WoWFZzCwsN6j9h85EhlojEGfBJIQLk2mx3YIsBKqVpAqxlyVO4VpIAQ5idND8KWViNaLRe/yduOGhV4Mce22vti+yLHw+QIzgtcbGyjW9r4a4weWl/rPqmbUtjWn3wgjbXetZSaBIaXLD+JTOI+bfBlcxn782Efs9T8YbgD+svMOLftxVICp4Kb7eKEZrfuy/LipyjKroLs8C7MTKe9Ruo5sCHokSP8uI0AvyXh575wK6HYvNIFAuYynyahGtpohU37c67704OnrtQsLab5o3GyAszavzUJOHv+pz9cufEmnNXA01S5dGTxOvzL/LTTX6X8jsyY3GvsAu7RiY36XNHpgoN+3zBvMjuOu+Yr0r+gZp6LpHZS76ix3URTHi6VLYipXp62MSk1frfxNocrY+Eqz1LrQSr6H9cz1OY2nvyANwLyt1acA6xrbg9ACsDM3g5lpyntfEczFRTS/zoaaTE5v/R8+xHamALDCzimnWLpIuu8xg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(136003)(396003)(376002)(39830400003)(6916009)(38100700002)(26005)(6512007)(166002)(316002)(38350700002)(41300700001)(6666004)(5660300002)(478600001)(86362001)(8936002)(6506007)(4326008)(6486002)(8676002)(966005)(66476007)(2906002)(53546011)(52116002)(66946007)(66556008)(2616005)(186003)(83380400001)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/mcRxQR3mwTWTMk2o38E9gGZJ5V/ey+meOjo8NKy9cNBv+9+FRUtUsUdoMz2?=
 =?us-ascii?Q?wHum7mEqR2XgmFwAeLiUbDM7eLGg1L45mGN2cbdsFExkU3cIfrbeDlfwVmOo?=
 =?us-ascii?Q?NUF+YW8VS63sNLdSJcynsvM29k3H9bkqP2e21wljwsY0AbPETRj+YyBEWNaW?=
 =?us-ascii?Q?Z5GploH2Z4TeWat1WbRyAXpcpNXTuC/psfW4r5wbuUWZA9g2QxyEXNrfM9/0?=
 =?us-ascii?Q?wkTkjRp9mv/6R3B+FZ2m/+j4no1xYZ0h/Avqy/lvJlFpKLq+QaPAyhQm6HhN?=
 =?us-ascii?Q?KD1oG6B5R0eNYy0BZkdGo1nqvEfrNV/F0ITtu6PYfoexU7EtU9qO+FuKS7Eu?=
 =?us-ascii?Q?GvD0Jw4ArefDJ52sDf2vOm3RXSfVF1mdEwIdkX1VqFueHgTG15Wd6qpi4Pn+?=
 =?us-ascii?Q?Awy9dG93207CQB73K38Btz27Sf/vEij2bfGfF8d5sVNradKjLIwmq7qhtgo0?=
 =?us-ascii?Q?PPzf+YqOg5TDCxPRkM9sN0+MhL3p3lYz8RGy8daoeTsdbQHKMr4ddKkq4dEz?=
 =?us-ascii?Q?Uwhu8PfLgVC6ihJUfSSnAUnqbI8Ha5Be+f2+SNF9yt1oEdV+BUOYpEJV84og?=
 =?us-ascii?Q?Hvs1Ypzon6MIft+Ebi189VK2mDFSt7kcsRCnldnTYDphd2TIl1UuqSvyVITr?=
 =?us-ascii?Q?IbDBX5FX0GJWFKgK7yd/eZbO/XphH45QnrCwvuWtdgT2bay+AEku8LTrWzbB?=
 =?us-ascii?Q?K0rR0vjqNr5m40KEXiYqF5lsss3iAa/NgubVm61Kx8bmNFC9ObxOpKQLYaNk?=
 =?us-ascii?Q?h6hrvmVP5M0LuZUBiC9sABvBQxlY7mQXH4BF3JUGMlve5UT5tPrW71xuOLv2?=
 =?us-ascii?Q?1TC8xmDyqkL+6FCZk5h1J/Gftmg98EaB7nnC8rSPp1fvBoMnFEjApppPIIzy?=
 =?us-ascii?Q?kgjWhgSbKWeF6uIRGuiAEu0H2yhjU2fVu3tQmcelUm8meNel7lwnGiUIlxWs?=
 =?us-ascii?Q?C0ICUykKZTS4p15upHF8uonoiOIUeh9PFoJ9a/WDcQG60Q5WAjoanyQSDbZP?=
 =?us-ascii?Q?JcGnHt8p/1su7YXFBbMfD1HcPCrUjc0tglcm4DKaU6hAiTvxsT7FqqtDd0ep?=
 =?us-ascii?Q?cdgYZAHAkLHYyXBvFXVqhr2SKf5ZIiqMdp9lcO5E4Jm7dGh4IoBnTFY0HFzW?=
 =?us-ascii?Q?HGRwnPbtU2HfVaEdWPdalVL9JQzvJyouC8yeb57OcZoK9xFbGidF1shZs4NV?=
 =?us-ascii?Q?Vk9qqC16FRtUctTBKDdK9boHSt7mk9DomGssWS7wGq6t2lc26JlCNVduyduA?=
 =?us-ascii?Q?YYdp5XZkKwi3HaeIAjdtNgzqQVhwsfqYBPBOBofFMbFCEcbIGquzLDMFHcbl?=
 =?us-ascii?Q?Ea292HVBCiWJ8i7W4+mQvUY1Us0dulgRRk4HHprwATTbP7tTfrhxeoGJz9HX?=
 =?us-ascii?Q?wMW0qghOoqiBFgwWeNEt2Xe6RZrTsMJFXvlRhdpsXnBwIwC26lq3DU5NyTcY?=
 =?us-ascii?Q?7q1UgLKCoBRm8zj4y/FBfrdJDhz1bimz4U9S9uxpml/URx2bRe5PlqawtIAv?=
 =?us-ascii?Q?QU8xIRMcseyTb1pY9TCqAvd74V4nxwdcYqbT6BZnycKp8uwjwj5gCdou9+yE?=
 =?us-ascii?Q?afbTCcviS+U7x4P7l3zydi18N0rREPGUanS5bylO?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80ccccc-27cc-4054-58a6-08da8a516fd5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 06:32:40.1926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /opeyk3qjh7CIxlxPGN1zgURW1b6oz75UYTmEjxIzndYdckuTgdb6L5eeZYZj1W8Kjt+KzV5gfWGrVMlkvzhYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR17MB1550
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQvTvg+tlQFZjbZ8rS5aEfz4SaGQDIcu67PCejGgqyE=;
 b=q7cPnZA7h2a8IligGw6TCC+cMjnXKBLs120F80Zwnj28fKpbJbaEMtad7F29Hrzx9dJnRFyl4HIcQ+KJHSLyKH7pNqW+GZ3v941Vbme2m8XYeVfGO6VlXk38MAAmwbrn4MTnLF4Stg2An79cgQn4/waelpnwSNS8fjWtNSuj4o8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=q7cPnZA7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: move to
 procedurally generated row/column clases
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
Cc: sen@phobosdpl.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/6/22 16:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  5 Aug 2022 15:01:13 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
> 
>> Rather than having pre-baked classes in the markup for sorting purposes,
>> all the cells in package-grid are iterated over at load time and given
>> a row/column class.
>>
>> example: https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html
>>
>> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> 
> I am probably not versed enough into HTML/CSS/JS sorcery, but I don't
> understand the benefit of this. Could you explain a bit more?
> 


Sure.

It turns out it's a lot cheaper (smaller) to have the client just
iterate over every single cell and give it a row/column class selector
instead of shipping it out with them.

sortGrid() sorts by virtue of all the elements in a column sharing the
same class (which originally was also the column label)
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
an explicit grid-row assignment

So now we have 26 elements in a row instead of 13 :p

The fix at the time,

(see: https://git.buildroot.net/buildroot/commit/?id=786f8b45672ebdd432f6af5b7595d3d16013433b)

was to use the package path but with "_" instead of "/", so:
boot_barebox_barebox and boot_barebox_barebox_barebox
respectively.

Also class selectors can't start with numbers so we prepend an "_"
to for the sake of packages like 4th and 18xx-ti-utils.

The problem I noticed was that having

id="column_name__some_really_really_long_path_name" class="centered data _some_really_really_long_path_name"

for every element added up after 70k+ elements.

the old pkg-stats
(https://git.buildroot.net/buildroot/commit/?id=eae86599ca81c943821bac33f424669520a3fa8c)

when given the current package list gives me an html file sitting at
about 2.9MB.
example: https://sen-h.github.io/pkg-stats/eae86599ca81c943821bac33f424669520a3fa8c.html

The current pkg-stats gives me a whopping 7MB file.
example: https://sen-h.github.io/pkg-stats/c245575.html

but you can see this whittled down by [PATCH v2 1/2]:
https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html
(3.2M)

and then by [PATCH v1 2/2]:
https://sen-h.github.io/pkg-stats/9ad05210dcd9e4fb6b6a45be87c0fbb3e022085b.html
(2.6M)

in essence, we go from:

	<div id="upstream_url__package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream" class="centered upstream_url data _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream good_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>

and then with [PATCH v2 1/2]:

        <div class="centered data good_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>

which after our column/row class assignment script runs becomes:

        <div class="centered data good_url c10 ir755"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>

and finally with [PATCH v2 2/2]:

        <div class="good_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>

and once again after the script runs:

        <div class="good_url c10 ir755"><a href="https://github.com/xbmc/audiodecoder.vgmstream">Link</a></div>

and here's the old sorttable version just for comparison:

	<td class="centered missing_url invalid_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream">invalid (err)</a></td>

So why not just ship the class selectors "cX irX" for every element
instead of generating them client side?

I experimented with that but once again it's a size thing.

Every order of magnitude (10-100-1000) adds another digit (character)
to the ir (initial row) class selector.

Right now it's about 300k which doesn't seem like much but could
really add up over time.

The pages being generated right now would be considered *quite* big by most
standards, so I'm really just trying to whittle everything down to the
absolute bare minimum. 
 
>>  function sortGrid(sortLabel){
>>  	let i = 0;
>>  	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
>> @@ -774,14 +785,11 @@ function sortGrid(sortLabel){
>>  	const styleSheet = styleElement.sheet;
>>  
>>          columnValues.shift();
>> -        columnValues.forEach((listing) => {
>> +	columnValues.forEach((listing) => {
> 
> This is a spurious change.
> 
>>          if (fieldText == "see all " + fieldTotal + triangleDown){
>> -		field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
>> +                field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
> 
> This is also a spurious change.
> 
Shoot, those are pretty spurious. I'll go ahead and fix that.

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
