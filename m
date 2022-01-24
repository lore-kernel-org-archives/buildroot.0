Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004D9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 15:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ECCF405B2;
	Mon, 24 Jan 2022 15:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUSFMw33VvxN; Mon, 24 Jan 2022 15:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66EA940241;
	Mon, 24 Jan 2022 15:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 915921BF2EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 15:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8755F40469
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 15:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=hotmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPp_W1R7DV0P for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 15:28:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092073028.outbound.protection.outlook.com [40.92.73.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD110403C8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 15:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBTMM/IxkaxRQxvSFq/Ur4f2xXphRk0wM49dS2ObaxlctHCdaxrBZdobjaQpQYr/Rk5jiQKb00X7hugQOyDQBfDIKHsusMSLGTbz+9Chw8UcqMFgHHrjHtRRXrZG4sBpCwKK0Mtha6QuDNk/rdSlWEt98HFPymV5pSwWiX1a9BHKYj8h04UlgmiH+Fgnl4RihwE6eGt2kk+Qc/y1x0czN4NWjr8vXIPaZhJV+zpawYh7tgGD8gUQ3jzUwohOrFBOXZI5ZyjQYVfBrPWfYw8cEtNhTnG4ycNLE/AbF8Bl71mVdW9f+aNBx1BKS1QX+tu6sD6egNf6igxT0hwbjQN05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqdscJ0yz/1YKaE4S8xb0b4Aw1RItvMmYrkpQyROFMg=;
 b=m1xv/WzKtGfWTPjZtGG4XOl7Zr9efdEG8vQ5/QOjw+15LiM5PkhTfdscrYGi5VORxJwzSJ/3JJQNenSVX32zZ57NHEUe+upuX+w0b5owc8S0casuRr12NKE+Fxz4iS94FKP6SfozIdkzvkLbWbbKgMRYgXg6UfHmrRfLQfzZ1wNfpJBxHsTHi9oQTY7a2hd6An3NFYFZZhdA2pRyod9lGJdV+IJbSsKErJuQmm96q94ItNIrOKm8g5fuSfWt+cJR4lJwFKhCF+dKgsfX0r6jVDulJCBbu56dvn0JJkMsjdtGW3/SURIckWNSqvuaFdDd6nm7ynkn043qi8dMmFYzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqdscJ0yz/1YKaE4S8xb0b4Aw1RItvMmYrkpQyROFMg=;
 b=DnuZ1DBhErCqLofX/7C/ZH2Y30OLzjpX5EGS6xDwK4CiBpKy5cLmkwbo+eCfwFO2pLLW+M+ZOwCEJA8dbaycRM9j+6OPUmmquXlZ8/9g+G0WUN4/mfQdZb83jwpId5Mpin2rkIECgi+htI3h9WP36mYqLyA3EtWZcp6gI0jJT5QdHV8gSXYg+EBgG30wSscbfpBXgQerTB4WlfYqP5ToULn5CH7C1Dmwiio6c8jOv9D3GRhD7pG54Gnj67up0HwJ1Nd8AvwqrngDO6qh2sYB6Ste9jNzlT3S0TCFRYyHcE3zPcwolisq6+x7TXdAKuyLdJMwGLLNotgTlxGC3u/QmQ==
Received: from VI1PR03MB3677.eurprd03.prod.outlook.com (2603:10a6:803:2b::28)
 by AM0PR03MB3748.eurprd03.prod.outlook.com (2603:10a6:208:40::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 15:28:02 +0000
Received: from VI1PR03MB3677.eurprd03.prod.outlook.com
 ([fe80::68e5:feca:1921:c6d]) by VI1PR03MB3677.eurprd03.prod.outlook.com
 ([fe80::68e5:feca:1921:c6d%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 15:28:02 +0000
Message-ID: <VI1PR03MB36771B6256EEB933FE5C7DDDA95E9@VI1PR03MB3677.eurprd03.prod.outlook.com>
Date: Mon, 24 Jan 2022 16:28:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: buildroot@buildroot.org
Content-Language: en-US
From: =?UTF-8?B?VG9tYcW+IFNtb2RpxaE=?= <tomazsmodis73@hotmail.com>
X-TMN: [ZAscBc/xPd8M8dHANPkuOrsF3HmlnWqK5c3HrmWR7Ng=]
X-ClientProxiedBy: VI1PR06CA0223.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::44) To VI1PR03MB3677.eurprd03.prod.outlook.com
 (2603:10a6:803:2b::28)
X-Microsoft-Original-Message-ID: <9a553115-c708-8a01-f3e5-42cdfad93a66@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da9b5063-e916-4e88-347f-08d9df4e1be6
X-MS-TrafficTypeDiagnostic: AM0PR03MB3748:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jViVA8Ji2gAJWGnSQM1wAPEEA3dfgnZopH9wZeiIHexQRAAqznVLsXRc2pf+QhWwnoAjakKOiAEUMmgfxWC4+lcMhQLjNmQj8DaHvITCRws3PlhlXM/DoPjV+r0ShGIIVLvUO5yG91njTrgmn52oNYnUSuxlZxl7WilHUMdyick0ULZdOOH/tM/gFNX1hvv+QAPFpxShjnp1Ou4z/0tYeqGWa2evLePmCInTIMqKK/HxDZ1MhSK1WnkKMvpNInqNMI0bf1G13z1YGBhu+hl46EM+fhU/QsDGNwGSZR1Rvrrp5OvLM1ITDP6eYQktek00jKlTZBj34dBycvY9xpdnwRNUO6k8oaD8VfgwAnQBxllLYENcFLZHnAf8D7PIb1bmgIUegtTf5wCiR6hbEMXHAOsCWXRyGrzqo8susRgvp+KW8sCvRzDtfhCxHbY/JxOmPu8ev5n80fnK//7/0ykUnXI+K4SnwsfhXlhra2Jldn8yCPh2PNGR+g3bqvpiRktvXGQK1WO3NnaS+Xerb0Aw9LUe+qjJ03a3bwRCk0+RumBGLecQqKWPa5cojtpE8YJ1KEtKrHtvF36Tk7V431mhEA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFh0aVZJUEdQVE9WdmxrWGFkUVlad3plR2F0TTNxeGpXamVWT2hnSDBnYWRN?=
 =?utf-8?B?MnozYUI5bDl6NGFzSGlLRXprdlFkcEdrSnkwOTZVT0Rkblg0SXppSXBlL3g5?=
 =?utf-8?B?eGlva3hadng4aDU4MWx0L0MxbzZOTDZld2FyZVlzSHNZK2R1bDNaZzIvSURP?=
 =?utf-8?B?TDk0M1FpSHdXTzErdkFHV2ZGMkk0VS81dXo4UmpXeUdFQzB3RzZFWXN2Wjlk?=
 =?utf-8?B?Q2hveEtaTVZOMGxxY1BlU0YvSEkza1ZzWEtxNmdXZlIyQ1RKdFRWd1RPSkVr?=
 =?utf-8?B?R3BjMFRnK2Z3cnB6aDlvTEpUUnpBL3BIcVdLdGIvVldqNFVSdEo1c04yTTBG?=
 =?utf-8?B?M2d0SlpjOUVkSFJ6VElidTJJczZKbXdBL3NhL1V0ekRPUEpCNktVSHdrNWRQ?=
 =?utf-8?B?dWdvMEFOTjdFbWpIbnZ5SDRBUno1UlMyOSsvTWk3djFyc2owQTVvTXQzYlZT?=
 =?utf-8?B?RVppcjlkSEJqK0o4MDhtYVdXQW1sdmljak10d2kzOHJ2MnlUZzZ1NmFlRkdl?=
 =?utf-8?B?TVJWR0gwTG9FZk0zQUtVWVlBNFNPV2Z3K01SaGlWRmlnclI0dUZqVkFIU3ZT?=
 =?utf-8?B?MDQ2K1lHdURKYlJtb3gvN1hEQWxDNHNTUCtTektYUnYvdXc2MzRPSnExNGxk?=
 =?utf-8?B?Umg5TXB5UW5RQkFrMlZhQkdRWVdUVG52Z29vSGdNQml5OWd2SU5zSW1COHo4?=
 =?utf-8?B?MVdJUlVEYk1uWDUyaVFQZTYxT2pXSWJUWFJvWDVWU01nSTk0WXZNNXFJTzNo?=
 =?utf-8?B?OUJTaVVYeGFlTTBjSC9RQjYvZ056OTQ4NXNTUHM1eDJkTVJjY2hMZE1Xc0xD?=
 =?utf-8?B?bUVsTDl3NndER2lWWFpmOHYzRTZJUnNTQUcxcEZ2bW1vOHVUNWhhS3BzVndw?=
 =?utf-8?B?K09LV0ZTOVpDSGxiQWhZek5OT0NqeXJMekkyWW15dmtERTB0dkQybVZXVGg4?=
 =?utf-8?B?ZDlWMTR0ZEZIY0hkT09tbjBGbTZ0SFE4Q2xielU1aGhtTWlZM2d3ckVBc3RV?=
 =?utf-8?B?R2dPZzhIN1FyRUZ1aFVPL3FJZUpXekFmRHhjZWJEbnBHcGdibGxmQUxmaUJl?=
 =?utf-8?B?NkZLdzBaSEtkcGF3TEI5ZVNKZG9wVUx3blZudEJYMVR6VXd2V0RKaWlFVGc2?=
 =?utf-8?B?VmNIaWJ2MmtOeE8yY2FYUDAwRkhuZUMyUTJQb2toU1cxbzBKa29mYk5KQ1dC?=
 =?utf-8?B?eXdyVEIrWkYrRzBZdC81Q3ZqUDh1SEdoMXlxd29zbmo0clBla3BnbEpVU2c5?=
 =?utf-8?B?ZWd5Ykp2ZkdPVEIyZ2ZIejFLeE5sb3JqelNhVzBNQXovQnZhZz09?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-76d7b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: da9b5063-e916-4e88-347f-08d9df4e1be6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3677.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 15:28:02.2681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3748
Subject: [Buildroot] buildroot EGLFS support
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

Hi

With help of Mr. Richard Ash I managed to build my buildroot Os.

With the same compiler I buidl/compiled Qt libraries against buildroot 
sysroot.

I was finally able to run some cpp code. I successfully ran Qt console 
application.

However if I try to run Qt GUI Application I got errors. I enabled eglfs 
support in menuconfig:

In target packages, graphic libraries and applications I enabled mesa3d 
option Gallium swrast driver and OpenGL EGL and OpenGL ES options.

I ran make successfully, deployed to Raspberry Pi 3 b+ but after I run 
my app with:

strace ./myapp -platform eglfs

I got errror:

write(2, "EGL library doesn't support Emul"..., 48EGL library doesn't 
support Emulator extensions

Any advice?

kind regards Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
