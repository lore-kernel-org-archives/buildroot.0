Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834C7C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 05:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34B3141F4C;
	Fri, 16 Feb 2024 05:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ho8_800EJPPS; Fri, 16 Feb 2024 05:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D1741F4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D1741F4E;
	Fri, 16 Feb 2024 05:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02BF11BF3F6
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD76883E5D
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbhFKI9sXK6u for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 05:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2c08::801;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=james.d.knight@live.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7997D83E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7997D83E38
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c08::801])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7997D83E38
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 05:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2hi194jEY8URUAkxd48Iqso/8E46uR/c3ATwmSPVDP+L4chV5QboDTHK066NXrM26ejESCyubT9V9dhDYcuupW2jdZ2ytClhB7BYg+gv1LH4zBXEsw8XkGvGcvlByw37aPZbqZjQkhmgkeVytDmeGSZ7scQyzvDe6ju8/r0DcgNDxoFnf/DsAAJGSIGMi5z0nsoDLyN4PAdQzk6/lr+C8vyQupEqY0c+OaxfodSnYHVSiiDHssMrWreqSxGvd2vaHZKEPcI+C7YZXP+8D/QZBqEhKCBFWEzy5MAoOmnsYVcga2+Ay5QgIuZv43UFze6w1SRk/4FMmDncszSxun46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY5AJK2VKYe6vJebX4zCMsORKjD+W2bOKCi+bgT1zxQ=;
 b=WKtTY2wBHNIN2PDRfZFfNh10glLI9YWFIuJ7knT1AioAXju7OXYXk+rZlyX5xQrqlg5HvTMPoTNbhNPG3ypwYUnXKzMu4mVKpLsEtdY7M+5TglVntj3kummY5E00Nv3Jus9lz31j4dAY6j4k+oKHd74pTxTvpb7eJAgvo2sL4HdP09otEq/fXyKl2slGu0SWhentd6CECcTi21Ix6e4524fs3o6lDfUtStvieNr0mzZviDoPok0hxhI7ZGeiHhqbUCV7/EXdm5X2T5599PXI8gX71vnCTM4vsjuQu5fit2kI18tHdcHkaz6MkQad0IAHt/D1/0MYNXdqbi7lT4Ay8A==
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
Date: Fri, 16 Feb 2024 00:57:57 -0500
Message-ID: <CYYP221MB114065AD82DF8DF273CA6105A04C2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20240216055757.1588-1-james.d.knight@live.com>
References: <20240216055757.1588-1-james.d.knight@live.com>
X-TMN: [mhlZLAfjwB3zLUZQU3Xj6078fXwhlqyA]
X-ClientProxiedBy: YT4P288CA0088.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::21) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20240216055757.1588-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|IA2P221MB1395:EE_
X-MS-Office365-Filtering-Correlation-Id: d95403e3-e586-440d-4346-08dc2eb445d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 370EMZNW5TT7DSSHGgL8Mk6cxVjdExe26wRLWt/qQT23Zc7JWj4D1XWFbzLZV4Sp/fHIkkAxcsM9UwNZ+GjlLujlMpmY4Gby06MqJV7RRUG57wNUzEPn4+uC0tXgq1XnpDlQKMxyPP0LzUhH4X1FzoUVL/GLQApmcIY5BL5cyKVyCXRWUh3uY9+Q+Kjtwry5OGhL8T0OmcfPlZudw+57+U3EdfWa4K59NX+cKAHJN3OeEDrsqIQPgSaMy62rXRNTnpmCOcVIEcDL3mhz3k7zvgt8h41coTuXILRxOO08liOEuAq8b2wkE/2suAwtFZTTp4Zzm0Y6qaiIyYtB/y9s9V2WoGR6dXuWRKFWiXDYljJnNY8Rlm60wps/xBPncWuKfC1688mdR8UgFreo5VJlMfKrZ1EIuHCm9URshNCZWpmXvGFxsCeZlEnuKygOcuSja4V0A+AbB6ha2cRTNjtBG2KV9Pvr99CT06DSo+rDMT0ddNpkNRlSCtv7+gh4cJclKmSfaG1rvPwi2bgkQNqfNbGMazvfxuq6n9vzDQW+S/tHNikjGU3VxjXXnCjtg2MY92dczywJRJzM8XEU7kUARpYoIYjyL2MHAl9qN89xCLPbe8wbv9AWtSWTh3QuG6DI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8A+G51ZcaxZpaNAn9Je3g7s1PGUIWQhXIpWeHAaGR677P4wEtGJfwrubsyBu?=
 =?us-ascii?Q?g23Fkefml9yd/jHWc/clUrWGaURbNnysRv7jhq2vWcmXmz+w0zvuo4wWYz76?=
 =?us-ascii?Q?ueY/ugwgCV7cEuIalfbG5Kb91NKpYIjMzvsi4d7eFr1HOvtChKHElzxuXOX1?=
 =?us-ascii?Q?Rpmrun0McIYoMr/VeFz1RvWbh0HEuQ7uI6iO6v4MdWLSKl9TRtJjXeA4Ig2V?=
 =?us-ascii?Q?onz93pRUjhv7HjeyrQeVt1mQB6ouWpq8GIKGZKHdlnHGRu91x97jPndMFf8B?=
 =?us-ascii?Q?M4zGjUeqU2xaGVaHrSReAWXaI3DqQ2Q3mzay+JwBsmLjGLBtRQ1/xbyaPNMu?=
 =?us-ascii?Q?QIefmgRMemEInQSz/xhY8jemkTCH2Heii495Nc4N9EbA7a2KtT805sH2s1eD?=
 =?us-ascii?Q?dDdV0eUXo7vduwSgnecIDaH6XNme3KmKzj58o63VsWxCGR1zZMuacFEzcZ9p?=
 =?us-ascii?Q?CBf7aN/PoB4nqgkzEAbyXu8aXeik0YQQ5Lmhy5sWZXqzTZX/sqJulLd8ZC4B?=
 =?us-ascii?Q?QyDCrB2XQlqPX9z0z0qf2sI45QtQ9pYIVx4BK2u2P2YbvOHisdfWLonnluGi?=
 =?us-ascii?Q?3tYtP4zkC7KJEunGi+L/Jd56FgX86BegAalZ2XuE90acuwfuaEOhYnktYVec?=
 =?us-ascii?Q?0pF69rVMoh6XhJk8hxOLuG2fWMd1Z+luz9p03kEP+lMvZyjORoawVUrtUSRm?=
 =?us-ascii?Q?GojTDXCkfpINBQBtVPKGp+fsEcxhIIH/fphGPWaRbipyK49EPioKJvH66b60?=
 =?us-ascii?Q?LwBByJPTPsE0OL1rzt3mug4v0YVnyL7jhU35nSWMhl/RPqVKhjtuqkoPKG/P?=
 =?us-ascii?Q?mye8SFxts2uBU5m6RblwWJeGEnDPCZ8WZD2WI1Dh92xpY+csuPD7BPL7/ixx?=
 =?us-ascii?Q?nSIl9VdDJaV5zYq+fj7wBie0k5SUHgGzYQfdKs6v7/TIz0I2NfOhnx+TWg/X?=
 =?us-ascii?Q?t7Lt2eicFLzC+Is6TmyWuwkXQa/0F31qUS/E5D7zZdavBqEL0VOetUaXhu5h?=
 =?us-ascii?Q?wRR9AJNEmFVPb+dbo1Zl+ENQoAYSinor/wQSnWDQu+Po+hTLKpuUa5i6Et54?=
 =?us-ascii?Q?WnqnfHyZv/k7ThCkbizz9xRr/4DtVG/YgKubO/OlMvWmQrGzcIu8R0Fbczor?=
 =?us-ascii?Q?tKhBeTCEQ+wbJ6dNuZjrL4zuvIlgiXcoTGI3hWPOwiO6I7YlKQT87bsPw4dX?=
 =?us-ascii?Q?UKiefV1a59E3H+3EPgfRFHKZ/V2egtF6gt5j3bzejErNci/TCtnF2glRw1U?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d95403e3-e586-440d-4346-08dc2eb445d5
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 05:58:18.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2P221MB1395
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY5AJK2VKYe6vJebX4zCMsORKjD+W2bOKCi+bgT1zxQ=;
 b=JLL3K8+X5e/jiyZrhMs1hdn09LT4h+ohRsBvhXpw9mYUgdcTmiRcpjZzVrUn7a4MpI3b9K7cYGBN5REwSgpUWm5Vc+VagaPCbo8nXBtuUyM+qXAkdvLtzZ/m5mxyvKeJOEkTgT4rwKmslLReA/vWuMZ/deWwV1CXobj5Msa4hPMoii0+rPsXzSF8B8fb+/I6Xk0SdtNnaq/fQX8BsnUFPv2H0W6UNWUHKF0w9VCPNicImPVBqP3rO9YajZyc/5Ti3ST8ChAFayL0ZnnQOpY06uO3d1KrRWVBLXdIfo6DQW8hgqkjF8rvLlYkpYiIE5gRYBQxmNM7nBLXb1/LDiXTHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=JLL3K8+X
