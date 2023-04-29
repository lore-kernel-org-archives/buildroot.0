Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E4C77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 19:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6382383B42;
	Sat, 29 Apr 2023 19:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6382383B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id im5O2FcLyUEZ; Sat, 29 Apr 2023 19:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5704D83B48;
	Sat, 29 Apr 2023 19:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5704D83B48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A65FC1BF2B6
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 724EF41BE3
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 19:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 724EF41BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNbK0xLZRY_F for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 19:06:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B03D441B55
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn20823.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::823])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B03D441B55
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 19:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNM0M9SNyVWSl2pt5CUTjagWhrrEgCE8nyNz3tvc5o4LxY9LdD+0InNgEA6AiVEc6OmTfNzZK00nd+VdAp2M4OkMzfcqpHOf+44dIvMJLCeYuK/+nJ2rOazb/wi7d74581pAm3CT0bY7upqA1XtyB9iwuTy1Xk4A7oFBhm8Szww+6Wiccw00x4inXK5vvaYo3oIRzFcVeGx8NAI8agshnC2/gdy2BykGFVGAlKavkBNwHx0GiZfrz9BmT02+M0Nm9vLKjon/WOsfoPsahCsE7AYCISufsVUdVzsCQPqMy3D7NEfe02tBVNNzgdCARsJBuPz5H5kk94lb1hhpshBn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qI/bv8qq6uqXkbYmAklWJxfUc2aIyi2+nP6ZnGV7FU=;
 b=nzNZIPrdZw83Vi3p7hnTynJbMk8HlgyKJ84sU5sZTsLh29DNEPjWPbJslg1Z3ajmpa+Iy2F2WQkjkAxuZLCT867XleZTdi5p5AHkHrnlHFtZHgCIacQQjzqegSdE1BqpkMTgss2IfaDh75QargQKxqVf/4O0V+HA1XfFYGCFIlpS5zS7JoVEbtrNuuIlMKm3+/gTjCU8xexYLGm5e1+qaFr/PpFaALDux0FZZuK2egshwaVv8DJdEU/ZHT07mt74hhYSKjPj51XLISVUvfgDRaG69XwppUIbcSBr+1LgA3+dq3VchSFtmDRES6XQ3+Kcnon/UFLOcpP90JyBFew2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CH0P221MB0283.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Sat, 29 Apr
 2023 19:06:10 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 19:06:10 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 15:05:50 -0400
