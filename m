Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65EBC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 09:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EC3340607;
	Fri,  1 Apr 2022 09:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urCEUbkkrwgl; Fri,  1 Apr 2022 09:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F79F405BE;
	Fri,  1 Apr 2022 09:11:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC82A1BF376
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABBE8448A
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXnkscjlHvNH for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 09:11:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EADB98440E
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qjhy4bXyeWXFRfy94hLndakfgiLfU60jhecm78C0TndUB+i5OfbOrW3a9qiokDPsnCMx20rtrICmXYSLzhO1u89d9ln8mNOF+qUZFSd/v5zjMvuwILiu5mKPROhCtyii0poVvM+AdMj52Ct6Adz09xIVPSnk9uGayd0hNwHC5qATItmpNhQG5WxFJE2XxrJ5SXMBehoo3ca+vUMEQcg2SsqOF+9DbNA++quqdrTqMTYoePv3qH0eV/ZPxteKmYPEHrjuwTo5Py4ASRBCLboB6ZK/JsN+snxi/yQMWyc1S+qLiMXIstoaBKtAzCo8oNLcm+I0ElU1kIkn9UaadzATPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2WBnLWsdy/33ahM0xIRDvpVglLBsi0OUw8PR9S1O4w=;
 b=RZYxOCZRW0pAN03930luAHPp4QAGuhk5CwEOIhGOJDYTAuti4O9t1a8CimhXeCx/feg2G40RMex0hpKMNFU6BKgPHcOqMK5Rubm/ZuNFeANwWnDSWSDsUYO3NVN6ALs/BcBJpRfBaS9tNLWlnp1TQzg+m3G8UKXqLYEQzVOs1kDSbPdOO3qIWmjmIrR/IUTrqgGP75971OI5GyI8Pu87Ks2cgbd/RhmDoYQ4ia+NdT395CJexPmfhyVh3xwvN+qOSbF/b3bvPfT4McZl5NuEgC/tRuJvc/TgBn7k4agMFt588b6Y8rEOjypGnyayn9am79+qaZZqfJbbPVEq7Sme9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2WBnLWsdy/33ahM0xIRDvpVglLBsi0OUw8PR9S1O4w=;
 b=Wib5Ug8QpC8ntSStRkVt28ed1ciK0Z+pK8b19n5OBT+dCqml/uf123CL52aoEUWrtob/WOyR2VrD7wv1K0r8tmXvmz6PQnS6G27VbqNGw1h4OLi7lxDop/TP1MPxjFu0CZPyZd7YjePSaiIQGvtDm7smnlDYD9PQOPyiytc47os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by HE1PR0402MB2747.eurprd04.prod.outlook.com (2603:10a6:3:e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 09:11:05 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::8ca9:a2e2:60c8:95e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::8ca9:a2e2:60c8:95e%6]) with mapi id 15.20.5102.023; Fri, 1 Apr 2022
 09:11:04 +0000
