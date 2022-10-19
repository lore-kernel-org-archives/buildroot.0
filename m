Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE9C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 14:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E3F84057;
	Wed, 19 Oct 2022 14:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E3F84057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDhoAuA8RwKs; Wed, 19 Oct 2022 14:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AB1284051;
	Wed, 19 Oct 2022 14:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AB1284051
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A52561BF403
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 14:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 681AE40CD7
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 14:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681AE40CD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BktacSj_DhXd for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 14:33:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA3040C99
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA3040C99
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jib13tPBBfEb0/9geur83GMa5+apUeIO5lFn67xdX6no2HR3knb3QTiuieZvYJnOQhRAY4JlTwvL3vZVY/DJhTz/w+XJtwUQBq1F31IfHg0XcwuOj1lYdN7tApzSF0SHabWtSd11qwwIVkgGgTD4w/GWPiE2MOuiWZo0tbwieFwoTDl+o0TjSyquACcxaystFKpjtGJTFjsZlUhKZLZQSOkF0ziyQZjNU8Rh9jYBneKyc8RDW7IWJkoZOtNaX3ACILmvMDp7YzypbDBIE0qv9zhGYG94CtIueVKhODyOZTCx+EubNi02pEtStiXRxHl1SL4Mu/43VZjgJlCtYNAuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEiiG3RwgqFrxvQ7kG1r5twnYPPfCqQLyNLWo/vEjVM=;
 b=nr+6XDJxMqAWloLeLuWsvZVzvEwVgY2Q78Ae1a4PFTkxlbsdpX+9hBcZuJTikQn4Fe2Fru1wiGiPd/1BaGJ2ZMW/QW6FixS6TBGuvdwPVPUTbVRXEqGlNsZf6lZ04gO0qwD2zC9BjtYXhpQ4gT9hRfaVnwqnNIgr7efywRS0/46qDNLFMs2za+oiEGLo6F7NTyKRTPg5winYc4EQyvty5rYLWGTmUNJVUGjDHajaWs+9Pf8M0PoGe5Et2KNUm2qMh1F3ZQZsK0dMZqSdlpEoaeCWmxVSSa2bFuKd3CuUsKnj/RhBSmRMsnBTx7w3OTMxeLgbQV7YHTsbH5qpTrfYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com (2603:10a6:3:97::9)
 by DBAPR06MB6951.eurprd06.prod.outlook.com (2603:10a6:10:1a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 14:32:58 +0000
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9]) by HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9%10]) with mapi id 15.20.5723.034; Wed, 19 Oct
 2022 14:32:57 +0000
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 17:32:19 +0300
Message-Id: <20221019143219.329504-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: GV3P280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::29) To HE1PR0601MB2361.eurprd06.prod.outlook.com
 (2603:10a6:3:97::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2361:EE_|DBAPR06MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: f846073e-8276-4fa1-b83c-08dab1ded118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCOO+wreMXEbSbuQgoc5AzPJhwvhAnaU+dY2wznV64+/Cup+O4VUaQ1fD7ovzNq/uINKYc0gZqxo/LB06qkJ2WeUw8QhnkgtWE6R+bjx4ZQ5wQkdeHuYbgPCcMdt80sahGJBt3sGryEJtCE9TQYeFKpqU50905OzjL6AAViTl1WPQ6/ccUEFQzzDe9JHyRc7prs5Oea19lwcUBjxTkBWnTVksligtNBLM5Ion3wCAHt/jkApnV4f89TyO2lPz/4UF8Kqd9KhKySuSD9xEw+u7x+FrQRYUSecmolpvQBelhhFAFamEff63pY8OKMsJoGM6vcZQDK7zWf03B8uK568M1PSCKM8ZUJMluwHxaWRZtnRnfMvVI4jj2KjWfXoprVZEXYtDW7TDhIgEUVUxmlX8Gixd2t7+6HwmUWsCL/lcmwEvi163lGazE00SZZ6tlrgnI0Cr/2ihhqrkdIVYufoqZrSbPgwj2qJJzl8CaoFG9RcKc76gwQV0DP74LQA9fsRothuFtyF3j5ZeQxrpqPq9gSO4lRNnu8jRxEN1/HqYPcIX0aHnzktdEtBHWpmI7ojr45wFboWuiZ3gOTw9fQmGvUsAVo1bEOyqIh4H/sFMByjwaLWVasrK2I2p1cWlpdMPk1LGuo95PeinWTN6qGhPRxTX/OHpIcPZ6TCOm4yuuRL4bYugl7BprrbYfXTCU0E51vD1ozcJs9oFw/OKyjmatZpWGrz6vh9/fPAcBQr8gTBax49tgdIid0x6Z/+pYizF1ue3iGXEueNbxc+OQR0+1RTFkzLbz2KEFDm22hDyGeVw76vl7H0R76ce6h8znfIVpAtbkGEMZq0HygV+7AhmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0601MB2361.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(451199015)(44832011)(2906002)(66946007)(41300700001)(66556008)(36756003)(66476007)(4326008)(8676002)(8936002)(5660300002)(26005)(6512007)(6506007)(1076003)(186003)(2616005)(6916009)(966005)(6486002)(316002)(86362001)(38350700002)(38100700002)(478600001)(52116002)(6666004)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b8UAbIqt+Yt3E29XeRRSfJhuGaNVe13iq9VbX3Klvr6ZvjFighYFvFwPwawi?=
 =?us-ascii?Q?JtsKxzkvAgRvUI4+gwsWzCguhJ3iclvKy7GN6BI8a8htohdFkEN/c4IMR/7Z?=
 =?us-ascii?Q?Y+unf/sKaXl5pxNvaBrA3+4K2KGJRaT/5FBYtr0/pAV5y4CbcLtLyH5Zx7uo?=
 =?us-ascii?Q?seotH/csJrKHAlXFrbbyMIAhztNxPap4Wfzn/Cg4PFgRvU+D6JlQCgBqz7pr?=
 =?us-ascii?Q?0ZUe2qTbXHrKYOq0oRKDGmvYZTxzvUjFjZC/gL917h46R1gaZN61jXxjK4aR?=
 =?us-ascii?Q?TyFyJxrHsAqW20KI7lUcAM8vr21QEkXuQ2HvxZWFvUQFHslANNQUcHb11sQT?=
 =?us-ascii?Q?hCFrlUb3a1/zxF3Rbxytpjfe6k42sXclTH0yGe1aluSXsp+JQRq1yM3ipX22?=
 =?us-ascii?Q?1VQiMqGivLU0MCIqPdS7nJdsOKQZbs18pZ+BmmbD/wx7yWoZYnXn0rlAyRqy?=
 =?us-ascii?Q?2kIJkNh63jrxW1Qrx/lbbPFxhlKTMwPfjKXWdqwMHcE3bsVhBUcbCRjIDA6a?=
 =?us-ascii?Q?zxwmeDyT33F1B+s/OFk+9DMFEkWeOqrSYrbhLdU7DsCDDVfwHEDdpjQIQs64?=
 =?us-ascii?Q?0qmKLHxXO2f5Hrs42Nk05I5agxo5nflj+IcvJMz4dvZT4r/EvduaILFobc99?=
 =?us-ascii?Q?lw1+HZzBuZo9rz8p8W3xQJajH9jN+MMfdB2YfT0fxv0IaV78mXWJ5hptZm2G?=
 =?us-ascii?Q?Ts4Xw2nfvgfN4mCIcGs8n1zreEPzMD9sOYQ6ZcNhzzVZ1bmjHn+TtHh51KO+?=
 =?us-ascii?Q?WJCVuPzXvbj9g2u+skKaUv1AoQyHuFgtntt8HWiHZPyc623e8wsJQLzgrfJL?=
 =?us-ascii?Q?3yPqwzaro9DktQp9O6OY/vlwF/jg/Z9zkHYlalyah9vLV4w5t40OjjZlZ3+N?=
 =?us-ascii?Q?Hm5yEWn7yIG0TFXpJ0sYwJ7iBDDbnB0cAq1BKNrGJjUqYDj+nj8RFaA0QHpf?=
 =?us-ascii?Q?ZlitkLJTCjgmdW5dG3AkyatPkPwzO+p7+/Hg6AaMWf/mID4cRTICM0vlFocB?=
 =?us-ascii?Q?ZG9co0izxRM04IIc3BkMx00BtVycxmbV8lXwFeTikHTEetniphpHdbKzZjfB?=
 =?us-ascii?Q?yqKSY5y/8TxaxVI6BpULlPtIBYxmWItpFi1d2RR0+UBLG0hAlqgpjmogdnq9?=
 =?us-ascii?Q?YqVBI26Kb838Zk2HzuQDi0UjvtMdrUBYLu+pIDktHxafRJ2RLYXmmWJAFD07?=
 =?us-ascii?Q?Sdlf2cqaL3DQLTFx7dNMrypp88iz8Egrhphc5d6VH+x4zh5gfQKhhr1pqcRV?=
 =?us-ascii?Q?mmpPdGvmmK4K6sCuFB1KOH+mKJdCg3XQtoacNjr24O74UvRuFlrKswA/ofzf?=
 =?us-ascii?Q?WMzv5s+jna9IDD+YTK2nMr7gT7epZwNgUl4ktyu5+ypkTtSgetxhAT23KqYT?=
 =?us-ascii?Q?sx6n+/Jv6RfUWDrG9chEjUzp3OJu79xGI57jk1sqcb7EKERQFaOKmGYzPeE4?=
 =?us-ascii?Q?ZbMaJhrr1LAuzDVMKX15jw42QggFx+I0S7oJcFFOtifWX6afjBFTfL65eHNz?=
 =?us-ascii?Q?3O19kzCDCnB4VvMR0Kxt9lV3gGx+q5+UU9ImkCvlt3df5fxXTRVgcmyZpJB1?=
 =?us-ascii?Q?XEWNNY0JR/MCd2zbJZMiK8QSeYkwV/3AOfVC7kpiCzJD4dsMHglg0NthuKeB?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f846073e-8276-4fa1-b83c-08dab1ded118
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0601MB2361.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 14:32:57.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgfdxiex1oTUo6IALmXkb4lfPXduXUJ6yTwb6YFtvQG4pdiGx5cKHddQHsXGIyAX5F+nF8eHJoqqmuc2tPU1DQXZyb4s+0Jzk8r5xbZa/ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6951
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vaisala.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEiiG3RwgqFrxvQ7kG1r5twnYPPfCqQLyNLWo/vEjVM=;
 b=gmQv2LKTOjaP7L6WcezO1AqUeL9IfZQ/thl1gYC4n0gaT5aYGpAF1sEjr8aL9WFdmxo7zqBboAHVwOLXPaIyOlfgSh4Aq/DExsaePXXWWRiNSVfgy/4hs3C0W/xqLOG127sFZs8yO7KeST+TcpoUPMr/OqjDItIU0UsWbZPjSA9VN3E9yKjpjFAgH5m/A4dKDQufQ04OFfCOfr3jpauxK1JOujHbT2vpIDae2vrMN9RpOeHRvfZUNVnbdZWZFKcdWKeWZBEWSkgXYInWqQlpf41xR38WU3XqVpzYO5equePLbAVnO4up+G4bW+C+F34rdI8kERQA7b6ej3JT8T8G0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256
 header.s=selector1 header.b=gmQv2LKT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Subject: [Buildroot] [PATCH 1/1] package/docopt.cpp: new package
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
From: Eero Aaltonen via buildroot <buildroot@buildroot.org>
Reply-To: Eero Aaltonen <eero.aaltonen@vaisala.com>
Cc: Eero Aaltonen <eero.aaltonen@vaisala.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add docopt.cpp library that can be used to create intuitive command
line interfaces with very little code by describing the valid calls
using the (POSIX.1-2017) command line utility argument syntax.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/docopt.cpp/Config.in       | 15 +++++++++++++++
 package/docopt.cpp/docopt.cpp.hash |  6 ++++++
 package/docopt.cpp/docopt.cpp.mk   | 13 +++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/docopt.cpp/Config.in
 create mode 100644 package/docopt.cpp/docopt.cpp.hash
 create mode 100644 package/docopt.cpp/docopt.cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..8972bab2d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -777,6 +777,9 @@ F:	board/acmesystems/acqua-a5/
 F:	configs/acmesystems_acqua_a5_256mb_defconfig
 F:	configs/acmesystems_acqua_a5_512mb_defconfig
 
+N:	Eero Aaltonen <eero.aaltonen@vaisala.com>
+F:	package/docopt.cpp/
+
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..77f86328ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2113,6 +2113,7 @@ endmenu
 
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
+	source "package/docopt.cpp/Config.in"
 	source "package/enchant/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
diff --git a/package/docopt.cpp/Config.in b/package/docopt.cpp/Config.in
new file mode 100644
index 0000000000..655a656398
--- /dev/null
+++ b/package/docopt.cpp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DOCOPT_CPP
+	bool "docopt.cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	help
+	  docopt is a library that lets you define a command line
+	  interface with the utility argument syntax that has been
+	  used by command line utilities for decades (POSIX.1-2017).
+	  From the description, docopt automatically generates a parser
+	  for the command line arguments.
+
+	  docopt Command-line interface description language
+	  http://docopt.org/
+
+	  docopt C++ port https://github.com/docopt/docopt.cpp
diff --git a/package/docopt.cpp/docopt.cpp.hash b/package/docopt.cpp/docopt.cpp.hash
new file mode 100644
index 0000000000..f8a7f8d97b
--- /dev/null
+++ b/package/docopt.cpp/docopt.cpp.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  28af5a0c482c6d508d22b14d588a3b0bd9ff97135f99c2814a5aa3cbff1d6632  v0.6.3.tar.gz
+
+# Hash for license files:
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-Boost-1.0
+sha256  b2959a980bc25f5d5e020d7a31777b7184aace6eb160acc80619f85edf646f19  LICENSE-MIT
diff --git a/package/docopt.cpp/docopt.cpp.mk b/package/docopt.cpp/docopt.cpp.mk
new file mode 100644
index 0000000000..647071243a
--- /dev/null
+++ b/package/docopt.cpp/docopt.cpp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# docopt.cpp
+#
+################################################################################
+
+DOCOPT_CPP_VERSION = 0.6.3
+DOCOPT_CPP_SOURCE = v$(DOCOPT_CPP_VERSION).tar.gz
+DOCOPT_CPP_SITE = https://github.com/docopt/docopt.cpp/archive/refs/tags
+DOCOPT_CPP_INSTALL_STAGING = YES
+DOCOPT_CPP_LICENSE_FILES = LICENSE-Boost-1.0 LICENSE-MIT
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
