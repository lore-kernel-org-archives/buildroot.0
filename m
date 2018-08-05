From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 15:00:33 +0200
Subject: [Buildroot] [git commit] wiringpi: disable for static build
Message-ID: <20180805125436.7D8268B4C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43dddc6e562c28b2b3f93acbb0939ef203bd0144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build of the wiringPi package is disabled by the tool author
(see wiringPi/noMoreStatic for details) since the version bump
to 2.46.

Fixes [1]:

  arm-linux-gcc.br_real: error: ../wiringPi/libwiringPi.a: No such file or directory

[1] http://autobuild.buildroot.net/results/a1ca953247475a5f31fe9283ade05c9cba26853b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wiringpi/Config.in   |  5 +++--
 package/wiringpi/wiringpi.mk | 28 +++++++---------------------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
index 2062a6208e..92f5dc6539 100644
--- a/package/wiringpi/Config.in
+++ b/package/wiringpi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WIRINGPI
 	bool "wiringpi"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -7,6 +8,6 @@ config BR2_PACKAGE_WIRINGPI
 
 	  http://wiringpi.com/
 
-comment "wiringpi needs a toolchain w/ threads"
+comment "wiringpi needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index 497a5d1ebe..0c3774917c 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -11,34 +11,20 @@ WIRINGPI_LICENSE = LGPL-3.0+
 WIRINGPI_LICENSE_FILES = COPYING.LESSER
 WIRINGPI_INSTALL_STAGING = YES
 
-ifeq ($(BR2_STATIC_LIBS),y)
-WIRINGPI_LIB_BUILD_TARGETS = static
-WIRINGPI_LIB_INSTALL_TARGETS = install-static
-WIRINGPI_BIN_BUILD_TARGETS = gpio-static
-else ifeq ($(BR2_SHARED_LIBS),y)
-WIRINGPI_LIB_BUILD_TARGETS = all
-WIRINGPI_LIB_INSTALL_TARGETS = install
-WIRINGPI_BIN_BUILD_TARGETS = all
-else
-WIRINGPI_LIB_BUILD_TARGETS = all static
-WIRINGPI_LIB_INSTALL_TARGETS = install install-static
-WIRINGPI_BIN_BUILD_TARGETS = all
-endif
-
 define WIRINGPI_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_BUILD_TARGETS)
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_BUILD_TARGETS)
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/gpio $(WIRINGPI_BIN_BUILD_TARGETS)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/devLib all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/gpio all
 endef
 
 define WIRINGPI_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi install DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib install DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
 endef
 
 define WIRINGPI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi install DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib install DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
 	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin/gpio
 	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin/pintest
 endef
