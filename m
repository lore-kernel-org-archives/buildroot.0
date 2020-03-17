From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2020 22:23:23 +0100
Subject: [Buildroot] Running depmod in the package installation
In-Reply-To: <CAJ4jsaeaKzb7o9Pj4u0wZyjM1zY2nWErKffTep5QYBEAhd=bug@mail.gmail.com>
References: <CAJ4jsaeaKzb7o9Pj4u0wZyjM1zY2nWErKffTep5QYBEAhd=bug@mail.gmail.com>
Message-ID: <20200317212323.GU19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-15 22:43 -0300, Carlos Santos spake thusly:
> Hello buildrooters,
> 
> Currently if a package installs a kernel module it must be loaded by
> means of its full path, e.g
> 
>     insmod /lib/modules/$(/bin/uname -r)/extra/pvrsrvkm.ko
> 
> This is required because modprobe does not work, since we must run
> 
>     $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) <kernel-version>

Damn, I was pretty sure we already did it, but it appears not.

> So I did this in package/ti-sgx-km/ti-sgx-km.mk, to test:
> 
> define TI_SGX_KM_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
>                 DISCIMAGE=$(TARGET_DIR) \
>                 kbuild_install -C $(@D)/$(TI_SGX_KM_SUBDIR)
>         kver=$$($(MAKE) -C $(LINUX_DIR) --no-print-directory -s
> kernelversion); \
>         $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $$kver
>  endef
> 
> With this change a "modprobe pvrsrvkm" works but I wonder if it should
> be better to run depmod in a target-finalize hook in linux/linux.mk,
> e.g,

Exactly what I was going to suggest.

> define LINUX_DEPMOD
>         $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) \
>                 $$($(MAKE) -C $(LINUX_DIR) --no-print-directory -s kernelversion)

I guess you'd want to use $(LINUX_VERSION_PROBED) instead of
hand-calling kernelversion, linux/linux.mk at 159:

    # Get the real Linux version, which tells us where kernel modules are
    # going to be installed in the target filesystem.
    LINUX_VERSION_PROBED = ....

Regards,
Yann E. MORIN.

> endef
> 
> What do you think?
> 
> -- 
> Carlos Santos <unixmania@gmail.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
