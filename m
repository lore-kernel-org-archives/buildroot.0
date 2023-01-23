Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F106AC38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 10:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 843DA60C17;
	Mon, 23 Jan 2023 10:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 843DA60C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYOoCXOw2cGJ; Mon, 23 Jan 2023 10:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C377460C15;
	Mon, 23 Jan 2023 10:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C377460C15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 732A41BF348
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 10:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18FEC4049E
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 10:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FEC4049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ts7B4--yzNyo for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 10:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3B9940239
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3B9940239
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 10:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pedrf1PIQyuAAEkjIFNmQp2rh2IY4pT8SQTd8qNPCICoyxz6R+CawsF4wUuTCjHhpKwE49/xVYvpT+SBwjzR+mShmHlLoCiWqwcX6GJReo9BZAWpR6LgFf5bhyvyg5xEtqYMl+xzPGv0Xm5xgLpC1lMm83wBqAizc0zp9eNh55kNU0O+GSMjPywiAyCyHHLuzMQSwAPmkFAIpBY+56FXOrst7tqOYMNRqeUp2DvCQeKEv/1T1+G3HvNlSpUKuvDp0td4XlvSEBPn+coCX+Sk7OuShu6EG6Gu9tlu1OaDhIwdJeXFf9bcGVm2xzggGNyhzeR3Paasch4vjap2FelDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QevCsiYyl6RMf3YplxxNb2ntuZKIs4X1EkIvslHBkyY=;
 b=a6qHd6jf0T5HpxqSP+11YVejEw3KTO+aYyHZn2gmptoHieTYWKdfY7o7G8kmMoqTKJ65bbXURPxbMM2wERBYDrc7q0LZBEdVZJ6gK7eZkQtGCd3qqqdEDJrz07ITH4yYb2Rp5b2qx4N575H77o/JEVHKQl5FkDdPqvwbZu+KAl8ZTcN5Vi12fMdhac0I3sOu2aV0SZ9+6D83P8op/BW0IT0ebbJZsNkkcz+a/bYLiTxG7dn2+U1nFWq1KRe86PR9QV7xSTmAEwUS+o+QsXo+Yvl7TqFOqZmZ7DxkFWRu/O/ImFgUfUQ4ftUz8ncBqtzdMfDqhF3ferZUXVAWZ8bCXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 10:57:19 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 10:57:19 +0000
