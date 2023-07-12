Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A475EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 09:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206A26117A;
	Wed, 12 Jul 2023 09:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206A26117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPA43RxmwE4Q; Wed, 12 Jul 2023 09:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8FEF61189;
	Wed, 12 Jul 2023 09:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8FEF61189
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC7A51BF3EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A249B4191F
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 09:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A249B4191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBKbC_ExPDr3 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 09:43:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A456941E01
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::615])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A456941E01
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 09:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gILkwXex/tu8qq4OQXDsrqgZqCjMx3qZLVMeDBTJs1t9aWFHvgfQGmQLYyxBvx6Mz1L0pqyY2h7ypew0mBGo79uWLmyMSHdhl3aEVjy53LH1TR0QC5zLv4ltJQ4G0h+DgP2l/Dtx1LX+EPPV7P1PPM1rFmi0xfdZvo3uITiPTqokODd0S4U66EfshSD2lMzk576DOMfRw9UEpFL/4V626Mqdd5Q3znnKXiW+pKJQKDHABzSK+06lYHX+tdrLlvJ0NJqqI2RffHg9KHpkDu3bb401j5nfMSv7oTUFMcPi8Ci60Euw5GAv2td+iLo9I1iYIkNEWFZ3iNcgwddisduGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiKURgob9MLd+mQ+eWn0cMGoiTLU3wVY4giNGh22t6M=;
 b=e3gwz9CHyfHuMsct/b32xqxHXKgYKihPv/hcuK4e/R8lLU5i+tZEruALmjYZkdlNPOOSFu3nGdZj7KZnR0QuuvsZcpnBQAv01qD3KV8oly+J90VclinF6Fs4i5ulgQPBKH9QQqIaMWrF3Wi5I0MxJQnP2BIwUwsxAXeRdLCAJgZOfGr5Qgp3+7oqGizN0ET2qcd4Jl+t98JQ4nhOutE8xDNpGTSCx+0tRR0E/y1k4zD9gXIeFlooAxbv2M+5OEB0YPjFJt5SF4btIbwCqZ60/mQKBc2uUHwgtRifdqDWLp/JGbTpzc4GFJcvYM3M99SHpsLu1azI4soN0j5AiGL4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 09:42:58 +0000
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::c9c2:9972:7f01:5c17]) by AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::c9c2:9972:7f01:5c17%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 09:42:57 +0000
Message-ID: <f345dbb5-066f-fbbc-4018-7205b3fdfc61@theobroma-systems.com>
Date: Wed, 12 Jul 2023 11:42:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20230709123355.17002-1-kilian.zinnecker@mail.de>
 <20230709123355.17002-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230709123355.17002-2-kilian.zinnecker@mail.de>
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To AM9PR04MB8539.eurprd04.prod.outlook.com
 (2603:10a6:20b:436::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8539:EE_|PAXPR04MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 629a72c4-4215-41cb-ecb9-08db82bc5fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gavvKHpFiN46Ly9Rc342/CSjmRwPN67ei2WPV1RZJxMeCfnZwbSgFjvyd4iGUOqmBdj8RAN30tpeYk+67Bn9rJ06YfXeJ3xzojJ1gUjSEA2c8SjqBLP+DSJkNC43y1PZ7GDH/o+HZrQrkdryVhXqmZPwsnksPKm45XbAOVubbK7LJTXpyHsNtADSrjUG2J/PgYmAe4hGz4L2un3JJOBWAlx8rQNeo5ZxH2t0gRU3QbPt3nvJuOXBCdSEl5mOuDeYQ7kunuQDXZn01LniLEfkB0pG5Jtl9bC3/+BSQZoaNrXZl+2BR+DhqbZa2NL3PFSPY3OoMQQ6HYdqKixbGz9LJLYN04Qzz87l557F6z2Jq1WNa9yBJOSvD47r0t7U0FtrJaLb7SUobT6IvT3/yh0jiI31otCF+LO+dVdFaWaF72czZyYF4lZLqo3SqKknthOTbcqP6lvaxNVfO+NQ6Z0xraWqHFL3q5f5PtSg91lsumBancoK39z73g0ujaC+QXXSlI0NpeRhZrNbNiBWcXWMdYjebGjInOO3JX2MnWahuhof5HtLMGfoUwaFgTRu5nR1FFEmvoG019cNnOtXVbZpXXE6Og5zBE8AIOTPTNwb4wMM7rOup+X/decqSBRIUMbV6DZebHCEchSFSkDIrRrGwiPa8tfVjcrS1D1Vuq/PLYrnASjpiH6/ySDSJKWxgzZP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8539.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(6506007)(53546011)(31686004)(83380400001)(2616005)(54906003)(2906002)(30864003)(38100700002)(8676002)(8936002)(5660300002)(186003)(66556008)(66946007)(4326008)(66476007)(31696002)(478600001)(86362001)(6486002)(6666004)(44832011)(41300700001)(966005)(316002)(36756003)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNsdk9vbmZrbm4vemVmWkJ4a1BRdTJNcHNOMUhwN3gydmhLNDFxb0VpREky?=
 =?utf-8?B?K2JaeGgzZEVNTGdwSG9nMWtLNThXMTBWUmRXZ1ZSQUI2V1JPK0Z0b0pYZmdZ?=
 =?utf-8?B?MFo1eU9KVE56QklEYXBydUNsR3VHRm9VK3QzR3QwbjU1R3NlV2RaRFNXWWQy?=
 =?utf-8?B?ZGMxMmErN1NBbjd3YVpXRHVXS1l6TXpsUERsV1hjSzkyY0N1elpzWU8rZEZa?=
 =?utf-8?B?bDkrSWJKaXp2UW9wTzQ0T2dFYmxvKzAvNmNOTVBoTkdNQnJrWExGY0dWU3NW?=
 =?utf-8?B?QUUxYjlOZ08ySXQ3dW9MUVBvajM4dlZ0UlFjNVBzL2VTbmU3QlJLREdkWU4z?=
 =?utf-8?B?ZTBPZ0FPenhkakZUaURpZXcrNUVzcVhkd0xoS3lyNW9PSVA1SkFBT25teTh0?=
 =?utf-8?B?dVBVajhVYTlCWmZ1ckxSWVpJWFpKNVdQaktWYjk4M0JpR3ZSUmJ2SHBHWGl3?=
 =?utf-8?B?ejN6WEJzalIxaXNNTkxXcVZyZW1nNzh3VktQNzZBUXA1bkN5RkdhUlFSakww?=
 =?utf-8?B?NURYT05JYkZqd2JMdmtCenV5WGV4dE9PSFJFZnFBdEhDcDB1UjdrRkdwNDNR?=
 =?utf-8?B?MG1hY1lYZ1RXQzA4aitxQ29vb0dHME9lb0tBSFJRSmswaTdLOEhrLzlISWZ0?=
 =?utf-8?B?MmowV2NwQWNvTVdzZkFlQjZiZDU5ZFUrV28yQllCQTE2SmJ6Y2syMUVCY001?=
 =?utf-8?B?MC9CK1pRRFRZOXZ4M2FZYlNMOGhKREtLWXh3MkNvcjBYWW85TlJFS3ZSRmFm?=
 =?utf-8?B?M3NBMU1GN2kvNHRuSEgvYUpkK3RncnEzcXQyL0xpZHRHcExwYWtqVUFsVnhJ?=
 =?utf-8?B?UlFEL2dWbk0yNWdXWEFxNnBZMUY4T2VxN0Rxc0tCclhHRklXdWk2cmt0bUVD?=
 =?utf-8?B?VmRKeC9nMDltK2tZQW00S1I2YVlCSU1xdTE0ZTMvRTd2K2kwZ05tcloyeWl3?=
 =?utf-8?B?Z1FrZUlQeHZZbDA4M0g5VUFDT1VaT244cU5HVDErUWp3bkEvKzQzamNQdmtB?=
 =?utf-8?B?SjhmcDFTWVBEYWFKT2ZLbFY4TTA4UkljQ2U3VVRNZG9mUytVMHBvZHZVb0RQ?=
 =?utf-8?B?RCt2YmpwVVpTV25CazIxYnN2RXBNdDN6TTE5ZHFSVTE5bXlzcUpXRXc3K1NB?=
 =?utf-8?B?VmdIelJERjd6cE4xb2d1L2ZYSmpVY2VLUjAxYi90d1A3cWRPNW1CY3F1UW1z?=
 =?utf-8?B?Y1dRQjRJSTdabFVqZVRtUTZNcFVOZ2pheS9LTTJPTTlWSlBJYjNLS1ZmaFl4?=
 =?utf-8?B?ZHhUNmlpdHdCalBmVy9taUh1c04yQnN4cklnOU1seTRVMW05MEt1eTBrdTFh?=
 =?utf-8?B?bVZSeFhEWlJyd3VFZVA0S1BQRVZUcFNHc0NvdVljZUVUU29PeGZpQVBBRkVi?=
 =?utf-8?B?YVE5OEJhOFp5YlRwYTNBYVBaUjhPclI2blRoUENzQVZPdjBxNGZSc1ZZaVNH?=
 =?utf-8?B?TnE5UjNUeE5heEVxR3JDWS9QaHVVL3IxckgzMW9ibGsxYmRzVEwzclJLaDIx?=
 =?utf-8?B?SEx5NHpzMURXVjhMTlNYUzY0K1M3VWhGaFltV3RhWWVhRnM5eXNYNDVEb1gv?=
 =?utf-8?B?c09WRnBhd2JVc2o3SzNXSWs5UmZzd1lmQ2RZYlZJWHg0Ym54WEdBalppbjlQ?=
 =?utf-8?B?RnA3NVJiMXJhNlRVTkczU2xhMUZtQWJ4SUgxYUhxTDNGRVJGQWUrU1IwR1dB?=
 =?utf-8?B?YjFUQ2IvdjdJT0dxa0tNWWdEYXJKS2ZtenVmSFJTSzQrU1h1RVFZWFdJeTBM?=
 =?utf-8?B?Um5pRStBUFdvbVRHQll5enRzUW53Tzd0NWJaa251dlQxWHpndUpwVUpRa01o?=
 =?utf-8?B?Z0ZZVS8xWHFrbldvTjBzUE1EN3FlL0tOR3hZNHFwY1BpbjNlUFNScHFNWThE?=
 =?utf-8?B?L1ZiNk5Qc1ZoWko1bnF1bWJtR0pZM3J1bVdPU2EwMTdqUk9jQVc0V1dyNG1q?=
 =?utf-8?B?TnBxVUhQNTNRclYxZjh6d1pjZ1JGMTE3Q0JUWFpDajBZYlUyTVEydE9MdVor?=
 =?utf-8?B?WlBmSTFxcHRjWHNKeHphR3RlZEhiWVdQbTFQV1JFaDI1Rk8xTjI0ajc2QzVt?=
 =?utf-8?B?c2ZHOWpkMW1IMEpKRXNQeXdRa3JaSy8vd2pCdGc4TEJWZWNRWEs5Zm0rRlZ6?=
 =?utf-8?B?TWJZSkJpTEQrbjBvQXBlV1Z4SmFsMVR1VmpKRFJINEJpZzVqdnhzMjlVclo2?=
 =?utf-8?B?Z3EyNHZYVnhCaTRlbDVrT1R2bjFyWENPNDd1WFNUODRyQW5rWGZIMENOVmZ6?=
 =?utf-8?Q?YUX3RpTMHuebHo3xb2spLCBZpzU1LYvxqU2XN4zjTE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629a72c4-4215-41cb-ecb9-08db82bc5fef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8539.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 09:42:57.8893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA1xbyci1bq+rr7DRJzpn054AoR2HO6i9Ekd5qgznbAjFx1dUZt96l/iG066UN+kOmfE2XrBRc+yBP3vJ0LMdIj4mcrokOxMPNLWcbKRmkWbnZbL8arVXZuJio8yae/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiKURgob9MLd+mQ+eWn0cMGoiTLU3wVY4giNGh22t6M=;
 b=LTFDsdls+AU6lFH9xd5ku9aNjeCnuO8YoqOuScjY8J/4I86bQwHbCjsgHyb+Oj+Ygqdu+9rBsls4BrddcGZvYUpjZKKJxxxFdOBl0FJ80/+ptE0tYdqmuhMF0t6P8Dev/vtjHiWvOHrzhJWGEgHYehD+XXd62qPqGNfFzC3Hr9W+26rfsIRf7XgsPljdr6dB/AAt4AecCwG9XkW26Nh3m2RWhd6YQ1fvPsodR5pcxlLY/b0TKHGwnvpl8LSy3JpPRNCevxGM2Ca3kH3+J2HyVgAqlMCN29o61uOrRQ8PdKbbpNLqEGxyA4RT/O2IUY8BYQ4BCDA8d3ewolFdZHlrCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=LTFDsdls
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v5 1/3] package: add rockchip-rkbin package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 7/9/23 14:33, Kilian Zinnecker wrote:
> This patch adds a package for the Rockchip ATF binary blobs. These
> binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
> RK3588). One can config a custom version and manually define which
> blobs (for bl31, tpl and optee) to use from the repository. The
> U-Boot package is modified so that it takes the chosen binaries and
> uses them during build.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>   DEVELOPERS                                 |  3 ++
>   boot/uboot/Config.in                       |  9 ++++
>   boot/uboot/uboot.mk                        | 14 +++++
>   package/Config.in                          |  1 +
>   package/rockchip-rkbin/Config.in           | 62 ++++++++++++++++++++++
>   package/rockchip-rkbin/rockchip-rkbin.hash |  3 ++
>   package/rockchip-rkbin/rockchip-rkbin.mk   | 46 ++++++++++++++++
>   7 files changed, 138 insertions(+)
>   create mode 100644 package/rockchip-rkbin/Config.in
>   create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
>   create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 188c579010..8e603ff3f8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1776,6 +1776,9 @@ F:	package/ramsmp/
>   N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>   F:	package/libcamera/
>   
> +N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
> +F:	package/rockchip-rkbin/
> +
>   N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>   F:	package/wqy-zenhei/
>   
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 085397d03d..7733f8501f 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -262,6 +262,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
>   	  This option makes sure that the i.MX firmwares are copied into
>   	  the U-Boot source directory.
>   
> +config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
> +	bool "U-Boot needs rockchip-rkbin"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
> +	help
> +	  For some Rockchip SoCs U-Boot needs binary blobs from
> +	  Rockchip.
> +	  This option makes sure that the needed binary blobs are copied
> +	  into the U-Boot source directory.
> +
>   menu "U-Boot binary format"
>   
>   config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..143432d55b 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -207,6 +207,20 @@ endef
>   UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
>   endif
>   
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> +UBOOT_DEPENDENCIES += rockchip-rkbin
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> +UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
> +endif
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> +UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/ddr.bin
> +endif
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE),y)
> +UBOOT_DEPENDENCIES += optee-os

