From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] kconfig: build in
	BUILD_DIR/buildroot-config
Message-ID: <20100621210811.9CB30817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2cc210c92fec4dd2977dd6022ddc1e0b77f4c269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This way the main buildroot dir can be completely read-only for
out-of-tree builds

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                |   41 +++++++++++++++++++++--------------------
 package/config/Makefile |   24 ++++++++++++++----------
 package/config/gconf.c  |    2 +-
 3 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index c8f211b..7e00b65 100644
--- a/Makefile
+++ b/Makefile
@@ -462,56 +462,57 @@ all: menuconfig
 HOSTCFLAGS=$(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
-$(CONFIG)/%onf:
-	mkdir -p $(BUILD_DIR)/buildroot-config
-	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) $(notdir $@)
+$(BUILD_DIR)/buildroot-config/%onf:
+	mkdir -p $(@D)/lxdialog
+	$(MAKE) CC="$(HOSTCC)" obj=$(@D) -C $(CONFIG) $(@F)
 	- at if [ ! -f $(CONFIG_DIR)/.config ]; then \
 		cp $(CONFIG_DEFCONFIG) $(CONFIG_DIR)/.config; \
 	fi
 
-xconfig: $(CONFIG)/qconf
+xconfig: $(BUILD_DIR)/buildroot-config/qconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/qconf $(CONFIG_CONFIG_IN); then \
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-gconfig: $(CONFIG)/gconf
+gconfig: $(BUILD_DIR)/buildroot-config/gconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/gconf $(CONFIG_CONFIG_IN); then \
+		srctree=$(TOPDIR) \
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-menuconfig: $(CONFIG)/mconf
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/mconf $(CONFIG_CONFIG_IN); then \
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-config: $(CONFIG)/conf
+config: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN)
 
-oldconfig: $(CONFIG)/conf
+oldconfig: $(BUILD_DIR)/buildroot-config/conf
 	mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -o $(CONFIG_CONFIG_IN)
 
-randconfig: $(CONFIG)/conf
+randconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -r $(CONFIG_CONFIG_IN)
 
-allyesconfig: $(CONFIG)/conf
+allyesconfig: $(BUILD_DIR)/buildroot-config/conf
 	cat $(CONFIG_DEFCONFIG) > $(CONFIG_DIR)/.config
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
@@ -524,7 +525,7 @@ allnoconfig: $(CONFIG)/conf
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
 
-randpackageconfig: $(CONFIG)/conf
+randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
@@ -533,7 +534,7 @@ randpackageconfig: $(CONFIG)/conf
 		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allyespackageconfig: $(CONFIG)/conf
+allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
@@ -542,7 +543,7 @@ allyespackageconfig: $(CONFIG)/conf
 		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allnopackageconfig: $(CONFIG)/conf
+allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
@@ -551,7 +552,7 @@ allnopackageconfig: $(CONFIG)/conf
 		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-defconfig: $(CONFIG)/conf
+defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
diff --git a/package/config/Makefile b/package/config/Makefile
index 197c500..34cc4b7 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -1,4 +1,3 @@
-obj := .
 src := .
 top_srcdir=../../
 top_builddir=../../
@@ -16,23 +15,28 @@ host-cmulti := $(foreach m,$(__hostprogs),\
            $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
 host-cxxmulti := $(foreach m,$(__hostprogs),\
            $(if $($(m)-cxxobjs),$(m),$(if $($(m)-objs),)))
-host-cobjs := $(sort $(foreach m,$(__hostprogs),$($(m)-objs)))
-host-cxxobjs := $(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs)))
+host-cobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-objs))))
+host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs))))
+
+HOST_EXTRACFLAGS += -I$(obj)
 
 $(host-csingle): %: %.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $(obj)/$@
 
 $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$@) -o $@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
 
 $(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
-	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
+	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs) $($(@F)-cxxobjs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
+
+$(obj)/%.o: %.c
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
 
-$(host-cobjs): %.o: %.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $< -o $@
+$(obj)/%.o: $(obj)/%.c
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
 
-$(host-cxxobjs): %.o: %.cc
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) -c $< -o $@
+$(obj)/%.o: %.cc
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$(@F)) -c $< -o $@
 
 $(obj)/%:: $(src)/%_shipped
 	$(Q)cat $< > $@
diff --git a/package/config/gconf.c b/package/config/gconf.c
index b8a1661..7c4c76c 100644
--- a/package/config/gconf.c
+++ b/package/config/gconf.c
@@ -1576,7 +1576,7 @@ int main(int ac, char *av[])
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
+		glade_file = g_strconcat(env, "/package/config/gconf.glade", NULL);
 	else if (av[0][0] == '/')
 		glade_file = g_strconcat(av[0], ".glade", NULL);
 	else
-- 
1.7.1
