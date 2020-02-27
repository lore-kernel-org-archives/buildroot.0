From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 09:39:37 -0300
Subject: [Buildroot] [PATCH 3/4] package/openrc: adapt "modules" init script
 to busybox "modprobe"
In-Reply-To: <20200227123938.13412-1-unixmania@gmail.com>
References: <20200227123938.13412-1-unixmania@gmail.com>
Message-ID: <20200227123938.13412-4-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

If kmod tools are not selected, check for the busybox features and adapt
the modules script accordingly, since the busybox modprobe does not have
a "--first-time" option, "--verbose" is just "-v" and "--use-blacklist"
is just "-b". Also the blacklist support is not selected in the default
busybox configuration.

If modprobe is not available, do not install the modules script and
configuration file.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/openrc/openrc.mk | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 3f6453cef5..999e34e094 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -9,7 +9,7 @@ OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
 
-OPENRC_DEPENDENCIES = ncurses
+OPENRC_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
 # set LIBNAME so openrc puts files in proper directories and sets proper
 # paths in installed files. Since in buildroot /lib64 and /lib32 always
@@ -29,9 +29,30 @@ else
 OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
 endif
 
-define OPENRC_BUILD_CMDS
-	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
+# modprobe can be provided by either kmod or busybox
+ifeq ($(BR2_PACKAGE_KMOD_TOOLS),)
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+# Busybox modprobe does not have a --first-time option; --verbose is just -v
+# and --use-blacklist is just -b.
+ifeq ($(call KCONFIG_GET_OPT,CONFIG_MODPROBE,$(BUSYBOX_BUILD_CONFIG)),y)
+ifeq ($(call KCONFIG_GET_OPT,CONFIG_FEATURE_MODPROBE_BLACKLIST,$(BUSYBOX_BUILD_CONFIG)),y)
+OPENRC_MODULES_BLACKLIST = s/ --use-blacklist/ -b/
+else
+OPENRC_MODULES_BLACKLIST = s/ --use-blacklist//
+endif
+define OPENRC_MODULES_CLEAN
+	$(SED) 's/ --first-time//;$(OPENRC_MODULES_BLACKLIST);s/--verbose/-v/' \
+		$(@D)/init.d/modules.in
+endef
+else # BR2_PACKAGE_BUSYBOX
+# No modprobe command available. Do not build/install the modules script.
+define OPENRC_MODULES_CLEAN
+	$(SED) 's/ modules//' $(@D)/{conf.d,init.d,runlevels}/Makefile
 endef
+endif # CONFIG_MODPROBE
+OPENRC_POST_PATCH_HOOKS += OPENRC_MODULES_CLEAN
+endif # BR2_PACKAGE_BUSYBOX
+endif # BR2_PACKAGE_KMOD_TOOLS
 
 define OPENRC_INSTALL_TARGET_CMDS
 	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
-- 
2.18.2
