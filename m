From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Feb 2015 10:35:16 +0100
Subject: [Buildroot] [PATCH] add basic support for uClibc-ng
In-Reply-To: <20150209205338.604f740e@free-electrons.com>
References: <20150209181636.GA17451@waldemar-brodkorb.de>
 <20150209205338.604f740e@free-electrons.com>
Message-ID: <CAAXf6LUyA+mC0xMdpRv_gu-s-ExF7fq+kBqqVA_A_Z=t097+Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 9, 2015 at 8:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Waldemar Brodkorb,
>
> On Mon, 9 Feb 2015 19:16:37 +0100, Waldemar Brodkorb wrote:
>
>> +config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
>> +     bool "uClibc-ng"
>> +     select BR2_TOOLCHAIN_USES_UCLIBC
>> +     depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
>> +                BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
>> +                BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
>> +                BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
>> +                BR2_x86_64
>> +     help
>> +       This option selects uClibc-ng as the C library for the
>> +       cross-compilation toolchain.
>> +
>> +       http://uclibc-ng.org
>> +
>
> I don't think introducing this symbol is needed. Instead, we can just
> make uClibc-ng another version of uClibc. Like the following (untested) :
>
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 020c47c..6f96c15 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -21,6 +21,10 @@ choice
>                 bool "uClibc 0.9.33.x"
>                 depends on !(BR2_arc || BR2_avr32 || BR2_xtensa)
>
> +       config BR2_UCLIBC_NG_VERSION_1_0_0
> +               bool "uClibc-ng 1.0.0"
> +               depends on !(BR2_arc || BR2_avr32 || BR2_xtensa)
> +
>         config BR2_UCLIBC_VERSION_XTENSA_GIT
>                 bool "uClibc Git Xtensa"
>                 depends on BR2_xtensa
> @@ -42,6 +46,7 @@ config BR2_UCLIBC_VERSION_STRING
>         string
>         default 0.9.31.1        if BR2_UCLIBC_VERSION_0_9_31
>         default 0.9.33.2        if BR2_UCLIBC_VERSION_0_9_33
> +       default 1.0.0           if BR2_UCLIBC_NG_VERSION_1_0_0

This creates a conflict when the uClibc project decides that they too
should release a 1.0.0.
It could be avoided by appending/prepending an 'ng' suffix/prefix, but
it would need to be stripped out in uclibc.mk.

>         default "arc-2014.12" if BR2_arc
>         default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
>         default BR2_USE_UCLIBC_SNAPSHOT if BR2_UCLIBC_VERSION_SNAPSHOT
> @@ -50,6 +55,7 @@ config BR2_UCLIBC_CONFIG
>         string "uClibc configuration file to use?"
>         default "package/uclibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
>         default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
> +       default "package/uclibc/uClibc-ng-1.0.0.config" if BR2_UCLIBC_NG_VERSION_1_0_0
>         default "package/uclibc/uClibc-snapshot.config" if BR2_arc
>         default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
>         default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_XTENSA_GIT
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 8654926..aeffa18 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -17,6 +17,9 @@ UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
>  else ifeq ($(BR2_UCLIBC_VERSION_XTENSA_GIT),y)
>  UCLIBC_SITE = git://git.busybox.net/uClibc
>  UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
> +else ifeq ($(BR2_UCLIBC_NG_VERSION_1_0_0),y)
> +UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/1.0.0/
> +UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz

Also this is not very future-proof I think, suppose Waldemar releases
1.0.1, 1.0.2 and 1.1.0 shortly, then we would have three extra ifeq
blocks here?

It could be nicer to introduce a 'uclibc variant' option, which is a
middle-ground between Waldemar's original patching creating a separate
c library, and your proposal of treating just the version different.
A separate UCLIBC_VERSION would be created without separate
prefix/postfix. So a uclibc version of 1.0.0 would not clash with
uclibc-ng version 1.0.0. In uclibc.mk the SITE/SOURCE would be filled
based on the variant, and the version can then be used without
transformation.

What do you think of that?

Best regards,
Thomas
