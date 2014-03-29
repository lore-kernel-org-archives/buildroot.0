From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:30:37 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: bump revision
Message-ID: <20140329173147.6D03A9C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=365ae61c5c30df79801a61910eb72efa3ea9ab45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this new revision, there is no longer transponders data, so dvb-apps
now only installs the dvb-apps utilities.

Packages that needs the transponders data have now all been switched to
use dtv-scan-tables instead, so we don't need a legacy option for the
transponders data.

However, we add a legacy option for the utilities option, just to inform
the user of the new behaviour.

Sadly, a user that had dvb-apps selected just to get the transponders
data will now get the full dvb-apps package installed. There's nothing
we can really do about this.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy             |    7 +++++++
 package/dvb-apps/Config.in   |   24 +++++++-----------------
 package/dvb-apps/dvb-apps.mk |   13 +------------
 3 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index afcd3b1..17ead9b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
+config BR2_PACKAGE_DVB_APPS_UTILS
+	bool "dvb-apps utilities now built by default"
+	select BR2_LEGACY
+	help
+	  The dvb-apps utilities are now always built when the dvb-apps
+	  package is selected.
+
 config BR2_KERNEL_HEADERS_SNAP
 	bool "Local Linux snapshot support removed"
 	select BR2_LEGACY
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index 76b33aa..3f8fdb6 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -1,25 +1,15 @@
 config BR2_PACKAGE_DVB_APPS
-	bool "dvb-apps (transponders data)"
-	select BR2_PACKAGE_DTV_SCAN_TABLES
-	help
-	  Install the DVB-C, DVB-S, DVB-T and ATSC transponders data.
-
-	  http://linuxtv.org/projects.php
-	  http://linuxtv.org/hg/dvb-apps
-
-if BR2_PACKAGE_DVB_APPS
-
-comment "dvb-apps utils needs a toolchain w/ largefile, threads, headers >= 3.3"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-
-config BR2_PACKAGE_DVB_APPS_UTILS
-	bool "dvb-apps utilities"
+	bool "dvb-apps"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-	  A small number of DVB test and utility programs,
+	  Install a small number of DVB test and utility programs,
 	  including szap and dvbscan.
 
-endif
+	  http://linuxtv.org/projects.php
+	  http://linuxtv.org/hg/dvb-apps
+
+comment "dvb-apps utils needs a toolchain w/ largefile, threads, headers >= 3.3"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 5f576e0..c5e1954 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -4,15 +4,9 @@
 #
 ################################################################################
 
-DVB_APPS_VERSION        = be76da69f250
+DVB_APPS_VERSION        = 3d43b280298c39a67d1d889e01e173f52c12da35
 DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD    = hg
-
-DVB_APPS_DEPENDENCIES   = dtv-scan-tables
-
-ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
-# Utilitiess are selected, build and install everything
-
 DVB_APPS_LICENSE        = GPLv2 GPLv2+ LGPLv2.1+
 DVB_APPS_LICENSE_FILES  = COPYING COPYING.LGPL
 
@@ -38,9 +32,4 @@ define DVB_APPS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) V=1 DESTDIR=$(TARGET_DIR) install
 endef
 
-else
-# We do not really install anything, so there's no license
-DVB_APPS_LICENSE        = none
-endif
-
 $(eval $(generic-package))
