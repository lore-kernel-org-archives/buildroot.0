Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:41:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C2160200
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56C2160200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A50060788;
	Sat,  4 Sep 2021 20:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrMCXBwisxFf; Sat,  4 Sep 2021 20:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5804A6077F;
	Sat,  4 Sep 2021 20:41:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1551BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 062454014E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmQpNS0vydYZ for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20805.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::805])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A07B40105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeiKNR4ZfzYUZf1CkZWyoLOZefie/E7N4mGSWS5l+kKAdiGTBn+BMgvFtaFUYNNdjSYdv1Z9g/zg4Hd9otkNGi60XTP5VbL4NiOJEkPLQZ7DNkJCgIRRO4jqyF3wfS0Va8+rROEl+V4SOmC2igMNEqJwnxgu7BUIQyIiL9ftz7ZJz9+s1GI6l/y1crR85s5dfHPZ4UrF+vHbATRhcz0CI0V4RBsepbaSKhO2OyjlFxOrP2mOkTrvlCm+uMf2E+cNUsUsZ9/iagx7GS1e+52auOd4FjX8QYyIKYK31lTQKkqiBOM8g4nuGINIz5dpXWgAvHAUllRpfCaIh0aQAS16ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0zcbn3q225LGC/oZoCWs9FVSY/fB38tyDMgXLquPLdw=;
 b=Q/dGTotI/J/TQJHtdU0/HTuhr1MFsCeqfm8Seix/4099LxEzAcjHeOeAqmDvdGVLcimY/JCYmBtnFccgQnDP7nC3uUqjEO7dgXBhMpFYN1jgrt+OYqSJDxGWJCT8rleYmoEK9NZqPl9BDL7jf5JiubxZpc4GBhm8vt6acq7x5S68sVS3MKp7RxJsXlWsQWUkyrEH6Vkqj5DOQHj0Vfv6p+4ph3CyZlVgMRBtRsIkwBu+1I7uDlb9SV1AAnN/bwAM4cUgi+jITDSDNzMqidN/xdpzqOG+CgorpTI4tN2jAtl0iLYp81ZpCYKLB2NsXQsU380NsbjAbZ01qRVgo1atoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zcbn3q225LGC/oZoCWs9FVSY/fB38tyDMgXLquPLdw=;
 b=GdqgikkQTELnf5GxqCeUN3cqop3n0xy7G7Qong7tRdw259k+3eMyjS9bAmjPzpt90duV5kL+rtrnnNZo7DlJe6Sy0NYtvHqhJhQYjM4/qdzOrRXcQVVKenMz/h4N1qCN7kPq3z9JVWHIq7LU9zB4yNxhovHgONQK9WuLIHPeeoMelczV2ZLFIu7OrSZ3POBy/qx5P1ufgtHgUzONyRdUO55pEcDnYVauYGMZu8jPOHI93PLvfhUmzjYIIyp1OWJ4vO7LFOZhrijbl/+xbdEDLw+mTwS/DPP8xtKIXI/zDrhkaFtc8GqFSZj4pjR6ujagWJN/FynvNJVkuuJnU57PmA==
Received: from DM6PR08MB3993.namprd08.prod.outlook.com (20.176.66.156) by
 DM5PR08MB2714.namprd08.prod.outlook.com (10.173.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Sat, 4 Sep 2021 20:40:42 +0000
Received: from DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013]) by DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013%5]) with mapi id 15.20.4478.019; Sat, 4 Sep 2021
 20:40:42 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 16:40:23 -0400
Message-ID: <DM6PR08MB39937E02CFE8C1C61A541E41A0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.28.0.windows.1
X-TMN: [bbzbQG7/Lt/hlEIRG3Z6xvwDmhvop69WoUPSqGZXyRtBvK8ZvCPhPzLmbtmxX/jTleTPq4VNZ8Q=]
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To DM6PR08MB3993.namprd08.prod.outlook.com
 (2603:10b6:5:85::28)
