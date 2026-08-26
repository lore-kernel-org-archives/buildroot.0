Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E6C61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 06:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1180180B6E;
	Wed, 26 Aug 2026 06:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmlNIEJd4X-n; Wed, 26 Aug 2026 06:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787726839;
	bh=YBCPO5KdCZfl08dIIFYSV4PyggmZsweFUYk/KfixYP8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CwMDil6OFzhY4lR6xDPIYftA+3JdoS4vQMgecEb+pD8zNX+gRLwbZoN7KobttU631
	 snhMyPLKF7D0ayDnXNk/Z/D+yMydQTZwXE3R80N13HGyGtnMf7QDapa4n+b8Ctv/WT
	 FhQCfDe1XDKmi/Rm/8UQmOwy9xVd9NBQt8oHcaQyYbv9JoUy3feh0Gm7Eh/unRXRwf
	 f3R9SCNTGS1eEHsGqZJWRbzlH5Qvq5/9I7Ss+Mrj1b3421apMzJbGK8WHjT4Prhlbv
	 mkmEOwZIvjmZZkjoEigCD25aTolZblZ/NV9wj2CJZmEe+DDfz4ZlQY/JAKJvnx1uNN
	 9zZjLbJ5FJpmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 138F480B84;
	Wed, 26 Aug 2026 06:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7948105
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD93040550
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pD9ypz4lGb2J for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 06:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E51B403FF
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcPlVRyc1JvLt6He+pHWBB9wV+m70V27LRZZltONjxXGhvDv0JSgSvL+s6R4I0ANhuUiqWw16emRs6s/UvxY0w5rVPujf1THtJuygdku1YUO0ttrmYhbANU9fJlvN0IBzUKINRH+kv6ahriIyUMccOPH1rQJfuKxKC2mrenCA1RXJTFqlHysQGE1AoLYjj3sukV6mdmnaT+cTA4FlfJLmyksKJrEbsWk7bxQwjrpW5SfyrQ454L6d1bKB1QoOPW4dW7x6dYW8qDBAXe8prQiUQxJsJDhAOOzjq0ree58MWzHmBAYzH5Wv95vOLBojVkPnHvwr6ZtZ/eQaWfmdgI2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gzqw2WMHo3dEHkxOYPYGWiv8aiGQ5AuZMvG+TkLfMis=;
 b=QS2QDuYHlv/5sxQLeQ73b9QPGm81i2VbtTb/kDuVUKmr6VAijj2v8blxr2DfHSzEDX83yX15JguEfz8KBqNJtjXCJ92i/oZ3Vjmobbt/LO+7s3pv3zTpeQ2PgfGkWIzJHPcCuV3KFaE0/dN7SExiPTc0HeZqe9s7Je9ToSF0UQ00sYSaQEAJBRBxjCpjcGqMVaGipvsSxFgg29pYlTdnie9LDG0MFuUVAXOiCnSiDN15ICSqaFDuTwhdOLFV7tNWzU2rFJTMT2WHTI7CA6iQI6ZmaquWMU6FZk5Wxoe5F7pqgzG+iFXJAlYGPhkcGV/KByVheJYd9PORDwWF6ZxeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0138.namprd03.prod.outlook.com (2603:10b6:408:fe::23)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 06:47:01 +0000
