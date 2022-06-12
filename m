Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4F0C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6136F8134C;
	Sun, 12 Jun 2022 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjflLR5O8tYu; Sun, 12 Jun 2022 15:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBFE812EC;
	Sun, 12 Jun 2022 15:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE1151BF3D0
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D669B60BBD
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-_8Uep38hWR for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C30E607FE
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D5A0586E4D; Sun, 12 Jun 2022 15:06:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 17:18:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 217b054197773792f6e1ee0747b826f0573764f3
X-Git-Newrev: 49766be2f26b17305dd753b5012d246758d9821b
X-Patchwork-Hint: ignore
Message-Id: <20220612150625.D5A0586E4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=49766be2f26b17305dd753b5012d246758d9821b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-config is not used by wolftpm and wolfssl dependency is missing (and
optional but highly recommended) resulting in the following build failure
since the addition of the package in commit
4bb884a3c61c6b71e33f69453a90eb2a367f64b7:

configure: error: WolfSSL library not found. You can get it from http://www.wolfssl.com/download.html
        If it's already installed, specify its path using --with-wolfcrypt=/dir or --prefix=/dir

Fixes:
 - http://autobuild.buildroot.org/results/77a93521b909e701ef4e86f18524258b9242c721

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wolftpm/Config.in  | 23 ++++++++++++++++++-----
 package/wolftpm/wolftpm.mk | 13 ++++++++++---
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0fe094f277..0b964c3d7e 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_WOLFTPM
 	bool "wolftpm"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_WOLFSSL
-	select BR2_PACKAGE_WOLFSSL_ALL
 	help
 	  wolfTPM is a portable, open-source TPM 2.0 stack with
 	  backward API compatibility, designed for embedded use.
@@ -12,5 +8,22 @@ config BR2_PACKAGE_WOLFTPM
 
 	  https://www.wolfssl.com/
 
-comment "wolftpm needs a toolchain w/ threads, dynamic library"
+if BR2_PACKAGE_WOLFTPM
+
+config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
+	bool "wolfCrypt hooks"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wolfssl
+	depends on !BR2_STATIC_LIBS # wolfssl-all
+	select BR2_PACKAGE_WOLFSSL
+	# not mandatory, but needed to get all features
+	select BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  Enable wolfCrypt hooks for RNG, Auth Sessions and Parameter
+	  encryption. Disabling this option is not recommended as it
+	  could create a security breach in most environments.
+
+comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+endif
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index ea01eaad6b..760656e134 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -10,7 +10,6 @@ WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
 WOLFTPM_LICENSE_FILES = LICENSE
 WOLFTPM_CPE_ID_VENDOR = wolfssl
-WOLFTPM_DEPENDENCIES = host-pkgconf
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
 # wolfTPM's source code is released without a configure script,
@@ -19,8 +18,7 @@ WOLFTPM_AUTORECONF = YES
 
 WOLFTPM_CONF_OPTS = \
 	--disable-examples \
-	--enable-devtpm \
-	--with-wolfcrypt=$(STAGING_DIR)/usr
+	--enable-devtpm
 
 # Fix for missing config.rpath in the codebase
 define WOLFTPM_TOUCH_CONFIG_RPATH
@@ -29,4 +27,13 @@ define WOLFTPM_TOUCH_CONFIG_RPATH
 endef
 WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_WOLFCRYPT),y)
+WOLFTPM_CONF_OPTS += \
+	--enable-wolfcrypt \
+	--with-wolfcrypt=$(STAGING_DIR)/usr
+WOLFTPM_DEPENDENCIES += wolfssl
+else
+WOLFTPM_CONF_OPTS += --disable-wolfcrypt
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
