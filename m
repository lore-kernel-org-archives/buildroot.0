From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:50:04 +0200
Subject: [Buildroot] [git commit] libsigsegv: make the architecture
	dependencies more robust
Message-ID: <20160809135014.B9EF981999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While musl and glibc provide the ucontext structure definition on all
architectures they support, it is not the case of uClibc. We have been
excluding more and more architectures over time, but this isn't really
nice as we continuously need to add more. Latest example: the fact that
ucontext on ARM is only available on ARM platforms that support the ARM
instruction set (i.e not on the Thumb-2 only Cortex-M platforms).

Therefore, we introduce a BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS variable,
which:

 - is set to 'y' for musl and glibc

 - is set to 'y' for uClibc for the only architectures that are known to
   provide ucontext (those are the ones that select ARCH_HAS_UCONTEXT in
   uClibc.

Note that we remove the comment, as it would become a way too
complicated comment, and we usually don't add comment for such
complicated situations (see libunwind for a similar example).

Fixes:

  http://autobuild.buildroot.net/results/b1e40b3ec64cd98b535d83e89e5780c46680e095/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigsegv/Config.in | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 90c6ba3..f258dc9 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -1,15 +1,20 @@
+config BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS
+	bool
+	# with glibc/musl, ucontext is available for all supported
+	# architectures
+	default y if BR2_TOOLCHAIN_USES_GLIBC
+	default y if BR2_TOOLCHAIN_USES_MUSL
+	# with uclibc, ucontext is only available for a subset of the
+	# supported architectures
+	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
+		(BR2_ARM_CPU_HAS_ARM || BR2_i386 || \
+		 BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		 BR2_sparc || BR2_x86_64)
+
 config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
-	depends on !BR2_xtensa
-	depends on !BR2_arc # no ucontext_i.sym file
-	depends on !BR2_microblaze
-	depends on !BR2_m68k # unknown type name 'ucontext_t'
-	# No ucontext support in uclibc for powerpc and superh
-	depends on !((BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS
 	help
 	  Library for handling page faults in user mode.
 
 	  http://www.gnu.org/software/libsigsegv/
-
-comment "libsigsegv needs a glibc toolchain"
-	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
