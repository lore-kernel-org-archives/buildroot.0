Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F28C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 08:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB7E41939;
	Fri,  7 Oct 2022 08:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB7E41939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oY694ld7hA0A; Fri,  7 Oct 2022 08:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472A44187D;
	Fri,  7 Oct 2022 08:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472A44187D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4FD1BF423
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 08:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B11174187D
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 08:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11174187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nazgLse5Xn3 for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 08:10:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DAE74185E
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DAE74185E
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 08:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YodOLH0hxuf8OPFFweP77U50HMu0kc1U43pI3bRTdy7uUUXkv2Fn7kWTvZCzUObnWg2yPThul8nSGK2i2cElTdHZQ4em6LHCbgTiWQsx1Peot+UkPKxeo+UP/4MgBIpcdrXAtGNiLmYJieHniLICb5HeMhGRn1faFlo3KM2SaK5Gk/R8IPOE/BpML3LmZP01Xoc1bnVQc6LhzbHcyAK0RyL/1i79G/9AVtt6RZ0+oC/a1l62LlK6lO7s1WjOidQ7jeH3pykCxW+e5fWHNlHTBdTHA3NpMD2/dydgP9SYxgWtu/fX+SzV75OpDiYRYsXUUDTwIEDj16Z4UuEz0Z6Fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6AZSa9QrYOz+uqcHUAuTfue2/db6Z3yA4I06/NGRko=;
 b=klWTUodLR/ew6/+aWcTRhvuFHNYu6c+UmOgxa1eWjkJgcrUcI7/0jdS9KofzbzHXlwc+ghIC17O3Fn9H6DoLYxnt1QGZKvmCc6hxw8yVl1k0CIV/v5FbubbqJ2MwDzzXN4QIjrA3Q9HmH71L2JLMfopRh48+EkzIOkF+cpecmPnOaoOAW2cm94sdSSjJbLP1Q9RhOdZ7C36fZxNKLmkV3uqab36sVg8KZudEM23yS4DCJQz99p0SiePb3qVR9Y4kC9WQ8cVYGA1rXaHwjGs84QZzW22+HTJZkasRJfEo7fuE9shWvvkNW1+G1JAwX1w3h9kyBaGzMQwrQzq4bA/v4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VE1PR04MB7438.eurprd04.prod.outlook.com (2603:10a6:800:1a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 08:10:48 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.039; Fri, 7 Oct 2022
 08:10:48 +0000
Message-ID: <9cd26511-ec08-cd3c-3083-cd6bb58e483d@theobroma-systems.com>
Date: Fri, 7 Oct 2022 10:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Victor Dumas <dumasv.dev@gmail.com>, buildroot@buildroot.org
References: <326f98fd-645f-5679-a0e5-6af19e8913ff@theobroma-systems.com>
 <20221006155217.626248-1-dumasv.dev@gmail.com>
In-Reply-To: <20221006155217.626248-1-dumasv.dev@gmail.com>
X-ClientProxiedBy: VI1P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VE1PR04MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab7b601-eee4-4b09-e9b9-08daa83b7160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k5/DXa6EKy5v9uxBGmequT7NYptC24E4CgUBfDuYjENOSrTrMZmt5A+/NAx72tzJOM33AKnlHK75rNNOIvKAKxNYQf4E48BQsbJ3bfyjAXSUXdVWVpvSLQCqlGwyaVR/GgzcyR8VVjaOQgq5y8fQoPcHVYp0xCWZ5eEacR3hEUCxA/tr3fHm9YLag7YUWZr68fWet5WW7JQv7NMoHQ0dxqUKIxUFqpjQit8CHrqSqAFxb3XbU9kAiOMzZnmQYFd+neqG94m/VI4+OG7AFpyT00wVSqt5h/2l26V2Easx3AzPWWA5VuFl7jfIyoOMhQR9lF7oZPHsYwUyoK3taCo4zMHIVxYce/kaHADp+u62v8l2bmAKjnE86DDpxrlFow7aGAqxtUeH45Rzqyh6SIuGSpKoPy1TRBS3B5+dZQ4tktm+/RdGfJq5+APiZ041ObQPmHa9reknJ2T0EFtbNvrJx10n3Fq+IMFLO5ZN6bOFbEQxe0V0FPIjxrF3oixk93dNh6kwhY8yI4kb1WXyRks0OSPqMTKJh1+ddnTt2YV5ANr6hQzHZ6SA8lM/oljYATGicHLJJ0NlEwZuMSTgExJl8+BYfkZYZ7/u8SevQTbD8gkYsEfMuBr6BmgiSLTcKjnNgLMl+xO1dv3qtT+2JFw4MlFglYBsRgk31Gqa1LugP4JOfBt88JsJCQkAw4HZxdRJSqyjkt0vr9gXY0q3b3+5/Y2V/RqzkO8g25J1OQITY/Hl003ce3sp0M3KD2UqVrdxLLIloTpUZzm3fiNW1PFtoor5FrqEwUQvBc/ipXSoa30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(366004)(136003)(39840400004)(451199015)(5660300002)(38100700002)(6666004)(31686004)(6486002)(478600001)(2906002)(316002)(6506007)(31696002)(86362001)(2616005)(36756003)(44832011)(186003)(8676002)(66476007)(66556008)(66946007)(6512007)(8936002)(83380400001)(41300700001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlQZnpyOHAxbnJGYTVOL1pJTHhlTkNrVlh2c2lOS3Y3bVVuZnBrVkFzWHh6?=
 =?utf-8?B?RE1VdDhJdXVia3k1RDhkWDVLcm8vS1NrMjkxeTBBY2ZwT20yanY4bGF3bnlz?=
 =?utf-8?B?YUZsQXNNT25HdWhyUG5VYmxTQy9Remh1V1dYOUc0OFpjV3lITit4eXg5YzA4?=
 =?utf-8?B?a1QxL2prRGJkU0ExcmRHemRBc1lkME9MSFdmQkwzUWVVazA1NkhpUlJWUHhI?=
 =?utf-8?B?Z1g1TmZvVWJpbTdFMGRxTTNDR05hc2I5dUZJZUJUV1VqTzdRZ25ZbmtLcHRh?=
 =?utf-8?B?S2FmVWtlOFFBVkV0VDNHYmlMdEx6VGtQcDVNNTd1QkYrbEhGQVJGTGNlL1RF?=
 =?utf-8?B?aTRhNlBWUWJPTEdKWURwUXlpZG5rVmlFODJpWTVCNUVyRUN6bGRnWHFnNjdr?=
 =?utf-8?B?Zi8xWjY4akNLUXFDK0doUDNYTGNLSHVvNFBHeHFmaWR1S2RxOCt1NGtYdVov?=
 =?utf-8?B?VVFZUFZTZjZNMUwyazNUYllFa0xZN0ZTQ2pUSUpLUEF2bldmMFFPMFc1Z3E1?=
 =?utf-8?B?QlZ3S2lmejQya3g3eHRnazJVK2xRdmc2Y0dmSGtHZXg4ekx2WHJkNEVULytv?=
 =?utf-8?B?K0RxRUpTSnFud0tLSVJsSHI1b3dmcEZMTXJxd2FJbWRqaDU5NDRiTnJRWjdp?=
 =?utf-8?B?MDlFb0tFTXd0ZVNSK0NNZW1FbEtNOURtNlhZVUtwZHlxR1RnRWNnbVc0K0F4?=
 =?utf-8?B?QXZta2MybmV3a041Yjh6SzdxYUZpakpTMnRIbTBSSTVuZ1FLME1rUVBUVjY4?=
 =?utf-8?B?amhQMVhtYjBmZVNDdHhTako3aEU3VXRFQWVoOHNDTGduNlRCemRZejdvU2Jv?=
 =?utf-8?B?eWpPNmI2eXI0NGUrL0xSb3p0MTBhK1BOaVVYQ0I1WW9uNHEzV0l0a3VTZWZ4?=
 =?utf-8?B?WjhiU3I4TjV3RkpITXNDMjZRdEJXSEk4OFUwWkY4aVp1WkZmckxjNnNHb3pW?=
 =?utf-8?B?WWl2SEVJVEJZM1BUcXlBUWRPejJTWEw1cmdERmVqVjRGekN0RGVwUHcvWkw4?=
 =?utf-8?B?QUI5VVRJblRtbFZPNStCeVhmSWxncDhoRTNTTTBYY3ZLby9YZ3BMMjlQT0xN?=
 =?utf-8?B?bTdiYkx6Ri83VFpCdTNhRDE4TktQck9aK1hLVU1ZVWx1WmhvQWtrVzQwaFJh?=
 =?utf-8?B?Y2xqMTM0OHY0Zy9PZkNEeUtIMmlDWWc4RktmTG9lcHJKSXJtNU5rQkx2UmFs?=
 =?utf-8?B?TVdOYUlaNU1vcUtqeDk1UGpjRkN2cmh2NFJCQi9JaVlTVzR5NWJMRGZFazc3?=
 =?utf-8?B?S0diWFpuc2FvdE4rTHowbEY3WFRQQlY3eGw3VTVMTXM3R21JSWo1RzFBRGlL?=
 =?utf-8?B?aXNYei9KY082YWVyaHJvT1BVMnQ5Yi9IYzBPc1Zra1pBa3F3WDg0c0wvVmFL?=
 =?utf-8?B?MHBmRHBuSVEwQzVYSXc2MXhVdnM0Q2tZY3VycXNnelBPY3hZMEdIS3NBa01Z?=
 =?utf-8?B?cUFvUlUrQWZnM3dxUVEyeVk0UklGdDBXaUhBWENYNEZoeEp1KzgwZFA2bnVj?=
 =?utf-8?B?RXdiYTNhc0c3RlJmQXB2bCtONDYxS1Z3SXEzODlYTmFMU1ByeXdSbkZZWVZx?=
 =?utf-8?B?SHZCcXprOGl4SUw1T3NLc1FsTFZSSlBib2p6ZDRTbjFCUHpod1greXhkV0hy?=
 =?utf-8?B?SE5LdFZTbXNvNythWkZJYlczdzNBbDV0dVRPQ0V2a2pjYS85bDZqbjZnZGNF?=
 =?utf-8?B?Tmd4bmQ2Yy8rQ2Z5UzVEUmpvOU5Gd2s5cjVvRzVtS3ZRbWJrUGlZU2FiMXQw?=
 =?utf-8?B?L3hBOXlRV0s1dFJQSUhQemZWSUlkd3cwdnREaGVRYXJ5RlA3OG5lOGJEck11?=
 =?utf-8?B?Z04wcjNUWTIxdzloYnhmOEF0QmJmTU52b0xwTUlsR3gwQi8rb0V4M1ZqSkxr?=
 =?utf-8?B?YlllMStRNTN4di84ZTBSSUxvbE1Xa2ZmaDZyMURzRW9YSWlEaUxKMW14aGwx?=
 =?utf-8?B?U0ZXalZPYkJpQVpOdU82TlFVSlRWYytRTytoU3NjREdTTWJCaUtZRFhpWjRY?=
 =?utf-8?B?MThxbENoc1pJMDBXWWlZQ24vKzg1enpsSkJFTU1SNTV6LzRZWVdnY1RjMnND?=
 =?utf-8?B?eEJwdnZoWFlEeFF4aENrb0x6Wlc2L3Znd3U4UkR1M2xVOWRZK3pzYm51L3Jo?=
 =?utf-8?B?Y3VrN0VFaTVoYUh4TTlVVUx0TVgvZmxIRU5FMXREdEloNlNDTUNDSEN4bmwz?=
 =?utf-8?Q?1DvPjaA9/MPgzd4u5eXGN/Kaakj/EAGXj7Q44FWEAF+/?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab7b601-eee4-4b09-e9b9-08daa83b7160
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 08:10:48.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92bky1vPC8aUf64SkgO7TO3iJ6mnVtqiVGEwrUb28PrOtS+zIdmANeo5kH9+CHBkx7QVtJ2qhTv3vL+TSOJRPha1McfvUfYrWuEpJ97EK3w/Ta/QV9Rajm7XrxQR+KAF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7438
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6AZSa9QrYOz+uqcHUAuTfue2/db6Z3yA4I06/NGRko=;
 b=XYqrtJZW6mmw0wqeYp3iAVStWzg4denydaZcCdpojg/6ftePOJzgnyQf4os2dA5tA0x/cFXM7SHhqXVRc8v+aR4c40LXim1/N43rEiFPlOdzAFfy7pL45ZccvDhCVMOQR0VMeKNDz3dsARu1vWTk5Aw5Wz6Ys9dPaViNjb+pWfbkcoKzyiwc/IqFz3sWOYy9z+cb54hrZwalFUQOp73XLbAlY9llu3AJ6PDEuqYmLEBJv4fI1ViLeAL/fIxTKWKvWRNXJMk0YmkSl/975l6V3ykFdkfn7buKBJj/Hq4f7SXlIPRiEqQTbafa3zKln7H3FIf7uP5zKeYCDuxGW8NAiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=XYqrtJZW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] support/scripts/fix-rpath: parallelize
 patching files
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

Please pass -v 2 to git format-patch so that the title of the mail is 
[PATCH v2] otherwise it gets difficult to know which version is the last 
one :)

On 10/6/22 17:52, Victor Dumas wrote:
> Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized, significantly reducing the amount of time it takes to fix all the paths.
> On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine
> 
> Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
> ---
>   support/scripts/fix-rpath | 62 +++++++++++++++++++++++----------------
>   1 file changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index 3e67e770e5..c9d40e1cce 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -58,6 +58,40 @@ HOST_EXCLUDEPATHS="/share/terminfo"
>   STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
>   TARGET_EXCLUDEPATHS="/lib/firmware"
>   
> +patch_file() {
> +    PATCHELF="${1}"
> +    rootdir="${2}"
> +    sanitize_extra_args="${3}"
> +    file="${4}"
> +
> +    echo "patch file $file"
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
> @@ -125,32 +159,8 @@ main() {
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
> +    find "${rootdir}" ${find_args[@]} -print0 | xargs -0 -r -d '\n' -P $(nproc) -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
>   

-0 and -d '\n' are both changing the delimiter, I assume this actually 
does not work because -d '\n' will be parsed last (and thus used).

Actually, I think my suggestion of find "${rootdir}" ${find_args[@]} 
-print0 is not good either (though probably working since -print0 will 
be parsed after -print), we should modify find_args above the git 
context here to use -print0 instead of -print.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