I think this is a mistake? We want to use the one from rockchip-=rkbin 
package and so we don't need to build optee-os package dont' we?

> +UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> +endif
> +endif
> +
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
>   UBOOT_DEPENDENCIES += host-dtc
>   endif
> diff --git a/package/Config.in b/package/Config.in
> index bff090a661..80221d0406 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -581,6 +581,7 @@ endmenu
>   	source "package/read-edid/Config.in"
>   	source "package/rng-tools/Config.in"
>   	source "package/rockchip-mali/Config.in"
> +	source "package/rockchip-rkbin/Config.in"
>   	source "package/rpi-userland/Config.in"
>   	source "package/rs485conf/Config.in"
>   	source "package/rtc-tools/Config.in"
> diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
> new file mode 100644
> index 0000000000..5cc9bd0ab5
> --- /dev/null
> +++ b/package/rockchip-rkbin/Config.in
> @@ -0,0 +1,62 @@
> +config BR2_PACKAGE_ROCKCHIP_RKBIN
> +	bool "Rockchip rkbin binary blobs"
> +	depends on BR2_arm || BR2_aarch64
> +	help
> +	  This package provides Rockchip SoC binary blobs for U-Boot.
> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION
> +	bool "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c"
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +	bool "Custom version"
> +	help
> +	  This option allows to use a specific version.
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
> +	string "Rockchip rkbin version"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
> +	string
> +	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
> +		if BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION

