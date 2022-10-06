Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA21C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 13:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37CE6104F;
	Thu,  6 Oct 2022 13:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37CE6104F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUCUu5GlyXS0; Thu,  6 Oct 2022 13:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A240460B1B;
	Thu,  6 Oct 2022 13:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A240460B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5BA1BF38D
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 13:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3461483EFB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 13:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3461483EFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VJyEJAWYNRb for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 13:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F33783EF8
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F33783EF8
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 13:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAiMufxlnt7episGmCCi36+oofhAft0qPEwejJIcux3pElOx+OWqav+27vUPETsJeX/iZoyXDDe2PaLiAJyK6Pa+MBL+y8LqPpGNUtL+6rUdwDPTTVkuhq1K97ec+iHxW43hWm5WB2BmMh1C3+h/heC8jvAfvGOOJdUbNCRrj2YMrqYKAN+Gao0SHG/LG2eBIhPqmfyjEB5/pHqajqbVCZvHuWiWvowwy6JLHNUIQpXsDkDGJllDRHxabgrDO4FIjMHfPYfvYSP0en6hHqh3zOa45UTiDgq2VgygEzV3nDslH3QCzaP4nKCaQ8LpojZ/7cUHDZWN0j+VwPSWrAnPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNh5ezNLI3MzMlGCWpVcdTEzZRwPN3VjNLGQZPjGFnQ=;
 b=S2Ff7DXG9bvQ9RVQyUymx4f9JO/VntI5C1gkOOJF/KwdsyrhKxQH4l1I1nEccidRWBMY+orTYJ4PtmXk2eMNQG+aYJtzQUAxQW8lcV/IWuJ0BLtowP5RrdgbRzniG7dd01aTTMypZRbZxDF5HSfr/enxK/evEUI5eatG8hRIWUb3Aswfm3pZ8fwpbT0KcfdZYtiAbIFRcDoifm0XPmb02fHtvNbmK21D3Kat/xzjROVpYIwihJjqGWHXMR7Q31X0S7ew+X4QukySWWTsG33Xk/rFK2QyFbRV94//oxjqmHH/q/KMjjvQ/EsML9uDQEck+ATkjS3VWeAcag63gz68HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7669.eurprd04.prod.outlook.com (2603:10a6:20b:29b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 13:18:19 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 13:18:19 +0000
