Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88C2C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81FD9417C5;
	Sun,  7 May 2023 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81FD9417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RN2mAfjU6hp; Sun,  7 May 2023 21:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940E741793;
	Sun,  7 May 2023 21:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940E741793
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F147C1BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 971E1821AB
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 971E1821AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4s5jjXuenaLt for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39D7D821CD
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn20815.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::815])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39D7D821CD
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2RtuIGOFinEB3IdD0TJMkWmbQsmKoGWEndUrZLrj832iJTVyogg3zfQpKNC18YBC0FUBilz8Zkaf2VKW88uAphwa3RvvysM9pN/55cm3rAAuX5AQUF8wBOJwMIMRl9S7xhMzSuV06iUa+8OwOCAuc1rbz6G6apzoPb4fcVyxODdh2vhcm8ACZ0OOhqMint6t9Ylb0dEh7jnaQWalFTCIUNJcBAB+mG8rKQH1NRxzZFzKpjH4Nncr4oZO2HwDhqTXqu9+slUU/PM8mhm+L42EfXUTue+DXHeazJUMO5MNsecXSySnyq6wIf+NCIJLDxAnceHtjVwOl4FgrpCtjtPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxp/4rU/PzWL1XIzc3tANtzY0wHkFx4RWv/l9giQfCw=;
 b=TiRWKjELOaRzLOuHwOAxnn5PJrQ6dpnQRQrE8vg4DHQt7phkbSnTKgK+HjZ9Xx9T4PXntJCnFD+HW+Rpb+Jnln4UXlfg7NUotsONURb0c+YQeuSzyN8PeTp3a3qryliTffMbXioHjS5YnL6yDyb0YwdxQ4zNNoI+4274pUseZ7i1dmXZR6ZihDpPdPyPZgvXoWlEz3zebDdBjoOkQxICnsi/C5jU4YrCKcDsB/AEpgE7cZF92kUPSjE6Jm4t8NMlZuMWLdWpFU52i5dynS/69SaR8GJa6AIq+SyL+JNlwJixYhZh7bXKf1J4mR6nhko1itpdU8N+uE4j/RgKdYr9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH0P221MB0831.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Sun, 7 May
 2023 21:35:08 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.029; Sun, 7 May 2023
 21:35:08 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 17:34:31 -0400
