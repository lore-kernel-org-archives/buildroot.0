Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D449C77B73
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 17:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 389C942F08;
	Fri, 26 May 2023 17:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 389C942F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d23XgXeO9yEA; Fri, 26 May 2023 17:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 269B242EFE;
	Fri, 26 May 2023 17:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 269B242EFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 510021BF29A
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B2B4281A
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 17:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B2B4281A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0__uzJgOCzr for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 17:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D29834282A
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::700])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D29834282A
 for <buildroot@buildroot.org>; Fri, 26 May 2023 17:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKm9+LFicO0ZhZtfaNg7nenlvC6B64pCxlEzaLwg9D4uKlMugQdZg7CAxTRqstCB6LC1LfKDET4PYwQrErigGfdasECLA+x4UTBuNL53VK4GeKuRxI5FzzjAshgk1j4OSI2bpQNxNSPqWjmIrKgQLny1CpUtay+P7r09nWohZiTc+iTfwdrdp+gAg1OikZ6vcBZKisyFifXPR9auswqyHwQ2aVhrGofhQD1dSFLP+kJiqQQmbu1y5UvvYhb0lzJ+xtiI0I0FFhlrFdYTss+Tt4hb75imYvAI+pC3SxjCqhdrqvG97skWsm9StyAZcpBe+sffRrRnqTeql/v8nKGEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f3eEW4gIH7vORE3OnGeffMXRjvTcWRHuPcNjvZlPTs=;
 b=VVK89jSdqsIzvidTf8Z674mxd1BsLMOmWP+n72yw/YSXetnRtYU1pfdCpWeNGOilq1B3u567f4nRWOU87ghIbMOYjg4iMWcUHMEqeLs5mzwX7VrqY5A0msPhbNBjJAG2NIaeO863dQJ7q+UfSODc5mkO5bA+hqyRC9JeoKnaUrQcbGWqBY6WMIFqOg2UuSMj1XE6fSbENUEZFNLvBBahdhxr+ud+sm7Q4Hz34i+mK6biYeof0pvzjUDh2U5KbH9PTZd1CK8Fi6wZXphQF+08nMIwaJ1bz+xBvyKYwlRRBR+CD+RmqqaKU5oBsVOuAYzV/clNMR6dHGxcBliggtRnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MN6PR10MB7421.namprd10.prod.outlook.com
 (2603:10b6:208:46e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 17:55:22 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 17:55:22 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 10:55:05 -0700
Message-Id: <20230526175506.1071354-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526175506.1071354-1-colin.foster@in-advantage.com>
References: <20230526175506.1071354-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c92c077-e405-426b-1fa4-08db5e125fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVJGsQgdrHdTcx9NCRMz6ghF0Zpr/pkiePTY7fjWiDBo7qWKQnAqBxre71YEQCwz20Y0vTB7Xotd4qs5YSmNVzc9DIutfitKm54NPWZALHwC/USIAKmDutvlIuK1vTgu2PgMyk0Kdh3uSHh2ARCdPDpOm3FcWsyIMsct+8RcQTabA+7R8hMT135YNReo8uWpgzrp5D75STJsNPTvBziiwGFqXy8kkMPH0PcMsURHm+/Oo52cR235SGWH2LEuYUT5XC3o1rzHyCRgkuI/gXXi+lHSslpcBZfDZAl+0kpfU2jHLe2I1FaiS/pScCQu9cxWjakYgh6vqM3VjifMsvvxSoB/8SdA5tuasFxGXt3IQJ6pEC+LlLS6dsQCMuFy6pZKr0ZwCPYhW/phWfHQs5vNGkJlT4H9CzgALSWYr+uNoVhPlTXcZX9TNtGYHI0HAD5qo3Sd9FJeOrrjd0h2EzTqle0rIgrO72vcFX8I73No36ORWOiMHlvFXG+U5WBN3dOtemuriwNTvAd9WMbK2BvXgHlasH3TySGuZK+PYd0oG+uNX3BT1dv2yaX88Vav9EtlkERxBUY6+tml4jwOiAcPIbyTvbweWe9zBKRJy1BppBzrcZFfTrTlpqvbEr6lN8gDmuRQ8EGrDvE1puWWssv7fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(39830400003)(346002)(366004)(451199021)(186003)(6506007)(2616005)(6512007)(41300700001)(8936002)(44832011)(1076003)(26005)(8676002)(86362001)(4326008)(38100700002)(36756003)(2906002)(52116002)(966005)(66476007)(66556008)(6916009)(478600001)(5660300002)(66946007)(83380400001)(316002)(54906003)(38350700002)(6666004)(6486002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JysPZXTEvPY0EuU1YKR0NpqcSnWp0p+CvdY4+55uIbGgTrKzAjxx1gR5VSYM?=
 =?us-ascii?Q?pau172H/hGpcy27Ub1Kgc09c51st0uJYgbOfHS6Mtiwn6kqbvfmtDXt9/din?=
 =?us-ascii?Q?CMb1xYYvcVU7EPhsFpPJJtOo8kWCmA+uZ2Gog4sb81ho+uOXocTyJSq3LCS7?=
 =?us-ascii?Q?xcb2CWAE+57TWgSY0x89XV+yQiD4WbA98YiGBygk0IdGyhoLtrbWuSbaWzON?=
 =?us-ascii?Q?eGWWg0PtYgA2MlcrKdEUtXHDSxwbe9IhzJ8WDrrNXs8HSmXQrbKAY1twH7ra?=
 =?us-ascii?Q?4SQClnoWYeJRb+37zeYPZvd0TygRkSpL0JQwJ7mSOIzFU1Ur+aGRigfkzC0w?=
 =?us-ascii?Q?vdQNguQOjbiEAKOZ9nLJh7FY9qz+GFwj1p+g5RYOwJF1Yb1AYMwvHcM/GAER?=
 =?us-ascii?Q?30JjLEVW5AT+odiwGzcpow3sHlNl4Fw3W4ZSzsDwPoQX/MkGq19/3TMkFX8c?=
 =?us-ascii?Q?SqDlOpTIRQyGd0RWI7E4MrxS6YFoYhzI11oLs8YIkK8tkXJ4oR4gNgr1d8lq?=
 =?us-ascii?Q?cIO/RdFjcJcIHLWEKkd54n3xyfuQf+l8nX2Vh8OT7DtJ7IAY0dNEg8qz2C4W?=
 =?us-ascii?Q?dyOzE1JfPn+vw0K+EQJ99j9UrauKWWugn5CxCggtdkYTgRWUFhE6TdclCVYl?=
 =?us-ascii?Q?41MlIUSi/RSQVg5+SBJz38FNCnwikjPsncM44AAaTKVTTKo9yol0lI86n4Jr?=
 =?us-ascii?Q?zcYXnNQMDJvXeYNNbgbxEnK1x6mBOGsRzFyRjeE9Z3dgHPg3bB86lv/VcqfE?=
 =?us-ascii?Q?WqZJiCaEr741IoVAaNh7eRO4gzUbh5SqxDISSqDowpknLe8rDcK0xAbDItSb?=
 =?us-ascii?Q?Bg1XRlYWxXMsoLiGT7UMsu2VDiWvDOF7vu8cL7khZhFWoGNr8l9eXZCma0Au?=
 =?us-ascii?Q?/0fEXl+Vh+p574fuDzcqBHJGvkdVDxYejkp4/iny4C1wStf4UryDZGglL8dF?=
 =?us-ascii?Q?TYqTFyvkg6BhtOcgbdFBGgYyzXzKodXWvqedIwq5niXDc16aAz8oEWI+0PHd?=
 =?us-ascii?Q?5eLb4eVKM/1IAdfSusC9NRfDRzO3YVVobMlGo028Lfz1IeB4uKkxeHnBBMvx?=
 =?us-ascii?Q?pynjs02SQywnYrLfTI4VrmSYrBfJhJx+qJpWp5TA8JvRTYgechbqGDrWfcGO?=
 =?us-ascii?Q?tikRqz7Sis+O6/J0WoNlPFup7mZPZVrXmRQQH94hRUZHGiuGWGtLwY0SBIHG?=
 =?us-ascii?Q?mTS11xbMQjF6OCupfpYal8Mn8de28neqnxO+0sP7+Kt6wRjEMmBpvqFjE5vs?=
 =?us-ascii?Q?hFBOgoZQ5Dhf6iSWlU9WVnfoqN4yW+yoQtMDH85wxaf7fMuzQpndJgLrjyVa?=
 =?us-ascii?Q?pS6YC2ux8YEmQTGSRzb5aXQcDHp+l8g7kdW1M9KCURSl7APStzjQJWf7TifV?=
 =?us-ascii?Q?RHYv22zomHuyOSjX2x/Nf2E9RjuRGWY5jZxZNfdsEIpQyXcVaZrEPpkutZrt?=
 =?us-ascii?Q?+9S79x7NcykIs/kzqUIyqMq+vWZvmZduMjVHlv/2qZZHwahO9iA0gECRVcAm?=
 =?us-ascii?Q?cil0rScSjHu6cnA6PjN1wbrz0y/+zb+Sc991z7ZCjSyfRRBTMCLYw9kL1yy0?=
 =?us-ascii?Q?3awuvrAW8WS8ScDKVBjwUgCG9fkAyBMhZuEHG6plIyA+tbWQ2KwyAobbu7K/?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c92c077-e405-426b-1fa4-08db5e125fd3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 17:55:21.9313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0aiN8LnBNDOYTN5NjyE+i+iMBW0MH6t1QLkv0lz9vWmJYo8NvT8tEZ7gkD0jDFi7lT7UsWe+H7ZADyOL66X0cTbCbxmlgir17B2Ckvn3Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f3eEW4gIH7vORE3OnGeffMXRjvTcWRHuPcNjvZlPTs=;
 b=Hl1GhFZ1NSkY5jg919IT3CH8chFkQiHSpXLrR+qR+fgkI1pmmvKGWl+0OhShDDxlojnIU/GUjCo0u0eSbIQnEY3k0knj1wRhYwwU8VtWRbL83iGN3r/gVA4FTSq9fiPPHatfHQgwmfbrbe0yCO6QiSQcYup8bngMlkW+RQytyT0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=Hl1GhFZ1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [v2 1/2] package/bootpc: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the ability to select, build, and run bootpc - a client program for
BOOTP requests.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---

v2:
  * Fix all check-package warnings
  * Add patch messages referencing upstream status
  * Add hashes
  * Add license references

---
 package/Config.in                             |  1 +
 package/bootpc/0001-main-fix-build.patch      | 49 +++++++++++++++++++
 ...Makefile-remove-strip-from-the-build.patch | 33 +++++++++++++
 package/bootpc/Config.in                      |  4 ++
 package/bootpc/bootpc.hash                    |  3 ++
 package/bootpc/bootpc.mk                      | 21 ++++++++
 6 files changed, 111 insertions(+)
 create mode 100644 package/bootpc/0001-main-fix-build.patch
 create mode 100644 package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
 create mode 100644 package/bootpc/Config.in
 create mode 100644 package/bootpc/bootpc.hash
 create mode 100644 package/bootpc/bootpc.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..4581455c2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2273,6 +2273,7 @@ endif
 	source "package/bmon/Config.in"
 	source "package/bmx7/Config.in"
 	source "package/boinc/Config.in"
+	source "package/bootpc/Config.in"
 	source "package/brcm-patchram-plus/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
diff --git a/package/bootpc/0001-main-fix-build.patch b/package/bootpc/0001-main-fix-build.patch
new file mode 100644
index 0000000000..5c0bc22d16
--- /dev/null
+++ b/package/bootpc/0001-main-fix-build.patch
@@ -0,0 +1,49 @@
+From e957c19edebf256d77c2d9ddaba76147208f978e Mon Sep 17 00:00:00 2001
+From: Colin Foster <colin.foster@in-advantage.com>
+Date: Mon, 20 Mar 2023 11:18:13 -0700
+Subject: [PATCH] main: fix build
+
+When buildroot attempts to compile bootpc, it comes across the following
+error:
+
+main.c:24:18: error: initializer element is not constant
+   24 | FILE * logfile = stderr ;
+      |                  ^~~~~~
+
+Fix this error by removing logfile entirely, and simply use stderr in
+all fprintf() calls.
+
+Upstream: N/A Has been sent to main developer, but project seems stale.
+Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
+---
+ main.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/main.c b/main.c
+index 6774cf1..0aa3767 100644
+--- a/main.c
++++ b/main.c
+@@ -21,8 +21,6 @@
+ 
+ #include "bootpc.h"
+ 
+-FILE * logfile = stderr ;
+-
+ int main(int argc,
+ 	 char *argv[])
+ {
+@@ -159,8 +157,8 @@ void doLogMessage(char * s, ...) {
+     va_list args;
+ 
+     va_start(args, s);
+-    fprintf(logfile, "* ");
+-    vfprintf(logfile, s, args);
+-    fprintf(logfile, "\n");
++    fprintf(stderr, "* ");
++    vfprintf(stderr, s, args);
++    fprintf(stderr, "\n");
+     va_end(args);
+ }
+-- 
+2.25.1
+
diff --git a/package/bootpc/0002-Makefile-remove-strip-from-the-build.patch b/package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
new file mode 100644
index 0000000000..43efc5dd80
--- /dev/null
+++ b/package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
@@ -0,0 +1,33 @@
+From 93ea730f4a6b9c6c786bbdad98213ddccc668986 Mon Sep 17 00:00:00 2001
+From: Colin Foster <colin.foster@in-advantage.com>
+Date: Mon, 20 Mar 2023 11:35:12 -0700
+Subject: [PATCH] Makefile: remove strip from the build
+
+Stripping of binary symbols should be an optional step after a build,
+not forced during every build.
+
+Upstream: N/A Has been sent to main developer, but project seems stale.
+Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4189648..54562ba 100644
+--- a/Makefile
++++ b/Makefile
+@@ -33,11 +33,9 @@ clean:
+ 
+ ${PROG}: ${OBJS}
+ 	${CC} -o ${PROG} ${CFLAGS} ${OBJS}
+-	strip ${PROG}
+ 
+ ${PROG}-static: ${OBJS}
+ 	${CC} -static -o ${PROG} ${CFLAGS} ${OBJS}
+-	strip ${PROG}
+ 
+ # Make up a distribution file from the bits we want people to see
+ distrib:  $(CFILES) $(CHEADS) $(MISC)
+-- 
+2.25.1
+
diff --git a/package/bootpc/Config.in b/package/bootpc/Config.in
new file mode 100644
index 0000000000..59c6a6e739
--- /dev/null
+++ b/package/bootpc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_BOOTPC
+	bool "bootpc"
+	help
+	  Application to perform BOOTP
diff --git a/package/bootpc/bootpc.hash b/package/bootpc/bootpc.hash
new file mode 100644
index 0000000000..cfa7f49944
--- /dev/null
+++ b/package/bootpc/bootpc.hash
@@ -0,0 +1,3 @@
+sha256  b3ec94a1881f5dc4f7ad7832448bc5bd028bb413eac7032b481f2d8713910ba8  bootpc-80c0811dc69f9f3923661be4f9f9c09a44313f62-br1.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENCE
+sha256  a31e61b9fc2de25c229bb9f1baa3138ed5e66ece7d5e203c5847f46d867cc1dd  NOTICE
diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
new file mode 100644
index 0000000000..200ed24872
--- /dev/null
+++ b/package/bootpc/bootpc.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bootpc package
+#
+################################################################################
+
+BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
+BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
+BOOTPC_SITE_METHOD = git
+BOOTPC_LICENSE = GPL-2.0-or-later
+BOOTPC_LICENSE_FILES = LICENSE NOTICE
+
+define BOOTPC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+endef
+
+define BOOTPC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bootpc $(TARGET_DIR)/sbin
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
