Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E3BC43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A35460D69;
	Fri,  3 Jun 2022 09:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aXCOdLqC_tC; Fri,  3 Jun 2022 09:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4A960AED;
	Fri,  3 Jun 2022 09:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7391BF322
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A60F813FD
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Az3sVvKt2I8h for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:09:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::624])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59C64813CE
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:09:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsBTh2RkLKV13SILiqletJ8TQ+LvIfV1P9is/RvD+Nscv1aiUDRIhCbef/KzbP+f/P3NPkhSSfN4GMyaYeGig/7a6S4ISulru7xT75n5buiLRhjkRtNv7EYjejBBNZ/5dt4Xw6v0n4pdSit3dUmuTtWqzafmYMhtIQPscjSvBA8ZnMYN2lt1bThgaBOEJR/JDBg8F+fkEJxGGBEQlXYWyIZhgLLp91LNoojoOXpvhQQKtLlNOkGvIBM6A8B6Qp1gH8lMSeC+nclHcvVj11ygpBg6k8HYfgvUz7/0obAebuI4hpRvFYry+010YTcX31o2MexP8vxAr6hSps+wqKazog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlZthzNnsD19KEr9Js5xNhV5K3L2/mASlY8a+AJrh5g=;
 b=bFVCzWpH5xAPbx8GySk5Pp4yKqyxysXbQBhsA1dAnBMz0l5roZq2j1o+vD4zCRTjNw0IQsMNY5ZQXvTg/NwZT0nVIzodpysLAFNXCur63cRlkiYbHRmVInVDuQ8bA2BBEfXpDVnYKHoiK1Wt8bAcGajizB2xByVzHquR1Embp0DoDevzByDRXlztH4tNbugb5LrM3FpY9DQ39UHdrC1lhWPONrcRCLWIQrcnWCTmhr6rI8SYJhzg84Y0iw7R9hWiSbHWAOQh9lyzw/2VhfzOuePlZnbNdCa5fRRzKB2cggwOeyhd+lTucW9+3wi1XDSCJCD1XgmuvrXAdHSUjeVIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlZthzNnsD19KEr9Js5xNhV5K3L2/mASlY8a+AJrh5g=;
 b=pfufBvkLAkbLZfzV15OlQUmm6y1FW6Eesr1JYUPKsjPaxAYQrqQDXW6y326dIHFJEuclPQG/BM0Xgj2lW+f9gC+ptEJiQO1+XA4fFjQAIW/bI8x1e+slk3ZmpsfUuKsaV3SYHCu2Y+wGHncY/NPejhpsy/6Nd6AYBWGpevg5MdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DB9P251MB0108.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:2c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 09:09:50 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 09:09:50 +0000
