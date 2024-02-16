Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF8C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 05:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6F041F4F;
	Fri, 16 Feb 2024 05:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gy_8jwEh25Dt; Fri, 16 Feb 2024 05:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B305841F68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B305841F68;
	Fri, 16 Feb 2024 05:58:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E70A1BF3F6
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB7083E38
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjEQsPYuqNND for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 05:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2c08::801;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=james.d.knight@live.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00C1C83E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C1C83E34
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c08::801])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00C1C83E34
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 05:58:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO153ZgdCdR5XOsyKtBdrOFJ5EjUSPx60EEikQzE6QzYXaa/S4Felve6m/luVGgowc2NZA8iAEymvJr1j7Lw3bpCZ7DvnTjB4YPYBakBewG36TTL12Rk5BnGZwqcfCPGbZ3DTbBWCYs4CHQ1FOBiKfaAMACyKcSePB1tmuXrZdA1ozeU8sNLV7xS3ezWB2zsL6nS61UGJkeAwMPOgun9uQcwYTNp8w1qT/hCuZXWjZcoYxC0dxgZydfdyVNq2u95YP8omBXbV+EPxFoYU/rpUbTehEsLV+1olxRguaaKxOglAFDyGrbWbCD7g9flrMDQUBOuKPOCnEJ+GZradfAF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUkdcm7qJAw++pVheFvYdVEqQ8T8+MjVFDT04aK/0xw=;
 b=JQRu7gywOMxLXDxF0YUbs5QTr+cYcU2kl0JeKJNEl3vCMeqimhcpiwaiq3wZFwlvUjyL6tvjTtbyxR0f67IXdNGbWiwXxgTaoZLjSsMex2aqfE9HHPiu7d50babPpG3GpL+Xrp8AmbcZWROPLIhaIHbkENog5DrpJ1ljHmCXPbc335lbKPvIGzExZqXjYTH4Ay056mYyH7v76ShwygYdm/OVafbAwiVD3x8MuOV5/UfkwPjecU+//qbDaOsWFnXS08hTDPqk7g0VhJW5KM15oTuqjcfAs7o8yzcMpwe1iKbV7DpP1mEt47pYnhL69Wil9k2ZlG5yxMzS4tyx1KgcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:c2::14)
 by IA2P221MB1395.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:4b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 05:58:18 +0000
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::908a:c51e:8c17:1fef]) by CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::908a:c51e:8c17:1fef%6]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 05:58:18 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 00:57:56 -0500
Message-ID: <CYYP221MB114031C1D7D4EB72E8EDBE56A04C2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [1Rl5WHjGwT5C1cixqnbej79lgnJ0fDpy]
X-ClientProxiedBy: YT4P288CA0088.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::21) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20240216055757.1588-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|IA2P221MB1395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df09e9b-e857-4ffe-3335-08dc2eb44581
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyLn0qs61NlNGBwif5mv5I0i3ykvc1Lg4+rQAMo44+WJwoxQMA0rhN34dYlNuwhJBNajzMj0QGJdIajPkwlOKQsuI1csozHx6qsJJAk4WStVTCZRZ9HTrSSZSDHVcSjw4Xhch0p4zVRNKS76Pt8xXrEIqrBc8RTePAp7hdpaJRHnsOLCeodGfQWEYgLTr88KRbezo5co4I9d+3Dk1fJ3HIvi6Qgn76+VTZmEAU77LomhMRJwTjAC2J8pOlPXDCikUVUjAs7OnkDqEKLjbGlTLT6hhBAyKB6/dJSwkPPu1lQY6V94konIevsYZKISI3X1dx5mTWXX0qjxRx0BmwcGV7QnNaRrZxNe8CdBrEniMvqjPyho0GjzUecb7kY9hEiVfHJKHzKyAldY4yVeDJh4RWhBgR/y0/osF0S1o83YZv7AhvsVGFXY/scK2FpW17b4KddG78kNtHIg1KNZXM6xBNOCTR2/FhK2SI3UqA2IpHjC+fA0a/cSnaWZvxDhiWMyIcKlQ7Km5i9HN0GdrN5ix5YaqJN/UJB8GB90oa+hC5N5BrEUqyR/Onj8hg1u4sMcrDzpZZkKvnQ3SPSPmzJUmT+7StxW+Xy3Fd+QGT5hVo2TdvR4zpwg3pbSWMxHxu+o
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ZDjbYo2lPU28w82dkIJcAnfUTRF3DcniDMREILWm5zhkDBPP44AQsB8qe1X?=
 =?us-ascii?Q?QjtNTrOeNCnSr5rQ0C5jKVLAHZOP+jVlBIK+rqi/a/av/TOo9K6nl5Hr/3MR?=
 =?us-ascii?Q?AjKb9dGkhUWe71LlR6lLmy7PLT2SrJtckYTEqqFVY6p+81IOwTOTwrkJLRQa?=
 =?us-ascii?Q?mv0HM1faLt+bYwVgWnivVbvYK0sVaNnPrU2SqnFDphyG52uzf024DLve4uIq?=
 =?us-ascii?Q?QGpYcj3U6Rz2EjW3SAQ3LA5vpttlBPZgzOADqgJmLAgvkEtbc5jNwzv4sUWO?=
 =?us-ascii?Q?b5Z6lgIeYHAQC32oP/vHxNv9JJCDr331g+N8ToE6Saav+gz2WuVVl0oNuv2y?=
 =?us-ascii?Q?+sDvecmq3o+FxRvkaYKHeqITjzK4k6EeWm2h/7WG//0Htc6dB50jGXrsd+G2?=
 =?us-ascii?Q?a5pvhEfRFTtzDXyV9f33zMJWrrg41ObCZ1wdflsOPCFH777awqiTwrJ3vXKh?=
 =?us-ascii?Q?wjQB4+SF2skEtMMAKvZ8TzkgtJfh8mm502cn1xSm0CWUy3sdsgOK/mYNZZ0T?=
 =?us-ascii?Q?YUx7KfP0lny3Q7qOP/dVkwXDb8JZgGBDqVJpwwqgc4jwfQOrQdE71n2gV5af?=
 =?us-ascii?Q?QU9c5aJWXzIwEFeJ64Mwc6ZMm0JPfyVNgzBnIg7gVgZ3wWQqBhbJQYnvlEt+?=
 =?us-ascii?Q?RLGASBpnf6VJa12KgFi09Tkfzo3qy+9E7yVNMuhnUM0TI63BcOSx1Ow5mgXJ?=
 =?us-ascii?Q?tchd2xlM/wGDyBH/4f3T1uiTb9XoWNbfOxkywo0upenotDy+ppcHkErxjOHG?=
 =?us-ascii?Q?4LpcGqbnRNP6ghpAT+3C/NjmiYFlSeSZsGg52J5TESnLxtyjAFgXWbxAs/f5?=
 =?us-ascii?Q?vaSarMg22sB0HR8FwcJoWDFJxLJ+qqdiqKU0FoFbVMpzD1D6+qgDAA7pefrt?=
 =?us-ascii?Q?cC6L8M2LT5Kh07yb6hOV3UsYo3b13yx2atPKlrSir7Qfgcw4N6LXDD4+tBpD?=
 =?us-ascii?Q?iqzpL0WuFDhVAkb8JERjMvbQr62gl9PJe4tQSRFTkNG6ZpJClnyloy9t9Qfb?=
 =?us-ascii?Q?s0HYn6ditPu1zmmi10CnXZufzXE3/YV+Ragf26OD+onPmYop1z28tnUWx5yG?=
 =?us-ascii?Q?Arn+HpgBuSwHGy7fkHCdNw+Lw6uaacZfN2WfI8V0EdViGj8GsO+WfJSXIlsV?=
 =?us-ascii?Q?NxmdZj6ezosrBt5Ro5Mp+naIfLLQeHVfP+gHQt0+s3i8VSLZlUqGgEDzGOOo?=
 =?us-ascii?Q?MWFyMbXCSSn8RU/lyc65kr9Dzsu2MwN660eRJnGVaBFJhLC/woYR1ZXpP0A?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df09e9b-e857-4ffe-3335-08dc2eb44581
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 05:58:17.7417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2P221MB1395
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUkdcm7qJAw++pVheFvYdVEqQ8T8+MjVFDT04aK/0xw=;
 b=ewGsACKkmUGKYTrZCPCR6TZDdfmZj9pSUI9d86OfnBxR8yCuaRD6ceaLDx1h3fBaYny3CWncFH/R+rvnQTVQ0M5gENB5OmTvdy5oBFTE/Sp2WHIeSnDQh/dwHn3Bbo5D02F2yTs12o8PNPD2eR0n881rSdcUWSCqSufZNNuFjcYxSaw2wFpPjhfqirC0CruKxpWO+o3wYXy8tZkvOKjhhfwfytcnCU+8PicrH7F2ZEC7CeFotuNojHifdYRTe4E2oUSr5WoU3F22ZuEav+jjwmThPh55tc7iNx2GOS9KRVSyJ+eW3burAkMarFcbIz6WVY0I+tyKvlTrBwruQ2mBUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=ewGsACKk
Subject: [Buildroot] [PATCH 1/2] package/util-linux: explicit slang
 dependency fallback for cfdisk
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cfdisk utility (under `fdisks`; defaulted by `all-programs`)
provides TUI capabilities from either using ncurses or slang. This
package provides explicit configuration of enabling ncurses support, but
not for slang. Updating the package to explicitly enable slang support
if the slang package is available and we are not already using ncurses.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/util-linux/util-linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 72126adb005f8422a19ec303897b732f86dd22d2..8a162f179cf332b9d1bab8b42a5f6e6e652b2942 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -96,6 +96,14 @@ endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
+# if ncurses is not available for cfdisk, try to fallback onto slang
+ifeq ($(BR2_PACKAGE_SLANG)x$(BR2_PACKAGE_NCURSES),yx)
+UTIL_LINUX_DEPENDENCIES += slang
+UTIL_LINUX_CONF_OPTS += --with-slang
+else
+UTIL_LINUX_CONF_OPTS += --without-slang
+endif
+
 # workaround for static_assert on uclibc-ng < 1.0.42
 UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
 
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