Message-ID: <0c911dfb-083b-f5f0-c165-a665fc92006f@theobroma-systems.com>
Date: Mon, 23 Jan 2023 11:57:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Daniel Semkowicz <dse@thaumatec.com>, buildroot@buildroot.org
References: <20230119143408.1911081-1-dse@thaumatec.com>
In-Reply-To: <20230119143408.1911081-1-dse@thaumatec.com>
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 9781bb6c-3279-42f0-585e-08dafd309896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yjMMZysjg49kS68qA1CsEa1eAAWbz0F161tHfiQxASf1d2Au0PWXHPRplgybYK2a2ZrqHgUFIZkD/th6THfBn4O7pdZ5ymncnsr7jUGr0zmvmsdOz+CpuYvbB9GKNebZ524gVdEM9hSKmT0Q5UXYvi1kMDq208Ji6GE14t+1CdKRuHddMav0FszUwVLgwa1mK2CNQMZykkvRR/XhC+qDqStJ4m1j9jXXRj95rDN9MTdOjOmH76fldOabzF0PStvtGTSslsnoTiwkeofM97FZfa4mu3FnSgU9GKwztV6cuvIn83+r6AmGsEz1dyGst/DghEmVoLMbi4ucaSUKszKCAkMeuiFvzU5KXio6UsEjkNaDxJScRghnogGlw7xs7KEba/5nF6XvdiY769qdzN2W6tPAAHDJf0TG460xWRHaTnb5RMuNZEFLtpFtehkl9bN8bxqrQv7uLSRgWeUnYQ6Q+aYItF4FwTD2j89sPuNL/WmJs9hTAdlhOXHbUkuxOLA/bbr/iIxOGWUoZVxr2YApI3+oH1AQJHMspLTp1iyXL7pr74A+Ro8rGXCn0A1mJvftCxwSd5VSI1T7NZ79CxENQLCjeppIJkEKMHxySWiMCXFLaShFUJi2sKQNLnWVY8De3ScnyGPRUfG+nTVhfZMOsbc7rctWvBJmKiPdcmHu1+GB6fTSE5VOBvSbN2oectcq9S7fowrelKwtc5/xeyj7wRfaqEJrOw7xEv26ML/kU5aCddJ0QRBHbGrzPtX051YXXPK+Q/L1RubedExFk0KoJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(451199015)(38100700002)(83380400001)(31696002)(86362001)(41300700001)(44832011)(2906002)(4326008)(5660300002)(8936002)(8676002)(26005)(53546011)(6506007)(186003)(6512007)(6666004)(66476007)(316002)(66946007)(2616005)(66556008)(478600001)(966005)(6486002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGVJL1lHNU1DbVF0SGVFcVlkb1V0ME1aRTF2NjY2dVNPQ0g1Zlh3czlqRzZM?=
 =?utf-8?B?QnhRQm5GU04zaCsxTTV2Z3FDT0RPa2hRamV6OU82YUJEZ29iNFloN3NnUU0v?=
 =?utf-8?B?UEhkaGlDWnBhbmJKMGE2ZkFselZCaGE4dXFIVGM4aW9ZZUpGTUFMRm9maSs5?=
 =?utf-8?B?L0tRVVd3ZlBqb0ZWdHJFSTVXc1Q5Q2N0amo4aVUrb0liLy9GWGx3Y2tTVjhB?=
 =?utf-8?B?eC8rVUo1UndOUnRGVVJBTHE2SXVpUUx3YUJiamMyd0ppVDRwdmc5YVoxOHc2?=
 =?utf-8?B?Z3FsK2twMWRrbWpZMUxBSUtEY200ZVBUTkRPWEdhWkpNWCtwMmlnd0RMQm44?=
 =?utf-8?B?WE9nWWdEejVoM3EwQ1N2VmNnSXhWaGJVWERUUStiRGJhcUxyN0FKR2F4TE1u?=
 =?utf-8?B?THBlR0I3TnFFY0w4MXZicFpiNWp3SHp0dE0zVUJrNUJvSlEwS1E3VldkT2Zu?=
 =?utf-8?B?OFBjZTZmdHM0MjBtWkNxZXcyaGc1MVRoamJVa0tPb2c5RkMvT0g1aDM2dkRX?=
 =?utf-8?B?SzlHMk5tdExmZVJZZGZqR2xjZ0daQ2x5VkZJWnJySHlLOE15bWxTYzdNb2p3?=
 =?utf-8?B?M3J4T1NTT2ZqallTQXpOeW1XTHJFNERqUEc5RDNHem5ibm1ET3FMSHlnWndG?=
 =?utf-8?B?RDNrWVk2MmY3OEVBTGxDaGJMYVJuRDh5Z1hNWUMvbVlWOHN2ckR4akk2TGd6?=
 =?utf-8?B?eFZYWDI5OHpGTVVoUjBLRGYrWlRwSGdVRDNDcXhneEFKeXpKZ1lXT21NbmZp?=
 =?utf-8?B?YXVKSWpja0tDc0NqaDNaT1JjM3RtZGtWVEdKcjhMRXdjMXZTWWxtY21aUHI3?=
 =?utf-8?B?ZVUzSVBQM28rVTU4ZnZueXRxbjhwSEVIN2VPZ3VMT2JEaHhHKzlOdlhtUHRB?=
 =?utf-8?B?UXRhdHNWaG9kK0ozRDRyYnVVVTM5NitWWDVFWmdUWmJRdnI0ekRrOW5GN1pT?=
 =?utf-8?B?ZUJEdzF1bUl5cEhrOE1zREdjWk9ESFMxZmdXMEk5TVNTVmlxd0tOUWZWdHhx?=
 =?utf-8?B?Vy9ib0ltVXVkbjV0c0hrekpoN0ZQSnExUElSZjEvWFRmdDFROUUyZmliZmgr?=
 =?utf-8?B?SGpMbmVUNzA3NlFnUDVoL2I0OGR5amVpd1FOSmMwU1hCdUF4NkhGVlg5eUQ1?=
 =?utf-8?B?b0pmNStReGF5T3NtZGd1M2FzZDQwaHFKS1prQy9sSVpxRTQ4bWVVY1BwTzMz?=
 =?utf-8?B?RDloZUhQcUFXNStsSUJEMCs1TnIzNHM1c0xULzRVdTRKZnZ0K0VTamhzWXk2?=
 =?utf-8?B?R2ZyRVIzVzVERm1ZVFJrZmVWRU0zdm1CZmQ2UENrelk5eTRIQkRZRUpKS28w?=
 =?utf-8?B?YnR3aGpJWWdtVmcwVGR5Z0lTY0wrUHBvOFVaVkkrT0hDWE05RWdDRTBEeHpp?=
 =?utf-8?B?REZ1MlV4cHVlV3NPbzFqSzFyNXQxNDhLSlNqODBhRjNWWFlXN2w1RVpsSUhI?=
 =?utf-8?B?NEVFWG45TDNkV2pQOVBKNHJra3J5UTR0Z3FLd3hYcUE2eUZscVJGWHFZZmZG?=
 =?utf-8?B?V1NmbmwrZTk0R2VxSHB5M1Y3azBHUjloNEp3TlJJeGhadXFsRWxRVGhMUVBM?=
 =?utf-8?B?SWVwY2NoYTFmTEpBNjZLdWlCbTBHcEZ5NWY1Z3BZM3dYejFERkF1d3d2ZEJq?=
 =?utf-8?B?ZEpldmk2Q1BHRjlVZnozbjZMaEIwYU15cmVwM3o0V0R1RGMwQjcvRGNoU1hZ?=
 =?utf-8?B?SEJFcnRGbHZtdEZsZytsR1JnM0Q2Zm1BUGtQeUw5cy94T3VUd2FMTTRYZWg3?=
 =?utf-8?B?R2FsQkVJSmhuS0Vpd1d1MGhKN0JzRnhHbk1CTmhtUjU0YU5hcmJvSDRyTWNX?=
 =?utf-8?B?RUtiL0ZlSEUvSWpERlpPL1VJRSs0WEJMVmNqdGZWZFYvVVVBUzZtY2dSNlcr?=
 =?utf-8?B?NEJKRzZCMFYyMHVxd0dJcjA0L3loWEthcDMzY3d4UzNVT3VBV3dUZWZxUUFi?=
 =?utf-8?B?TmVjcnFhTEEycmhvUnY3MEdKSDlFTjZ0SmgvK0NFQnUxamVkN2pxdnVhc05X?=
 =?utf-8?B?Z1lWL1JFUmxEd040cjZ2eVZDZW8vS0JCKzlaK1hsT0hnNFlYZSttUkJGWmxB?=
 =?utf-8?B?bXoreFRGNE93RTRDc25COXRuQVNabmFrNXo5RVNnU3JveDYyQXZHTml4cjlY?=
 =?utf-8?B?QjllUTVlTEpjVElDczB5anhUQy9VKzZWYnlkLzNLQW5ZNkM5NVkxWHVkMXhv?=
 =?utf-8?Q?9y3SJ3RJI6wD1+87oWxL7Fo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9781bb6c-3279-42f0-585e-08dafd309896
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 10:57:18.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxBGxdCZq9FlcsE6D80fEjZQK1q9vjVeg0go0Qcova4A70kfOI5M3kvgmf/zIXntbGbnP7fwEiKaW001XwW85jzJwwuDnJj10eXXhVIFgqKuMSWmbWJ71R36eVYwuxXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QevCsiYyl6RMf3YplxxNb2ntuZKIs4X1EkIvslHBkyY=;
 b=YF4jvmK3gqT6/lpuxL+7RD65n9BdIj/J6qvdklHHexRAiSs/yQh7bkMB7gcPSS+cVOSj6Gq1dl5Mzp6FrUyH312U/22A5c0TRHp46Lu1cYrrJwi1lqN8fyIdWOazaM/jYfH0aeevQ9EHAqHPtb/nk6l/5dJQgqNHuosKBvw0qT0BJMq7zQ80jXVBZfYuaSX2Hdu/77k5dWZxjDd3sAYQaWbVbHaH/7TndUgxtEz1ksaC3DaTZmOz98voLu6pYwX3bkzig6xgJ/LbxedMHZXb89sPorOfSlCQaXBnKjPc9ISftqf4rS0lOVmvoGSURSR3fhDCLZ7Zg6edSQlaTE/w/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=YF4jvmK3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] package/libcamera: Bump to version 0.0.3
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
Cc: marcus.folkesson@gmail.com,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Daniel,

