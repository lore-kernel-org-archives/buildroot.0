Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB8CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B265E84C48;
	Fri, 17 Dec 2021 17:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4P4yoY1HEnGK; Fri, 17 Dec 2021 17:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D97A84BCF;
	Fri, 17 Dec 2021 17:47:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58F931BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DADB61138
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diGYn2k4m_v9 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E0861119
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5892482226; Fri, 17 Dec 2021 17:40:24 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 18:39:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44cd33baa2254dc98d756076f96ac1fbcbd0c289
X-Git-Newrev: 8b6235af78d68e1ef58c3993725fbe7192dd1633
X-Patchwork-Hint: ignore
Message-Id: <20211217174024.5892482226@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: add options for BMP and NHRPD
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b6235af78d68e1ef58c3993725fbe7192dd1633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BMP and NHRPD default to enabled. Both of them require c-ares. However,
if BMP and NHRPD are disabled, it is possible to build without c-ares.

Create user-visible configuration options for BMP and NHRPD and only
depend on c-ares if either of them is selected.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure.ac-fix-enable_bmp-typo.patch    | 29 ++++++++++++++++++++++
 package/frr/Config.in                              | 17 ++++++++++++-
 package/frr/frr.mk                                 | 16 ++++++++++--
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
new file mode 100644
index 0000000000..c8ce500dfc
--- /dev/null
+++ b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
@@ -0,0 +1,29 @@
+From bacabf2476553d0e873b827359e1c8a4216c2f8c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 16 Dec 2021 20:10:26 +0100
+Subject: [PATCH] configure.ac: fix enable_bmp typo
+
+enable_bmp doesn't exist, use enable_bgp_bmp
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/FRRouting/frr/pull/10236]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1bcc42ef8..c7a5f1286 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1806,7 +1806,7 @@ if test "$enable_bgp_vnc" != "no";then
+ fi
+ 
+ bgpd_bmp=false
+-case "${enable_bmp}" in
++case "${enable_bgp_bmp}" in
+   no)
+     ;;
+   yes)
+-- 
+2.33.0
+
diff --git a/package/frr/Config.in b/package/frr/Config.in
index 877b75b107..c2e9577a27 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_FRR
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_READLINE
@@ -19,6 +18,22 @@ config BR2_PACKAGE_FRR
 
 	  https://frrouting.org
 
+if BR2_PACKAGE_FRR
+
+config BR2_PACKAGE_FRR_BMP
+	bool "BMP protocol"
+	select BR2_PACKAGE_C_ARES
+	help
+	  Build BGP Monitoring Protocol daemon.
+
+config BR2_PACKAGE_FRR_NHRPD
+	bool "NHRPD protocol"
+	select BR2_PACKAGE_C_ARES
+	help
+	  Build Next Hop Routing Protocol daemon.
+
+endif
+
 comment "frr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 97cc735935..3bd587a1cd 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -12,8 +12,8 @@ FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
-FRR_DEPENDENCIES = host-frr readline json-c \
-	libyang libnl c-ares
+FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
+	$(if $(BR2_PACKAGE_C_ARES),c-ares)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
@@ -35,6 +35,18 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 
 HOST_FRR_CONF_OPTS = --enable-clippy-only
 
+ifeq ($(BR2_PACKAGE_FRR_BMP),y)
+FRR_CONF_OPTS += --enable-bgp-bmp
+else
+FRR_CONF_OPTS += --disable-bgp-bmp
+endif
+
+ifeq ($(BR2_PACKAGE_FRR_NHRPD),y)
+FRR_CONF_OPTS += --enable-nhrpd
+else
+FRR_CONF_OPTS += --disable-nhrpd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 FRR_DEPENDENCIES += libcap
 FRR_CONF_OPTS += --enable-capabilities
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
