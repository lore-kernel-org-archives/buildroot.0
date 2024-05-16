Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DF6C25B79
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 20:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71FBA83BD8;
	Thu, 16 May 2024 20:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXcj0uF8IM9G; Thu, 16 May 2024 20:18:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE5A83BEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE5A83BEF;
	Thu, 16 May 2024 20:18:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5461D1BF488
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DED34022E
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 20:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVDt5U_FJoYP for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 20:18:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:feab::72a;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=marc.murphy@sancloud.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 405534018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 405534018E
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 405534018E
 for <buildroot@buildroot.org>; Thu, 16 May 2024 20:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0ZZx1aG5udW6Pbco2K8l89br65fyBCqcaj9IaTXPciYcvTGMNWyxgUUteCX6q/6qymMZvPO320ewW3CibLi3TxaG/BrB1qNSAyH9ZwaXZG9qaZembz7hFciM6ely3UxKoD8BaM1fTNiCs3hJxsNXkfldBC7HtC9na/PbLPZcKTl/RUjjhjLrm8J/rltpNDRL1ceU8Fp3eGMCUnqQKQSt7xKbRHpH2m4GHXH8iIlpre63GrmLipGbYA4YZ1g7DfS6JppEpjejhaeQw/+KKf6eCbEDqyZwYXfI+VDjeqG6Ul1Y8HEwt9ANszfuaMkr9ZMZ05+Uob1qa+cEXcPHvEPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aP4vEMBgMzSRAE1mL7XLQHaWNcfs/jcUc0zl3mrdhQ=;
 b=hvqrMj5R1b5/ZXKRWWuCsGj0/UmtPa43DIBnxswEiuRQYtC9Sr3VZyMOjK4oiJ4/A0Gfj3W1Uj7eZE7oMcIUmLkXftGxR4kbNHH7kMWonwf5p+9LGbewFycK1oR5BDsPzHVRh4YT2u4q8viQ0PoD7yxaJDo8HiDnlpasB0i0/Ce69r2iYrp8iAG9VjOdkGzb+a3WZ0r0tGEhSUa5lUcSASxm9U6zTIjVc5EGV3d7DWwScqlqrZJCBXOdkC4gs8t2CuzdimzYFvsWeJEsui9VVHJVx8baOix1+/B8NIjYgKscYTrR9lH2Ods5N5j6M9qJOoMnjrScoWZbrPM5+61P2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
