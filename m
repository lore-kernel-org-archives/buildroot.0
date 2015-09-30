From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 22:56:41 +0200
Subject: [Buildroot] [git commit] flashrom: fix static build
Message-ID: <20150930205738.6C5E77FA5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=803ed997fb2eca841ffafa047b194cf322f766df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use $(TARGET_MAKE_ENV) to set $PATH so as to make sure Buildroot pkg-config is
used. This corrects pkg-config output, and fixes static build.

Fixes:
http://autobuild.buildroot.net/results/b6e/b6e9f3cb7fa8019e631c14d9c832174125ec64ba/
http://autobuild.buildroot.net/results/30c/30c83f9c60ac5c7359ddabdc1f190ab12433ae92/
http://autobuild.buildroot.net/results/2a5/2a5da78dd5b2922796e3010e4a0477cb9f6355cb/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/flashrom.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 525470a..7e0fcf2 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -7,12 +7,12 @@
 FLASHROM_VERSION = 0.9.8
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi
+FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
 FLASHROM_LICENSE = GPLv2+
 FLASHROM_LICENSE_FILES = COPYING
 
 define FLASHROM_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define FLASHROM_INSTALL_TARGET_CMDS
