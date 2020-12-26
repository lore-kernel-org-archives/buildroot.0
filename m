From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:21:34 +0100
Subject: [Buildroot] [git commit] package/bustle: bump to version 0.8.0
Message-ID: <20201226170421.493C783A28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436cb9308a50b1007a42eb490405a3155307a771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update license hash and remove GPL-3.0:
  https://gitlab.freedesktop.org/bustle/bustle/-/commit/c3f2f160c528c874c483a314ebbf997abfd85492
- Use PCAP_CONFIG which is available since
  https://gitlab.freedesktop.org/bustle/bustle/-/commit/7e2daf2984fc4d479b153e899b80e8d669ff54cf
- Update indentation in hash file (two spaces)

https://hackage.haskell.org/package/bustle-0.8.0/changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bustle/bustle.hash |  4 ++--
 package/bustle/bustle.mk   | 14 +++++---------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/bustle/bustle.hash b/package/bustle/bustle.hash
index 05281c4f11..0bb899f1c4 100644
--- a/package/bustle/bustle.hash
+++ b/package/bustle/bustle.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7760a695b25cb264e7342f353dcdc6d2b7faeacdcd85dd14e03c61b18e791664  bustle-0.7.5.tar.gz
-sha256 a6d6109e5b086de8e852e451b91b08b323302f55b6975d506c64c43bb094be38  LICENSE
+sha256  2fb3e9d9a97db3cd9a3ce763e86947b642bd7733b46206177a1677f08726573c  bustle-0.8.0.tar.gz
+sha256  ad168b537264fba8f94380cb10f60847da7db551fb4281bb6d4f24c74f652a1d  LICENSE
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 1dbad64aef..c6c3a72a91 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -4,20 +4,16 @@
 #
 ################################################################################
 
-BUSTLE_VERSION = 0.7.5
-BUSTLE_SITE = https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
-BUSTLE_LICENSE = LGPL-2.1+, GPL-3.0 (binaries)
+BUSTLE_VERSION = 0.8.0
+BUSTLE_SITE = https://hackage.haskell.org/package/bustle-$(BUSTLE_VERSION)
+BUSTLE_LICENSE = LGPL-2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
-
-BUSTLE_PCAP_FLAGS = "-lpcap"
-ifeq ($(BR2_STATIC_LIBS),y)
-BUSTLE_PCAP_FLAGS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
-endif
+BUSTLE_MAKE_OPTS = PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
 define BUSTLE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		PCAP_FLAGS="$(BUSTLE_PCAP_FLAGS)" -C $(@D) dist/build/bustle-pcap
+		$(BUSTLE_MAKE_OPTS) -C $(@D) dist/build/bustle-pcap
 endef
 
 define BUSTLE_INSTALL_TARGET_CMDS
