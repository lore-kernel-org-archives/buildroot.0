Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DB9CD98D4
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 10:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CA881429;
	Thu, 11 Jun 2026 10:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMdUuKk4bbfb; Thu, 11 Jun 2026 10:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7606E81422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781173073;
	bh=7Lrg0oJX+v2hrrBjU8RQSBdUNL+nZSTD8jRLvp07XFQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=erS9a0ZLxlTDpYe6bjTaNsX0P9hEgI47WXV7uY6erRgZnCOk/GH/MnikRqKD9DBjj
	 h0lAFZPYNKHFizDjijci4m0HP2DsbJeXAUOVnLgTOG8+AC6gV5ab3CtspZVLIQX/Uv
	 vyqE3C0MsiUjRIyoAbPVwXXFrw9rUlydavFLAqnbWEwFxOSGKZDvpWB/ftcAz/oslc
	 z3m2sXH3qNTjnx1z3gUz9TzpCmR6H11OxpRxzUJjVT/sjG8Nt5iAntucj1gqcki4kq
	 f3ntl/Vhj/ZFkIK0e10lWn9ogelFH9UZ4bbIML7opYX/6ULBg0sGB/9B20XIrm8rQD
	 nAsjw5jIjjabA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7606E81422;
	Thu, 11 Jun 2026 10:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC88192
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19396078F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZ7ythDZ_Cw7 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 10:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF5C660727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF5C660727
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF5C660727
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTzbUPIDmG5iK1Mwl4lj1dlmgGdCTFUfRsaIK2PnalJvF5zUQgg+L3971JtXlKSxv3wshF3RpaMzDZuz61LMRfmI2QAuvRJ8aODoAQWV0mDkQZoeDJh6OqefepmNpr0HJBRocYZOnLng+K1jhAF7lPKjx4S+rohYBAxc6NM8X94uu+SWt5mmPJDxpnAkJqQMQRiTqyXDytfQHVuO23cuGjKy0BbPOBTfrhjD9wAc7wi/VVB7rymHLx0b8VNOxRIjEKg+K0WIwOCpodd4BrhNvkL2DgLHTCfmkxC4wmrG6hHvFlLtTZW+r6GSOhVwBCz/WthgFJ7UrSNt0hBO7eLpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggkKedu8FpU9aLrmxFk34+JLwRr6cfHMSHQA9rs/miE=;
 b=CVdzEUtset94toDC1i9HbSuqo4aV3s94amK/8SA+LaaO6zWGar0P/oNoGUvkNccvA8c0X6wSpmZBFqH6meIBH2MlZNLS1oyuvnpFoBoreu1fjUQjUYzRWJDAHsv6oJZ/CsrmJYizVK469Av1bweGpneX9OdgeaYbFzaeB8lvvX8UVjPNr5rfFEZuRnGpVVAECEgq0RSLDMsMUAq2hdskg5/V0Ls++btKbVpVn4Iwj1BeBdP1yfq04TBIyc57Om+PxXEotBmiRjGZQvm5adBJdUm+rT1T+o8YisHkUxdreRpGnK9EtCIJ0iCQ4k9llvUj3s+ilsYRhKCT7wK8GoCmRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR07CA0118.namprd07.prod.outlook.com (2603:10b6:5:330::31)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:17:43 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::86) by DM6PR07CA0118.outlook.office365.com
 (2603:10b6:5:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 10:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 10:17:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 05:17:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:17:41 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 05:17:39 -0500
To: <buildroot@buildroot.org>
Date: Thu, 11 Jun 2026 11:17:33 +0100
Message-ID: <20260611101734.1968785-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611101734.1968785-1-neal.frager@amd.com>
References: <20260611101734.1968785-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 643bbbd3-a89c-4045-ac54-08dec7a2ac26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|22082099003|18002099003|13003099007|56012099006|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: 8Ntdd+W1iyT3dBYv8wxoWGL03co9m8bB4zEYBm370r58LTgRnhpGY7i8O66LWITjwuXWOcl57hBouxqP2qTUg1rghMnFk9pVidxMfNITZoV/LhIB5Z05dXNQmCTdFBAUckDqmVBCf08arUZEpTI0+T0DkSNZeQs0bu6+Dg0ED9YdXz/Xvmf1/QijE3wZnN2mnznn5oLxo8Mqx3vdLsxaxtLyPhO4TrOUDvJFCAVgAjeO0YmiO/9ymh6dweNllRJ7XNGWO9V3wRlyhfRfl4r5LTgeX3jAM718mv56QKIVHvTvyjak8jhRIPveP7pUPsCYum4yKo62uxopakFOV6Wbq8nFgbzp+WGKiYizWrZYzk3qjD7l6YB0ha08F5OIjH0JBPavy1y7PaeYiA8mHvNNsqWo/8P0osRt/fekpgTwaQdlYpdBCD5xNq1/8ZaWGfAlwbsqVBsw1GmsrjKoJDOL8EisuTKViPJeev6hjqPbVg6nbxS3KGlerCRtULI5hww8Lui9r0KbYqiSzyRbpeNziQfCoG2WEUu2TeQVN17/RHiOl++lG6IBjKN+75TQtlgvGUc134dRozdNwlsUtOBlWtSp8Ohahua8SDKRA+FJUPMs+9ixxVQ29Nv1u9RaYi2+s7ESXpKDOyXe5OQjhKfJDQ42J1GPoX3vLen7bAQrItkiimFbrYz08Qn6Gza4lcgTfHv87DnnPJMeYMdg1dRkp9YmsRNOWFgQVr8HK3Zx32SxVuqpVGM+AyiOc63bTdW0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(22082099003)(18002099003)(13003099007)(56012099006)(6133799003)(11063799006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2GJufl/we638jDYPhuEzpMLEFYXsueAsUAXKi05D0OgRMz55liDv6moJEjchUWwpBxr2JsHc9Y2pUMiO01S90JQ1YiqW0ju5ciGBcgONCpZLvkqIRMezEIHuE+2sDbvgYmjivICeKTsFG7rtMqO99w0nXUER1xD3UofHKrMBrrLiFDmnNcK2SNSFBmmekG9HqBJYhK7qqnhhrnR1FcFauMlxoB4xTn2haGgOP/QFP6AngGX4ruhhtAYF+Go+EWz89mB2UkQSnQVZCFW0C+60s2PO2fiQBSZaN14gVQpBWFfkvHxFbTUOkll3MRz4HGUpEg4zgFBJCfqg/+OAQ8jmUq+oF4SF3GwBVmei7MAlDop7jzJROXJEdCc2IDAyyCaPfOMbSKHUOpxRp65PjxMCRdctPtSrXNLuBjC2221rtTqHf3FX8yUCYjOOuAqgfb6h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:17:41.9293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643bbbd3-a89c-4045-ac54-08dec7a2ac26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggkKedu8FpU9aLrmxFk34+JLwRr6cfHMSHQA9rs/miE=;
 b=vWkBECvPbSwJd1cFZjB8X6lJsyIUs4t3yGT8niA5735bbE8XEzzPn7xH3+w3dhC3fk0qgHei97NjjvmkAmxOzi7kTNlyqVtQyINMpjs0i8eZkHvVplfZw/2k1E3R/qfxasw5SmKLd+Fs/GRm0lcNgvOLxCRAKPjpGpni8IdmObU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vWkBECvP
Subject: [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball support
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
 brian.j.wood2@boeing.com, ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for custom tarballs such as tarballs from vendor Xen trees.

To test this feature, add the following configs to any zynqmp or versal
defconfig, so that they can build the latest release of the Xilinx Xen vendor
tree.

Add to zynqmp_*_defconfig or versal_*_defconfig:
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx_rebase_4.20_2025.2)/xlnx_rebase_4.20_2025.2.tar.gz"

Add to package/xen/xen.hash:
sha256  3453d17402d2d1417fa86ec7f959bbe5ccdf63312224679ef51e4f97d0a32870  xlnx_rebase_4.20_2025.2.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xen/Config.in | 11 +++++++++++
 package/xen/xen.mk    | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index bb44202824..e97522d22e 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -23,8 +23,18 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
 	help
 	  This option allows to use a specific official version
 
+config BR2_PACKAGE_XEN_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 endchoice
 
+if BR2_PACKAGE_XEN_CUSTOM_TARBALL
+
+config BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION
+	string "URL of custom Xen tarball"
+
+endif
+
 config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
 	string "Xen version"
 	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
@@ -34,6 +44,7 @@ config BR2_PACKAGE_XEN_VERSION
 	default "4.19.5"	if BR2_PACKAGE_XEN_LATEST_VERSION
 	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+	default "custom"	if BR2_PACKAGE_XEN_CUSTOM_TARBALL
 
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index e354718021..02d4aeae46 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -12,8 +12,17 @@ XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
+# Handle custom Xen tarballs as specified by the configuration
+XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
+XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
+XEN_SOURCE = $(notdir $(XEN_TARBALL))
+else
 # Handle stable official Xen versions
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+endif
+
+BR_NO_CHECK_HASH_FOR += $(XEN_SOURCE)
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
@@ -66,4 +75,10 @@ XEN_INSTALL_TARGET = NO
 XEN_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
