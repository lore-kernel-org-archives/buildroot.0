Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66951C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 22:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA9F860AE9;
	Mon,  8 Aug 2022 22:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA9F860AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VT3M7HZZe_Ie; Mon,  8 Aug 2022 22:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF19F60AE7;
	Mon,  8 Aug 2022 22:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF19F60AE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 329DF1BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 22:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A51360ADB
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 22:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A51360ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lgie46EyLSX for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 22:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5BD60AE7
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2102.outbound.protection.outlook.com [40.107.101.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5BD60AE7
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 22:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROMuVU8p3o9BPttYuE+dIkICYdMyBA6iGrEeTkfYzVmoO7t1mnijBiMwqdK5XwdG63WlxYC+azoH0A4+1tueFRn8cqnYTgwXqrt37Zu7quVYQaKrB/gJ+6KQo9kAn5NkBiV4Lzg0Feycr7Fnr+/2nmxLD6qSGP1XrIMRcNrsVtw8x0xM8UNgfOeoSERRsBSNOlGLtsWYb+7c/I+mIcrZ6c7nHLtIhy1fEVnGWhv0D8saT5xKHOWcVvV0Y3Ue4NTu0Bv8tt53blgNswAllkpQakb6ndvZu44MHjEg+YZYcGatORwp5r+cQ7CY8HAa9AKoaq0V4CZhp6OZ4nrvBurD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NQJ4fqBEUeQAl9KANYw9uWWyaSHoeXwD6V2EaJgBnI=;
 b=oMMys+I3aoqwwly2KC41RUA3sLpAGMEYwaWFTwxbQ+x7NPBD0e2vrHf87nW9p1n3MgnYwYOsovC8dC/10PaK7ERkCRZmRlOuocOtnUUB0UstWNPOchiAT0GwEVtSQkS0c+wubEIV4L4Hv124hWbrqwNZl69WMb+wMVNyW2z3jj0zr8Zy2MDRByXAvZnMrnL5lG2fVDZGupFiL9NkH22+gCc0k4g/EDdA9skcxW56SfkwCSp9gFLzIknC5zogKhRPvcxUriivmtZo7H5Ud6bNwl+sNaQ6Xfi/GexfpMPG4Uc4mqiC7KTyxK2Mza/Yc13Xc4HltRYr2jdz4TS9c+KMgQ==
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
 22:23:39 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  8 Aug 2022 17:23:11 -0500
Message-Id: <20220808222312.19419-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SA9PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:806:24::23) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fab3586-6283-45cf-fd0b-08da798ca505
X-MS-TrafficTypeDiagnostic: CO6PR17MB4930:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FEZ+bLmpU/PN8ZXqI9Sg37jtssTz2Ryp/Bky4qMaLkvEBV+jwKYhjW4orHXiTN6uC4SnlERVDhsaV3CilUluaoowWcIZ7VgrHj4/xGagLgcsGL+BbFLloAvLG7/CsRv/oqi5Q8NzuXIs+cwI7VfeF+kSJbaSnv8W3kuWL0unSgBeA1bz6N9B7namLnZwyHcolM7Bo5khdi1LfKKS345Kr/pOLJ8IoqgV04iZwPQ/piYjmgx0nulh2oFinAJ4gruaPEce1hw1SiEqwvrzEBav5Mh73ESCXSVDE0sJ1bgwZp9e/sOPTfxQk3PygrB7gxY5aDgU9V5KE03L8LuUPYvnXJeW9PHDlZRwDrRCGPXUIy9bNjPdqqUen1J80KkJbMGut2GEe9khfEbN7C+6NEVzsqcUQkiWvjoT/3VuZwFyQtOVEU40p1tzs2T9+8ksYJhx+5TsYEttnlDnAPzIpam6cMUprmLCjHWaJObuEea74+qyyoVbFMTWp1FLYOulU5Z5h03IP/KNwi+07Z4fFjZfDC/YgdjE1RuEUwrcbtCaFBnwWgmHJ9L6/U9dWEPTQ6enXcJHe4FBPaJtPX6mKcTMe1VooBq6ubhCcaC3xReannexnokmv0fFl6ISQ7fwNtpZyHTmEUdvkvnAQTuqeXeeRsPOvkZ2EBZLYLNxjQSXGITbulzyN5bqRXqvJ3Mva9aoZssjbPQ8GFwHdquffZJufdfb1lpOKKJObeRCqaTK5Gs5urrdt0XIExatPYdC9r0UzFmFPPPvj8MA10MVZ+bXXbzaLBF/L7wbUZRp1i59f8noVEX1eCbUDJbGdeaDkKY/Ee1FYrPkjWwDzC+MtuMYSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39830400003)(186003)(107886003)(41300700001)(36756003)(8936002)(5660300002)(1076003)(2616005)(83380400001)(38350700002)(2906002)(66476007)(66556008)(86362001)(66946007)(38100700002)(6916009)(6486002)(966005)(316002)(478600001)(52116002)(4326008)(8676002)(53546011)(6666004)(6506007)(166002)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WQ3D89TkPgAtZsXp1EplwP71bnpg8jyzMJ6DLkvHjvjifF2k297TVcJowv1p?=
 =?us-ascii?Q?SNQcj7IOTz5WG1xHlnpiQMF2KKIy8W0EJ440MO1v6wPyCajz+9e66hTwKf4+?=
 =?us-ascii?Q?f28HHdYNBhOpByOoCifcLVb6FZpQDLpbloL0sV8JhDFBFfklNwWIgRXWdTD5?=
 =?us-ascii?Q?aGBOEiVXGOMh+nOsXXjEYRkAYy86Z6KPMd9QcCtds2/yyw7InfEtM5H3bnRa?=
 =?us-ascii?Q?kjEueg9WBts0u98YG+2PS6Ix5iA13FrSRx2H7SRF4mC64cHJTZKclz6Ue9R6?=
 =?us-ascii?Q?6QE3mfeHHVmyzffAC9eUIEqyAuHDffFPHl49LmFEwP+4gJSt9xSg8cEqmntN?=
 =?us-ascii?Q?QEEmOhtzlYRnR/jt4nb1+YAkYd+znG4hMHB/72IwVWf77VVRV0Oby2vSU0D3?=
 =?us-ascii?Q?h6idia3hWJ9phaaDJBz/Huu4uU1Edtr7OpTbuDXbaoeqv+STP9Epqwwdfs56?=
 =?us-ascii?Q?WfbpYs0ZU+n7GmQaW+0nET4M7geDVGtUAbAg6GC85npsufloGek9nBBvC5QE?=
 =?us-ascii?Q?Hdsknzd6tC5fX0sDYMS+ZDEAHuScLBkIpfqWLl9JzgXH38jHHdkruK9ZNHZ2?=
 =?us-ascii?Q?bccUjRleJln/eN3p09W5Vcy7Cf0/wk7DrwwRruD1wkQgNK9yB6advT8JW/0y?=
 =?us-ascii?Q?xJqJLc220YLlOjRvyjl6jPfmzCs0EZ/7QG6CVvezNkIiXL6b4CasqxYFLEzn?=
 =?us-ascii?Q?ZoNs5XDfF1KfURv8jgoKY1qy22QaqFZed4sjTyoQDEwzWCcm48kWr2m4PhyV?=
 =?us-ascii?Q?+p0Wgf5+NMTAqNaJhauT98D85aPAECU/AnVw5I7RbNXe2e1dKH/dG1hsWqJ9?=
 =?us-ascii?Q?4cqrdjwFBMFrwsYaR3y+fl9kCrekvAThaZLngSKkTVEcg+vVLE2Xy9+ibI7O?=
 =?us-ascii?Q?YQJ546wODqCZVE9GVzzA+jRkmxATaCUYnO668kFeZey0ZlLUWfVs3avXdoHJ?=
 =?us-ascii?Q?5nwQArQf/vJ6PGXB/Oyuae+9E6ayPU/pZZyk3LVb0h6EvWKqegbrgg50mEZc?=
 =?us-ascii?Q?FgU7XjpPQcjGDIZXCfqj0uoNG7gtqh6T1B+qwijsoKaJ2duUyRNBA+Hl8+80?=
 =?us-ascii?Q?03QLmQSxOvyMUm544tqcqy69QvQ87PNEWWnewLPsnCH3C0Gg4W5SiaCbgQcn?=
 =?us-ascii?Q?MwVbt1lIcQcf1aJWGSDc0YkLce304HXYMBJI/UmBKTBeCuyPgAu85ut04FyZ?=
 =?us-ascii?Q?TLMwnmLdzpn/DhV23XJLrmk6LvtbvtYtmydtmeKgn+so7GP4om+CslZiKv9K?=
 =?us-ascii?Q?pPKXjxJSdmEdOMGlwnRMuZUdJ0wp7dJSzP+dxzNa35dxzOZWudXRcPcixslB?=
 =?us-ascii?Q?/GKgOiyLh1EKUDKvdSoQ9A5aL91OBLbHzT2yPTVMmx+EAjjbFS52WLjjhd5H?=
 =?us-ascii?Q?EYaDdXwJScuW3PBocAPdS7Xn+SMQEFHe6mfn/QZdqZGDDhnR+hY1cJKqn3Z5?=
 =?us-ascii?Q?MbrYF3AnRjLUHtsWZ8xgfR1rmV5LOBjctTRfQ8ohwZbStuVelQg8/KrvYJ7x?=
 =?us-ascii?Q?1HgMCF0LHvVbaKU0Y4iSGa0DhUTiuUL8tkBgND9YAoF43yT1rGOaikPhmieY?=
 =?us-ascii?Q?7AF3OEi8INSOE6eqVcu9g9MLKP7RtCEfoJJU1eTW?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fab3586-6283-45cf-fd0b-08da798ca505
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 22:23:39.8455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hZeSd0fLnPL5UPVj6tdzZCEUk7cMcbSaTL5bgANsBsjMPe++y4XpQy10nqiWUzFJ6fUSrX9Z1FXH/QqtiW0jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NQJ4fqBEUeQAl9KANYw9uWWyaSHoeXwD6V2EaJgBnI=;
 b=bT9Y8WQ2V9NqCskvVWBx6iwJhyumcjMiQRx/UA12YfEbh2rroWZDX0IPFow0UOx/pxEXtYo9aDvZJlENIO55pwJXln61jSGvAnC22B9sKA/nBTh51uRKzheULcdYR90848baZNCaCoKG/EZzFEzBZS/aqwtUvGBQI/P9IFfp7+Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=bT9Y8WQ2
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
Cc: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
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

> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
