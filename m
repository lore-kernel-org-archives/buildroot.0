Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEB8C001DB
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 130DE61088;
	Thu,  6 Jul 2023 08:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 130DE61088
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9VOcxOkHerp; Thu,  6 Jul 2023 08:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED4C461097;
	Thu,  6 Jul 2023 08:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED4C461097
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B078D1BF575
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9636340140
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9636340140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rojK6uialI9o for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9955E400FB
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9955E400FB
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVUtwp3rT784Br2J397S8r/VoeJZuZSa/6ZYJ11mhn3adKnKpiSswRU2KyZ4ZN7ttlXvWzoI/WQUTKA//ajv+tncz3UYamRxfJCS2h9mxlosa4UOkZacZtXYfVO4Pg31aKS7myXACXcVsUnxaa9rBu0rD8NVerM3dBJdUnplJcmH4Szz9s9bPX/wBgZvcaZeqkOVLNHw4z1ssML+u4e0shIGlKWaxUXgaqYM0ZpU5mzCiJ8T0MwWcfZ5niYvQHxuXaj+AqvQnMg/unuC6ZM+CuQ8CDfh0Me9sY9LdSlFNy+K/JJYIqpCpoNcAiVcTpJ0wVW/JXcWWGAYFiLW+pS76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tDDgr8MI11+4CXO3Er43aWevdqUR+aPNkqkuizB3Vk=;
 b=oIFnOuBgLPwtHsPz8mmnvD6NeqkrSN2QWF0WYfJYPi7/c7IqrGSHgIE1JCuj2/wF2e2R5irFB+NvvoeIbtoARDaHx8X7ihZRlnSi+qa6YqcDmYIsjy87gBDGpABw1aALxZXf9gabURP71NKLsfSL8xiaHeF0upO4WGbVV7pugwFX70t7cUK9qnfUUfOYfpsQjZK5cB+k5RSkcen0g5sdwCgk2oPE0/wBIaBJ7LuTIctqd5otUowkqsxzJZVscTSIKw17WEd+/qxhkcJ8nPIlvTPeIzmAFWiAHjMygm/EGEK5/sUoRDGP4t/OYkYIZ5qEfzC7AEpBb+eAWNENQ5xDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 by AS8PR04MB8706.eurprd04.prod.outlook.com (2603:10a6:20b:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 08:16:00 +0000
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::c9c2:9972:7f01:5c17]) by AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::c9c2:9972:7f01:5c17%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 08:16:00 +0000
Message-ID: <6331fb32-d30a-4cbb-dc4c-058a9b75b5ee@theobroma-systems.com>
Date: Thu, 6 Jul 2023 10:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
 <20230705062142.10968-1-kilian.zinnecker@mail.de>
