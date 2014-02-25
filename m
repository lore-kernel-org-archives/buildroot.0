From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 25 Feb 2014 11:31:10 -0500
Subject: [Buildroot] [PATCH] am335x-pru-package: new package
In-Reply-To: <20140223191943.GH32759@free.fr>
References: <1392255830-27810-1-git-send-email-fhunleth@troodon-software.com>
 <20140223191943.GH32759@free.fr>
Message-ID: <CA+-urNRP7=kgTEM3yQSN=4+k7bGz-Zq7kbvG6G-dD2nVtmdauw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Feb 23, 2014 at 2:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Franck, All,
>
> On 2014-02-12 20:43 -0500, Frank Hunleth spake thusly:
>> am335x-pru-package provides an assembler and program loader for Texas
>> Instrument's AM335x programmable real-time units.
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
> Thanks for your contribution, and sorry for the delay.

No problem regarding the delay. There have been some recent
discussions around this project that may affect the buildroot
integration, so I'm waiting on those to be resolved as well. I'll be
sending the next patch updates hopefully in the next week or so as I
understand more about what will be happening.

>
> Here are a few comments, below.
>
> [--SNIP--]
>> diff --git a/package/am335x-pru-package/Config.in.host b/package/am335x-pru-package/Config.in.host
>> new file mode 100644
>> index 0000000..283128e
>> --- /dev/null
>> +++ b/package/am335x-pru-package/Config.in.host
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_HOST_AM335X_PRU_PACKAGE
>> +     bool "host am335x-pru-package"
>> +     depends on BR2_arm # only relevant for TI am335x
>> +     help
>> +       TI AM335X PRU assembler (pasm)
>> +
>> +       https://github.com/beagleboard/am335x_pru_package
>
> Is there any special reason this is a user-visible option?
>
> Does it make sense to build the host variant without building the target
> variant?

I don't think so. I'll remove the host variant from being user visible.

>
>> diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
>> new file mode 100644
>> index 0000000..f70e679
>> --- /dev/null
>> +++ b/package/am335x-pru-package/am335x-pru-package.mk
>> @@ -0,0 +1,40 @@
>> +################################################################################
>> +#
>> +# am335x-pru-package
>> +#
>> +################################################################################
>> +
>> +AM335X_PRU_PACKAGE_VERSION = f46d8cb564f492740ccd33a03e8368ee4ecc83ae
>> +AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
>> +AM335X_PRU_PACKAGE_LICENSE = BSD-3c
>> +AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
>> +AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
>> +AM335X_PRU_PACKAGE_INSTALL_STAGING = YES
>> +
>> +define AM335X_PRU_PACKAGE_BUILD_CMDS
>> +     $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
>> +             -C $(@D)/pru_sw/app_loader/interface all
>
> Usually, 'all' is the default target for make, so it is not required to
> specify it. You only need to specify it if it is not the default.

I'll double check whether it's the default now. If it isn't, I'll
submit a fix upstream since I agree that it should be.

>
>> +endef
>> +
>> +define AM335X_PRU_PACKAGE_INSTALL_STAGING_CMDS
>> +     $(MAKE1) PREFIX="$(STAGING_DIR)/usr" \
>> +             -C $(@D)/pru_sw/app_loader/interface install
>> +endef
>> +
>> +define AM335X_PRU_PACKAGE_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -m 0755 -D $(@D)/pru_sw/app_loader/lib/libprussdrv.so \
>> +             $(TARGET_DIR)/usr/lib
>
> You need to pass the full intall path, not only the directory name.
> If $(TARGET_DIR)/usr/lib does not exist, then install would simply copy
> libprussdrv.so to the file $(TARGET_DIR)/usr/lib.
>
>     $(INSTALL) -m 0755 -D $(@D)/pru_sw/app_loader/lib/libprussdrv.so \
>         $(TARGET_DIR)/usr/lib/libprussdrv.so

Thanks for catching that.

>
>> +endef
>> +
>> +define HOST_AM335X_PRU_PACKAGE_BUILD_CMDS
>> +     cd $(@D)/pru_sw/utils/pasm_source && \
>> +             $(HOSTCC) -Wall -D_UNIX_ pasm.c pasmpp.c pasmexp.c pasmop.c \
>> +                     pasmdot.c pasmstruct.c pasmmacro.c -o ../pasm
>
> Any reason you output in the parent directory?

Only to have identical behavior to the non-so-useful build script
included in the project. In hindsight, this doesn't seem that
important anymore. Also, I think that someone is trying to get a
proper Makefile submitted upstream for building pasm. If it gets
accepted in the next couple weeks, I'll hopefully be able to use it.

> Also, no indentation on the second line.
>
> Why not:
>     cd $(@D)/pru_sw/utils/pasm_source && \
>     $(HOSTCC) -Wall -D_UNIX_ pasm.c pasmpp.c pasmexp.c pasmop.c \
>         pasmdot.c pasmstruct.c pasmmacro.c -o pasm
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
