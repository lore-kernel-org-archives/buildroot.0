From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Nov 2020 20:57:37 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/wireshark: bump to version 3.4.0
Message-ID: <20201102195737.81319-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- c-ares is mandatory since
  https://github.com/wireshark/wireshark/commit/451a241e50bd34ba097bd09a5f9f673170779aaf
- Disable ilibc which is available and enabled by default since
  https://github.com/wireshark/wireshark/commit/12a13a69264fdef4281e4b13c8c7d92a272cc99e
- LTO can be enabled since
  https://github.com/wireshark/wireshark/commit/e6b5bd09766a1320c5540f78eb0e4ba03ce8f108
- opus is an optional dependency since
  https://github.com/wireshark/wireshark/commit/6136c719da4ec9b96c01adb4b0fd7f01af171688

https://www.wireshark.org/docs/relnotes/wireshark-3.4.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Petr Vorel):
 - c-ares is now mandatory

 package/wireshark/Config.in      |  1 +
 package/wireshark/wireshark.hash |  6 +++---
 package/wireshark/wireshark.mk   | 31 ++++++++++++++++++++++---------
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index b26aa7a3df..95fc9b38f3 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8d1a3b3a2e..667d8a371e 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.8.txt
-sha1  5fdcbbe3a50cea38a8fa5f10b21f58cbef31793e  wireshark-3.2.8.tar.xz
-sha256  a8a595d08f38c6bd083886f6c199b9d4fb007e363031b263667c7da72323cc32  wireshark-3.2.8.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.0.txt
+sha1  6fdf4f394c287f1e21b48c5293ec1a6e6b627996  wireshark-3.4.0.tar.xz
+sha256  67e4ebbd9153fc589fd67dc21b93176674c73adc3d5a43934c3ac69d8594a8ae  wireshark-3.4.0.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0d4fedb3f0..567c8cc115 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,12 +4,18 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.8
+WIRESHARK_VERSION = 3.4.0
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf host-python3 libgcrypt libpcap libglib2 \
+WIRESHARK_DEPENDENCIES = \
+	c-ares \
+	host-pkgconf \
+	host-python3 \
+	libgcrypt \
+	libglib2 \
+	libpcap \
 	speexdsp
 
 WIRESHARK_MAKE_ENV = \
@@ -18,6 +24,7 @@ WIRESHARK_MAKE_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	-DDISABLE_WERROR=ON \
+	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF
 
@@ -35,6 +42,12 @@ endef
 
 WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+WIRESHARK_CONF_OPTS += -DENABLE_LTO=ON
+else
+WIRESHARK_CONF_OPTS += -DENABLE_LTO=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),y)
 WIRESHARK_CONF_OPTS += -DBUILD_wireshark=ON
 WIRESHARK_DEPENDENCIES += qt5base qt5multimedia qt5svg qt5tools
@@ -56,13 +69,6 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_BROTLI=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_C_ARES),y)
-WIRESHARK_CONF_OPTS += -DENABLE_CARES=ON
-WIRESHARK_DEPENDENCIES += c-ares
-else
-WIRESHARK_CONF_OPTS += -DENABLE_CARES=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=ON
 WIRESHARK_DEPENDENCIES += gnutls
@@ -127,6 +133,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+WIRESHARK_CONF_OPTS += -DENABLE_OPUS=ON
+WIRESHARK_DEPENDENCIES += opus
+else
+WIRESHARK_CONF_OPTS += -DENABLE_OPUS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 WIRESHARK_CONF_OPTS += -DENABLE_SBC=ON
 WIRESHARK_DEPENDENCIES += sbc
-- 
2.28.0
