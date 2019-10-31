From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 09:08:40 +0100
Subject: [Buildroot] [git commit branch/2019.08.x]
 package/vdr-plugin-vnsiserver: don't install i18n files when not needed
Message-ID: <20191031084034.480978E153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be7a64108c65a62e40846bad653faae2e5d33aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

This used to cause a build failure with gettext-tiny, but this is now
fixed by the version bump in 160f0a033ba4edf2f7efe5fed82426acd3b34b70
("package/gettext-tiny: bump version"). Nevertheless, it makes sense
to not install the i18n files when they are not needed, i.e when
BR2_SYSTEM_ENABLE_NLS is disabled.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d9ed9b6d5925aa44185addccc15064d5af2af190)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index eeab0c879b..9b49736d04 100644
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
