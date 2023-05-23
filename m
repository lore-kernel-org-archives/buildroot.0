Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFCAC7EE2D
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 17:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332BF6145E;
	Tue, 23 May 2023 17:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 332BF6145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTNU1tSYpVRZ; Tue, 23 May 2023 17:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C76A6143B;
	Tue, 23 May 2023 17:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C76A6143B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE941BF318
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6097161423
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6097161423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Z6EyF65glwV for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 17:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A59A613ED
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::716])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A59A613ED
 for <buildroot@buildroot.org>; Tue, 23 May 2023 17:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxxXdMTJemc6Nb7a7ZJ6QN2oHu6ztd/vlBryoOAFOpCVZIuddcT0SwTERQaA+9fsJF1ZsvOAw4iYPtFRRgV+//z7jpbnhS0bUIyHIBsi/XXpABRWa8AF8SpJOFbjVz6ttacx8F8R/8iq80dCwFse3NIgyi+cvftKUkvMB2Ni8slagZH2eUqAAOAfYzCqqjQoBcXHmrYH5p+KdgooBNpgMDnk6XHVstqa2obBQxZeA18gM09eENNjdGZUftUx06cmmBXrG5kuYzhHJDJ8W/OFKhCipdvue3H/ewcGvbAunFnETkbx1AUpiXOQKAVXSctSP+WbIqVl4l1hPqDGCP2ADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dtRAdArPw1Huemsun4OYO17gwiKVuEdkctKbY02kBM=;
 b=Cork4b/F537664mCWBdxTBVtEPmEABy8oWsEnFri1jyD54DIldq0N8ABECOfJirNsh0+XBocMyypkbEvmZcPvrZKO17NorFrcuo71vQjaUyJVtDVRILW4C9XdahcdGVodLsHv3hMciPyRRkErU6HZEHcAYC+24Fqk7A14cJuKI4N4XyKwnACcZWhilfi3e86Fu/eVF4D7W9cnLnevbJHevz94lCYo3P/4dun2YRugoDoFThe1a0rnz+8tZF4QxRgGanJmp6V+SPJUTlmL/hb3+Yk4MLhmGoBjwFus9Wlfn3OzYdYMA71JGPi8/IvVXQ6NhEFq9te/jHjY4fC1TMI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MW5PR10MB5739.namprd10.prod.outlook.com
 (2603:10b6:303:19c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 17:21:51 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 17:21:49 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 10:21:19 -0700
Message-Id: <20230523172120.1948573-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523172120.1948573-1-colin.foster@in-advantage.com>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: BY5PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:a03:167::32) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MW5PR10MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2b3c50-1097-412a-b9d4-08db5bb2304c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZIlA6PzsXPvyGVX2HwesIk3gkF7YoMVFx8gYCHl8mSI4TniUKjWa0/NyGy1t1fjB3IcUGiPiCjL9KdyvabZsC9ce7tljAeDj08twIBi+8Q6eJtW1hFtnc68YhO6mCQmc//JHeDbJDdU8vzPBW831Tx420r2M5hRuTXg5FC3nLdcqOWNMSIkXyZBomjdd9IbG/cWQD70naizxHXQbw8BF00JgaQ+puiJ+XwD7SSOhA3pZvFrmw1vT9WA4ZmanXBuEwDJyWdCXErSgORwh+/AdE2YrHZ8lQNuDRJrrpPGKqG2nIIN/UlfsHYMH3KD6w94ZdyWgrKiz2CHNdXN1OAQBTbvjAqvWn3rv/POfmywYsWNfm83gvebcQfnqHSBsWuUXRLc7jKLcFkEBwpYh3h2FYKKUeiobo9zOrGdVoXS0a2Y9D7QNhNzzeSINagdC/xmHi5liQnTwTCZi8NpLsbz5H1CXqLh2Z9Y8qZV7RcGZvtn5xS5lNvBZgB6YEf1sOpYNcFK9YIS2jTPR6thrcrsMnUEAKQWHuEJfDAfqpglZ8np4l4zNPjMXTQYMSYI6LeA9YrO7G2bV2CscIRnBp3gL5GHkm132rTSgkAHVSVt6ZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39840400004)(396003)(366004)(346002)(451199021)(2906002)(5660300002)(44832011)(8676002)(8936002)(41300700001)(6666004)(478600001)(316002)(66946007)(66476007)(66556008)(6916009)(4326008)(36756003)(52116002)(6486002)(966005)(6506007)(6512007)(1076003)(38350700002)(38100700002)(2616005)(26005)(86362001)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCisouTwHhxqlV4A4CnhtGo4DccqKIbLivBs+yqqhg0/RFEhZvbKhYI68UXl?=
 =?us-ascii?Q?AYPL6Dim1Fhrz5M6oFUpbU+TCXa+Viy8GmtS3Xq4lv+Zjat2htYmcyUaWjK7?=
 =?us-ascii?Q?q7mD6Cvlkr/CZMPHDcTaBJUGUZjpXlEdb0+2yztRN0RM+18NkvmJceN2Aksw?=
 =?us-ascii?Q?UFtJ5ggvEq1Qy19/fz+SR+wsZq8ImLtgkDKO4OiitBfJ8ZudJSlvETfBFwtS?=
 =?us-ascii?Q?Q9w8Vdg72eVc5rIpwEuXi5kpKRudH2L4TaVaK/VfmCPIsMVRSJYu0ybFJ9sd?=
 =?us-ascii?Q?+xhUYlrdVBstE8wp6FxmSTvQ/Cw67imsV3ubhiScm35m3vJWR2Gx37YevTRk?=
 =?us-ascii?Q?HAyK0fzGFfsWdMQIVjFcUVzFr2ZRzwvWI9hxKjKofOhMc9weQ/0t803tA3It?=
 =?us-ascii?Q?FJkWkjGVtlcZUT2ofnL9tsh3KZDLtTkHk+gPBFyNFpX4NNHXXmCuM8/AEssS?=
 =?us-ascii?Q?iqjjZJoj0o7/020/d8QY+Wowrzp134dxP/Go7HRuSiQeOVLNLYNjVzCEdpz8?=
 =?us-ascii?Q?P1ibOOj+IxY+cYYHoPifMv1g7mQpRSPhdi1nzF7Z8rk7OvLvTeBTiev+WC1C?=
 =?us-ascii?Q?4o8hn/7ma645cbflhIuK3/PmbJDwN4RV1RJWLRsO4S89fDyPV6Knu6SFPw9Q?=
 =?us-ascii?Q?N3o0pGpnkBwBLGYSzmOAFjlx6CLmxn4XgXsExQXUrdba5hbkC3pRIvSYisGh?=
 =?us-ascii?Q?sIxIS+MMogTyTgqn95pzXUBFc9ezVHYz3iNWQ17Cts0UF+rMIKt0BLxew9f1?=
 =?us-ascii?Q?T2O7jC7VoPBaNUXgQ/ek2TXrltTkUtzCRDtCtJDXhl6hNwjDEzv94REGPVcS?=
 =?us-ascii?Q?Wz+MkAONYLlvvGkGWl43W3gkonMH6f7bSJBu/LkGbT+S4JGDBP5bmEDhswM+?=
 =?us-ascii?Q?OzZ+HacoXCjMGqIoyic7Q08ojtTxFOrA3q+ZlvFRMwtA5GzxrbMi0+uLzZrv?=
 =?us-ascii?Q?KngHlSU9ct5sTu/3rL29ZiXuuJP9TcFPoEdedkKwQ6Ol6rJvdo4bqVK/IF8f?=
 =?us-ascii?Q?dSY7l8OUx3npr1p4aLYkxD0SCAdYwnEiTWEQiQ905eJWN7tz4qE5DKUT1wzB?=
 =?us-ascii?Q?8uXPsYAi4H88Qow/CMwHHw7WY87/2OtLPIroVSB7Jlwe9S2ZOniR8+JAqaIu?=
 =?us-ascii?Q?x/uw4kaf4fR71ccEtu1rCbaHCrdoJIx9MB07b2SRZXDOfCymM5TB0hSVBYIH?=
 =?us-ascii?Q?D6n8V1jeYavWkzQ2C8dCsTWxfdLTuMwcpOKPosA+/5HuQFYs5NjO/bJbq5Aq?=
 =?us-ascii?Q?t9+ODBOptfvAu4nAFUqn+d/0aYd+8+oTubPyexhEJmlyJytaOctFcb1Wv0wE?=
 =?us-ascii?Q?arLRzVR9CNFPaXr52vbOSEpuH/8a2qTS8shqc/jt5elgg8vSGCS7cF8FYtHf?=
 =?us-ascii?Q?CSIenNrH0IFqUUe1YrrLUZ4itTwOUcQmZNztUc52vAWJWMxwQ8QNIbSaA2Za?=
 =?us-ascii?Q?hb7IM7bRGA/uc/KwCm80wwSWAoN/2njhuCCRuB5l0N4PDa4mmETkUXVeEg7Q?=
 =?us-ascii?Q?LcgtQJx6sQ0zYJj5gzmz0FktVcQMjt5bMWuK+Q6+dRvYFe+TlPcHOJueBrJG?=
 =?us-ascii?Q?cVsFou1FiR+07l3Ejja6kZPUYBMfjOxiH5TEclBJCcAFQQJEqjaaAKOQ7sfT?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2b3c50-1097-412a-b9d4-08db5bb2304c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 17:21:49.6722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bI59L4iium05OT822tZTHj5toEnaQoK+zHUw7fuwNr1Rg+3yum+wbmEqAD1H5RChkQIV454JmW1CxbyNZgaKtdA0u4cofjh7/JccUUyna3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dtRAdArPw1Huemsun4OYO17gwiKVuEdkctKbY02kBM=;
 b=R4KzOJP/uTxMLWXigXDHmgr+GMPVPxyQ2JAcXlP/15us7CfF7zBkvJ7ca6o4l9i4AVH2QPuTpKNjBcPNLsjQ5mvu8+iKfym3EgrxWJL47bxedPFO+T3fyRpPRatyDT1YG4g9efG8FDzkQgwqlxH1G8Sl5tOZGxTKWFBV9vyVoXI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=R4KzOJP/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [v1 1/2] package/bootpc: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the ability to select, build, and run bootpc - a client program for
