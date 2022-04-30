Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D087C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED247403B8;
	Sat, 30 Apr 2022 18:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjIbCiItNA8B; Sat, 30 Apr 2022 18:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A6EE40491;
	Sat, 30 Apr 2022 18:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3561BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B53E60A89
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agoOM1CvJJ9P for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:07:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8003C60A69
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 26D59847F4; Sat, 30 Apr 2022 17:57:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:01:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa3ec4f4abd6cbf3d037e17632aaa5232fb9b5aa
X-Git-Newrev: a15e35c4ebc52f29f65372c8e86cefa874aa4aaf
X-Patchwork-Hint: ignore
Message-Id: <20220430175731.26D59847F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] falcosecurity-libs: add new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a15e35c4ebc52f29f65372c8e86cefa874aa4aaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a dependency of newer sysdig. It contains the driver, and also a
few userspace components. The latter however are not meant to be
installed in the sysroot; instead, the whole thing is meant to be
included directly in the build of the project using it. Changing things
so it does work in the normal way of installing to the sysroot turns out
to be pretty complicated.

Basically, falcosecurity-libs is just a component of sysdig. It's
defined as a separate package only because that's an easier way to
download it than defining extra download and extract commands in sysdig
itself. For this reason, it's defined as a blind option in Config.in.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 +++++++++
 package/falcosecurity-libs/Config.in               | 30 ++++++++
 package/falcosecurity-libs/falcosecurity-libs.hash |  5 ++
 package/falcosecurity-libs/falcosecurity-libs.mk   | 84 ++++++++++++++++++++++
 6 files changed, 155 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 127abb853f..b08253d6ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -970,6 +970,7 @@ F:	package/ipmitool/
 F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	package/falcosecurity-libs
 F:	package/pahole/
 F:	package/sysdig/
 F:	package/tbb/
