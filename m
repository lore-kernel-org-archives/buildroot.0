From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sun, 30 Oct 2016 18:13:00 -0400
Subject: [Buildroot] [PATCH v2 4/5] lttng-modules: bump to version 2.8.3
In-Reply-To: <20161030214114.GI18077@free.fr>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
 <20161030195649.6415-5-eeppeliteloop@gmail.com>
 <20161030214114.GI18077@free.fr>
Message-ID: <CAB4xu_3U3qskp+x4mqFqRRmMmLb6XDuiH5toQujR=AwevgQZQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 30, 2016 at 5:41 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Philippe, All,
>
> Eh, undoing my patch here. Meh... ;-]
>
> On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
>> LTTng-modules has its own Makefile to build its modules. In particular,
>> starting from v2.8, LTTng-modules has a way to be included as part of a
>> Linux kernel image, that is, not as loadable kernel modules. This
>> implies that additional environment variables need to be passed to the
>> Makefile and kernel build system.
>
> OK, so two things here:
>
>  1- We do not support building LTTng built-in to the kernel do we? Or do
>     you plan in making that possible?
>
>  2- we can pass additional variables when building modules:
>     https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules
>
>     LTTNG_MODULES_MODULE_MAKE_OPTS = VARIABLE=value
>
>> It's always a good idea for this project to use its Makefile directly,
>> not building it like you build your typical kernel modules, that is,
>> using make with `-C` to change directory to the kernel source, and
>> pointing the module with `M=`. The LTTng-modules does this internally
>> anyway.
>>
>> Using the project's Makefile directly instead of the generic BR
>> kernel-module package ensures that future minor bumps of this project
>> will be easier as well.
>
> Using the kernel-module infra makes it sure that we pass the kernel
> related variables.
>
> I'm not too fond of changing that back.
>
>> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> [--SNIP--]
>> diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
>> index 5d0c422..34bb0fb 100644
>> --- a/package/lttng-modules/lttng-modules.mk
>> +++ b/package/lttng-modules/lttng-modules.mk
>> @@ -4,11 +4,34 @@
>>  #
>>  ################################################################################
>>
>> -LTTNG_MODULES_VERSION = 2.7.1
>> +LTTNG_MODULES_VERSION = 2.8.3
>>  LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
>>  LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
>>  LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
>>  LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
>> +LTTNG_MODULES_DEPENDENCIES = linux
>> +
>> +ifeq ($(BR2_PACKAGE_LTTNG_MODULES),y)
>> +LINUX_NEEDS_MODULES = y
>> +endif
>> +
>> +LTTNG_MODULES_MAKE_OPTS = \
>> +     KERNELDIR="$(LINUX_DIR)" \
>> +     ARCH="$(KERNEL_ARCH)" \
>> +     CROSS_COMPILE="$(TARGET_CROSS)"
>> +
>> +define LTTNG_MODULES_BUILD_CMDS
>> +     $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) -C $(@D)
>> +endef
>> +
>> +define LTTNG_MODULES_INSTALL_STAGING_CMDS
>> +     $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) \
>> +             INSTALL_MOD_PATH="$(STAGING_DIR)" -C $(@D) modules_install
>> +endef
>
> Why do you need to install the modules in staging?

Oh that's a bad copy from another package. Indeed this is not needed
in staging.

>
> I stand by the fact that we should use the kernel-modules infra, if it
> can be made to work with specifying just the few new variables that are
> needed, as explained above.
>
> If not possible, then provide an explanation why this is not sufficient.

It's definitely possible. I changed it because upstream said that it's better to
use their own Makefile as they can add new variables without having to
track them in the distribution build systems. I can convert it back to using the
the kernel-module infra if you prefer. I have no other arguments.

Phil

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
