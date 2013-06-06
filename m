From: Markos Chandras <hwoarang@gentoo.org>
Date: Thu, 6 Jun 2013 11:04:02 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: wrap 'ld' so that a ld
 emulation can be specified
In-Reply-To: <CAG2jQ8gkvdedBDen=dUe0a1XwSj0ZHWg9u4995ydCL063F_Uqw@mail.gmail.com>
References: <1370469543-20677-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAG2jQ8jst0KgN9q5mEeGeeucctcr4g+-sCqQxaTguNFa7Mwh1Q@mail.gmail.com>
 <20130606105139.267eb78d@skate>
 <CAG2jQ8j5o6aUHLjjCvV4UxDw4Xa7Z6p+2LDz4xoiwG-Mu00m7A@mail.gmail.com>
 <CAG2jQ8gkvdedBDen=dUe0a1XwSj0ZHWg9u4995ydCL063F_Uqw@mail.gmail.com>
Message-ID: <CAG2jQ8hBCXwSZrVv2vNeMYWVp7JYM3kfdcU2rco5m6W+KiDsgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 June 2013 10:13, Markos Chandras <hwoarang@gentoo.org> wrote:
> On 6 June 2013 09:56, Markos Chandras <hwoarang@gentoo.org> wrote:
>> On 6 June 2013 09:51, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Markos Chandras,
>>>
>>> On Thu, 6 Jun 2013 09:31:25 +0100, Markos Chandras wrote:
>>>
>>>> My understanding is that this is also a problem with buildroot
>>>> toolchains as well. So whilst your patch fixes the problem with
>>>> external
>>>> toolchains, MIPS64/n64 buildroot toolchains will still have the same
>>>> problem.
>>>
>>> Yes, I do remember your patch
>>> http://patchwork.ozlabs.org/patch/244694/. Normally, for internal
>>> toolchains, the idea is that the tools (gcc, ld) are configured, at
>>> build time, to produce the 'right' code by default, without requiring
>>> any tuning. The man page of 'ld' says:
>>>
>>>        -m emulation
>>>            Emulate the emulation linker.  You can list the available
>>>            emulations with the --verbose or -V options.
>>>
>>>            If the -m option is not used, the emulation is taken from the
>>>            "LDEMULATION" environment variable, if that is defined.
>>>
>>>            Otherwise, the default emulation depends upon how the linker
>>>            was configured.
>>>
>>> The last paragraph being the important one here. See what OpenEmbedded
>>> is doing:
>>> https://github.com/openembedded/oe-core/blob/master/meta/recipes-devtools/binutils/binutils-2.23.2/mips64-default-ld-emulation.patch.
>>>
>>> The problem here is that the MIPS tuples do not contain the ABI, so the
>>> ld/configure.tgt and bfd/config.bfd scripts of binutils have no way of
>>> knowing which emulation you would like to have by default. Maybe we
>>> need to improve binutils to make this configurable?
>>>
>>> Thomas
>>> --
>>> Thomas Petazzoni, Free Electrons
>>> Kernel, drivers, real-time and embedded Linux
>>> development, consulting, training and support.
>>> http://free-electrons.com
>>>
>>
>> Hi Thomas,
>>
>> Yes I've seen this patch before but given this is not in the upstream
>> binutils code I had to "workaround" it by using the exported
>> LDEMULATION variable. It might worth taking this to the binutils
>> mailing list.
>>
>> --
>> Regards,
>> Markos Chandras - Gentoo Linux Developer
>> http://dev.gentoo.org/~hwoarang
>
> Hi Thomas,
>
> Just tested this patch. Looks good to me.
>
> Tested-by: Markos Chandras <markos.chandras@imgtec.com>
>
> --
> Regards,
> Markos Chandras - Gentoo Linux Developer
> http://dev.gentoo.org/~hwoarang

Hi Thomas,

I am also taking a look at the log you provided. It seems even though
libtool uses gcc to do the linking it actually invokes the linker
without the proper options. A mips64/n64 gcc will pass the correct -m
option to the linker but here it seems to ignore that. I could be a
problem with libtool itself.

I am inclined to say that binutils do not need to be changed, because
you should never call the linker directly to do the linking (I recall
directfb does that and fails with the same problem). You should be
using gcc instead and it will pass all the appropriate linker flags to
the linker. Such build systems need fixing instead of trying to
workaround the problem in the toolchain.

Having said that, the entire patchset could be seen as a temporary
workaround for this problem. In the libiscsi case, I need to
understand why libtool invokes the linker without the correct flags.
If you try to compile a simple test program using the buildroot
mip64-linux-gcc toolchain (pass -v as well) you will notice that gcc
passes -melf64btsmip correctly.

--
Regards,
Markos Chandras - Gentoo Linux Developer
http://dev.gentoo.org/~hwoarang
