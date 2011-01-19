From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jan 2011 17:19:42 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: only fetch
	gcc/gmp/mpfr/mpc when using a buildroot toolchain
Message-ID: <20110119162113.779F18B4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9bc58a42af830ecccfdb6c1d4f837356567c6386
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3103

gcc/gmp/mpfr/mpc are only needed when using an internal buildroot toolchain,
so only add them to HOST_SOURCE then.

Otherwise we get some nasty fetch error when doing "make source"

[Peter: add gmpc/mpfr/mpc and reword commit text]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    1 +
 toolchain/gcc/gcc-uclibc-4.x.mk |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index baddfad..a825511 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,6 +44,7 @@
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
 	#3007: kexec doesn't build: Missing regdef.h file
+	#3103: make external-deps wants to download gcc-.tar.bz2 when...
 	#3109: abnormal `make busybox-menuconfig`
 
 2010.11, Released November 30th, 2010:
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 80bed5e..2c857dc 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -109,12 +109,16 @@ endif
 
 GCC_WITH_HOST_GMP = --with-gmp=$(HOST_DIR)/usr
 GCC_WITH_HOST_MPFR = --with-mpfr=$(HOST_DIR)/usr
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 HOST_SOURCE += host-gmp-source host-mpfr-source
+endif
 GCC_HOST_PREREQ = host-gmp host-mpfr
 
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 HOST_SOURCE += host-mpc-source
+endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
@@ -152,7 +156,9 @@ GCC_CONF_ENV:=acx_cv_prog_cc_pedantic__Wno_long_long__Wno_variadic_macros_______
 	acx_cv_prog_cc_warning__Wno_overlength_strings=no
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 HOST_SOURCE+=gcc-source
+endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-- 
1.7.3.4
