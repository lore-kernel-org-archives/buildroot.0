Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188EFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C7160D6C;
	Tue, 25 Jan 2022 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aq2i9pODIqAT; Tue, 25 Jan 2022 13:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EF660BD5;
	Tue, 25 Jan 2022 13:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 834EF1BF36B
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 13:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718F382B49
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 13:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhHfhYmKmhNG for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 13:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::61a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB1B6828A5
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBILD0mmwEbXhGBX3k0sv0yENsz/lHwSM+vwuKqMHlg4DHXc56dNTLKyRIsJzDl9NbEQEY7RaNrq6eQIBCeV2HzTit36ymf8Em+pcRtFeT1sfswSYe1r9l+gcb16iOFpCa+ChzXkvc0avJhvEOTlGB5iCsPQZC51fq2a7kd6f19cVE7hVucomWYsXP/YlppqjW1kxPk1pyOVEVo5HYa/gm7y4vC6U9dU8vGwnAo+PXCqY8N/ZjO1nG7QA4oqQiBgwhTY/Js3rn+qJQAYPS/8Lcs8c2+Z2SEwbMkX89s8Dm8ftOP4KePqYcHgtePyWlX0GT5kD3OcKikTgvN52YjHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7MMNx/ArE3liNkvyy12j4FIdxSqrO6R3h3MUkoYzwk=;
 b=PJOmwmvfONbJvJhrz2FxFlMV28ekAeFZ5V49gftpAgctM6jyrFeoeHll5ExjjM+GgjUW8u8hpXXF8wr/qxMqk24uq5pvU6CZ9PUOiANaru9gqx7Ywbs5pvFZwu6RSf+umm2Vf0ulHKlzCIahBu//XLd5FQ+kKGYtKD9alRwvM2bBOg3RjWSc8yF60KNSMfyno+wfYsydwHx0vKsUf+785dbHitGVdCj9e7r/ow677++yIoQP0fxXu/rLy9Rh4/XYKIAtQWe+qT4y1kZ4+Wm9T6Vi+RUCoWZCt0VE3O1/DtLTwwNc5rvFCjw85tL45WncFAcXGIQH4dWQD43cDVAwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7MMNx/ArE3liNkvyy12j4FIdxSqrO6R3h3MUkoYzwk=;
 b=UC+WKQe3u4Yp/Yw1U4yGm/D//HU0eeBYrJju8jaTr4Pv6NXBOQtSzzBZ1OZiqXeAImqLId3DK6sL7T5vtlfqfnbMHvrwz1NgFQGXDqsshjaT/IfmbXp5kCIDVdK037YDkbhmY7SZtby/io2U4oromK0Yu2UF2AU1CXY0wkHKVjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from PAXP251MB0422.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:289::21)
 by DB9P251MB0498.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:33c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Tue, 25 Jan
 2022 13:04:12 +0000
Received: from PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
 ([fe80::1c90:e96c:d801:36de]) by PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
 ([fe80::405b:6f11:2cac:c755%7]) with mapi id 15.20.4909.008; Tue, 25 Jan 2022
 13:04:12 +0000
