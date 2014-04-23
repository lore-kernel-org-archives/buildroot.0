From: Will Newton <will.newton@gmail.com>
Date: Wed, 23 Apr 2014 12:27:54 +0100
Subject: [Buildroot] ld-linux.so.3 problem with external EABIhf toolchain
In-Reply-To: <53579EAF.3020701@lucaceresoli.net>
References: <53579EAF.3020701@lucaceresoli.net>
Message-ID: <CAFbHwiQFveiQfjbGDW0+78akYmid7+PpNr3sJGe68PF0-7ASXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 23, 2014 at 12:06 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi all, Thomas,
>
> I'm in the middle of updating a project from Buildroot 2013.08 to
> 2013.11, but I hit a problem with the external toolchain installation.
>
> The project uses an external ARMv7 EABIhf toolchain (no multilib)
> previously built with crosstool-NG, installed on the build host.
>
> Between 2013.08 and 2013.11 lies (*) this commit:
>
>>  commit 11ec38b6950cf3337b52fb97f27c2fd7c776c5c2
>>  Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>  Date:   Tue Oct 8 20:17:15 2013 +0200
>>
>>      toolchain-external: fix Linaro ARM toolchain support
>>
> ...
>>
>>  -LIB_EXTERNAL_LIBS+=ld*.so.* libc.so.* libcrypt.so.* libdl.so.*
>> libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
>>  +LIB_EXTERNAL_LIBS+=libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.*
>> libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
>>  +ifeq ($(BR2_ARM_EABIHF),y)
>>  +LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.*
>>  +else
>>  +LIB_EXTERNAL_LIBS+=ld*.so.*
>>  +endif
>
> Here when an EABIhf toolchain is used, ld-2.13.so and ld-linux.so.3 are
> not installed on the target. This is for Linaro toolchains.
>
> My toolchain is EABIhf, but ships ld-2.13.so and ld-linux.so.3.
>
> So the commit above breaks runtime execution of nearly every executable
> (including busybox init), since no ld-linux is installed on the target.
>
> The following dirty hack solves my own use case:
>
>  ifeq ($(BR2_ARM_EABIHF),y)
> -LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.*
> +LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.* ld*.so.*
>  else
>  LIB_EXTERNAL_LIBS+=ld*.so.*
>  endif
>
> I wonder which may be the best way to fix it properly without breaking
> other toolchains.
>
> Is there a specific reason for having a different dynamic loader naming
> in ARM EABIhf toolchains? Or is it just that, by coincidence, all
> EABIhf toolchains supported by Buildroot (=Linaro) happen to do so?

Linaro toochains do this renaming of ld.so to support multilibs (in
other words supporting both hard and soft float on the same system).
It seems like it should be safe to install all ld*.so.* in either case
but I am sure Thomas has thought about this a lot harder than I have!
