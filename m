From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Thu, 1 Dec 2011 13:53:56 -0600
Subject: [Buildroot] [PATCH 1/1] igh-ethercat: new package
In-Reply-To: <8994d83580fbd41c89016f1cc35e10ecce46025b.1322691543.git.thomas.petazzoni@free-electrons.com>
References: <cover.1322691543.git.thomas.petazzoni@free-electrons.com>
 <8994d83580fbd41c89016f1cc35e10ecce46025b.1322691543.git.thomas.petazzoni@free-electrons.com>
Message-ID: <001401ccb062$f6768db0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried taking the results of the patch and putting them in the .mk file
that I was using with buildroot-2011.11 (I really don't want to have to find
out why 2011.11 has that filesystem problem, so can someone please help with
this makefile?).

I do not see the application get built, nor do I see the kernel modules get
built.  I notice that the new .mk file that Thomas make doesn't have the
$eval.  Perhaps I need that back in?  If so, can someone tell me the right
one (gentargets versus autotargets).

Please help.

Here is the .mk file:

#############################################################
#
# EtherCAT
#
#############################################################
ETHERCAT_VERSION = 1.0
ETHERCAT_SOURCE = etherlabmaster-1.0.tar.bz2
###ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
ETHERCAT_SITE = http://127.0.0.1/home/user1/Desktop/EtherCAT4Atmel/
ETHERCAT_AUTORECONF = YES
ETHERCAT_DEPENDENCIES = linux
ETHERCAT_INSTALL_STAGING = YES

#ETHERCAT_INSTALL_TARGET = YES
#ETHERCAT_CONF_OPT = --enable-generic
ETHERCAT_CONF_OPT = \
	--with-linux-dir=$(LINUX_DIR)

ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_E100),--enable-e100,--disable-e100)
ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_ETHERCAT_R8169),--enable-r8169,--disable-r8169)

define ETHERCAT_CREATE_CHANGELOG
	touch $(@D)/ChangeLog
endef

ETHERCAT_POST_PATCH_HOOKS += ETHERCAT_CREATE_CHANGELOG

define ETHERCAT_BUILD_MODULES
	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
endef

ETHERCAT_POST_BUILD_HOOKS += ETHERCAT_BUILD_MODULES

define ETHERCAT_INSTALL_MODULES
	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install
endef

ETHERCAT_POST_INSTALL_TARGET_HOOKS += ETHERCAT_INSTALL_MODULES


###These next two lines were a part of building the kernel module.
#ETHERCAT_DEPENDENCIES = linux
#ETHERCAT_INSTALL_MOD_DIR = ethercat

# From here to the GENTARGETS line is part of building the kernel module.
#define ETHERCAT_BUILD_CMDS
#       $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) M=$(@D) modules
#endef
#
#define ETHERCAT_INSTALL_TARGET_CMDS
#       $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) M=$(@D) \
#               INSTALL_MOD_STRIP=1 \
#               INSTALL_MOD_DIR=$(ETHERCAT_INSTALL_MOD_DIR) \
#               modules_install
#endef
#
#define ETHERCAT_UNINSTALL_TARGET_CMDS
#       rm -rf
$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/$(ETHERCAT_INSTALL_MOD_D
IR)
#endef

# $(eval $(call GENTARGETS,package,ethercat))

# This is the $eval that was used when making the application.  It didn't
appear to work when used
# with the above $eval (the above one is for making the kernel module).
# $(eval $(call AUTOTARGETS,package,ethercat))