Message-ID: <326f98fd-645f-5679-a0e5-6af19e8913ff@theobroma-systems.com>
Date: Thu, 6 Oct 2022 15:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Victor Dumas <dumasv.dev@gmail.com>, buildroot@buildroot.org
References: <20221003122421.39868-1-dumasv.dev@gmail.com>
In-Reply-To: <20221003122421.39868-1-dumasv.dev@gmail.com>
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: efb0f85b-deed-4161-77dc-08daa79d3c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEXh6i62UamOS6np1i/PlIU7lWcqQISHYz3u24XOtHnsBlazcrBKvHdfRfSNQkTS51Sqo0iGVc1Tw6eXQtco6+V/jMVhxo0CmTnRCezd4BvoYJnSr3YDMZa88xblQNs2cIM8F7BWVxLGgegSnXOXHY386Yw42XCUt+F/S0MWIREL6Hrd1kOHIoABb1RHaqwU7LUUC13lWu8O/XEhXbpa+umPGjAUXg/S9HomCbd7vEbgx7p28/p2iIIQPJN4baW/Zak0FvsuY3cgw0f2nhwEf4iKtsIShvxfLX6w+Ggz4AUDJs3dOCcD91MsNU0gdswXmcmgR/7zakstfrpyCTdvouxpaHhEA/2F39Hn8xzcvjAN7cbxwF7RbGWTDxN0eiXchAXQfD6hk5B9iKRA/pe45jQ1ADq9KpWDGR+s6QO6P5dh9wWy9K57FXizTbVKr/U3Y0d6ba0mK0vkTrGVzeEEWlhmwN6+l6htgl3OMPtHugdNzqU5QoEitB53PZO/V5rDidi34g7Io4RxEK9mKLLpNu3Uam3UqVz60334tl3PyLbmffLZKVdhbEW7wzeRuKKbynU0rcATQdeaItRPs8ty+x4VmsJI0+gWdEM7gyOr8IP6GB2EqV7CpMdZYSDZ1cByJKV9aOix4bJs5DNqlLh3CAdy+6Fd1yW55YPy85kHIEh6tJl7s18pl8xZZtmyooM/B93vWIHNRuKRoGMu1BmRZsAwgkWDSCc1l7RLaKTE1ZuK9P9Hd4R89uGrViMCU08sGW8uKweZf29NPt5va3rj4mMgg4f2hENobwbD2VTZOLNnFB6hyJqFEDSPdX6vrIlZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39850400004)(396003)(136003)(346002)(451199015)(86362001)(44832011)(2906002)(31696002)(66476007)(66556008)(66946007)(8676002)(5660300002)(38100700002)(8936002)(41300700001)(36756003)(186003)(83380400001)(6486002)(2616005)(478600001)(6512007)(966005)(6506007)(31686004)(53546011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3VEMGpGcFRoejRRSEFNMnJNZG40YlV4M0pZMlIxdWFmU29vOHZwb0c1eG5v?=
 =?utf-8?B?ZnRzN2s4bk93V3ZMbDdCSk1WNnJuNm1RNmVkT3ZCWUUyamU3RGhuNWI3NVFO?=
 =?utf-8?B?bDEycU9DTXFuN0tIOE5WbUl2dmxFNno1bmhkeFRDN0hrOFJTMmwrY0FSU0hv?=
 =?utf-8?B?QlZUNFZDOSt4MVBDMkI4ajJwU0V6dlFsc09BckU5UG0zOFY0WTQxVUl2Wit4?=
 =?utf-8?B?QW9HZU0rVWltNkFUOEo5ZkRHVms2RlVWYndYTEF3SHlKVkRSYWcvUjJwZTAr?=
 =?utf-8?B?N29CTDl5S2xxOWVGbVhyckdXbS9pYklWUnplYTlsRENzQjJEVXE3RHBPeVNu?=
 =?utf-8?B?aC8xSXpVUGtVcUFhekhERmhxQmlyRnBpam1PZ2QrTG92cytBSGs5RUN5SUNF?=
 =?utf-8?B?a3lOVGptT0IrQ1Mvb0lMQ21KWWlNcGd4NFB4SjNZOGNYdHBrUzZsVUxwM3Uv?=
 =?utf-8?B?c3llSnNqQnFNVTFGZWc3NjhFdE16NFZVb1dLeTlDUU5RbERmRUFkWm9mWmJO?=
 =?utf-8?B?SWxCYkRlWnlybE1EN3R3TnJlY1d4TnNISTZpMDhyRjBORXcwMERxUVpJNUJS?=
 =?utf-8?B?d1pEaWxLR3k1WFRyclprd3lCdWRCQWVObEpXaUh2YlcxMVlFZEdPZHdYbi9D?=
 =?utf-8?B?WnpOV1FDd0t5L2JUSlRHOXZTbVNPdHkwanFUL0RQZU1TY2F3TFdKaXcxMXVz?=
 =?utf-8?B?TjhEcGdQU0hiNjBUcmxtbnAvUTFOWGw2Z1RWNzM3ZElxbmZZOVVONkdid0hl?=
 =?utf-8?B?NXlZLzFEMjRyc3NQT2FoTU1OcHIxdVMzeTBoRDBEV0VMRi9wOVpsMTVucUJB?=
 =?utf-8?B?TE9PZURxSkpSQlBZRU1HT1ZSdmtSWXIyZWRIQ3NtdE1UVTdseEJKMUhYZ1or?=
 =?utf-8?B?Qk03SFVNUk5qQ3RIcng3VHlkMWdUckpkOEMzMFRnU250VS92djdEb3Z6SHo1?=
 =?utf-8?B?eUViL3ErcHJXN1JDSHl5bWlIRzBEU3FNTmFzOVRNdmxDZGp4UFVYWU5WaGVs?=
 =?utf-8?B?SGdSTjhxY01RbXNzbUpSbEIreUc3ZnhCZjdxdmVZdGRheDZtb1IwUHFrbFMx?=
 =?utf-8?B?aXlhWXdyeE1sVkFIOUdSa2NGLzBHMStwa0ZFdjlrUHQrckF0VytuN3BFM0h2?=
 =?utf-8?B?WjB6SHhmdnpHUkF0Q2lESDFqN3F5U28wYlJxVlc5Vy91WkVWSXZ1a08wS3VT?=
 =?utf-8?B?OElWdCtlVnhLN0FnQmNKMnQ5SGZzU0pIR3lpNzI4WWN5ZGVIODNTb0hqenU3?=
 =?utf-8?B?enNVUFM3VzY3ZEt5SkFuV09nQTRRcHZERFdxS0R4YWNKRXJvMTZCdkxIa2VI?=
 =?utf-8?B?STZyYW1ZOG4xL1FOYnpCRktGYVVySTJqSWhvS0NZUnhQaVZPNmtXalFuM2JL?=
 =?utf-8?B?eTBmcnROOFpNWVM5cUpPRFVQdFE1RUU1dUt4UGdxdUlvV2hFSUJqVmt0cjJu?=
 =?utf-8?B?S2xYRkU0RFQ2NVBPRVpHbU1KQWxqSHRHWkZ0c1dmdDJCbVJtcE9xWHFrTTJB?=
 =?utf-8?B?L1lSd1VtYkNjSEJlaDVvSWhjZ2JoMEk3KzA0SmI5N1pvVXpENlhLb0hmTWRw?=
 =?utf-8?B?cFBzMXg2TWprTVQrU3FIek81TjBCV2xER3VmdTZNb3lzd3dvRGVNNytCRTBk?=
 =?utf-8?B?Q3UyYUVhREFUbUlsdUdBYWRBSFNEbS9kZGJZNWZ1QlNLblU0NDdvMW16V1Z4?=
 =?utf-8?B?a1gva3hZSCtwYjFTUGdQcG5yRmNwNWVUdTVNcVZZVFF0ZS9kZ0l5MUVXZGtY?=
 =?utf-8?B?ZU5nSkJLaS9aY3VrSHhSMjRpR054L1dKQVl5eEJ0MjVBT3lvQXE1d3h5NWx0?=
 =?utf-8?B?dDc0MVZVMmlEcjMvMFVBYUJjVUZIejJydjAxNklMM0VIdGp5ZFRyaGVIYXM5?=
 =?utf-8?B?MjBtTm14bFFSTnRwZzFaTVBpZGZ3K1pmRGlJN0lVOE9sWG4yYW04WHorb01a?=
 =?utf-8?B?NHd1TlIxNDhEL01qNkFhQWJFQUhKZXpwYjNXYU8rQUx2Q25hM2VoQnVsNEpU?=
 =?utf-8?B?ZWZBVlkvdzVlUmp4Q0pNdnpsdC85eHp1VmtZa2V1UUVKVGRBV01veE10YXdM?=
 =?utf-8?B?dlJNNUhsYmVFbzNuWE8yaE9GWXJ2R2pOZlVYRVJZWGt1cVZNaGEwcTIxNzR1?=
 =?utf-8?B?K05zeEV3elhnaStoSmlvT1BNMCszOGR2QjRaSW5FdlpYb3NNS29XS1pYK0Jw?=
 =?utf-8?Q?UQEqQbXyG2Pz5sPMyQBsgA+Mq2We5Kclz+OxTfM6DSP0?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb0f85b-deed-4161-77dc-08daa79d3c4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:18:19.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9tAorYUzgJzWsErBxfNMTFpp3i971YD/Yps0fL8L5PyvkAZvoL4LMJt+FOlzmvx9CDupOnPtuREdWbBs/G57zBq115Lp2n4WAXUC1x/zzwhvLMfU7iK1PKFMxfPXGqO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7669
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNh5ezNLI3MzMlGCWpVcdTEzZRwPN3VjNLGQZPjGFnQ=;
 b=diZbht6EgyWTT2y87jjSe1Mfjjj7ZjND1ws5Vo/KlfDAY58Eb0uFxm/dfbC+wDBklLIX50ALr6zXUsCIWSUNQJD1RSPtjKTqP8QpVh3dwHK1dCEwNcO8EuVVae25xuL/M+mXaomn8fkD0nMM+/RNVUscHrMkprArp2mFk56IFESt/nH/ZstnzV/HAFEfRGSVrOWoi+MiCiXHWnIfzKhCELiBnz4MrePij6PQYuBdw0WDfA3AWhu6NfTrU8VMdLstO5sEU5QKAbDW66pZkzl6A+yQ2DSK/AAH40s8KIpNu2YnV54p2PLnaPJN2EsjJy44ginqcFOZJwF1dBScf9y03w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=diZbht6E
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] support/scripts/fix-rpath: parallelize
 patch files
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Victor,

