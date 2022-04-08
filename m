Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAABDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 13:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202AA41CD2;
	Sat,  9 Apr 2022 13:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iMK3NmRaALK; Sat,  9 Apr 2022 13:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC1841CA8;
	Sat,  9 Apr 2022 13:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7732B1BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 13:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 737228445F
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 13:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lqkaSAHfyQk for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 13:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BBE7843AD
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 13:52:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 059958365C; Sat,  9 Apr 2022 13:42:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 8 Apr 2022 21:06:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f3cfe41961d83a9c01630f241bf045e3aa59b40
X-Git-Newrev: c114c9e8ce3cca598babe77dca0d2137fa404a4b
X-Patchwork-Hint: ignore
Message-Id: <20220409134230.059958365C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c114c9e8ce3cca598babe77dca0d2137fa404a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Intel Threading Building Blocks (TBB), is a C++ library to help developers
write highly parallelized applications. OpenCV uses it to accelerate some of
it's more heavy weight procedures.

Signed-off-by: bradford barr <bradford@density.io>
Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
[Arnout:
 - add LICENSE hash;
 - replace patch with explicit passing of CPLUS, CONLY, CXXFLAGS;
 - rework handling of arch and add comment about it.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/tbb/Config.in | 16 ++++++++++++++++
 package/tbb/tbb.hash  |  3 +++
 package/tbb/tbb.mk    | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a66b9d7eee..ef4ddcab50 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -970,6 +970,7 @@ F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
 F:	package/pahole/
+F:	package/tbb/
 
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..24f7af5ea8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2044,6 +2044,7 @@ endif
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
+	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/tbb/Config.in b/package/tbb/Config.in
new file mode 100644
index 0000000000..0f40b74d31
--- /dev/null
+++ b/package/tbb/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TBB
+	bool "tbb"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
+	  easily write parallel C++ programs that take full advantage
+	  of multicore performance, that are portable, composable and
+	  have future-proof scalability.
+
+	  https://www.threadingbuildingblocks.org/
+
+comment "tbb needs a glibc toolchain w/ dynamic library, threads, C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
new file mode 100644
index 0000000000..81d224b3ca
--- /dev/null
+++ b/package/tbb/tbb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b8dbab5aea2b70cf07844f86fa413e549e099aa3205b6a04059ca92ead93a372  tbb-2018_U5.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
new file mode 100644
index 0000000000..e5929388a2
--- /dev/null
+++ b/package/tbb/tbb.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# tbb
+#
+################################################################################
+
+TBB_VERSION = 2018_U5
+TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
+TBB_INSTALL_STAGING = YES
+TBB_LICENSE = Apache-2.0
+TBB_LICENSE_FILES = LICENSE
+
+TBB_SO_VERSION = 2
+TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
+TBB_BIN_PATH = $(@D)/build/linux_*
+
+# arch is normally set based on uname -m with some conversions. However,
+# it is not really used for much:
+# - to decide between 32 or 64-bit files (based on '64' in the name)
+# - to decide on some arch-specific CFLAGS like -m32, which we don't actually want
+# - to set DO_ITT_NOTIFY if it's x86 (32 or 64 bit)
+# - to include assembler source, but it only exists for ia64
+# The only thing we actually want from the above is the 32/64-bit, and
+# DO_ITT_NOTIFY. Therefore, set arch to a fixed value which is unknown to
+# the tbb build system, and set DO_ITT_NOTIFY explicitly.
+TBB_ARCH = $(if $(BR2_ARCH_IS_64),buildroot64,buildroot32)
+TBB_ITT_NOTIFY = $(if $(BR2_i386)$(BR2_x86_64),-DDO_ITT_NOTIFY)
+TBB_CXXFLAGS = $(TARGET_CXXFLAGS) $(TBB_ITT_NOTIFY)
+
+define TBB_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) arch=$(TBB_ARCH) \
+		CPLUS="$(TARGET_CXX)" CONLY="$(TARGET_CC)" CXXFLAGS="$(TBB_CXXFLAGS)"
+endef
+
+define TBB_INSTALL_LIBS
+	$(foreach lib,$(TBB_LIBS),
+		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
+			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
+		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
+	)
+endef
+
+define TBB_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/
+	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
+endef
+
+define TBB_INSTALL_TARGET_CMDS
+	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