It'd be nice if we could reuse the version already in 
BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION symbol but I looked 5min and 
didn't find anything :/

> +	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
> +		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> +	bool "Rockchip rkbin tpl file"
> +	default n
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
> +	string "ddr.bin file path"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> +	help
> +	  Full path to the tpl file inside the rkbin repository. The
> +	  specified file will be copied and used by U-Boot as tpl.
> +

I think we can merge those two together? If it's an empty string, then 
we don't use it?

ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL),"")
instead of
ifeq ($((BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)

Just a suggestion.

> +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> +	bool "Rockchip rkbin bl31 file"
> +	default n
> +

Shoudl this depends on !BR2_TARGET_UBOOT_NEEDS_ATF_BL31 ?

> +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
> +	string "bl31.elf file path"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> +	help
> +	  Full path to the bl31 file inside the rkbin repository. The
> +	  specified file will be copied and used by U-Boot as bl31.
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE
> +	bool "Rockchip rkbin optee file"
> +	default n
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILENAME
> +	string "optee.elf file path"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE
> +	help
> +	  Full path to the optee file inside the rkbin repository.
> +          The specified file will be copied and used by U-Boot as
> +          optee.

Issue around the indent, probably tabs vs spaces?

Also, to U-Boot, it's a tee not op-tee. OP-TEE OS is just a possible 
implementation of a tee OS. You could have something else than OP-TEE OS 
(though I am personally not aware of any).

> +
> +endif # BR2_PACKAGE_ROCKCHIP_RKBIN
> diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
> new file mode 100644
> index 0000000000..5659ecf719
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  6f7b58fe35108101031ebfd3cc6eb7a186f258a1cdbd93c4256888997ab52c8f  rockchip-rkbin-d6ccfe401ca84a98ca3b85c12b9554a1a43a166c-br1.tar.gz
> +
> diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
> new file mode 100644
> index 0000000000..ea1afd56d3
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# rockchip-rkbin
> +#
> +################################################################################
> +
> +
> +ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION))
> +ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
> +ROCKCHIP_RKBIN_SITE_METHOD = git
> +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> +ROCKCHIP_RKBIN_REDISTRIBUTE = NO
> +

