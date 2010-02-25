From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Feb 2010 17:27:50 +0100
Subject: [Buildroot] [git commit master] gmp/mpfr: make sure host builds add
	source targets to HOST_SOURCE
Message-ID: <20100225163219.350687776F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f561763e9189d668001004f5a603738c1ba7ce7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1183.

When gmp/mpfr is needed for the host (E.G. when using an internal toolchain),
the host-lib{gmp,mpfr}-source targets weren't added to HOST_SOURCE, so
make source / external-deps didn't handle them.

Notice that we have the same issue with the new host package support,
there we should probably use HOST_<package>_DEPENDENCIES for -source
dependencies.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    1 +
 package/gmp/gmp.mk              |    1 +
 package/mpfr/mpfr.mk            |    1 +
 toolchain/binutils/binutils.mk  |    1 +
 toolchain/gcc/gcc-uclibc-4.x.mk |    1 +
 5 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 402c947..4709fdf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,6 +10,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#165: openmotif does not build
+	#1183: make source fails to download gmp, mpfr and patches
 
 2010.02-rc2, Released February 23th, 2010:
 
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 7ae78c7..a3488b8 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -93,6 +93,7 @@ $(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT): $(GMP_DIR2)/.configured
 	$(MAKE) -C $(GMP_DIR2) install
 
 host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)
+host-libgmp-source: libgmp-source
 host-libgmp-clean:
 	rm -rf $(GMP_HOST_DIR)
 	-$(MAKE) -C $(GMP_DIR2) clean
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 595edc3..a7834dd 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -107,6 +107,7 @@ $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_LIBEXT): $(MPFR_DIR2)/.configured
 	$(MAKE) -C $(MPFR_DIR2) install
 
 host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY)
+host-libmpfr-source: libmpfr-source
 host-libmpfr-clean:
 	rm -rf $(MPFR_HOST_DIR)
 	-$(MAKE) -C $(MPFR_DIR2) clean
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 288a000..77e7d3d 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -37,6 +37,7 @@ endif
 ifndef BINUTILS_NO_MPFR
 BINUTILS_HOST_PREREQ:=$(TOOLCHAIN_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
 	$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
+HOST_SOURCE += host-libgmp-source host-libmpfr-source
 
 BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/usr/lib/libgmp$(LIBTGTEXT) \
 	$(TARGET_DIR)/usr/lib/libmpfr$(LIBTGTEXT)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index dcca431..cf76e8a 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -107,6 +107,7 @@ endif
 ifndef GCC_NO_MPFR
 GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
+HOST_SOURCE += host-libgmp-source host-libmpfr-source
 
 ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
-- 
1.6.3.3
