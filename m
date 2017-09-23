From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Sep 2017 23:24:03 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/gcc: enable float128 on
	powerpc64le with glibc >= 2.26 toolchains
In-Reply-To: <20170923212414.16744-1-romain.naour@gmail.com>
References: <20170923212414.16744-1-romain.naour@gmail.com>
Message-ID: <20170923212414.16744-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

float128 is now required on powerpc64le with glibc >= 2.26 toolchains.

Fixes:
running configure fragment for sysdeps/gnu
running configure fragment for sysdeps/powerpc/powerpc64le
checking if [...]powerpc64le-buildroot-linux-gnu-gcc supports binary128 floating point type... no
checking if the target machine is at least POWER8... yes
configure: error: ***  binary128 floating point type (GCC >= 6.2) is required on powerpc64le.

In order to prepare the glibc bump to this version, we enable
binary128 floating point in gcc. This require at least gcc >= 6.2.

Disable gcc 4.x and 5.x for internal toolchain.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: Disable gcc 4.x and 5.x for internal toolchain.
---
 package/gcc/Config.in.host | 4 ++++
 package/gcc/gcc.mk         | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ec7b692..0926560 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -39,6 +39,8 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
+	# glibc >= 2.26 needs gcc >= 6.2
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_GCC_VERSION_5_X
@@ -53,6 +55,8 @@ config BR2_GCC_VERSION_5_X
 	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && !BR2_mips_i6400
 	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
+	# glibc >= 2.26 needs gcc >= 6.2
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_GCC_VERSION_6_X
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 49ccccf..54ef70c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -254,6 +254,14 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--without-long-double-128
 endif
 
+# Since glibc >= 2.26, poerpc64le requires double/long double which
+# requires at least gcc 6.2.
+# See sysdeps/powerpc/powerpc64le/configure.ac
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_GCC_AT_LEAST_6)$(BR2_powerpc64le),yyy)
+HOST_GCC_COMMON_CONF_OPTS += \
+	--with-long-double-128
+endif
+
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 ifeq ($(BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS),)
 ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-- 
2.9.5