Message-ID: <SN4P221MB0682AD37886082711DF0E5EAA0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230507213433.4128-1-james.d.knight@live.com>
References: <20230507213433.4128-1-james.d.knight@live.com>
X-TMN: [1faEHl4A73Xle8lCqVppg2yf+GzRz6Kn]
X-ClientProxiedBy: YQBPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::20) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230507213433.4128-3-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH0P221MB0831:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff360b6-d300-4a95-5b7a-08db4f42eddf
X-MS-Exchange-SLBlob-MailProps: 5R4zPSLKzf5YQsomgLysuuHLxjA2uN+4nxg189LpE2SyxXLvH36jf1bWIywCqBoSNAQbqunAfOngaZV2QGmkLRkbc27gPFqxzk2CPCgn/2Mpb2ZisDmAfUjmOC1UO+KhgaSHIth4JLFsFN3UqcAKdtNklajrlOaH64HSswIyshgKOXUmDAe8mlWCxH9F6qIRSO3BFT5k8T5dcg8q5jDqt7yK+cI7aKFcA/RwIJC9KqL0gFiMbseTj13diQGW78eU/HVkSz9UcIOCW49mwvPx6qGZdIDOpcB1qc1ooX4OZFXEGmjVzVdBWCpi3SweA1qj4AVHKMDhSXSVlQR5r0lbYukbED+F0pyfMXhJYzRdxjyHOYEfYOGGAFevRcpYNDBqt41jHK0Lbu8FYS4PgFuFB+Tq3+fvf8rIG3z9k7WICAMQqW+BR3vYoM1C5ZLjgovlq9ehfU7NE90EdPkvJxABiQSk/kZJmJswQgGkKPNRqZUGlJz+wpbMC49ve1tt3HBGNoXMrfUfyTk4lknzL6kzJUwEblbmeYh1EC+tUcGgSCc8OYgvWSPhU7VM+fxiI9Ai8KxGyPLAVeYipy9s9l3NwCS+HC3hkcJZ5WvhFloY/wAjRPM20zX0QTjNqhlNKJGFtBIHT9RXDQbt/uKxryQuvbLcKbR1iN1u2uO9eK/LkJ7S2f3zudDuYVPLok5E1WktCEp33hGnaylEZiB+SooEqCtVIbgDkAqMVzHyNDRjKibo045xB0/coOh2YbFRn38VhGxVKKOBDNsx2SDqqUCkuNyAzDKEvjLNNVnDVZJL1xrD1mU9BrVZlur4bHQg5Xc9eN0inOd1UJEiMi2D4RUbEd6vFu0RPR9k
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtoNEZFXKRRYiAcEl34SmtD8yIcQ10AYYtfbT2zbVlOOlCybIyqzLswQ8TgiZxLTN0hVkyvr90198TnU36YtJPhBOuELqYBkuNFWqw6/mM4UH6GjKBFr/c8d9WgdKtO8xWBVXSmNaGAit6Ild2M1Qq+wpwu1XtmEQkRf0Zl0zbo91+DSXy7E+MtfvdOz9k3AjLXguxiZogr1Wyt0Js4Y2MI/Nk9hIjluk2ZRNHYpaPmYacCZz6tZacfJCrmz5s87aBowkGzskd5ED5Y9YJ3UO79iEjI2Qy2ttNkBJu9GJV/m0Xai8B+ElJNY1+ezZm31+nHkZniZS2h9d8GXW9xAwJP/4wRRczEcJ0FNzlLX4TfCmodF+u4vAFwiHdy4o1XhfU5lN4o8+88TQ6kb3e9GvtnyH4ZNm4VmmsrU/JPs1gM+dM/qVoVWbKNRYVs6jj2PvjDZJY+0qZYJmCpi04oYKg6j8NBzc/kYR+X8IHOVdT9tOtWkZGRW91qhkbjeN4MqNPq/akbqUuFgQNdY7EUi9IH4seDSllBiZ6Kql9GUcU4HibQJRRcKD/T9Ur20QIx3SK7LShVdtROnEMgP/P7ujXeAiXTr5pwhK/7nrFCjeoM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Wo/mkOUTtwR1DDleQGbqOBzXBG2VFBqMgRDshSedQA3xoG5eQR3gW1maYbI?=
 =?us-ascii?Q?EELO9R8Krf0/PkYvgujVzXiFK50bGCSKW0f+1DZBd5ZCJfw/agLa3c2RgsyN?=
 =?us-ascii?Q?FJmjKG2RFeQydP3qA5Oal4YAoC5Xvx8FWrBZknn3eCryVTMHOCuh6piGi9MC?=
 =?us-ascii?Q?715Ce6HSLs6UHfBd/KUH6ClaIRg/ycXFSgxxsKu+fLsb9gtc9w0B+Va73pDf?=
 =?us-ascii?Q?Gfhu880X86eFrS4TIlPqIuoR0+Y215c0uVgFnGlJIwPHlCdpyj9ZXuujctjm?=
 =?us-ascii?Q?q6bqI8YGvKKe2MsmLcmhyvTjxiu53ImNruinojvwoLzSahdc1o5TkkgDDm45?=
 =?us-ascii?Q?UK0+xkpArBZXEVIAFWqR0MbP6ksSJDkYj8aMlqMvQpM2JXwX/5+RssON4yVj?=
 =?us-ascii?Q?e8HCyVfkQqw6HlPyXD7H6OthKSHMmWnvjW+efajG9+krcGTkS5eT7/sstslh?=
 =?us-ascii?Q?bAWn+RW2xp0k/bndfwmTSz0aB/qZquqZdA1cGewG3chquQUoZzcz6rzOE8Sl?=
 =?us-ascii?Q?1fRu3Tp/GXOapme8WOZB3NtwYDhgrIFqWXqQuHg0y6ct0SvgB8gvZh78e0xq?=
 =?us-ascii?Q?VX3rk3uM5RcBuAErSDQj3E/dvVaGd1DubYRtYNj3MEVXWeH0XjJiJ0Zu757M?=
 =?us-ascii?Q?vL8LC4SzUQkJWyc1Xl/smaa64Fq0dvz4XuxrsaQXV8lu5JJW40AkxTE+Hl1X?=
 =?us-ascii?Q?QpQ7mpw+PQOdRfvhe45xjgZxxFYYfCpukqRU1VohcrBlEo8VlYzzuNUmOBKR?=
 =?us-ascii?Q?W0yPu403iwPax0X6U0+iGkXphcwRRd8DfjyI25IzaRB+F70/Tzc+VKcxBuBx?=
 =?us-ascii?Q?g+5Cxr/AFe+zEZjPYUsQ1riG37j6iAgPbSseOUzjKwat+oMbRFllE4d6XwT1?=
 =?us-ascii?Q?quTAefKWC0znTXkSIfLI6WyF8FS2ntmSCK7HQzThyZZivChmo3LmgJ8k0zi6?=
 =?us-ascii?Q?P6LTm8fjiJ/s3R/qCzQF3Vmo90Wah2SvfHhLwbzWH8Ezl8fZ1YPelqv9oTzK?=
 =?us-ascii?Q?hz2omQ8hv68Ibju10D9+vUIHmbWTJ6Qus3vEIBNH7cQSbLPNFw3Bm65jZs/v?=
 =?us-ascii?Q?PBV38Avs8/asrUnmm0K01FpjyP7s3rt9gBW007jOnmPkKplotQEiG7KVcpAE?=
 =?us-ascii?Q?ZXRJG+T1fEVSi2RvnKHQoCQ66tysSYKoWAILLKd7adz6u/xjQTSSBB1lIWqD?=
 =?us-ascii?Q?OAUNkZaTX2crxCCwFHwRAjDXN7zIRFhf2rXPY76NED3pOgejOr6en7MPdOg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff360b6-d300-4a95-5b7a-08db4f42eddf
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 21:35:08.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxp/4rU/PzWL1XIzc3tANtzY0wHkFx4RWv/l9giQfCw=;
 b=m8L2pSoBwzm5eoGW9h2loPllu88YmNZz6wdmwdIWeVRBxLPwPLxMimBznGaKhCJAAKLl305Q8uEQUJdKzwgjk78l7Cq0CKzB2R0hsyp0zgjZwdMJh3VNGALlLPO7Hkgye1USerR6XCbZiozD1TbItpEQJhMjMWNcMad+AprubDry0YenubwTCTT/B2GFtvDkf7N8p70YOyUMUl8XOYpK9q/GTjjFONyVjDXyKmexDVrFetJJHTcvkrFD0gpOvd+HrY9mbV/cpfW1KET5nFExF8kvv9qIvMb2J/6C3YYMTng656BMXnVjWSFPIaA89CdUZq+Ko1L4CmJrdWRykJ+Qtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=m8L2pSoB
