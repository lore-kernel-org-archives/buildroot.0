From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:20:50 +0200
Subject: [Buildroot] [git commit] gcc: explicitly use C{XX}FLAGS_FOR_TARGET
	instead of --enable-target-optspace
Message-ID: <20150722212100.D699C7FB7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fe633cdff66febadc50bab3e0af4b3be53811c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gcc.mk file is passing --enable-target-optspace to gcc configure
script, to ask for space-optimized (-Os) target libraries. However,
passing this option has the effect of overriding any custom
CFLAGS_FOR_TARGET or CXXFLAGS_FOR_TARGET values that may be passed.

These are some situations when it is required to pass custom flags on
buildong
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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index d1693d5..aaeba7f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -100,16 +100,22 @@ HOST_GCC_COMMON_CONF_OPTS = \
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
+GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
+GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
 # Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-HOST_GCC_COMMON_CONF_OPTS += --disable-target-optspace
+GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
+GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
 endif
-else
-HOST_GCC_COMMON_CONF_OPTS += --enable-target-optspace
 endif
 
+# Propagate options used for target software building to GCC target libs
+HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+
 # libitm needs sparc V9+
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
