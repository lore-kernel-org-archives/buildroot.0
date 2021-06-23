From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Jun 2021 18:59:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/usbguard: improve option handling
Message-ID: <20210623165924.200759-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't pass --disable-seccomp and --disable-systemd unconditionally
While at it, also add a space and a new line when needed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/usbguard.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 72e9e6459a..3aff254b3e 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,9 +8,9 @@ USBGUARD_VERSION = 1.0.0
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
-USBGUARD_CONF_OPTS= --with-bundled-catch --with-bundled-pegtl \
+USBGUARD_CONF_OPTS = --with-bundled-catch --with-bundled-pegtl \
 		    --disable-debug-build --without-dbus --without-polkit \
-		    --disable-seccomp --disable-umockdev --disable-systemd
+		    --disable-umockdev
 
 USBGUARD_DEPENDENCIES += libqb protobuf
 
@@ -18,10 +18,12 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=openssl
 USBGUARD_DEPENDENCIES += libopenssl
 endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
+
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=sodium
 USBGUARD_DEPENDENCIES += libsodium
@@ -30,11 +32,15 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 USBGUARD_CONF_OPTS += --enable-systemd
 USBGUARD_DEPENDENCIES += systemd
+else
+USBGUARD_CONF_OPTS += --disable-systemd
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 USBGUARD_CONF_OPTS += --enable-seccomp
 USBGUARD_DEPENDENCIES += libseccomp
+else
+USBGUARD_CONF_OPTS += --disable-seccomp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
-- 
2.30.2
