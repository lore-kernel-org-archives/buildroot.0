Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA6CC5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 16:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6943A605A3;
	Sun, 25 Aug 2024 16:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jJr_Lo4it_T; Sun, 25 Aug 2024 16:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3D9606D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D3D9606D5;
	Sun, 25 Aug 2024 16:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 360BF1BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 039E7606D5
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 16:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbe3xhop-SMe for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 16:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31DE7605F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DE7605F4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31DE7605F4
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 16:43:00 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2563:2cb1:d34e:50d7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 79AFE13F8A9;
 Sun, 25 Aug 2024 18:42:54 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 18:40:38 +0200
Message-ID: <20240825164038.42818-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240825164038.42818-1-vjardin@free.fr>
References: <20240823185817.4658f57a () windsurf>
 <20240825164038.42818-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724604178;
 bh=B6HDai599RynIzpc/qu7WgkOhI+B9ueyl0YYoub5ync=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxmMsb585L68IT6disMBc+TGQEWdu+cKRAwnj6SsOn2s8RKyMa1uKELJF4ce7z4o9
 /mhyhIl2E0wVEcYtoDP68MbpxmeqE7h1E0q9NGl5qtl5mPNCFO3hw3VEzU3X2jmFqg
 LcVgb+VMOpRTUOUZsRctHJZbQ7rydTweFbzcg1LXzp3x0PykUjYxeJamZqg8Ok2LEm
 +ns0A+36+ZUgAF6nnDKusiOlp2O92A6KmkiLwuarhFV5JdK1R2kOo6bFApaLFXZqNv
 6uD+yYFyLefQ2yo7O8g+mS4uzMrxbGP1wQ73O/K11hQ5nQGhCiK4XFGRCSOV5WnbsT
 IuaAAPjrTG8OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nxmMsb58
Subject: [Buildroot] [PATCH v3 1/1] package/frr: update to 9.1.1
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

Update to the latest 9.x version.  Protobuf becomes mandatory.

Thanks to the suggestions from Thomas Petazzoni:
since we have added a dependency on BR2_PACKAGE_PROTOBUF_C, we should
"import" into FRR's Config.in the protobuf_c's depends and align the
comment accordingly too.

COPYING hash updated:
The COPYING file has evoled toward more details: the respective
licenses are listed except the GPLv3 one since it is only required
when FRR is compiled with the GCC plugin that extends the printf's
type checks. This plugin shall not be enabled for production code.

See FRR's workflow.rst document for more information.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/frr/Config.in | 11 +++++++++--
 package/frr/frr.hash  | 12 ++++++++++--
 package/frr/frr.mk    | 21 ++++++++++++++++++---
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index 0afd8c61a2..a445b0fbe7 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -4,12 +4,17 @@ config BR2_PACKAGE_FRR
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
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
 
@@ -34,7 +39,9 @@ config BR2_PACKAGE_FRR_NHRPD
 
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
index 1b7d66fc68..5af819262c 100644
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
+# tools/gcc-plugins/frr-format.[ch] is not enabled at ./configure time, so gcc's GPL3
+# for this plugin does not apply
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
 
+# Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst
+# for more information ; it is only intended for FRR's developments
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
 	--localstatedir=/var/run/frr \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
