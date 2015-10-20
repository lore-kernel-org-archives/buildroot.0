From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 10:04:52 +0200
Subject: [Buildroot] [git commit] arch/x86: add support for Intel X1000
Message-ID: <20151020080505.82B8581E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=968f5d5e59195e6e6a9a349ec9a118fb3a50b8b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Intel X1000 is the Pentium class microprocessor that ships with
Galileo Gen 1/2. This patch adds changes to arch and toolchain-wrapper
to omit the lock prefix for the X1000.

[Thomas: tweak commit log and Config.in help text.]

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.x86             |   12 ++++++++++++
 toolchain/toolchain-wrapper.c  |    3 +++
 toolchain/toolchain-wrapper.mk |    4 ++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 43f6abc..dca30da 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -34,6 +34,16 @@ config BR2_x86_i486
 config BR2_x86_i586
 	bool "i586"
 	depends on !BR2_x86_64
+config BR2_x86_x1000
+	bool "x1000"
+	depends on !BR2_x86_64
+	help
+	  The Intel X1000 is a Pentium class microprocessor in the
+	  Quark (sub-Atom) Product Line. The X1000 has a bug on the
+	  lock prefix requiring that prefix must be stripped at build
+	  time.
+
+	  See https://en.wikipedia.org/wiki/Intel_Quark.
 config BR2_x86_i686
 	bool "i686"
 	depends on !BR2_x86_64
@@ -202,6 +212,7 @@ config BR2_ARCH
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
+	default "i586"		if BR2_x86_x1000
 	default "i586"		if BR2_x86_pentium_mmx
 	default "i586"		if BR2_x86_geode
 	default "i586"		if BR2_x86_c3
@@ -240,6 +251,7 @@ config BR2_GCC_TARGET_ARCH
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
+	default "i586"		if BR2_x86_x1000
 	default "pentium-mmx"	if BR2_x86_pentium_mmx
 	default "i686"		if BR2_x86_i686
 	default "pentiumpro"	if BR2_x86_pentiumpro
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 16a3d78..887058f 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -63,6 +63,9 @@ static char *predef_args[] = {
 #ifdef BR_64
 	"-m64",
 #endif
+#ifdef BR_OMIT_LOCK_PREFIX
+	"-Wa,-momit-lock-prefix=yes",
+#endif
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index c78363a..eba2b38 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
 endif
 
+ifeq ($(BR2_x86_x1000),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
+endif
+
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
