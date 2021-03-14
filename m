From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Mar 2021 10:46:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix build with kernel < 4.6
Message-ID: <20210314094641.166444-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable linuxspi with kernel < 4.6 as linux/gpio.h is only available
since
https://github.com/torvalds/linux/commit/3c702e9987e261042a07e43460a8148be254412e

This build failure is raised since switch to upstream in commit
03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a

Fixes:
 - http://autobuild.buildroot.org/results/962a7fcff1e54a0550eafa0cbca780ba8bc8409e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avrdude/avrdude.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index b6754684e1..e086fd1d97 100644
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
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6),y)
+AVRDUDE_CONF_OPTS += --enable-linuxspi
+else
+AVRDUDE_CONF_OPTS += --disable-linuxspi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 AVRDUDE_DEPENDENCIES += libftdi1
 else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
-- 
2.30.0
