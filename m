From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Oct 2009 22:20:28 +0200
Subject: [Buildroot] [git commit master] Makefile: add rand/allyes/allno
	package config targets
Message-ID: <20091004202133.288D877303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6652770f4164d57458b41ed8f15bd3039c69abb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the normal targets, but only affects the BR2_PACKAGE_* options.
E.G. handy for keeping your current toolchain config while testing
(random) packages.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   34 ++++++++++++++++++++++++++++++++--
 1 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a14c62d..5497c9b 100644
--- a/Makefile
+++ b/Makefile
@@ -30,6 +30,7 @@ DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig xconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release \
+	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
 
 # Strip quotes and then whitespaces
@@ -535,6 +536,33 @@ allnoconfig: $(CONFIG)/conf
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
 
+randpackageconfig: $(CONFIG)/conf
+	@mkdir -p $(CONFIG)/buildroot-config
+	@grep -v BR2_PACKAGE_ .config > .config.nopkg
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
+		KCONFIG_ALLCONFIG=.config.nopkg \
+		$(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
+	@rm -f .config.nopkg
+
+allyespackageconfig: $(CONFIG)/conf
+	@mkdir -p $(CONFIG)/buildroot-config
+	@grep -v BR2_PACKAGE_ .config > .config.nopkg
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
+		KCONFIG_ALLCONFIG=.config.nopkg \
+		$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
+	@rm -f .config.nopkg
+
+allnopackageconfig: $(CONFIG)/conf
+	@mkdir -p $(CONFIG)/buildroot-config
+	@grep -v BR2_PACKAGE_ .config > .config.nopkg
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
+		KCONFIG_ALLCONFIG=.config.nopkg \
+		$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
+	@rm -f .config.nopkg
+
 defconfig: $(CONFIG)/conf
 	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
@@ -589,6 +617,9 @@ help:
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
+	@echo '  randpackageconfig      - New config with random answer to package options'
+	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
+	@echo '  allnopackageconfig     - New config where package options are answered with no'
 	@echo '  configured             - make {uclibc/busybox/linux26}-config'
 	@echo
 	@echo 'Miscellaneous:'
@@ -606,6 +637,5 @@ release: distclean
 	tar cfz $$OUT.tar.gz --exclude .svn --exclude .git --exclude \*~ $$OUT; \
 	rm -rf $$OUT
 
-.PHONY: dummy subdirs release distclean clean config oldconfig \
-	menuconfig xconfig check test depend defconfig help
+.PHONY: $(noconfig_targets)
 
-- 
1.6.3.3
