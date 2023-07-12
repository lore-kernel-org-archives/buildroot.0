Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E997EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 09:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEF160BD8;
	Wed, 12 Jul 2023 09:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDEF160BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZarJxsnX1YaQ; Wed, 12 Jul 2023 09:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B844D60F4C;
	Wed, 12 Jul 2023 09:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B844D60F4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 967111BF3EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 09:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55812400DE
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 09:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55812400DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZbUv7nRZ7bB for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 09:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23DA7400B2
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::622])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23DA7400B2
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 09:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMxqLRWFwwliOgs1oWBMPpL/2Ug5EAqpjZXWAnAvG2ubsOVBHDjBbHrwcnO9OLYV1JHPYgLExgde6rus6pDU1N9dOnBN4MGqJcaECFZB5Zx1vG2zZFhBoLee0lDgzD1QCBBxVJkJFGU98rsNenysFCNwKB8yklW6464cE9qPw6mhM3K81wdGM9d+y4IW5MBYNqXqYADq9QaPrwLuUxmwCgWUp4ym3D7aCRewoFpjStLkbohXSJ2ghJvCconczs3524T95ph3NDkyPRN5dIANcy0bA18G5bDfzDdXlOS6QsiAsr5D2ZHtFhGudwt5CjmnWGUwTpSh2AsQn2u0l+r0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoYL7nTx2DIFdEeFvBw2HUfqz5JPEbluj2cR4thvoi0=;
 b=jZ9N9L7az/0P1FQJG0Zzvr72Dgh0ZVdJ4YXIOlL7wlXDVCC4+viL4CAiI0fIo7Sc2nTXIno5s5Sg6aAfORL5UkVBOQ74APFn/jWyP0B/RHVfjnGUL3ajlMbxzc57slVlfOp8ngGWFiZ8TxwmVwdoeGm7NaC9/a4/31+4YrKtoAEpSPwx66nJY0QUL7i0BRUibFa74XjsYiArR+0THGZAwGlLoWFDXKyZnUanfpe0q/ct2DreAefKrKPq+kyHhEg25TGdlBnyZOGiyiV7ScmcYIZ+w3b7vYOhsEN+kcd8Ln2NmQGhzcKwmQi9uCZrB9RRD7jSfQyPk3S8z6wdM9HRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 by DBBPR04MB7660.eurprd04.prod.outlook.com (2603:10a6:10:20f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 09:13:39 +0000
Received: from AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::c9c2:9972:7f01:5c17]) by AM9PR04MB8539.eurprd04.prod.outlook.com
 ([fe80::c9c2:9972:7f01:5c17%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 09:13:39 +0000
Message-ID: <c3191f37-551a-0a9b-6fb0-c8662d6faac2@theobroma-systems.com>
Date: Wed, 12 Jul 2023 11:13:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
 <20230705062142.10968-1-kilian.zinnecker@mail.de>
 <6331fb32-d30a-4cbb-dc4c-058a9b75b5ee@theobroma-systems.com>
 <6573492.4vTCxPXJkl@kilian-aisec>
Content-Language: en-US
In-Reply-To: <6573492.4vTCxPXJkl@kilian-aisec>
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To AM9PR04MB8539.eurprd04.prod.outlook.com
 (2603:10a6:20b:436::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8539:EE_|DBBPR04MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f301973-1fcd-4df2-bd4c-08db82b847b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjuX/E4DHLamxffptrRC4ZGm7Y+CWIvP0GFOV0cSrjxoy7ajalmIuuScqs2aqKp0aSI/Aueogww4lJsg+pUM9DhVscTJKppCXDf+JntV3vCgZtSEKMqW7MLP5Zxx7J6rBi0qAwBIdV8OAi1VPMj4//wNU//YGsEEx6DSPOORjActALP7t35lXEm94+zuphSo95CHcrmdSwNij0n49IAGrNIASXT2g2oOS4xYHf9ZNT4wcWJeZCFBGnRc/68/lDOKdUb7+AOQKoZCjesbANk7utFHwpvMcG6KGXQX2njp6JeIiGlTgnpw00A5AdywIpLwp0nE5kow5OlPty1fQSMvgRgE1aaXNY8EZEBziv8o+bZN96Qj/vgucXPIPCFGv+VgJuFX8VPZbMbMxNVusEXVhWiPXFr+4wNrW7n+W/p6n1GqOb+jfxK3ADm3z7YNyMRtrMTc2lwUhYEXqi8IjDDSTL3qiDqqlPZefjBtGC2B4Xr+oHWAMtDTBNO83s0NJvs8GBULXixHJjv9t0Sj4x8Wr8WPMxT2bWSyXUAxYt3CLfdxkrJ3YRx2asc9GmWP7dy0deNtihIVinVXBZ6Am9lrOOV0uLaO6yYRiFe3oIxCjDQEdwPUeOPlu+5PF7OFVsFkuXDBhTgG/mJnaZXqztwxuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8539.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199021)(83380400001)(30864003)(2906002)(2616005)(36756003)(86362001)(38100700002)(31696002)(186003)(41300700001)(4326008)(6486002)(6512007)(316002)(5660300002)(8936002)(8676002)(478600001)(66476007)(66946007)(66556008)(54906003)(19627235002)(44832011)(31686004)(6506007)(66899021)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWRyWUdKcXNqdmxmd1BYOG83NnpuYlJyUlkyelpjZnlpWVF2TTBxTFZVL1d1?=
 =?utf-8?B?alBJUFNDTE1zUCt1K2cwQnBWbFVwN0RXcExFMUF1QlNsUmhYcVQyZlhCN0hm?=
 =?utf-8?B?VFErRFhOaVdSNkovR3luOWtiSVVvVXJGeHh0cWRSUWxRL2RIWEhPek1ST2Ir?=
 =?utf-8?B?bXNYYXRyYldsM0NVRkcvRU02VVd6d2laaTJQemhsazFQcTFHKzEyUXBnVndH?=
 =?utf-8?B?NUpJMkVHT2Y0ak82Y2FrVjNqTFhpZ0NaNmVhSUxJSWFQTzByTlVmanpIaUxM?=
 =?utf-8?B?NGRFTmRmWE1yQlZyR3RqdW8yWmNZc1ZoRTU1cmh2eWM0ZjVGVG9Ya2E3Ukha?=
 =?utf-8?B?WFVDUUw1Vmt0bUJlV2tqWG42ejRZMnFjOTVlR21wdThqc0l5UkJHa3RNWnhi?=
 =?utf-8?B?U2syNDFLRDgrYnN0YmpoOVdCTlpOQ3dzdlA5R3VQcDdvbzVMdzhjbG1Cb1JN?=
 =?utf-8?B?NUxRWUV5aXFyQkV5N3Z1RTVQcko5SDhkSzRiVTlBVVJBYmlyMFhqZGlFcXIr?=
 =?utf-8?B?cDl1SFBoclB0WTJkWW1DdmtSNjRYbzFaWEdEcDVrdTlzNW1lb3FMNTdDVEta?=
 =?utf-8?B?MVk4d1d0cXdISEVUNE51VzlUVkJXVW00MEsrbzNycHkvQWUwL09KZzdkM3pz?=
 =?utf-8?B?NnNCYWhaNWxRM01UQlN5RTVXTzR3bzdqakVvVUVDRlRvYVpLRlZtZ3o3Nk1z?=
 =?utf-8?B?RWFucGluOGJlMHV0NStaUG1VbUwxSTB1bTFZN0JzL1hZTWRkOUFHL2Y4TVFx?=
 =?utf-8?B?cGVWOTM4RVF5VDdma0RMVmNaS2FQcVpnMURqMVFTVDRPdXFvUTlBM3cxeDRX?=
 =?utf-8?B?ZnFkZGpkMUxWSmZ5QkIrRGxObFEyOXRCczhwRXNDa2I1MGJqS1RvT2hvRTFE?=
 =?utf-8?B?UHc3MFM5OThTRm9LbTZFUFBBMVgzU0FZYitNczFSMDdXcHJsMFVIT2dIZE5K?=
 =?utf-8?B?RWI3QzFpR040Qks5TEwraTVHTUZrOUs4YXRwY2R3RVJEb0pNaFNDRFFhU2Vz?=
 =?utf-8?B?ZlRGaVBMTHVCQnh6aVZNVWQ3SDVhK0wwQ256UElSSldXR1F6ZDFJWXBzZDRp?=
 =?utf-8?B?czVNU0JkcGY4WmlUSWpZRndGakJUeVZYbnBhdmgwNW5FZkRhTStSTFhiMFJP?=
 =?utf-8?B?NzBJVVZPdzNjaUk0L0IydWtGVWg4c2JnaEUyYjRIZkJwUEd3bGZlRjlnQUFr?=
 =?utf-8?B?bmhQbzdWVXJYTDJSSlNJVTBLQ3lDTUFvVGRRV2VVMmFySVdIcXBnZDBMNFRV?=
 =?utf-8?B?VFFHY2pReHIxR3FaWTFaSi80Z0JCck9BTThBM2EyODhPVGkzcHc1YnUwcFNm?=
 =?utf-8?B?a3pKWVRqT1pRRmllelE5TXkxVzJ4bWV6TkNMY1RJTkE5elhqMkxVd1d1YmpT?=
 =?utf-8?B?dkU3NDFNeHRaSnhEQWlEbGpBVnREN3M5WUVONlBHdlpHUnBPbmYwcmlJN01K?=
 =?utf-8?B?YTh6djJkbDF1SlRVaUtYMkpyL0V5aDh2TUZESW5QWUU5OVA2SVBHTmdTTnJI?=
 =?utf-8?B?SithdGxiSDdQRkt2WnRna2NaUTN2V0dlU2N1T1pSbUR5TUtmSXZZMnQ2YVRt?=
 =?utf-8?B?dE9XNXZURTJ4UlErR0w1anBvNVZPbmE3RkdJWXlLWEQxbDBRV0JYR2RHUGEy?=
 =?utf-8?B?bkpBNWJhSCtTRWRtb1NSOUdqcnhJR0JjdWljM2FLQUxuQlJiK3gxd2pDYm1K?=
 =?utf-8?B?cmo4MTFoMDc4RUlSSE94emU3QXhEMG44Wk9lRTlCd1ErNTVvd2IybVB5OG9K?=
 =?utf-8?B?L2x1Wm5ob2pvVGhWcmhOS1lFTUZ3UEFZeTRNbHpuSUo1Nkk2Q2t1WWxhYUhR?=
 =?utf-8?B?WWtGYVZ4SmZxc2JXWnNEVkJqR3NDY2pYU0hCRmVxSWJ6dUFWbGN3VitBcWlo?=
 =?utf-8?B?bGtlZjMxejdlSi9VUFNQUWJ1K2MyVGljS204QjdNbW8xTnhJVC80Qy9TU3ht?=
 =?utf-8?B?ZXcrYUtPQjYzUE04d0oyTFpKb2p0TVl6ejZtV1pTb2JDKzluSUVVRkF2NDZW?=
 =?utf-8?B?Z0VFdkRpUWFLbFJoSUI2VjZxNjFMeCt0NGFDMkhjbzljUmNNTXh4ZjVXa0RJ?=
 =?utf-8?B?QTR1VDlGdSt1K21lbUpaTnFDM3RNc2UyTTQ4TytuWGpDUGpTeGplVEtocm1y?=
 =?utf-8?B?dW9VU21rZ0xlRC9JTXVEanVVNkU2V0Q3RlRhc0I2TEIreEJ0dllxc0ExdnFv?=
 =?utf-8?B?d0djRUY3VEsxa3B4cm9yZjBhK0hRN2pmU0dtTWsrWFF4eEFpZWhWNGFlZm9T?=
 =?utf-8?Q?QG4UE3gn/T4yN/UON4ABrn+YjvdPbCO/nEpiJaqUZM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f301973-1fcd-4df2-bd4c-08db82b847b9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8539.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 09:13:39.3419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVvEdbFmR74wKSFPFI44wokTEdVzjeSI+v+f6pKawSjP5AVFRqA9q19De1S/5rSCDNGwWjLbzARaY367iQQMRNmW/eG0YLsgJ5Z9YZMJskbTDtiIPRBy8DO7bI7406HF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7660
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoYL7nTx2DIFdEeFvBw2HUfqz5JPEbluj2cR4thvoi0=;
 b=HVuSTW/47C+BQgaOkZiH94rz6wE9JZx5hakaVBJvQmKqrwk3Ibsk6T6L8s9/X7nElNux9Jj1WfqKCWrmxP5muLW4nqR8rRJEJKKDwMXmYaNG5ZvIgtHKSGxBqstMwMASTQqesLj7MH4F9Hb/ct8lu+mafgF1eWeDwcgfMVjsicIFNDaXc8PFBSCvFSVDu4sZbkfbkRtBj2Rso1SOMqwIPB6dst/OTqu3XiAG+HryLE6oUi2J7MujKuuU5GVJ2HFxaAFmGRHIYrO1E1diuZIOz1ljY1WNBEtMJqBJ1GE59dOknrvesDygFyOhXlN7jlWTmNBChdqkm2KJyEspY1jHxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=HVuSTW/4
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

On 7/7/23 00:56, Kilian Zinnecker wrote:
> Hello Quentin, All,
> 
>> Thanks for the patch.
> 
> You're welcome and thanks for your feedback.
> 
>>> +config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
>>> +	bool "U-Boot needs rockchip-rkbin"
>>> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
>>> +	help
>>> +	  U-Boot currently needs binary blobs during build for the
>>> +	  Rockchip RK3588 SoC.
>>
>> This isn't specific to RK3588. It is in fact how Rockchip starts with
>> each of their new SoCs. This currently applies to RK3568 as well and
>> since there is at least one Radxa board (Rock 3A if I'm not mistaken), I
>> guess we're gonna see patches for this one soon?
> 
> Yes, correct. Do you refer to buildroot patches for support of further Radxa
> boards or to u-boot patches to support further Rockchip SoCs? Personally I
> currently don't have any plans to provide patches to bulidroot regarding board
> support of other Radxa boards. Still I think the concern is of course legit,
> i.e., that someone wants to use this rockchip-rkbin buildroot package for
> other Rockchip SoCs, but it (in its current form) does not provide
> functionality for that.
> 

U-Boot, for all RK3568 and RK3588 based boards, currently requires blobs 
from rkbin. Therefore, to build U-Boot properly, we need this package. 
Since there are publicly available boards based on RK3568, I assume we 
may eventually get support by someone (not necessarily you) for those. 
Therefore, I suggested we remove the mention to RK3588 as this is not 
specific to this SoC from Rockchip. No expectation from me on what 
you're going to do next :)

[...]

>>> +RK3588_DDRFW = rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin
>>> +RK3588_BL3FW = rk3588_bl31_v1.38.elf
>>> +
>>> +define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
>>> +	cp $(@D)/bin/rk35/$(RK3588_BL3FW) $(BINARIES_DIR)/bl31.bin
>>
>> I would highly recommend to keep the same file extension to not confuse
>> people since the OP-TEE binary apparently has different formats which we
>> can (more easily) distinguish from their file extension (though IIRC,
>> reading the header may be enough).
> 
> Thanks.
> 

Just to make things a bit clearer here, I commented on bl31.bin file 
extension while saying something about OP-TEE binary, the former is TF-A 
blob while the latter is bl32.bin.

Also, I was wrong, the file extension isn't used for detecting the file 
format of OP-TEE OS blob, U-Boot tries to detect an ELF, if not, starts 
to parse the blob "header" to detect if it's v1 or v2 format.

But better keep the same file extension though :)

>>> +	cp $(@D)/bin/rk35/$(RK3588_DDRFW) $(BINARIES_DIR)/ddr.bin
>>
>> I would highly recommend to not have a so common name which abstracts
>> the SoC part number.
> 
> Why is the SoC part number so important to you?
> 
>> I can think of two ways of doing this: create a
>> subdir after each SoC part number in BINARIES_DIR (e.g.
>> BINARIES_DIR/rk3588/bl31.elf) or have the part number in the filename
>> (e.g. rk3588_bl31.elf).
>> This should allow to install the binary blobs from all SoC supported in
>> RKBIN without having to deal with Kconfig options.
> 
> How so? Because we would then copy all blobs at once into the BINARIES_DIR
> everytime?
> 

Indeed. Then we wouldn't need to care on the rkbin side which blobs to 
install in BINARIES_DIR. Inside u-boot.mk either, as I would pass the 
proper path as part of BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS like you did here?

[...]
>> Ok so another thought now...
>>
>> In boot/u-boot.mk, we already have
>> ```
>> ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
>> UBOOT_DEPENDENCIES += arm-trusted-firmware
>> ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
>> UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
>> define UBOOT_COPY_ATF_FIRMWARE
>>           cp $(BINARIES_DIR)/bl31.elf $(@D)/
>> endef
>> UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
>> else
>> UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
>> define UBOOT_COPY_ATF_FIRMWARE
>>           cp $(BINARIES_DIR)/bl31.bin $(@D)/
>> endef
>> UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
>> endif
>> endif
>>
>> ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
>> UBOOT_DEPENDENCIES += optee-os
>> UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
>> endif
>> ```
>>
>> which should set everything up correctly for bl31 and tee-os, without
>> needing to add BL31 and TEE to BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS manually.
>>
>> We would however probably need to go with a virtual package (or whatever
>> the proper name for Buildroot would be for two packages providing the
>> same functionality and have a selection mechanism in place in Kconfig
>> for it) for TF-A and tee-os so that UBOOT_DEPENDENCIES picks up the
>> correct dependency. RKBIN would be one of the possible provides for
>> arm-trusted-firmware and optee-os for example.
> 
> Or I just add the UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin to the
> BR2_UBOOT_NEEDS_ROCKCHIP_RKBIN block?
> 

Yeah, but technically U-Boot does need BR2_TARGET_UBOOT_NEEDS_ATF_BL31 
for Aarch64 platforms. If the user selects 
BR2_TARGET_UBOOT_NEEDS_ATF_BL31, it'll add trusted-firmware-arm as a a 
dependency, which is unnecessary since we only have a blob.

>> Looking at the code above, if we want to keep it a bit automagical,
>> maybe having the RKBIN binaries called bl31.bin and tee.elf and have a
>> Kconfig option for the RKBIN package to select which SoC binary blobs to
>> install would be best.
> 
> In the readme of the rkbin repository they present their file naming scheme.
> However, I don't think I like making use of it:
> 
> 1. We introduce a lot of Kconfig code for some logic that adds choices and
> selects files within the rkbin repository. But in the end the user still has to
> make the decision, which files are to use, anyway. Then the user can also just
> directly specify the true filename in the board defconfig or .config.
> 

What I had in mind was to have a select Kconfig option:
choice
config BR2_RK3588
config BR2_RK3568
enchoide

and then in rockchip-rkbin (pseudo-code):

if BR2_RK3588
     install bin/rk35/rk3588_bl31_v1.38.elf $(BINARIES_DIR)/bl31.elf
     install bin/rk35/rk3588_bl32_v1.13.bin $(BINARIES_DIR)/tee.elf #add 
support for tee.bin in U-Boot mk?
     install bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin 
$(BINARIES_DIR)/ddr.bin
elif BR2_RK3568
....
fi

The important part would be for the destination filename to match what's 
expected in boot/u-boot/u-boot.mk:

UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
[...]
UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin

in that scenario, we wouldn't even need to adapt U-Boot makefile other 
than allowing to depend on rockchip-rkbin rather than trusted-firmware-arm.

> 2. We add a lot dependency: Rockchip may remove or rename files in their git
> reblobitory as they like. If we (or any other users) then want to use a newer
> commit of their reblobitory, e.g., to use newer blobs, and the file name / path
> scheme breaks, we have to fix that again.
> 

This is the responsibility of the package maintainer, like for any other 
package. I do agree though that the name of the installed binaries 
should stay consistent between new versions, so that we only need to 
update rockchip-rkbin and not any other package that depends on it.

>> We would still however need a special case for the TPL coming from RKBIN
>> package since there's no piping for this at the moment in boot/u-boot.mk.
>>
>> I feel like RKBIN package should be able to handle multiple SoCs (either
>> by providing all SoCs binary blobs at once, or have a Kconfig option for
>> it) and we should make it not too error-prone on the user-side for the
>> U-Boot configuration.
>>
>> At the same time, I don't know if it's worth the added complexity.
> 
> Thinking out loud:
> 
> For the rockchip-rkbin package we could feature:
> 
> * custom git version option (then defconfigs could freeze the repo version)
> * option to specify tpl file name
> * option to specify bl31 file name
> * option to specify op-tee file name

Well.. that's one thing I completely forgot about. Maybe people don't 
want to update rockchip-rkbin for their boards... SO yeah, I guess those 
4 options actually make more sense than trying to be smart and have a 
select for each SoC.

> * logic, which copies the specified files to BINARIES_DIR, while renaming them
> to generic names (e.g., "bl31.elf")
> 
> For the u-boot package we could add BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN in
> uboot.mk: It adds the dependency for the package rockchip-rkbin and introduces
> code, which parses the rockchip-rkbin BR2 variables and adds the needed
> options to UBOOT_MAKE_OPTS accordingly. So it is very similar to
> BR2_TARGET_UBOOT_NEEDS_ATF_BL31, but knows from the sprecified rockchip-rkbin
> variables which uboot make opts to add (or not to add).
> 

The thing I wanted to suggest was to reuse the code written for handling 
trusted-firmware-arm and optee-os dependencies on Buildroot level + 
environment variable setting for U-Boot building. The issue is that 
BR2_TARGET_UBOOT_NEEDS_ATF_BL31 depends on 
BR2_TARGET_ARM_TRUSTED_FIRMWARE so it'll bring unnecessary packages. If 
we give the user the choice of the ATF provider (from source, from blob, 
if blob from which package), then we can remove this dependency on 
trusted-firmware-arm package.

```
ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
UBOOT_DEPENDENCIES += arm-trusted-firmware-provider # TODO add virtual 
package
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
UBOOT_DEPENDENCIES += optee-os-provider # TODO add virtual package
UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
endif
```

Then create optee-os-provider and trusted-firmware-arm-provider virtual 
packages the same way we do for openssl providers (libressl, libopenssl):
package/openssl/Config.in
package/openssl/openssl.mk

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
