From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 28 Aug 2014 16:59:18 +0400
Subject: [Buildroot] [PATCH v2] gcc: explicitly use C{XX}FLAGS_FOR_TARGET
	instead of --enable-target-optspace
Message-ID: <1409230758-14548-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc.mk file is passing --enable-target-optspace to gcc configure
script, to ask for space-optimized (-Os) target libraries. However,
passing this option has the effect of overriding any custom
CFLAGS_FOR_TARGET or CXXFLAGS_FOR_TARGET values that may be passed.

These are some situations when it is required to pass custom flags on buildong
of libgcc:
 * Default flags "-g -Os" lead to build isses as with PowerPC on gcc 4.5
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810)
 * Particular CPU requires specific instructions for HW support
 * Deep optimizations

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Compared to v1:
 1) All changes are implemented in common part so applicable to all stages.
 2) Comments doesn't contain separators that confuse Patchwork
 3) Use TARGET_C{XX}FLAGS instead of pre-defined -O2 or -Os
---
 package/gcc/gcc.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b344a14..95c15e2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -111,12 +111,15 @@ HOST_GCC_COMMON_CONF_ENV = \
 # Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
+TARGET_CFLAGS := $(subst -Os,,$(TARGET_CFLAGS))
+TARGET_CXXFLAGS := $(subst -Os,,$(TARGET_CXXFLAGS))
 endif
-else
-HOST_GCC_COMMON_CONF_OPT += --enable-target-optspace
 endif
 
+# Propagate options used for target software building to GCC target libs
+HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(TARGET_CFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(TARGET_CXXFLAGS)"
+
 # gcc 4.6.x quadmath requires wchar
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
-- 
1.9.3
