Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E4FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713AF82021;
	Sat, 13 Jul 2024 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbNGy2sIhONy; Sat, 13 Jul 2024 20:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214308209B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214308209B;
	Sat, 13 Jul 2024 20:31:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6158F1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F6D260753
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z86L1xDRh68W for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10BAD6075D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10BAD6075D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CB5786667; Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:21:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c19ba0dfcd91f8846dd415622c71ce35b8c748db
X-Git-Newrev: 23c21c6f2942e8038133d20d33f6388ef8a06c18
X-Patchwork-Hint: ignore
Message-Id: <20240713203105.0CB5786667@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: add variable to
 skip ccache dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=23c21c6f2942e8038133d20d33f6388ef8a06c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As more and more packages are required to build the host ccache package
and therefore they has to be filtered out for ccache dependency the list
growed up.

By adding the variable <PKG>_ADD_CCACHE_DEPENDENCY with the default
value to 'yes' we can remove that dependency for each package that is
needed by ccache by setting the value to 'no'. This can be done  in the
package makefile instead of tracking the list in the core pkg-generic.mk file.

This behavior is similar to the skeleton and toolchain dependency.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Arnout: move the BR2_CCACHE condition to the dependency itself]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/blake3/blake3.mk     |  3 +++
 package/ccache/ccache.mk     |  4 ++++
 package/cmake/cmake.mk       |  3 +++
 package/fakedate/fakedate.mk |  3 +++
 package/hiredis/hiredis.mk   |  3 +++
 package/lzip/lzip.mk         |  3 +++
 package/pkg-generic.mk       | 11 +++++------
 package/pkgconf/pkgconf.mk   |  3 +++
 package/skeleton/skeleton.mk |  3 +++
 package/tar/tar.mk           |  3 +++
 package/xxhash/xxhash.mk     |  3 +++
 package/xz/xz.mk             |  3 +++
 package/zstd/zstd.mk         |  3 +++
 13 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 5625046db6..3b1ccb44cc 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,9 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0, CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
+
 # We may be a ccache dependency, so we can't use ccache; reset the
 # options set by the cmake infra.
 HOST_BLAKE3_CONF_OPTS += \
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index d92608512c..f727ca04bd 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -9,6 +9,10 @@ CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSI
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
+
+# Do not add a recursive dependency to its own
+HOST_CCACHE_ADD_CCACHE_DEPENDENCY = NO
+
 HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd host-xxhash host-blake3
 
 # We are ccache, so we can't use ccache
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index eacecdc0ee..842457eb34 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -14,6 +14,9 @@ CMAKE_CPE_ID_VALID = YES
 # Tool download MITM attack warning if using npm package to install cmake
 CMAKE_IGNORE_CVES = CVE-2016-10642
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
+
 # CMake is a particular package:
 # * CMake can be built using the generic infrastructure or the cmake one.
 #   Since Buildroot has no requirement regarding the host system cmake
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
index 99ea748e07..3db9145e63 100644
--- a/package/fakedate/fakedate.mk
+++ b/package/fakedate/fakedate.mk
@@ -7,6 +7,9 @@
 # source included in buildroot
 HOST_FAKEDATE_LICENSE = GPL-2.0+
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_FAKEDATE_ADD_CCACHE_DEPENDENCY = NO
+
 define HOST_FAKEDATE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/bin/date
 endef
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 476b079336..86f35bd4cd 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -12,6 +12,9 @@ HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_HIREDIS_ADD_CCACHE_DEPENDENCY = NO
+
 HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON
 HOST_HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
 
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 31b5750767..9e09e578db 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -9,6 +9,9 @@ LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_LZIP_ADD_CCACHE_DEPENDENCY = NO
+
 define LZIP_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --prefix=/usr \
 		$(TARGET_CONFIGURE_OPTS) )
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0c9308701b..66eba848e7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -761,6 +761,7 @@ endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 # Similarly for the skeleton.
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
 $(2)_ADD_SKELETON_DEPENDENCY	?= YES
+$(2)_ADD_CCACHE_DEPENDENCY	?= YES
 
 
 ifeq ($(4),target)
@@ -772,6 +773,10 @@ $(2)_DEPENDENCIES += toolchain
 endif
 endif
 
+ifeq ($$(BR2_CCACHE):$$($(2)_ADD_CCACHE_DEPENDENCY),y:YES)
+$(2)_DEPENDENCIES += host-ccache
+endif
+
 ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
@@ -792,12 +797,6 @@ $(2)_EXTRACT_DEPENDENCIES += \
 		$$(call extractor-pkg-dependency,$$(notdir $$(dl))))
 endif
 
-ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd host-xxhash host-blake3,$(1)),)
-$(2)_DEPENDENCIES += host-ccache
-endif
-endif
-
 ifeq ($$(BR2_REPRODUCIBLE),y)
 ifeq ($$(filter host-skeleton host-fakedate,$(1)),)
 $(2)_DEPENDENCIES += host-fakedate
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 1d73b691e1..a8c7b48287 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,6 +11,9 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 PKGCONF_CPE_ID_VENDOR = pkgconf
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_PKGCONF_ADD_CCACHE_DEPENDENCY = NO
+
 # We are a ccache dependency, so we can't use ccache
 HOST_PKGCONF_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4eaaf32ead..1bb3971191 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,6 +11,9 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_SKELETON_ADD_CCACHE_DEPENDENCY = NO
+
 # Although the $(HOST_DIR)/usr symlink is mostly for backward compatibility,
 # there are weird packages that still require it (see host-systemd, and
 # commit 35c11a027c88).
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index a7e85afb72..b9de082603 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,6 +13,9 @@ TAR_CPE_ID_VENDOR = gnu
 TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_TAR_ADD_CCACHE_DEPENDENCY = NO
+
 # busybox installs in /bin, so we need tar to install as well in /bin
 # so that we don't end up with two different tar
 #
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index fde8e464f9..f16a784966 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -10,6 +10,9 @@ XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
 XXHASH_INSTALL_STAGING = YES
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_XXHASH_ADD_CCACHE_DEPENDENCY = NO
+
 XXHASH_TARGETS = xxhsum libxxhash.pc
 XXHASH_INSTALL_TARGETS = \
 	install_libxxhash.includes \
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index fa4f6dbda9..e295144ed1 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -13,6 +13,9 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
+
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
 	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a2da0dd479..575bb2c838 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,6 +12,9 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_ZSTD_ADD_CCACHE_DEPENDENCY = NO
+
 ZSTD_OPTS += PREFIX=/usr
 ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
 ifeq ($(BR2_PACKAGE_ZLIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
