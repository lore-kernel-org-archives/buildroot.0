Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF449C25B47
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C114F07D;
	Tue, 24 Oct 2023 21:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71C114F07D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTLtNX_zpHxo; Tue, 24 Oct 2023 21:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5E8D4F07F;
	Tue, 24 Oct 2023 21:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E8D4F07F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87F541BF470
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E2904F07F
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 21:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E2904F07F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pj_QWtqwQQoV for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 21:41:22 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::706])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8E654F07D
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 21:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8E654F07D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJhZIvCnzHhCcS3/jFy4LUFSLxKc/mF8PnmHoG0SlgJ/Wqpf5zAs6nmD4BzTYdXUxyz8e7/IhFYfMQeC8qjnrWFeDhKZYQ5ggoqmRpFPBMYU0E2GkvwyM2eqgMg/Jlgi3f/0b5jOn4v9oCrmGBE9/kCxNCp6BJem8rxq88Uz5nscn+eYEDgUTJ4ptywQoqgVdwN269G/7f7LKDv+Tic4PAQ7Rqo21++nU/rgcBw+I5yA+rR8TV3gO4mx8xfFLVUqYXqPyztuJe1/ZHtvCKNeUKBKkQHdBddwvcoUxrAvtNerOxEFOgWG8Kr5IrG0vGphWJqQLHer9v8ynHBjZZ4onw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLxwLsI4wQnMZidTQzNdQSnMvyFRH36IMlT0Kw+Xvi8=;
 b=fOOMENlFfc7mFK0JedkPfqBINU9F7lCUlb9SJAIiEbPjUgyDHC3+Z0rEsRILeEm7g/Lm/aZnRCAz1sV0pb3IdHTfUudNypwj7cbNU40gkR11tkdzAVqjBc3f6iVOQISqFQnz/J1puYMXkH/r2iTPFxb7athFvx/rPB1EZr9Eh5HpdInqwtbact6Sbya2RT+DC6O3H1Sa8l4b9UKwVQRKq4xfVOEDxxlNeFngBHIp13vdqcKy2PMDk+wUHNUwHU6BRZcwj3xK9crP9UK8X+qs8fIvEo0QswLdXlLBTWqMmdXT+fO7/VklqjWaslbn2npZvDUmbUCLE4+L+2XOOPjWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by DS0PR10MB6872.namprd10.prod.outlook.com (2603:10b6:8:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 21:41:18 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616%3]) with mapi id 15.20.6933.019; Tue, 24 Oct 2023
 21:41:17 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 16:41:08 -0500