Content-Language: en-US
In-Reply-To: <20230705062142.10968-1-kilian.zinnecker@mail.de>
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To AM9PR04MB8539.eurprd04.prod.outlook.com
 (2603:10a6:20b:436::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8539:EE_|AS8PR04MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd0b659-178f-4e09-76ea-08db7df93b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qk20+rHGDEGySRzm+85YUblPcf8hBZsIZ5HKw3qXV4iT7YNn7U6lAsDgmlUd626MyXo9DUwi78+FtQ93gzp6VJXfktywFwBERDtqynsC5UwgtBpSbQB6oIiO9Rtj4YZu5IarZfMoHIINx58HdBSnrsmJiwjVeZOsv8hwo2eernMLg3facuO2IxaJgSlChwuyrLBltvwDUoTRn/47D6vJxF52Tb6RqA4uUurXuYx0XryrpELxawa8Tf9rAQKJFZ5loNtDSlXJ4woK9NyPsXcx8tQCOInFZkp334bKEIW0b3+Amjv7CnAnlynz71qSF62Vp/QF5quxE+QCReQhNQuhUHLwggHNTYstt9DdA1WHj77L1Y2epUqNxISxZ/+gNkFekxaH9b8jlakgoaJ1/LOWxKvM99KINGdn5eyYg9UuD3sCznUW2XhowoqBPCqfyE8sssn1usEN4UGSl14oxdO6pxf9SOhuwwdQ5Hv9ZtsAtBs8bCdFRN6vnQ1quU1BqYLzD9vRO7YUYwd3qTbD6Rk9xY7Bo3vKnKpiVbxse62YZxw5CI0wFvgA0ZloOyyGYsyk6gG8jJ+DqnvL19aEEUTxStZEtR+NDROMJ0Gzr2o8DL1UBIP3X4InPBOAxwKoWjwYqf7/M3iNJyczQK59ySNNeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8539.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199021)(316002)(41300700001)(6486002)(6512007)(966005)(53546011)(31686004)(83380400001)(2616005)(6506007)(186003)(66899021)(45080400002)(478600001)(54906003)(19627235002)(31696002)(38100700002)(44832011)(66556008)(66946007)(4326008)(66476007)(5660300002)(36756003)(2906002)(86362001)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0N0Mk5VWlVKUTlmbitFYjJwVkltVGNVVkIydDZnK1gxRHNoaDJQYXZRb25L?=
 =?utf-8?B?YUFPSVdsbUxXdnNhOXhUOENndE5rWU5XSUZpOTBIZVlVYkhqL25UTkVta1N3?=
 =?utf-8?B?TDJwcWtyRW9va3VwOXZ6YUdOR1NZV3FNNC9ka0FYY2xKODVZbjBKTWhsOU1s?=
 =?utf-8?B?R2NlNllMT2hlZUxzK0RVRXc5QXBUVlVaTml5WXlQaktJNmNlcDcwQ0hvMjBU?=
 =?utf-8?B?a0RBcDZBc3JqUnZDOHZFTWswNDdDMklESVdPTU1qYVY0cDBzNHE3cTdtT0pM?=
 =?utf-8?B?UjBnWktpS2hyTmVxZFVveTZBbHNUa3F2UHdnZjlQODVNQU9MU09sTnE2RTB4?=
 =?utf-8?B?OEZidEVMbm9NRVE1RHo4MFJuSTF5anNYdEZlQ0toUE5uc3NUSU1qZi9RT2Iw?=
 =?utf-8?B?aVJBNjVZNHp1WHpiWHAva1FNUW5UK2IyeTZYTmsrOUFzYUFNMkRaUHY0Zm42?=
 =?utf-8?B?QTBobzAzTStqcDloWGxuaFhNU0w2QkxoYmpWcHZDZ2pPVU8wWmtIajFPRkJv?=
 =?utf-8?B?ZW9MZURaSmNBK1dGaFhBaXc5aTlUYnY3U29tUXo3N0RkNDVmZnhYbmNvUWhq?=
 =?utf-8?B?L2lmdlU3Z2VWcWFlSzE3bDc0K3J1TkpXVEVJMkFXUGRlMGt3cDBvaEk1WFU2?=
 =?utf-8?B?QmNtcWcrNFc4Sk51aUFRdXZIaHdMNkJmMGg5MnhvS3k2dTJLQ3JORlNWWE5j?=
 =?utf-8?B?dHZpL0hwNVViZ3lyVkZrOWZoRDBRMUY2RlJUVEsyYUF4S2ZQRlg3aHdKYjlX?=
 =?utf-8?B?c0RNaytWSG9GKy9vYmF2OEd0SklaT2diZ08rY3kwVzVIeXdzTGlxS0tRM1gy?=
 =?utf-8?B?T05nNUhqTVF3emJnK1hpalVvS3RUaTNqRFkwSCtjblZQTUxkd2szUGp2d1lR?=
 =?utf-8?B?NlJRdUNMUkRSZzR6WnNlS3VrM1BpNFJpVkN6ZVVMeS9UWmo1alJOVzdiYVNj?=
 =?utf-8?B?NmNYdm9TT25FQ1RxaloyNmpwNlg5Y25xQkFJc25WQzZ3YVNoSHhXczRxK1pq?=
 =?utf-8?B?YlBneERkZ2FCbXNvemV6OXZjZ3lVUHZhOFBwMjJLYjlhOHhWY3dsQ205UGlr?=
 =?utf-8?B?aVNtR2RISklrVDE2SmRFVEIwTWYwSm1zNUpwaTd2TG9NQUpoV0Q3dUFlY0JX?=
 =?utf-8?B?WitISkNmaFJ3QkQ5RzM5Qit5NUxlNmxZdmMwb1F4WVZlaGhPbDZ3SHhvY3BQ?=
 =?utf-8?B?d20zV2VjaU5kWmJNOFZzajl0K3pobS9NZGRYSzNFZHZmWkc0UXBYR3dCdTNz?=
 =?utf-8?B?K3Y1N0dKWVJRR0lZdlpYOHZHbG15SHk0YnpDU1JZQ3prdWRZT2ZUL0g1eUsy?=
 =?utf-8?B?YllTZEthNEFERDExaDRMZkRIQWRvKzlaaHpzUlEvTlRQaVJHYVJTcHZtb1Nq?=
 =?utf-8?B?U1lpTUdxbnpxbjlDZ0dtYXl3MXZOUmE1am5hMlViRklnTENFSnZxMEJaN0xx?=
 =?utf-8?B?aGpWZ1M0Nm1ubTZ2UGlxOHpYUWdRMVJuMUFxWC81TXhVbVhzUmppT0VFd081?=
 =?utf-8?B?L3JxaTNZaWJLN0tDZThDVnNaV1JMV3BqZ3ZRVjZRWGNyUUtIWjVacXovWDlN?=
 =?utf-8?B?RGp0Yi93d2dNblA4WUlXQ2tUNEwyU0JDVWpoODVkdHYvd2U3ZmpRK0VRcGsw?=
 =?utf-8?B?YnNlZjJycWtkUCtHRXlCV2FiaXBZanFMYzI1d1NITldFcmtkWGR2OVBnbHA5?=
 =?utf-8?B?ZnhWUG53VGZhQlNhTFlCU0dFb2loc0Y0b01icGl2RlAxRlRrWHFHaGRjR0N1?=
 =?utf-8?B?OGJOVDA3VThTWHFtYlF6dmVLbHE3R3lmSEVaK3F4anlCWmVkRzRHSjYxVjJE?=
 =?utf-8?B?UVY4Tkx2aXFZSkFaZDYwYjVVYXJnZ0MrQWYxMnZ5d29BQTZNMDVuRGdiL2I4?=
 =?utf-8?B?eEFwaUhTKyt2N0Z0VisvckdVMWhXMStCeUNsTXZlbVRKOXZPR2hDa1hrcnV6?=
 =?utf-8?B?STFaNFZIb1NXdlpmbjhxenZLOHdMc2FLSXVCQ1BsZytlaW4wdHI0N1lNZmgr?=
 =?utf-8?B?SCt6eHFRWjIzdVdHTEZkR2JpS1cwcVh6S2N4V3RWeElTTXBuVzBkUmxoSzlI?=
 =?utf-8?B?ZUdBWEE4dmRvc1ljbXhMZkc5UmZBUUs3eVVLUmpIT3A1S0hnbnFRdEt5UzNO?=
 =?utf-8?B?ZGpFYnRGRzl0SVZWMTJES21ORTA3TWlYRmR0U1BiOUIvQlRBRkRoRnFMZEZr?=
 =?utf-8?B?T09seHl3RzRtN0lvMXNZWWpxd3NUZVo2K1JjU2VtZmVpMzZrODk1N012WlRw?=
 =?utf-8?Q?RtEvz9cBdM3nxPvblMnefMtNqKPI/0eHpcrpTQzgXE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd0b659-178f-4e09-76ea-08db7df93b61
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8539.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:16:00.1200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP5whtDn1y2i/JAY2Wpz83TvVYJlxBqprwJPj3nmLC9zxrFZHKyq3RcXzzIboPTeFETi2XDDQORLa47gOmU+i0qcNXnvyhEoyqIaa4R03yq8Xu3I20QfhqeFepK/cNRx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tDDgr8MI11+4CXO3Er43aWevdqUR+aPNkqkuizB3Vk=;
 b=PQZlG2Qb4gjQ1xRsk73NzK3bjaKqVTBfNbqtjgJuRRaL7katLPMzIWmuwFd2bo/rRrGdb5yJ+lvAGmpCMHAEemLNjBAj0oAJ7iwkWONIH+549b2YSecQRHFinu5e7CaO8XsGWUm9wk4QSGfmN2eQfm35ntH+tujLq32v1GoctyJVnRYc8bPstw5E6mY0VLsJYvX5DNL0MpazLuxgvFK2+VLsiK8qjeaCMUxZL6HXDKOg6YEQ7tp4XY2nq68l2h1OOxEKWMqTwGyl47L6YxMsKcSCHT4Q0vV+bw8kPtg+jJN+X2+4TRRrOSrkqpPHoEhYs1cJ2IHlI6n0ZA5+zvjilA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=PQZlG2Qb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v3 1/3] package: add rockchip-rkbin package
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