Message-ID: <SN4P221MB0682DC54AEEF8491EF1BBDF5A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [Mgr4BxMguYd9+OjB5CP/J+INYmez1q8j]
X-ClientProxiedBy: YQBPR0101CA0260.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::34) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429190550.3779-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CH0P221MB0283:EE_
X-MS-Office365-Filtering-Correlation-Id: 28121aeb-3616-488c-4ae2-08db48e4cadf
X-MS-Exchange-SLBlob-MailProps: ymJijV9pwJnbooLdNKzNJirj8Ooh0Fe6qRtc5PSJv/6vR9gZLrrniCPqNXzb3U2EBNAstSx47XMBGxslQXaQ/zlIOpSD63abXY78a5Z7Zbv81c0GjFxNjCjD++XxQ0k5hjBgu1kD7cx0T264SYJEkBIp4tKlHIqyg3fptwdyiKQRm8IfJc3KzVcjdAblR5WZQ03hSnbtupx47sqsdfMWK1DNBaU+qryPWvGzb+wyaR2pWMGIWY+FLtysuTHwWj/I0JKwqIEKJyS0rtZXwGGCtcBY+K5SBqkHx0N1QDNiI4xbIjMUYHYmBTX5lEo3PduKYt5wy1WcImWtBijHyatsvXJRkju4ilEt+WyMwRCrTbTZQwrHNBMy5/ifW+SgYr7G7gQdeo1Lf1HLI9rJn7hx4HwSHxH5g3ItBYpcfPm+FFsSsQGmfHHAPoE1zQPe991WdCc2Dt6D0ad57ZcbdUsSYAN6FvcXD2/5UkI3XPkeiLhUIjD/lrKXdSL/90+DUNDGO/aEwQC0o2Wvxc3eNbeBzyWM79HqUfrNVzN0kMqFPIDDW58Y8ac9SZBEEmENMY5e1OPBbkdRXZsyW4uSF9vWX2SJEA0UaUd+bkTHR0O2Z44Hqs3VS/d9KSWczZQ2+8XLJB5F42s6C42bfou1Mm5nbXj7Xy7CYuO1Q4liN8nC1p6aSfWw60X6AZA2jaGWPjruzGVDapH9DTHjEVqnG91kZQbR8SHSlrNHgZhWVgCGgOP9ZMmMPB//uCsOa1RpXN8pj+qQ4Jumifq8VJEAGw9/3Zvg/5Ogm5Fxigtx8fam2UdhFJvlkoXDNsbErNERcdio
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pcvfejea0YfUtW66wtqCNe44tK+2LtnNc+Tb7BnG9Pe5+/nU4JIfBUgmWCM4mzMb7mmuCRWneJebDUmJ/shD4bPZ9QPGrDcG8rm5l+HF6jncBPP36LOzDAH/IDzSuV4NoNueY7aEDzPg2EOH6gV6Cg3xUEAWzbFqdrzTrQDg7yzyq8Fo6YywN2eOimbLzGtWrWIftbXZWb7iKqkC+wBPMqEmcOvNKW6JbiSo5teGyj3OEIiyrnWd6QlRnEcSt/XnFUpU9bFkare/XSpQ+ImEQ4a/ePsk5EIe43z7dgg/ZhcWNX1a0kHiIT92WOpf8+LbuhsUq3FE5VAoTEXtZQjA346gZbkm40E4UbRMPjR4Bn4R6y+mzv3z+cUba6TqqACcX6ZHLq1EH4JJCSuxOVJzROdMENKU4Wwy0lmnzoT2m8LmyRgh3JFZA8QDJDDD9zwtlX3fTis5/8SQh9wD8xttAl4DZ/3Mq71EQmZkjKmQE0+UrZqW0LwchEJ4Y3FWiVDq0p18HeDwWB4MIUZNKxIjkyC59U41+JZFOZOsDqAeuH0N8C4VPEdadsxjS9Z7Xhb3XU/CoL4Vbxyi2jfwvHf2BE8hOmiGH21uIiSBRfgvENA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HKBQGm6f2pkVzdnHyxa2kwFtFeBBcIEYAi5sG+XQe6pFy/LiDNmZxBl5pWMO?=
 =?us-ascii?Q?9/vgX7713Ml6l+DeGxtGlmMwsj/4hbFjlf26EIEmR9IfLxnlaO2Ceas/cuqx?=
 =?us-ascii?Q?oGzHj/QVjmpCbr6FYAEFYG53eCv3uUeqaarU7JAWS4BJULc3gEAo+MHUJInR?=
 =?us-ascii?Q?NHKp0p9CNi0KH6YdjzkZGxkZNm51VGvujL9brAs5/uB/4+bHjkJpKo3f/dEq?=
 =?us-ascii?Q?bBaHLJ6rEMCNAnAkMAXvBo8m4kr2FTzYTCYtsNZAaAAf9Bh2kUbFRiMPOiuH?=
 =?us-ascii?Q?24qfw+RU+fOedC6Kd42Fjqpk7RSLfLuQle6/LAqZ2ojYZQGasLk35dMTgM+h?=
 =?us-ascii?Q?xKxsl6tWmROFS4syuvqjO4/vm448hkvRKcsL+XLepvtA3VbVQveyLE7DvPlq?=
 =?us-ascii?Q?G6bWNNyx0PNDC790UVUs54MODwHhLxqsz1Ug7VKGQgqdbqq9TtKdodQjeR0K?=
 =?us-ascii?Q?KnbGleKXQBwz5IucA+X0hTI/y9hjCrgr8dF7+EMdWMmgxafo+EXOICFyfXLC?=
 =?us-ascii?Q?7Qi46hITjZJ9WHE7TkKuT9j4DOm6cUfHgm959TkGaSSY32PdQh/kgCelgvzI?=
 =?us-ascii?Q?dUdyGXRW6r8pjOS/2NoiySftVFB8U4RJzGUkBGQWWgoMzDKu1jZJN5V9jW93?=
 =?us-ascii?Q?ygruiVrNaLnnF5/uHy174uHumx/uTnX+obS3aqoKBG5N1l5BRJOmjl1MHx8f?=
 =?us-ascii?Q?lAlkD7FKCqe6lLehf+M7QTKjYpBEpdYfcPlztUooHTTpIbJL/IzFfXQ36XI0?=
 =?us-ascii?Q?6bV8kdWk/l+sM2k/AQC7cAWv2K7nvOBDUsZ65smEtn3juQ+J0+SQNk/fQMmn?=
 =?us-ascii?Q?KZ1WsQC8mQ8fxhhVeXoaG/BBSqzmAJoeRtscrL0xtqYmz2ddKMP+G+7/bTWD?=
 =?us-ascii?Q?NykK/enfVZ3z3Asu3ld9I7dvPGiiuEvTdU++SLB+spxw3Pbxv0hDWdBkDEy7?=
 =?us-ascii?Q?wtWIWRK4vX2N5wRjSXPBZuKNJoFS8V0VDT7us5kzxZAnZjAAAgruk+zRqGgB?=
 =?us-ascii?Q?ZgBbhyBD09IE58U2BIB5Li1CqTYezlNVmD6ADc0Xfib7/n0RtNJtWyTPiVMi?=
 =?us-ascii?Q?uOMqkNu549XEsDzuzKTVREkAyIKMjVFmNz+1cpSyp8t0Ah3JPeAZlNWy1TaS?=
 =?us-ascii?Q?0BfXOz2uz5syyTaXFWuhcYRS4y+AI1fBhITZffKrnclcEQhye2xiWNnCgcmf?=
 =?us-ascii?Q?H/d1vJtt7w1AUca9GD19/Sa19J/MKkH5YqUEAuSr4aeZ4M2BlCJrxXqwrgs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 28121aeb-3616-488c-4ae2-08db48e4cadf
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 19:06:10.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0P221MB0283
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qI/bv8qq6uqXkbYmAklWJxfUc2aIyi2+nP6ZnGV7FU=;
 b=TsoQxULlWXVWkWnGVFBYtzifD9JGXO2iY1m94ujGSWgreyaEGaM//yVtmafMr9lRSC2KjPowRTxabXDMTYeJejRTdavOxqGFRFTVhPjBmMR/+xE+PPuC7CXlbxSKC7eyS+0RnZm/JCArcRC5eI49j1L82t7ghTdCyZiaeBXhWYBJRBE06A3TjdCur7YewFB34aeehb9ip3Dms1b/tProv9PwAjQrDHhGdV1qoky4kPQ9SGRY66mqogvhsTsWXiLh5lpg9rjdp/ltmZ2uA8A/lpxK8taeP8G+tbs9vxyT00tGl9EnmiJ1zaYaBfVWTbH+8X8NfLalkmzjWJtTqhQ0mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=TsoQxULl
