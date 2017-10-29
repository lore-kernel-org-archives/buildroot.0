From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 29 Oct 2017 12:49:42 +0100
Subject: [Buildroot] [PATCH] package/glibc: remove mips r6 nan208 hook
Message-ID: <20171029114942.32635-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This hook is not needed since glibc 2.23 [1] and can be safely removed.

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d5f2798a0ac9d5ad8ad7a506a2f840035135e2d2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/glibc/glibc.mk | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index b77742c..1a955bc 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -129,34 +129,4 @@ define GLIBC_INSTALL_TARGET_CMDS
 	done
 endef
 
-# MIPS R6 requires to have NaN2008 support which is currently not
-# supported by the Linux kernel. In order to prevent building the
-# glibc against kernels not having NaN2008 support on platforms that
-# requires it, glibc currently checks for an (inexisting) 10.0.0
-# kernel headers version.
-#
-# Since in practice the kernel support for NaN2008 is not really
-# required for things to work properly, we adjust the glibc check to
-# make it believe that NaN2008 support was added in the kernel
-# starting from version 4.0.0.
-#
-# In general the compatibility issues introduced by mis-matched NaN
-# encodings will not cause a problem as signalling NaNs are rarely used
-# in average code. For MIPS R6 there isn't actually any compatibility
-# issue as the hardware is always NaN2008 and software is always
-# NaN2008. The problem only comes from when older MIPS code is linked in
-# via a DSO and multiple NaN encodings are introduced. Since Buildroot
-# is intended to have all code built from source then this scenario is
-# highly unlikely. The failure mode, if it ever occurs, would be either
-# that a signalling NaN fails to raise an invalid operation exception or
-# (more likely) an ordinary NaN raises an invalid operation exception.
-ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-define GLIBC_FIX_MIPS_R6
-	$(SED) 's#10.0.0#4.0.0#' \
-		$(@D)/sysdeps/unix/sysv/linux/mips/configure \
-		$(@D)/sysdeps/unix/sysv/linux/mips/configure.ac
-endef
-GLIBC_POST_EXTRACT_HOOKS += GLIBC_FIX_MIPS_R6
-endif
-
 $(eval $(autotools-package))
-- 
2.9.5
