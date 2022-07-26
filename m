Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB471C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7741B40178;
	Tue, 26 Jul 2022 20:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7741B40178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cj4DxBLKxCyG; Tue, 26 Jul 2022 20:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D546F40176;
	Tue, 26 Jul 2022 20:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D546F40176
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D031C1BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 380CD40012
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 380CD40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVGJkd8Z8jID for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23CF040116
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23CF040116
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 972CD86029; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbb8eb0be2229d21c8e265047a43158e806c8f51
X-Git-Newrev: 9522dde0708fc49c337e94b0653a41a83acb93ac
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.972CD86029@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9522dde0708fc49c337e94b0653a41a83acb93ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit proposes a very minimal package for qt6base. It only
supports building QtCore, so it *really* is minimal. But that's a
starting point, which we can progressively build on top. It is based
on initial work from Peter Seiderer.

This minimal QtCore build is however sufficient to build and run
simple non-graphical Qt applications.

A number of comments:

 - Even though there's only qt6base for now, many other qt6 modules
   will come later on, which is why we're using the same structure as
   for qt5, with a subdir for package/qt6/

 - Qt6 is mutually exclusive with Qt5. Even though the library names
   on the target and the location of the header files are distinct,
   the host tools (qmake, moc and al.) have the same name, so at least
   for now, we make them mutually exclusive.

 - We've chosen to use non-bundled libraries for zlib, bb2,
   double-conversion and pcre2, for both the target and the host
   qt6base packages.

 - Contrary to qt5 where the target package was building the host
   tools, now we have a host qt6base package building the host tools,
   and which is needed as a dependency for the target qt6base package.

 - qt6base is using CMake. However, it strongly recommends to use
   Ninja as a backend instead of make, a recommendation that we follow
   in this commit. Since we don't have support for Ninja in the
   cmake-package infrastructure (yet), we do this manually in
   qt6base.mk itself, by passing -Gninja to CMake at configure time,
   and then by using cmake --build at build time and cmake --install
   at install time, using explicitly provided build and install
   commands. Hopefully these can go away once we have support for
   Ninja directly in cmake-package.

 - We disable a number of features or external libraries using FEATURE
   options. However, because there are over 400 FEATURE options in
   qt6base, we didn't go all the way to explicitly disabling *all* of
   them (which would be needed for both the host and target
   packages). We expect that this list of explicit FEATURE options
   disabling will need to grow based on the feedback of users and
   issues encountered.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/qt6/Config.in                              | 43 ++++++++++++
 package/qt6/qt6.mk                                 | 12 ++++
 ...-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch | 49 ++++++++++++++
 package/qt6/qt6base/Config.in                      | 16 +++++
 package/qt6/qt6base/qt6base.mk                     | 79 ++++++++++++++++++++++
 7 files changed, 201 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 164df02aec..70dd167d91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2877,6 +2877,7 @@ F:	package/python-git/
 F:	package/python-serial/
 F:	package/python-unittest-xml-reporting/
 F:	package/qextserialport/
+F:	package/qt6/
 F:	package/riscv64-elf-toolchain/
 F:	package/rpcbind/
 F:	package/rt-tests/
diff --git a/package/Config.in b/package/Config.in
index 79ef303bc1..3e6d763cd9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -374,6 +374,7 @@ comment "QT libraries and helper libraries"
 	source "package/qwt/Config.in"
 	source "package/simple-mail/Config.in"
 endif