X-Microsoft-Original-Message-ID: <20210904204025.15457-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2607:fea8:e341:f0f0:5cf8:7779:fa4b:9c0d)
 by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Sat, 4 Sep 2021 20:40:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 662a5400-1b15-42e6-8ce4-08d96fe44348
X-MS-Exchange-SLBlob-MailProps: O6V8p96XToyAxbiHfbXxRpp91oYjosMrcAOhL7IEO41ZDbloZOLoA3eI8Xc1hvR8IlFW2BjYyU9kQm0Z1pnNse7dklKLrOII9XFnmjn0vb9W3/wEnpLQRRpuRldFCd/sRdf+l6Wn+7PrcVOnsBJhzJ/GRt1T3hnehJcqDaCUdgg2ybhwyA4XwlKLC6khbmO84VQK4c2HDll+ZgKX6/zBTK4nzgHm3CsA6jJcCGxnFquSThYtyu7L2jdVxAY7t4r8EMyK1dczfj9jSX/F3AFOQW3Qz9+y0pHiPUCBPACcuXAMSoOqcDijY9d52vb4d03MqzkENjXVD3Y6cDLPCOw95lZywJjxBV0B0AsXcbuPYTUTDWZqY/Jy9Y1Q8d03R/KVGEwzsAbS9EXbm1tSK+jDagsAQH9Wto85KA4kVUQPc8MuGpC4iWyVS4LEssWnuV5qpENuMGzIX+fk3sO0pEkm40f2FGdlulEedEHVC5uRWMCvQ2jnVBDaZAvrECPDLYsmpZstaRDxt88WIszHTyqCnOa2imwjhQCdsJ3IKxWGPTRyixUh0e5zLQyd5NgQD+IAU2kH50qOEXdVCfhBDW6gn2/UfElJWlzMZstyfVDxucFDOF9A0K1ZFuMecT0vC/xmGEFkrGQGRojsZawYBebmTjPUPB0lgl6bzZaOKyNt433TBNo22WM/PUKSxhAzya+Pe6EwksRJQvOjcMlNlqqKicdzttxjU2IPF3U+jk0TPSZpieSMgnRAPJq4pnrJosphJmxLDmDddN9PoctU5XeTyZWMz5WrVONzvQSCy5h4+ck9+/N5vEMSzrJh7G4aim3LEkMh8LpkuEo+Qa1/vpK6ljXYlUqGrA5GVVVYrraKStg=
X-MS-TrafficTypeDiagnostic: DM5PR08MB2714:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08VloNecy8RAZjF9ujBOOKc4iYdBhFqhy6eg5aaluLxHRmaPBmwGwhghor+68oB8UoTBDKmk3Tr3MIxBNEQ+aj4pIM+zUAarGBmfhUn5OGeEVeZd+mOJTT5cLDwU10KXKulbfqJBMHDN2lu1rlj5uf6Pm+bQM65MGA0R+QPX8eYvMpql/yyC1nfFcwG90Y3fIzF/jO5ItlZdqWz2wGif7/DH+VcJafHCF+UNRiqDrPlZ7ct4HWsddP5xGBckvjAIPwWmleNnPBQg43rgeGl68mmlvOBpyvj0io8KnvC0z16YMhBvYB4NQnG+HskN8+iD8TcWfIW/Qb4CYmi2Lgxpjpa8NWLnh3hcim9sjMOKu4C60jDf1a2zRhQhfMqo/V+517IT2x9pph4AgEdNcYw4uvUwGQCuGFhdSTzKymjiVueuYDArQwyNU5boXxfrLX+B2hyC4Kh8VgGd0Xj4iV+/mMq4koTaXOXHplpB8M3nvxI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CKH3agrcEF2ta2iKaiHQhTWSRsNedh/A6N2A3CmSirV16ZZGfmzc/6wpvGrMGU/sp44Od9GT5tC1AL/3kL2kocnp8p3jyahDrdeOlHvzTYOPIkUjjOQ01KFPUbaYBeWhexQlcUy/4i4xkMHbfGWbubIn/V0+WmstgcptKljJVYqPsNCBwzrZ28Ts6pWy5jyCkn10iNx12NCmN2s3QZ7zCw==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-124b4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 662a5400-1b15-42e6-8ce4-08d96fe44348
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB3993.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 20:40:42.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2714
Subject: [Buildroot] [PATCH 1/3] package/rpm: bump version to 4.17.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Bumping the version of the rpm package to v4.17. This new release
includes a series of key changes [1], notables includes:

 - Explicit requirement for lua v5.3+.
 - Berkeley DB database backend has been dropped.
 - beecrypt and NSS crypto backends have been dropped.

