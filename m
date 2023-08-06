Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6EBC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C4F410E9;
	Sun,  6 Aug 2023 13:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C4F410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIaeGLVTdU9w; Sun,  6 Aug 2023 13:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A664011A;
	Sun,  6 Aug 2023 13:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A664011A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF401BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF113817FD
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF113817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVZ3_VJEIdcg for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD2E8144C
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD2E8144C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC1E84406; Sun,  6 Aug 2023 13:57:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 15:38:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0fb677c087228bd853ad66f31191378a9f1b39c2
X-Git-Newrev: 4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606
X-Patchwork-Hint: ignore
Message-Id: <20230806135751.8BC1E84406@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] pkg-cmake: add option to
 select the Ninja generator
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cmake supports multiple generators. For now, Buildroot only uses the
venerable "GNU Makefile" generator, which generates Makefiles as the
build backend.

Cmake also has support for Ninja as a build backend, and provides the
corresponding generator. Ninja is a small build system with a focus on
speed. It is mainly used with the meson build system, but also cmake has
very good support for it.

Packages that are selecting Ninja (or over time another generator),
should also use the _BUILD_{ENV,OPTS} variables instead of the _MAKE
variables.

No _INSTALL{,_STAGING,_TARGET}_OPTS used so far, so reuse as cmake install opts:

    $ grep '_INSTALL_OPTS' $(git grep -l -E '\$\(eval \$\((host-)?cmake-package))')
    $ grep '_INSTALL_STAGING_OPTS' $(git grep -l -E '\$\(eval \$\((host-)?cmake-package))')
    $ grep '_INSTALL_TARGET_OPTS' $(git grep -l -E '\$\(eval \$\((host-)?cmake-package))')

The _MAKE_{ENV,OPTS} are copied to _BUILD_{ENV,OPTS}, involved packages:

    $ grep '_MAKE_ENV =' $(git grep -l -E '\$\(eval \$\((host-)?cmake-package))')

    package/netopeer2/netopeer2.mk:NETOPEER2_MAKE_ENV = \
    package/racehound/racehound.mk:RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)

    (qt6, webkitgtk, and wpewebkit also match, but already use -Gninja)

    $ grep '_MAKE_OPTS =' $(git grep -l -E '\$\(eval \$\((host-)?cmake-package))')

    package/mariadb/mariadb.mk:HOST_MARIADB_MAKE_OPTS = import_executables
    package/zeek/zeek.mk:HOST_ZEEK_MAKE_OPTS = binpac bifcl

Only "musepack" seems to overwrite MAKE to enforce -j1, so replace it:

    $ grep '_MAKE =' $(git grep -l -E '\$\(eval \$\((host-)?cmake-package))')

    package/musepack/musepack.mk:MUSEPACK_MAKE = $(MAKE1)

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Reviewed-by: John Keeping <john@metanate.com>
[yann.morin.1998@free.fr:
  - switch to FOO_CMAKE_BACKEND = (make|ninja)
  - use firstword of $(MAKE), not $(BR2_MAKE)
  - explain why we use firstword of $(MAKE)
  - update manual with the three new variables
  - yweak commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-cmake.txt |  8 +++++++
 package/musepack/musepack.mk          |  2 +-
 package/pkg-cmake.mk                  | 41 +++++++++++++++++++++++++----------
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 541d7422cf..4f336db737 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -91,6 +91,10 @@ typical packages will therefore only use a few of them.
   the tree extracted by the tarball. If +HOST_LIBFOO_SUBDIR+ is not
   specified, it defaults to +LIBFOO_SUBDIR+.
 
+* +LIBFOO_CMAKE_BACKEND+ specifies the cmake backend to use, one of
+  `make` (to use the GNU Makefiles generator, the default) or `ninja`
+  (to use the Ninja generator).
+
 * +LIBFOO_CONF_ENV+, to specify additional environment variables to
   pass to CMake. By default, empty.
 
@@ -107,6 +111,10 @@ typical packages will therefore only use a few of them.
 ** +BUILD_EXAMPLE+, +BUILD_EXAMPLES+ are disabled;
 ** +BUILD_TEST+, +BUILD_TESTS+, +BUILD_TESTING+ are disabled.
 
+* +LIBFOO_BUILD_ENV+ and +LIBFOO_BUILD_OPTS+ to specify additional
+  environment variables, or command line options, to pass to the backend
+  at build time.
+
 * +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO+ should be set when the package
   cannot be built inside the source tree but needs a separate build
   directory.
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index fc66c684a5..d4dd08df36 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -9,7 +9,7 @@ MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
-MUSEPACK_MAKE = $(MAKE1)
+MUSEPACK_BUILD_OPTS = -j1
 MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
 MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
 
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8c375779cb..e085fb2b5d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -51,13 +51,10 @@ endif
 
 define inner-cmake-package
 
-$(2)_MAKE			?= $$(MAKE)
-$(2)_INSTALL_OPTS		?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
-$(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
-
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
+# The default backend, unless specified by the package
+$(3)_CMAKE_BACKEND ?= make
 
 ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
@@ -65,6 +62,24 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+ifeq ($$($(3)_CMAKE_BACKEND),make)
+$(2)_GENERATOR = "Unix Makefiles"
+# $$(MAKE) can be 'make -jN', we just want 'make'  (possibly with a full path)
+$(2)_GENERATOR_PROGRAM = $(firstword $$(MAKE))
+# Generator specific code (make) should be avoided,
+# but for now, copy them to the new variables.
+$(2)_BUILD_ENV ?= $$($(2)_MAKE_ENV)
+$(2)_BUILD_OPTS ?= -- $$($(2)_MAKE_OPTS)
+
+else ifeq ($$($(3)_CMAKE_BACKEND),ninja)
+$(2)_DEPENDENCIES += host-ninja
+$(2)_GENERATOR = "Ninja"
+$(2)_GENERATOR_PROGRAM = $(HOST_DIR)/bin/ninja
+
+else
+$$(error Unsupported cmake backend "$$($(3)_CMAKE_BACKEND)")
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -88,7 +103,8 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +135,8 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -166,11 +183,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 endif
 endif
@@ -181,7 +198,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
 endef
 endif
 
@@ -191,7 +208,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -201,7 +218,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
