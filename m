Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C74C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 10:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB83F81E47;
	Tue,  6 Dec 2022 10:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB83F81E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgzuBJBIF_hV; Tue,  6 Dec 2022 10:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8EB981E3E;
	Tue,  6 Dec 2022 10:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8EB981E3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3713C1BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 10:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ED92408EB
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 10:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ED92408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKmPlUG4AzoK for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 10:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11D90408E6
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11D90408E6
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 10:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmOvLD0WDEKLWyl9lkA8vBrjx/1GBy/bC2u4j6ZSDhddjJh1D9qxk+vKactxVtlv1xtuMDo6jRpu0QbQtOtABIFjHzmToVVbliG1ogriYhBLlnBLSvHkoQirUk6LkWKQ4kDq3jZyYHt6x1Vc2v8eOSxzXlkYKiPYVBLr+SfXTwJp0xIPLpOEt/1NUrxQtKt+9H6zNjoPVyKjlkwYuQc/TEHJEpder29vZ1gRZ0HEyTzHriRFiVjaIbNkw0a7aHTaYJ7HaWVvkeF4Lx3SloiTNy4BbrDNXfvqH/2iisZfCXp/s6/dV43AGtIZI78EJ4X+9PuRjg5BIe9STR28tqoBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+W8hrFto8rrb2shGe5xdu6Q8WC75Z6A03DP+yJ0rI0=;
 b=ZsJyvE1SmQtrV4pcH+5i2dpmZLcMMKFZf0KmDwVoTmev0xEbS9hau7GqaR064JOYJ7JN7MVqFiBWCP3edbIC51vC4cCdI71b4OQPJTnXppLyPBXzVcT09q6xW9y251FlkM0cQ1Ufzrk4xuEeqrobMYxwDupe+3XJifE6I/ghPg2xLp9c410ss+/E0v8CN7ROblL/YJJsk7rqbxoE+32tpA2nHCLfas3943NnKoZrvTrJt6OTs/NF3T9WLvo4rHmJaA4tQI4vbjKqojbQ792BgnxgRYu5WY35DGeZ9SotXApxYCF8r+2wgoIHJUnFbZmUXbTTepFtTbyxUtru/hWrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by AS8PR08MB9479.eurprd08.prod.outlook.com (2603:10a6:20b:5ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 10:41:54 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9%9]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 10:41:54 +0000
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 11:41:23 +0100
Message-Id: <1670323283-5697-2-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1670323283-5697-1-git-send-email-luca.pesce@vimar.com>
References: <1670323283-5697-1-git-send-email-luca.pesce@vimar.com>
X-ClientProxiedBy: MR1P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::8) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|AS8PR08MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a423ffb-48c0-43c0-5a7a-08dad7767d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oMmh2vzmqc64uJ7GL1eexnN6Up5greD6jBL/C+orgco5b4jgtTljeJvQ5kP1y9K2kMg6MI+B7JzFC35tENiM1fi7C2g1YIzFMAxwbYtR+ltb9WAiAkNFoiG6gLL/OyJRtq/mmBGNCLJbzbnyM0sFvV0PiU5tIkhlQFazxTwGken46wsdcHRh3dERuyk3l1unylOqvdiBk8yD8h4sJL/37LepwqSWfTsc2dHHL3AH+fQC9l6bubUBMwguNW+gxU/C5FHICzeZzVylXBCCFtCcZck37kZOwLJrHp2oE1RZ6v4sztArI0lS+DtTYPlu8VrPwLRzR97Z1bd1LUT6YscYV1o8WMkUMu5duvA7/M2ytQtLnNi5gVwTK02+uQNADEMy7wObzfwI6AbrpY92v639CL4m1u6LL+utwz+sVJux40Foks/sPAFLuk4EOoVssDU5e+Pev6Agfj/NNuXlf4HaxL0pyVe2m56jhyB/l6fc5qaJzw46JJtUVFvEpOo+8rKZqhHkNHyu+WJSBlkPChmXwzW5gNEzWF6Y/Gzusf5qbTIL3+tARGLOEJvhWtncpQ0pH2bSaI63Dv/DMUPtcIiN1W38289kUMhMy7bE7OkedTslc8XzR0Il/exeQFT+sBcRZEwo8jfVXxRjGNGHL1NYeaKmDNxNZ+z1lyOZ7OrKuXf+QDnm3b0URCK3w/5QpOdlaY1IJpZEh2FgpsuxMmU7vYvE4L5CPIO2RbCsRgYQnznf4nU+iEJitpqrzdVSDK1W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(451199015)(41300700001)(6666004)(26005)(6506007)(107886003)(6512007)(52116002)(5660300002)(54906003)(316002)(6916009)(86362001)(66476007)(44832011)(8676002)(4326008)(8936002)(66556008)(2906002)(66946007)(36756003)(6486002)(83380400001)(478600001)(38100700002)(38350700002)(186003)(2616005)(21314003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKjVgEdqC3Xw/ZCh0FOLflAMZwjjVg0I+QkaG+YEX9GRLSYUL8Sr9dbVMN+s?=
 =?us-ascii?Q?ppKtACRRM053TCC5Pz2bY0tY0EA1qPUDf2S5PJpi80qHwnfuMlMklxn8wtDT?=
 =?us-ascii?Q?ayVOxqbxd8fgWCBBerAaiV4hVBgcGImkbyN2kisNfYaZrSCZ865QxMnyJczT?=
 =?us-ascii?Q?q7NyCab/cVHMo+dehb6UMJc5ghMUQpUa0QCPEcj2IFYgOxFmyxIYrxRaq8LA?=
 =?us-ascii?Q?IGR7kt8pXMQHMThNdnoYMRCTnOaXKdOwZ8I4jR6h8vzqyABHIQ/c5U3Q3xU6?=
 =?us-ascii?Q?t/91HA8kHI004/Dfz5Ke+TCo7TjWEKDdNjzJuQBVthLXNWGSkod57YGyogrt?=
 =?us-ascii?Q?nYnX/iTMDMgX59lAtU+UyCBvyNnbmcgu9totv1nWPct475X3hcjPJhwV0t2H?=
 =?us-ascii?Q?g8MN5ekrFEwXxEGunfxr4Tf9C5NA3KTGZrhYB1eA6jCcxVEl9qU4bE0c6xJF?=
 =?us-ascii?Q?NT71V+djRa9Bilc2mhI172aVCqcSPEJtqA5OPT92S+oaM8AF13tiEufpkomm?=
 =?us-ascii?Q?CCLjVharKAPqJoeqoaUbl0HWz6fPgwONulpEphcJodTyOdkAjVdwju6fqzc+?=
 =?us-ascii?Q?gQeT1w3fFshRLqRRRh3EybZX/93UIuOAcTDSsDywRBGtc2iqtaYy+2Xfed6i?=
 =?us-ascii?Q?nrXXE4lAXfLs8TNIKYzQYoZqfisnRge+9md27T/z4d130uPj3KKDd5VgqYZ/?=
 =?us-ascii?Q?x6yjugkt6HFn0se0F6DIkmr8Yr33EI8BsU1JVymctmQvaJgkyE6j71qN915t?=
 =?us-ascii?Q?MUye2ySUllralV1ltLjikGPUBjoHWaCZKJWQMOO/NL9kDLYVhanP9aH6eSqj?=
 =?us-ascii?Q?6g1ro2qj8OhuJoGfZ2ecPzowUpvqRmfinL+A6KKGBYNAo/w2EQoCd1spaCNC?=
 =?us-ascii?Q?bxzB/4qMwELqWwW3MpwrOjcYAffWc1v4gzITy+3HAzYY55dGCv53tLLAdmYP?=
 =?us-ascii?Q?lICGneQtYnuEEye/wZEZ51xO2dzP1E+8MM/FiqsaoMZpbA8Yr4nxnDoxWAyN?=
 =?us-ascii?Q?7qzrNnfjnJt4h2rptJyLHgxrsTSeYphELxexUg2SPNKnug8N4d/+keGAVbxi?=
 =?us-ascii?Q?C1D0USMyVKFcX8iX9p2hvUkNxSVSvGM65A9SWpeqQgvPGB8ek8uy+A+37AnD?=
 =?us-ascii?Q?5mIn9X6CAYGSLqkmh1os3BXPyR/iOxtd4XxNP3P1AnVwH6E1a5nL2A7eXz5o?=
 =?us-ascii?Q?LtJJpuYdMHmD3nB92fIaXDjrrivoUiiglnz7HYyUnKNDoVIXiFMZHSIW4pM2?=
 =?us-ascii?Q?biw6DFzEwdSLAx3A5RlLzJkbTFikHbajy7Wp6lGpKO/XhX2qYVUdTn85Ol4W?=
 =?us-ascii?Q?72qcQSJ6zRFPPsgWArB1ZQnVG6QJLIqlU4QM6o5f1za+0KdVM4V6A6D6WubB?=
 =?us-ascii?Q?unljpx9WTBh+6IoLXO2C/C6lV1Bl74YVA9KlNzjNIGiyXvgGVUWD8q+PFmc/?=
 =?us-ascii?Q?2jwRhH0OMFiBhGYE6J3MI42eHi2fb9wbfir5BR6FlYTb5cT7FbqxrqIcjzxl?=
 =?us-ascii?Q?A5YArDM6nBWIeDaIW1k8zAmDHcviABR5Fj7q8TcUcHNvCDplAdMV5bqPVKyQ?=
 =?us-ascii?Q?vpZdys3KfXe88XbLhpwGa85xIWgnMd3xLo10KulD?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a423ffb-48c0-43c0-5a7a-08dad7767d90
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 10:41:54.0165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6DdxnWcHOu8lE9oRwja1RUqcoaPRhtSoPQJKxQbhFinSjJO4StkTRejkvJ77S9oGkM7Z282mmxtYIgU7o9n3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9479
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+W8hrFto8rrb2shGe5xdu6Q8WC75Z6A03DP+yJ0rI0=;
 b=qUoF7780PANH3fdyxZQPjaZvV0VY5zVY/cD+yXBMb4LwNZiETiFmq2thTPZH7CWtjSKO8V4dpoyLLmXcfwYPSIIIdFM/hLXKJqVMqm1krwD/xB4F2JCP4UUJuetmab/SrzFzm81G5WAW/gM0VtPY0oHgBswtR26omQSvGFYWDFA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=qUoF7780
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH 1/1] package/pkg-download: restore user's
 original umask for the whole download process
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
From: Luca Pesce via buildroot <buildroot@buildroot.org>
Reply-To: Luca Pesce <luca.pesce@vimar.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Root makefile imposes 'umask 0022', and this may be more restrictive than the
user's original umask - which could have provisions set to share files/dirs
with other users.
As an example, the imposed value makes the per-package download directories not
writeable for the group, but just for the owner - the user that issued the first
build that populated the per-package dl dir for the first time (say user A).
Thus, if a BR package changes its version (e.g. for buildroot update), and
another user (say user B, in the same group of A) starts a build, BR fails the
creation of package-xxx.tar.gz inside the dl dir, because user B has no write
permissions on that path. Furthermore, in the case of the git backend, this
makes the git cache not updatable by a different user. This is disruptive for a
host used by many users, all belonging to a certain group.

