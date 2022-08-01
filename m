Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEDC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 15:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B6060B88;
	Mon,  1 Aug 2022 15:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B6060B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95djLWwHDeq5; Mon,  1 Aug 2022 15:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3A660B3B;
	Mon,  1 Aug 2022 15:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3A660B3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1551BF343
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EE70409A3
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE70409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QA1kXaoB4kAV for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 15:15:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69ED408B3
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150070.outbound.protection.outlook.com [40.107.15.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C69ED408B3
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 15:15:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv/6PBY0g8vrFgiP9khhfawzLL4GfZousX1ewqShLNHaKSMKUBgzcZeSPgZWuLxQJ+MtHid97o/QU+vF1Ql+NigVH+lKcXkL9SVDiXfITvLEAzig/ABMDps9dfH+a2fc51vXO6SBx0xx/0rr8Ql2Jg+hKjG5oy5yOSnJ23JLvMOtDEviNfCU5Lz17oEVeoOP610wenHlaMs1yqZGCzMRLSvOSQEU600OFXU4fD8OW0bx852814rzVjoYtgrXrHIwIfYjnKvu7MId9ZmxJV0tn6tR51xb3ctuMe1PSSPYE2kimYloxj8KAJLsQAlLvFMaSAul7BRu8wKBcMjqJq+/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A07a5whATx2q7XhtFqnya2QitRp8ArovoyKxHJpOoc=;
 b=lLZi5nqEzUpEL5au91lrkyMFqPX812WIH2cU/3PK23HDQnZ/JIZFn3lvsUaIVJ7NvDrEW0vPKae2LAzlNpp9HQwigwOZMsk/iWyiwyxWure+mPirad1KKJwWt9/eey6i0w04kMG/FjydHSNVkUlM8n4t9fU5pqmpeKr4LV8o4PMbQJRYkeSAEo7wlvV7r6KHskEBQGTNn6qZaJLhmjqCAx7iRWE/dj0Wv98XYTvOKMlGu7BNGo+lAe6y+BzdQvkF1RzNcXaRUbnFygLQFXcGz0fd/v/GhkStXqB01BWouhq6sgziOIoRCxIruAeOWofBBZP3kvKxBfIwzCNyrzdO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB5204.eurprd04.prod.outlook.com (2603:10a6:208:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Mon, 1 Aug
 2022 15:15:26 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 15:15:26 +0000
Message-ID: <eb16effd-22af-9004-ef2c-f330f351c5b6@theobroma-systems.com>
Date: Mon, 1 Aug 2022 17:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Quentin Schulz <foss+buildroot@0leil.net>
References: <20220801133041.2150607-1-foss+buildroot@0leil.net>
 <20220801151208.GA3168@scaer>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220801151208.GA3168@scaer>
X-ClientProxiedBy: AS9PR06CA0729.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::24) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d70c600a-f559-456e-126e-08da73d0a9c8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5204:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8NWu8NDZu3xkFj+igRKugC7IaFahtm3EyVVPlheJnf5p9HEr4tQx8/Km3j3xoLDB7AcH1sT3zvPrd9dxQ7x6RYICLSpPywhFtmxMuhQZwq1mWl0pKPfj9I+wQ2VIBvF0pYcj40NN6WTQXRzwtTVqfyzOWfMiBSRuT8xbmcRy4GT2bF9DYMRlawIy5dndr16y2ZwrcdbvYI9qmMu6Sn8xZ6TSnGWdwEEK1285YgLImNVMsUnU8zLSeEp8MtaZoUXJ31bfMANXiPGSUZE+fIOlJC6ajJjCn0LC77Itm5qfUP4+f3NAtRc7HxdUp5J5BnaXuNMThpDKhYf/W1p7BALmdZq7xaVuB9dDZCnin64uZ3w7yEl/ukUhvWHgSUavAkmQ2ewWCfK2ZPxZzFGou8BqrNiVRlxQqac8iubPIHZTvUE5BPwrCj8ul9t5J8zrPzVTZiaQ+tKxMKdsZ6CZTc0uAHX9MBdVcbfLOqMQhFx8duVY7vYTx25CvL284+/DTZH6zCujWab/t0P3PRrKHO7CWcnp0X54QoHm5dzgCtqEORfbDLFj6MYEEAl1TRO6y/BvbsEsghGIIAeRQJp0EVdbF1Ys5kP97o1YyMD0daOmGUJgChgNBpnwTPITdVAPmgzBeEAc8QYCsyhiEpzsGFnRtGeKE70cemW2l0Xm1jA5CUI6Qz/5FjBMxwE0g6hxRAOaZG6a1rgXBlQvxkgJmEJfso3DUXxdn9NDT9t+KtV1Unm+oQiDqWuzQSSGOJH5873lqgdMbK6bVs1kVc/ntX8sBe0PeLTyUIluiQH6JNOhVjUhB/TWkHAGWAteIpd7yOCIdYKo3EwQ1cDZzTlTVo6QHJe9gZSlwtFL41mxYfDt/JU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39850400004)(346002)(376002)(396003)(366004)(6506007)(53546011)(26005)(86362001)(31696002)(41300700001)(2616005)(4326008)(6512007)(186003)(38100700002)(44832011)(83380400001)(8936002)(5660300002)(2906002)(36756003)(31686004)(6486002)(478600001)(66946007)(110136005)(66556008)(316002)(8676002)(66476007)(41080700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anZ0UE1sa2pzcTFSdEFidnBOWWI1ZGlhZm9adVBUdVBXMDFEUzZlSGpSZGdp?=
 =?utf-8?B?YkNhRGd6VWtTam5hcUNhVU9rZHR4SXcrODBmNzdjU09NNW4wREh3Q05JK3ZI?=
 =?utf-8?B?Q2FjYzg5Rk5tR3pqZXhSY05vYjdvT3UrQmZIWnlOYW1CWFc2TytNY3JUSWFX?=
 =?utf-8?B?NlYyVVFpbUFYbDZmTHdMM1ZjeGdjZzN4amJiNllLaGpTM09Pcm9YSEg1TmZT?=
 =?utf-8?B?d0IwUUpXaEVjQyt0OGdtcE5xMUE4R1ZSbzFVUGQ0a1h2eVBHZloyb1JOSUJL?=
 =?utf-8?B?eTBqV1hqVWtSeG1HNXNGK3BkdzNJQkJ0R0hxRmpoSld2UWxUY2txZHBtRXQx?=
 =?utf-8?B?WmNtM3UzSjA5Q3E0NmQ2T09GdjUzUzZPY2oyQ2dOQUxyN3NnaFBpZi96endn?=
 =?utf-8?B?MXBZUzQyQU1xTFVDcmV3K3dLdnlyc0daMExIZTlhSzFQTkxaay9PRzRXaWQv?=
 =?utf-8?B?RFZ4KzhQTVVhOGxhaXBjUU41dy9yWmRZNW5JelFOMkdxUmZUcWZ6NUFRY1Fm?=
 =?utf-8?B?U0FBRUNGNjM0RTFuV1pnK0Zlb1dnamtlY1JlM0t0NWRxRVIxTFVzTGppcmNP?=
 =?utf-8?B?VEd3aXFOTStxdWdBbm9EbG1uK015eVJiellvUC84QnI4eEpNZGZSVmVMU28v?=
 =?utf-8?B?bVlGTlNkME1Tang3Zk5zNjVtekNlQ3NPaTRSZFdkc3pJNCtDZEVUbFBYQUQ5?=
 =?utf-8?B?VVh1TDk4VFd6T2I2NExuY1lBMXRWbzJ2MGZXVUZaQTZubnNLdHFvYjdjeDhX?=
 =?utf-8?B?TmdnWm1nUUpNTy81LzltSHE2MEFsSnEyV1Z0WGYzaEpRR3JMRDA2U09WeTRE?=
 =?utf-8?B?bUhQUVMvdXJnMGtqaGlMQXJsL1JXMVVNTDVEekVtai9xcmd4UWhkUW5VMjlh?=
 =?utf-8?B?Y2FjN3ZJZzJ3dXNaeXhNOTNYOFEwOGRJcURvOFhIZWsvK25uTmVzaXpsT2Zw?=
 =?utf-8?B?allTN21sLytHM1Iydm52UndmYk1ZSytLeWcvWUgva3Z3d2g3NTBlcWp3V3lY?=
 =?utf-8?B?R2lkOGpkRkUwMk1GcjN5dXg1dE9qN2VpR2tUcWczenQzTllIWjc0bTRseTNt?=
 =?utf-8?B?RWRVQ0p2ZTBKbDZEY1lLaU0yd3RZakQ4YWdPQklFczJUY3M4eUVDaTdlNXl1?=
 =?utf-8?B?Y3grbUxIL0xlZm9Jei9xNElEdnJNUFJKWXFKWlF2bFVkSGl0RkFBMWdQTys3?=
 =?utf-8?B?YWR1b1ZnMXRCeUMrelBXbk5hVVM0Y3hBTkVUNG0wNUVDUW9PZFoxQTJ1SVFR?=
 =?utf-8?B?L2xLb29kVUR1V3hicXUrVmZ6MDlaRU9YamZyempHRmJjakdQakFCTGkwLzNC?=
 =?utf-8?B?N0pham9HZW1wNTFBMk9iajlSakQxUThSbWtoSC9HNTlUdDFWRGhpSDB3am8v?=
 =?utf-8?B?Qzg5RjZMallhUDVsMkNrMWtwRjRteEttaE4rTHdUeFZIMWl5QlB3MjlUVmdR?=
 =?utf-8?B?UFV6YUVrdlBvVU1IbndTc25ZQ1V6RGpzNlBFM0ltR1RJUzBUajNxV21ocTBQ?=
 =?utf-8?B?cGFlRk00WFZrUzNlaW5ZZE5oQUQ2ZnFEclhFS2tWM1dzNFR1ZHNQTjlESzNE?=
 =?utf-8?B?cTdWUUgwN3lPSFlNWnljZmpSaDhqS284amJTOWlhSlVoNlpiWFJoRjdtSDFk?=
 =?utf-8?B?MG5lVmwzSjFnZmQ0NTZpOWFwZjVUeWxmUmovSUNraW95bVVHZmRYV2RtNXRI?=
 =?utf-8?B?RllLaWpwQnBWTFB1M0xxcDVyV3F5MjdiZmI5Ujk1UkpPLzJjSitEMnlibjVS?=
 =?utf-8?B?Nkc3cUUwR2FwY2pTYmVPZXk3YW01dEJEQmpTQ0ZvTGpYWVp3YlpROWlhRFNx?=
 =?utf-8?B?dHVyY1FBK1VPOENXd2ZYMWpEMi9BdUUrcG9JQnJoUm4xNlhlSzFUam5DRUgy?=
 =?utf-8?B?ditucE5TVVoxeEJVek1ObnRUYjlac1VVK1FrOHpWQ1lQR3UwTFRnVkI0bndh?=
 =?utf-8?B?OFlBNVAvSjdZM3p6Sm1oOXdzNDJtRjdtbFlKSlpvcHBXYUpaazRNMm5kMmIz?=
 =?utf-8?B?TWRubytUdzdna0t5UFlWQ0c2ek9GeER3OWM0V0JVK1krNElDS2xDRXVOSXJm?=
 =?utf-8?B?SCttMFlWT2diNEZFQkw3NUcrUmVlaTc1Z0FjTWdtV1NabStQKzFCQ2ZwV2t2?=
 =?utf-8?B?S2R1UUFYZE5OTUlZOGV6enY0QmM2QzdMSjdjTUhtMTIxSUcxbGJkNFQ4eitR?=
 =?utf-8?Q?C9CWzJmGN0sHAEUvdcoqako=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70c600a-f559-456e-126e-08da73d0a9c8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 15:15:26.6293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVQGZNROZBb4MeS2V1qG7VhThhyBb5frbe54RPvetnJFSKvgIcaVtOyHPbhDHEDWmyI6bjqhEJlOFLlD0Vv+lwQypVRw6ugQ28qkHXZeTdIXAQWzvcNE2ZD1z/ZepBFi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A07a5whATx2q7XhtFqnya2QitRp8ArovoyKxHJpOoc=;
 b=rnlaWHYLeU8xqAEjaia+sRzFQ5+WLsM74TpKbCgFj4A7AsQhVgPh40jdBsqcoHuQJUmvRAQ9wW7x00OIfElU4TjXC7zE/HFSUm/1+XY9LlW32GnkR53U+HLOP6PpEDSyyoHtivcuUm/SKECJdNt59k55oNQ+/h0eu0FVyI3DzFc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=rnlaWHYL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] Makefile: make printvars target print all
 variables if no VARS set
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

On 8/1/22 17:12, Yann E. MORIN wrote:
> Quentin, All,
> 
> On 2022-08-01 15:30 +0200, Quentin Schulz spake thusly:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> VARS is not defined by default, meaning the filter will not return
>> anything which ends up making `make printvars` also return nothing.
> 
> In fact, this is the expected behaviour, see fd5bd12379dc (Makefile:
> printvars: don't print anything when VARS is not set).
> 
>> Fix this by setting VARS to '%' - which is the match-all pattern - in
>> printvars using a conditional variable assignment operator, such as
>> what's currently done for show-vars.
> 
> And see da4cb17aa165 (Makefile: introduce show-vars, a json-formatted
> equivalent to printvars) for the reason why show-vars defaults to VAR=%
> 
> So, I've marked this patch as rejected.
> 

I should have made some research first it seems like :) Maybe we could 
print some error message if VARS is not set? In any case, unrelated to 
this patch.

Sorry for the noise.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
