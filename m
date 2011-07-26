From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 26 Jul 2011 12:38:56 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LXV+7P5636KKv9TSKNPPT2zdXUJF=MP_A5r4fMHXXOyBw@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
 <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
 <1311178214.2189.68.camel@dublxciaranr1.verifone.com>
 <CAAXf6LXV+7P5636KKv9TSKNPPT2zdXUJF=MP_A5r4fMHXXOyBw@mail.gmail.com>
Message-ID: <CAAXf6LU9VNve2cjhXBK3EG81tHvW0a7o_2FqA2q3xX34bLpFtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Jul 24, 2011 at 1:36 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Wed, Jul 20, 2011 at 6:10 PM, Quotient Remainder
> <quotientvremainder@gmail.com> wrote:
>> Thomas,
>>
>> On Wed, 2011-07-20 at 15:38 +0200, Thomas De Schampheleire wrote:
>>> >
>>> >> * I need to be able to compile external kernel modules, so in that
>>> >> Makefile I need to point to the right kernel directory.
>>> >
>>> > Ok. Those could be integrated as Buildroot packages, in which case
>>> > getting access to the Linux source directory is easy.
>>>
>>> Good point. I'll have to add Mercurial support in buildroot to get there though.
>>
>> I may be misinterpreting, but does the above mean that you have a decent
>> generic external kernel module build structure going? ?I have a terribly
>> hacky setup working here but it's completely incompatible with the
>> recent linux GENTARGETS approach.
>> Care to share your external module build stuff?
>
> I wouldn't call it a 'generic build structure'. So far I have been
> using a simple Makefile, taking one command-line variable pointing to
> the buildroot 'output' directory. Based on this variable, the location
> of the kernel is inferred (currently based on a 'linux' symlink I
> added, as mentioned earlier), together with the compiler.
>
> TARGETS=module1 module2
> OPTIONS= -C $(BUILDROOT_OUTPUT)/build/linux M=$(PWD) ARCH=powerpc
> CROSS_COMPILE=$(BUILDROOT_OUTPUT)/host/usr/bin/powerpc-linux-
> EXTRA_CFLAGS += -DDEBUG
>
> OBJECTS=$(addsuffix .o, $(TARGETS))
> obj-m += $(OBJECTS)
>
> all:
> ? ? ? ?make $(OPTIONS) modules
>
> clean:
> ? ? ? ?make $(OPTIONS) clean
>
> install:
> ? ? ? ?make $(OPTIONS) INSTALL_MOD_PATH=$(BUILDROOT_OUTPUT)/target
> INSTALL_MOD_STRIP=1 modules_install
>
>
>
> After the suggestions in this thread, plus the intention to have as
> much of the project builds being coordinated from buildroot, I'm going
> to step away from this approach though. The linux-fusion Makefile that
> Thomas referred to seems like a good starting point for me.

Just to follow this up: I now integrated my external kernel modules in
buildroot. I used linux-fusion as a starting point, but it seemed
overly complex to me. For example, there are variables KERNEL_VERSION,
KERNEL_BUILD, KERNEL_SOURCE and SYSROOT which may be needed
specifically for the linux-fusion package but is not generically
needed IMO.

Here is the .mk file I use:

MY_LINUX_DRIVERS_VERSION = 17e422f57c8b
MY_LINUX_DRIVERS_SOURCE = my-linux-drivers-$(MY_LINUX_DRIVERS_VERSION).tar.gz
MY_LINUX_DRIVERS_SITE = /repo/tdescham/reborn/my-linux-drivers
MY_LINUX_DRIVERS_SITE_METHOD = hg

MY_LINUX_DRIVERS_DEPENDENCIES = linux26

MY_LINUX_DRIVERS_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
MY_LINUX_DRIVERS_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
MY_LINUX_DRIVERS_MAKE_OPTS += -C $(LINUX26_DIR)
MY_LINUX_DRIVERS_MAKE_OPTS += M=$(@D)

MY_LINUX_DRIVERS_INSTALL_MOD_DIR = mydrivers

define MY_LINUX_DRIVERS_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) $(MY_LINUX_DRIVERS_MAKE_OPTS)
endef

define MY_LINUX_DRIVERS_INSTALL_TARGET_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) $(MY_LINUX_DRIVERS_MAKE_OPTS) \
                INSTALL_MOD_PATH=$(TARGET_DIR) INSTALL_MOD_STRIP=1 \
                INSTALL_MOD_DIR=$(MY_LINUX_DRIVERS_INSTALL_MOD_DIR) \
                modules_install
endef

define MY_LINUX_DRIVERS_UNINSTALL_TARGET_CMDS
        rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/$(MY_LINUX_DRIVERS_INSTALL_MOD_DIR)
endef

$(eval $(call GENTARGETS,package,my_linux_drivers))


Then, in the driver sources, all you need is a Makefile or Kbuild file
containing something like:
obj-m += module1.o module2.o

plus any other Kbuild directives you may need, like ccflags-y.

I'm planning to add a way to select which drivers from the
my_linux_drivers repo you want, so that e.g. the Makefile looks like:
obj-$(CONFIG_MODULE1) += module1.o
obj-$(CONFIG_MODULE2) += module2.o

and CONFIG_MODULE1 and 2 are then passed in by the .mk file, based on
the buildroot configuration file.

Comments are welcome,
Thomas