diff --git a/package/Config.in b/package/Config.in
index 1bf458348b..4687dd4426 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1936,6 +1936,7 @@ menu "Other"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
+	source "package/falcosecurity-libs/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
new file mode 100644
index 0000000000..6141d8ef72
--- /dev/null
+++ b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
@@ -0,0 +1,34 @@
+From 2e8a50cd4975df3ab60ee07c9675831cd5ad397f Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Tue, 12 Apr 2022 19:54:11 +0100
+Subject: [PATCH] cmake: Permit setting GRPC_CPP_PLUGIN.
+
+This patch enables users to set GRPC_CPP_PLUGIN while calling cmake with:
+cmake -DGRPC_CPP_PLUGIN=/path
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ cmake/modules/grpc.cmake | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/modules/grpc.cmake b/cmake/modules/grpc.cmake
+index e5fd16b8..9d8f5934 100644
+--- a/cmake/modules/grpc.cmake
++++ b/cmake/modules/grpc.cmake
+@@ -12,9 +12,11 @@ elseif(NOT USE_BUNDLED_GRPC)
+ 		set(GRPCPP_LIB gRPC::grpc++)
+ 
+ 		# gRPC C++ plugin
+-		get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
+ 		if(NOT GRPC_CPP_PLUGIN)
+-			message(FATAL_ERROR "System grpc_cpp_plugin not found")
++			get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
++			if(NOT GRPC_CPP_PLUGIN)
++				message(FATAL_ERROR "System grpc_cpp_plugin not found")
++			endif()
+ 		endif()
+ 
+ 		# gRPC include dir + properly handle grpc{++,pp}
+-- 
+2.25.1
+
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
new file mode 100644
index 0000000000..e0b5a3d134
--- /dev/null
+++ b/package/falcosecurity-libs/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_FALCOSECURITY_LIBS
+	bool
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
+	depends on !BR2_STATIC_LIBS # protobuf, tbb
+	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_GRPC
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_HOST_GRPC
+	select BR2_PACKAGE_HOST_PROTOBUF
+	select BR2_PACKAGE_JQ
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBB64
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_TBB
+	select BR2_PACKAGE_VALIJSON
+	select BR2_PACKAGE_ZLIB
+	help
+	  falcosecurity/libs provides libsinsp, libscap, the kernel
+	  module driver and the eBPF driver sources.
+
+	  https://github.com/falcosecurity/libs
diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs.hash
new file mode 100644
index 0000000000..2e239ca2fe
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs.hash
@@ -0,0 +1,5 @@
+# sha256 locally computed
+sha256  80903bc57b7f9c5f24298ecf1531cf66ef571681b4bd1e05f6e4db704ffb380b  falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a.tar.gz
+sha256  21ec9433a87459b3477faf542bacec419dc03af841309eac35edeffe481cf10b  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
+sha256  f17d3f2c2d565a74a7d5bf96f880c43701e141897e8dff0c8aa13e5d07aaf226  driver/MIT.txt
diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
new file mode 100644
index 0000000000..f2c389948f
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -0,0 +1,84 @@
+################################################################################
+#
+# falcosecurity-libs
+#
+################################################################################
+
+FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
+FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
+FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
+FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
+FALCOSECURITY_LIBS_CPE_ID_VENDOR = falco
+FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+FALCOSECURITY_LIBS_DEPENDENCIES = \
+	c-ares \
+	elfutils \
+	grpc \
+	gtest \
+	host-grpc \
+	host-protobuf \
+	jq \
+	jsoncpp \
+	libb64 \
+	libcurl \
+	luainterpreter \
+	openssl \
+	protobuf \
+	tbb \
+	valijson \
+	zlib
+
+FALCOSECURITY_LIBS_DRIVER_NAME = scap
+FALCOSECURITY_LIBS_MODULE_SUBDIRS = driver
+FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+# falcosecurity-libs module needs these two kernel options to be set:
+# CONFIG_TRACEPOINTS
+# CONFIG_HAVE_SYSCALL_TRACEPOINTS
+# https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-from-the-Source-Code#linux-and-osx
+# CONFIG_FTRACE and CONFIG_SCHED_TRACER selects CONFIG_GENERIC_TRACER which in
+# turns select CONFIG_TRACING which in turns select CONFIG_TRACEPOINTS
+define FALCOSECURITY_LIBS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SCHED_TRACER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_SYSCALL_TRACEPOINTS)
+endef
+
+# falcosecurity-libs creates the module Makefile from a template, which contains
+# a single place-holder, KBUILD_FLAGS, wich is only replaced with debug flags,
+# which we don't care about here.
+# So, just replace the place-holder with the only meaningful value: nothing.
+# For the DRIVER_NAME, we set it to FALCOSECURITY_LIBS_DRIVER_NAME.
+# So, when sysdig will be run, it will automatically load
+# FALCOSECURITY_LIBS_DRIVER_NAME.ko.
+# We also need to do the same process for driver_config.h.in.
+# PPM_API_CURRENT_VERSION_* were take from driver/API_VERSION and
+# PPM_SCHEMA_CURRENT_VERSION_* from driver/SCHEMA_VERSION.
+# For the others, it was taken by inspecting
+# falcosecurity-libs/*/CMakeLists.txt, which normally creates these
+# files, but doesn't work well with the kernel-module infrastructure.
+define FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
+	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
+	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
+	$(SED) 's/@DRIVER_NAME@/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/Makefile
+
+	$(INSTALL) -m 0644 $(@D)/driver/driver_config.h.in $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${DRIVER_VERSION}//;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${DRIVER_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${DRIVER_DEVICE_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${GIT_COMMIT}/0.1.1dev/;' $(@D)/driver/driver_config.h
+endef
+FALCOSECURITY_LIBS_POST_PATCH_HOOKS += FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
+
+# Userspace components are not built and installed, because it this
+# package is intended to be included as source in another build.
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
