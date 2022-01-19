Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 14:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 608E582978;
	Wed, 19 Jan 2022 14:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pKwFrByAept; Wed, 19 Jan 2022 14:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9897F828F8;
	Wed, 19 Jan 2022 14:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA3481BF39E
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 14:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B66F98280E
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 14:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Toz-6WzVwsA for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 14:06:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03368813D5
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 14:06:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFz76yyvm0GltYvY1UgMMEg9VBJ5j2WxWRD9JLSxEFxG1f7J/szM9Pe8m9Piozv4BmavAJ3d6HkcCZiS31p/mMi9wiZs9vdmUfwVBsiebdIpw6Hjim+0/fsjIkSA7w7CkSorE64crG6+Hv2SDn7ItQA5joSx2xpVXccmjwPwXm4PiFodqr1hT/EFzAfLsJwJ9FKS92jHJZpkwW/xpbhi3tvvCqdus28b4qDpx0xk4wHuOmchKgUBsUSMpYkjMo2R1ueFHlAzws4xiz0s4k3x0boTnXyLVXpCIZuCo89M2cLht+2b0hsuqMLeN2jClwraEZszuavmgPH6BzYFmfT0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEWhWcXkE2KazCKNyLUoOVHZXmGQBqlYndY8B2vNZc8=;
 b=AzBh80FMDxMoC4yaWvMxVBwfxLCzgioEHZ3d1QFXCq91Eg0G3PE0Ys8l12a3MV9Nh6oVbpgasPrT+rwE7ntYI6oLCJfnGqz47Z+fFwGvlVB5fNbXK1evDFgaQfizBZ1feiYsGrrOb80Ez5zkM2SskWdXr6jd93Rz9iVJPAJZysxo/QYSxaIteePDYaXVAWXUwRJbY/PjP4VSLp8OjIifDhr39DFyIJeWjKGjEiI/MrUKEW+pupTdT8b99Id5vitSVZZMcAJVnBozYfveqXbsJuGomuSK2/1JnvOZyoTdlstxwIusa8MqIMPMQdSKagHQP9XF4PsbB4f0bhZ3DP8NPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEWhWcXkE2KazCKNyLUoOVHZXmGQBqlYndY8B2vNZc8=;
 b=BihobhHBvqUGexcBQyOKdjjHD6l3b6u0o/TxDL+gxoOd+ZyD09yBV/zDQ47+iZTIKNyB1xEwD0hR0cpDhkRa8aLXR4woPXeYRJL76MQibjQqXjmKB9GlJOD/9+XYDiqrjIVHbwBit16gn047GURh8rsnDlexCx+S5JE9lZRmpu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from PAXP251MB0422.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:289::21)
 by PAXP251MB0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:1dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 14:06:16 +0000
