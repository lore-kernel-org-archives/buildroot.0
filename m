From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 14 Jul 2014 19:29:46 +0400
Subject: [Buildroot] [PATCH] gcc: explicitly use CFLAGS_FOR_TARGET instead
	of --enable-target-optspace
Message-ID: <1405351786-4445-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=2222 it's impossible
to specify custom CFLAGS_FOR_TARGET, it is alway gets overriden with values
from "config/mt-ospace":
===========
 CFLAGS_FOR_TARGET = -g -Os
 CXXFLAGS_FOR_TARGET = -g -Os
===========

But in some situations it's required to pass custom flags on buildong of libgcc:
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
 package/gcc/gcc-intermediate/gcc-intermediate.mk | 13 +++++++++++++
 package/gcc/gcc.mk                               | 10 ----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index db84d18..0543574 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -46,4 +46,17 @@ ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 HOST_GCC_INTERMEDIATE_INSTALL_OPT += install-target-libgcc
 endif
 
+ifeq ($(ARCH),powerpc)
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
+	# Workaround until it's fixed in 4.5.4 or later
+	HOST_GCC_INTERMEDIATE_CONF_ENV += CFLAGS_FOR_TARGET="-g -O2"
+	HOST_GCC_INTERMEDIATE_CONF_ENV += CXXFLAGS_FOR_TARGET="-g -O2"
+endif
+else
+	# Defaults are "-g -Os" from "config/mt-ospace"
+	HOST_GCC_INTERMEDIATE_CONF_ENV += CFLAGS_FOR_TARGET="-g -Os"
+	HOST_GCC_INTERMEDIATE_CONF_ENV += CXXFLAGS_FOR_TARGET="-g -Os"
+endif
+
 $(eval $(host-autotools-package))
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5b60bc3..c6f6e41 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -107,16 +107,6 @@ HOST_GCC_COMMON_CONF_OPT = \
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
-# Workaround until it's fixed in 4.5.4 or later
-ifeq ($(ARCH),powerpc)
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
-endif
-else
-HOST_GCC_COMMON_CONF_OPT += --enable-target-optspace
-endif
-
 # gcc 4.6.x quadmath requires wchar
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
-- 
1.9.3
