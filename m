Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3034DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0430C418B8;
	Wed,  3 Apr 2024 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sOmuU4i8oqi; Wed,  3 Apr 2024 21:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D72B417C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D72B417C6;
	Wed,  3 Apr 2024 21:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A12F1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6769F41713
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNfGtbDa7NQV for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C01E4042B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C01E4042B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64D0B848D4; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:09:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 087115b96a6b053a333de2960aa75c6dd122f087
X-Git-Newrev: 57391fad2e619395340b81957ddceab1b1df2e20
X-Patchwork-Hint: ignore
Message-Id: <20240403210939.64D0B848D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57391fad2e619395340b81957ddceab1b1df2e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a significant api change as well as more recent kernel version
requirements, we introduce a separate package for version 2.0 and higher.
The new package is incompatible to libgpiod 1.x. This allows for iteratively
updating all dependent packages without breaking anything as a result.

For now we will have libgpiod2 depend on !libgpiod. However, in the
future, it might be preferable to have it the other way around,
such that packages, which select libgpiod2 don't have to also add the
the !libgpiod dependency.

Python bindings fail to build, so they are unconditionally disabled.
setup.py when called from Makefile tries to do native compilation
instead of cross-compilation, which fails at link time with
/usr/bin/ld: skipping incompatible ../../lib/.libs//libgpiod.so when searching for -lgpiod

Note that this package does not correspond to the debian libgpiod2 package,
which currently uses only version 1.6.3

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/libgpiod2/Config.in      | 30 ++++++++++++++++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  4 ++++
 package/libgpiod2/libgpiod2.mk   | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 71 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6b38db0857..7dca6a441a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -531,6 +531,9 @@ N:	Bilal Wasim <bilalwasim676@gmail.com>
 F:	board/chromebook/elm/
 F:	configs/chromebook_elm_defconfig
 
+N:	Boerge Struempfel <boerge.struempfel@gmail.com>
+F:	package/libgpiod2/
+
 N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
diff --git a/package/Config.in b/package/Config.in
index 410fe0f493..b1237e5d6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1751,6 +1751,7 @@ menu "Hardware handling"
 	source "package/libftdi1/Config.in"
 	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
+	source "package/libgpiod2/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
new file mode 100644
index 0000000000..5a13bfc344
--- /dev/null
+++ b/package/libgpiod2/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LIBGPIOD2
+	bool "libgpiod2"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on !BR2_PACKAGE_LIBGPIOD
+	help
+	  This is a C library that abstracts the GPIO character
+	  device operations on linux.
+
+	  This package is the continuation of the libgpiod package
+	  for versions 2.0 and above.
+
+	  Note that a kernel of 5.10 or above is required for the
+	  ioctls to work.
+
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
+
+if BR2_PACKAGE_LIBGPIOD2
+
+config BR2_PACKAGE_LIBGPIOD2_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing GPIOs.
+
+endif
+
+comment "libgpiod2 needs kernel headers >= 5.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+
+comment "libgpiod2 is incompatible with libgpiod"
+	depends on BR2_PACKAGE_LIBGPIOD
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
new file mode 100644
index 0000000000..b5488496b2
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.hash
@@ -0,0 +1,4 @@
+# From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
+sha256  fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c  libgpiod-2.1.tar.xz
+# Hash for license file
+sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
new file mode 100644
index 0000000000..9c478f1ffb
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libgpiod2
+#
+################################################################################
+
+# Be careful when bumping versions.
+# Dependency on kernel header versions may change.
+LIBGPIOD2_VERSION = 2.1
+LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
+LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
+LIBGPIOD2_LICENSE = LGPL-2.1+
+LIBGPIOD2_LICENSE_FILES = COPYING
+LIBGPIOD2_INSTALL_STAGING = YES
+LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
+LIBGPIOD2_CONF_OPTS = \
+	--disable-bindings-python \
+	--disable-examples \
+	--disable-tests
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
+LIBGPIOD2_CONF_OPTS += --enable-tools
+else
+LIBGPIOD2_CONF_OPTS += --disable-tools
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
