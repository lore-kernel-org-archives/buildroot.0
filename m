Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F8C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 18:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A2A381141;
	Mon, 17 Aug 2026 18:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdsapX-SSmtn; Mon, 17 Aug 2026 18:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5591581129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786990687;
	bh=4Pfex9wQduJwKPRigDh7YK8CazzyiusTHzBCV3Em3Sc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kR1QyAnq6P4V22DBE5dH7wvfMdKMmhd+/Ty97RgCTHgi807wFLTun6lD5LmEzqLLy
	 /3xDypeGndTZg9iBRgsI0dzU7PYIs63WsZeUuNQnMvBzV9YacHlGPR/fhctb36mpIk
	 Tce5BxH18iJKfzu4nRaOW9MLNUd6wt8RRc72acozN6lKapSuY7e9OyzXkAOIuON8b0
	 9qMOGvhsvKTWXlFF+iVDPYGDpNiZVxiiknk6/OJaDdtSxZpa2NZh++QhERVOJ6N9Um
	 PLZ23jOZfnfrg1a7aXcWGWXfNZKrkcMpEK+XskXM2poGHOE5uFtmmMce/vAj3aaR4A
	 pkNHq8ZgETYAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5591581129;
	Mon, 17 Aug 2026 18:18:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B44147
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 18:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9024640097
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 18:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5777HDNuDew for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 18:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 033D340229
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033D340229
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=m658FuzF
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 033D340229
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 18:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHQssuAX2vJjDzsxQv4xna0yLYFXjpjuhtOi3SoDr2LihW/Rc7BdU3/cCeVVGv3C7AxM3tBhjkvmrZgFEeWZa4Ahqw85GHgALM5UOPkjiSFq1D1C50wXzi7XfZYVm4N6OfbtU2Pk32eMovJ2nTO5lYm/u1bemlbLApS4m/8Jipl9lIpGqc7wvWHLymUyQQkfeYnaXbHyH4KsMrMxUJnREdskpgRPg5bNTmbZlfBakSyYHqKubh1P2qsH7AcfLaaN6POBP6xyedDoiKnJAFmLCoBmtx+0ms+vIUSjpDzql18GPvPOW2lVoePdV41sZU8gl5bEDmJasOdGnK8x25FhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1A0wpJgCztInbQ/OKnbbQr9emb9m9WEyocQpBx6ya4=;
 b=NnJO1EFmd573SfiK9fwh8If9X20AodWn4yF/9B9Fuoaeisf8aVX4wJNaidsERbh7fcF8MCUQkEO9RKrRaDLCcULel7VVIIF9ZpYvdCyYRgAfNDYx/2z2NiAOyzs8X91VZPvNkoqiOfvxjCs0dQUnfT6MSO/V1pF2/HsxpF5wZq45HlO6h30UGRwEpd0Mc4yCddkpY+eUsxCLTYGEJ5ju4fU1tdNSwSkwnQzpja4xwdRcGRdkpYWM4lKPKHJxoEdyze/ugVmVxbaVonW0wOQacCw88g1hl2DGS36F2D6LiwZ7C/Fqbl+ymBebahWLZ6/kK1YJf60rGiLcLmogKYOliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1A0wpJgCztInbQ/OKnbbQr9emb9m9WEyocQpBx6ya4=;
 b=m658FuzFBn/lUh7JKQa2jzqN1FGQGmRMN/iiwWEM9uIGK23Du8heGYC3x3Qsz+SyDAKdhsAFeauXSB4DataAUDXro6NoHwtxdLjXOLZoh+nXk9tVdHg3sT1ayyBd5NLIzVtlcI6gguqQ3k60HL+dI33/gxHGAnayvqzEb399E2OmlRBNECgOAnbGMhKznXBOBbQfu6GVc1VNFhBPKw210R+lEkuQEj3qUKk2Q9LcBC0AX8DztYHMpzL88QXpw9iWbp+ngYIxKZ/Kd0odZhEJIQ9PiVptElwiBnB/HfZ2Bs0C0yk3+DUjBJnpBea3EfcINOHWgcPmN36UVTW44/VNhg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 MEUP300MB0262.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Mon, 17 Aug 2026 18:17:52 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 18:17:52 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fengwei Tan <tfx2001@outlook.com>