Received: from PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
 ([fe80::405b:6f11:2cac:c755]) by PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
 ([fe80::405b:6f11:2cac:c755%6]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 14:06:16 +0000
From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 15:07:03 +0100
Message-Id: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: PR2PR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:101:16::35) To PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:289::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e55e8d-9ce7-461f-1187-08d9db54dbaf
X-MS-TrafficTypeDiagnostic: PAXP251MB0027:EE_
X-Microsoft-Antispam-PRVS: <PAXP251MB0027C26AAC0B993C24769096FA599@PAXP251MB0027.EURP251.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+zwcwpygIn5YEcRXQz+utNlnvXWfhOtMo9Dsj3ZfYQvasGxDsu8XHzLFXbYkkELuowOK40oWALoiHICADOtdyhBk5zxHp07KaYLdU6NRTUICgsDitc/dRN/72hKYDXtal4RmiUQWElbKjVTxTkyY+cDrAv+3K9PIGUVgcPRFYVmAVT0ArScQGHCogk7MWdWGhaPnC5zXK0IA58EjcKbZGwNLA7gq7zYcunzSVlpEyqFPUBrP8XgGi6y5fxx4RXd0JFPyc9wZX5yjHXaDnAbXfeF8Sc7Tv4RIxvHmjmxTEQevI2mgcOC40MXLzX7ZEZSnnKQLEr2GJAmGBe7TkenjJEaYYFMLhU7ywWtA1rhRbMHaNEuPoxtjN6FBuc8tHUElJSPpCXTPcgCvUYG8wsLNTLx1dYsVDQ7eGRwsdsJ/vNPwL9fuxZrLKfcj9OncjzlRCJjjLpTKExcqdEfWnZvZTda+0z0vExEK3f7udp8vTJOrdhhtGxWxfS3KsrT/iMSKh5+BPqhpq55fq1OSglKm5zLGt4msnUqI6UWfhH0Notq+zF2QhyclXKL2atNbi73bem4I39faHRzMplkYwj4rqi8sdcsBHzHw/cwy9Zk4qo33NF+7Ql3nwMJdxkKwe+HyNohsjQ9jxcb/mCMxKI8vNFe7HgpvpoWarIQijOkXRnL2jTIKObn8t000uRPtqZW5v4UVF0KRLfczPYYuzPVeFWKTmvZ4+6NirI0WMWCH4VXvH2Myk7akd/wS+Feh+2aMMjlRSWHWId6aeANJPc8z3NT/3Mm2UPN0jx5z/NiG+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXP251MB0422.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(5660300002)(6916009)(66556008)(36756003)(66476007)(66946007)(316002)(86362001)(44832011)(54906003)(26005)(6506007)(508600001)(83380400001)(38100700002)(38350700002)(2906002)(966005)(6666004)(52116002)(6512007)(2616005)(4326008)(6486002)(186003)(1076003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?niLaBBBxgLsz/vOY49b8GGMTv4LgSY5hu2ML62mmayhmLWUZlVpdqxCcxMab?=
 =?us-ascii?Q?dyOiVJ9zpvDZAe3aq37V4cZEhdc9bCAko6W94Bo4kAFSTJbVzwLRsu+DbMob?=
 =?us-ascii?Q?h0ndaSQ6y65DkR6eKxYEeV+qGleYBoACx7fkJw/eR8xSwoFo+0gkL9Ou/4Aq?=
 =?us-ascii?Q?UKctEAAJNIopmETZRe/tEUuv9nCo2+DVS5bmUaD5JG46Adn2oPh2tCB69nPd?=
 =?us-ascii?Q?qQyLkMVvAkl/AtM9vQEZ78i1PWNYxE0ZemByYEedKLFnVhzjmyVye2FMCLBT?=
 =?us-ascii?Q?mMv6ytRTEV3NO/MxEytpdUSSm7RmN/2QJE+8Rv3Ogrs5os/3kwv6dg2lkL72?=
 =?us-ascii?Q?fxEOgqEDdA547Lze1cKNUSxK0XBjf4syiKTS8BZTBTpulxFNX0nP3bgkPoez?=
 =?us-ascii?Q?hrN0pjwv1LTxLUJbC53H/GWdjekGo7ELK3lwLqg5pohJrjxN+9LrrxFWNnXT?=
 =?us-ascii?Q?PWXRSoQ+MmVqjmEPHIudRCdoFyHhwaZS6J+3B0RoKCWepZP7Dcof8CTH1BRh?=
 =?us-ascii?Q?ANk8BwziqB8nun+F5FDAmE9CXmjIj5+T5ALWGNmsTRQ+Fm26YCSMBxR3u9uj?=
 =?us-ascii?Q?pXloec37853qjo72fo/yJo4et/dy9o4r/fa73f0+zX+j/KwC65Doj0F6sacd?=
 =?us-ascii?Q?uW8d98ZXipddYUQ7yClmcc6hL01Jd3Vpt6HRzpOj8tNn28KRZDVNkwO56Bru?=
 =?us-ascii?Q?+0Mx2Kmj9yAptmfCEdvpZ0f0LP/TrU5YtwJW8W+3j1qNrMVxQ4Wou2hoJI26?=
 =?us-ascii?Q?BPGtS7ro73rX4eFXgPnS42PwSEfgHXt1pi5xBJOtC19FMiVR46x5lv64xu3u?=
 =?us-ascii?Q?XROqMqqfFETzGzjmcgkTe66G4SXXnrPcS4xjDzvyJS9DbVWWATaxv60NOSaP?=
 =?us-ascii?Q?7dhMff0zAZaWo1cyrTkJxw1nLd6LsnMisg42TL+hTQ7YqaUBsxvvAnn7V9pg?=
 =?us-ascii?Q?ofaAn2VijgjX5pZU5wgZnvZ+gzYKAcHtXF3PDKr0wlnk2IhKjxAsKTwmH95T?=
 =?us-ascii?Q?pg0n+5o6Fqcz7QiYeTnD46joaQJLkGNaRXnRqVUHjyWWEcPg4bMo6kdoXWwb?=
 =?us-ascii?Q?rKz2GxGuzuH+ogBoA1jpuaSclraloqXKlUXK1zSQiYURdpSsb8tWnMjrD2Cb?=
 =?us-ascii?Q?BdnGuP9glQ0qw5bwDbQ2DGU17F1hcsSp6gTHwAsSYYhKxD7X6/pMi4iD6vrd?=
 =?us-ascii?Q?TVWWuFPS6F519US+CNU0lGC1c4+m/sD6lIv0tXv0tGoifTYgWtzD0F7jzqGq?=
 =?us-ascii?Q?X1EFZJv5asXZkS0NQXLb3nP6LtZfH8fmwcPodwlBqrV4rM10LAazXhR75H1f?=
 =?us-ascii?Q?TZ2mf6A/d5GT6mJOXrn4/o2UEa6zK4f4cakJiduW5rglt24+gJoQBVD4cP2n?=
 =?us-ascii?Q?GKQOuaigl3nCrEMLHcO7b+FSKfPBYjtCJjyvjMYV+FO4EgqMTYlVRwQHbjs0?=
 =?us-ascii?Q?r2dR/q4ri+1KQQv3kZP3owBQ3LvOg2ZcJssua6DIOCTG25SplsrV2qtqeFbA?=
 =?us-ascii?Q?EfhT1B0RkyIZARX5JJ3bIt5tWBpzOPfOaLsnMcpz/DxNqlcsolohI2G4THGR?=
 =?us-ascii?Q?itiCevSOLOrkAHFWsvOmAVw16vtnV6SxKDgWUDRGJFTzCyKXxWDrH/qjrmIL?=
 =?us-ascii?Q?reS5k3hHuwWOznhUWYMbpt8=3D?=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e55e8d-9ce7-461f-1187-08d9db54dbaf
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0422.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 14:06:16.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IlUt1s6fS7oGdsbn6WzWlbhXFkGSFTy/VrSdgeTcuDltuL0qAs9Q4TLmQQTmOeAgGbNGQFTUwEuesHBapskhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0027
Subject: [Buildroot] [PATCH 1/1] packages/nodejs: install npm packages on
 host
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
Cc: Tom Marcuzzi <tom.marcuzzi@orolia.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
---
 package/nodejs/Config.in.host | 32 ++++++++++++++++++++++++++++++++
 package/nodejs/nodejs.mk      | 31 +++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 4ceaf0c73e..601eb6e052 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -16,3 +16,35 @@ config BR2_PACKAGE_HOST_NODEJS
 comment "host nodejs needs a host gcc >= 8"
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
+
+if BR2_PACKAGE_HOST_NODEJS
+
+	config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL
+		string "Additional modules"
+		help
+		  List of space-separated nodejs modules to install via npm.
+		  See https://npmjs.org/ to find modules and 'npm help install'
+		  for available installation methods. For repeatable builds,
+		  download and save tgz files or clone git repos for the
+		  components you care about.
+
+		  Example:
+		  serialport uglify-js@1.3.4 /my/module/mymodule.tgz \
+		  	git://github.com/someuser/somemodule.git#v1.2
+
+		  This would install the serialport module (at the newest
+		  version), the uglify-js module at 1.3.4, a module from a
+		  filesystem path, and a module from a git repository.
+
+	config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
+		string "Additional module dependencies"
+		help
+		  List of space-separated buildroot recipes which must be
+		  built before your npms can be installed. For example, if in
+		  'Additional modules' you specified 'node-curl' (see:
+		  https://github.com/jiangmiao/node-curl), you could then
+		  specify 'libcurl' here, to ensure that buildroot builds the
+		  libcurl package, and does so before building your node
+		  modules.
+
+endif
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 727af6dc50..a342d1c90f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -96,6 +96,35 @@ NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
 
 HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
 
+#
+# Build the list of modules to install on host.
+#
+HOST_NODEJS_MODULES_LIST= $(call qstrip,\
+	$(BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL))
+
+# Define NPM for other packages to use
+HOST_NPM = $(HOST_CONFIGURE_OPTS) \
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
+# We can only call NPM if there's something to install.
+#
+ifneq ($(HOST_NODEJS_MODULES_LIST),)
+define HOST_NODEJS_INSTALL_MODULES
+	# If you're having trouble with module installation, adding -d to the
+	# npm install call below and setting npm_config_rollback=false can both
+	# help in diagnosing the problem.
+	$(HOST_NPM) install -g $(HOST_NODEJS_MODULES_LIST)
+endef
+endif
+
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
@@ -110,6 +139,8 @@ define HOST_NODEJS_INSTALL_CMDS
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
