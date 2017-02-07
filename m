From: LogiSch17 <logi.tss@hotmail.de>
Date: Tue, 7 Feb 2017 03:27:55 -0800 (PST)
Subject: [Buildroot] BR2_EXTERNAL tree - Config.in can`t open
 /package/Config.in after Update to 2016.11
In-Reply-To: <1486456485390-156297.post@n4.nabble.com>
References: <1486456485390-156297.post@n4.nabble.com>
Message-ID: <1486466875822-156337.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As i didn?t mentioned before,
the structure was not build by me.
When i do it the normal way, like:
make BR2_EXTERNAL=*path_to_external* menuconfig
out from buildroot dir it works.
But the guys i am working for want to call make from the external dir, which
includes the buildroot dir.

So before 2016.11 , they could type make, and make menuconfig while in the
"main" dir,
which executed the Makefile, which executed common.mk

common.mk:
 #location of the buildroot sources
MAKEARGS := -C $(CURDIR)/buildroot
#location to store build files
MAKEARGS += O=$(CURDIR)/$(PROJECT_NAME)/output
# location to store extra config options and buildroot packages
MAKEARGS += BR2_EXTERNAL=$(CURDIR)
#transmit project name to be able to use it in kconfig
MAKEARGS += PROJECT_NAME=$(PROJECT_NAME)
# location of default defconfig
DEFCONFIG_FILE=$(CURDIR)/$(PROJECT_NAME)/defconfig
DEFCONFIG := BR2_DEFCONFIG=$(DEFCONFIG_FILE)
ALT_DEFCONFIG := BR2_DEFCONFIG=$(CURDIR)/defconfig

MAKEFLAGS += --no-print-directory

#these targets change the config file
config_change_targets:=menuconfig nconfig xconfig gconfig oldconfig \
       	silentoldconfig randconfig allyesconfig allnoconfig
randpackageconfig \
       	allyespackageconfig allnopackageconfig

special_target:=$(config_change_targets) Makefile defconfig savedefconfig
%_defconfig

all	:= $(filter-out $(special_target),$(MAKECMDGOALS))

default:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig
	$(MAKE) $(MAKEARGS) $(DEFCONFIG)


.PHONY: $(special_target) $(all)

# update from current config and save it as defconfig
defconfig:
	$(MAKE) $(MAKEARGS) $(ALT_DEFCONFIG) $@
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) savedefconfig

# update from defconfig and save it as current configuration
savedefconfig:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig
	$(MAKE) $(MAKEARGS) $(ALT_DEFCONFIG) savedefconfig

# generate from a defconfig then save as current configuration
%_defconfig:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig $@
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) savedefconfig
	$(call UPDATE_DEFCONFIG)


# update from current configuration, run the command, then save the result
$(config_change_targets): $(DEFCONFIG_FILE)
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig $@
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) savedefconfig

_all:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) $(all)

$(all): _all
	@:

%/: _all
	@:

Makefile:;

$(DEFCONFIG_FILE):
	$(call UPDATE_DEFCONFIG)

define UPDATE_DEFCONFIG
	echo 'BR2_DL_DIR="$$(BR2_EXTERNAL)/dl"' >> $(DEFCONFIG_FILE)
	echo 'BR2_ROOTFS_OVERLAY="$$(BR2_EXTERNAL)/overlay"' >> $(DEFCONFIG_FILE)
	echo 'BR2_PACKAGE_OVERRIDE_FILE="$$(BR2_EXTERNAL)/local.mk"' >>
$(DEFCONFIG_FILE)
	echo 'BR2_GLOBAL_PATCH_DIR="$$(BR2_EXTERNAL)/patch"' >> $(DEFCONFIG_FILE)
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig savedefconfig
endef

But why this doesn?t work anymore. 
Has anyone worked with such a structure before?



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/BR2-EXTERNAL-tree-Config-in-can-t-open-package-Config-in-after-Update-to-2016-11-tp156297p156337.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
