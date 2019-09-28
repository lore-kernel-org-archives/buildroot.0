From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:49:08 +0200
Subject: [Buildroot] [git commit] package/znc: switch to cmake
Message-ID: <20190928194401.3F00881457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc57bafb870d17463dd9ecdb00a8be59668136f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream deprecated autoconf and asks to use cmake:
https://github.com/znc/znc/commit/71f35b003dda65f3867ff84deaf8aa15bcd0b958

Add options to explicitly disable cyrus and i18n support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/znc/znc.mk | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 9556b60fdf..78e1410b68 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -9,35 +9,37 @@ ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_DEPENDENCIES = host-pkgconf
-ZNC_CONF_OPTS = --disable-perl
+ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 ZNC_DEPENDENCIES += icu
-ZNC_CONF_OPTS += --enable-charset
+ZNC_CONF_OPTS += -DWANT_ICU=ON
 else
-ZNC_CONF_OPTS += --disable-charset
+ZNC_CONF_OPTS += -DWANT_ICU=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ZNC_DEPENDENCIES += openssl
-ZNC_CONF_OPTS += --enable-openssl
+ZNC_CONF_OPTS += -DWANT_OPENSSL=ON
 else
-ZNC_CONF_OPTS += --disable-openssl
+ZNC_CONF_OPTS += -DWANT_OPENSSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZNC_DEPENDENCIES += zlib
-ZNC_CONF_OPTS += --enable-zlib
+ZNC_CONF_OPTS += -DWANT_ZLIB=ON
 else
-ZNC_CONF_OPTS += --disable-zlib
+ZNC_CONF_OPTS += -DWANT_ZLIB=OFF
 endif
 
 # python support depends on icu
 ifeq ($(BR2_PACKAGE_ICU)$(BR2_PACKAGE_PYTHON3),yy)
 ZNC_DEPENDENCIES += python3 host-swig
-ZNC_CONF_OPTS += --enable-python=python3
+ZNC_CONF_OPTS += \
+	-DWANT_PYTHON=ON \
+	-DWANT_PYTHON_VERSION=python3
 else
-ZNC_CONF_OPTS += --disable-python
+ZNC_CONF_OPTS += -DWANT_PYTHON=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
