From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 10 Nov 2011 14:08:37 +0100
Subject: [Buildroot] Cygwin-buildroot-toolchain build(s) Finally - working.
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702C66D6B@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,


I finally managed to get a Cygwin-toolchain-Build running for the latest
buildroot-Git-tree.

I know it is officially not supported but as said before it's nice to
have it working.

Basically I had 2 problems that took me some time to solve (or avoid)
them.
1) a bug into gmp-0.9 that caused a build failure (only for 'shared'
builds of the host-mpc)
2) The initial-compiler was not generating code for the crt1.S files and
was not correctly probing the possible options while building uClibc. 

<< snip>>
check_gcc=$(shell \
	if $(CC) $(1) -S -o /dev/null -xc /dev/null > /dev/null 2>&1; \
	then echo "$(1)"; else echo "$(2)"; fi)

CPU_CFLAGS-y += $(call check_gcc,-fno-asm,)
<< SNIP-END >>
The result for this was not correct.


Finally I ended up with one-solution (or work-around whatever you want
to call it) for the both problems, I've build the host-gmp, host-mpfr,
and host-mpc statically (as Yann does into the crosstool-NG)


This seems to solve all the W32-cygwin troubles for
buildroot-toolchain-builds. 


FYI: Is this cygwin-cross-toolchain tested? 
Yes I did compile some SMALL 'sample-programs' and tested them on a real
platform (imx-537 cortex-A8).


Regards Noel


Note: For the people that are interrested, these are the changes/patches
that I needed to make for building a toolchain under CYGWIN.


diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5eb6ecc..da718b0 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,6 +8,6 @@ GMP_VERSION = 5.0.2
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
-
+HOST_GMP_CONF_OPT=--disable-shared --enable-static
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 608c9f4..4eb0833 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -11,6 +11,6 @@ MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
 HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
-
+HOST_MPC_CONF_OPT = --disable-shared --enable-static 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 7f33599..543b887 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,6 +11,6 @@ MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 HOST_MPFR_DEPENDENCIES = host-gmp
-
+HOST_MPFR_CONF_OPT = --disable-shared --enable-static
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111110/5b5aa3f9/attachment.html>
