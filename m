From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 13:20:21 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libftdi1: fix
 license
Message-ID: <20191203121322.B133583C69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782cfe46970f6cf511a22bfd19ddd02a06cabf25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

The GPL only applies to the C++ bindings and eeprom utility, which are
conditionally enabled with BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1 and
BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM, respectively.

The COPYING.LIB is indeed the LGPL-2.0, but the source file for
libftdi1 states LGPL-2.1-only, see src/ftdi.c

The src/ftdi_stream.c also bears a notice of the MIT license, so the
library itself is under both LGPL-2.1-only and MIT.

Note: the COPYING.GPL license file may get added twice to the list, but
that is not a problem in practice: it is just copied twice.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - GPL-2.0 also applies to the ftdi_eeprom utility
  - s/ftdipp1/libftdipp1/
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a8ef6a5b928d98fc80ab7ed124963bfc0ecc68ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi1/libftdi1.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 014dd8401e..9c3bafdbc0 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -9,12 +9,14 @@ LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = libusb
-LIBFTDI1_LICENSE = LGPL-2.0 (libftdi1), GPL-2.0 with exception (ftdipp1)
-LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
+LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
+LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
+LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
+LIBFTDI1_LICENSE_FILES += COPYING.GPL
 LIBFTDI1_DEPENDENCIES += boost
 LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
 else
@@ -30,6 +32,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM),y)
 # ftdi_eeprom optionally depends on libintl
+LIBFTDI1_LICENSE += , GPL-2.0 (ftdi_eeprom)
+LIBFTDI1_LICENSE_FILES += COPYING.GPL
 LIBFTDI1_DEPENDENCIES += libconfuse $(TARGET_NLS_DEPENDENCIES)
 LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=ON
 else
