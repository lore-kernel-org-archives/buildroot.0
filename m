From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  1 Sep 2014 11:55:33 +0400
Subject: [Buildroot] [PATCH v4] gcc: explicitly use C{XX}FLAGS_FOR_TARGET
	instead of --enable-target-optspace
Message-ID: <1409558133-17642-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

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

Compared to v3 use "=" instead of ":=" which is not actually required here.

---
 package/gcc/gcc.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b344a14..4160180 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -107,16 +107,22 @@ HOST_GCC_COMMON_CONF_OPT = \
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
+GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
+GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
 # Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
+GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
+GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
 endif
-else
-HOST_GCC_COMMON_CONF_OPT += --enable-target-optspace
 endif
 
+# Propagate options used for target software building to GCC target libs
+HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+
 # gcc 4.6.x quadmath requires wchar
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
-- 
1.9.3