Subject: [Buildroot] [PATCH] package/systemd: update help links
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

When browsing the help references for various systemd features, it was
observed that the `systemd-rfkill` link was dead (originally pointing to
`systemd-rfkill@.service.html`; now `systemd-rfkill.service.html`). This
commit corrects this link, as well as updates all other links to https
(since freedesktop.org now force redirects to https).

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/systemd/Config.in | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9f4d933779e8550040aad6a2225fea82029fada8..bea717a4560f573fafbde53efb846f8be0b663c0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -100,7 +100,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  the apropriate ones (e.g. e2fsck, from the e2fsprogs
 	  package) according to the system configuration.
 
-	  http://freedesktop.org/wiki/Software/systemd
+	  https://freedesktop.org/wiki/Software/systemd/
 
 if BR2_PACKAGE_SYSTEMD
 
@@ -185,7 +185,7 @@ config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 	  systemd-backlight is a service that restores the display
 	  backlight brightness at early boot and saves it at shutdown.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-backlight@.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-backlight@.service.html
 
 config BR2_PACKAGE_SYSTEMD_BINFMT
 	bool "enable binfmt tool"
@@ -202,7 +202,7 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 	  kernel when a user space program receives a fatal signal and
 	  dumps core.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
 config BR2_PACKAGE_SYSTEMD_PSTORE
 	bool "enable pstore support"
