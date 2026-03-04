Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D959BEF8FE6
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 13:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7BFB6071E;
	Wed,  4 Mar 2026 13:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYHmKuR8Kbfx; Wed,  4 Mar 2026 13:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26E26072E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772631189;
	bh=4T2kOG0qNceK2M84DwhW1rny/Yo5vBm9m7RzPX0hbDo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IllC+1IHPszlrSLsg9G3rxPCIV9R3BVNYwdUDwzgYuYmYUkCDzYIscH5UOjNWlWz3
	 xVQaTpvX0l9hPwum6xRbwodyiuOZ1vk9LWIvagvPmZC7z9JNkgb0Ohw1OHGobNIC1X
	 iIuC3g4pvyACN0q3iB7GfchVS6N7HPssLL4WmuilVvSME/W5CFx8HyATeYkwk4RQE8
	 ptE6SLQgdkX4uyLL+GNoF7YOjmdN0+BwF70pTViNSscT6z2+T9XgvfQR8U43m335dB
	 PwlS9VBUg9TYrTqAl8lHtfiG/5L+DrZtD6/aCbhLVlEGW0Kr0lOIbhgbspiMtSq9el
	 McmZOIz5NSryQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26E26072E;
	Wed,  4 Mar 2026 13:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA0CA1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7D3A6072E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7G98-v5po5y8 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 13:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E14A56071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14A56071E
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E14A56071E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS9LUY4TGWGkgtvuCsQg2R3FuScjBBuf6G5UTKSACG3fTNZFeb+vCcbzzgzhkdV3DyyL1mtzx2Px62DQh4JgK/1M4HchlMOAe3UkrypWwC4U3mm7CYGktwAduRvyLe7HJymvO9dWty9xqhwlP8gzVbogyLwu+KOR761mh0olk8RzWxiL5JwcikYLZBd55gDH4hZ/ALnHRnRA488KwcYEMY/7etlhLpQwQvfBSRdIreoimfn/JE81vD3ZVYkgQTGBaU7ze41e1ATIq5y6EJe9wfUJ+XGusQ8bIikhVV8T3FiNob04o8x+onPbnHGdQl6fDXTssowXtKGQdtP9VHSsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/+h/zPGmMlMmkrCApiNeUoACU5O0WCF2Rikv14KQ68=;
 b=uhafS7QI2MqK5IqWfiEGLd+d82wZdHeklLxjNQiYIM64pvQk4Ka/52/Vmb6w1RQYZiAjlqr4BCXhVpFqOvxAMTXg6pGyakhijMvRAJZWFBwkRijSjazd9eNrXnObSH8HFJ0V9prbew8d/TuL2il+UMAWpKj1SzQHEV8mQ9q7dJYclsg7s4RlWBg77Ixd9yaqiHJUK+i5CRYw9bv0AZTgewV8MdZgsycPKoyO+4RBRRHLwCGVikOPyToiE1b2Zvi448MkuS++73JbbSnD2oQAUu1FCAfGhB9r1rZkH8IxdTBhPCh6TfFEU8ilSdubTZn6wzr1fBhR147uKaYkmLO2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::25)
 by CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Wed, 4 Mar
 2026 13:32:55 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::91) by SN7P222CA0030.outlook.office365.com
 (2603:10b6:806:124::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 13:32:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 13:32:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 07:32:52 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 07:32:51 -0600
To: <buildroot@buildroot.org>
Date: Wed, 4 Mar 2026 13:32:40 +0000
Message-ID: <20260304133241.3389941-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260304133241.3389941-1-neal.frager@amd.com>
References: <20260304133241.3389941-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7b34f0-206c-42f3-de7c-08de79f28b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|1800799024|36860700016|41080700001; 
X-Microsoft-Antispam-Message-Info: UoVxLyUe7/k52o1XjOHfFTsWkZB8OM6rIXPquvqPwCULqmbSqGBOLuVJCA95PfCz6dGFjVNUjfg1QauYLF+q7pGcFiO1Fyqjtz3PP9Eo9qIIpTazvpWihAPyH9HxoNPWonIrDvN7ylfw0ohioT+GN0ixAilhPlT3k6pC6vuKSRdBhee+H0p7/njOWU9XPGEEKlJKiiOCZgFZ8pWkJQv9seBAFEt3ee9v4Tm0bsWETQejEmB83XECCxNO5nBQ3H1YQOYAKsNihMw37xjYb7t/r2Yu9q6BgXz23Z2mMg910nbviJ3cU+sXVasZfOHDZgMLNmyErvNNIdSzdIZQtmf1V6kxDJCRMTWGn8JL4pVWJwU64YsC4WzpZXbMEuV1QTKtq4ifRkCW68c46iYlw+EVBYyBfB1yU+2KIm+SIuRSIfWoP/VxjiEZWCK2qDigiWb+ASrB6EIuH09lHy4DagoD5YIZ1jEXUpMFuN2AHMXsmUeQ69SXpl1Coe/lmPp6Go9sIFNfkMX6SL1VMZW5aSe7MxDdbcwc57zHs2fi2egbYZke/VL6edh7YDmFb8lPdkYkqdXItMEOog5KwERToe+5oJpV1/Wdh9bJWp5AUigGEWUfZqpFS6IRR6GQbYKVj7H5OPFk/FOJifSfFPRR4G3CLpGa9nO79wzKm8xYo49F/QZhSgAuu6/RSprpcBz/3W/xjMydydDNzRXK+civEvkKFQFn8uFH7yAi3gOapVphB349jz4/1wD8f1lZx0d8bsgj8XJVcTLxv0AhDC/CgLNtHH99zGQs8PgWmTr8ujIDr3HqfxIB5hi/BK603pFBc4jTSBVW/Pr3bIdynwh8sudNlg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700016)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PMEgI+bRfeIWOsannEhb4Zgwz5lDJNx/c7YV58Sxpidc1FV/bQx6QLHe077Z+YApS8RRHzdX6aTYgyCXoMEKckXCwqYFXYYGW5Uw2ttDZyagM8LtdTsrG7UmkqIpmWH4vE6zivsNMKNGBXY33godEEbQSmnOQ0WnKQooyElr5HwaJynlPYh17VEasyijySG2dx3Gt3CA/LIWRUG2waXI0d1fE2OTw3skCcrqUNHdt35+syOsmxVjeP/WnflAJHjwNK0MKve11PjOo+QS0SJN5RTJsgy+pNCB3dsjvJNTX/q2anbWVYLnYLLXA/DzifhmeNERUH/94tAlzxGYqpUB26+7i0VSv3BNqv08UuecwfUBqyH7jtxX0lEVpFpV5rHM1Y0Ucw0+sS/j4sVr86gxSUp8lsyosjtpvvead+tYszBRlVqCC3ptO+nLyZ2dHtfQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:32:55.5811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7b34f0-206c-42f3-de7c-08de79f28b1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/+h/zPGmMlMmkrCApiNeUoACU5O0WCF2Rikv14KQ68=;
 b=Ed4ZGfJt+IeSUcHfZZ5GQg94DEVoEcTwsgLzlLeAj9r8CpOhHiFRwxBUSCMGqS2aQNb2AlTMdEKzrKIas7g8slhW81AWPI5aCHR3AEreHH142WdMxHJTsC30bZtmlDSvzQenq89J6G55W377AQ+n0Hhc8F/73ufybfVmzYj+RKQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ed4ZGfJt
Subject: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a zynqmp evaluation board
to a zynqmp custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed unnecessary $BINARIES_DIR from symlink source
---
 board/zynqmp/post-image.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..10a3c32b2c 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -2,13 +2,8 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
