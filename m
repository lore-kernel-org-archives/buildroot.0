From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 6 Oct 2012 15:51:38 +0200
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
In-Reply-To: <20121004223334.64e74a6f@skate>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <20121004223334.64e74a6f@skate>
Message-ID: <CAB0FRstLt+_NBPtbQq=xHaY7h43NjivyzjkSoWY1Ag3odvRYog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/4 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Fran?ois,
>
> Thanks for keeping up the good work on this.
>
> On Tue, 25 Sep 2012 19:18:17 +0200, Francois Perrad wrote:
>> only user mode for the current target architecture
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in.host      |    1 +
>>  package/qemu/Config.in.host |   15 +++++++++++++++
>>  package/qemu/qemu.mk        |   43 +++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 59 insertions(+)
>>  create mode 100644 package/qemu/Config.in.host
>>  create mode 100644 package/qemu/qemu.mk
>>
>> diff --git a/package/Config.in.host b/package/Config.in.host
>> index 79050f2..bf95a10 100644
>> --- a/package/Config.in.host
>> +++ b/package/Config.in.host
>> @@ -4,6 +4,7 @@ source "package/dfu-util/Config.in.host"
>>  source "package/lpc3250loader/Config.in.host"
>>  source "package/omap-u-boot-utils/Config.in.host"
>>  source "package/openocd/Config.in.host"
>> +source "package/qemu/Config.in.host"
>>  source "package/sam-ba/Config.in.host"
>>  source "package/uboot-tools/Config.in.host"
>>
>> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
>> new file mode 100644
>> index 0000000..379507c
>> --- /dev/null
>> +++ b/package/qemu/Config.in.host
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_HOST_QEMU
>> +     bool "host qemu"
>> +     help
>> +       QEMU is a generic and open source machine emulator and virtualizer.
>> +
>> +       In user mode emulation, QEMU runs single cross-compiled programs.
>> +       Fast cross-compilation and cross-debugging are the main targets
>> +       for user-mode emulation.
>> +
>> +       In system mode emulation, QEMU emulates a full computer system,
>> +       including peripherals, and handles the filesystem image generated
>> +       by Buildroot.
>> +       (Buildroot is shipped with many configs/qemu_*_defconfig files).
>> +
>> +       http://qemu.org/
>
> I think you should not add a Kconfig option for the host-qemu package
> for now. Until it supports the system emulation, it is kind of useless
> to have it listed in the host tools. For the perl stuff, you only need
> the user emulation, so let's add support for the user emulation only at
> the moment.
>
>> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
>> new file mode 100644
>> index 0000000..d727f49
>> --- /dev/null
>> +++ b/package/qemu/qemu.mk
>> @@ -0,0 +1,43 @@
>> +#############################################################
>> +#
>> +# qemu
>> +#
>> +#############################################################
>> +
>> +QEMU_VERSION = 1.2.0
>> +QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
>> +QEMU_SITE = http://wiki.qemu.org/download
>> +
>> +HOST_QEMU_DEPENDENCIES =
>
> I think this is not needed.
>
>> +
>> +QEMU_ARCH=$(ARCH)
>> +ifeq ($(QEMU_ARCH),i686)
>> +    QEMU_ARCH=i386
>> +endif
>> +HOST_QEMU_TARGETS=$(QEMU_ARCH)-linux-user
>
> This will not work for a number of architectures.
>
> See the definition of BR2_ARCH in target/Config.in.arch. The list of
> architectures you have to handle is:
>
>         arm     -> no change
>         armeb   -> no change
>         avr32   -> not supported (so the perl package should depends on !BR2_avr32)
>         bfin    -> not supported (so the perl package should depends on !BR2_bfin)
>         i386    -> no change
>         i486    -> change to i386
>         i586    -> change to i386
>         i686    -> change to i386
>         x86_64  -> no change
>         microblaze -> we probably have an issue here in
>                         target/Config.in.arch as we don't
>                         make the distinction between
>                         little endian and big endian
>         mips            -> no change
>         mipsel          -> no change
>         mips64el        -> not sure what to do
>         mips64          -> not sure what to do
>         powerpc         -> change to ppc
>         sh2             -> not supported (so perl should depends on !BR2_sh2)
>         sh2a            -> ditto
>         sh3             -> ditto
>         sh4             -> no change
>         sh4eb           -> no change
>         sh4aeb          -> not sure, maybe sh4eb would work, but I don't know
>         sh4a            -> not sure, same reason
>         sh64            -> not supported (so perl should depends on !BR2_sh64)
>         sparc           -> no change
>
> So the definition of QEMU_ARCH needs to be made a bit more complicated.
> Note: I wouldn't mind if you decide to exclude certain architectures
> even if they might potentially work. We have to limit the development
> work for a first version, otherwise we'll never get those patches
> merged. So you could decide to support only i386, arm and maybe powerpc
> for now, I would be fine with this.

Ok.

>
>> +define HOST_QEMU_CONFIGURE_CMDS
>> +     (cd $(@D); ./configure                          \
>> +             --target-list="$(HOST_QEMU_TARGETS)"    \
>> +             --prefix="$(HOST_DIR)/usr"              \
>> +             --interp-prefix=$(STAGING_DIR)          \
>> +             --cc="$(HOSTCC)"                        \
>> +             --host-cc="$(HOSTCC)"                   \
>> +             --extra-cflags="$(HOST_CFLAGS)"         \
>> +             --extra-ldflags="$(HOST_LDFLAGS)"       \
>> +     )
>> +endef
>> +
>> +define HOST_QEMU_BUILD_CMDS
>> +     $(MAKE) -C $(@D) all
>> +endef
>> +
>> +define HOST_QEMU_INSTALL_CMDS
>> +     $(MAKE) -C $(@D) install
>> +endef
>> +
>> +define HOST_QEMU_CLEAN_CMDS
>> +     $(MAKE) -C $(@D) clean
>> +endef
>> +
>> +$(eval $(host-generic-package))
>
> The rest sounds ok to me. Shouldn't you pass a bunch of --disable-xxx
> options in order to make sure that the Qemu ./configure script doesn't
> pick up certain host libraries (SDL, etc.) ?

Useless. The `configure` script detects many optional libraries for
qemu system mode, but anyway, qemu user mode uses none of them.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