So, to allow sharing of a rw BR2_DL_DIR location among users, we save the
original umask value (but only if it is more permissive than our REQ_UMASK,
which is our minimum working requirement) and restore it during the download
process.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 Makefile                | 17 ++++++++++++++++-
 package/pkg-download.mk |  6 ++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 88f90cd..ec45589 100644
--- a/Makefile
+++ b/Makefile
@@ -68,21 +68,31 @@ endif
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022
+CURR_UMASK = $(shell umask)
 
 # Make sure O= is passed (with its absolute canonical path) everywhere the
 # toplevel makefile is called back.
 EXTRAMAKEARGS := O=$(CANONICAL_O)
 
 # Check Buildroot execution pre-requisites here.
-ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
+ifneq ($(CURR_UMASK):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
 .PHONY: _all $(MAKECMDGOALS)
 
+# Save the user's original umask (but only if it is more permissive than or
+# equal to REQ_UMASK, which is our minimum working requirement)
+ifeq ($(shell printf "%04o" "$$(( $(CURR_UMASK) | $(REQ_UMASK) ))"),$(REQ_UMASK))
+BR2_ORIG_UMASK := $(CURR_UMASK)
+else
+BR2_ORIG_UMASK := $(REQ_UMASK)
+endif
+
 $(MAKECMDGOALS): _all
 	@:
 
 _all:
 	@umask $(REQ_UMASK) && \
 		$(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
+			BR2_ORIG_UMASK=$(BR2_ORIG_UMASK) \
 			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
 
 else # umask / $(CURDIR) / $(O)
@@ -91,6 +101,11 @@ else # umask / $(CURDIR) / $(O)
 all:
 .PHONY: all
 
+# Export the user's original umask: we may need it later to honour user's file
+# creation permissions when creating non-target files/dirs (e.g. during the
+# execution of dl-wrapper script)
+export BR2_ORIG_UMASK := $(or $(BR2_ORIG_UMASK),$(CURR_UMASK))
+
 # Set and export the version string
 export BR2_VERSION := 2023.02-git
 # Actual time the release is cut (for reproducible builds)
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0718f21..eb2a242 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -107,9 +107,11 @@ endif
 #
 ################################################################################
 
+# Restore the user's original umask during the whole download, in case he has
+# provisions set to share the download directory with his group (or others).
 define DOWNLOAD
-	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	$(Q)umask $(BR2_ORIG_UMASK); mkdir -p $($(2)_DL_DIR)
+	$(Q)umask $(BR2_ORIG_UMASK); $(EXTRA_ENV) $($(2)_DL_ENV) \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
