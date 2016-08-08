From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:48:37 +0200
Subject: [Buildroot] [git commit] owfs: disable PHP support
Message-ID: <20160808214841.2AA328183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eef80855f1b4533467e04c8e776f1e2f826e5090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we upgraded PHP to PHP 7.x, the PHP support of OWFS started
failing to build. Since we can hardly fix that on our own, the issue was
reported upstream (https://sourceforge.net/p/owfs/support-requests/32/)
and for now, we will disable PHP support in OWFS.

Fixes:

  http://autobuild.buildroot.net/results/fe6843ec53fbed452d2e38a8577a235f73abb8db/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/owfs/owfs.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 0092603..83614af 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -17,6 +17,10 @@ OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
 OWFS_INSTALL_STAGING = YES
 
+# owfs PHP support is not PHP 7 compliant
+# https://sourceforge.net/p/owfs/support-requests/32/
+OWFS_CONF_OPTS += --disable-owphp --without-php
+
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 OWFS_DEPENDENCIES += libfuse
 OWFS_CONF_OPTS += \
@@ -49,13 +53,6 @@ else
 OWFS_CONF_OPTS += --disable-avahi
 endif
 
-ifeq ($(BR2_PACKAGE_PHP),y)
-OWFS_CONF_OPTS += --enable-owphp --with-php --with-phpconfig=$(STAGING_DIR)/usr/bin/php-config
-OWFS_DEPENDENCIES += php host-swig
-else
-OWFS_CONF_OPTS += --disable-owphp --without-php
-endif
-
 # setup.py isn't python3 compliant
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 OWFS_CONF_OPTS += \