Date: Tue, 18 Aug 2026 02:17:29 +0800
Message-ID: <SY8P300MB0041B37C6A3A259B05B0404DF8A72@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: TP0P295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::11) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260817181732.7297-1-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|MEUP300MB0262:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc4ac29-5212-4cf9-79d3-08defc8bda13
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|23021999003|19110799012|8060799015|25010399006|5072599009|10092599007|51005399006|24021099003|15080799012|5062599005|3412199025|440099028|26104999009|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YceGB+WNLie403ALbLRJQSMD6SaaBe2VE/eVXSxBzOtrbPpVHhmD6B64aKFo?=
 =?us-ascii?Q?Yg7bk3dZD7Q4JtDBdZud8ssofGz9vBWpSzGndalA/q35+y0aD4s+OiBrZYc5?=
 =?us-ascii?Q?vZhA3cnju16EVQe9cjErSnme1EHwhIth2fDd4z1zIQGi620N7D18L5QCG/Cf?=
 =?us-ascii?Q?//IsQxnuFoOlrD9yApKoy2bGlG9WOhCbLGSZzmVmNoROs+8qqHEEzmtGQ2TD?=
 =?us-ascii?Q?+C02MDMycgSiR2wGOz+gVbAM6mPZChGb57KlcxKWx0ayi9fsO2JJi1UibSad?=
 =?us-ascii?Q?yg3quchMzyglF1l19CwsZylJK9IEEHdceffLFmkUK0DxsOkzKT3G1c8hOYDs?=
 =?us-ascii?Q?yPrFTPjHYK991gdLfhi7RjYyVHAc+IG0nBvca0S/Zc1/HgMVtb/GA8VD6WRV?=
 =?us-ascii?Q?Ks2g19iWZn7XTfYlJnxaDwmV4pxWFdOFFFhFG261hsFynO8NSXKrmZUg+mbS?=
 =?us-ascii?Q?8WbfJ3XVqblima3cNKI9gjSJERFVGZ3MX8ZI5aGGnprqbEAYfu5Li4fu9GZs?=
 =?us-ascii?Q?jp8CsB5LX1sUSHcDsMKCpHlfC8Ko0bzFfzYfB75c3OIeJyRXVksULeh1b27L?=
 =?us-ascii?Q?yGZkZ74sKzw6BzDEdEROu56OZXCLPzOCz0AQqVy1s3HnpVoLZ4KmXuJZTwYN?=
 =?us-ascii?Q?06eSVUKU5pobqTfKFeNiXmS3hPPknZ9piA3p7g8q2vqVrh/osIMGNRThLns+?=
 =?us-ascii?Q?vcH+MokjGSEiQ3gDWyZ4OOMQT4K0iA5on2MiZwqwahFJs/LyqLi44XmocdLq?=
 =?us-ascii?Q?QKLIUfEeJZHpkPe+j9C8rQK9+jkY53Tz9n+y2tjFG6QC0eHF1RYcgKZITbGk?=
 =?us-ascii?Q?OGV7+rDxDIe4nKIrJzgfZ2ZH/DyMXRmiyZap8FdOI9T6N4NQD+y6dkq7ZCb+?=
 =?us-ascii?Q?MRERuYB7cdBwJwKbSLUC42AocjYYs8uxPJ6ZfHNcNMKYuE11hRCq+KC5ZwNA?=
 =?us-ascii?Q?9Ak54HIDdVxrRklBQf+TdapjakyBvaW4ZY6UW/p6Elaoy/cGP9O8wqqnFg1q?=
 =?us-ascii?Q?bUEeeZatB9S+M2RAyaAIPovYr2lGKkuFVD+C7lOKs0OVZol7HCiaTZq4CN2W?=
 =?us-ascii?Q?8npKiEzx?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SaIc1Em718fMMpgZPVs6sKkiXxm4J52Er4bq+jOp7TKBrOpvuk+sjZgDt82K?=
 =?us-ascii?Q?ujNNfndxqEKvZVtrgrAjQJZSjwDLfJr7KsKn3qMVyzMLhD6Ke47ZRPIjfIY3?=
 =?us-ascii?Q?0L207ik/nI5MTghODZXw+7UrerR3HqlWggMd6kJnoMFCr1LvD1I/sisXjp2G?=
 =?us-ascii?Q?BJypel3uR/xA4Mqp/0LFQ/sNqEdNtgQDlkM2+7cJ26U2xEMESiOtBxTC49ay?=
 =?us-ascii?Q?rXf3b1Du1TFpzUy/QN9PZuC0pSncgIWDT6BKY1s1pDwVKOFz9S2RrvXkyJf4?=
 =?us-ascii?Q?AkLBDBIdwtt3xtl0KTVIec3o4UMZTJ4wAkuSflXChAyH71qlZAubqwwDoMLh?=
 =?us-ascii?Q?dRoDwxVT4Z8rGdAif4WtQ9X1XGPnCKdoBMrvR1Lh86A6m3jwCdgsI3i3ao/p?=
 =?us-ascii?Q?c50hAj56cBQl5+Ft9BFsGOBQnMiG6imAamzxS9O0jQrxMfadHRhd2J2xszY/?=
 =?us-ascii?Q?3C+5gAIZjuSfgyLP+0AULlODkVEC69GIWbib8YJPu6Eihv2WGNcV18vQhwwg?=
 =?us-ascii?Q?BsLm+mXy4uc5cgaiIDYL1MDBfZcST4SZjQQeybrbnu0vPSZLFRlw2R7mOt4p?=
 =?us-ascii?Q?kAsspBliLaeZ6yHrz5SdasbN1LcdcudHtoXIj6Yldx7+AEuWtVA2bRdxnsa+?=
 =?us-ascii?Q?EjPTPhE5U7gyZ/KscDX6qC2egpAXAYvQRPUBUH6aAvzNqxjV/dRHqqfTnEZY?=
 =?us-ascii?Q?dQSNpAMmNbPJ9YVfpARnZQKo3+qNQLZHmFkL5Z7GvhfKdqBXLmqUGibxF/Zq?=
 =?us-ascii?Q?SIUm1xBxQL0LUBN21bSRc4W55/E+KG8sGupoz7FmCSxTYvn7WJwfxqwFW0uy?=
 =?us-ascii?Q?W7mEvCCm2ZxuwXram3E5sgzCuJs5MHH/XeDldflUw78PwKRnFTZEBSlL0QpU?=
 =?us-ascii?Q?KZ7uml5rwldnWt0oZ6HqjVuyRZZkssWgihiEhibmqvGygxgOoq79HgDv+ipH?=
 =?us-ascii?Q?fR2pdL865dOiiVGjGYs1LGSGWHd6vfnvTkHjbdxmz0/v5dS7cCRq8LfChI8q?=
 =?us-ascii?Q?DhYXVowKOUaT8Yu/oC2n4FzVx2ZGV/xG+xf+6/ZyTuIaASIw+kdmHdWVq0Af?=
 =?us-ascii?Q?kuxjrfbZcBs4GayPRa29xQ2vFgw4C2oKAUcCZbUVbljS9ycb/Ktwtv6j5dNO?=
 =?us-ascii?Q?41Utjg9WybKEDM4NFALDxf1mxVY6G3esGkbr4mOGbyfPlM15DgEV4iAo0fv0?=
 =?us-ascii?Q?lAk0pD1H2bYOm/vtJXGQmdSYUqRoapj8kbBrarij8RkGMJrL7iugaEizUiCw?=
 =?us-ascii?Q?xyp+Z8el956ppTL4ThhhPAhvWcODrDCjs5+cCoDWW6FPdRQ68I5kVy2DRb0w?=
 =?us-ascii?Q?0JghXudi1uE6hp/0fmzM5KacMjdXLCGRxiP6kezQwwXuCmsgYPAUAQe/m6lJ?=
 =?us-ascii?Q?O6HPaTvetvi/YAGPcbcnEW9e8adm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc4ac29-5212-4cf9-79d3-08defc8bda13
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:17:52.5540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEUP300MB0262
Subject: [Buildroot] [PATCH] package: fix builds with $(PKG)_FLAT_STACKSIZE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a package defines $(PKG)_FLAT_STACKSIZE, ELF2FLT_FLAGS contains
-Wl,-elf2flt="-r -s<stack-size>". The embedded quotes are needed to
keep both elf2flt options in single linker argument.

However, many package Makefiles wrap $(TARGET_CFLAGS) in double quotes,
for example:

  CFLAGS="$(TARGET_CFLAGS)"

After expansion, the embedded quote terminates the outer CFLAGS quote.
As a result, the shell interprets "-s<stack-size> ..." as a command
instead of passing it to the compiler.

Pass -r and -s<stack-size> in separate -Wl arguments instead. This
avoids embedded quotes; GCC forwards both -elf2flt options to
ld-elf2flt, which collects them before invoking elf2flt.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eac28b3a96..229206d393 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -218,7 +218,7 @@ ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
 endif
 ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt="-r -s$($(PKG)_FLAT_STACKSIZE)",\
+	-Wl$(comma)-elf2flt=-r -Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
         -Wl$(comma)-elf2flt=-r)
 TARGET_CFLAGS += $(ELF2FLT_FLAGS)
 TARGET_CXXFLAGS += $(ELF2FLT_FLAGS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
