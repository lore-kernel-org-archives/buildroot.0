Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D5D5B17B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 14:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8A8608F5;
	Tue, 29 Oct 2024 14:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wGwS8J1d-Nx; Tue, 29 Oct 2024 14:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB5B608F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB5B608F8;
	Tue, 29 Oct 2024 14:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 626A0AEE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4479640AD6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhHAmFPFq7jj for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 14:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::600;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4A1F40ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A1F40ACE
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4A1F40ACE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtSCGr3AVchQGPzQUaVxrQz8Zz/Nu2i0i+XK7b6H0Go0nkB5BbpH/784RjWyRtxAKRSvTPNV1L6+Ew/RggxySIX99qTnwgYgNWGxtPQz5mr98XcQRYCIc8DvW95J0nWoHMNs3U49gMwhdEeNvySJcfiA5AuOvQO2uW4szS10TqB6AD7hKimQrUyST8D566VsXbTS1J8UUIaq4ob0LOuINRco9MRLlvYiU3NxqTh+dEcZnlLPAsCbXmj1vSeH8BFHeuBm+m7VXe2qcuU57J7Fdd8x6l/UKAzLTu3A5ds1nEdy034luB5efRAtNqLner2g+rwa3TerBdTMOo6zks/jSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISRGYHDhv3E3ZEI9cwnGUKBXBgYLBiZr+UpzWacyGzY=;
 b=abTMk4CQjrDi00n4ZJ7U003Rwx/6wUOt8vmDtpYKSk4XivKjDaBpAJUAifRMnytUfM0KoTZv99xZ/RyAmESdHm4nMcEuXbKeb0tFRcQULTcOZNkR12KJA1H1wJy+vBjPVzaCUu5oc9nnZ8QMEkOjTS0AOJTjzCEtVn0TaMJ9MaTgto3QE18TPok4DsbY0jgNeESrLcw3u7vgnPK3NVf1pdGuemmXRPVNjWOyzoeYUtzSjKskg7D4V1KPSm7c7yJZwrM8lv5HJTp0aFwnR0xDGLvCjpZKpkphy3d1vCOpPR8ThrzH3nvIpwINIOfAgPympHNksgPQPu9SsJu8mxAoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0102.namprd03.prod.outlook.com (2603:10b6:303:b7::17)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Tue, 29 Oct 2024 14:12:20 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::5a) by MW4PR03CA0102.outlook.office365.com
 (2603:10b6:303:b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Tue, 29 Oct 2024 14:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 14:12:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 09:12:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 09:12:14 -0500
To: <buildroot@buildroot.org>
Date: Tue, 29 Oct 2024 14:12:09 +0000
Message-ID: <20241029141209.3780984-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029141209.3780984-1-neal.frager@amd.com>
References: <20241029141209.3780984-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfdb977-2af9-42f3-c77c-08dcf823b1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PSdnfzHYjDMoCpsG4p37DFhAcnPRsfFa4pwFcEcaMuR9nvKkU0iNGqr9wQfd?=
 =?us-ascii?Q?k0CPmGidhS2nPGnW2UP3gHRLvNvtyIrUXzzVVuF87qYJhKpjtbc33ISv2UDB?=
 =?us-ascii?Q?L5E398DnX6t3Jomff2wTX21LhQE4MRbTllsFwah9DpT+CQ5osaXxzV2lQBOM?=
 =?us-ascii?Q?yU4nVrz9revanCpuww3TIClrVJmZuNiFWD9jy9hrG8KNYzC+bJRwLz0U+FQ3?=
 =?us-ascii?Q?47P39esSQ7FHKvWFKgWBHcvQSzxcL1zPCKhiiOTOY51ZyQBogAM5cR3oCHlx?=
 =?us-ascii?Q?GQHUpRPA0lszAfKPrOSpoDQs02nn8k09z2cZQumjbJQw8UH2cfR2pXJ8TKoT?=
 =?us-ascii?Q?yGv4pGFdaL3/wWdGHyif9r2a7bzRlD7ux4myQ+M+zt5ngbggBhu/6CJXyOm3?=
 =?us-ascii?Q?EkFet6YxhagOe1CK11MJqf40wENJ5ywDSfSiX0/DEyH25+t+XxXstIE2Yfqx?=
 =?us-ascii?Q?I5rrsFAg+fDc8u7flJEqVB0YHYU5NQ327qB0WIpjjnOvOSg/BEpZLnT959QA?=
 =?us-ascii?Q?3g49O5dMiDPC0JT2BzFZ0BZXu5xVjpiWmEkt2mQIIz531RN1gFQXMM4RrNud?=
 =?us-ascii?Q?la/sROxM2f+sNskxQ/MfzhuNyOAJr0dTPafw8yP1vQIjMO9BGWzXnvIPtR2y?=
 =?us-ascii?Q?43xm5qKTv2o/q2Leg8r8R6IsS9eJV7QMf+XzVMVilw6NE6hx5EHmPOKAxGNW?=
 =?us-ascii?Q?3vnF9kv/A13WuGiAsaA5N9VZIvgYK8D1Cx1jmaoS46DdIn2MdzQ7fljqT1SW?=
 =?us-ascii?Q?+fmf/H4PQpqa0dwSj+yEuAhFIwfIJoXCZQoxRAjUoKXSLxiuWE3khLVhv8Fk?=
 =?us-ascii?Q?BHBv8m1q15ELUWYYTd5Q1HmMu685kPKdvh88r5gWGAolBg/IhPC/Fo7cr3jI?=
 =?us-ascii?Q?mBZNfldkHLALXQL/+sZ9H/Z2Acq06/dq+Rss1oo24hVjMK+kFnFDaaH6zdcm?=
 =?us-ascii?Q?h0/Yx4I+fWRJHP4koNn3ZGY6y+Edoees55MPyF7GeIR/JpFHCjnSBXvF9a5q?=
 =?us-ascii?Q?u0vhZiabXofvC9zuI6OSj+IOuXTDX9CBj94M5ug2jvLEn/pf901XdknRd3tH?=
 =?us-ascii?Q?6JaUS+Zjb4USR0ZMuD1BJuwj7IGWDgBbfMPfF/E0RNoak4YU/5uE3BTcY2su?=
 =?us-ascii?Q?XvK6eXv3jLEnB7w30FgAnA5ZXJR33A/v2OMud8bbSWtTpkBekou6OxBiwtEr?=
 =?us-ascii?Q?ImSyMelXCVc1+zC4SNsoOUwuefWd2Eo9/QKJh4jfIHLVOfypWKLxmLZYcNVo?=
 =?us-ascii?Q?VclG0aMGQe6fiIVLSrzVCmJ6++dyAwrcAIx4h7RZDSQxsp1fV7gN/GgqjvLE?=
 =?us-ascii?Q?xGUaa7dBUd9fgRLUrUKEl0Jt9981YbFXMgj5MwAT1Ot0MGHjI7PsBVeXG4MT?=
 =?us-ascii?Q?ledQEozDSN69Q5AwsXAxPLKiucCMMTQbTHGphO6+aHUrYSr9sw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:12:16.7314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfdb977-2af9-42f3-c77c-08dcf823b1a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISRGYHDhv3E3ZEI9cwnGUKBXBgYLBiZr+UpzWacyGzY=;
 b=SJll4qjafSxrBKCnpBaznREcD99CCQcLqK6keK+aoClEOpw6/XjTGbsVM4ANoCHhG1jKAqDIg0yR+jjUtaIMV6nmve7zxdtoqXdegQqCBIIpRm49Bvp2R54XMGfVilD3/HAb47IgZmbcdhX/6fcxU1hJX3FfIIVFKiy1NdU2Xj8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SJll4qja
Subject: [Buildroot] [PATCH v1 2/2] package/gcc-bare-metal: clean up
 variable names
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing HOST_ prefix from variables to follow buildroot coding practices.
Adding HOST_ prefix to GCC_BARE_METAL_CONFIGURE_SYMLINK package variable.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 501f12bc33..df3e2f957b 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 14.2.0
-HOST_GCC_BARE_METAL_SITE = \
+GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_SITE = \
 	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
-HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
+GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
 
-HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
-HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
-HOST_GCC_BARE_METAL_CPE_ID_VENDOR = gnu
-HOST_GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
+GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+GCC_BARE_METAL_CPE_ID_VENDOR = gnu
+GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
 
 HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-binutils-bare-metal \
@@ -23,12 +23,12 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
-define GCC_BARE_METAL_CONFIGURE_SYMLINK
+define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/build
 	ln -sf ../configure $(@D)/build/configure
 endef
 
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
 HOST_GCC_BARE_METAL_SUBDIR = build
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
