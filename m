From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 15 Mar 2020 22:43:20 -0300
Subject: [Buildroot] Running depmod in the package installation
Message-ID: <CAJ4jsaeaKzb7o9Pj4u0wZyjM1zY2nWErKffTep5QYBEAhd=bug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildrooters,

Currently if a package installs a kernel module it must be loaded by
means of its full path, e.g

    insmod /lib/modules/$(/bin/uname -r)/extra/pvrsrvkm.ko

This is required because modprobe does not work, since we must run

    $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) <kernel-version>

So I did this in package/ti-sgx-km/ti-sgx-km.mk, to test:

define TI_SGX_KM_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
                DISCIMAGE=$(TARGET_DIR) \
                kbuild_install -C $(@D)/$(TI_SGX_KM_SUBDIR)
        kver=$$($(MAKE) -C $(LINUX_DIR) --no-print-directory -s
kernelversion); \
        $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $$kver
 endef

With this change a "modprobe pvrsrvkm" works but I wonder if it should
be better to run depmod in a target-finalize hook in linux/linux.mk,
e.g,

define LINUX_DEPMOD
        $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) \
                $$($(MAKE) -C $(LINUX_DIR) --no-print-directory -s
kernelversion)
endef

What do you think?

-- 
Carlos Santos <unixmania@gmail.com>
