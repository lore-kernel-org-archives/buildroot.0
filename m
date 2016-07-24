From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:44:22 +0200
Subject: [Buildroot] [git commit] toolchain: add hidden symbol for PIE
	support
Message-ID: <20160724194456.2676F7FF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c93901bcd2f77232581ca82a3a5f741aa9e6345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc-ng does not support PIE for some architectures as
arc and m68k. It isn't implemented in the static linking case, too.
With musl toolchains you might have static PIE support with little
patching of gcc. Static linking for GNU libc isn't enabled in
buildroot. Fixup any package using special treatment of PIE.
(grep -ir pie package/*/*.mk)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: use positive logic.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/bluez_utils.mk   | 3 +--
 package/cifs-utils/cifs-utils.mk     | 2 +-
 package/libmemcached/libmemcached.mk | 4 +---
 package/libsodium/libsodium.mk       | 2 +-
 package/lvm2/lvm2.mk                 | 2 +-
 package/openssh/openssh.mk           | 7 +------
 package/openswan/openswan.mk         | 4 ++--
 package/pure-ftpd/pure-ftpd.mk       | 2 +-
 package/quagga/quagga.mk             | 2 +-
 package/tinc/tinc.mk                 | 2 +-
 package/trousers/trousers.mk         | 3 +--
 toolchain/Config.in                  | 3 +++
 toolchain/toolchain-common.in        | 3 +++
 13 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 91c2905..1c93f2e 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -54,8 +54,7 @@ BLUEZ_UTILS_CONF_OPTS +=	\
 	--disable-usb
 endif
 
-# PIE is broken for m68k
-ifeq ($(BR2_m68k),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 BLUEZ_UTILS_CONF_OPTS += --disable-pie
 endif
 
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index c90a504..6cd45e0 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -10,7 +10,7 @@ CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
-ifneq ($(BR2_STATIC_LIBS)$(BR2_m68k),)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 CIFS_UTILS_CONF_OPTS += --disable-pie
 endif
 
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index a5ea4f5..36d0913 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -18,9 +18,7 @@ LIBMEMCACHED_AUTORECONF = YES
 LIBMEMCACHED_LICENSE = BSD-3c
 LIBMEMCACHED_LICENSE_FILES = COPYING
 
-# Help libmemcached to understand that -fPIE and -pie should not be
-# used when linking statically.
-ifeq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LIBMEMCACHED_CONF_ENV += \
 	ax_cv_check_cflags__Werror__fPIE=no \
 	ax_cv_check_cflags__Werror__pie=no \
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 13dba8d..a8c28a6 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -10,7 +10,7 @@ LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 0341670..fed8273 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -43,7 +43,7 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
-ifeq ($(BR2_arc)$(BR2_m68k),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 856646c..8f85d0a 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -22,12 +22,7 @@ define OPENSSH_USERS
 	sshd -1 sshd -1 * - - - SSH drop priv user
 endef
 
-# uClibc toolchain for ARC doesn't support PIE at the moment
-ifeq ($(BR2_arc),y)
-OPENSSH_CONF_OPTS += --without-pie
-endif
-# PIE and static does not work on Linux
-ifeq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
 
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 54bd4b3..5c8e143 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -11,8 +11,8 @@ OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
 OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
-	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_STATIC_LIBS),,-fPIE)" \
-	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_STATIC_LIBS),,-fPIE)" \
+	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
+	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index e1040fa..ba4096c 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -41,7 +41,7 @@ else
 PURE_FTPD_CONF_OPTS += --without-tls
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 PURE_FTPD_CONF_ENV += ax_cv_check_cflags___fPIE=no ax_cv_check_ldflags___fPIE=no
 endif
 
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 1bbc72d..ad2aff4 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -68,7 +68,7 @@ else
 QUAGGA_CONF_OPTS += --disable-vtysh
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 QUAGGA_CONF_OPTS += --disable-pie
 endif
 
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index cb0785b..fb15c34 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -11,7 +11,7 @@ TINC_LICENSE = GPLv2+ with OpenSSL exception
 TINC_LICENSE_FILES = COPYING COPYING.README
 TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 TINC_CONF_ENV += \
 	ax_cv_check_cflags___fPIE=no \
 	ax_cv_check_ldflags___pie=no
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index 70daa88..be6ce39 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -23,8 +23,7 @@ endif
 # workaround.
 TROUSERS_CONF_OPTS += --disable-usercheck
 
-# uClibc toolchain for ARC doesn't support PIE at the moment
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 TROUSERS_CONF_ENV += \
 	ax_cv_check_cflags___fPIE__DPIE=no \
 	ax_cv_check_ldflags___pie=no
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a725556..5752380 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -15,9 +15,11 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_SUPPORTS_PIE
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
+	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
@@ -26,6 +28,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_SUPPORTS_PIE
 
 choice
 	prompt "Toolchain type"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 65df31b..d69acf2 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -39,6 +39,9 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
+config BR2_TOOLCHAIN_SUPPORTS_PIE
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
