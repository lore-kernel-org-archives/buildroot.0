From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 00:15:14 +0200
Subject: [Buildroot] [git commit] package/samba4: allow to use libtirpc
	instead of internal C implementation
Message-ID: <20170801221132.B674B7FDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25af7e7bf15ec678a7cedd9e3a1ce4ddde4b61c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows building samba4 with uClibc again after rpc support
was removed from uClibc. Building with musl is still broken:

The first error

../nsswitch/wins.c: In function ???_nss_wins_gethostbyname_r???:
../nsswitch/wins.c:272:15: error: ???NETDB_INTERNAL??? undeclared (first use in this function)
   *h_errnop = NETDB_INTERNAL;
               ^~~~~~~~~~~~~~
../nsswitch/wins.c:272:15: note: each undeclared identifier is reported only once for each function it appears in
../nsswitch/wins.c:349:14: error: ???NETDB_SUCCESS??? undeclared (first use in this function)
  *h_errnop = NETDB_SUCCESS;
              ^~~~~~~~~~~~~

could be solved by applying
https://git.alpinelinux.org/cgit/aports/tree/main/samba/netdb-defines.patch

but then the build fails at

../ctdb/tests/src/test_mutex_raw.c: In function ???main???:
../ctdb/tests/src/test_mutex_raw.c:170:28: error: ???pthread_mutex_t {aka struct <anonymous>}??? has no member named ???__data???
    printf("pid=%u\n", mutex->__data.__owner);
                            ^~

Therefore we disable musl support until a fix can be found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - instead of setting SAMBA4_CONF_ENV within the libtirpc condition,
   introduce SAMBA4_CFLAGS and SAMBA4_LDFLAGS variables and use them
 - add missing dependency on host-pkgconf, needed because we call
   pkg-config to get the flags from libtirpc]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/Config.in |  7 ++++---
 package/samba4/samba4.mk | 11 +++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index ba48b8a..298fdc6 100644
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
index 72fbd74..ffa101b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -17,6 +17,17 @@ SAMBA4_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
+SAMBA4_CFLAGS = $(TARGET_CFLAGS)
+SAMBA4_LDFLAGS = $(TARGET_LDFLAGS)
+SAMBA4_CONF_ENV = \
+	CFLAGS="$(SAMBA4_CFLAGS)" \
+	LDFLAGS="$(SAMBA4_LDFLAGS)"
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SAMBA4_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+SAMBA4_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
+SAMBA4_DEPENDENCIES += libtirpc host-pkgconf
+endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SAMBA4_CONF_OPTS += --with-acl-support