From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 14:05:05 +0100
Message-Id: <20220125130506.668690-1-tom.marcuzzi@orolia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
References: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
X-ClientProxiedBy: PR1PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::24) To PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:289::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e3ba51-4573-4db9-16cd-08d9e0032e64
X-MS-TrafficTypeDiagnostic: DB9P251MB0498:EE_
X-Microsoft-Antispam-PRVS: <DB9P251MB0498F0567C385EC7DAA677DAFA5F9@DB9P251MB0498.EURP251.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRazuiVLAv1eBaY354q4A9WoDSQQ4FIiRHKyoMGV4+btl07mS7PM+FgWtdCHhq2KiRLEim9NidQD2BvrBD2v+IvhVwx2hXIXDR511x3nyovi6wcZD7atT7cGGUNQ5F3ZZYdI/ImBhWUdy0BKNv67qMFpHI6mtdDPT4XDMIdvn2HK4tMBGqAaIXpCGLoZr6L7f46fpXhB8rqfEWKS+7hZtsD3evn4mIVh38TCQp3LhoZvF0DAbZ/ZqrIqK2Y9OhQwXLrbs9hmB0m35pPe2h7m2Kg77iMykufpJmJbrFQ0DNjz7VfHoZQ7Vxq5/2Bofx6CtY/3KnZw9H/ZPnD6kUa/1fnXg3iqUyLrY2yODU2vAYV22jweWpW5P2ciGKAhZ4PzsLbLhwNRlrA69T2g5n8rG+PRkR32mc64FvRS7dlgmP79uKkTYPt3CW0ZgwItutTW46nRPr97nI1/lrxI3sdiJoUr0gxLj3gkCRGVBUEtMueHh1xrLdofF6CHe1kVqsw8LUhEuc6UQ0ZAysdLBAc4jetWQEjTwIWTCfdrmR60xZ/rawECWJja9MR+vcci3Mht3YS2hPIdEY8whidzGnh3OUzjyUavsBsnV50FRjpWyLjqqQU8WVKLNCv8WqGSfftjS764713Mrs5nMs1rLi5ktvDPhDa5ahicdPMPAQmNZCHR1B9oAKHl686e80qJ6G9hK9B6G1xjS7/q/VxweQGFEQLp/Xo74PipfafZ+lPXzTJWZx9+Jc1oFwfP4xtW2LeL2nO9WN8ETGAEnfL3iLCt/y984f0/5uRYWCNzLgDSaxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXP251MB0422.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(38100700002)(36756003)(86362001)(4326008)(8936002)(186003)(1076003)(2906002)(83380400001)(38350700002)(26005)(966005)(6486002)(6506007)(6512007)(508600001)(6916009)(44832011)(66556008)(5660300002)(54906003)(52116002)(2616005)(8676002)(316002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZJzDhHxOHTq4zH0mmU4d1IAGQE69IU702Iy1FyQVe7SdaqPg8foB0a6kvqlz?=
 =?us-ascii?Q?RwvI5T48BKOefaFRKsnqDxs7WNB600+B349Bfl/4xBaHThJ0x4dPYAf3D/mU?=
 =?us-ascii?Q?oeUktM4xRFeuT8d1dd84tyNUbO1qBbHjkdoU9hgHRCK3U/C8DwhYkpWOWDpt?=
 =?us-ascii?Q?JWJPqeb6Hip0YSyAT6IjXQYb/oH8chpt/vO9XDuFAnlRq1VsKt3FHFkHx1BU?=
 =?us-ascii?Q?ifAi/QGWt3EUG7/YzyxRerRd0Q7ZJrBdGbO6f4VMqbHO1rgWu/sm6aB5KOU+?=
 =?us-ascii?Q?QcRmMTUSPd1HrZtR7rwM770RtLa/pQPmoS22FyWvP8SBY6EKiZmytmt0pfeJ?=
 =?us-ascii?Q?+0fVjVS4zDikadcx1DOa0AJhrm5Ktv5aZQkm9ztaFiSm2C0HXQbD9DTolUJK?=
 =?us-ascii?Q?l7RVGXVW3TNUmvqvVGrEq9NaQ77QdsawSMKpZFy34M/DH6twALhS0m1Iz5nF?=
 =?us-ascii?Q?jQaaxE/rz3R7FnEZAhd2RrvxZaoLqjy6094w5wei9lO+koILhPmSsrHyKvYy?=
 =?us-ascii?Q?C7RRZA3f4EjF4s4bXg+a1kML+WDjZgR5+6rPHy1CROWsRO2Ckq5YrdC22T9d?=
 =?us-ascii?Q?g/YKYLPS6TcrM2u5/R22SxQm4YCSvGT3pkswCFhjpz8j1z6ViS3JjQ0ib4SL?=
 =?us-ascii?Q?K29Kijvpzd5xwFixtWazuHesNw8G08w2Z+5qk/tYiw6qHTflUDA61Qjjw8t6?=
 =?us-ascii?Q?RATkeDjGLtdOSiwI+/QTJHWFG6Buk47rxBUANAF/Ja4zWCe/2Ho/taVQX5aE?=
 =?us-ascii?Q?XKAfycgZtiGhqzO6WzOjSFl7QjP5KUGw+yOKt1KhFaomvVQer5L1TOwsvoLh?=
 =?us-ascii?Q?JbHL4U9Mq6Pktzp8VoOMSqIaorQQgZVHjb/pn4/waLi5q1evL44j1uLd4TCq?=
 =?us-ascii?Q?rg34xwBO5FOkIHMBM3Xz/mSn7uYkOXbq0VLx/M1GF4I1H2e2dEMqsXW7OqO4?=
 =?us-ascii?Q?w8uWs7YwPqX6cLF4cDpD/8T/yOcH6GylLk2eNb1GxEqJRi3wPkB1eOZ92/6P?=
 =?us-ascii?Q?hoRnZsMEo7kUA0Fgbd8/1VEQr8QsKGUC4t0hgGVvLrCLkkHkQkDM6wU3kD5e?=
 =?us-ascii?Q?z5o4pwhR7E3f2WYhf/eFwByj0bNpDop7PKqfPAiaz6Kbihd7YN4U3WPV2QuZ?=
 =?us-ascii?Q?LBgLqJtKl6U/wQSUwpmULpEFwu/KppaTZoqzUSlZj/syNxOGxpdJy8o9zHzK?=
 =?us-ascii?Q?P4N7Qfunqoxyk2nsTN94oGjis/K5ISDvrsUiJSvK/y/JzpgRgq8qFsL8VeRT?=
 =?us-ascii?Q?QgdAQ6L887F9LfOBzqyraT+7W0lrXB/3I1tEuGZJpz45+ftwUji1iMrAV2AB?=
 =?us-ascii?Q?OKN4AVK9NMga4L1VMdLx4nRfeKLWyL7IlMz65LohEHGeWDBTkad3cBrLjrpk?=
 =?us-ascii?Q?tsrYKr+U49i3jQCgnXfB9v+MdEw/AsmsJLKZUm6JKia42hkz90/QNBhQumbc?=
 =?us-ascii?Q?favVRNBjErjXFcYqmU+3EjrD4HpG38o12mCDlDgvwxnXtSWm27yraS29V8pq?=
 =?us-ascii?Q?ebNkVrLsDxriT2A+TmhAE2a0e9CJLsur/VIdLhPS8Z74PdYyFf+8o5NA5RnS?=
 =?us-ascii?Q?2/Z8obwM/eYKKJoH6NIj+8Ew1RUWdkV3ugJjLUezWyi1MGwQ6JJ8i8715HPO?=
 =?us-ascii?Q?qv00BQCuzllpH4wUTwM001w=3D?=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e3ba51-4573-4db9-16cd-08d9e0032e64
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 13:04:11.9658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEAAqZbPeQ4HVZRlxzZmb08RomL6xpTbe58cHKSNpY2vQaKPfjBOX1keZiASS1lPYPHcIrcWq9AGAAizVlpkUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P251MB0498
Subject: [Buildroot] [PATCH v2] packages/nodejs: install npm packages on host
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
Cc: Tom Marcuzzi <tom.marcuzzi@orolia.com>, Martin Bark <martin@barkynet.com>,
 thomas.petazzoni@bootlin.com, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Installing npm packages on host allows to use JavaScript tools that
runs on NodeJS (such as webpack) to build web applications.

Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
---
Changes v1 -> v2:
  - Fixed indentation and help in Config.in.host
  - Corrected use of BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
  - Rename HOST_NPM to NPMHOST to prevent check-package warning

 package/nodejs/Config.in.host | 32 ++++++++++++++++++++++++++++++++
 package/nodejs/nodejs.mk      | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 4ceaf0c73e..0b67a59c55 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -16,3 +16,35 @@ config BR2_PACKAGE_HOST_NODEJS
 comment "host nodejs needs a host gcc >= 8"
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
+
+if BR2_PACKAGE_HOST_NODEJS
+
+config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL
+	string "Additional modules"
+	help
+	  List of space-separated nodejs modules to install via npm
+	  on host. See https://npmjs.org/ to find modules and
+	  'npm help install' for available installation methods.
+	  For repeatable builds, download and save tgz files or
+	  clone git repos for the components you care about.
+
+	  Example:
+	  serialport uglify-js@1.3.4 /my/module/mymodule.tgz \
+	  git://github.com/someuser/somemodule.git#v1.2
+
+	  This would install the serialport module (at the newest
+	  version), the uglify-js module at 1.3.4, a module from a
+	  filesystem path, and a module from a git repository.
+
+config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
+	string "Additional module dependencies"
+	help
+	  List of space-separated buildroot recipes which must be
+	  built before your npms can be installed on host. For example,
+	  if in 'Additional modules' you specified 'node-curl' (see:
+	  https://github.com/jiangmiao/node-curl), you could then
+	  specify 'host-libcurl' here, to ensure that buildroot builds
+	  the host-libcurl package, and does so before building your node
+	  modules.
+
+endif
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 727af6dc50..8a4a2ff0cf 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -10,7 +10,8 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib
+HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib \
+	$(call qstrip,$(BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS))
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
@@ -96,6 +97,35 @@ NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)

 HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1

+#
+# Build the list of modules to install on host.
+#
+HOST_NODEJS_MODULES_LIST= $(call qstrip,\
+	$(BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL))
+
+# Define NPMHOST for other packages to use
+NPMHOST = $(HOST_CONFIGURE_OPTS) \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	LD="$(HOST_CXX)" \
+	npm_config_arch=$(NODEJS_CPU) \
+	npm_config_target_arch=$(NODEJS_CPU) \
+	npm_config_build_from_source=true \
+	npm_config_nodedir=$(HOST_DIR)/nodejs-$(NODEJS_VERSION) \
+	npm_config_prefix=$(HOST_DIR)/usr \
+	npm_config_cache=$(HOST_DIR)/.npm-cache \
+	$(HOST_DIR)/bin/npm
+#
+# We can only call NPMHOST if there's something to install.
+#
+ifneq ($(HOST_NODEJS_MODULES_LIST),)
+define HOST_NODEJS_INSTALL_MODULES
+	# If you're having trouble with module installation, adding -d to the
+	# npm install call below and setting npm_config_rollback=false can both
+	# help in diagnosing the problem.
+	$(NPMHOST) install -g $(HOST_NODEJS_MODULES_LIST)
+endef
+endif
+
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
@@ -110,6 +140,8 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(foreach f,$(NODEJS_HOST_TOOLS), \
 		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
 	)
+
+	$(HOST_NODEJS_INSTALL_MODULES)
 endef

 ifeq ($(BR2_i386),y)
--
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