Received: from SEZPR06MB6485.apcprd06.prod.outlook.com (2603:1096:101:17e::10)
 by TY0PR06MB5128.apcprd06.prod.outlook.com (2603:1096:400:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 20:18:22 +0000
Received: from SEZPR06MB6485.apcprd06.prod.outlook.com
 ([fe80::31f1:8780:7a32:6d5c]) by SEZPR06MB6485.apcprd06.prod.outlook.com
 ([fe80::31f1:8780:7a32:6d5c%3]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 20:18:22 +0000
From: Marc Murphy <marc.murphy@sancloud.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/ti-k3-r5-loader: support patching in same
 way as u-boot
Thread-Index: AdqnzhPITtVkM7jaRZ+oMwE2PFRqwg==
Date: Thu, 16 May 2024 20:18:22 +0000
Message-ID: <SEZPR06MB6485AC9540285CAFE0BC075B80ED2@SEZPR06MB6485.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6485:EE_|TY0PR06MB5128:EE_
x-ms-office365-filtering-correlation-id: 47173570-4498-48ae-95df-08dc75e55586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|41320700004|376005|366007|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AvbTNpmKXt0FwW5cufrt2oKoSPgkM08TqZdnlGCJsTh5lpwDCx20O3A6XC9w?=
 =?us-ascii?Q?s3mzxajDAW17hHBAYr/TNeIDbUUZmKhy7FmEqN7EEjASh+NcNQF7cV53bwwJ?=
 =?us-ascii?Q?Y9wIhWgv5wu78y66s556wucpiDJ6aSSuweobxslR/861jQ1S/j5QIcxnUHjs?=
 =?us-ascii?Q?qLHGmRXU1Jgt+paXQgCjVjOPXSUYBXClwWe5gcKkKneZe7lS+0DA/fhSmU5M?=
 =?us-ascii?Q?JQ+96DXzXprvWYoHL2VjsJigEfnaFMgh6xOGiYy7Sioh7q7DNIC4/54Yhixq?=
 =?us-ascii?Q?8vt+rVHy9Bo0E0Hfq5dzHtsrVzW6LFMRg1c46nCYMShRIjlgi9+6qC7R73yO?=
 =?us-ascii?Q?/Xwi1Ey5GwV6dAjwg2pkWxZ0rcOgutblRL+bo4cxTJtNWK+YTDplG79koiV8?=
 =?us-ascii?Q?EXwpoLLcPu8Fj2OI9u+C27QTm/w1CDoLz/6maSfHkjTGlTU+nS2SQ9Miqx/T?=
 =?us-ascii?Q?ZU80N+9YEHp+SjQVpQY71bwzjCA3Z79ZlzMPWrx4RXnK199QfRHAgLmkEg02?=
 =?us-ascii?Q?QEcNoQDRyRTVTaJHuoDbcwtv7f1Y2aMzyLwQIpyjAryzsIFVhvVFAPqzjS0+?=
 =?us-ascii?Q?Tf3v72O1b1ANY4+ipXDdXF8pMPQXsE8VUMKEae7LY4BGutUtAl1mHg0s4/We?=
 =?us-ascii?Q?ZQafD5FfxLD3TCbU7XUR3giRRkKeEZNKUpynxcM234cyV49ClMPYeW4ZHTVt?=
 =?us-ascii?Q?Emq4LV5JWtQl4CkzmvqVq4xOXi/OZjRUyLVup5438jTFRM9GjnwnWGvu5tHh?=
 =?us-ascii?Q?LyqRlhTC8ubiw/7OT1WkIXMUf+s259lgzojFwTGuu/s1C7fCx5Do6pPi4f2h?=
 =?us-ascii?Q?O2eegRJ2g5WRbjYakMCKyag74AZNTyERBtrj1wKzMLe4GQmlZ13JMBNA9PBk?=
 =?us-ascii?Q?V/LtJDlbtKjXwVzKxfiKaIh5y4d4G6sOeMdMPP72wogthngtXM+863ZqJy5k?=
 =?us-ascii?Q?MQYPYkFrza5VCup8RRqqKugpBz/m/mxixVgO1Zu2Ur3G3b2nm5kSiIOLgx2h?=
 =?us-ascii?Q?5gBVITRMIsChnCYeEbXWfSAO6qI1O9Bi+3FgVP/VmqGxadWOz9eZJN56GrDG?=
 =?us-ascii?Q?7S2xw/TVm05SrQIoA/wEmm9sLRwgWVGAOvNAUMzkzDDMhHLK2Ybd/nRIJwXb?=
 =?us-ascii?Q?WZvtK1vN8qwvDvRUujhJRgdHDCq1QYA7VGw/ZCj/JuylkxVDnXnS2Bmunr2H?=
 =?us-ascii?Q?y7oAXi5CQRcN2jJmlyuz+41FWFo8ANO3NWo+uoOG9nBRPqA8cHjSDhCNs1LL?=
 =?us-ascii?Q?ptNLoSH9Z57U7PYY/aUIp4iE6CWi4pbFYH/1Is1CeZkAWVOnIeYt0paQK7uO?=
 =?us-ascii?Q?sT1Pg5LhyJFpuoSd2+bk7H2tzQ3AlfEZY3j8XqoXTqVzOA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB6485.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(41320700004)(376005)(366007)(1800799015)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iKXOPweLPKLHLB8+reLdoNM1grXC4zCDs3IXjrqpJmqPU/KvSGJ3KfGapxwr?=
 =?us-ascii?Q?iEx9PM9t+OAvhMKyYAQpfAUCAnVBIXbJHVOdrgTAcR2/uqywXt7sq5JUixl/?=
 =?us-ascii?Q?IoDtNPJvPSpIZR12+BiIGPeYNgal1Z+Eyx7a27oAvfYRoBPDWeBf03ZmKQRX?=
 =?us-ascii?Q?BuytjfmdeS+24gvXKZ0TPiC3sOsK/bsQ8/9MaMeC7RHZ9GnbFuOwj0omKwUx?=
 =?us-ascii?Q?AHQIh3VC5bb4owsyG2qYmjnY4EHD5JUuyj2S3fosYUUy1/62GvVp9g/pgPeD?=
 =?us-ascii?Q?TlrvzExfBcP8wWX+8dnzrZMTMLow7tzUFGCti7SCQ35YZTMnEr8uXGuRtLzS?=
 =?us-ascii?Q?VaTDJv2bMU9Wku8bQBQVP/MIcbiAucxxqJoz9VJBu5hiH/dncSUutkh65Sh+?=
 =?us-ascii?Q?EFKS0BUDxG0cm8Y9zUqX7d0KlOucNwt/xIoQLBi0IHtd5niryNY8sOp/HJMK?=
 =?us-ascii?Q?cXcD3UYHTw7i0WFPOYWuCzcvMA9aWNMcWWYfeSu3L1DFtrW96ZB7KbnWxxRo?=
 =?us-ascii?Q?8MyTyPdNVUy9JJhEa2ylllVojBzDbOJsbdUzdgWc8ud3efoLMH0o4Fd4ekmy?=
 =?us-ascii?Q?XsNcZrF2YozXK9swB9LXHx5aKEW5VkzWFolHbk1cSzPuKC1qdDcdq0vH2IpY?=
 =?us-ascii?Q?vmNsgKCIV4qfBDjEF62ZIkgYOku8GaQJic8y5gFpTVQ4RT8M/9bKRO8j8KaQ?=
 =?us-ascii?Q?WWbISTpKcaXWjDpsqJHyLPCkFjLYZiEVP/8zQr5ZB3biRSunFR/DlifgFbR4?=
 =?us-ascii?Q?eYnARPsLvDB72gaoUeexgYWmT0C+MIcvyYD8KZnw6cSTk1ffbknGMJJ3+zys?=
 =?us-ascii?Q?CIWt6vJTkQj4+CwRnSKyBLQFv3bTDPBkDhLXUNmehVPJuNXovtg2Ndfd/tr+?=
 =?us-ascii?Q?oiPqvPjWtnfKG0USCuXWzvc5S57q6o2eRSzuqjpP3ywBBX02VzcSz7SLHrg5?=
 =?us-ascii?Q?sXvmIgnnZMDARcorfrUyoxR5irtpSZgBl9Rr/dydbdKyZkn0ZA6IgVF4FWPu?=
 =?us-ascii?Q?nf7uFL+vz8H/Ouaz38fbPyWeSU7OOLQikETdaqHVYQRO5WqsuiBKVmEyaysq?=
 =?us-ascii?Q?L4Pg6H2vfAds+abI3wZtNsSfjaN8rL0Sg/ugbaBmn5e52Mkk94QltyOQkudK?=
 =?us-ascii?Q?pS8a1dcql+AJm5a77dlJdloNkwLJOMo/xhMf0Gl/6pgZE5m3wbmtJtyfN19U?=
 =?us-ascii?Q?e80AMvj9ZpNP3hdn/jHf5W+zWkP9rwZFIUfONFzPnUKyQSwxUYxdzYiFfdqr?=
 =?us-ascii?Q?fKMRzzr7tLjDlu0Ji3rFiV33GL4IICrPxmCdtrUAf/lHhpV/tGpArkPaP340?=
 =?us-ascii?Q?yOCA8y+/vtF2K3393NqRk1eGcXpWHDW9eDF0ZmwxNamb6zgIr8xdCkdDJoWX?=
 =?us-ascii?Q?KmxQug+iNSnCFCvT8JpZd1pt+xcCsa1pgM/WkBpHw6I6k/UX+MFv4lSMNe/t?=
 =?us-ascii?Q?mSidBD5As+PmZnUMU+zYRO0+opcWi3KcIb5r7ZVSR3MSlq99dhYSxwKBLbtK?=
 =?us-ascii?Q?H408XsFEbqMsqje/ua7e5OzITJ21qtXNcP/vsRHH5kxjZUvlQcQmwHjU4pEc?=
 =?us-ascii?Q?2FYpB6EWT4lzdEDwvpJAzPvleVsqXgtPPhicUpZS?=
MIME-Version: 1.0
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6485.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47173570-4498-48ae-95df-08dc75e55586
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 20:18:22.2035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3e0f949f-6a74-4378-baf2-0abfca8d5e06
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvsBZGhCfFvki/qFGoJl6AfOFSZrjYYtQJZ+PcD9mO3xxAgiWpXaNrxf22JFB+Tr0vtxXwSEK6K3JmarnxvvVcqqPr6WwJFGy5RkTbmVE98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5128
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sancloud.com
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Subject: [Buildroot] [PATCH 1/1] package/ti-k3-r5-loader: support patching
 in same way as u-boot
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
Cc: "X15000177@gmail.com" <X15000177@gmail.com>, "bb@ti.com" <bb@ti.com>,
 "gadiyar@ti.com" <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From ed5da96fa289155a362e6415de39a461e18935e8 Mon Sep 17 00:00:00 2001
From: Marc Murphy <marc.murphy@sancloud.com>
Date: Thu, 16 May 2024 17:09:14 +0100
Subject: [PATCH 1/1] package/ti-k3-r5-loader: support patching in same way as
 u-boot

Signed-off-by: Marc Murphy <marc.murphy@sancloud.com>
---
 boot/ti-k3-r5-loader/Config.in          | 12 ++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index c276528fad..0e26a15369 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -69,6 +69,18 @@ config BR2_TARGET_TI_K3_R5_LOADER_VERSION
                if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || \
                   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG  || \
                   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+
+config BR2_TARGET_TI_K3_R5_LOADER_PATCH
+       string "Custom U-Boot patches"
+       default ""
+       help
+         A space-separated list of patches to apply to U-Boot.
+         Each patch can be described as an URL, a local file path,
+         or a directory. In the case of a directory, all files
+         matching *.patch in the directory will be applied.
+
+         Most users may leave this empty
+
 choice
        prompt "U-Boot Configuration"
        default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 98a6d473f1..b45f30b4b0 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -60,6 +60,25 @@ TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
        $(BR2_BISON_HOST_DEPENDENCY) \
        $(BR2_FLEX_HOST_DEPENDENCY)

+# Analogous code exists in linux/linux.mk. Basically, the generic
+# package infrastructure handles downloading and applying remote
+# patches. Local patches are handled depending on whether they are
+# directories or files.
+TI_K3_R5_LOADER_PATCHES = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_PATCH))
+TI_K3_R5_LOADER_PATCH = $(filter ftp://% http://% https://%,$(TI_K3_R5_LOADER_PATCHES))
+
+define TI_K3_R5_LOADER_APPLY_LOCAL_PATCHES
+       for p in $(filter-out ftp://% http://% https://%,$(TI_K3_R5_LOADER_PATCHES)) ; do \
+               if test -d $$p ; then \
+                       $(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+               else \
+                       $(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+               fi \
+       done
+endef
+
+TI_K3_R5_LOADER_POST_PATCH_HOOKS += TI_K3_R5_LOADER_APPLY_LOCAL_PATCHES
+
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
 TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