Message-ID: <b203b8a90944c5f307c113ba8db8e377a627017a.camel@orolia.com>
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Fri, 03 Jun 2022 11:09:48 +0200
In-Reply-To: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
References: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
User-Agent: Evolution 3.38.3-1 
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::15) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8aefa33-4632-4165-1936-08da4540d01b
X-MS-TrafficTypeDiagnostic: DB9P251MB0108:EE_
X-Microsoft-Antispam-PRVS: <DB9P251MB01083FDAB812A2443800FA8684A19@DB9P251MB0108.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDvCIaydnMNSnk0En8G2+56+Os8IEz/ZBH8yjf+KtafCe54XlFra0CmOIQaEOnid17lftzEMcI2Fomb3DAZcSD3YVOiPOEMg5NEy5eBbagDIDKwDLnoaFOjYXQWk5Fyix+1H65QBQN+EkS/YYwlGLwJciUTJhC+rBE+ZLvTlwtHu7P9BSGdwQhc3E+laksxaP+CVEDePA/DlOxnpWMCWZVm6qpcDQFP2T2wsN1wuRS6ZdRmqKdrC0zedzEoeOBRCBUSQ2mGzSJelo3D6VJasWzwJc1fY3Y1KHrWCt8hO0XQ35WANn8HfjdwVIuLkvPWdfjOuYVZ5YjiWusiMdkEdNHnt01k2v31mAMjBEorj5yd86qfuWkQkRqoRSjFeDbAVQNPfpxLyZrxtEp5RUjTjTXcBcQC/9+js/pSOGo4u1JUMVGi//e85NwUyPD9QSx4lZctjFrLI8T+yL9nnpr+dPbqiG2zy08Zf9nV3sQgZbqZno1n6M0RGrVLWnjeQPjJ81irTBaQvSj9bmKARtIzEYaenNOKq0N4D6rJRt7hVqvKNhcR3kHwLwKEkUJL2tbpJYBgesnA6mISShg6iRiIQOCA8CElT9ZAmjwagALDXQ+VC8EDGXcoxheTgh0d4LGXNVFsnt6JAk1ksykftpBfbjQoQpWLVNBJLrbFUNOiflGBJJJbBYktYYYnyNGzNuIZe/VNZ2zCAlAUo5fZ4+ijC6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(6486002)(508600001)(316002)(4326008)(8676002)(6916009)(66556008)(54906003)(83380400001)(66946007)(66476007)(6512007)(44832011)(6506007)(52116002)(36756003)(2616005)(2906002)(107886003)(186003)(5660300002)(8936002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1EQTJaWjZ2bllHZmdlekVyUUFPSTFwdW9ndGY2ekhqcEJScHNGN0VhL0U1?=
 =?utf-8?B?WGx1eC93QXhNRXlDbHI4WVJqQXNXOFFSbFhoWlJBcFFHWkpnWnI2K0dtZmE0?=
 =?utf-8?B?WmZvaEN0N3U1UzZRWnFPV3c1NklTaGRETHJhektRTXE2MmFwL2FMNkhvYjhQ?=
 =?utf-8?B?eWM3NnhyUngzZkZjSkNTZkRLMFM2MTRXUUc1V3I3Y3djbVJ1MHZMb3h5a3pY?=
 =?utf-8?B?SUhyeFhQZ1A3NGtYT1g5bXhvUjdiRDNKTkhIUWdrVmhHQklBVUV3RmNYM3Jn?=
 =?utf-8?B?a2JBM0lBRFRrSmdnY1ZtQTVWSTFJWEFRcHh6bjRFQktIZ1NBeWZZN21kYlpP?=
 =?utf-8?B?VUhpWk1OSEZhdGpjOG1ISkZnY2JVY0VnY2tSUWZzd1B0UmVNRTkrZlBBdEJ1?=
 =?utf-8?B?MkFZK0V1NjdjSHhGYlgzWW84bGdYSVBPUWdvdndOR1JaMVdMTUxTczc0U2dX?=
 =?utf-8?B?YzZBU1lFdHNYWU02cWZWbmFudlhXcHZ1SmJrVURad1pEN3Jid0hkZHlGb2NX?=
 =?utf-8?B?V0FjYnp4SzZzN3NjMkRCS05JTmhISEZBcVFUekVVZnJ1TlVFdE50K09lRWNw?=
 =?utf-8?B?TmhmNTFOSkh6Sm9FM0pURUE5TUdCS3dpSFE4QnFuN3RaMi8xc20vZFdCM1lP?=
 =?utf-8?B?bWh0MGdENlJJWlRmaldHc1ZRcUREb1NRVmt3bW5rZVk3SXpHMTRwcWsrTDVm?=
 =?utf-8?B?eC92ME8rc3JMZTJrT1RTbVRJdTgrYXhtbzIrem9MdzV4b0VZOFJpNGVTeVpP?=
 =?utf-8?B?ZlUwbGZiNkxuWEtoMkUzVkhxdTNJNDJFNzBHNDgxQW9tUER4eDZrQ1dpSUxz?=
 =?utf-8?B?MWc3T09xTTZmWnhXcmRUOVlNbkpnSTdReEFMZ2V6dWpJaForR3o5dDFBYlZv?=
 =?utf-8?B?ZzIyY25Hb1VJS1owT0FtM0wvY2l3aFNpSE9YbTFKZkxPdDh4VFo1eU12U3V5?=
 =?utf-8?B?M3dZUnZuQWZJTHRndWNtMjBFMHpsUlpRZk1lbUVudlZ0RzB5TXNTT0I5YU5q?=
 =?utf-8?B?a0orU1NzWDJMNnY1ampqNVdSMWdKMHBjR1BNeVdvWVNCOG5ERTZvU3l5S0Yr?=
 =?utf-8?B?SnVDUFRWdHZJYkd0cHYwcTluUWJKZ0RaZWl1dW1EUEo5V3Zud0FYczRDRnhw?=
 =?utf-8?B?V0FRMXFhZks4eWhXNS9taHFYREJhbU1vd1JIb0RwTWFxaUp4SjlYNHpQYjU4?=
 =?utf-8?B?RzdIMkxJK0FsV3ZiV3JnVlQ1anVpNnZnemxHQmxGdWVYTlVCcEVjQ0RaZDk5?=
 =?utf-8?B?UzlyRnprSURsbkc4RWl3YzBTZ00rOWRnQm55ZnRSa1RNelNWMGowMWt4OTgw?=
 =?utf-8?B?TElHWHoxMXFIUmpuMUJpeVFuU28rVXNjMUIyeUlwVEN1NjFPMVZxdUJMcHNm?=
 =?utf-8?B?OGJkVlFoM1VPU1JCb1kxS2c1NlN5aE9DT20xWk5pa1ZnSk8vQzlNcFRKTURh?=
 =?utf-8?B?NEpoeUZmYllNZmFHUi9UYjBIZmpuSGZxMXl1S1BmUElNSjZSU0ZGK214dWJo?=
 =?utf-8?B?QVVZZU4yeUtmdkh0NlBxR1NqK3p0V21oQnNIL0gzS3BWMkE4UzJVeWd6bnpY?=
 =?utf-8?B?M0hEeS9nbWZPdTRSZHJTazhKR0FmWmVlQ1gzQTJKZGNSN20zaHJpOVJIbFha?=
 =?utf-8?B?dStNcXJyWTEyV2MzQkc2WmVRZ2k2eTJUNFB4cmovVVVPclkrZ2djODA4N3hT?=
 =?utf-8?B?ZGFpMEZxeWVGZU8yMklySnhSTjZ0cVQ0dVp4U0QyeXlQeW9UMXROLys1QjhO?=
 =?utf-8?B?OEs2Ymd3eEhvbkF4K3YxUUVBZkhMajBDR3FYNGgzbi9GZ2tYUS82dGpVRW9Z?=
 =?utf-8?B?ektLVVRyTTcyZkpDUHBsY2ozVW5Xc3pSc1Q5K3pUcFNpRTRYenlzdHhwbVJj?=
 =?utf-8?B?dThYM2g4RVJjUnYvL3NHcXg2R3JhYW1xbHVSV29ER0k1dEYvUWZ6V0pCYUZk?=
 =?utf-8?B?a1Z4OWRkMDZndHNEZWFXOC94OEZjV2FobnJKWFlVc21jMERUcklidkptSGYw?=
 =?utf-8?B?SlNyUHZQZ0M1aUN4ekJRMGNFN0E4ZG5QWHVjTDRzOUppakxxcGh3enQ0b3V1?=
 =?utf-8?B?VytZTVROLzlXWU5ydnpJTlllZGVieCtFRk9mVVE0UHdoSVI3M1JybDQ2RkVp?=
 =?utf-8?B?aXg4NlozejVFVFg4bGlWZjVyT0U2dkVhTmRGWVZvengrZXA4ZzB0a2l3L3Vo?=
 =?utf-8?B?Z0xZQ3FGVlRGOW54UER0Q2lGWWxzZFg2bDRKc2llWVZTUGNHUXlCeHhYR05H?=
 =?utf-8?B?YVJkaVF4cjg1UTJWd01TWm5RRXlDVHRjTUdieEdXV1pud3p6SFJ3QnE3K255?=
 =?utf-8?B?d25uRFBwa1Z6UTZXTnhPSkJPYWFtWVhjellIbE0rZjhtdE9KOWdBcmxwbm1p?=
 =?utf-8?Q?uxUkESM8tab19xLMLR9N/0iE7xF//xjfEo7jGs2vg8PXL?=
