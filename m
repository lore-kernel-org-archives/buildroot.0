From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 11:38:49 +0100
Subject: [Buildroot] [git commit] package/avrdude: fix build with kernel <
 4.6
Message-ID: <20210314103039.C2D3286AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b00d709be82109a13a749bce4c4b49e09bde8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 03fa36df7e6a (package/avrdude: Switch to upstream)
unconditionally enabled linuxspi on the assumption that it is available
since linux-2.6.22.

However, avrdude unconditionally uses GPIO and includes linux/gpio.h,
which is only available since kernel 4.6 and:
    https://github.com/torvalds/linux/commit/3c702e9987e261042a07e43460a8148be254412e

Add a Kconfig option, enabled by default for backward compatibility, to
drive whether to enable or disable SPI support.

Fixes:
 - http://autobuild.buildroot.org/results/962a7fcff1e54a0550eafa0cbca780ba8bc8409e

Note: weirdly enough, GPIO support does not use linux/gpio.h; rather it
uses sysfs.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add a Kconfig option]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/avrdude/Config.in  | 12 ++++++++++++
 package/avrdude/avrdude.mk |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index fba4253ad8..89558a5ff5 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_AVRDUDE
 
 	  https://github.com/kcuzner/avrdude
 
+if BR2_PACKAGE_AVRDUDE
+
+config BR2_PACKAGE_AVRDUDE_SPI
+	bool "SPI support"
+	default y # Backward compatibility
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
+comment "SPI support needs a toolchain w/ linux headers >= 4.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
+endif
+
 comment "avrdude needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index b6754684e1..ae623a7929 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -13,10 +13,16 @@ AVRDUDE_SUBDIR = avrdude
 # Sources coming from svn, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
-AVRDUDE_CONF_OPTS = --enable-linuxgpio --enable-linuxspi
+AVRDUDE_CONF_OPTS = --enable-linuxgpio
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
+ifeq ($(BR2_PACKAGE_AVRDUDE_SPI),y)
+AVRDUDE_CONF_OPTS += --enable-linuxspi
+else
+AVRDUDE_CONF_OPTS += --disable-linuxspi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 AVRDUDE_DEPENDENCIES += libftdi1
 else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
