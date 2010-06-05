From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 21:15:10 +0200
Subject: [Buildroot] [git commit master] Makefile: cleanup *conf targets
Message-ID: <20100605191714.ADE098F6C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=35fac17ebca566795bdd947033eedb5c5ea3a492
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The make targets for the kconfig conf/mconf/qconf are almost identical,
so us a single rule for it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   22 ++++------------------
 1 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index e36b475..a75ca3e 100644
--- a/Makefile
+++ b/Makefile
@@ -469,23 +469,9 @@ all: menuconfig
 HOSTCFLAGS=$(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
-$(CONFIG)/conf:
-	@mkdir -p $(CONFIG)/buildroot-config
-	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf
-	- at if [ ! -f .config ]; then \
-		cp $(CONFIG_DEFCONFIG) .config; \
-	fi
-
-$(CONFIG)/mconf:
-	@mkdir -p $(CONFIG)/buildroot-config
-	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) mconf
-	- at if [ ! -f .config ]; then \
-		cp $(CONFIG_DEFCONFIG) .config; \
-	fi
-
-$(CONFIG)/qconf:
-	@mkdir -p $(CONFIG)/buildroot-config
-	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) qconf
+$(CONFIG)/%onf:
+	mkdir -p $(CONFIG)/buildroot-config
+	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) $(notdir $@)
 	- at if [ ! -f .config ]; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
@@ -513,7 +499,7 @@ config: $(CONFIG)/conf
 		$(CONFIG)/conf $(CONFIG_CONFIG_IN)
 
 oldconfig: $(CONFIG)/conf
-	@mkdir -p $(CONFIG)/buildroot-config
+	mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
-- 
1.6.3.3
