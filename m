From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 15:35:47 +0200
Subject: [Buildroot] [git commit] package/rubix: bump to version 1.0.6
Message-ID: <20190602201236.00D588EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cb6e1b619c420f33b3f460aa49dae52521d9b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to http://sed.free.fr/rubix
- Add hash for license file
- Switch to generic-package (configure script has been removed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rubix/Config.in  |  2 +-
 package/rubix/rubix.hash |  3 ++-
 package/rubix/rubix.mk   | 15 ++++++++++++---
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/rubix/Config.in b/package/rubix/Config.in
index 7afc0ae7b9..e814a95f57 100644
--- a/package/rubix/Config.in
+++ b/package/rubix/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_RUBIX
 	help
 	  A 3D rubiks cube game for X
 
-	  http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
+	  http://sed.free.fr/rubix
diff --git a/package/rubix/rubix.hash b/package/rubix/rubix.hash
index 90fc9cd11e..3992110c32 100644
--- a/package/rubix/rubix.hash
+++ b/package/rubix/rubix.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 d3c6bf8bfa891e72baac0250a79d26045ddb4412b72d90de7c46091c07516b43  rubix-1.0.5.tar.bz2
+sha256 ccff4c98373f76c6bab751f5f5a60df7ad8691c79b56157e4aba2dd76f501a87  rubix-1.0.6.tar.bz2
+sha256 429d04118c02bc92d834c430601f8c0c8df1ab27e3617ec73ad3f66c5953475d  LICENCE
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index b808bc0b87..937339f546 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBIX_VERSION = 1.0.5
+RUBIX_VERSION = 1.0.6
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
-RUBIX_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
+RUBIX_SITE = http://sed.free.fr/rubix
 RUBIX_LICENSE = Public Domain
 RUBIX_LICENSE_FILES = LICENCE
 RUBIX_DEPENDENCIES = xlib_libX11
@@ -18,4 +18,13 @@ RUBIX_MAKE_OPTS = \
 
 RUBIX_INSTALL_TARGET_OPTS = GAMESDIR=$(TARGET_DIR)/usr/games install
 
-$(eval $(autotools-package))
+define RUBIX_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(RUBIX_MAKE_OPTS) rubix
+endef
+
+define RUBIX_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(RUBIX_MAKE_OPTS) \
+		$(RUBIX_INSTALL_TARGET_OPTS)
+endef
+
+$(eval $(generic-package))
