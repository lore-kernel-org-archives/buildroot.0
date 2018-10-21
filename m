From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 13:54:15 +0200
Subject: [Buildroot] [PATCH 3/3] package/gcc: remove
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
In-Reply-To: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
References: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181021115415.21471-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 8f8e9162fae5fdc1788dcf33f02b20ddaa5e6846 ("package/gcc:
do not mourn avr32 for too long..."), in which we dropped AVR32
support, the BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is always
'y'. Therefore, it is totally useless to keep this option around, and
this commit removes it, making the corresponding code unconditional
along the way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host             | 4 ----
 package/gcc/gcc-initial/gcc-initial.mk | 9 ++-------
 package/gcc/gcc.mk                     | 5 +----
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3bf87fe597..1d4e946f55 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -72,10 +72,6 @@ config BR2_GCC_VERSION_8_X
 
 endchoice
 
-config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
-	bool
-	default y
-
 # libcilkrts was introduced in gcc 4.9 (oldest gcc version we
 # support), and removed in gcc 8.x
 config BR2_GCC_SUPPORTS_LIBCILKRTS
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 9b20eb18f9..d5d925a3d9 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -45,13 +45,8 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
-HOST_GCC_INITIAL_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc
-HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc
-
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_INITIAL_MAKE_OPTS += all-target-libgcc
-HOST_GCC_INITIAL_INSTALL_OPTS += install-target-libgcc
-endif
+HOST_GCC_INITIAL_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc all-target-libgcc
+HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
 HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9e9069ce0e..8b0fec74f1 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -98,6 +98,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
+	--disable-decimal-float \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
@@ -195,10 +196,6 @@ HOST_GCC_COMMON_CONF_OPTS += --with-float=soft
 endif
 endif
 
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
-endif
-
 # Determine arch/tune/abi/cpu options
 ifneq ($(GCC_TARGET_ARCH),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch="$(GCC_TARGET_ARCH)"
-- 
2.14.4