I think it's fine to redistribute it since it's already public? Any 
reason not to?

> +ROCKCHIP_RKBIN_INSTALL_STAGING = YES

I think this is incorrect and should rather be:
ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS?

c.f. documentation 
(https://buildroot.org/downloads/manual/manual.html#generic-package-reference)
"""
  LIBFOO_INSTALL_STAGING_CMDS lists the actions to be performed to 
install the package to the staging directory, when the package is a 
target package. The package must install its files to the directory 
given by $(STAGING_DIR). All development files should be installed, 
since they might be needed to compile other packages.
LIBFOO_INSTALL_IMAGES_CMDS lists the actions to be performed to install 
the package to the images directory, when the package is a target 
package. The package must install its files to the directory given by 
$(BINARIES_DIR). Only files that are binary images (aka images) that do 
not belong in the TARGET_DIR but are necessary for booting the board 
should be placed here. For example, a package should utilize this step 
if it has binaries which would be similar to the kernel image, 
bootloader or root filesystem images.
"""

What I'm afraid of is that you're installing to BINARIES_DIR but 
STAGING_CMDS should  install only in STAGING_DIR.

At the same time, I don't know how this will fly with parallel builds 
(which are experimental still, so do we care?) because u-boot dependency 
would probably be rather on staging commands from dependencies rather 
than image commands from dependencies.



> +ROCKCHIP_RKBIN_INSTALL_TARGET = NO
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> +ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> +ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE),y)
> +ROCKCHIP_RKBIN_OPTEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILENAME))
> +endif
> +
> +define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
> +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE)), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/bl31.elf)
> +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE)), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/ddr.bin)
> +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE)), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_OPTEE_FILENAME) $(BINARIES_DIR)/tee.elf)

I honestly would prefer to keep the original file extension. Not sure 
how to handle this on U-Boot package makefile side though.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