The argument `--with-external-db` was tied to Berkeley-related support,
which was removed in an older revision [2]. The argument
`--without-hackingdocs` was dropped in an older revision [3].

[1]: https://rpm.org/wiki/Releases/4.17.0
[2]: https://github.com/rpm-software-management/rpm/commit/e1d3811883dc9fe79fe7b5ff90f69b9998611128
[3]: https://github.com/rpm-software-management/rpm/commit/3017eae9a3952823f80932e84a7a1e81f983639a

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/rpm/Config.in |  8 +++++---
 package/rpm/rpm.hash  |  4 ++--
 package/rpm/rpm.mk    | 25 ++++---------------------
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index ac979fdbad..9da8d51df0 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,5 +1,6 @@
-comment "rpm needs a toolchain w/ dynamic library and threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_LUA_5_3
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_USE_MMU
 
@@ -7,9 +8,10 @@ config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_LUA_5_3
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 9389f8290f..19b6dd9176 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.16.1.3.html
-sha256  513dc7f972b6e7ccfc9fc7f9c01d5310cc56ee853892e4314fa2cad71478e21d  rpm-4.16.1.3.tar.bz2
+# From https://rpm.org/wiki/Releases/4.17.0.html
+sha256  2e0d220b24749b17810ed181ac1ed005a56bbb6bc8ac429c21f314068dc65e6a  rpm-4.17.0.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index ae324fbeef..816deceff7 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.16
-RPM_VERSION = $(RPM_VERSION_MAJOR).1.3
+RPM_VERSION_MAJOR = 4.17
+RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
@@ -13,6 +13,7 @@ RPM_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
 	file \
+	lua \
 	popt \
 	$(if $(BR2_PACKAGE_XZ),xz) \
 	zlib \
@@ -28,10 +29,7 @@ RPM_SELINUX_MODULES = rpm
 RPM_CONF_OPTS = \
 	--disable-python \
 	--disable-rpath \
-	--with-external-db \
-	--with-gnu-ld \
-	--without-hackingdocs \
-	--without-lua
+	--with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
@@ -40,13 +38,6 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
-ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-RPM_DEPENDENCIES += berkeleydb
-RPM_CONF_OPTS += --enable-bdb
-else
-RPM_CONF_OPTS += --disable-bdb
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
 RPM_CONF_OPTS += --enable-plugins
@@ -64,14 +55,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RPM_DEPENDENCIES += libgcrypt
 RPM_CONF_OPTS += --with-crypto=libgcrypt
-else ifeq ($(BR2_PACKAGE_LIBNSS),y)
-RPM_DEPENDENCIES += libnss
-RPM_CONF_OPTS += --with-crypto=nss
-RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
-else ifeq ($(BR2_PACKAGE_BEECRYPT),y)
-RPM_DEPENDENCIES += beecrypt
-RPM_CONF_OPTS += --with-crypto=beecrypt
-RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
 else
 RPM_DEPENDENCIES += openssl
 RPM_CONF_OPTS += --with-crypto=openssl
-- 
2.28.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
