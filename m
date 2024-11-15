Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C2D68BDD
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 23:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133C2610A4;
	Fri, 15 Nov 2024 23:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHN9QpmMja7j; Fri, 15 Nov 2024 23:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FF2610AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14FF2610AE;
	Fri, 15 Nov 2024 23:59:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5313FBF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D3684751
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETZ6JgwWlAxl for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 23:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23371845C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23371845C4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23371845C4
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:28 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:c8e6:f99:ce4c:c68])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2C2B5B00539;
 Sat, 16 Nov 2024 00:59:23 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr,
	Vincent Jardin <vjardin@iliad-free.fr>
Date: Sat, 16 Nov 2024 00:57:55 +0100
Message-ID: <20241115235757.43480-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241115235757.43480-1-vjardin@free.fr>
References: <20241115235757.43480-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731715166;
 bh=2TZGOuNzinhV1hfuiEHhZKSJg3tBITRgoci4rEsPjCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mLuSCZpkjTYj3XC7D9fFvl4l8KHEYOhxBIrqilW86YwiK0qn3uRmNeE2LH+CJfpRS
 Zmsn+C+BnPt30mo8v4yXEIa5K82GbW29ii5O3tDDlWIcES8SetFSbqXa4n60HOWeoD
 IibWp+yWGuk9ow7pAK8BQO7ti64f6CN81ep/XQ8rXXqDKimgzY1SVUUoaijJHvDevh
 yggBB/Gv4lIHpI5ZaBqx7Wg4P4CBABIwLDUNecHqVR3dyKgWsYC3sW7MFaXIaqQejl
 Xxm7zeRfViWjH07JfHCAqfJGFsa2Z13z5RbxiaL4Xyt5YcEZzNDqZWPUjwsBd80LgM
 2Ja41aYw2YB3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mLuSCZpk
Subject: [Buildroot] [PATCH v1 1/3] package/mstflint: add new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Collection of debug tools for the systems with a Mellanox/NVIDIA device.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Jardin <vjardin@iliad-free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/mstflint/Config.in   | 16 ++++++++++++++
 package/mstflint/mstflint.mk | 42 ++++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/mstflint/Config.in
 create mode 100644 package/mstflint/mstflint.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..32dcff4127 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/mstflint/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..926e10cdbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -569,6 +569,7 @@ endmenu
 	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
+	source "package/mstflint/Config.in"
 	source "package/mxt-app/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
diff --git a/package/mstflint/Config.in b/package/mstflint/Config.in
new file mode 100644
index 0000000000..5882c4ac0e
--- /dev/null
+++ b/package/mstflint/Config.in
@@ -0,0 +1,16 @@
+comment "mstflint needs a toolchain w/ C++, wchar, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_MSTFLINT
+	bool "mstflint"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SQLITE
+	help
+	  Collection of Mellanox/NVIDIA firmware tools.
+
+	  https://github.com/Mellanox/mstflint
diff --git a/package/mstflint/mstflint.mk b/package/mstflint/mstflint.mk
new file mode 100644
index 0000000000..a250a32310
--- /dev/null
+++ b/package/mstflint/mstflint.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# mstflint
+#
+################################################################################
+
+MSTFLINT_VERSION = v4.30.0-1
+MSTFLINT_SITE = $(call github,Mellanox,mstflint,$(MSTFLINT_VERSION))
+MSTFLINT_LICENSE = GPL-2.0
+MSTFLINT_LICENSE_FILES = LICENSE COPYING
+
+MSTFLINT_INSTALL_STAGING = YES
+MSTFLINT_AUTORECONF = YES
+MSTFLINT_DEPENDENCIES = host-pkgconf
+
+# Infiniband dependency is not managed
+MSTFLINT_CONF_OPTS += --disable-inband
+MSTFLINT_CONF_OPTS += --disable-rdmem
+
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+MSTFLINT_CONF_OPTS += --enable-openssl
+MSTFLINT_DEPENDENCIES += libopenssl
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT)$(BR2_PACKAGE_XZ),yy)
+MSTFLINT_CONF_OPTS += --enable-adb-generic-tools
+MSTFLINT_DEPENDENCIES += expat
+MSTFLINT_DEPENDENCIES += xz # lzma.h
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_XZ),yy)
+MSTFLINT_CONF_OPTS += --enable-fw-mgr
+MSTFLINT_DEPENDENCIES += xz # lzma.h
+MSTFLINT_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+MSTFLINT_CONF_OPTS += --enable-xml2
+MSTFLINT_DEPENDENCIES += libxml2
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