On 1/19/23 15:34, Daniel Semkowicz wrote:
> Libcamera recently started to version the software, so use the
> version tag instead of raw commit hash.
> 
> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> ---
>   package/libcamera/libcamera.hash | 2 +-
>   package/libcamera/libcamera.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 68c9c1f005..033e318910 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
> +sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
>   
>   # license files
>   sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 9c03d3a3b3..8979a43aca 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBCAMERA_SITE = https://urldefense.com/v3/__https://git.linuxtv.org/libcamera.git__;!!OOPJP91ZZw!gtcDP1maf3PoJO88myqzbBZyOhNYHg7g4jGwno19jy5tFEHRgUuyBqm2zECw5wQOF6S4k8pRivumP5qJXTknCnAEvbE$
> -LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
> +LIBCAMERA_VERSION = v0.0.3

I would actually advocate against using git tags, they are not 
guaranteed to be stable over time (one can remove or move a tag), as 
opposed to a git hash which is guaranteed to be.

Can you use the commit hash please?

@Kieran: do you have manually generated tarballs for versions somewhere 
so we could use this instead of a git repo?

I also saw that Markus (now in Cc) proposed another patch this morning 
using GitHub archives, c.f. 
https://lore.kernel.org/buildroot/20230123083508.3041367-1-marcus.folkesson@gmail.com/.

Maybe you can work something out together or we can take Markus's 
version? Up to the maintainers.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
