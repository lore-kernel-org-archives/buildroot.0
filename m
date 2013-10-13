From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Oct 2013 18:53:18 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <525AB5F9.8090907@gmail.com>
References: <525AAE63.3060601@gmail.com> <20131013145124.GA16563@free.fr>
 <525AB5F9.8090907@gmail.com>
Message-ID: <36BC54E98DCB453CA22ADF10A4AF6F94@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Just a caution:
It's best to do a clean in a MYKMOD_CONFIGURE_CMDS section.
I stumbled into this: the install path was not correct if the module had been build before.
(In my case it was already build from within eclipse while developing.)

Here is my buildroot .mk file for info :
--------------------------------------
########################################################################
#
# fm25clxx
#
########################################################################

FM25CLXX_VERSION = 1.0.1
FM25CLXX_SITE = /root/workspace2/FM25FRAMDriver-$(FM25CLXX_VERSION)
FM25CLXX_SITE_METHOD = local
FM25CLXX_DEPENDENCIES = linux


TARGETKERNEL = $(BUILD_DIR)/linux-$(BR2_LINUX_KERNEL_VERSION)
FM25CLXX_MOD_INSTALL_DIR=mydrivers

FM25CLXX_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
FM25CLXX_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)

FM25CLXX_INSTALL_OPTS += -C $(TARGETKERNEL)
FM25CLXX_INSTALL_OPTS += M=$(@D)
FM25CLXX_INSTALL_OPTS += INSTALL_MOD_PATH=$(TARGET_DIR)
FM25CLXX_INSTALL_OPTS += INSTALL_MOD_STRIP=1
FM25CLXX_INSTALL_OPTS += INSTALL_MOD_DIR=kernel/$(FM25CLXX_MOD_INSTALL_DIR)

# see https://www.kernel.org/doc/Documentation/kbuild/modules.txt

define FM25CLXX_CONFIGURE_CMDS
	$(MAKE) KERNELDIR=$(TARGETKERNEL) $(DIGITAL_IO_MAKE_OPTS) PWD=$(@D) -C $(@D)  clean
endef

define FM25CLXX_BUILD_CMDS
	$(MAKE) KERNELDIR=$(TARGETKERNEL) $(FM25CLXX_MAKE_OPTS) PWD=$(@D) -C $(@D)  all
endef

define FM25CLXX_INSTALL_TARGET_CMDS
	$(MAKE) $(FM25CLXX_MAKE_OPTS) $(FM25CLXX_INSTALL_OPTS) modules_install
endef

define FM25CLXX_UNINSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/$(FM25CLXX_MOD_INSTALL_DIR)
endef

$(eval $(generic-package))

--------------------------------------

The actual module makefile looked like :

---------------------
MODULENAME := fm25clxx

obj-m += $(MODULENAME).o

all:$(MODULENAME).ko

$(MODULENAME).ko:$(MODULENAME).c
	make -C $(KERNELDIR) SUBDIRS=$(PWD) modules CC=arm-linux-gcc LD=arm-linux-ld ARCH=arm
	
.PHONY clean:
	make -C $(KERNELDIR) M=$(PWD) clean

---------------------

The $(KERNELDIR) is an environment variable I have set inside eclipse to point to the kernel.
(usually something like .../buildroot/output/build/linux-xx.yy.zz )

It's maybe not perfect but it allowed me to develop in eclipse and at the same time build it using buildroot.

Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Marco Trapanese
Verzonden: zondag 13 oktober 2013 17:02
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] Kernel module compiled but not found

Il 13/10/2013 16:51, Yann E. MORIN ha scritto:
> You're missing INSTALL_MOD_PATH=$(TARGET_DIR) on this command line 
> (the make line for 'MYKMOD_INSTALL_TARGET_CMDS' ). Regards, Yann E.
> MORIN. 

Yann,
thank you for your quick answer. I changed the command line (in
sensoray2253/sensoray2253.mk) in this way:

define SENSORAY2253_INSTALL_TARGET_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)
INSTALL_MOD_PATH=$(TARGET_DIR) modules_install endef

Is it correct?
Mark

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
