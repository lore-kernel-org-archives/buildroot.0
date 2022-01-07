Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1009AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFC860A82;
	Fri,  7 Jan 2022 19:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kl_rdpcVJPhu; Fri,  7 Jan 2022 19:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4DA760A76;
	Fri,  7 Jan 2022 19:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 622E51BF5DC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C77760A76
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S121miMSyJFG for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:07:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E5460A75
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:07:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C1E6882AD1; Fri,  7 Jan 2022 19:01:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 20:07:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93aa9db953f127509ed64b3a8caceca878963b6c
X-Git-Newrev: 03ca6f4e39874583060317e7e15e9e360220877e
X-Patchwork-Hint: ignore
Message-Id: <20220107190148.C1E6882AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=03ca6f4e39874583060317e7e15e9e360220877e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the io_uring library, liburing. liburing provides helpers to
setup and teardown io_uring instances, and also a simplified interface
for applications that don't need (or want) to deal with the full kernel
side implementation.

https://git.kernel.dk/cgit/liburing

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/liburing/Config.in     | 15 +++++++++++++++
 package/liburing/liburing.hash |  8 ++++++++
 package/liburing/liburing.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 630196fd54..47ac7b5de6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -906,6 +906,7 @@ F:	package/librsync/
 F:	package/libsoup/
 F:	package/libsoxr/
 F:	package/libupnp/
+F:	package/liburing/
 F:	package/libv4l/
 F:	package/libxslt/
 F:	package/mbedtls/
diff --git a/package/Config.in b/package/Config.in
index e9ee4d2ef1..193ccea1f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2000,6 +2000,7 @@ menu "Other"
 	source "package/libuci/Config.in"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
+	source "package/liburing/Config.in"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
diff --git a/package/liburing/Config.in b/package/liburing/Config.in
new file mode 100644
index 0000000000..d65a3f1322
--- /dev/null
+++ b/package/liburing/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBURING
+	bool "liburing"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	help
+	  This is the io_uring library, liburing. liburing provides
+	  helpers to setup and teardown io_uring instances, and also a
+	  simplified interface for applications that don't need (or
+	  want) to deal with the full kernel side implementation.
+
+	  https://git.kernel.dk/cgit/liburing
+
+comment "liburing needs a toolchain w/ gcc >= 4.9, headers >= 5.1"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
new file mode 100644
index 0000000000..56e90d71cc
--- /dev/null
+++ b/package/liburing/liburing.hash
@@ -0,0 +1,8 @@
+# Locally calculated
+sha256  df7c8fd05fd39da622b2814e06f815f11f1beb429487a4330eed64bb7f353dbf  liburing-2.1.tar.bz2
+
+# Hash for license files
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
+sha256  d0b225f17ef2d05d5cda6b25b2dc334ef6f5f12537c20edf6e391852a095ec19  LICENSE
+sha256  97d62ff5d7cf0b1cef34c33a89877352911278ca4ac1c6c4f24a835baa5ea10b  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
new file mode 100644
index 0000000000..a977e74b4f
--- /dev/null
+++ b/package/liburing/liburing.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# liburing
+#
+################################################################################
+
+LIBURING_VERSION = 2.1
+LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
+LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
+LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
+LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
+LIBURING_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBURING_MAKE_OPTS += ENABLE_SHARED=0
+else
+LIBURING_MAKE_OPTS += ENABLE_SHARED=1
+endif
+
+define LIBURING_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+endef
+
+define LIBURING_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D)/src
+endef
+
+define LIBURING_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBURING_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
