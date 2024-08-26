Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E155C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 13:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F279760719;
	Mon, 26 Aug 2024 13:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BlSMfcYQeOZ; Mon, 26 Aug 2024 13:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C721160778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C721160778;
	Mon, 26 Aug 2024 13:19:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 421991BF2F4
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3056C40376
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_2tcO4gV6Nu for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 13:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD74D40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD74D40347
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD74D40347
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 13:19:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8ACAD2003CE;
 Mon, 26 Aug 2024 15:19:31 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 15:19:24 +0200
Message-ID: <20240826131924.7702-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826131924.7702-1-vjardin@free.fr>
References: <7kble6ezjwutfk3f6niiignnxgmq5rxhsvplayvlkj5ahczg7i@dyco5ij36lrp>
 <20240826131924.7702-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724678376;
 bh=/tBPFPFCGVbIurlIZ8UM3PmNcpv+jaHnikFKu4YxxBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MlNb6B2tMcOfGetOw5rVW2ot6wFvPgUfkIl3qS9AjJiCHeHaN6C+/oBMZ0/sAbMMo
 iAMzh4X1PspoyobAbCYWS/fbiQTOKhZcTae3CLtjc//Zp3tyjgxRpJyfJ+WMn6qugz
 0YjJPLzXZX2NBUaqY7d4gHwTRCfVcWBQDhLTl40vwcPyoUg6ifWeNCnSbb1lpAPt1h
 XHVHBmO7+aw84r0hsnyZKwQN2K6jKwDS+7HBW0ncEobxdvfgP3/yitKGkdjRk4gd07
 FGZcFYYeA89xmnTpnFO1CNJzfgcyeTzIO3TjDxJX18rA45pbMTJMjByHwxLHMuxuY1
 wZEDHyf7W8rCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MlNb6B2t
Subject: [Buildroot] [PATCH v4 1/1] package/frr: update to 9.1.1
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
Cc: Vincent Jardin <vjardin@free.fr>, Vadim Kochan <vadim4j@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest 9.x version. Protobuf is now mandatory.

Thanks to the suggestions from Thomas Petazzoni: Since there is
a dependency on BR2_PACKAGE_PROTOBUF_C, the dependencies of protobuf_c
should be imported into FRR's Config.in and the comment should be
aligned accordingly.
Note that in order to enable FRR, the following must be enabled
to support C++:
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_PACKAGE_FRR=y

COPYING hash updated:
The COPYING file has evolved to expose more details: the respective
licenses are now listed, except for the GPLv3 license. The GPLv3
license is only required when FRR is compiled with the GCC plugin
that extends printf type checks. This plugin should not be enabled
for production code.
For more information, see FRR's workflow.rst document.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

frr/Config.in: enable CXX

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/frr/Config.in | 12 +++++++++---
 package/frr/frr.hash  | 12 ++++++++++--
 package/frr/frr.mk    | 21 ++++++++++++++++++---
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index 0afd8c61a2..c26b160b2a 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -1,15 +1,19 @@
 config BR2_PACKAGE_FRR
 	bool "frr"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  The FRRouting Protocol Suite.
 
@@ -34,7 +38,9 @@ config BR2_PACKAGE_FRR_NHRPD
 
 endif
 
-comment "frr needs a toolchain w/ threads, dynamic library"
+comment "frr needs a toolchain w/ threads, dynamic library, C++, host gcc >= 7"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 4a61084bae..81f8dfdae3 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,11 @@
 # Locally calculated
-sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  6eb254c72dca867fefffd5ded80a6c2d5ce8df223ce93263302db4b8bfbb19c4  frr-9.1.1.tar.gz
+sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
+sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
+sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  doc/licenses/GPL-2.0
+sha256  6d80da3224cbdcf016ea554e00fc9cd933bd1a3417cb5e5b7abf59f6d126761d  doc/licenses/ISC
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/licenses/LGPL-2.1
+sha256  2a1124bf8bc60f1f59b67e15e3d261b5d60fcd9674a3eace0a5502fd4287d528  doc/licenses/LicenseRef-Skiplist-BSD-0-Clause
+sha256  074415b57c6ba1780483d89e55f40dec3ded96c28aaf47d63c486683ba553e7c  doc/licenses/MIT
+sha256  b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c  doc/licenses/Unlicense
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 1b7d66fc68..7f26fd3c57 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,15 +4,28 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.5.4
+FRR_VERSION = 9.1.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
-FRR_LICENSE = GPL-2.0
-FRR_LICENSE_FILES = COPYING
+FRR_LICENSE = GPL-2.0+
+FRR_LICENSE_FILES = \
+	COPYING \
+	doc/licenses/BSD-2-Clause \
+	doc/licenses/BSD-3-Clause \
+	doc/licenses/GPL-2.0 \
+	doc/licenses/ISC \
+	doc/licenses/LGPL-2.1 \
+	doc/licenses/LicenseRef-Skiplist-BSD-0-Clause \
+	doc/licenses/MIT \
+	doc/licenses/Unlicense
+# tools/gcc-plugins/frr-format.[ch] is not enabled by frr's ./configure, so gcc's
+# GPLv3 does not apply
+#	doc/licenses/GPL-3.0
 FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
+	protobuf-c \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
@@ -22,6 +35,8 @@ FRR_CONF_ENV = \
 	ac_cv_lib_cunit_CU_initialize_registry=no \
 	CFLAGS="$(TARGET_CFLAGS) -DFRR_XREF_NO_NOTE"
 
+# Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
+# it is only intended for FRR's developments
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
 	--localstatedir=/var/run/frr \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
