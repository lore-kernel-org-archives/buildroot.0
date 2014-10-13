From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Oct 2014 21:42:14 +0200
Subject: [Buildroot] using BR2 variables to find a specific header file
In-Reply-To: <543C0775.3090701@green-communications.fr>
References: <543C0775.3090701@green-communications.fr>
Message-ID: <CAHXCMMJ-Ke78qFEHjddfUtbinML-pwHWX58DfPU7+L3VZdF=1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sylvain,

On Mon, Oct 13, 2014 at 7:10 PM, Sylvain Raybaud
<sylvain.raybaud@green-communications.fr> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Dear all
>
> I'm trying to integrate a cmake based package wich is not very
> cross-compiling friendly (MariaDB galera cluster). During normal
> compile this package runs some tests in order to determine if stacks
> grows downward or upward.

Common mistake done by project not having cross-compilation in mind! :-/

> During cross-compile these tests cannot be
> run therefore the package expects -DSTACK_DIRECTION=+/-1 to be passed
> to cmake. Of course you cannot do it in buildroot.

Why do you say that?
Of course, Buildroot does support adding cmake configure options [1].
You can also check some cmake-based packages already integrated (e.g.:
[2]).

If you know beforehand how grow the stack, I would suggest to set it
in the *_CONF_OPTS variables.
This may depends on the target architecture.

>
> It seems to be possible to access this information in another way
> since STACK_GROWS_DOWNWARD is defined in some headers. In my case they
> are:
>
> output/build/host-gcc-final-4.8.3/gcc/config/arm/arm.h
> (option a)
>
> or
>
> output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/plugin/include/config/arm/arm.h
> (option b)
>
> or
>
> output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/plugin/include/tm.h
> which in turns includes config/arm/arm.h  but seems more generic
> (option c)
>
> using these files I could automatically determine the correct value
> for STACK_DIRECTION (either searching them for STACK_GROWS_DOWNWARD or
> calling C preprocessor on an ad-hoc source file that would include them).
>
> The question is: how to determine inside buildroot which file to use?

This does not look right :-/ because:
- it search in something not in the sysroot;
- it is only valid when using the buildroot-toolchain backend.

Indeed, it seems the STACK_GROWS_DOWNWARD definition is only available
in the compiler sources, not in the preprocessor output for the target
:-/

>
> I was thinking of using a combination of the following variables to
> determine the position of these headers. I'll list them with the value
> they have in my case. Do you think it's a good idea? Do you think it's
> portable?
>
> BR2_ARCH="arm"
> BR2_GCC_VERSION=4.8.3
> BR2_GCC_TARGET_MODE=arm
> BR2_TOOLCHAIN=y
> BR2_TOOLCHAIN_BUILDROOT=y
> BR2_TOOLCHAIN_BUILDROOT_VENDOR=buildroot
> BR_TOOLCHAIN_USES_UCLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_ARM_EABI=y
>
> Using these variables it seems I can find the correct file but I'm not
> sure it's the correct way to do things. What do you think? Do you have
> suggestions?

Instead of checking the compiler sources, I prefer you set the stack
growing direction through the CMake args.

Regards,


[1] http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
[2] http://git.buildroot.net/buildroot/tree/package/libwebsockets/libwebsockets.mk


-- 
Samuel
