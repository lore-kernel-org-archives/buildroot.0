Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE23DEF36F8
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 07:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD33A81A18;
	Mon,  9 Mar 2026 07:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSvVzhibS1GI; Mon,  9 Mar 2026 07:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0176781176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773042711;
	bh=88nji4xdJnFzlCXop6NLlV6sv9E62/+QEs4m/AuiTEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=UiWm00eSGWgpzbboVqJX9BCddPX1RUF1QhNQPY3SQ5uNFJPecR5fB+4B3lz/xVwqM
	 ynptGH0RSY+OGdNiku5p/ge+NgRFvxBowJ8IvGSWvWZLtAH6b7PAFyJCNv/26BzRxn
	 ibLiWilSxe3vB4cc0fg4rfmyZghtTkn1rlI48k/7J/KjWEz0kKacYenPrxW3113Vhj
	 8Tnb2kPtnZfx05mJ2yovR3PIBMdbutNKOeicoQkVyvyM9KBy0qj9pJZvDoeaId6My+
	 yw+zfKZd6yISbREa1Lca7w87W458650qOTCb7lcztMNlCmMPtXQeARoCuFnMJNe5cw
	 2Ct69G6nTXmJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0176781176;
	Mon,  9 Mar 2026 07:51:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75138158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66CE840568
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhxIGgcC0Ilc for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 07:51:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 667204053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667204053D
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 667204053D
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYZHbEObdbSkIonVurnmxVNbN9btu2T+SIMwFEMBX7S3e09nMvbo9/WyTG/sJqV0z6bs4Tk7n5+iQ99pH4pubQCzwn/M0XrD3JfPrf/zzfT8qJz1GuPQPgTnbu6jOchN5Tiw7rNX9O/uKhB3DoIg2bI1jZNa047jaSaz6ypwbEZBZLdArBSBvfeNCfZc7Es7ux1x0LOAXoWDJZRS5KqqoIzgj1RRDqs673Gw5I41HycaFyzbilC9ocJ2wiMBOCV3l8pj9f9GDs76q0kFCz0A7NSlMO5+58jgqSxx00NBSo3VwN0HLZORvjdj8ZokjdVpX9DpGGlnnd+o+QoemZAjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqezlmmAUN55KDrqFfQ3YXTARs7oU54j5SdOwSpBuSg=;
 b=bdIBMNp26F2MYXEZ8aI4ECnW6hNNZdn6AQJgeEJLMgfTNdVvmKT9+jmwgrAtqbEKtvmPsL+U/VBiWvhMPjjQ4psa1NAsu5s4ncBXHCdJyCzlsljdzUzDuXRdPI99+Y67QANa5dmXJlKwnTuaamPXj6ME+/FPNVdrcl5LYDxjF6wONk32qRlN7hf5G4xeIvZAIJTVT+thHMZs0rLjlnGRWlMbiZyGpJ3NjGWJH7JAxKxES2M82HAjJMMtNRtLjtpcvE7pajNmTuoi5BGDOw+XlrnzVQ7dfi/Yo98HsvpMUghkQzVserTepj6FsEi1iAxfJFcWm1ct2lUWAiwqT2+fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR15CA0007.namprd15.prod.outlook.com (2603:10b6:510:2d2::10)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 07:51:39 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::e6) by PH8PR15CA0007.outlook.office365.com
 (2603:10b6:510:2d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 07:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 07:51:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 9 Mar
 2026 02:51:37 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Mar
 2026 02:51:36 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Mar 2026 02:51:35 -0500
To: <buildroot@buildroot.org>
Date: Mon, 9 Mar 2026 07:51:26 +0000
Message-ID: <20260309075127.801847-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd05104-2f89-42b3-c694-08de7db0b17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: zUE1F51ne8mLWYyjLUGugNVY3DfOhHDNgvUmAeSzQ3ZEfHNmCKp6MF4egiQTDLtvhaoP+KqGlzs2vDcoqeLE+cUmsXAaisI/10/Py5j5nnSPdHqi0S2T6oKjhRWk8XfwmC5lKTebowLieElhykMNGGKHdxAX1mw9amC5URgPlcM9D32gGHFwwwuif8Z30ryxJsVJFYi1cJg05XiwJhDzHIikB6dZ+Jlit+LOMSLYJLsbuzPQxtQQ+NohwFs1RUyMYmEz2Yoomd6r1awYuvGOwfEYQZMCCA3GvhERrQQehGG/Y3XqgS4xtBTSdKDgBtJRbKyiDQyTW1612woynNOYUuXgqLLI/YUa7OoZXbv6urhnOyEeWm08sXTwQKkfAPfOXRXvcMIVQcq9uoNZ+sWzun/4uEnbV2wTn2Aq+7iVV9Cw2Qi16YIIHIx5Ep0srDZnHmQo763FgxCaCP+GDpFL1LW1ryz9kLN/Rz3shxCswdN9Dqdd5K3VvsiuGWN4/WAOHwG6dZuSZp3+O86CKKaivCPhp0A4fc53iC4GH/Vq7qbhqwiEhn9Lxvv7NzGJBuRWUQTVJCrMBNUoW8qK0EBVihzA8dDUfm/aCnO6kQxIpIyznAfnkQeSWpgPOTrBlvxe6xzmVnKWJz8vFnWq5tc0u2pBBtc0CBHKAiI1MigIOf2iEkILeTMUHNIvNPYQutZf4SrdY7bKsRZ4xFe01et/9RgYpicSU9M03fgbpeEphzq23KTWHpibed6L9qwyHBzJgXpOyP+1NycAAuv7wBoWnnQBOa779D0W7MCQvpyecOuB434SJcWybhTNhUoKW/CspPHJNtx7AP4t0qEguNiJRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TMKDQrYg976aes6zitiTGQ9sQwh0p64GhUKj9osAH1bkOzVSWSU2Nn2ju5jHqoITdLjmHqPfZUV9sQEMXESzIn/LoCPN9GMODTABCXERis7jVbHTg54zu3fKgCSfpS8j5g9lqKi8PEeAfA7IDGIAKMGrj2vU6QHL3iPDy1oCnO4Y374G2xjNJVa8OottZwTBhb4UcYKUvBHsmyVM7JXfe45eOW18+Qqp8fnXGJsK9CMKMZ8obC11WNaZ5BtkfCT6HUJBaWQxFHC3zguzcY9IpdmNkkUOW/Y+jdhavvoLmBDh3962rFuoUu3eWFUNhTIvu47Lxa3xYbVVujMXihHwwRX/7lwTeegEdPainwTeVWCSyMqaloZYENNeQVJti/K4aXkKOglBZBk/a9mZfyrfBleo7GAm56NmgOKc4ylYr3dtiTqY1D+GOAENK5fVYCae
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:51:37.7848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd05104-2f89-42b3-c694-08de7db0b17d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqezlmmAUN55KDrqFfQ3YXTARs7oU54j5SdOwSpBuSg=;
 b=CCK1z+Rwrzt06o/OH0TVW+JLWVRNJXC07uK8dz8+mxg4O9jVrM1GigSaeiNeeVwXsKnGwmpepdfIkQq64v14DxdxHiRmS2P79ru3KmMf542JEHEgu8tMZezsLBWnXuOw35t7uoCyLQJkDoorgZis/tHwSEs/SraWcN/mhQcjfrY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CCK1z+Rw
Subject: [Buildroot] [PATCH v2 1/2] board/versal2/post-image.sh: remove
 incorrect $BINARIES_DIR
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove incorrect $BINARIES_DIR reference from the symbolic link creation to
make a relative path and not an absolute path.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V1->V2:
- Improved commit message
---
 board/versal2/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index 17746271e1..af50909fb1 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -3,7 +3,7 @@
 # By default U-Boot loads DTB from a file named "system.dtb", and
 # with versal2, the Linux DTB is the same as the U-Boot DTB, so
 # let's use a symlink since the DTB is the same.
-ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