Received: from BN6PEPF00000074.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::22) by BN9PR03CA0138.outlook.office365.com
 (2603:10b6:408:fe::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 06:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN6PEPF00000074.mail.protection.outlook.com (10.167.248.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 06:47:01 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 01:46:58 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 01:46:56 -0500
To: <buildroot@buildroot.org>
Date: Wed, 26 Aug 2026 07:46:46 +0100
Message-ID: <20260826064649.292291-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000074:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dc1023-bf80-4507-0239-08df033dd50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|23010399003|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: f/H1FhASPUlo0d8LYGNRms0LQLQszk9d7SMngRQe2JbHA7gMkyhxkEQ6RMcTPZXlq00Q6flJPteTzuCeu2fKHnk6Ni6J2sl1uK4BsxuimZkVzO82VYWTerFtE6YDcCt0AHuY95Kx39gW6gcrUMXuCIYtfpA3nspmHwKOQQvZY7eIlPvTY1t+YQFvYBziZ+lEbrlWSKmEx2EaTR3qhDCUdJ3KUdNbkkt1+uK4LL7oE1jX2vhyuNwpMzLV5LhwkshVIF4Z5VMQnoFiMG0Et9Ujtgmnbiyn6SZ5EYUxFhRRADtxuCSJL1hPaoC8/KMYC07+sQ8l6rNmnYoohoRSOYbVYs11nbqrYBOQlWXQHNWptfeHUEqm+3QC5TW0KGoDAemXZFrrkSUo6pMc2QI4U4zFsmcGn2yA+mMCtaNjLvBtw/85GUPZxhtpfSp5JDIoe2HCXMAdXUrLL86CKeELP8KvDkeER/G/PC7uNzNrNLSRskUAT/eoJGrk9QNzwjHRpggUUWFbAoqsE4WwSKecHZUfU0ll2A5JC4CASSMXa0maqHqK8adm7SQZj4dMtTs4eOJGHLJ1Kg83UetkdNRAeQZ5Rv/v/wJLE1K2PRYYDr71dn+oO4RQJUazDOcXtRNALUGhSrrJ9yABldzh/NTTDyAhs0U397U1gRO/4gEnCjYEZRZG3B6ikJ7TMpycmxYzIhlrVZATWnYaLTYouVhnM1DodLcM8UcA+e42ixuir7myCU3F6xoddBXKB1KSu91SotgnNIcaUojb78YPJi4xlMHgOw==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GwDM+Gz0DYXEv4PFvqaCso4IdXZs1vvcvt4DZn4Y5TLtJEytEvpTKs5m7ORxnjVYEmPLZbHEB4FiczUsXfhbH7nGP2xSxQBZRGifueeaSoKrG5G3GE0wzx/8eigx5Qdgg8Gl0ayTMc2A6bBC05ttsi4qzgluzw+5LJ3C3ObxRbVp0mWXDuu+vS0F8YioB65aAWNmQaile86H6I4O/2qQLaBiqplLW19oERT4ieqgkobZrU3jpnSYAukAYeuCw67NdnQwRimCJoidkf7QLSyTTdu3aZxMLOHqFUQm7zfLV2/lWYeyu/ANoWO7QboEVlSlQDmpCoVuds/io+TQCymSutmE0o6F3cj4II0Ci6QSFakVPbRr0uAdxHs4/DiXVzrxQOKl3SLJ+ZBeCTjMjx93MjpoP0KysFu3FyQfy87x7nBbw0NnNZrPHQiqWcKyt7+D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 06:47:01.0451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dc1023-bf80-4507-0239-08df033dd50d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000074.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
Subject: [Buildroot] [PATCH v5 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: multipart/mixed; boundary="===============2747884872677731143=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2747884872677731143==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
qemu-xen dependency will not be handled and the patch will fail to apply with
the following error.

Fixes: build error below
Applying 0002-Update-linker-flags.patch using patch:
patching file tools/Makefile
Hunk #1 succeeded at 36 (offset -1 lines).
Hunk #2 succeeded at 185 (offset -8 lines).
can't find file to patch at input line 76
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
|index 6bcc83ba..2590904e 100644
|--- a/tools/qemu-xen/include/hw/xen/xen_native.h
|+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1

To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
0002-Update-linker-flags.patch so that modifying source from the qemu-xen
package is no longer included.

Instead of patching qemu-xen, a better solution is undefining the
__XEN_INTERFACE_VERSION__ from the qemu-xen package.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
 # BR2_PACKAGE_XEN_TOOLS is not set

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- changed method to modify patches instead of xen.mk
V2->V3:
- removed text from commit message which appears as start of patch
V3->V4:
- merged into patch series as the first patch
V4->V5:
- removed qemu-xen patch
- undefined __XEN_INTERFACE_VERSION__ from qemu-xen
---
 package/xen/0002-Update-linker-flags.patch | 16 +---------------
 package/xen/xen.mk                         |  3 ++-
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/package/xen/0002-Update-linker-flags.patch b/package/xen/0002-Update-linker-flags.patch
index ac02722781..3ba678cd9b 100644
--- a/package/xen/0002-Update-linker-flags.patch
+++ b/package/xen/0002-Update-linker-flags.patch
@@ -16,8 +16,7 @@ Upstream: Buildroot specific. This is a temporary patch for an intermediate bump
 Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
 ---
  tools/Makefile                              | 29 ++++++++++++++++++++-
- tools/qemu-xen/include/hw/xen/xen_native.h |  2 +-
- 2 files changed, 29 insertions(+), 2 deletions(-)
+ 1 file changed, 28 insertions(+), 1 deletions(-)
 
 diff --git a/tools/Makefile b/tools/Makefile
 index a9a3196e..5d289651 100644
@@ -69,19 +68,6 @@ index a9a3196e..5d289651 100644
  		--bindir=$(LIBEXEC_BIN) \
  		--datadir=$(SHAREDIR)/qemu-xen \
  		--localstatedir=$(localstatedir) \
-diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
-index 6bcc83ba..2590904e 100644
---- a/tools/qemu-xen/include/hw/xen/xen_native.h
-+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
-@@ -2,7 +2,7 @@
- #define QEMU_HW_XEN_NATIVE_H
- 
- #ifdef __XEN_INTERFACE_VERSION__
--#error In Xen native files, include xen_native.h before other Xen headers
-+#warning In Xen native files, include xen_native.h before other Xen headers
- #endif
- 
- /*
 -- 
 2.51.0
 
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 75252d1123..bddfdbba38 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -40,7 +40,8 @@ XEN_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	HOST_EXTRACFLAGS="-Wno-error" \
 	XEN_HAS_CHECKPOLICY=n \
-	$(TARGET_CONFIGURE_OPTS)
+	$(TARGET_CONFIGURE_OPTS) \
+	EXTRA_CFLAGS_QEMU_XEN="-U__XEN_INTERFACE_VERSION__"
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen
-- 
2.25.1


--===============2747884872677731143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2747884872677731143==--