+	source "package/qt6/Config.in"
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
new file mode 100644
index 0000000000..86394f49ba
--- /dev/null
+++ b/package/qt6/Config.in
@@ -0,0 +1,43 @@
+# based on src/corelib/global/qprocessordetection.h
+config BR2_PACKAGE_QT6_ARCH_SUPPORTS
+	bool
+	# no support for ARMv4
+	default y if BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	# sparc 32-bit is supposedly supported, but has issues due to
+	# the need of libatomic
+	default y if BR2_sparc64
+	depends on BR2_USE_MMU
+
+comment "qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, host gcc >= 8"
+	depends on !BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT6_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+menuconfig BR2_PACKAGE_QT6
+	bool "Qt6"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_HOST_GCC_AT_LEAST_8
+	depends on BR2_PACKAGE_QT6_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE
+	help
+	  This option enables the Qt6 framework. Sub-options allow to
+	  select which modules should be built.
+
+	  http://qt.io
+
+if BR2_PACKAGE_QT6
+
+source "package/qt6/qt6base/Config.in"
+
+endif
diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
new file mode 100644
index 0000000000..03e87d0574
--- /dev/null
+++ b/package/qt6/qt6.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# qt6
+#
+################################################################################
+
+QT6_VERSION_MAJOR = 6.3
+QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_SOURCE_TARBALL_PREFIX = everywhere-src
+QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
+
+include $(sort $(wildcard package/qt6/*/*.mk))
diff --git a/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch b/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
new file mode 100644
index 0000000000..1097a79922
--- /dev/null
+++ b/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
@@ -0,0 +1,49 @@
+From d69db2ba3ce47f6eded0a8843c413a67d26e6375 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 24 Jul 2022 20:37:51 +0200
+Subject: [PATCH] src/corelib/global/qsimd_p.h: fix build on ARM < v7 due to
+ yield instruction
+
+On ARM < v7 with gcc, the build fails with:
+
+/tmp/ccRlrCQi.s: Assembler messages:
+/tmp/ccRlrCQi.s:3858: Error: selected processor does not support `yield' in ARM mode
+/tmp/ccRlrCQi.s:3875: Error: selected processor does not support `yield' in ARM mode
+/tmp/ccRlrCQi.s:4606: Error: selected processor does not support `yield' in ARM mode
+/tmp/ccRlrCQi.s:4853: Error: selected processor does not support `yield' in ARM mode
+/tmp/ccRlrCQi.s:5268: Error: selected processor does not support `yield' in ARM mode
+
+while building src/corelib/thread/qfutureinterface.cpp.
+
+This is due to the fact that the qYieldCpu() macro on ARM, assumes
+that if the compiler is gcc, we can do asm volatile("yield"). However,
+this instruction is only guaranteed to exist on ARMv7+ cores. It
+doesn't exist on ARMv5, and only some (but not all) ARMv6 cores have
+it. If it's not available, we just fallback to the default behavior of
+qYieldCpu(), which is to do nothing.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream bug: https://bugreports.qt.io/browse/QTBUG-105162
+---
+ src/corelib/global/qsimd_p.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/global/qsimd_p.h b/src/corelib/global/qsimd_p.h
+index d270d09f2f..b84b257e54 100644
+--- a/src/corelib/global/qsimd_p.h
++++ b/src/corelib/global/qsimd_p.h
+@@ -428,7 +428,10 @@ static inline void qYieldCpu()
+          https://stackoverflow.com/a/70076751/134841
+          https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105416
+     */
+-    asm volatile("yield"); /* this works everywhere */
++#    if defined(Q_PROCESSOR_ARM_V7)
++    /* The yield instruction appeared in ARMv7 */
++    asm volatile("yield");
++#    endif
+ #  else
+     __yield(); /* this is what should work everywhere */
+ #  endif
+-- 
+2.37.1
+
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
new file mode 100644
index 0000000000..a489ce39fc
--- /dev/null
+++ b/package/qt6/qt6base/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_QT6BASE
+	bool "qt6base"
+	select BR2_PACKAGE_DOUBLE_CONVERSION
+	select BR2_PACKAGE_LIBB2
+	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_PCRE2_16
+	select BR2_PACKAGE_ZLIB
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6base module, which
+	  contains the base Qt libraries: QtCore, QtNetwork, QtGui,
+	  QtWidgets, etc.
+
+	  http://qt.io
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
new file mode 100644
index 0000000000..c67d94e193
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# qt6base
+#
+################################################################################
+
+QT6BASE_VERSION = $(QT6_VERSION)
+QT6BASE_SITE = $(QT6_SITE)
+QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_DEPENDENCIES = \
+	host-ninja \
+	host-qt6base \
+	double-conversion \
+	libb2 \
+	pcre2 \
+	zlib
+QT6BASE_INSTALL_STAGING = YES
+
+QT6BASE_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DFEATURE_gui=OFF \
+	-DFEATURE_concurrent=OFF \
+	-DFEATURE_xml=OFF \
+	-DFEATURE_sql=OFF \
+	-DFEATURE_testlib=OFF \
+	-DFEATURE_network=OFF \
+	-DFEATURE_dbus=OFF \
+	-DFEATURE_icu=OFF \
+	-DFEATURE_glib=OFF \
+	-DFEATURE_system_doubleconversion=ON \
+	-DFEATURE_system_pcre2=ON \
+	-DFEATURE_system_zlib=ON \
+	-DFEATURE_system_libb2=ON
+
+define QT6BASE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
+endef
+
+define QT6BASE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR) --prefix $(STAGING_DIR)/usr
+endef
+
+define QT6BASE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR) --prefix $(TARGET_DIR)/usr
+endef
+
+HOST_QT6BASE_DEPENDENCIES = \
+	host-ninja \
+	host-double-conversion \
+	host-libb2 \
+	host-pcre2 \
+	host-zlib
+HOST_QT6BASE_CONF_OPTS = \
+	-GNinja \
+	-DFEATURE_gui=OFF \
+	-DFEATURE_concurrent=OFF \
+	-DFEATURE_xml=ON \
+	-DFEATURE_sql=OFF \
+	-DFEATURE_testlib=OFF \
+	-DFEATURE_network=OFF \
+	-DFEATURE_dbus=OFF \
+	-DFEATURE_icu=OFF \
+	-DFEATURE_glib=OFF \
+	-DFEATURE_system_doubleconversion=ON \
+	-DFEATURE_system_libb2=ON \
+	-DFEATURE_system_pcre2=ON \
+	-DFEATURE_system_zlib=ON
+
+define HOST_QT6BASE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(BR2_CMAKE) --build $(HOST_QT6BASE_BUILDDIR)
+endef
+
+define HOST_QT6BASE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
