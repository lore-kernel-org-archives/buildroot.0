From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:44:37 +0100
Subject: [Buildroot] [git commit] package/igd2-for-linux: bump to version 2.1
Message-ID: <20210126182545.9A2CB835E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=846491d6a84f279b8189923b960d2859317d4346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move to autotools which has been added to this version to fix static
build failure with an openssl-enabled libupnp in version > 1.6

Fixes:
 - http://autobuild.buildroot.org/results/86214570ac5093d4a5a31fadae59c3f47df16948

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/igd2-for-linux/igd2-for-linux.hash |  2 +-
 package/igd2-for-linux/igd2-for-linux.mk   | 27 +++++----------------------
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
index fc215727d7..fe1272338a 100644
--- a/package/igd2-for-linux/igd2-for-linux.hash
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e3fcc7c9da4ad1ca16227b3b1b3712bcfb3f6ec922685eee7ae4a76edfa32bb4  igd2-for-linux-2.0.tar.gz
+sha256  843f2b0a7597e6cc7af85da099a7cce3401a334cbb4a6ae9d38ce252311db9b9  igd2-for-linux-2.1.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  linuxigd2/doc/LICENSE
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  linuxigd2/src/threadutil/COPYING
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 85119a14b5..8cc3c6ae18 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGD2_FOR_LINUX_VERSION = 2.0
+IGD2_FOR_LINUX_VERSION = 2.1
 IGD2_FOR_LINUX_SITE = \
 	$(call github,Orange-OpenSource,igd2-for-linux,v$(IGD2_FOR_LINUX_VERSION))
 
@@ -12,26 +12,9 @@ IGD2_FOR_LINUX_LICENSE = GPL-2.0, BSD-3-Clause
 IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE linuxigd2/src/threadutil/COPYING
 
 IGD2_FOR_LINUX_DEPENDENCIES = libupnp
-
-IGD2_FOR_LINUX_BUILD_DIR = $(@D)/linuxigd2
-IGD2_FOR_LINUX_CONF_DIR = $(IGD2_FOR_LINUX_BUILD_DIR)/configs
-
-define IGD2_FOR_LINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(IGD2_FOR_LINUX_BUILD_DIR) \
-		$(TARGET_CONFIGURE_OPTS) \
-		LIBUPNP_PREFIX="$(STAGING_DIR)/usr" \
-		all
-endef
-
-define IGD2_FOR_LINUX_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(IGD2_FOR_LINUX_BUILD_DIR)/bin/upnpd \
-		$(TARGET_DIR)/usr/sbin/upnpd
-	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/upnpd.conf \
-		$(TARGET_DIR)/etc/upnpd.conf
-	mkdir -p $(TARGET_DIR)/etc/linuxigd/
-	cp -dpfr $(IGD2_FOR_LINUX_CONF_DIR)/*.{xml,png} \
-		$(TARGET_DIR)/etc/linuxigd/
-endef
+# From git
+IGD2_FOR_LINUX_AUTORECONF = YES
+IGD2_FOR_LINUX_SUBDIR = linuxigd2
 
 define IGD2_FOR_LINUX_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/igd2-for-linux/S99upnpd \
@@ -43,4 +26,4 @@ define IGD2_FOR_LINUX_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/upnpd.service
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
