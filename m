From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Dec 2013 17:01:57 +0100
Subject: [Buildroot] [git commit] nodejs: Bump to version 0.10.12
Message-ID: <20131217194430.046259C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e7dacf766f13011d208b927260b78c56070a7fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes building on mipsel possible (hard-float variant only).

[Peter: also adjust dependenciess for comment]
Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/Config.in                 |    5 +++--
 package/nodejs/nodejs-v8-gregs-fix.patch |   29 -----------------------------
 package/nodejs/nodejs.mk                 |    4 +++-
 3 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 0258460..5ebaa9a 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_NODEJS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	# uses fork()
@@ -16,7 +17,7 @@ config BR2_PACKAGE_NODEJS
 
 comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
diff --git a/package/nodejs/nodejs-v8-gregs-fix.patch b/package/nodejs/nodejs-v8-gregs-fix.patch
deleted file mode 100644
index 4af33bc..0000000
--- a/package/nodejs/nodejs-v8-gregs-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix compilation for ARM/uClibc
-Patch from Remi Duraffort <remi.duraffort@st.com>, taken from
-https://code.google.com/p/v8/source/detail?r=12094
-
-Signed-off-by: Daniel Price <daniel.price@gmail.com>
-
---- a/deps/v8/src/platform-linux.cc
-+++ b/deps/v8/src/platform-linux.cc
-@@ -1025,7 +1025,8 @@ static void ProfilerSignalHandler(int signal, siginfo_t* info, void* context) {
-   sample->fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
- #elif V8_HOST_ARCH_ARM
- // An undefined macro evaluates to 0, so this applies to Android's Bionic also.
--#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-+#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) && \
-+     !defined(__UCLIBC__))
-   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
-   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
-   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
-@@ -1033,7 +1034,8 @@ static void ProfilerSignalHandler(int signal, siginfo_t* info, void* context) {
-   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
-   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
-   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
--#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-+#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) &&
-+        //  !defined(__UCLIBC__))
- #elif V8_HOST_ARCH_MIPS
-   sample->pc = reinterpret_cast<Address>(mcontext.pc);
-   sample->sp = reinterpret_cast<Address>(mcontext.gregs[29]);
-
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 874c5f1..a44bfbd 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.8.22
+NODEJS_VERSION = 0.10.12
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs \
@@ -43,6 +43,8 @@ ifeq ($(BR2_i386),y)
 NODEJS_CPU=ia32
 else ifeq ($(BR2_x86_64),y)
 NODEJS_CPU=x64
+else ifeq ($(BR2_mipsel),y)
+NODEJS_CPU=mipsel
 else ifeq ($(BR2_arm),y)
 NODEJS_CPU=arm
 # V8 needs to know what floating point ABI the target is using.  There's also
