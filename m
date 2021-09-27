Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DECC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:18:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042F860E8B
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 042F860E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB0244020A;
	Mon, 27 Sep 2021 09:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id movDZQZF19gs; Mon, 27 Sep 2021 09:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB36F400F5;
	Mon, 27 Sep 2021 09:18:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC41E1BF29D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93BB4400F5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icZdNYDFg5bK for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 09:18:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78942400DB
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYn/s5bJPBc7iSv9VoLUOwNcLj89TfozZWESEMFg3u/iA0Nb3L9MYzScvi71H6J5LqVVfNTklder0vzXjqvUGqITbwcI4U6F+DtZP1RquBOgt7EtwPlwxomfZz8O6Xj+lvjso2JfTL4VR8rLqm4WHcj2baHL5WmvGvAaMZxow8qV+WCJK8877M+TOwpfTUCwAIMBYv1kSXinmS6DS5D15pb4JA820zhrGCcN16OZZ4B0LZ4R3vtC8iUiT3peklG8/b8M7uA90bupi2CeIdoYHOmaa9G8INbjCFvMP7mfYqi/sbH/6uUUtNjYF7P6hKT1ifJZPFIxyfnBINCF8o+ODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=coQSNrsO6YU9rmjiK9g9OCQvI63ffC1XsLFfIy86fh0=;
 b=NEEUXzfGh8f29Oyh6RKzdq5XEEO5FJt/pRZlRu62xJT93mvC3cwL57uXVQNxuNA44RG7mGp9E9mOnAU6lW2swDCkiYVRErvtsvvU6dmtOX6yFCrDc4M5/v7hHB/KiZnRPqeKOwUZi8lLtezTcFZ0/NYbpjBaLqSIGZ9bov916LDaG/L5CVoqArzv3AxNn25K8xcYN4tU/SBnuMLW9mPtkJ7qmhpjjJJToqOJqw0+oDXokLT50KUTBDHfUScjo8msoogmP/Vrf2iGUarO7bWf15iZEsNmtMJfb5gRjsFVGC8DvpgosmkdKwqzEQ2qxBr/HcjWRhhEA2KhHDz3y6iB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coQSNrsO6YU9rmjiK9g9OCQvI63ffC1XsLFfIy86fh0=;
 b=L+bidqQ5kKD6lzWpuNnVNSKfMesSQ4GFLaRnsJ8pAskaKRuay+ZRARwB8oZmxu5TnCaknh0sTOq6ACgLtSJDNJIchLrdFOOEz77F91VaLj9j8J907QUVs43A38cH5LHfdKZcueJk9r7UN4ZTbJ16m1lUMZ4Co0YJYtHX14K7D5U=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB7681.eurprd04.prod.outlook.com
 (2603:10a6:20b:286::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 09:18:35 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:18:35 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 11:18:13 +0200
Message-Id: <20210927091813.3730562-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: PR3P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::10) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 PR3P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 09:18:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 721b37e2-fe09-4e25-9507-08d98197c839
X-MS-TrafficTypeDiagnostic: AM9PR04MB7681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB7681B3AB3434AFDC69428371C2A79@AM9PR04MB7681.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elrexXYzSGjikkR/bMwWDOCCgkffqNQqAKmBpyFotx6jy3+g1EP7eE29aPkNX2oPrdUYr4YU6Fq3JpY2weO35gNH/Bnwp4vQuCEcxWnLvfw6MiOuiF2BXgMjNKbGeviwm/HTQj6JC5dCRN9TPPhPb+y1Ays7Sn8xMy+id/Wu/sWR0jSjSPh1e+uENcY5G34+MVJcv518Lw7UNun1lmdHMtdFSsWemJVTL/R8Gs0m5cTJw8x8VwQPK8KzqdGifxpWv/FulE77kguJNDb54IT8inPu3qeYVIOih1K68/VxWeSzpTkwJD0V1yVtJ152+pEYKDbK5t4SVToEj5eDQCXtRcqo1i70wABiADw72xgrFsQjHP3g/luDR3zCYK3Obzynt6jTMpt69tWWp9YOwsPliQLCnev3MLt6kPxb5jqHs/HtFBpAXw9R1lzJk7IBMSelTLdmrxKxsSHURfsrD4/22LmCT6nKxsY1WhgBJTd4kqReCEiGHF73Yvk2jVl1c9kF9VkzvrlDjYLeDOrDOJaLOhPxPkxEIezi8pV+MuKb/v2SqNRzcJj0vLM4AvyD02lq/zMxnSjsp2C69azGPyjQZGHpi2xyJa2+tfEOmytTh6uAVwDBPBWDunDRUcDsh7OOjsEldoDO4KORKuOVsVRrLh3y7cAdGH8mReTMVgNIRuL2blLQJRAHHO6RxivlCbeB7FB7XL+FQAsrvk3XWyJQog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(66556008)(107886003)(6512007)(8676002)(52116002)(4326008)(186003)(8936002)(6916009)(6506007)(2616005)(6666004)(956004)(26005)(54906003)(44832011)(508600001)(316002)(5660300002)(66946007)(66476007)(38100700002)(38350700002)(36756003)(2906002)(1076003)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPpnW5zdc68B+jU91lU1UJQIr8YroFI6d9w0r9qTtNz6RkYSdYcZDjwNHO/G?=
 =?us-ascii?Q?EhyEwiYii62Gp2Q9gTXIWSo+kZIGKEDWeQk/DQ6neM0+SyEhBnVHWhZqe8nS?=
 =?us-ascii?Q?f8NBnZS0LhwtPIEuSdTIcP5xwSiORx7tHM6G2kJgsT/qxTv9sU5etlPHo0xE?=
 =?us-ascii?Q?8YQEhnYIghXOibutQLNuk9xpwarJ5aIcVDC8YsYCYRMeA2Izg3+9mLshvlih?=
 =?us-ascii?Q?A9ZsccE+muPCYvpYM9dH6t2g2gGiken4fK+FpiEhn56WS6ELL9Ru985qFbiO?=
 =?us-ascii?Q?dAV2mBFSwabfuwpeYCGfFjEyJgQ3YNPvXePqCEYSNx+euyjPqOvSnJj9ybrk?=
 =?us-ascii?Q?0F5E9uH7YsXBEnC6/VHpm0Zn39BSb4oB2cz1X48DQStqD8bUvTOHXJND0trt?=
 =?us-ascii?Q?hN8VrGgOZ/Dxt59TTP8NEUa2gGyqzm+BkYGIsBthQVZGKJdq4F5gyAkA/Nky?=
 =?us-ascii?Q?5ESTGzI1dSiqUkVAofVoCpX4rSoNpJ/2QebI4q3vAuviTFAU/VO0HqDXrNhC?=
 =?us-ascii?Q?ks7XXlgYEUIGuq1tZDyYEGaDMn8PqZ6wkhkzeGLLoaUgY+WBkZCd4NVHc8K6?=
 =?us-ascii?Q?W9gl80E6E6D7MK7MdT8I54QV3bR4/rBtawoGByiFlr7UaJVG0C/MSXHVzBSr?=
 =?us-ascii?Q?E/BifBdk6HsZ+4ZIbdBM2wuvGvqxXFYlYyVnskM/JoMDoom4a+T5ZzwSK1Ws?=
 =?us-ascii?Q?oT3jSwUhz3TGhVAn65c8X/BwfuMJjepWCRtIyMI7xD1NqnE8BM8u6SijQ9mC?=
 =?us-ascii?Q?VMXO/DvN/0maV3kxDTvK+gIjn1896QyB0bEkax94VOALOt3c8FzGTKKW4tU7?=
 =?us-ascii?Q?VSVxCWFnn7O8wTw6f1+TCy7cBZn42F4EgKOi0pANDF+uFBOOseszzYy3nT4a?=
 =?us-ascii?Q?EojoNfZSKmGkU+GfiDN1jTPtlwPIon67FywACRT1vT5YN/OZrImb9coJ986L?=
 =?us-ascii?Q?dcUnxp65tbfAJb7/LXs42w2dqrPYgLni/WCVpz7ho/Wu+QfSmvBycBrJLhXK?=
 =?us-ascii?Q?EQqkuQKE62i9yV5c2Bbll6YLq3ilqLI82s1x8NNPDkwXXFlOeh7JDyhGdBeh?=
 =?us-ascii?Q?FqV3dwlK2PcM7MZtCbTQ1yBMmLH5kJunHIS5dU/NoGiqxoKuPsOSjfdBLhwV?=
 =?us-ascii?Q?SY/vB7F9DQJUKjH1JIfZ3hwXqMfxdBIHlyfuhXjLJzNQqUzKZ2o00pB9+vGs?=
 =?us-ascii?Q?A+/PldqFTXCscnuqg0zepzDl3Sj/EcjBHyIZI47pYEiidyrDDkbBh4YMR2eZ?=
 =?us-ascii?Q?7UWGCBYBIhPnwQv2ZyCy4Qggg2BrHHCVcSm5AnKH+jtI1FQN2MikfglUJbkY?=
 =?us-ascii?Q?l8bZjFNAp8bfqTWng12/hUUg?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721b37e2-fe09-4e25-9507-08d98197c839
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:18:35.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnGsTND1cifDmvhNUpeYDNH9Fo2ZBaPWRyXD2PoRaoopr+c5JulCNcaitl1Wc0ygsH+hDhoi33s7ff7NTKicoKCHS31a5O9QfC4CYNZafhtu/pJfIPuiRyqjHxy9Qgu7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681
Subject: [Buildroot] [PATCH 2021.02.x] boot/arm-trusted-firmware: point
 LICENSE_FILES to correct file
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v2.2 release (commits 8cc36aec912 "doc: De-duplicate readme and
license files" and 9f1622b018ab "doc: Move content out of readme and
create new index page "), the license.rst file at the root of the git
repo is only telling to look at docs/license.rst file.

Let's point the ARM_TRUSTED_FIRMWARE_LICENSE_FILES to the correct file
and modify the .hash file accordingly.

The comment has also been wrong since we bumped from version 1.4 to 2.2
in commit  a757d173f179  (boot/arm-trusted-firmware: bump to version
2.2). Drop referencing an explicit version, so that is is never wrong
again.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 970613f38d..9bd17a3cf8 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4bfda9fdbe5022f2e88ad3344165f7d38a8ae4a0e2d91d44d9a1603425cc642d  arm-trusted-firmware-v2.4.tar.gz
-sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
+sha256  13676fa9170d3e6da3f7562d2d47b8b71090b1b45013fbd329ef847841f3a0b1  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index d6979a12cc..cccdb3c522 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -18,10 +18,10 @@ else
 # Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
 # The licensing of custom or from-git versions is unknown.
-# This is valid only for the official v1.4.
+# This is valid only for the latest (i.e. known) version.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
 endif
 endif
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
