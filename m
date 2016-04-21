From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 20 Apr 2016 21:31:54 -0300
Subject: [Buildroot] [PATCH 1/2] efivar: new package
In-Reply-To: <20160330180659.6d57ea5e@free-electrons.com>
References: <1459016732-27843-1-git-send-email-nunes.erico@gmail.com>
 <20160330180659.6d57ea5e@free-electrons.com>
Message-ID: <CAK4VdL2Hwgtfif09mmWQ5LXmDBhSYrM1KByc1YMTAi-WOzmfrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the review.

On Wed, Mar 30, 2016 at 1:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 26 Mar 2016 15:25:31 -0300, Erico Nunes wrote:
>> efivar contains tools and libraries to manipulate EFI variables.
>>
>> This package has some restrictions to build. First, it needs uchar.h
>> which apparently does not come in uclibc, so it has been disabled for
>> uclibc.
>> It has also been found that in some systems it failed to build due to
>> not generating the .pc files. This has been tracked to the use of make
>> 3.81, so a patch was prepared for it. I have also sent this patch to the
>> upstream development.
>
> We try to avoid first person sentences in commit log. Can you rephrase
> as: "so a patch was prepared for it, and was submitted upstream".

Sure, will change it.

>> diff --git a/package/efivar/Config.in b/package/efivar/Config.in
>> new file mode 100644
>> index 0000000..baddddd
>> --- /dev/null
>> +++ b/package/efivar/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_EFIVAR
>> +     bool "efivar"
>
> Does it build on all architectures, or is it somehow x86/x86-64
> specific ?

This package can be useful at least on x86, x86-64 and aarch64. There
are no limitations to build it in other architectures though, so I
don't think we need to restrict it. I have build tested it on a few
other architectures that have glibc support (mips, MicroBlaze, ppc64,
sparc64 at least).

>> diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
>> new file mode 100644
>> index 0000000..9775777
>> --- /dev/null
>> +++ b/package/efivar/efivar.mk
>> @@ -0,0 +1,43 @@
>> +################################################################################
>> +#
>> +# efivar
>> +#
>> +################################################################################
>> +
>> +EFIVAR_VERSION = 0.23
>> +EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
>> +EFIVAR_LICENSE = GPLv2.1
>
> GPLv2.1 doesn't exist. It's either GPLv2 or LGPLv2.1. Looking at the
> code, it seems to be LGPLv2.1.

It's LGPLv2.1, will fix in v2.

>> +EFIVAR_LICENSE_FILES = COPYING
>> +EFIVAR_DEPENDENCIES = popt
>> +EFIVAR_INSTALL_STAGING = YES
>> +
>> +define EFIVAR_BUILD_CMDS
>> +     # makeguids is an internal host tool and must be built separately with
>> +     # $(HOST_CC), otherwise it gets cross-built.
>> +     $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) CFLAGS+=-std=c99 \
>> +             $(MAKE1) -C $(@D)/src makeguids
>
> Please use CFLAGS="$(HOST_CFLAGS) -std=c99" instead of CFLAGS+=

Will fix it.

>> +
>> +     # skip efivar-static build, otherwise we always require static popt
>> +     $(SED) 's/^BINTARGETS=.*/BINTARGETS=efivar/g' \
>> +             $(@D)/src/Makefile
>
> This should be done in a post-patch hook, or maybe even by a patch
> itself? Or maybe you don't need any patch at all, by just passing
> BINTARGETS=efivar when building/installing ?
>
> Since you also need libdir at each step, shall I suggest that you do
> something like:
>
> EFIVAR_MAKE_OPTS = \
>         BINTARGETS=efivar \
>         libdir=/usr/lib
>
> and then use $(EFIVAR_MAKE_OPTS) at build and install time ?

The EFIVAR_MAKE_OPTS suggestion works and is much better than the
previous approach, will change it.

?rico
