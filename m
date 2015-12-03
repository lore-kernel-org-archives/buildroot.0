From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:37:33 +0100
Subject: [Buildroot] [git commit] wireshark: gcrypt support is optional
Message-ID: <20151203214016.0644E81D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43e894d2cf3a0ca3b86cdb6a28fd8fd3e01e0007
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/Config.in    |  1 -
 package/wireshark/wireshark.mk | 11 +++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index f559c22..52b0f52 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2940d26..cc9fb41 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -9,9 +9,8 @@ WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libgcrypt libglib2
+WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libglib2
 WIRESHARK_CONF_ENV = \
-	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
 	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
 # patch touching configure.ac
@@ -64,6 +63,14 @@ else
 WIREHARK_CONF_OPTS += --without-c-ares
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+WIRESHARK_CONF_OPTS += --with-gcrypt=yes
+WIRESHARK_DEPENDENCIES += libgcrypt
+else
+WIRESHARK_CONF_OPTS += --with-gcrypt=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 WIRESHARK_CONF_OPTS += --with-libnl
 WIRESHARK_DEPENDENCIES += libnl