On 10/3/22 14:24, Victor Dumas wrote:
> From: vdumas <dumasv.dev@gmail.com>
> 
> Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized, significantly reducing the amount of time it takes to fix all the paths. On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine
> 

That's the kind of numbers I like to read :)

> Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
> ---
>   support/scripts/fix-rpath | 60 ++++++++++++++++++++++-----------------
>   1 file changed, 34 insertions(+), 26 deletions(-)
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index 3e67e770e5..c842da7013 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -58,6 +58,38 @@ HOST_EXCLUDEPATHS="/share/terminfo"
>   STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
>   TARGET_EXCLUDEPATHS="/lib/firmware"
>   
> +patch_file() {
> +    PATCHELF="${1}"
> +    rootdir="${2}"
> +    sanitize_extra_args="${3}"
> +    file="${4}"
> +
> +    # check if it's an ELF file
> +    rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> +    if test $? -ne 0 ; then
> +        return 0
> +    fi
> +
> +    # make files writable if necessary
> +    changed=$(chmod -c u+w "${file}")
> +
> +    # With per-package directory support, most RPATH of host
> +    # binaries will point to per-package directories. This won't
> +    # work with the --make-rpath-relative ${rootdir} invocation as
> +    # the per-package host directory is not within ${rootdir}. So,
> +    # we rewrite all RPATHs pointing to per-package directories so
> +    # that they point to the global host directry.
> +    changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
> +    if test "${rpath}" != "${changed_rpath}" ; then
> +        ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> +    fi
> +
> +    # call patchelf to sanitize the rpath
> +    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> +    # restore the original permission
> +    test "${changed}" != "" && chmod u-w "${file}"
> +}
> +
>   main() {
>       local rootdir
>       local tree="${1}"
> @@ -125,32 +157,8 @@ main() {
>   
>       find_args+=( "-type" "f" "-print" )
>   
> -    while read file ; do
> -        # check if it's an ELF file
> -        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> -        if test $? -ne 0 ; then
> -            continue
> -        fi
> -
> -        # make files writable if necessary
> -        changed=$(chmod -c u+w "${file}")
> -
> -        # With per-package directory support, most RPATH of host
> -        # binaries will point to per-package directories. This won't
> -        # work with the --make-rpath-relative ${rootdir} invocation as
> -        # the per-package host directory is not within ${rootdir}. So,
> -        # we rewrite all RPATHs pointing to per-package directories so
> -        # that they point to the global host directry.
> -        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
> -        if test "${rpath}" != "${changed_rpath}" ; then
> -            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> -        fi
> -
> -        # call patchelf to sanitize the rpath
> -        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> -        # restore the original permission
> -        test "${changed}" != "" && chmod u-w "${file}"
> -    done < <(find "${rootdir}" ${find_args[@]})
> +    export -f patch_file
> +    xargs -d '\n' -P $(nproc) -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {} < <(find "${rootdir}" ${find_args[@]})
>   

find "${rootdir}" ${find_args[@]} -print0 | xargs -0
is probably more readable and the way it's intended to be used, c.f. 
second example in 
https://www.man7.org/linux/man-pages/man1/find.1.html#EXAMPLES

Also, xargs manpage 
https://www.man7.org/linux/man-pages/man1/xargs.1.html#OPTIONS specifies 
that -P option should be used in conjunction with -L or -n to avoid 
spawning only one process (admittedly can't be worse than the current 
implementation but could be better than the suggested one).

You probably also want xargs -r in the unlikely event there's no file 
found by find.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
