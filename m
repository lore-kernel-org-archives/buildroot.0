From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Fri, 16 Oct 2015 16:27:36 +0000
Subject: [Buildroot] [RFC] Buildroot support for X1000
Message-ID: <1445012855.1856.6.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

X1000 is the Intel microprocessor that ships with Intel Galileo Gen 1/2.
As discussed previously, here is an RFC that prototypes changes to arch 
and toolchain-wrapper to omit the lock prefix for the X1000.

If you agree, I will send a formal patch with these. 

Ray K

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 arch/Config.in.x86                                            |  4 ++++
 toolchain/toolchain-wrapper.c                                 |  3 +++
 toolchain/toolchain-wrapper.mk                                |  4 ++++
 4 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 43f6abc..a284e4f 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -34,6 +34,9 @@ config BR2_x86_i486
 config BR2_x86_i586
 	bool "i586"
 	depends on !BR2_x86_64
+config BR2_x86_X1000
+	bool "X1000"
+	depends on !BR2_x86_64
 config BR2_x86_i686
 	bool "i686"
 	depends on !BR2_x86_64
@@ -202,6 +205,7 @@ config BR2_ARCH
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
+	default "i586"		if BR2_x86_X1000
 	default "i586"		if BR2_x86_pentium_mmx
 	default "i586"		if BR2_x86_geode
 	default "i586"		if BR2_x86_c3
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 632696c..ef53d36 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -63,6 +63,9 @@ static char *predef_args[] = {
 #ifdef BR_64
 	"-m64",
 #endif
+#ifdef BR_X1000
+	"-Wa,-momit-lock-prefix=yes", 
+#endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index c78363a..893669c 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
 endif
 
+ifeq ($(BR2_x86_X1000),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_X1000
+endif
+
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
-- 
2.1.0
