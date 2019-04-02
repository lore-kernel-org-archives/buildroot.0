From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Apr 2019 22:32:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: fix build
 with host-gettext-tiny
Message-ID: <20190402203237.14733-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't build and intall i18n if BR2_SYSTEM_ENABLE_NLS is not set
otherwise build will fail with host-gettext-tiny on:

msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
fopen: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/0c230e49b6e9bf27163f751e6912ee85c6eb62e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index f41ad701d3..7475edead3 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -12,6 +12,11 @@ VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr
 
 VDR_PLUGIN_VNSISERVER_CXXFLAGS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC"
 
+VDR_PLUGIN_VNSISERVER_INSTALL_TARGETS = install-lib
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+VDR_PLUGIN_VNSISERVER_INSTALL_TARGETS += install-i18n
+endif
+
 define VDR_PLUGIN_VNSISERVER_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		$(VDR_PLUGIN_VNSISERVER_CXXFLAGS)
@@ -19,8 +24,8 @@ endef
 
 define VDR_PLUGIN_VNSISERVER_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		install DESTDIR=$(TARGET_DIR) LIBDIR=/usr/lib/vdr \
-		LOCDIR=/usr/share/locale
+		$(VDR_PLUGIN_VNSISERVER_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) \
+		LIBDIR=/usr/lib/vdr LOCDIR=/usr/share/locale
 endef
 
 $(eval $(generic-package))
-- 
2.14.1