Thanks for the patch.

On 7/5/23 08:21, Kilian Zinnecker via buildroot wrote:
> This patch adds a package for the Rockchip ATF binary blobs. These
> binaries are currently needed if U-Boot is built for the Rockchip
> RK3588 SoC. In addition the uboot package is modified such, that it
> can depend on the rockchip-rkbin package and in that case
> automatically obtain the needed binary blobs.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>   DEVELOPERS                               |  3 +++
>   boot/uboot/Config.in                     |  9 +++++++++
>   boot/uboot/uboot.mk                      | 10 ++++++++++
>   package/Config.in                        |  1 +
>   package/rockchip-rkbin/Config.in         |  6 ++++++
>   package/rockchip-rkbin/rockchip-rkbin.mk | 23 +++++++++++++++++++++++
>   6 files changed, 52 insertions(+)
>   create mode 100644 package/rockchip-rkbin/Config.in
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
> index 085397d03d..8ec095a735 100644
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
> +	  U-Boot currently needs binary blobs during build for the
> +	  Rockchip RK3588 SoC.

This isn't specific to RK3588. It is in fact how Rockchip starts with 
each of their new SoCs. This currently applies to RK3568 as well and 
since there is at least one Radxa board (Rock 3A if I'm not mistaken), I 
guess we're gonna see patches for this one soon?

Also, users can decide to use blobs instead of compiled-from-sources 
binaries for TF-A, OP-TEE OS and TPL for those SoCs like RK3399 which 
have upstream support.

I would suggest to just say that this provides binary blobs (such as DDR 
init (usually called TPL in U-Boot world), TF-A and OP-TEE OS) typically 
used for new SoCs designs until different upstream projects get support 
for the new SoCs.

> +	  This option makes sure that the needed binary blobs are copied
> +	  into the U-Boot source directory.
> +
>   menu "U-Boot binary format"
>   
>   config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..4ef0a7bc2a 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -207,6 +207,16 @@ endef
>   UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
>   endif
>   
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> +UBOOT_DEPENDENCIES += rockchip-rkbin
> +
> +define UBOOT_COPY_RKBIN_FW_FILES
> +	cp $(BINARIES_DIR)/bl31.bin $(@D)
> +	cp $(BINARIES_DIR)/ddr.bin $(@D)

This is an issue with supporting multiple Rockchip SoCs with the same 
package since we would need to have an option in RKBIN package to select 
the original file to rename to bl31.bin and ddr.bin.

How bad of an idea is it to parse the BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS 
variable for BL31, ROCKCHIP_TPL and TEE variables to find out the exact 
name of the file to use?

> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_RKBIN_FW_FILES
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
> index 0000000000..d8072002ca
> --- /dev/null
> +++ b/package/rockchip-rkbin/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_ROCKCHIP_RKBIN
> +	bool "Rockchip RKBIN binary blobs"
> +	depends on BR2_arm || BR2_aarch64
> +	help
> +	  This package provides binary blobs, currently needed by
> +	  u-boot for the Rockchip RK3588 SoC.

Don't specify the Rockchip SoC part number, this is already not 
encompassing all SoCs that need RKBIN (such as RK3568). You can however 
say that this is typically needed by U-Boot for the U-Boot proper fitimage.

> diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
> new file mode 100644
> index 0000000000..ac50c8931d
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# rockchip-rkbin
> +#
> +################################################################################
> +
> +
> +ROCKCHIP_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
> +ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
> +ROCKCHIP_RKBIN_SITE_METHOD = git
> +
> +ROCKCHIP_RKBIN_INSTALL_STAGING = YES
> +ROCKCHIP_RKBIN_INSTALL_TARGET = NO
> +
> +RK3588_DDRFW = rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin
> +RK3588_BL3FW = rk3588_bl31_v1.38.elf
> +
> +define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
> +	cp $(@D)/bin/rk35/$(RK3588_BL3FW) $(BINARIES_DIR)/bl31.bin

I would highly recommend to keep the same file extension to not confuse 
people since the OP-TEE binary apparently has different formats which we 
can (more easily) distinguish from their file extension (though IIRC, 
reading the header may be enough).

> +	cp $(@D)/bin/rk35/$(RK3588_DDRFW) $(BINARIES_DIR)/ddr.bin

I would highly recommend to not have a so common name which abstracts 
the SoC part number. I can think of two ways of doing this: create a 
subdir after each SoC part number in BINARIES_DIR (e.g. 
BINARIES_DIR/rk3588/bl31.elf) or have the part number in the filename 
(e.g. rk3588_bl31.elf).

This should allow to install the binary blobs from all SoC supported in 
RKBIN without having to deal with Kconfig options.

The rename to remove the possibly changing filename is a good idea 
though, so we don't need to update the BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS 
variable in the defconfig to reflect updates to RKBIN.

Also, OP-TEE OS is available as a blob in there (see bl32 file), maybe 
making it available would be good too?

Ok so another thought now...

In boot/u-boot.mk, we already have
```
ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
UBOOT_DEPENDENCIES += arm-trusted-firmware
ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
define UBOOT_COPY_ATF_FIRMWARE
         cp $(BINARIES_DIR)/bl31.elf $(@D)/
endef
UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
else
UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
define UBOOT_COPY_ATF_FIRMWARE
         cp $(BINARIES_DIR)/bl31.bin $(@D)/
endef
UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
endif
endif

ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
UBOOT_DEPENDENCIES += optee-os
UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
endif
```

which should set everything up correctly for bl31 and tee-os, without 
needing to add BL31 and TEE to BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS manually.

We would however probably need to go with a virtual package (or whatever 
the proper name for Buildroot would be for two packages providing the 
same functionality and have a selection mechanism in place in Kconfig 
for it) for TF-A and tee-os so that UBOOT_DEPENDENCIES picks up the 
correct dependency. RKBIN would be one of the possible provides for 
arm-trusted-firmware and optee-os for example.

Looking at the code above, if we want to keep it a bit automagical, 
maybe having the RKBIN binaries called bl31.bin and tee.elf and have a 
Kconfig option for the RKBIN package to select which SoC binary blobs to 
install would be best.

We would still however need a special case for the TPL coming from RKBIN 
package since there's no piping for this at the moment in boot/u-boot.mk.

I feel like RKBIN package should be able to handle multiple SoCs (either 
by providing all SoCs binary blobs at once, or have a Kconfig option for 
it) and we should make it not too error-prone on the user-side for the 
U-Boot configuration.

At the same time, I don't know if it's worth the added complexity.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
