Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3EBC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 14:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA4581383;
	Mon, 12 Dec 2022 14:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA4581383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yj7VZikZaO1G; Mon, 12 Dec 2022 14:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B0181373;
	Mon, 12 Dec 2022 14:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B0181373
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3CAC1BF390
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9158B405FC
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9158B405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSHf9ZyUddlq for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 14:32:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C620D40256
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062.outbound.protection.outlook.com [40.107.249.62])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C620D40256
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 14:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9ZOgYLz0J9W1ZcJEYRZcw1Uixw0iIo9s/bQY6uGuTEV3krqpYKZaaxIc/9SaTuPx2BFP0S4Usu9CUe2EGyUs/jHOkn/bFM84XShj2D/0wHVAheJgCc7Si8rz0KN/RixmAjr7haXRxi5Yzcr/KTfqI64B3GJj+pUEFLxBFTXLMdrBpIIOdjIijAo2XLNEQksThsEFYwc5C2+ErdsZo9b1F8BJYH+fR9yqn8tJ6NYDN1znqWT3SlEYC2QIjPV7vvlvXBXjLao9MYmnBQ9u6PC4ItozePdZB2GxYqDFY2LU81FOAKD6aMc+qyP4BF/iNSFdsoJYxCWRmcdr5lm5J8E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CazGukXJvXk6D104eN7pop1xeYoTF+BvTCFr1t4jMrc=;
 b=m/0eFnUGpZ5ZkOtDLLpIIe1hO9wFpZVTeuPDo4N7IJI1x/W++FBQgBBphn1ytXuGyF22UqzldcthvjRUQGcWkQBsDtYEUDTqi+N+1woZBsLS61X6dqPwoymcOBumWn16QKCQfIELoRTAqUCFtId8DcBfp/R5QhqG/wBDlK11AMsUdJrNXSW97GHYsPLr+JS5zADTmq28GZnTR0bnUeYKthOdFLMdjNkyD1odnTen/rQiVGahRullHYe9m8/62eTlEMJ7j8xm5eFrr+K8jBsprMAYDiN7YigVIjHHsodVqbR3n24zTdmLsIhaSloOoz5VVUoy4Ejx0lA50rZsk4TNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM7PR04MB7078.eurprd04.prod.outlook.com (2603:10a6:20b:121::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 12 Dec
 2022 14:32:12 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 14:32:12 +0000
Message-ID: <cca657ee-bbf2-2fcc-8e09-e7d7f6733694@theobroma-systems.com>
Date: Mon, 12 Dec 2022 15:32:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220917215300.1330070-1-james.hilliard1@gmail.com>
In-Reply-To: <20220917215300.1330070-1-james.hilliard1@gmail.com>
X-ClientProxiedBy: VI1PR08CA0207.eurprd08.prod.outlook.com
 (2603:10a6:802:15::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM7PR04MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cc5cee-5717-401c-d82b-08dadc4da710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxWO/4SWu3MelQ+xQEZO0nwDcSk7QUX1LU5r1rH4Km49gkj+z5Qp9hmpVCee3BjsXLyP1kQYSsGychRso6qJjD9WZC8N+5hyJegtrhTioti7UTiwDkyQmhiBay7hvXhD9HYdhyIjrLLVYUmGI8R7NMm/N9TIwCS918SBOn6upCNEdKpGqqfFN5zBogebmgxlSiCiFjeXHpqd3YH3l4UFFaC4cXDIpgfmYzp0duJfM3S0QPg6RazmMizOTwSBADWIlKDAeZhpCgOwzqzLbwO/LLj3Ta88jmM+GvkhVLltBPkEXCwQ2HLe+eHnU0zZ0loDf+Y05JC0QObAfAPXdaF8++wZJhTtdy3Vv/QZjpIGZyG+nYkaF5hRT3RvgMdUMoltCG3FKn4KGRDi8M1pGJXDQnSBKfTZwXQU/45uBpfhRsVVMgCe+Se9bvthFyITukcuZwUJPwE2nto1Ue3aHFSvpZCg/zlbyKI5SEGiHj02Dv8b6m0RbWcKj+SB1tPyyh9fYd3UaSJ2h6hFttrMrx5cmUYfDI2J6lFWOhGhor2PRHVIPhFY06EHAwdConnQE2T1+5kI7zeP7kSpOYYodVwafLy6fDN8reWZsXEJU4G+DHutnRnHIehMkYv7YCzBuq1dxhjYK0l/fkrUFP3xoO7yagwLs3Fi2j7Pu7SDDxzffV2ZXeT9ALlirSGdpCKXG2jT91g2q/9FDa1Oj7kgj4RBlSQzh1W993Ygo8GXvJuL9yYZ3V739U5gX9QuNtRbIYLddhGWNWuLmybUNlC2ixMtMNPSR3+nkGlFV47nID0SlJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(396003)(39840400004)(451199015)(316002)(186003)(44832011)(36756003)(2906002)(54906003)(83380400001)(6506007)(6666004)(31696002)(86362001)(2616005)(6486002)(6512007)(966005)(478600001)(53546011)(66556008)(41300700001)(38100700002)(31686004)(66476007)(4326008)(5660300002)(8676002)(66946007)(8936002)(41080700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxjVTlGTVVPMEswUzVUbFpjbmNhZng3ZE5YZW9CMlBPcEZDUDRkaUNBK1Nn?=
 =?utf-8?B?dkM2enpGSmtZMHdNUEVYRFdwQVNRcU1hOHNwckNGZHFRMGhHWXVxOXhyY3V3?=
 =?utf-8?B?UXBEQ1pjenNGald6VGEyREl2ellReWxxdTdBQ2xQN1dHZERRcVdJRU5SMGc1?=
 =?utf-8?B?blBjUmJiMjlhL3B4cWJySGtQdEh3d05KaW82NHVkV3FBa01WeTNvTU9xZ0dB?=
 =?utf-8?B?UytPWElwMy9Lb1VtZTBCS0l5VzZueUpjZ1hsQXJ6VjF6T1VSVFJUdXpTc1Zo?=
 =?utf-8?B?VWg1eWtEc0cwM0NVQTN6alY4V2RPVzF4U2h3L3Z3NXJCOVFibHFiaTQySm9X?=
 =?utf-8?B?L2xKT2dLdGh1WmFRNU4zZnpYM0UyekRwWm8rL3d1SUVyaGxJOCtheExRSzN5?=
 =?utf-8?B?b05EMWRHVFNaQUVKOENySnRkVjVoNGJXdUpCRm9CWG1BcDY3dEk2ekErRWVV?=
 =?utf-8?B?RVZWcHQ2ZmE0NDMrK1Q1TEVLV2psQU9ZRW5xNWkzaFVlUEFPQ0FTSmovRWNj?=
 =?utf-8?B?UTZKYXVVU0JQM3VSTjR3M3dlUjdlNFJvODcyRVdDWmhEbkJNK29sS2V2d3px?=
 =?utf-8?B?Yll6V2xJdC9XVkRPQzJWcTYyRmROaGFpa1V5Sm83cm8rbE1aTnZmSXlwMFZF?=
 =?utf-8?B?dHRYeGxyZDVWMVpZa1ByQ0U5djRpUi9OaWllNnZCVHR0d3RJaEx4WWFoNnZS?=
 =?utf-8?B?eUNlaVQwWjF0YjllSTJpQlI2dmhzTzhBZ2NIMDRpZnFYV05ZV09QaVc3RDZo?=
 =?utf-8?B?bEphL2RuUkNyQWJMQ0g5Y3NJVGZXVmhyMUNJYVp5SnJEM05LOUlJK0d6MUFo?=
 =?utf-8?B?WVVlUXZXK0hzT01BTzBIVjBuUEhSVGZKeDJXc0J1SzdhTnBNNElPbnhDcnhs?=
 =?utf-8?B?M0w3azFialNZQ2sxRzNCa2lhUDBnb29wTlR5YnZUc0haZmZCc1VrZU5JV1Yw?=
 =?utf-8?B?M0o5Q0sxS25KbjZXMFkrOVdxUUE0TVZMVTVjUVhZYnJrY2sxeERJVXFWV2F1?=
 =?utf-8?B?Z0RrbmhwWmNMQ1VkZWZoSHdQS08rWDh3V2tqL3dLbllDamo0VjQ5cVFOcDY4?=
 =?utf-8?B?K3RpOXFhcmRUNVJZSi92TmJJLzdwcElXaHp2UXhmaVR4eWJDWHhsd1cwcVFR?=
 =?utf-8?B?R2EyMTdzUmxGSnVHS3F3L3BRR1lXSmRtSXloMXphdU5HRGR6TkQzVnBHVWw4?=
 =?utf-8?B?Rmd3UlNjbG5rUVdGemxBK2xqOTRXQU5xWEpPWGJQR2RSTG9WSm5mMDNnU2hy?=
 =?utf-8?B?U0VlUjExRUttcXZjbVBNbU1CdnRNVG9ZWkxjUWlzNnRXZkd0ZldIOFJUSGpQ?=
 =?utf-8?B?OEduVGcrM0NZdmVENmM0MXRmeXA0KzZUcHRvWkkzRGZNNlE0Y0YwNnVjSkNm?=
 =?utf-8?B?ZjVIRmNwWEpVQ3dQcWNrbHlSaHNXVldZOUoxLzN6ZUpyaUkxT0lhWlVLc2l2?=
 =?utf-8?B?V3kzNnRqMytiRk43WnM1ZTFOQnh4a1Q5RzdQZEVzOTUrQzBvZ2MvcU5HWnc2?=
 =?utf-8?B?SC9ReENXSDArTVh5KzJjOHcyMWQ1eDYvQzFrblRUSXY4WDFuRTdoRmpuM2lS?=
 =?utf-8?B?MXlxQ0hHT2FoRlUzY3FabkYzb0l1UWpCdnVVN3M2NXhUWG5xWmNvMmg3WUZC?=
 =?utf-8?B?a3U0U0M0RjVaNmJsQlp2S1RWRHNJWFFTVTBrenBFYTc0VDVMaXoxeHUxZXZT?=
 =?utf-8?B?RVA3WDZlc3RCeldyOWxpWG9Wc0VMK0FCZnVRdy9KcUk1OW9yL1l5dlZ4TUdo?=
 =?utf-8?B?SHAyc3BhdFhHYWFIREJMZ2lNS2p5TlFQSjNPcmlGVy8wY2hVWlM0QTF4cFdq?=
 =?utf-8?B?QlFteVlCZUpBK3BYZzg5NlcrdjBzMkdlSWZuUHVoQlJCUHpwOFJBSHovQVdE?=
 =?utf-8?B?WUkvS2ZpRERDaERIK2pFVi9nbmgra3NmMWY4NmN3dytUanRJWlp3TnFNcG94?=
 =?utf-8?B?Q0V3aHI2cnhBZEplM3FPYUgrT3dUTXcxKzhBNEU5WmRmNnlNMXEySWNmdHBO?=
 =?utf-8?B?Vm4rT0ZmTU9zdlFEYjBKQllGVnZma2swbXNSWmJCbVE0aGFwbnRqMG5qcFZU?=
 =?utf-8?B?cjd2QXFuSmdpcTN6aU9YYjc1ejdjcHUzM3N3OWVDQllWcUxKdXh1RkkzT1JG?=
 =?utf-8?B?eHdXSW1pMU83K0dUWDdRcUQ5REJGRUlqbWFiclZJMm1EN0dWRUt1Q1Rzc1kv?=
 =?utf-8?B?NDVaNjh2TWQrK2F2NDBSSnVJYTNiMGZsdWRsVVcydCtDQzlsd2djTjcxdDNy?=
 =?utf-8?B?VDVwZmRrbVNkNVVzandJQllyUHlnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cc5cee-5717-401c-d82b-08dadc4da710
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 14:32:12.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+X+3QPrfhw920xlWPTVGH7mfbsAsDb1t7JSiZm7PFyzz/U5GrBZcHsooFUavxcmH8rDD6FL9TAOi8RSUsplS1Hxwj9PP4IfbuuXyGGybb+OCd4eiF+phNxOOW0A2EN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CazGukXJvXk6D104eN7pop1xeYoTF+BvTCFr1t4jMrc=;
 b=YwyihnpTqFicR2y+ezRnkeIjzjgOmZCgL4cabHLsC1n902neZ0EHua0iOLtLF9/i+Bpt9N06juzsjf2Rq40V4rZ9MClZuf34fjWZXg2RtwCvaAkMzsL+cZknNOz7ELnHlZvy/e3ULqOV2lmpmiXRkEgAwJrlN2BLnmzfOFpXRo99IDdYNbCYZRFzqHj+bwuIKqcVDDwY4LAmm3qBEqbewNjPl3tmMRS3VX6jnP6Dg5UIrm95pfy3N6VEHXw8lpI8QBSceFCNke/5S7ndJqUh2tzkU06LuyJTPFRuGhA/+fVxzegon933iMf2wDe7w8isDPJ0VcAzQRRtmQWxaWkKzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=YwyihnpT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.21.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Cc'ing Peter.

Can this be merged back to 2022.02.x and 2022.08.x as a security fix please?

Versions before 1.20.91 are vulnerable to 
https://nvd.nist.gov/vuln/detail/CVE-2021-3782.

Thanks,
Quentin

On 9/17/22 23:53, James Hilliard wrote:
> Drop patches which are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   .../wayland/0001-build-set-c_std-c99.patch    |  34 ------
>   ...on-t-rely-on-implicit-GNU-extensions.patch | 108 ------------------
>   package/wayland/wayland.hash                  |   6 +-
>   package/wayland/wayland.mk                    |   4 +-
>   4 files changed, 5 insertions(+), 147 deletions(-)
>   delete mode 100644 package/wayland/0001-build-set-c_std-c99.patch
>   delete mode 100644 package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
> 
> diff --git a/package/wayland/0001-build-set-c_std-c99.patch b/package/wayland/0001-build-set-c_std-c99.patch
> deleted file mode 100644
> index 69f728aa11..0000000000
> --- a/package/wayland/0001-build-set-c_std-c99.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 40c275f642e3895aeb748403fcdfd92d7d875d65 Mon Sep 17 00:00:00 2001
> -From: Simon Ser <contact@emersion.fr>
> -Date: Mon, 10 Jan 2022 14:54:02 +0100
> -Subject: [PATCH] build: set c_std=c99
> -
> -Set explicitly the C standard to use to make sure we don't use
> -features not available on our target platforms.
> -
> -Signed-off-by: Simon Ser <contact@emersion.fr>
> -
> -[Retrieved from:
> -https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.freedesktop.org_wayland_wayland_-2D_commit_40c275f642e3895aeb748403fcdfd92d7d875d65&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gkdvtCPbbGSVcFPgwKGENWmUnotcgLFoCLStfh-7BcjMPijnwJeD-eu13g9C3Nvz&s=5-9KliKLjDbRGj_rjnky6w4a9gzUAx2a7nzwikNoRUo&e= ]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - meson.build | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index cab267e9..e9691ffe 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -5,7 +5,8 @@ project(
> - 	meson_version: '>= 0.52.1',
> - 	default_options: [
> - 		'warning_level=2',
> --		'buildtype=debugoptimized'
> -+		'buildtype=debugoptimized',
> -+		'c_std=c99',
> - 	]
> - )
> - wayland_version = meson.project_version().split('.')
> ---
> -GitLab
> -
> diff --git a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
> deleted file mode 100644
> index fcafa98f46..0000000000
> --- a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -From 0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9 Mon Sep 17 00:00:00 2001
> -From: Simon Ser <contact@emersion.fr>
> -Date: Mon, 10 Jan 2022 14:51:55 +0100
> -Subject: [PATCH] build: don't rely on implicit GNU extensions
> -
> -Currently libwayland assumes GNU extensions will be available, but
> -doesn't define the C standard to use. Instead, let's unconditionally
> -enable POSIX extensions, and enable GNU extensions on a case-by-case
> -basis as needed.
> -
> -Signed-off-by: Simon Ser <contact@emersion.fr>
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[james.hilliard1@gmail.com: backport from upstream commit
> -0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9]
> ----
> - cursor/xcursor.c        |  1 +
> - meson.build             | 10 ++++++++--
> - tests/display-test.c    |  1 +
> - tests/event-loop-test.c |  1 +
> - tests/fixed-test.c      |  1 +
> - 5 files changed, 12 insertions(+), 2 deletions(-)
> -
> -diff --git a/cursor/xcursor.c b/cursor/xcursor.c
> -index 0506680..188be7c 100644
> ---- a/cursor/xcursor.c
> -+++ b/cursor/xcursor.c
> -@@ -23,6 +23,7 @@
> -  * SOFTWARE.
> -  */
> -
> -+#define _GNU_SOURCE
> - #include "xcursor.h"
> - #include <stdio.h>
> - #include <stdlib.h>
> -diff --git a/meson.build b/meson.build
> -index 07bbd29..cab267e 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -14,6 +14,12 @@ config_h = configuration_data()
> - config_h.set_quoted('PACKAGE', meson.project_name())
> - config_h.set_quoted('PACKAGE_VERSION', meson.project_version())
> -
> -+cc_args = []
> -+if host_machine.system() != 'freebsd'
> -+	cc_args += ['-D_POSIX_C_SOURCE=200809L']
> -+endif
> -+add_project_arguments(cc_args, language: 'c')
> -+
> - compiler_flags = [
> - 	'-Wno-unused-parameter',
> - 	'-Wstrict-prototypes',
> -@@ -79,7 +85,7 @@ if get_option('libraries')
> - 	]
> -
> - 	foreach d: decls
> --		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep)
> -+		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep, args: cc_args)
> - 			error('@0@ is needed to compile Wayland libraries'.format(d['symbol']))
> - 		endif
> - 	endforeach
> -@@ -87,7 +93,7 @@ if get_option('libraries')
> - 	rt_dep = []
> - 	if not cc.has_function('clock_gettime', prefix: '#include <time.h>')
> - 		rt_dep = cc.find_library('rt')
> --		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep)
> -+		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep, args: cc_args)
> - 			error('clock_gettime not found')
> - 		endif
> - 	endif
> -diff --git a/tests/display-test.c b/tests/display-test.c
> -index 763adc9..a6f410d 100644
> ---- a/tests/display-test.c
> -+++ b/tests/display-test.c
> -@@ -24,6 +24,7 @@
> -  * SOFTWARE.
> -  */
> -
> -+#define _GNU_SOURCE
> - #include <stdbool.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
> -index 9d43c91..a51ba8f 100644
> ---- a/tests/event-loop-test.c
> -+++ b/tests/event-loop-test.c
> -@@ -24,6 +24,7 @@
> -  * SOFTWARE.
> -  */
> -
> -+#define _GNU_SOURCE
> - #include <stdlib.h>
> - #include <stdint.h>
> - #include <assert.h>
> -diff --git a/tests/fixed-test.c b/tests/fixed-test.c
> -index 47a4dae..0b58797 100644
> ---- a/tests/fixed-test.c
> -+++ b/tests/fixed-test.c
> -@@ -23,6 +23,7 @@
> -  * SOFTWARE.
> -  */
> -
> -+#define _GNU_SOURCE
> - #include <stdlib.h>
> - #include <stdio.h>
> - #include <assert.h>
> ---
> -2.25.1
> -
> diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
> index cd4cb1a474..1c7fe705e1 100644
> --- a/package/wayland/wayland.hash
> +++ b/package/wayland/wayland.hash
> @@ -1,6 +1,6 @@
> -# From https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.freedesktop.org_archives_wayland-2Ddevel_2021-2DDecember_042064.html&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gkdvtCPbbGSVcFPgwKGENWmUnotcgLFoCLStfh-7BcjMPijnwJeD-eu13g9C3Nvz&s=HJGnEyJNAhDlQUHzGPjwhHsnP_axDkeP2O27H2XH744&e=
> -sha256  b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725  wayland-1.20.0.tar.xz
> -sha512  e8a1f410994b947f850799bdd0d95a2429d8467f853e62a0ab3915a4e9fe130f8aa977e03715114ab740c6ec546edea63d275ce7f927d4f3029ea126e6a7d215  wayland-1.20.0.tar.xz
> +# From https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.freedesktop.org_archives_wayland-2Ddevel_2022-2DJune_042268.html&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gkdvtCPbbGSVcFPgwKGENWmUnotcgLFoCLStfh-7BcjMPijnwJeD-eu13g9C3Nvz&s=8sbNBXCbWHskG5c1-AYEZZXxCB_AxZ8ZulaU8jjjuvo&e=
> +sha256  6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac  wayland-1.21.0.tar.xz
> +sha512  5575216d30fdf5c63caa6bcad071e15f2a4f3acb12df776806073f65db37a50b5b5b3cc7957c5497636f4ac01893e2eaab26e453ded44b287acde01762f5fdc3  wayland-1.21.0.tar.xz
>   
>   # Locally calculated
>   sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> index 4c19875bba..0a6e5e9ec7 100644
> --- a/package/wayland/wayland.mk
> +++ b/package/wayland/wayland.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -WAYLAND_VERSION = 1.20.0
> -WAYLAND_SITE = https://urldefense.proofpoint.com/v2/url?u=https-3A__wayland.freedesktop.org_releases&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gkdvtCPbbGSVcFPgwKGENWmUnotcgLFoCLStfh-7BcjMPijnwJeD-eu13g9C3Nvz&s=agz4qQ9q8rd794aDcN4iSMzXxN25JybdyV0outK4UvU&e=
> +WAYLAND_VERSION = 1.21.0
> +WAYLAND_SITE = https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.freedesktop.org_wayland_wayland_-2D_releases_-24-28WAYLAND-5FVERSION-29_downloads&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gkdvtCPbbGSVcFPgwKGENWmUnotcgLFoCLStfh-7BcjMPijnwJeD-eu13g9C3Nvz&s=Q1G1HWD5Npyv7Z63esB-vPy1u36r0lnkOwULmuVua1c&e=
>   WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
>   WAYLAND_LICENSE = MIT
>   WAYLAND_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
