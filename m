From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:10:55 +0100
Subject: [Buildroot] [git commit] package/qwt: partially convert to qmake
 infrastructure
Message-ID: <20200311205842.1AC459096C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35af9fa17aa9510115da779ae37416fa75d2a79a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the qmake infrastructure for its generic configure and build steps
but keep the manipulation of qwtconfig.pri as a PRE_CONFIGURE_HOOK as
well as the custom install steps.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qwt/qwt.mk | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index a82c786cb1..f09304d0e4 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -8,7 +8,6 @@ QWT_VERSION = 6.1.4
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-QWT_DEPENDENCIES = qt5base
 
 QWT_LICENSE = LGPL-2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
@@ -42,14 +41,11 @@ else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
 endif
 
-define QWT_CONFIGURE_CMDS
+define QWT_TWEAK_QWTCONFIG_PRI
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
-define QWT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QWT_PRE_CONFIGURE_HOOKS += QWT_TWEAK_QWTCONFIG_PRI
 
 # After installation, we fixup the INSTALL_PREFIX in qwtconfig.pri so
 # that when building with qmake, -L$(STAGING_DIR)/usr/lib is used and
@@ -65,4 +61,4 @@ define QWT_INSTALL_TARGET_CMDS
 	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
