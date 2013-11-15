From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 15 Nov 2013 21:24:49 +0100
Subject: [Buildroot] problem with building kernel modules.
Message-ID: <3FF194268D984DEF96AF81E6681E03E9@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi 

I have a kernel module that I build and install trough the build system.
This works fine, the module gets build, installed and depmod is run for it.

The problem occurs if I change the kernel config, the kernel build system
removes all target/lib/modules/2.6.36.../kernel/* files , including my built modules.

As a result, my modules are missing.

How can this be solved ? 



########################################################################
#
# fm25clxx
#
########################################################################

FM25CLXX_VERSION = 1.0.1
FM25CLXX_SITE = /root/workspace2/FM25FRAMDriver-$(FM25CLXX_VERSION)
FM25CLXX_SITE_METHOD = local
FM25CLXX_DEPENDENCIES = linux

FM25CLXX_MOD_INSTALL_DIR=mydrivers

FM25CLXX_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
FM25CLXX_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)

FM25CLXX_INSTALL_OPTS += -C $(LINUX_DIR)
FM25CLXX_INSTALL_OPTS += M=$(@D)
FM25CLXX_INSTALL_OPTS += INSTALL_MOD_PATH=$(TARGET_DIR)
FM25CLXX_INSTALL_OPTS += INSTALL_MOD_STRIP=1
FM25CLXX_INSTALL_OPTS += INSTALL_MOD_DIR=kernel/$(FM25CLXX_MOD_INSTALL_DIR)

# see https://www.kernel.org/doc/Documentation/kbuild/modules.txt

define FM25CLXX_CONFIGURE_CMDS
	$(MAKE) KERNELDIR=$(LINUX_DIR) $(DIGITAL_IO_MAKE_OPTS) PWD=$(@D) -C $(@D)  clean
endef

define FM25CLXX_BUILD_CMDS
	$(MAKE) KERNELDIR=$(LINUX_DIR) $(FM25CLXX_MAKE_OPTS) PWD=$(@D) -C $(@D)  all
endef

define FM25CLXX_INSTALL_TARGET_CMDS
	$(MAKE) $(FM25CLXX_MAKE_OPTS) $(FM25CLXX_INSTALL_OPTS) modules_install
endef

define FM25CLXX_UNINSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/$(FM25CLXX_MOD_INSTALL_DIR)
endef

$(eval $(generic-package))

 

Regards
Sagaert Johan
