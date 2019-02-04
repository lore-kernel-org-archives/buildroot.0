From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 11:00:01 +0100
Subject: [Buildroot] [git commit] Introduce the variable
 BR2_TOOLCHAIN_HAS_UCONTEXT
Message-ID: <20190204100318.16E0383689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=001f9a79885c1bbd82d6462d4808fd5bc9c4d168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is set when the platform exposes the struct ucontext_t.

This avoids duplication of logic inside each package requiring
the use of that type.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigsegv/Config.in | 11 +----------
 toolchain/Config.in          | 10 ++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index f258dc9e8a..8e89ff5aa4 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -1,15 +1,6 @@
 config BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS
 	bool
-	# with glibc/musl, ucontext is available for all supported
-	# architectures
-	default y if BR2_TOOLCHAIN_USES_GLIBC
-	default y if BR2_TOOLCHAIN_USES_MUSL
-	# with uclibc, ucontext is only available for a subset of the
-	# supported architectures
-	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
-		(BR2_ARM_CPU_HAS_ARM || BR2_i386 || \
-		 BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		 BR2_sparc || BR2_x86_64)
+	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
 
 config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index baf192c936..275f9f9cdd 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -15,10 +15,16 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_HAS_UCONTEXT
 	select BR2_TOOLCHAIN_SUPPORTS_PIE
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
+	# ucontext is only available for a subset of the supported
+	# architectures
+	select BR2_TOOLCHAIN_HAS_UCONTEXT if BR2_ARM_CPU_HAS_ARM || BR2_i386 \
+		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
+		|| BR2_sparc || BR2_x86_64
 	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_m68k && !BR2_microblaze && !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_USES_MUSL
@@ -28,6 +34,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_HAS_UCONTEXT
 	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
 
 choice
@@ -145,6 +152,9 @@ config BR2_TOOLCHAIN_HAS_THREADS_NPTL
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
+config BR2_TOOLCHAIN_HAS_UCONTEXT
+	bool
+
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
 
