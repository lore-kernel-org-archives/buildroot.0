Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAABC5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D0180DF1;
	Fri, 14 Aug 2026 13:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id we_dmS1w3Q-U; Fri, 14 Aug 2026 13:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C63C80BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713300;
	bh=N6Abc2qnLAsows0BtWu60UI0AHqsMfb6xJAgYLa4ZZs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=BhRsfMbJcY/+cF8NQp/Np+61gJeLf5VFoaMh0CtoQlRbCssI1nqpGGTwOTv0Ris8y
	 ZUIvIXm/xQSTQUh3hPnIyta2SCH7Dpps7Nvx1OmrjBxy+mE47Is5gXMsuRReXazJQW
	 CM5xpMGpgyPNeMMWg/MzafffEk+2AckyIJTtfVogecVHHiDQZe8HCNubd9HXDe5Qdv
	 DDtnuTSn4L3SRe4e3NY8uKsM67ggutor4m/rJo4i2GSZp29JJi5q+fZhEK/fHfWmTD
	 KbFTpTaGByA5yOU+nalFcraLC/VKaUCPcrlj0o7ZeJ4rvHcAzB2+B9zbQGW0LBDILc
	 Y70MRRBZ5tdsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C63C80BD3;
	Fri, 14 Aug 2026 13:15:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 756441B8
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6775580BD3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QO_HWE5WjRUS for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EAAD80ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EAAD80ACC
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EAAD80ACC
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6GL31PSyAav+hUep0iBkMgj2vbVGgAWyrkK74O8yD2cAdJpMKY560NmxdMuctDbNG8rW5BaVjLyzLfdLbmpzcFV2LC0NEvfZBZ2VpE5ozOGLFLPp8AfpZnv+qPTuIpBc8mYokXpzD5NlsWg978Eh7nEQnPkGZmNKCjOWimzF+EaW7MjcAjhcFeWc54UlTRGkxZi/Wr1u97JzDkJAz+JJkqzNqbS8uH14AfRULnzR7xW2E0vHQlGkxslx4mS8FHVZ3DYkWfu2tzU2W0bn5JXcd3hghLpE4EaLzHKzLzY+RtbNPd+GfDn3gYKahTircazDiGOqESSmoq/MAtQF4qI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QIzS97me/eSiaYHE3bsgLkCrPXuc2WkuwSjelqpyu4=;
 b=E/kPgFNVHDgC5ue/vSK8py30Ej/HWvnUhVTJHoBptQW1aKVnOYcHj+aXTtc+DhEHUjVEj3yhiALr3/9qlnptqP2LQSgMD59OwYYYAp8WHmAaB3OGSFYfT/tRSgaCaur6q/rB4DXmmo8jKXCx4FPRK1B37Wz/TxslKnpoomXcC8s+vf7wYiP2tnLo8+vP8ZV6gzqUdEi3VOc+Rve8bH3n2zqt5AkoDvacNvCaVQSFTlUPh4oayV8e5GyqEJq4+1Fs3fEbqok6YMoQ/JvAQ0+KL5SsSsZyw/7lavG47L0htE1grTn3m0vVzOW+r6k3k6NF1QoQiW8NdYhH9bsDNm+sXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:a03:39e::30)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 13:14:52 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a) by SJ0PR03CA0295.outlook.office365.com
 (2603:10b6:a03:39e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 13:14:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 13:14:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 08:14:50 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 08:14:48 -0500
To: <buildroot@buildroot.org>
Date: Fri, 14 Aug 2026 14:14:46 +0100
Message-ID: <20260814131446.2547523-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SN7PR12MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c9e20b-39f0-48c3-fb1d-08defa0605ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|10067099003|13003099007|3023799007|11063799006|56012099006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: syc61Tml+8CiAkQ5H8QGAkqVbrME7XZqAMQyWyPsxMuL3WwF8snnw8Zmi0xwgdKxDXGVkFr4cZ4EXe7IENXNEikP0AD2bX6vgss2POZ/jtQyjXvQYwzO7FZE8qt4vSaBDzcnlMZVhGf8PxTTEgXATkyQGF563SflCbwpVazOp+z97+T6nzJRTHQL/TGJHRKQE9JNn3DVQjBodC6FePooRxzv96U53+azqOSj3vZfe36i8NBz/F0qS7/tKcmqx8VEfzEIwKErG0gn1f+6/lT0wwDhBa5QV3cVsdqepr3sbA6rs7/VFPoaCFS37ZKqiHG4xWNQAUmz3N0HfCuRqx5RjKhWHfCGYcoF9lCY7GCHnA3/vUx9qSYKFXWzf2i63Ki85aW1hukU06AqbLBbAVpxuxoC5ST6gMIyc4NUf1SrwNoTkjFkfNqU+pKZf4h4qVg9vsDvNFZmVSh59eDpZq1T7htGPf3JexM3rWumaITjugdKxid/xTN2ps7j0ltNIVDqw+WdILwSZlL1b0CSauRn7IdZU/hZn0Hu5z0UdVpAUwQyxNcdrOQekfRCcBZVPucvUlLsrFR6cVCTTELUCtXlzosxDCwV9/jnOZCPqc+GdUbUMngY+L+JE/FcyPJDn91fKAJ39Y45FXah7nvI8VsrDmvpDETofA7mAV18P6NRnjuy8RL98QxhXjlP+j+KEM8H9BTvnhZuGrDYhN9ft4ME++lqFAqbjWIXiMw6nPOMadrxUIu8fzSFUriCV4/+eJy23qNPPu7NX3Zib8Wm9OxTSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(10067099003)(13003099007)(3023799007)(11063799006)(56012099006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +K0ZdlJrnFipWAnoFy6aw4EsgoXfSjVjfuGkwxuc7w96pNtFPGhvIJ/aOaVCpFct5aA7RnDsJjuN1yMO0HsvNru2p5NlwXIuYgPBcHcXbOqxMgT+cbGaFwl8V552LqH0yfMep/bMyWEE3o9IhFKldgGUWlSUD2DJcC6GGTh9kU8PMy+TYqMCZ5dcrswxb8IH81PoeXQgizydF9q4wPMonHx3i3mADsvBexEdpdO4LoEDNZAkNSBE//3+7ax7dp79xi+avxSBPg3igYTzRGMSX7qp9tdx9ws8hcUQn9/gWGtYEK75RpWJ9ynFDysk3C3+cW6qiumVkEeInqw15zDwtcv5PBWz3vzkuo06FsoANfKv3gHxv04j/CsX+ahpw07dc6NAI0/Oir/C1mrat1cGQ5peIJdsshooQQe1roT6UAPS+xpKbUUrhgNv+D/Hh4g9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:14:50.8091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c9e20b-39f0-48c3-fb1d-08defa0605ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
Subject: [Buildroot] [PATCH v2 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
Cc: Neal Frager <neal.frager@amd.com>, joseph@anodize.com,
 thesamprice@gmail.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With qemu version 11.0.0, support for microblazeel has been folded into the
microblaze target. This means that the run command for microblazeel-mmu needs
to be changed to reflect this.

See the notes in the qemu bump commit to 11.0.0 for more details:
https://github.com/buildroot/buildroot/commit/9a5369effd22011b52b82c91f702bacde690c41a

Run command for qemu versions prior to 11.0.0:
qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

New run command since qemu version 11.0.0:
qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- added missing endianness=little parameter
---
 board/qemu/microblazeel-mmu/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 20fa0072ed..4d1e660650 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
+ qemu-system-microblaze -M petalogix-s3adsp1800,endianness=little -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
