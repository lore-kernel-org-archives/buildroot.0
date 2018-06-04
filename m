From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:32:16 +0200
Subject: [Buildroot] [git commit] shadowsocks-libev: new package
Message-ID: <20180604203222.A8F4C80401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8d44394777fb9b45befaee3333d974dfe5e745d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
embedded devices and low-end boxes.

https://github.com/shadowsocks/shadowsocks-libev

Signed-off-by: Min Xu <xuminready@gmail.com>
[Thomas:
 - drop patch adding license file for libipset
 - drop --disable-documentation, it's passed by autotools-package
 - add entry in DEVELOPERS file
 - pass --disable-ssp because the SSP check uses AC_COMPILE_IFELSE()
   so with some toolchains, it think SSP support is available, while
   it's not. And anyway we want SSP to be controlled by Buildroot
   global options, not on a per-package basis.
 - add depends on BR2_USE_MMU, because the code uses fork().]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  3 +++
 package/Config.in                                |  1 +
 package/shadowsocks-libev/Config.in              | 13 +++++++++++++
 package/shadowsocks-libev/shadowsocks-libev.hash |  8 ++++++++
 package/shadowsocks-libev/shadowsocks-libev.mk   | 17 +++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1a8440759e..1ad3edcd78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1391,6 +1391,9 @@ F:	configs/socrates_cyclone5_defconfig
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
+N:	Min Xu <xuminready@gmail.com>
+F:	package/shadowsocks-libev/
+
 N:	Morgan Delestre <m.delestre@sinters.fr>
 F:	package/monkey/
 
diff --git a/package/Config.in b/package/Config.in
index 6a1606e568..1730201bf3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1854,6 +1854,7 @@ endif
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
+	source "package/shadowsocks-libev/Config.in"
 	source "package/shairport-sync/Config.in"
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
new file mode 100644
index 0000000000..d02e5a93ef
--- /dev/null
+++ b/package/shadowsocks-libev/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV
+	bool "shadowsocks-libev"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_PCRE
+	help
+	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
+	  embedded devices and low-end boxes.
+
+	  https://github.com/shadowsocks/shadowsocks-libev
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
new file mode 100644
index 0000000000..e8be8a8a71
--- /dev/null
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -0,0 +1,8 @@
+# Locally computed
+sha256 5521cf623a07fd1e393528516a83acd2b66c5d4bb4535a52662806a6a060c606 shadowsocks-libev-3.2.0.tar.gz
+
+# License files, locally calculated
+sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
+sha256 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
+sha256 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
+sha256 4b3adc9ce620fa868f1dda328203dbccbd3e9f5fbafb49c581edc386a504ee1a  libipset/LICENSE.txt
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
new file mode 100644
index 0000000000..caae2176b4
--- /dev/null
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# shadowsocks-libev
+#
+################################################################################
+
+SHADOWSOCKS_LIBEV_VERSION = 3.2.0
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
+SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
+SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
+SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
+SHADOWSOCKS_LIBEV_CONF_OPTS = \
+	--with-pcre=$(STAGING_DIR)/usr \
+	--disable-ssp
+
+$(eval $(autotools-package))