Subject: [Buildroot] [PATCH v2 3/5] package/rpm: bump to version 4.18.1
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

The most recent release of RPM is v4.18.1 [1].

Adding an upstream patch to prevent build failures for certain
toolchains (0001-fix-var-declare-in-label-error.patch). Fix should be
available next release.

[1]: https://rpm.org/wiki/Releases/4.18.1

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - New patch in v2, with changes from the original first patch.
---
 .../0001-fix-var-declare-in-label-error.patch | 40 +++++++++++++++++++
 package/rpm/rpm.hash                          |  4 +-
 package/rpm/rpm.mk                            |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 package/rpm/0001-fix-var-declare-in-label-error.patch

diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch b/package/rpm/0001-fix-var-declare-in-label-error.patch
new file mode 100644
index 0000000000000000000000000000000000000000..648040c66307d1f896680e79c3fd96fe180c9fa2
--- /dev/null
+++ b/package/rpm/0001-fix-var-declare-in-label-error.patch
@@ -0,0 +1,40 @@
+From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
+From: Florian Festi <ffesti@redhat.com>
+Date: Thu, 16 Mar 2023 19:05:04 +0100
+Subject: [PATCH] Fix compiler error on clang
+
+Turns out variable declarations are not allowed after a label, even in
+C99. And while some compilers don't seem to care others do.
+
+Moving the declaration of mayopen to the start of the function to avoid
+this problem.
+
+Resolves: #2435
+
+Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
+Signed-off-by: James Knight <james.d.knight@live.com>
+---
+ lib/fsm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 5671ac642d..183293edb0 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
+     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
+     int firstlinkfile = -1;
++    int mayopen = 0;
+     char *tid = NULL;
+     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
+     struct filedata_s *firstlink = NULL;
+@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 
+ setmeta:
+ 	    /* Special files require path-based ops */
+-	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
++	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
+ 	    if (!rc && fd == -1 && mayopen) {
+ 		int flags = O_RDONLY;
+ 		/* Only follow safe symlinks, and never on temporary files */
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index dfe50303f7db47e34a42d6d0f17bf2c097455e1c..fd03f062bc7da37519e4bc95da37c70a17ba7d82 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.18.0.html
-sha256  2a17152d7187ab30edf2c2fb586463bdf6388de7b5837480955659e5e9054554  rpm-4.18.0.tar.bz2
+# From https://rpm.org/wiki/Releases/4.18.1.html
+sha256  37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  rpm-4.18.1.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 38e4ea2160c9e4e2b9bd05a038bca8ff35d1e296..2b289fcc9f8d6972bece4492736277ec5efa209f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPM_VERSION_MAJOR = 4.18
-RPM_VERSION = $(RPM_VERSION_MAJOR).0
+RPM_VERSION = $(RPM_VERSION_MAJOR).1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
