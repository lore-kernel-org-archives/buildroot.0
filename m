From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:06:06 +0200
Subject: [Buildroot] [git commit] package/usbguard: improve option handling
Message-ID: <20210626123447.F0A798BE9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20616a1b65aa718a2d18cac560404fa3b3e70fc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't pass --disable-seccomp and --disable-systemd unconditionally
While at it, also add a space and a new line when needed, and split
the initial CONF_OPTS assignment to have one option per line.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/usbguard.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 72e9e6459a..f3bd7c57ac 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,9 +8,13 @@ USBGUARD_VERSION = 1.0.0
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
-USBGUARD_CONF_OPTS= --with-bundled-catch --with-bundled-pegtl \
-		    --disable-debug-build --without-dbus --without-polkit \
-		    --disable-seccomp --disable-umockdev --disable-systemd
+USBGUARD_CONF_OPTS = \
+	--with-bundled-catch \
+	--with-bundled-pegtl \
+	--disable-debug-build \
+	--without-dbus \
+	--without-polkit \
+	--disable-umockdev
 
 USBGUARD_DEPENDENCIES += libqb protobuf
 
@@ -18,10 +22,12 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
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
@@ -30,11 +36,15 @@ endif
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
