Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8906BC021B2
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 19:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49DA183BA0;
	Thu, 20 Feb 2025 19:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6ax_x0PtiaR; Thu, 20 Feb 2025 19:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450D483EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 450D483EFE;
	Thu, 20 Feb 2025 19:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5FE0CF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3B5A401FB
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA99w71kQ4UM for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 19:26:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::70b;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD84F403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD84F403F0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::70b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD84F403F0
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jP0GKn/LLOyEJi+fm7RF56r23EAUGKrW6fZxNKYTlYPqLfluj9qM5eBuGEQQTbM8jvJh5cGzyDZUZ1hMISFSWcNknOisOdQoueSczzljF6Q4xxBX8uuqv5sGdTnF3MFjY8v6aB4t2PdYX9Wamq2U9A+qGTeZjJBbR2bSkcezVI2UjpDiAQLRvKRFh6hKaHJ8gcDWBb6uRFHxeqQ78KDY9DaQ13sjqKozCVdU6BWW3k+A0DnLa/aOoFXiEHPnkfSZHMwLGJ2jMFB2hNaxlNoPUqZ1f82WcNo3GmGVGwyDTCxhdWkAYpZN3a4PI36I0eYRd2o2O4fbShU2Ajs8i63HEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeQsou+SVq10RhCNRc3yixDqd8OKyaj+KgFyyc8AD20=;
 b=yjedcQJeLz1wzCFx6cuZVRrJcKJHZVxyDWsTnWFyCVr+z5tln3PjXJiiiBV/IHOXX/vbxsXWq3Fqs4wf2KjNwfg1g9T3MSnlkv5D+gmfG/MPow3MHERTQ/Dn4EeXjfSEYY/PmetbS33Qab4Ne2dQtDw4UbBeq+PyapJCcbT9NW4QSPDqhkWJQoe4BWipnKG37MnCU1HVT9j4f4lQ4mhkFD/tcmcxOcRVc5HirmtrBq/VHnNolUiLxRi9nIDd8lWy/wyw2VMHwreME/XlT5sCZzJ8HOpAn0YkCXkuTOR00QoBsAwrU7rzyYzy6EMSUeYal2i4AEer/ZTC4zipV9x5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by SN4PR10MB5656.namprd10.prod.outlook.com (2603:10b6:806:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 19:26:28 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 19:26:28 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 13:26:21 -0600
Message-ID: <20250220192621.1744526-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: BL1P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::8) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|SN4PR10MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 445ec833-ceb1-4aaa-7ad2-08dd51e47949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BMzvC1CU8JoxAUCd6NuUsvqdtoW7JTprN/vTQ3xFsITZGHsHSrxNZw+MTXpb?=
 =?us-ascii?Q?ZYuvQ5KF3HVynKZQ6FxwAnibS2aV5jczVb62a+d0Y66rpuznYz4bRqMStC+X?=
 =?us-ascii?Q?GVIRiMGrRKWg0p7g3Klr53HCR/5qDBG4Yl9h2jnZOik6BG0pu5iDJ0diUoyn?=
 =?us-ascii?Q?Fd97mnYJDzwTMX/W2vTG2SMoQ1uIIn5axm+w7YU6oe859kGAJMUd4+mDXRmk?=
 =?us-ascii?Q?DD3jyYEB6+YnvahbNnKZJLNw0zuOoPzty99dcYkPWzdD8x5/Qs3jnRLfMXtB?=
 =?us-ascii?Q?cOAR06VLuoJnCGJCL9wf0phx1fQiFYykEsgGWfAQsH8PI0PCwrzohso70mYu?=
 =?us-ascii?Q?44tcEap+gcGDzCDNUARIcPetkaTZKaLtG80nHZGpvybc85faMGGFV7Da+HAA?=
 =?us-ascii?Q?Gj0Cfd8Lt7sysVu5+PCujdWwUVkQ0Co3hJobAwMBOrtey+kBoBV0Xrz4ZvQX?=
 =?us-ascii?Q?Rke2polxTSN1qMNQk9AReNtCYyI68wtVFUePmjWgUM1Ws5dqsKcv21U03XrM?=
 =?us-ascii?Q?5HTMFWvrCK6A0ZxKdGux8ndrisKw20LEYdMRRnxapsnF6LY3Oqebrf6Yx9ip?=
 =?us-ascii?Q?OpW2kBYjn9mdcWWN+twOz1mCUddDz90FBqoJkgx4LG/iSPfIP/ewKrIwdlde?=
 =?us-ascii?Q?4NU7sJcDX+kTcUNUvTmErrWBFsh99Fk7s1PabA6SgKDfFxNn8m0UUY1x8NFI?=
 =?us-ascii?Q?jOZd9gnmGFgMmt0i2aHCT6FG444S//HRxwxDfzSqDeBjBUkob/kMvin50tv0?=
 =?us-ascii?Q?J7E4K5+MU+mE7IFrM477lyHcVTUQaS4aO2XHBCb2jFFEC0X3HIfBIAbnse4o?=
 =?us-ascii?Q?6ijQUywK+3XxgWH/CPz8eM+tT3Qk2yV9MbD5sNWkL12m75KnJtEPkh+vkfpm?=
 =?us-ascii?Q?smsxY0uAY1rWCo7nWLr/X86uPQFf47z9kNUKbTlBNMZ/R/mVQ7WdMCIVYrha?=
 =?us-ascii?Q?5u5JLc3NXtPc6iI7ppu/IKXaw3phcpEyEAPt8t9J8WcLai8wTQiMy/y9QY82?=
 =?us-ascii?Q?QXM1c2av70gs+vSE2MRBjYoEWbir6RZRrY8Dkpdsz93/Y6N5o1ne1PJrM8rU?=
 =?us-ascii?Q?AxotUGrqw26VQvgR08Sj7L8Wc8MI10PsyYS90fUMhVGdwjDssFDpQhDgMDKE?=
 =?us-ascii?Q?hGqL2ziUej456AsNxSYbpCPRUGGzJdpTb5++txKRl2Y6SZ9pziLGgSE9M+nb?=
 =?us-ascii?Q?m3U3Lgv2N4ZeKLDiswAHJTxAjhokQVeALEfoDGGuWJOPADZq3cAwQjiW3V2/?=
 =?us-ascii?Q?JGwsDt5/rpzQaiJu/0yOEHYPDACZ3pU33jzXAKNp4rEIClDtsatgjsFE022H?=
 =?us-ascii?Q?HOlRQzW0orQzXqRf4XegNhuSjQWB+zrd461jPBcOn5kQ2LdKIGXVPVWek3Sy?=
 =?us-ascii?Q?ZbBLqtPdX9yfhuOVzBrAJ0id7Jq2orGrTdrmKTnZ0z2K9e9BR94GMYjnofXD?=
 =?us-ascii?Q?H2tIY3aAqtIGntiEWvUJfn8KZaVo8Ncg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XlHbs7AipTTV40KkY14sdxDcA9P+lkU9Le7RQgkHjLRh7AiaGpIpXHQ5JTi3?=
 =?us-ascii?Q?x0AyXlTdLxv2CxT8dpvJYQXcOCwm5csXRXtjEl9Uc6NoOdm6iOD/xVfCt6H3?=
 =?us-ascii?Q?kAv9FAoqzllPaUDnjO6XgCEu/O2GRgKWCWzLbpRc5iN0tdCbbhTtEKX4k9iw?=
 =?us-ascii?Q?KxnySvIhc5t5v+zSdeitc/12V1Ma+S9PE0dqmLNm553n9ltxhrbYtmi2IcMg?=
 =?us-ascii?Q?eXfu1fUGdneUZx7kCI8H2NT1b2oULS4PUlW4GC+OdveF7jp9wJ+hNLzpWjFU?=
 =?us-ascii?Q?iuSHhogJaFDpqDKeG2zNhOghT8OtRAtl918p0iEk2k3xKtbgRNdZHniS/HZf?=
 =?us-ascii?Q?QkvZipnISJqO6rqNVk1QGBgIXNhB8+YWHsRLDlpGdogF5eYshLO6RNm1WIs+?=
 =?us-ascii?Q?cv304muGUAXuMtsECojAYpdXi2EApJg2uySVY9SF9HLNT3Q3WqNLIffLFwbq?=
 =?us-ascii?Q?zqYEFqwyZA4G6mSyOJcR+Kb/UUcDYuLbU/5l+cn7gVs6LMH6LX3+BybUm9gS?=
 =?us-ascii?Q?4E46VmoTcr15WrxsegC1TECsgI+RGv5y1DJTRrpU6wck727OqE/MzpbYEB2u?=
 =?us-ascii?Q?Z06IBng4WgaW7IOL8IrwTiTgMTCUGeyknm//ASre9LPWhHsImSixkGMmaNfP?=
 =?us-ascii?Q?USsREJz31nQXSwV8xDqE7cb5ocYmBOk38AbxbaUGm4AsUCxBy+JNT9OE416K?=
 =?us-ascii?Q?taNZJMuLLoVMjovIjFZgoC5whnVrkNhFZUGHx107/pNR0Cdc0dEKircM7/G6?=
 =?us-ascii?Q?bp7rOZ0WmzFOBx5ykUKUALRgCzNn6mht5dJ5AjS/4GgLJMgdYTczxpKhC6Yt?=
 =?us-ascii?Q?+7YRc9PtpU4IQTAPuMy63I6POdICRj19JO1Sivts2+zUU7bm2L65J0joMepk?=
 =?us-ascii?Q?a6FLFGumi1SpQ8WClFxbiMQu7kkbmz1fiVK0kfrLBEVGtHsiVPCCgoyTCi2V?=
 =?us-ascii?Q?t13fcBF/reNXZCqtMuGVdBJ8v/fr9xPkVuRw1JAn5VFVNLJsy3ti1x1b31ug?=
 =?us-ascii?Q?NVHPZquA713Zu2NcGXzugJbcnJhizHhUf03Dx3ToYMXz3qAYrgp2xjLM0h7R?=
 =?us-ascii?Q?vvokjVwNxGECMr/3YdljVqD7s4OWsRlncKs7vcssEXAHdCLs8SsYPBosKU4C?=
 =?us-ascii?Q?YdxPEr3E3LIbYvLw90N+nL3LIFW7jH6T92y5aYAwa69Km+Rs/e0Xb7NBAhgz?=
 =?us-ascii?Q?s3wJiaJO/QWBiLG616tFDUf6KxzEnBMaFCMnDWbxaH4CZRwqOs7kxaJhha0b?=
 =?us-ascii?Q?pZCNbcyHwRaxdlaZ08ICZAvfqfYa6Zjvi9K8L9Kclh8N9C8unrAJ+8CKGj5R?=
 =?us-ascii?Q?ggUvqjAST5+FJiK6cSEvut2lD1I+nuLS2BQ/jVVzYh6jrxiOLIclCZTjQEac?=
 =?us-ascii?Q?QfMFFWFU30KmnFxaI1RO4G0+o0mznFXHqhXEk4xoEkcneQQ7QvC6mApTIhvE?=
 =?us-ascii?Q?7sPVR5oJCdw7qfRMq9CuM4rLy1Emxkvnjki8YA8wQ/z9n5RZAHSRKIGpyxba?=
 =?us-ascii?Q?wqlg3JO7ZC1cTJHwruobYTEPuEKwatQTK2n4HPTJzIwO21NKJvbSdXNuOl5T?=
 =?us-ascii?Q?Xp1EbLEhUgsDMuiRU8Ig02MNs41peK8j1nbjlzy90FPUrkANTmuxMBvMfpeu?=
 =?us-ascii?Q?UCl+EG9Cq0gws21TBoSF+8w=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445ec833-ceb1-4aaa-7ad2-08dd51e47949
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 19:26:28.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fRPM9BMiDoiLZQ1YynGq+Yb15R99l9QhpwQJcIiV+a6TJBMzy6Q9SWDK2IMZ0Bv5XsI8jLfz5xFpYYJBMwXJJTOdc+DjmFaUstVbLRW2Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5656
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeQsou+SVq10RhCNRc3yixDqd8OKyaj+KgFyyc8AD20=;
 b=wLNaSO16sZCp5E7I6cxny8XsuBBm947WYNxhAgq9E3/Unm61JArt0DklFKbG3fQ9GICCsopmkocjghVEOID9efLFYuT0ik50lGW4WLKfiqklNKmbgxkzI+xwPuXnkFBuVl4787enh2nncRou2icGJe5LTb+Wrz/AeNtqS/KDrOM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=wLNaSO16
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH] package/tftpy: bump to 0.8.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/python-tftpy/python-tftpy.hash | 2 +-
 package/python-tftpy/python-tftpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
index 1fae4fdeef..3a040a456a 100644
--- a/package/python-tftpy/python-tftpy.hash
+++ b/package/python-tftpy/python-tftpy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2bfbf6377f6e3b6ba647f0ac614e9cbc225d1cc35b52991860ba6ea1ec58ef9d  python-tftpy-0.8.2.tar.gz
+sha256  fc1460bf698c4207a255fffb446ce21d44cb0d9a8f2ee5ad705cd40969800050  python-tftpy-0.8.5.tar.gz
 sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index fd3c601496..66de17eaab 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TFTPY_VERSION = 0.8.2
+PYTHON_TFTPY_VERSION = 0.8.5
 PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