@@ -220,7 +220,7 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	  systemd-firstboot initializes the most basic system settings
 	  interactively on the first boot.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
 config BR2_PACKAGE_SYSTEMD_HIBERNATE
 	bool "enable hibernation support"
@@ -229,7 +229,7 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 	  When this features is enabled, additional tools and services
 	  are built to support suspending and resuming the system.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-sleep.html
 
 config BR2_PACKAGE_SYSTEMD_HOMED
 	bool "enable home daemon"
@@ -261,7 +261,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	  systemd-hostnamed is a system service that may be used as a
 	  mechanism to change the system's hostname.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
@@ -286,7 +286,7 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	  machine and container images for systemd-machined and
 	  machinectl.
 
-	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
+	  https://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
 config BR2_PACKAGE_SYSTEMD_CATALOGDB
 	bool "enable journal catalog database installation"
@@ -309,14 +309,14 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 	  mechanism to change the system locale settings, as well as
 	  the console key mapping and default X11 key mapping.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
 
 config BR2_PACKAGE_SYSTEMD_LOGIND
 	bool "enable login daemon"
 	help
 	  systemd-logind is a system service that manages user logins.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
 
 config BR2_PACKAGE_SYSTEMD_MACHINED
 	bool "enable machine daemon"
@@ -325,7 +325,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 	  virtual machines and containers, and processes belonging to
 	  them.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
@@ -336,7 +336,7 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	  primarily providing hostname resolution for the locally
 	  configured system hostname as returned by gethostname(2).
 
-	  http://www.freedesktop.org/software/systemd/man/nss-myhostname.html
+	  https://www.freedesktop.org/software/systemd/man/nss-myhostname.html
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
@@ -349,7 +349,7 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 	  This simple network configuration solution is an alternative
 	  to dhcpcd or ISC dhcp.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
 config BR2_PACKAGE_SYSTEMD_OOMD
 	bool "enable out-of-memory killer"
@@ -373,7 +373,7 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 	  useful for allowing unprivileged processes to speak to
 	  systemd's many privileged processes.
 
-	  http://wiki.freedesktop.org/www/Software/polkit/
+	  https://wiki.freedesktop.org/www/Software/polkit/
 
 comment "polkit support needs a toolchain with threads, wchar, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
@@ -408,7 +408,7 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	  file systems are mounted. It is pulled in only if at least
 	  one file system has quotas enabled.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
 
 config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 	bool "enable random-seed support"
@@ -418,7 +418,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 	  shutdown. Saving/restoring the random seed across boots
 	  increases the amount of available entropy early at boot.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
 config BR2_PACKAGE_SYSTEMD_REPART
 	bool "enable repart support"
@@ -440,7 +440,7 @@ config BR2_PACKAGE_SYSTEMD_RESOLVED
 	  caching and validating DNS/DNSSEC stub resolver, as well as
 	  an LLMNR resolver and responder.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-resolved.html
 
 config BR2_PACKAGE_SYSTEMD_RFKILL
 	bool "enable rfkill tools"
@@ -448,7 +448,7 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 	  systemd-rfkill is a service that restores the RF kill switch
 	  state at early boot and saves it at shutdown.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill@.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-rfkill.service.html
 
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
@@ -503,7 +503,7 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	  systemd-sysusers creates system users and groups, based on
 	  the file format and location specified in sysusers.d(5).
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
 
 config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	bool "enable timedate daemon"
@@ -513,7 +513,7 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	  mechanism to change the system clock and timezone, as well
 	  as to enable/disable NTP time synchronization.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable timesync daemon"
@@ -526,7 +526,7 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	  This simple NTP solution is an alternative to sntp/ntpd from
 	  the ntp package.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
 config BR2_PACKAGE_SYSTEMD_USERDB
 	bool "enable userdb daemon"
@@ -567,6 +567,6 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	  systemd-vconsole-setup is an early boot service that
 	  configures the virtual console font and console keymap.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
 endif
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
