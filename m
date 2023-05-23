Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340E7C7EE26
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD523613ED;
	Tue, 23 May 2023 17:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD523613ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGzoaTKXqNC7; Tue, 23 May 2023 17:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C50916140C;
	Tue, 23 May 2023 17:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C50916140C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 595CE1BF318
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B26FC613ED
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26FC613ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4LSSSSCZORF for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 17:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4066140C
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::716])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F4066140C
 for <buildroot@buildroot.org>; Tue, 23 May 2023 17:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3ATK8bxOnLugsMN4WYGhSAIl29mdrj4loD9sPuRZw5RnjuPYEm76KrHF6w4zTjeI62ZnU1ppl8YLLX7qlj+E00XHBQW5szW1jbrpxtU8XX1wSl6EpJYZBV2AvEyjzE7ugxwlEe+wAsAg/RQgzVCieqSPtp3hGyuZrBrp60cmWQNZVAay6RU16OVDKNzJgQI/njNhBXTf2xU3DAQ4stUPJGxr6HdXFVsRltk2KBVhi2NnFmru9AvnW/xjXdV2NeUlbYMjJp3DoBjmoSDaAYu7KnbMa1udEZDner73puLBPcAUf8gEnMzGQoFlQRMfz4wyOJVXBFRdEM29YfAfGG8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B8FGPj/OJMPEhiJa2FR9FCyb0uHOcwE/xiVIxZUeiY=;
 b=dVnBfFpHh5DhMuMby4dOqrPiiV28lcetw0yfS+r1zobXMkMj/SqmCXT8nUgRyym1J8nGw7uEticWLUAeTz5Da8jag25lEmW8msX1LXgQ9lZLNiEIMXU5yHzujkOtU5gjqspyB2XoSFUTumsdq85euR31MaxlJD1nTlc+nj/z22Y6sgJp//zz0rB5MIqJ9vP+VA+I12f6vKCDq9mu0wYN31TqmwBKCgXxZDfH2QOhHXJPSuHGJqG/5ftT7cee1EDLIE2VQbXnD++sA8RDDVxKHYdFOWt8yS22zSxVJhNwA32uRvwIvST5WX5R+liRUlJ19le2Jniq5s9cLb86RtbHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MW5PR10MB5739.namprd10.prod.outlook.com
 (2603:10b6:303:19c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 17:21:52 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 17:21:52 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 10:21:20 -0700
Message-Id: <20230523172120.1948573-3-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523172120.1948573-1-colin.foster@in-advantage.com>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: BY5PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:a03:167::32) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MW5PR10MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7f1cf8-f0c9-4269-ec29-08db5bb2320c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMN/KysgOQzGfeoZlQtPjjPULlpsIKqQdJb8ISUrOlkbK9Axbm9WQFZBIvnhHBnuGyKo0zEImboI4jcoKBtqaciiX3sgl9hPzG0hChd5ZkpFjY2XMd+i59YqFXQw1j9iTSTzLefezv/PDRGt7kgxYFFEMilQOcfdTO4Qo750g27lcaUi11aOR1qAa6mrI/difJCx3iOYI1yZkMkNvCwbCpQMcH3Zp1LqIcLMRzLmcfqnp39u4iiidGks3z79W+AYap20WTUzpFnO/TEuuJHEVC3Q6NGLA1f9SxB31cQdU5Jvy5TibTTH4Ef2R2jfFcMqEYSBDTBEU4ZIu/h/6K1/ebVdZvprc0b55ywthck6l7aSI9DI95zOXX/UIkYyxlwNmUIkP9KOB2cZH7EfM3FkQOphvW4V70HkTW+ep5FyTFZAnMMq5HKh8S3r/ztbRFwNH6S7D/YEEVodoAadHjA0nxKil+x3gOKHT/DYTFYVIM4COwx4U/VvzU5k03uKPd/q5bPUahfb4pGesAlvl/NmLPYZXZr0gtKtuk1LcXxs1FaGzylVivSbkM+L8nd8RANB6RCWSnP0cXHr6m4Kso7LnaKf42WYTgJEi7XcQ31fdVbGlEWiMilDLckJcaGBI83c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39840400004)(396003)(366004)(346002)(451199021)(2906002)(5660300002)(44832011)(8676002)(8936002)(41300700001)(6666004)(478600001)(316002)(66946007)(66476007)(66556008)(6916009)(4326008)(36756003)(52116002)(6486002)(966005)(6506007)(6512007)(1076003)(38350700002)(38100700002)(2616005)(26005)(86362001)(186003)(83380400001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WXptpyEH8SLXoFcXchBU5/PMPYnYiq5oQ3QpKRzOrszHuUOJ7h/xWtGqdVZ8?=
 =?us-ascii?Q?knobKNPOT+WRIgZ5i4Yh/sm8pJs70tjFhDKjplYuzxbjRBPyqmAt++CDBixV?=
 =?us-ascii?Q?9PQsfM3cbLvADRZo7d4G2szyCerxifNwADLR+M0gQ+S8O7DHUkMUKZnUawD1?=
 =?us-ascii?Q?CQbR4NcNA5LF+dylboOHyk+lSfVgMsjJ2PwkKfRuhqWe1X1M9uqL0EMwcQhc?=
 =?us-ascii?Q?sYEBrSI0+QdXBAdZ7DmNKWf5aLfw5jwnpYC7xpYfoC4284RWS2EWEfM6u/tb?=
 =?us-ascii?Q?d/7AkRRDsdYYwdO266ny4vxDW6hG7JSNMFwRFmvJ06H900oFnfZq5zHAOJPo?=
 =?us-ascii?Q?MJjSpYu43wv13W3MivfSQI9hD4y4UBwatZYOS4nBGv/AEcFXYp9p8j/N+WxZ?=
 =?us-ascii?Q?6+gbaGGV7rfiFU0CIOMndjoPMGliXKL9hURPXgtf4i+8YTzBf7IVXRbPe4fk?=
 =?us-ascii?Q?jtFhfbkcY//s1qkzaAUbsnSHOWSY8WulEWqJm/9YKEZj+dCeT8NnuPrIgXFV?=
 =?us-ascii?Q?ykCpgpsDhcg9SaMX8RXAXOVRj0HxFICJRsCyUjiunMWbk/YoaZ5hWu48juhg?=
 =?us-ascii?Q?7xcN11vYPv4dZ0ntA+zYGn7QBXGwg4nRKuID3c8/riWgu4oD22fHTlXq3XKx?=
 =?us-ascii?Q?TNCa6JF53OgnvDcP5qnPbFmRL8duZjSt/YCQ0xpUjmyJVD/9vrhhx8CDfnCi?=
 =?us-ascii?Q?Akv8/8kQ2bbZ7zHltOo83s9+BosQTXt/r6LOKdmFclExmGHX7KQ3npMwB5nI?=
 =?us-ascii?Q?PL9c7sjMUtc7wvkfv+qf/SbjmiU22tghchQxkx0ua+lrrlh6ydEMwzX2jPGj?=
 =?us-ascii?Q?98+lCE6psgCHwxu1wXyrWdsdnczmav5ks+S8dq+boRScnQvnDqyetvj+HshI?=
 =?us-ascii?Q?GSsJRbEwHZhU8lLQh8tob4e1kp51PJARwR9RorYrONQaM59B6iNhNDEXHABS?=
 =?us-ascii?Q?CqgeHEQ9U0ile4eoJ+9Sk1odz+axA5uDTrgr7/3mzvklb8XJMWzeWkzRcv+2?=
 =?us-ascii?Q?6VneVbu5enh6RxedRoXv3NO/jzdQj+SK+vbYvsLUutmtE5SrxNd1e5hElpKJ?=
 =?us-ascii?Q?PmAWRF3rvY2xF1SvA3btPR6i1Sor+VoN1i3AFmHohz0wncfr6pBAoIik8lwl?=
 =?us-ascii?Q?ib40DwAZB3U/TBhzeZcK4wPeTgHrTJ3YVgZ/jF+mWLKdj5aUMXnXuiQRqXu5?=
 =?us-ascii?Q?Khj32cdSpwQiSP/k1ZqEFM55rHu9b+ZcV24YSZ+ZjRe8AHDqCMU88V7SoHhr?=
 =?us-ascii?Q?LOXCqvKKLioaK3ctx72w05qDIxRkU8tacK7qt5YPfTcN6/TC/daI0WqAX8Sv?=
 =?us-ascii?Q?zl1kd0KD3WwHucHnw3euaIkCaESNK3KmfxwNUfIvstbG5R4UrljYeg6G3JkB?=
 =?us-ascii?Q?H3KF+Po0rdPtMA3fvIv2+9bK27nDe3sy7yLSjc4Te7rHpU37XNts/9mYePvJ?=
 =?us-ascii?Q?ClZpOgSe/UITCGiS39lCtAj+PD4V5BW3oxLsSvntcNAoxTdfi+R8scahhdhH?=
 =?us-ascii?Q?93av/shNW5LalxaO96d5huMZaQ3u923yEyRt/wTM86RLiGMualuCO5fpRgfc?=
 =?us-ascii?Q?XbtW61q+P+fEbF9h3vbs8Hq54ShfuMDU/7SvgTwsWa7ZcJ7A85SkyK2wkOD0?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7f1cf8-f0c9-4269-ec29-08db5bb2320c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 17:21:51.3325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG7cJtNcp7kOyvMt6eaXEEbPnrs5ND3AOjT+aInJfTev1y05Uux2ePfto8m0FYK85vhQA8lx3GSrReLeyMDXr3H5fi3pmCxJ7OHTuvzTFLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B8FGPj/OJMPEhiJa2FR9FCyb0uHOcwE/xiVIxZUeiY=;
 b=lBpQFpT5ucRrD9bcYiyR52ZWQi2ZgyYuO0ZazAiWxJLkOxEbjxfuQWvs30YGRXKPBs/gdr9Rn9sARZ/neie6GSn+R1HvYjhUexrQxJQZlD4PuFpfbbxZD4IRwimvl909olFKEbtka70uAx4STuaRP4SnMcKMX39qqq+QSjN2n+A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=lBpQFpT5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [v1 2/2] bootpc: add dhcp-like configuration ability
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

bootpc only works on interfaces that are up. If BOOTP is desired to get
an IP address to a running kernel, bootpc won't work.

This scenario was brought up as a bug in Debian forums [1] in 2007. The
response was to run the attached script to bring up the network without
an IP address. Sure enough, it still works!

Implement this bootpc script to allow IP configuration by way of
"iface eth0 inet bootp" in /etc/network/interfaces.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=436443

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/bootpc/Config.in          | 15 ++++++
 package/bootpc/bootpc.mk          | 20 ++++++-
 package/bootpc/bootpc_dhcp_script | 86 +++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 package/bootpc/bootpc_dhcp_script

diff --git a/package/bootpc/Config.in b/package/bootpc/Config.in
index 2936142b7f..fd3cd58d40 100644
--- a/package/bootpc/Config.in
+++ b/package/bootpc/Config.in
@@ -3,3 +3,18 @@ config BR2_PACKAGE_BOOTPC
 	help
 		Application to perform BOOTP
 
+if BR2_PACKAGE_BOOTPC
+
+config BR2_PACKAGE_BOOTPC_FULL_CONFIG
+	bool "bootpc interface configuration script"
+	help
+		BOOTP can be used to fully configure a network interface in a
+		similar manner to DHCP. bootpc requires the network interface to
+		be configured before this can happen.
+
+		Replace the bootpc binary with a script that allows an
+		unconfigured network interface to work as a BOOTP client. The
+		setting can be applied with "iface eth0 inet bootp" in
+		/etc/network/interfaces.
+
+endif
diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
index d3c5ce5198..ebd7490ea1 100644
--- a/package/bootpc/bootpc.mk
+++ b/package/bootpc/bootpc.mk
@@ -8,12 +8,28 @@ BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
 BOOTPC_SITE_METHOD = git
 BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
 
+ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
+BOOTPC_TARGET_BIN_NAME = bootpc-bin
+else
+BOOTPC_TARGET_BIN_NAME = bootpc
+endif
+
 define BOOTPC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) PROG=$(BOOTPC_TARGET_BIN_NAME) -C $(@D) all
