From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:13:36 +0200
Subject: [Buildroot] [git commit] package/neard: bump version to 0.16
Message-ID: <20170924111225.C16DB7FB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab65f51ab80b9f5ebab25937fe25ef70e566e8a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added systemd support needed after upstream commit
https://git.kernel.org/pub/scm/network/nfc/neard.git/commit/?id=ffc849bc1c83f0c9f31cbdf9bf843cf245496183

Fixed broken link in Config.in help section.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/neard/Config.in  | 2 +-
 package/neard/neard.hash | 2 +-
 package/neard/neard.mk   | 9 ++++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index 8571e7c..d32d636 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_NEARD
 
 	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
 
-	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
+	  https://01.org/linux-nfc/
 
 if BR2_PACKAGE_NEARD
 
diff --git a/package/neard/neard.hash b/package/neard/neard.hash
index 7517093..d1e74b3 100644
--- a/package/neard/neard.hash
+++ b/package/neard/neard.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/nfc/sha256sums.asc
-sha256	6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca	neard-0.14.tar.xz
+sha256 eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36  neard-0.16.tar.xz
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index c46f46c..a351469 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.14
+NEARD_VERSION = 0.16
 NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPL-2.0
@@ -17,6 +17,13 @@ ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
 NEARD_CONF_OPTS += --enable-tools
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NEARD_CONF_OPTS += --enable-systemd
+NEARD_DEPENDENCIES += systemd
+else
+NEARD_CONF_OPTS += --disable-systemd
+endif
+
 define NEARD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/neard/S53neard \
 		$(TARGET_DIR)/etc/init.d/S53neard