BOOTP requests.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/Config.in                             |  1 +
 package/bootpc/0001-main-fix-build.patch      | 37 +++++++++++++++++++
 ...Makefile-remove-strip-from-the-build.patch | 28 ++++++++++++++
 package/bootpc/Config.in                      |  5 +++
 package/bootpc/bootpc.mk                      | 19 ++++++++++
 5 files changed, 90 insertions(+)
 create mode 100644 package/bootpc/0001-main-fix-build.patch
 create mode 100644 package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
 create mode 100644 package/bootpc/Config.in
 create mode 100644 package/bootpc/bootpc.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..07de6500bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2273,6 +2273,7 @@ endif
 	source "package/bmon/Config.in"
 	source "package/bmx7/Config.in"
 	source "package/boinc/Config.in"
+    source "package/bootpc/Config.in"
 	source "package/brcm-patchram-plus/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
diff --git a/package/bootpc/0001-main-fix-build.patch b/package/bootpc/0001-main-fix-build.patch
new file mode 100644
index 0000000000..cf4ad66e47
--- /dev/null
+++ b/package/bootpc/0001-main-fix-build.patch
@@ -0,0 +1,37 @@
+From 349164d3db2210fb51e3784dd1afbe2b120f32d6 Mon Sep 17 00:00:00 2001
+From: Colin Foster <colin.foster@in-advantage.com>
+Date: Mon, 20 Mar 2023 11:18:13 -0700
+Subject: [PATCH 1/2] main: fix build
+
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
index 0000000000..1f5edab2eb
--- /dev/null
+++ b/package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
@@ -0,0 +1,28 @@
+From a58a27b82d2d822e338b46ce6eb270f121a8905f Mon Sep 17 00:00:00 2001
+From: Colin Foster <colin.foster@in-advantage.com>
+Date: Mon, 20 Mar 2023 11:35:12 -0700
+Subject: [PATCH 2/2] Makefile: remove strip from the build
+
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
index 0000000000..2936142b7f
--- /dev/null
+++ b/package/bootpc/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_BOOTPC
+	bool "bootpc"
+	help
+		Application to perform BOOTP
+
diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
new file mode 100644
index 0000000000..d3c5ce5198
--- /dev/null
+++ b/package/bootpc/bootpc.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# bootpc package
+#
+################################################################################
+
+BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
+BOOTPC_SITE_METHOD = git
+BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
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