Message-ID: <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
Date: Fri, 1 Apr 2022 11:11:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Sourabh Hegde <hrsourabh011@gmail.com>, buildroot@buildroot.org
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
X-ClientProxiedBy: AS9PR06CA0418.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 402417d2-33b3-4ad3-3dfa-08da13bf8bdd
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2747:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0402MB2747E4718E2B13EFD70EC761C2E09@HE1PR0402MB2747.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pe3cYprSmSafEcb6Vq+6Kc/oIIGfuROOlNJZ/U74/lkF3waK08DLg1raIzQ15H26LWsud/FjjmcGYDqFroDJflNT7NUIiEicStMCSQbjlxf5ZlNj11/OIinKUflBoUslGUjqBdOfvjV/4GhoEDLhYRYfhLUjrsojY/I91wdNqaRB/IfZtqXg7g1LlSx1X6oaVLieS0er/N6559BCcrF46L0ofqd/3I8UkwScBEx++7budlQaL7YGyIBP+14RFko9FD50Loldai1mWrf6QhIqcELAye0UOpF60C0DygR0cGzIfA+l3hpRnUV6lJw60yD5gwpJ8bWMNnC1JJxlRHa4HCuJwsHa7Th5QvP+VGOEx5loJZ/wn8r+mhjkwA7Oi4cPZtU20mfesUvNBHh/VnbnMFke++04UBecyGiZ5/ht/yPKq6cgfHEFqLo1nnwPEiicRbNrK4bMsRKiLGMfQ5tORU4H/d31i6ar9Mw2kQvSAmTVi/V3SnWeds6lZQTBM6Heigxjnt8xMr8p9VWScm0qy7uUKn0OKyXSv+mc8rtDlsdiBbZYPrRxYMoGxSsyfvpKJH2PgZ4d7eJRW8y4fHp6TbtddT8aJhF9wkEbuFY/fLGztJ1FnZLx8VBNKxsg8qzHTR5KXbStI7j5GHQGYWfc7JcBR6/m+NnMDS08XW/nFGJ1jR+G4IK9I2HejawEjuSX1U20GBTt4p8VkPpVVDKRGtavuNevNFg09gp4aI17ZVdZHTWLGZmH23oiz1p24Hd/VyaK498bJ5/AV7f/cyxJmx5Ih9/JsOZnatPuqYgthCkx2XCWNT9N5hX65CX9YlX5O+UM3sI6IRt+vx+Nz1rRxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(186003)(6512007)(8936002)(2906002)(86362001)(83380400001)(44832011)(26005)(31686004)(36756003)(316002)(5660300002)(31696002)(53546011)(66946007)(38100700002)(966005)(6486002)(6506007)(6666004)(508600001)(66556008)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JGNHpiam1rbUNlMVRtakt5L0hDSEtab3VlZzBXbFRWVUFsZjVlVGY5Rmpq?=
 =?utf-8?B?T1BrVi9wQnpkbjhWRG04b3VveVhxT1JIdkVQOXlWaXkzZU1TUWkyYmpHRXls?=
 =?utf-8?B?SWtOektCdC9Qd05iUU11SzY2V1RpYjRZdFBXd1Y1alFxQWZNd0FpOTkyR3R5?=
 =?utf-8?B?NjVZNVFPSWlVeGc4MXpPTFN3VjhORCtoWjNVa29QVm1PVGx5WGZnTW93K3B4?=
 =?utf-8?B?eEJXYlJRY2F0M1VSUUZMLzc2V2U4N0xXc3hBWi90anUrdXRlelJUbHdnQWZI?=
 =?utf-8?B?U0JCTkZKMzhXa2o0ejZzWWw5OUtIRUNseExsQXNaeDFjYUljU0czLzV4WTZM?=
 =?utf-8?B?QmFTak9DM24xdTIvblVoekNhOEcwRlRraVB4c1FLajlKUUZhUGhBUGFVWk55?=
 =?utf-8?B?N0RTL09nTXAzck81WndjZlpEVkhVSHVPQm42ZWx5UUUwVFdrWHk5SE5UNE42?=
 =?utf-8?B?UUtIVXR6OWxOUklMVll5Qi96YkVTV01JYnFZT1htL1N5R1ZLMTVCMTU3VkxN?=
 =?utf-8?B?TENvYjc2TW0xL201N3A5Y2M3ZHdaQjNDaDlEOEl5YUI1ckRnMURTTFhFYmZp?=
 =?utf-8?B?Vm9Dcm1RNzM1TXlqU05YTmdqeHJFQW1qT3krdHF2MEd4Y1J5Y01BREg5bGQy?=
 =?utf-8?B?NjByeHo4Z1RueHVvTlhHTkdPekF4VmFBWnEzc0tOcUpOczBkZEVXNkRhNVB2?=
 =?utf-8?B?Y3UwaXN1aytNUnJKQU9vVURNSkFpakwxa1loNk5QOWcxM1I5MG1aRy9Fa0Mv?=
 =?utf-8?B?a052RHNqQzNKL1E1YnovZ1BpdzRIOThYTW5ueEJaZ2pyQ3YzT2xBZXhLZ2hu?=
 =?utf-8?B?aUpmLy84UmRXQWwrbzNsaTN4UTdSRTJFalMyQzFrS1pwNG85ZFVtR0dFRFZr?=
 =?utf-8?B?cTRBWUF5OGp1ZGJ2V1U0Zys4VGFJaTR0SUh0ZHllLzUvUUZtZmVVMC9GU3A2?=
 =?utf-8?B?TERHUXhzS1ExeVB4eEgxenRzVkkzZGdPSnJNWlpyRVcyM2dudUJQc0NXb1hy?=
 =?utf-8?B?blJQV25kMllVVFMxMWFqdS95YXZYUUZoYmFoZENvOVNRUjMrNXFYSzJWbWJR?=
 =?utf-8?B?cU5Dck5SN2pMYmVFWmhLd25iL1RwQUZPdHhzRk9HNHdWRHplM3lxNHh2ejFQ?=
 =?utf-8?B?Q2NVRElLNUZERi81N0kyMy9idjZRWm0zWE5od25hTitPN25MQmVFSDNXVHNs?=
 =?utf-8?B?TTRTdTFCZmxQZXd4QW9PZUwxNjd1SCtDZHlJTzFUZnlZUDBPaWluSkNySTNV?=
 =?utf-8?B?b25ROEJBV3hHMWJ0SGJUcWJIVDJWOWZIcGpCSDZXQXNkMkdoUGhERW1zNGYr?=
 =?utf-8?B?QW9jVGdZUHMvQzFkTjd6RDlWelh4MXpNTStJT0lhc0hCRWRDTUdLYWZBc2dN?=
 =?utf-8?B?bDhWQXozRXJTRzlLSElkaHB3SHlReXFhU2lTUUlKcExOeWpLVkh2a21vV0M0?=
 =?utf-8?B?Mk9UcXBLbEJRdWhSakUwWGczNkZEeUwxUnhhNVlad0UzNHhXM2FqUUFmckxm?=
 =?utf-8?B?L1VFVXNOYnNFREJ1QlNoNVB2QzhwWVpwOHovbzBVVmNXUy9RSUJwMFJBR09C?=
 =?utf-8?B?dWRzQ1hFS3NjQ2NlWHFvZXBQYXlpbThKaE53dGZZOWpPMHZOalZXREZMRzZh?=
 =?utf-8?B?OWFqd2FOcnN1a2RYdi9oOGFPYnQ1UmltVUVoTVkrSTIrQ0F6c3JWaUtZNlpy?=
 =?utf-8?B?VnkzWVlHU1BiK2lpQ3JTOSt1aS9OYW1pQUI5YmI0em80NTNPSU4xRU0vcjJs?=
 =?utf-8?B?Unl4RzBjUmZ4cW5qZk5DVGJ4dXhiYThOQ1pIVW9ZTDgxUjlzL3ZZb1o5Yjho?=
 =?utf-8?B?UTJ4bnVZdlkzR0RvVUszc21HOG1FWE5UT3VXcmUrTStPRzhlblVidERWS3hF?=
 =?utf-8?B?SnVCWmZ6UkR4MkdEQnN0ZmlrMjR5a3ZkOEVEWXdiekVPQ1BJd2ZuTUhmNy9i?=
 =?utf-8?B?clBWL3QvOU5JeHd1ck9UUU5CZXdMV2lxMDhSVjE2VmppZXlDRHR1L2VUZHdM?=
 =?utf-8?B?MVFPV0FHRGRnTUFMNDczZWg3a21SaXZXTTNsd29keXpoK0RpblV5MjE1U3dC?=
 =?utf-8?B?TDZmMmIxWlVreXdhK0ZHUWhjdERLZ1AwK3FXQjVaTEhVUEV6bGQ4cXJ0NVpQ?=
 =?utf-8?B?SnhVMjROemlRZiszdmVVdlVnS2UzNFFkTnQ5d0dJK0RmdVUxR0t0NmJjUkp3?=
 =?utf-8?B?bXlnZXozbHZsMnJ0STREckJucHFlVFBrdWpKNURsL1B0REFheHpZMVdySzZK?=
 =?utf-8?B?WFV2MkI3MFB0b3BFTUk2eldTOVFucERDZ3VXL1lkUXdXcEdWdlZWYzIrUWRp?=
 =?utf-8?B?VVpmNXRScVN5ZmRRWTZhK2JXcEIrUTlCcnhQRWw5ZDZUMmlZdjdvSkpDdjUv?=
 =?utf-8?Q?c8dekdKct35mV3HCLoUdZHPW7lC/AUjTEBMK+?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402417d2-33b3-4ad3-3dfa-08da13bf8bdd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 09:11:04.8351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLxh46ijfOxs4V+wtfV3w/tq6rYsM3YzotSJudn5gyg2SdvzZp3ca2mNbnaoAn2lx/NO8Mh844g1Yzp+W8SlhKGLi+nosUIt6YNU9feU+XvyqK4Tv8HwbtCZVp+3yewq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2747
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sourabh Hegde,