X-MS-Exchange-AntiSpam-MessageData-1: MmHqKClH3+TvW0agDkoxvYwQzWS83qSWI8M=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8aefa33-4632-4165-1936-08da4540d01b
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 09:09:49.9412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymXy5GhEl3wPArlNygmOd1k9oyw7Pxdks8wN/PE10IUrD/TLyRIom78caGB1IjErJlcgcr0dUhh8vs5Rv0affHSeellom8Fj3i8BcH+RCRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P251MB0108
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
I tested this morning against the master of buildroot (with an ubuntu 20.04) and the issue doesn't
appear anymore.
So there must be some change "recently" merged, which solves the issue.

An idea anyone?

On Thu, 2022-06-02 at 17:31 +0200, Nicolas Carrier wrote:
> Hello!
> 
> When using the following minimal config:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_NEON=y
> BR2_ARM_ENABLE_VFP=y
> BR2_ARM_FPU_NEON=y
> BR2_SSP_ALL=y
> BR2_FORTIFY_SOURCE_2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
> BR2_INIT_SYSTEMD=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> BR2_PACKAGE_ULOG=y
> 
> the build will fail when trying to build ulog with the following error message:
> 
> [...]
> xxx C++: libulog <= libulog/ulog.cpp
> xxx C: libulog <= libulog/ulog_read.c
> xxx C: libulog <= libulog/ulog_write.c
> xxx C: libulog <= libulog/ulog_write_android.c
> xxx C: libulog <= libulog/ulog_write_bin.c
> xxx C: libulog <= libulog/ulog_write_raw.c
> SharedLib: libulog => alchemy-out/build/libulog/libulog.so
> /home/ncarrier/workspace/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-
> gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: cannot find /lib/libpthread.so.0
> /home/ncarrier/workspace/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-
> gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: cannot find
> /usr/lib/libpthread_nonshared.a
> collect2: error: ld returned 1 exit status
> make[1]: Leaving directory '/home/ncarrier/workspace/buildroot/output/build/ulog-
> 0389d243352255f6182326dccdae3d56dadc078f'
> make[1]: ***
> [/home/ncarrier/workspace/buildroot/output/host/opt/alchemy/classes/LIBRARY/rules.mk:25: alchemy-
> out/build/libulog/libulog.so] Error 1
> make: *** [package/pkg-generic.mk:293: /home/ncarrier/workspace/buildroot/output/build/ulog-
> 0389d243352255f6182326dccdae3d56dadc078f/.stamp_built] Error 2
> 
> From this traces, it looks like it is trying to link with /lib/libpthread.so.0, which can't work
> since it's the pthread library of the system.
> 
> 
> One thing to note is that, when BR2_INIT_SYSTEMD=y is removed from the config above, the build
> will
> succeed.
> So it looks like systemd or one of its dependencies, is enabling something which breaks ulog's
> build.
> 
> Does anyone have an idea of what could possibly go wrong and maybe, of a workaround?
> My host machine is a debian 11 amd64.
> 
> Thank you by advance :)


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