Subject: [Buildroot] [PATCH 2/2] package/util-linux: adding cfdisk
 enablement comment
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

This commit introduces a menu comment to users to indicate whether the
`cfdisk` can be built, even when the basic set binaries option is
enabled.

For users wishing to support `fdisks` utilities (cfdisk, fdisk and
sfdisk) in Buildroot, these utilities are enabled through a
`BR2_PACKAGE_UTIL_LINUX_BINARIES` option. This option configures
`all-programs`, which will default enable `fdisks` (along with other
program options that do not have an explicit configuration). While a
user can enable "all programs", there is no guarantee that the `cfdisk`
utility will be built if neither ncurses or slang is enabled. Even if
an explicit Buildroot menu option is added for `cfdisk` (where we can
force select ncurses, if slang is not yet enabled), there is no specific
configuration option in util-linux to toggle the enablement of `cfdisk`
at this time.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/util-linux/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 73fa11380e82fb42da170045e1c03cc3a5783637..e59072f039bf780df768bfa7e0d66fbb13ab743c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -67,6 +67,14 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
 
+if BR2_PACKAGE_UTIL_LINUX_BINARIES
+
+comment "cfdisk needs either ncurses or slang"
+	depends on !BR2_PACKAGE_NCURSES
+	depends on !BR2_PACKAGE_SLANG
+
+endif
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