On 3/31/22 19:55, Sourabh Hegde wrote:
> Hello All,
> 
> While building casync using ninja build I am facing below errors
> related to /usr/bin/ld:
> . . .error adding symbols: file in wrong format
> 
> I am following "casync" build guideline from
> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_systemd_casync-23building-2Dcasync&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=0oAe2qUNmvkBsGYIiapGRQ5OQYDghVxojZm5QaWUwiQ&e=
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_ninja-2Dbuild_ninja_issues_url&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=7qFZDk5q2JFekiEteeOVNjQj50e86tte0akp-uMLm7k&e= > , it uses "meson " along
> with ninja build.
> 
> If build failures persist, run "meson setup --wipe" to rebuild from scratch
> using the same options as passed when configuring the build.
> To change option values, run "meson configure" instead.
> ninja: Entering directory build'
> [1/31] Linking target casync-http
> FAILED: casync-http
> cc -o casync-http casync-http.p/src_casync-http.c.o -Wl,--as-needed
> -Wl,--no-undefined
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm -Wl,--end-group
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> [2/31] Linking target test-cachunk
> FAILED: test-cachunk
> cc -o test-cachunk test-cachunk.p/test_test-cachunk.c.o -Wl,--as-needed
> -Wl,--no-undefined
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a -lacl
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> -Wl,--end-group -pthread
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> [3/31] Linking target test-cachunker
> FAILED: test-cachunker
> cc -o test-cachunker test-cachunker.p/test_test-cachunker.c.o
> -Wl,--as-needed -Wl,--no-undefined
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a -lacl
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> -Wl,--end-group -pthread
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> [4/31] Linking target test-caencoder
> FAILED: test-caencoder
> cc -o test-caencoder test-caencoder.p/test_test-caencoder.c.o
> -Wl,--as-needed -Wl,--no-undefined
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a -lacl
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
> 
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>   /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> -Wl,--end-group -pthread
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> .
> .
> [10/31] Compiling C object test-camatch.p/test_test-camatch.c.o
> ninja: build stopped: subcommand failed.
> 
> I am using Buildroot as build system and after following similar post in
> https://urldefense.proofpoint.com/v2/url?u=https-3A__stackoverflow.com_questions_27967802_libstdc-2Dso-2Derror-2Dadding-2Dsymbols-2Dfile-2Din-2Dwrong-2Dformat&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=xHy7bTlAyWOY4-lBdA9bwycscXiZBIO-Wkz7PZC9vbs&e=
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_ninja-2Dbuild_ninja_issues_url&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=7qFZDk5q2JFekiEteeOVNjQj50e86tte0akp-uMLm7k&e= > I changed the PATH
> environment
> like:
> 
> /root/raspcm4/sources/output/host/bin/:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin
> 
> But still, I end up getting the same errors
> 
> Can anyone please let me know how to resolve this issue? Is there any ninja
> build option to be selected in Buildroot?
> 

Seems like cc is being used instead of the cross-compiler/linker.

Did you use the meson-package mechanism in Buildroot? c.f. 
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_meson_based_packages

This should have everything required to compile meson packages. Define 
only the variables that are required and add one by one optional 
variables until you get it to build.

Having the actual package makefile for your casync package would help a 
lot if it still does not work.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
