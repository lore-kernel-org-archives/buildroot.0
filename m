From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Tue, 15 Sep 2015 00:06:46 -0400
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
	library
In-Reply-To: <20150913101738.238ebc06@free-electrons.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
Message-ID: <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So, I'm going through comments and investigating. Everything seems
pretty reasonable.
I'll have more comments and an updated patch soon. First though, for
the vendor in the toolchain...

On Sun, Sep 13, 2015 at 4:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Chris,
>
> Thanks a lot! This patch looks pretty good. I have a couple of comments
> below, but overall it looks nice.
>
> On Sun, 13 Sep 2015 03:02:46 -0400, Chris Wardman wrote:
>> This patch add support for a newlib library build of the gcc toolchain.
>> This is designed to build arm-none-eabi- toolchain, and it was tested against an stm32f4discovery board.
>>
>> Hopefully this will help people build bare metal code for arm processors
>
> A few comments on the commit log:
>
>  * The title should be something like:
>
>         toolchain: add support for the newlib library
>
>  * The commit log text should be line wrapped at ~80 columns.
>
>  * I believe the last sentence "Hopefully this will help people build
>    bare metal code for arm processors" is not really useful as part of
>    the commit log.
>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 545694f..7f4d74e 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -37,10 +37,16 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>>  endif
>>
>>  # Compute GNU_TARGET_NAME
>> +ifeq ($(BR2_TOOLCHAIN_NO_VENDOR),y)
>> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(LIBC)$(ABI)
>
> Is it really mandatory to *not* have a vendor part of the tuple?

I've tried building arm-buildroot-none-eabi and
arm-buildroot-none-newlibeabi, both of which, based on my
understanding, should compile, but none of the tools build with that
target. Binutils doesn't compile, nor does gcc. I spent some time
looking at this, but never found an elegant solution.

If anyone has some suggestions about what I'm doing wrong there, I'd
love to know.

Thanks,
-Chris



>
>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>> index 501fcea..62f6b80 100644
>> --- a/package/gcc/gcc.mk
>> +++ b/package/gcc/gcc.mk
>> @@ -100,6 +100,13 @@ HOST_GCC_COMMON_CONF_OPTS = \
>>  HOST_GCC_COMMON_CONF_ENV = \
>>       MAKEINFO=missing
>>
>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_NEWLIB),y)
>> +HOST_GCC_COMMON_CONF_OPTS += --with-gnu-as
>> +else
>> +HOST_GCC_COMMON_CONF_OPTS += --disable-__cxa_atexit
>> +endif
>
> While I may understand that you're adding some specific options when
> BR2_TOOLCHAIN_BUILDROOT_NEWLIB=y, could you explain why you're doing
> something new in the "else" case, which should already be working today?
>
>> +
>> +
>
> Only one empty new line is necessary here.
>
>>  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>>
>> diff --git a/package/newlib/Config.in b/package/newlib/Config.in
>> new file mode 100644
>> index 0000000..0f3e2d7
>> --- /dev/null
>> +++ b/package/newlib/Config.in
>> @@ -0,0 +1,4 @@
>> +config BR2_PACKAGE_NEWLIB
>> +       bool
>> +       depends on BR2_TOOLCHAIN_USES_NEWLIB
>> +       default y
>
> Use tab for the indentation of bool / depends on / default.
>
>> diff --git a/package/newlib/newlib-0001-configure-tooldir-path.patch b/package/newlib/newlib-0001-configure-tooldir-path.patch
>> new file mode 100644
>> index 0000000..c162678
>> --- /dev/null
>> +++ b/package/newlib/newlib-0001-configure-tooldir-path.patch
>> @@ -0,0 +1,25 @@
>> +This patch is required to fix how the newlib headers are installed.
>> +
>> +The cross compiler expects headers to be in
>> +.../host/usr/arm-none-eabi/sysroot/usr/include/newlib.h
>> +by default newlib installed the headers into
>> +.../host/usr/arm-none-eabi/sysroot/arm-none-eabi/include/newlib.h
>> +
>> +${exec_prefix} provides the .../host/usr/arm-none-eabi/sysroot path
>> +${target_noncanonical} provides an extra arm-none-eabi/ that must be removed.
>> +
>> +Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
>> +
>> +
>> +diff -uNr newlib-old/configure newlib-new/configure
>> +--- newlib-old/configure     2014-07-05 17:09:07.000000000 -0400
>> ++++ newlib-new/configure     2014-12-25 00:59:01.727549186 -0500
>> +@@ -6985,7 +6985,7 @@
>> +
>> + # Some systems (e.g., one of the i386-aix systems the gas testers are
>> + # using) don't handle "\$" correctly, so don't use it here.
>> +-tooldir='${exec_prefix}'/${target_noncanonical}
>> ++tooldir='${exec_prefix}'/usr
>> + build_tooldir=${tooldir}
>
> You're patching the configure script, which we generally don't like,
> since it's generated from configure.ac. So you should either patch
> configure.ac and use NEWLIB_AUTORECONF = YES, or alternatively don't
> patch the code, and instead use a post install hook to move around the
> headers.
>
>> diff --git a/package/newlib/newlib.mk b/package/newlib/newlib.mk
>> new file mode 100644
>> index 0000000..02008e5
>> --- /dev/null
>> +++ b/package/newlib/newlib.mk
>> @@ -0,0 +1,48 @@
>> +################################################################################
>> +#
>> +# newlib
>> +#
>> +################################################################################
>> +
>> +NEWLIB_VERSION = 2.2.0
>
> There's a 2.2.0-1 version, that was released after 2.2.0, so presumably
> we may want to use this newer version?
>
>> +NEWLIB_SITE = ftp://sourceware.org/pub/newlib
>> +NEWLIB_LICENSE = MIT
>> +NEWLIB_LICENSE_FILES = COPYRIGHT
>> +
>> +NEWLIB_DEPENDENCIES = host-gcc-initial
>> +NEWLIB_ADD_TOOLCHAIN_DEPENDENCY = NO
>> +NEWLIB_INSTALL_STAGING = YES
>> +
>> +define NEWLIB_CONFIGURE_CMDS
>> +     (cd $(@D); \
>> +             $(TARGET_MAKE_ENV) \
>> +             ./configure \
>> +                     --target=$(GNU_TARGET_NAME) \
>> +                     --host=$(GNU_HOST_NAME) \
>> +                     --build=$(GNU_HOST_NAME) \
>> +                     --prefix=$(STAGING_DIR) \
>> +                     --includedir=$(STAGING_DIR)/usr/include \
>> +                     --oldincludedir=$(STAGING_DIR)/usr/include \
>> +                     --with-build-sysroot=$(STAGING_DIR) \
>> +                     --enable-newlib-io-long-long \
>> +                     --enable-newlib-register-fini \
>> +                     --disable-newlib-supplied-syscalls \
>> +                     --disable-nls)
>
> Why don't you use the autotools-package infrastructure? newlib is using
> autoconf, so I believe it does make sense to use the autotools-package
> infrastructure.
>
>> +define NEWLIB_APPLY_PATCHES
>> +     $(APPLY_PATCHES) $(@D) package/newlib \*.patch
>> +endef
>
> This does not have any effect, and is not necessary: patches in
> package/<pkg>/ are automatically applied.
>
>> +define NEWLIB_BUILD_CMDS
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
>
> Not needed if you use the autotools-package infrastructure.
>
>> +define NEWLIB_INSTALL_STAGING_CMDS
>> +     mkdir -p $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>
> Except the mkdir, the install command is not needed if you use the
> autotools-package infrastructure.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
