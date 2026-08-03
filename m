Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850FEC5518F
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 10:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CFD8809BD;
	Mon,  3 Aug 2026 10:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9XF_nahYNup; Mon,  3 Aug 2026 10:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02796809CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785752979;
	bh=Dg3zaRIfpnYIdFCCGddomIJkb7jaq7/uGDuQ7AEfBv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JOC1dCMlyuv3jJbultr0yMv9Zd12Z75St2gENYvkGA9ZIigOdXRqc3K6djtasDYeO
	 4rCX7pKrNWGG2LzjngaLT1rDFHmmBByyDoKoqUtpsaQcwDmkFHudVXrHmHzifUirvp
	 wAYDzfBNVaWuVdJEIx+s8s5X+BK8i5e0vfWiZgxOuiD99LwXApG3DXfTAk9wqGuxjJ
	 uSkkh9Zso6wgjQhix1bDAZZQhSc5s6FWOU+9TtB8W+1td/jUlH2zaLoEgGx4DWWq6S
	 kfhharP4SY6CF5BsKAuRmNWtgihRFEmLiyqIFNRfCrjs8IrJDhPDHR0ijtQGY3um8g
	 eyUX2xODo0CSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02796809CA;
	Mon,  3 Aug 2026 10:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56B74350
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CD9E40563
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPyuqv4kcqML for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 10:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC0A640567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC0A640567
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC0A640567
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL824q+YKuU4H3M+jmm6lltXWbm8FpaKuld0ONUKF6uodvrsanDEb0K9HBWRI/460mJ7JkhAZn5vEKohpXOxFnteWZSCisIMgSpWDdqxZfNMLhanF5KaWx+o4Ti8O3TZPHWTbbunV143/YET5T1iOSkGqEXeoBYuZWMKRPRRzJm119oIBdp1/T5Vjz8ARcpl3/Rj8j/I6JXBNnlP1oujImJ16z9Mk5DotdUiuYkyvDTi7wfpE+Q1cv76aTIkHKih45ZDRQLUKe+hUgRyQr+QM+QSkUTD/s0jj9GzAYgy0+UxjxtHZSfC0dbxR+qpG9DodMdxdO41RBmX5Itsi4r5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIMofBRMRYILAQHdhs0quDsw60B6mMNnwnAr2caE7AM=;
 b=LsoX53iCNCFVCi1YK/tNriZJ/sR1F5eJTUI8HbZxIZ5SaOFYRMl4df3IYpFXuGqrlJGcLX0Bkpd0SYkLAgBohaSpcBzbezKLND1MOmwaCqp9d1KycsADdRhvZK5bW26OIhbkz3FNs1CoRRzqCoyePQc0vPpwkyizDycOw9G6mx0fyxriHfXlTaSrilGxBKMTccX7/4RznkEANNYIbDG5lbDcOZL1TuFbLQqRjVgtbm/xJmiWbwD5cISNjszxk1Z7nZwcpV9867eOsQlz1YktXbeFjVM9umgajKhniIYCPQGnOe7qThePbvtjoMKPcGUn1/OzcjoMf/UZRk0CS1G9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CYZPR17CA0013.namprd17.prod.outlook.com (2603:10b6:930:8c::14)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 10:29:29 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:8c:cafe::19) by CYZPR17CA0013.outlook.office365.com
 (2603:10b6:930:8c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 10:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 10:29:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 05:29:27 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 05:29:25 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 11:29:10 +0100
Message-ID: <20260803102918.4064744-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: e233143b-177f-41a3-5624-08def14a18ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|3023799007|41080700001;
X-Microsoft-Antispam-Message-Info: WVj+SaJjd8/icNtcOgQTfdYcandao49ht2zKiq19/zS7L+6cOK8BXzj9f8eJAcPoHCxNp6gO7noWphBH0KwiHGdvSWYI9M7cwBdeHzP1qlYiOMkkHtb8RxYszFhZcUl6+ijC5NtahmFLPQMsx0ugQgB7uV+UyLkshO7Mq1F2KSWn67xQ4jFmJ1/0dXdQbzshXSFe7scaCVUbY9Fjp2DvwvpbHPy0tlQgK7cdH2/CwV7d+OnMOYZQRzWAqz57GgMOZX0c+J9ruH0YRJSs4ol9lZNnueIUM74vTStXLbEh2LCyydMar7hybKCiVmk0vCFMYu/d3puqqX/pe6O8H/wDlV/CRO9ResYyBoy6ixF4Z7aRYqI/DkzQfle8vmKmJ6I52FuuJffPTwo6x0sspivJdsUMJQdYqBgnqVFJZhJfTRgKC6vOsQWyhbkxEVmcXFgmNpIny7RnKfj7vvP0ifkR1NYaLCScki3cq4+PE7IrX63AxEZQMfxr/CMOaZtqD0sd/J9mXqRUh3YTCXKndyk56p+lBRxsFiNsPTCoZ0zeKBqc2rpkLl75kwq5gv7nex6vCwKROnE/RgvLSf7uXxWgiSsg+zHmaOLwWSWL12p6sX4+ilhORvo/TefoVq8aKDqPdM/tlBrkmrvVIcwuA+12niI4nV7NxtlYVQRaOFuQ9XctuVWdh0iOkuYXf9KjpC7sDl6zNzWETYT4+L9C1MrUX+KHDFMH0dLNV/Boor8TJyeKRxlVb1/ixpOWxUn/EgO29SECXYK9iA8vNmD9hUnJIg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(3023799007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QlK8RI+m9zJ5k4GpGnl85WgTiI98TuAR9gmi5NlrX76BTo4/U4oheyJ1EtaYeGkDfTSvinUbdud+M+zeJAgRiewfuikX/8XK4cjLHXT+wRggtgXeVzKjas+00yAtsfnJzw+H9uLJxVcos28bJAX8iBWQE4/uXkdo5ulPNEubOVcapVCpjKtXbZ85J5Vzy34SM7ADGueuCZm555NFGQHv5kTRREne1ON2xrOzWIuURVywlNvU0VW2PFp989wE7ELHSqA3HC59pjYizgbHSM5vlhcbP9HGmR8ELohiT+6oiCgQ/aH1Taf8HWvLZo8kjOjAnJCaBYE+Q8dX4AXB4gLuggZsAFCAkpEZyVx9FdudEmqVvsWIlejbu3cjqQzxxCkn2I18Jaw09f7KrUXfCh98+Zt3SLLI9n0CCBmP/83ZSMfoeTfTuQI6xUlldHNfylGZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 10:29:28.0528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e233143b-177f-41a3-5624-08def14a18ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIMofBRMRYILAQHdhs0quDsw60B6mMNnwnAr2caE7AM=;
 b=q6CNX6SjsISQ/dugwwf2qYUXXPrN5hHqJEwkY+Zj+SX4YMlghe9YkM+9Yl45VLxLq72jON9ly6uJjHXcZSsaPH3LIw/V9xcpgFNEWBu4ATtcV2DrEatPudHZOkeDTWwFySKxOXUFV4arA6L0q5ofwJW4hsHj1Hl28qARE0Fldrw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=q6CNX6Sj
Subject: [Buildroot] [PATCH v3 1/1] package/xen: fix build error when
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
Content-Type: multipart/mixed; boundary="===============8735317028544863066=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8735317028544863066==
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
0002-Update-linker-flags.patch so that the part that modifies the qemu-xen
sources is correctly moved to a patch in the qemu-xen package.

Move this:
 #define QEMU_HW_XEN_NATIVE_H

 #ifdef __XEN_INTERFACE_VERSION__
-#error In Xen native files, include xen_native.h before other Xen headers
+#warning In Xen native files, include xen_native.h before other Xen headers
 #endif

 /*

to:
package/qemu-xen/0001-Update-linker-flags.patch

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- changed method to modify patches instead of xen.mk
V2->V3:
- removed text from commit message which appears as start of patch
---
 .../qemu-xen/0001-Update-linker-flags.patch   | 35 +++++++++++++++++++
 package/xen/0002-Update-linker-flags.patch    | 16 +--------
 2 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 package/qemu-xen/0001-Update-linker-flags.patch

diff --git a/package/qemu-xen/0001-Update-linker-flags.patch b/package/qemu-xen/0001-Update-linker-flags.patch
new file mode 100644
index 0000000000..8162a149ed
--- /dev/null
+++ b/package/qemu-xen/0001-Update-linker-flags.patch
@@ -0,0 +1,35 @@
+From 2ba2eef5b11d81b801265ae92df91571c19cc8a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 30 Sep 2025 11:39:54 +0200
+Subject: [PATCH] Update linker flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The -I$(XEN_ROOT)/tools/include added to QEMU's extra-cflags causes
+__XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included,
+triggering an include-order assertion. Downgrade to a warning since the
+version is consistent in cross-compile.
+Ref: https://github.com/qemu/qemu/commit/e2abfe5ec6
+
+Upstream: Buildroot specific. This is a temporary patch for an intermediate bump.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ include/hw/xen/xen_native.h |  2 +-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
+index 6bcc83ba..2590904e 100644
+--- a/include/hw/xen/xen_native.h
++++ b/include/hw/xen/xen_native.h
+@@ -2,7 +2,7 @@
+ #define QEMU_HW_XEN_NATIVE_H
+ 
+ #ifdef __XEN_INTERFACE_VERSION__
+-#error In Xen native files, include xen_native.h before other Xen headers
++#warning In Xen native files, include xen_native.h before other Xen headers
+ #endif
+ 
+ /*
+-- 
+2.51.0
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
 
-- 
2.43.0


--===============8735317028544863066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8735317028544863066==--
