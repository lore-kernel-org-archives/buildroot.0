From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Thu, 15 Nov 2018 07:01:50 +0300
Subject: [Buildroot] [PATCH] gcc: Enable __cxa_atexit for final GCC
Message-ID: <20181115040150.11472-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is what GCC manual says [1]:
-------------------------->8----------------------
--enable-__cxa_atexit

    Define if you want to use __cxa_atexit, rather than atexit,
    to register C++ destructors for local statics and global objects.

    This is essential for fully standards-compliant handling of destructors,
    but requires __cxa_atexit in libc.

    This option is currently only available on systems with GNU libc
    ...
-------------------------->8----------------------

Important disadvantages of a simple atexit() are that [2]:
-------------------------->8----------------------
1999 C Standard only requires that the implementation support 32
registered functions, although most implementations support many more.

More important it does not deal at all with the ability in most implementations
to remove DSOs from a running program image by calling dlclose
prior to program termination.
-------------------------->8----------------------

Essentially for initial GCC there's no point in enabling that feature
as we're not going to build CPP applications wit hit.

Also it seems like all libc's we support in Buildroot (Glibc, uClibc and musl)
support __cxa_at_exit() so enable it unconditionally.

[1] https://gcc.gnu.org/install/configure.html
[2] https://itanium-cxx-abi.github.io/cxx-abi/abi.html#dso-dtor-motivation

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Corbin <mark.corbin@embecosm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Claudiu Zissulescu <claziss@synopsys.com>
Cc: Cupertino Miranda <cmiranda@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 1 +
 package/gcc/gcc.mk                     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index d5d925a3d9..745a85607a 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -40,6 +40,7 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 	--with-newlib \
 	--disable-largefile \
 	--disable-nls \
+	--disable-__cxa_atexit \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
 HOST_GCC_INITIAL_CONF_ENV = \
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e47435677e..5901624ea5 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -87,7 +87,7 @@ HOST_GCC_COMMON_DEPENDENCIES = \
 HOST_GCC_COMMON_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--with-sysroot=$(STAGING_DIR) \
-	--disable-__cxa_atexit \
+	--enable-__cxa_atexit \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
-- 
2.16.2
