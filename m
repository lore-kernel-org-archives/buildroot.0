From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 21:53:47 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: add option to install
	utilities
Message-ID: <20130106205645.B47379A630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38cdf82a761f15754c609441028ec82d7886bdf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, dvb-apps was a 'blind' package that would install
only the transponders data files for use by external packages
(namely tvheadend).

Now, we add an option to also install the DVB utilities.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/dvb-apps/Config.in                         |   17 ++++++++++++++
 package/dvb-apps/dvb-apps.mk                       |   23 ++++++++++++++++++-
 package/tvheadend/Config.in                        |    1 +
 .../tvheadend-no-auto-download-dvbscans.patch      |    2 +-
 5 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 047af8d..c25ade2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,6 +215,7 @@ source "package/devmem2/Config.in"
 endif
 source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
+source "package/dvb-apps/Config.in"
 source "package/eeprog/Config.in"
 source "package/evtest/Config.in"
 source "package/flashrom/Config.in"
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
new file mode 100644
index 0000000..5d0b6f5
--- /dev/null
+++ b/package/dvb-apps/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DVB_APPS
+	bool "dvb-apps (transponders data)"
+	help
+	  Install the DVB-C, DVB-S, DVB-T and ATSC transponders data.
+	  
+	  http://linuxtv.org/projects.php
+	  http://linuxtv.org/hg/dvb-apps
+
+if BR2_PACKAGE_DVB_APPS
+
+config BR2_PACKAGE_DVB_APPS_UTILS
+	bool "dvb-apps utilities"
+	help
+	  A small number of DVB test and utility programs,
+	  including szap and dvbscan.
+
+endif
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 5db8148..f914799 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -18,11 +18,30 @@ DVB_APPS_SITE_METHOD    = hg
 # apply to us.
 DVB_APPS_LICENSE        = unknown (probably public domain)
 
+ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
+# Utilitiess are selected, build and install everything
+DVB_APPS_INSTALL_STAGING = YES
+
+define DVB_APPS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
+endef
+
+define DVB_APPS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) V=1 DESTDIR=$(STAGING_DIR) install
+endef
+
+define DVB_APPS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) V=1 DESTDIR=$(TARGET_DIR) install
+endef
+
+else
+# Utilities are not selected, just install the scan files
 define DVB_APPS_INSTALL_TARGET_CMDS
 	for i in atsc dvb-c dvb-s dvb-t; do \
-		mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/$$i; \
-		$(INSTALL) $(@D)/util/scan/$$i/* $(TARGET_DIR)/usr/share/dvb-apps/scan/$$i; \
+		mkdir -p $(TARGET_DIR)/usr/share/dvb/$$i; \
+		$(INSTALL) $(@D)/util/scan/$$i/* $(TARGET_DIR)/usr/share/dvb/$$i; \
 	done
 endef
+endif
 
 $(eval $(generic-package))
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 944e31e..e6dee3a 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -4,6 +4,7 @@ comment "tvheadend requires a toolchain with LARGEFILE support"
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
diff --git a/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
index 50bc4b6..963d4f2 100644
--- a/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
+++ b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
@@ -54,7 +54,7 @@ diff -durN tvheadend-v3.3.orig//support/posix.mk tvheadend-v3.3/support/posix.mk
  	done
 -
 +	mkdir -p ${DESTDIR}${datadir}/tvheadend/data
-+	ln -s /usr/share/dvb-apps/scan ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
++	ln -sf /usr/share/dvb ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
  
  uninstall:
  	rm -f ${DESTDIR}${bindir)/tvheadend
