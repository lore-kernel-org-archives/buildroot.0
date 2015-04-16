From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Thu, 16 Apr 2015 17:57:45 -0400 (EDT)
Subject: [Buildroot] possibly silly question about top-level Makefile
Message-ID: <alpine.LFD.2.11.1504161749400.8332@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  never worried about embarrassing myself, i was perusing the
top-level Makefile to see how some of the targets are processed and
noticed the following.

  if i start with a fresh checkout, and do:

$ make beaglebone_defconfig

i see the rule that kicks in (well, at least the first one for that
pattern):

%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
        @mkdir -p $(BUILD_DIR)/buildroot-config
        @$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
                $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)

what i don't understand is the purpose of that "mkdir" command in the
rule.

  see, the first dependency of that rule is
$(BUILD_DIR)/buildroot-config/conf, and the rule to process that would
*seem* to be:

$(BUILD_DIR)/buildroot-config/%onf:
        mkdir -p $(@D)/lxdialog
        PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
            obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)

where you can see that the first command in *that* rule is to create
the required directory $(BUILD_DIR)/buildroot-config/, no? so once
that dependency has been satisfied, the directory
$(BUILD_DIR)/buildroot-config should now exist, right? so i don't see
the point of *explicitly* doing a mkdir command in that first rule.

  in fact, if you look@the collection of rules:

xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
        @mkdir -p $(BUILD_DIR)/buildroot-config
        @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
        @mkdir -p $(BUILD_DIR)/buildroot-config
        @$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)

menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
        @mkdir -p $(BUILD_DIR)/buildroot-config
        @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
        @mkdir -p $(BUILD_DIR)/buildroot-config
        @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
        @mkdir -p $(BUILD_DIR)/buildroot-config
        @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

isn't the "mkdir" command in *all* of those redundant?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
