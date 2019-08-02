From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  2 Aug 2019 15:09:32 +0200
Subject: [Buildroot] [PATCH 2/6] package/gcc: remove libmudflap option
In-Reply-To: <20190802130937.12591-1-romain.naour@smile.fr>
References: <20190802130937.12591-1-romain.naour@smile.fr>
Message-ID: <20190802130937.12591-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmudflap was removed from gcc 4.9 [1] so it depends on gcc <= 4.9.
This option can't be selected since we removed gcc 4.8 from Buildroot
[2].

[1] 4a692aefee10088c385d30e829abf80af1616d1b
[2] f66952197b41452b77dfa065adc7172137e4c243

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/Config.in.host         | 16 ----------------
 package/gcc/gcc-final/gcc-final.mk |  8 --------
 package/gcc/gcc.mk                 |  6 ------
 3 files changed, 30 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a3ba7cf90d..15ce7b81b5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -154,22 +154,6 @@ config BR2_GCC_ENABLE_OPENMP
 	help
 	  Enable OpenMP support for the compiler
 
-config BR2_GCC_ENABLE_LIBMUDFLAP
-	bool "Enable libmudflap support"
-	# There are architectures, or specific configurations for
-	# which mudflap is not supported.
-	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	help
-	  libmudflap is a gcc library used for the mudflap pointer
-	  debugging functionality. It is only needed if you intend to
-	  use the -fmudflap gcc flag.
-
-	  See http://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging and
-	  the help of the gcc -fmudflap option for more details.
-
-	  If you're unsure, leave this option disabled.
-
 config BR2_GCC_ENABLE_GRAPHITE
 	bool "Enable graphite support"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 49f16f699e..f478fde0d7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -184,14 +184,6 @@ ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HOST_GCC_FINAL_USR_LIBS += libmudflapth
-else
-HOST_GCC_FINAL_USR_LIBS += libmudflap
-endif
-endif
-
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 46ad16df13..20ef544ef5 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -155,12 +155,6 @@ ifeq ($(BR2_GCC_ENABLE_LTO),y)
 HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
-HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
-else
-HOST_GCC_COMMON_CONF_OPTS += --disable-libmudflap
-endif
-
 ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
 	--disable-threads \
-- 
2.20.1
