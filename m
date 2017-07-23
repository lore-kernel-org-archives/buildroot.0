From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Jul 2017 15:36:18 +0200
Subject: [Buildroot] [PATCH 1/3] package/samba4: allow to use libtirpc
	instead of internal C implementation
Message-ID: <20170723133620.13487-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows building samba4 with uClibc again after rpc support
was removed from uClibc. Building with musl is still broken:

The first error

../nsswitch/wins.c: In function ?_nss_wins_gethostbyname_r?:
../nsswitch/wins.c:272:15: error: ?NETDB_INTERNAL? undeclared (first use in this function)
   *h_errnop = NETDB_INTERNAL;
               ^~~~~~~~~~~~~~
../nsswitch/wins.c:272:15: note: each undeclared identifier is reported only once for each function it appears in
../nsswitch/wins.c:349:14: error: ?NETDB_SUCCESS? undeclared (first use in this function)
  *h_errnop = NETDB_SUCCESS;
              ^~~~~~~~~~~~~

could be solved by applying
https://git.alpinelinux.org/cgit/aports/tree/main/samba/netdb-defines.patch

but then the build fails at

../ctdb/tests/src/test_mutex_raw.c: In function ?main?:
../ctdb/tests/src/test_mutex_raw.c:170:28: error: ?pthread_mutex_t {aka struct <anonymous>}? has no member named ?__data?
    printf("pid=%u\n", mutex->__data.__owner);
                            ^~

Therefore we disable musl support until a fix can be found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Tested with test-pkg using this defconfig

BR2_PACKAGE_SAMBA4=y
BR2_PACKAGE_SAMBA4_AD_DC=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: SKIPPED
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: SKIPPED
                      br-arm-full-static [11/47]: SKIPPED
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: SKIPPED
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: SKIPPED
                    br-microblazeel-full [17/47]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: SKIPPED
                      br-openrisc-uclibc [23/47]: SKIPPED
               br-powerpc-603e-basic-cpp [24/47]: SKIPPED
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: SKIPPED
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: SKIPPED
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: SKIPPED
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 16 skipped, 0 build failed, 0 legal-info failed

 package/samba4/Config.in | 7 ++++---
 package/samba4/samba4.mk | 7 +++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index ba48b8ab3..298fdc660 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,6 +1,6 @@
-comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, NPTL"
+comment "samba4 needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPTL"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
+	depends on !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 
@@ -8,12 +8,13 @@ config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # python
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
 	depends on !BR2_STATIC_LIBS # python, gnutls
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZLIB
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 72fbd7448..ccdd13e2f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -18,6 +18,13 @@ SAMBA4_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SAMBA4_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LDFLAGS="$(TARGET_LDFLAGS) `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+SAMBA4_DEPENDENCIES += libtirpc
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SAMBA4_CONF_OPTS += --with-acl-support
 SAMBA4_DEPENDENCIES += acl
-- 
2.11.0