Message-Id: <20231024214108.1602700-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: CH0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::18) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|DS0PR10MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a4adc2-2ce1-4b28-93d5-08dbd4d9f43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dq1sMkajJqM0Z/czP6qaDRGu0/bZwgPFqH8eP1EP4wwWcBnMGsf5lGLzO5e/Se14kVvDUmc/oHBonffyiTSCfC30J+Ak96GHLB0zB4kUrzhz4GLZtBqDIh1udnPH0LJ3wN+V5Zwfn1fD9HG4Q8DBixJdBKFoHgefSNVm22PL2se7YQp5e/LBDuhiXhsb8qBS7obH8cM2OU3o2jpKrTRklMiDgfpqIVpaFwDNQJzsQV34jI6UT/9dgdyzNE+3zhKDtTC+MO0TcIgmED8aTamINKsdnmKQ4gx1MIPjBWzLuvzmHzA7s9VFHPcUX1lt59/gXFdVgPAogNoh/kI8n+uPVUk+8OmYLbnuLg5qJF3D6k5nNh33vmYu46Dy3XONXb1ZXXVpZi1+P3h+i2gw1BfiIA8rjU1m4J5yWjlE4+GaPULSGUGhsRO4m25xFNJfU/2gVmq11YCc+Q+FlPStHVZ2fq5z1XKpNK24TdE+sIiTQNGPEoq5SrXEz55rPn64zd5AxSjjtXPAygje6Bz0IcbWkmWxGizqXCxRdAh6gXAzDQdWpaARwnShnqV+pkTs58yeve9VFgM0hD+LywuJC0cbzIX51Kbzm+193TcuaFgMMCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39830400003)(376002)(396003)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(8676002)(2906002)(966005)(5660300002)(6486002)(44832011)(8936002)(36756003)(4326008)(38100700002)(86362001)(41300700001)(38350700005)(316002)(66556008)(54906003)(66946007)(66476007)(6916009)(52116002)(6666004)(478600001)(6506007)(6512007)(1076003)(2616005)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5V3uDzv2ESUFglXMxXvLb6GJ6szYg37ql+fj0TWR5RINJGydEyhX+ZZIjarR?=
 =?us-ascii?Q?puX0SqHksEeTqY5u7lU91TnUOoIJhX+qQ2YNCdZ5dDRHHL3SevvAsXf/rKF7?=
 =?us-ascii?Q?bBL5QZVsdqvQHfmrTtvDcAl0GVIZ9G5P+VumU9kWK6fZg1a8cK0gSuawiqAl?=
 =?us-ascii?Q?n2qdjk+G9u/jTuxynBq1pjD85HRT8z2RsHFXqFXes0FZxXTrcewGZQYcXdVH?=
 =?us-ascii?Q?FdXwsI7FANczOMK8jyUqgtO+CjqJ3j/coMf432Z5r8kvs5y01m142s4C7CHr?=
 =?us-ascii?Q?0nq7TCfLshgn2gSGEpVBwbBZddUBvlqP2HlS5d3WufpsnmBHehCE6dnI03vp?=
 =?us-ascii?Q?nGngWj0nNkvkrkIB5LR7REcXNkBrPmGqyX2ybLhJJYVmJ4wVv5VtCQB2i3mh?=
 =?us-ascii?Q?lqGoAfT4cf8xphtnxKobi8nl4IlY/A07LLzntZdv8vTRXf+w9K9IM0DrP786?=
 =?us-ascii?Q?Yv+ELiYhuxtqF1MWFoENKYp+STPhHGW/j9ho5WPZOZRwXHbqW4V6UcSML9qK?=
 =?us-ascii?Q?GOSKbSXIn3WuaPpXoFBpqN8ybpyvrNG8klZHJweYLDortqMWRUYUuBSppfbh?=
 =?us-ascii?Q?dg8+42OPJ0Enro0qJipX94qzlyUszUccXlixVPLJ8zEPtc5rxNeF5djRyxPb?=
 =?us-ascii?Q?QO5+9UHbA7EtBJyeTHbMQgJmiI04qwq/PfTLPp7I2pOzubLu6Bit0If4JSzn?=
 =?us-ascii?Q?2R3ljBPN+UE1Fc1VWhKlDbQHG7li3IlqqHe4G0VqQtb+SnfIOUvifM+iIfjc?=
 =?us-ascii?Q?4upS+oSG5CTT4CkEtNOOH0C+Ye1SouFQ0iv/lvZK/xL/8NeRDFz8zpke1Xs6?=
 =?us-ascii?Q?L9zicSmdta9uzaSB23a77LEaGNcsH2ZXh/nemkkqINmOK+OgkzfuBONHXoWV?=
 =?us-ascii?Q?bpbh5RR0wWA16y9wGWmRWG3Vo790XQ3VbiVQ8ssFZHXwbivNp6ueWI/WMV2X?=
 =?us-ascii?Q?BgAkSr7sTwbbMkwWj60XyNrde3xqm6sWJpkkcXCmuHRtwhtL7f9pyvG01Ax7?=
 =?us-ascii?Q?kU0g93hKs9B7AKGrnBtTppsEEizYsJHN3g+BANi9b/31QHOyKzvfJbxMGeBG?=
 =?us-ascii?Q?O3Rc28N1PrFLVzO0WCxCi8gob9RG+wSceRLnPpYj0PL64VqwG2HboNbpvKIU?=
 =?us-ascii?Q?wMZ2qOnkfSZgzGEPg3XgLo2kIMEkJsf06pG2uixJh91FJaF3BXtjNYc+jwk3?=
 =?us-ascii?Q?PaFoxgTWIWXcFQChCJjakddJoHiZ0+6CLcalpk5qs5/GLxgLoSCisMO7Yjvh?=
 =?us-ascii?Q?eIKIQtbY9gYpehXwRnVSxdFrSuykHKbzrnCE97uqY6ClJ+3iZOaedQyS1gWK?=
 =?us-ascii?Q?Xzz8+A91So3WDjKwegXTTLkFexdeTw/bGdaQgArV4N7gqyovj3JslODe0J++?=
 =?us-ascii?Q?hBG8sWmrdeXdbURCM1VXQf5PcE8gVWvP73/jdGt3zwaIhKfFysG0OMDgVJKk?=
 =?us-ascii?Q?08zg/7/pAERNGgVYVGcgnJ7vW7JbzdeY0/zjqiOm9IajKaFV7LprXw4Q6b5C?=
 =?us-ascii?Q?p6xcsNLhMeXMMmI1J0xzw5HPKNoPWg1PrRpzdIsRK75sVQhMohqiSMicSiRS?=
 =?us-ascii?Q?nQ9tRKgLWsa3UMU5q3yyxfcEVL5tus211NLtPoSlx3DNQO/3LDXZlKf+/khZ?=
 =?us-ascii?Q?umh8NOgSrU1NnY7qccXNPhE=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a4adc2-2ce1-4b28-93d5-08dbd4d9f43d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 21:41:17.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Msve8snvq4LGY1qbJt9AL1eIc6SO6J5EFUIU2ZJI/HE6vgy8vVJ7OA2PLBe4aruGvLtCuUu7ppxGVyD+253z2/8y6LAkCinRwMSNBi+gxIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6872
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLxwLsI4wQnMZidTQzNdQSnMvyFRH36IMlT0Kw+Xvi8=;
 b=Z1EenO4rukL8Fl93NFqtOhSn5DqBsawL3JXy9lCn0zFzBayRF6mMSGZAnEr29UqAaMjDG+Z6LyCqYalqDmg/HBdLx7QR13PVkmRrG014s5ap7a31iMvl5KW0HvL4/50RQiBjSVokPUVnhGXZ7yvWzbGoXszv/iIIvsIEjNj9hDk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=Z1EenO4r
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH] package: python-tftpy: add python-tftpy package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tftpy is described as a pure Python impelemtation of the Trivial FTP
protocol. Add support for this package.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/Config.in                      |  1 +
 package/python-tftpy/Config.in         |  7 +++++++
 package/python-tftpy/python-tftpy.hash |  3 +++
 package/python-tftpy/python-tftpy.mk   | 15 +++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-tftpy/Config.in
 create mode 100644 package/python-tftpy/python-tftpy.hash
 create mode 100644 package/python-tftpy/python-tftpy.mk

diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..fa75fbdaa9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1337,6 +1337,7 @@ menu "External python modules"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
+	source "package/python-tftpy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
 	source "package/python-tinyrpc/Config.in"
diff --git a/package/python-tftpy/Config.in b/package/python-tftpy/Config.in
new file mode 100644
index 0000000000..ef21ac58de
--- /dev/null
+++ b/package/python-tftpy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TFTPY
+	bool "python-tftpy"
+	help
+	  tftpy is a pure Python implementation of the
+	  Trivial FTP protocol.
+
+	  https://github.com/msoulier/tftpy
diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
new file mode 100644
index 0000000000..86f0415cc3
--- /dev/null
+++ b/package/python-tftpy/python-tftpy.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ae359356106dfc4301e7fd66684302f7cadcb8ec9da7d10b7e42ffd16d611aec  python-tftpy-0.8.2-br1.tar.gz
+sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
new file mode 100644
index 0000000000..9479aedb3e
--- /dev/null
+++ b/package/python-tftpy/python-tftpy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tftpy
+#
+################################################################################
+
+PYTHON_TFTPY_VERSION = 0.8.2
+PYTHON_TFTPY_SITE_METHOD = git
+PYTHON_TFTPY_SITE = https://github.com/msoulier/tftpy.git
+PYTHON_TFTPY_LICENSE = MIT
+PYTHON_TFTPY_LICENSE_FILES = LICENSE.txt
+
+PYTHON_TFTPY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
