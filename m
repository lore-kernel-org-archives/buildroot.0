From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Sep 2014 08:56:31 -0300
Subject: [Buildroot] [PATCH 1/2] powerpc/spe: tweak glibc/eglibc/uclibc
	combinations
Message-ID: <1410436592-1990-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since (e)glibc 2.19+ PowerPC SPE changed ABI conventions for sanity.
In the good old days hard-float was used, it sounds good on paper until
you account for the e500v1/v2 differences, with v1 being a fpu that does
only single-precision math.

So the ABI changed to make it soft-float and the libc (or libm) handle
that deficiency in software if required, making old precompiled binaries
incompatible (of no concern for buildroot since we've got no precompiled
binary blobs for SPE in packages).

For uClibc the support is for hard-float so disable it for soft since it
doesn't do the fallback trickery.

So do what's appropiate for each combination:

               H-F   S-F

eglibc 2.18     x
eglibc 2.19           x
glibc 2.19            x
glibc 2.20            x
uclibc          x

Eventually hard-float should just go away, i'm keeping it for
compatibility purposes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/Config.in                 | 4 ++--
 toolchain/toolchain-buildroot/Config.in | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 8c033f2..748ff44 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -11,11 +11,11 @@ choice
 
 config BR2_EGLIBC_VERSION_2_18
 	bool "2.18-svnr23787"
+	depends on !BR2_POWERPC_SOFT_FLOAT
 
 config BR2_EGLIBC_VERSION_2_19
 	bool "2.19-svnr25243"
-	# Build breakage
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_powerpc_SPE || (BR2_powerpc_SPE && BR2_POWERPC_SOFT_FLOAT)
 
 endchoice
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 53d86dd..9a711c0 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -33,6 +33,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
 		   BR2_x86_64
+	depends on !BR2_powerpc_SPE || (BR2_powerpc_SPE && !BR2_POWERPC_SOFT_FLOAT)
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
@@ -67,7 +68,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_microblaze
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_powerpc_SPE || (BR2_powerpc_SPE && BR2_POWERPC_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.8.5.5
