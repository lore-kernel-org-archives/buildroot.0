From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Oct 2018 14:58:51 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: fix build on Aarch64_be a53
Message-ID: <20181020125851.23827-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build on Aarch64_be a53 with binutils gold linker in version 2.28 fails:
/home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld.gold: internal error in update_erratum_insn, at /home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/aarch64_be-linux-gnu/snapshots/binutils-gdb.git~users~linaro~binutils-2_28-branch/gold/aarch64.cc:998

This error is related to 843419 erratum:
 - https://lore.kernel.org/patchwork/patch/847483/
 - http://sourceware-org.1504.n7.nabble.com/PATCH-gold-Fix-aarch64-fix-errata-and-relocate-erratum-stubs-internal-error-td465738.html

Issue is that old versions of GNU gold are known to produce broken code
with --fix-cortex-a53-843419 as explained in:
 - https://sourceware.org/ml/binutils-cvs/2015-06/msg00188.html
 - https://sourceware.org/bugzilla/show_bug.cgi?id=21491

Issue has been fixed in:
 - https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e70c0b5f07daf63474e805f8d0a45152fcd60468

We don't know if ARM64_ERRATUM_843419 is enabled or disabled when
we're using GNU gold so we don't know if we have to pass
--fix-cortex-a53-843419 or --no-fix-cortex-a53-843419 to the linker.

We don't know either what is the version of binutils used by an external
toolchain.

So, disable gold linker through the -no-use-gold-linker option of the
configure script to fix the issue

Fixes:
 - http://autobuild.buildroot.org/results/eb55bf44622697039a4ced510ee2d45b950d0a08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ab2b883fc4..d3c6c31d45 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -27,6 +27,12 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+# internal error in update_erratum_insn on Aarch64 a53 with gold before
+# binutils 2.29: https://sourceware.org/bugzilla/show_bug.cgi?id=21491
+ifeq ($(BR2_aarch64_be)$(BR2_cortex_a53)$(BR2_TOOLCHAIN_USES_GLIBC),yyy)
+QT5BASE_CONFIGURE_OPTS += -no-use-gold-linker
+endif
+
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_DEPENDENCIES += pcre
 else
-- 
2.17.1