+endef
+
+ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
+define BOOTPC_INSTALL_CONFIG_SCRIPT
+	$(INSTALL) -m 0755 $(BR2_EXTERNAL_BR2INADVANTAGE_PATH)/package/bootpc/bootpc_dhcp_script $(TARGET_DIR)/sbin/bootpc
+endef
+else
+define BOOTPC_INSTALL_CONFIG_SCRIPT ""
 endef
+endif
 
 define BOOTPC_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bootpc $(TARGET_DIR)/sbin
+	$(INSTALL) -D -m 0755 $(@D)/$(BOOTPC_TARGET_BIN_NAME) $(TARGET_DIR)/sbin
+	$(BOOTPC_INSTALL_CONFIG_SCRIPT)
 endef
 
 $(eval $(generic-package))
diff --git a/package/bootpc/bootpc_dhcp_script b/package/bootpc/bootpc_dhcp_script
new file mode 100644
index 0000000000..c7de8280f1
--- /dev/null
+++ b/package/bootpc/bootpc_dhcp_script
@@ -0,0 +1,86 @@
+#!/bin/sh
+#
+# script to initialize a network interface using bootp
+#
+# Copyright (C) 2008 by Fuji Xerox Co., Ltd. All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# written by Kohei Tanaka <Kohei.Tanaka@fujixerox.co.jp>
+
+INTERFACE=eth0
+
+# load configuration file
+[ -f /etc/default/bootpc ] && . /etc/default/bootpc
+
+# to get the interface looping over arguments
+while [ $# -ne 0 ]
+do
+	case $1 in
+	--dev)	INTERFACE=$2
+		break;;
+	*)	shift
+		continue;;
+	esac
+done
+	
+# up the interface for sending broadcast packet
+ifconfig $INTERFACE up 0.0.0.0
+route add default dev $INTERFACE
+
+TMPFILE=`mktemp /tmp/bootpc.XXXXXX`
+
+/sbin/bootpc-bin --dev $INTERFACE --returniffail --serverbcast > $TMPFILE
+RET=$?
+route del default
+ifconfig $INTERFACE down
+if [ $RET -ne 0 ]
+then
+	rm -rf $TMPFILE
+	exit 1
+fi
+
+. $TMPFILE
+rm -rf $TMPFILE
+
+[ -z "$IPADDR" ] && exit 1
+
+OPT_NETMASK=""
+OPT_BROADCAST=""
+if [ -n "$NETMASK" ]
+then
+	OPT_NETMASK="netmask $NETMASK"
+fi
+if [ -n "$BROADCAST" ]
+then
+	OPT_BROADCAST="broadcast $BROADCAST"
+fi
+ifconfig $INTERFACE $IPADDR $OPT_NETMASK $OPT_BROADCAST
+
+# already added a route to the network.  just add default gateway.
+for i in $GATEWAYS
+do
+	route add default gw $i
+done
+
+[ x"$SETDNS" == xno ] && exit 0
+if [ -n "$DOMAIN" ] || [ -n "$DNSSRVS" ]
+then
+	mv -f /etc/resolv.conf /etc/resolv.conf.old
+	if [ -n "$DOMAIN" ]
+	then
+		echo "search $DOMAIN" >> /etc/resolv.conf
+	fi
+	for i in $DNSSRVS
+	do
+		echo "nameserver $i" >> /etc/resolv.conf
+	done
+fi
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
