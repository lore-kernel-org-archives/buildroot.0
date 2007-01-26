From: Ulf Samuelsson <ulfs@dof.se>
Date: Fri, 26 Jan 2007 19:37:57 +0100
Subject: [Buildroot] [PATCH] Set CFLAGS = $(TARGET_CFLAGS) for many
	packages
References: <1169596433.5361.23.camel@elrond.sweden.atmel.com>
	<20070124232349.GF28221@aon.at>
	<02b901c74014$8da2aa80$01c4af0a@atmel.com>
	<20070125091810.GC15747@aon.at>
Message-ID: <02a301c7417c$92826e00$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Jan 25, 2007 at 01:02:49AM +0100, Ulf Samuelsson wrote:
>> Bernhard Fischer wrote:
>>> On Wed, Jan 24, 2007 at 12:53:53AM +0100, Ulf Samuelsson wrote:
>>>> If you make Buildroot from scratch, CFLAGS gets set during the
>>>> build, but if you add packages later, then CFLAGS should be set in
>>>> the makefile fragment of the new package.
>>> 
>>> I don't understand what you mean here. Please elaborate
>>>> 
>> 
>> Some packages require kernel headers.
> 
> The few packages that really need kernel-internal or any other
> non-standard include path have to specify their include manually.
> 
>> If you build from scratch, something sets CFLAGS to a good value.
>> 
>> If you come back the next day, reconfigure your system,
>> to include a new package, and recompile, many packages
>> will bomb out because they do not find the "asm-generic.h"
> 
> I cannot reproduce this. Can you paste an error and describe how i can
> reproduce this, locally?
> 
>> By adding this CFLAGS patch you can compile those packages.
>> 
>> Many packages have this already, many don't.
>> Can you explain when you have it and when you don't?
> 
> See above. If a package needs any headers that do not live in a
> standard 
> place (see e.g. gmp/mpfr.h for gcc or openswan that has a broken
> makefile in this respect) have to specify that explicitely.
> 
>>>> I believe that TARGET_CFLAGS needs to include the Linux Include
>>>> Directory or you will get compolie time errors.
>>> 
>>> I don't have the linux include in my TARGET_CFLAGS AFAIK and do not
>>> get compile errors. What kernel-headers are you using? What errors
>>> are you seeing with what package?
> 


As I mentioned yesterday, I have not been able to reproduce the failure
to build due to lack of Linux/include, 
but the patch I sent does not add anything to TARGET_CFLAGS.

The patch is only making sure that each package listed is compiled
with  CFLAGS=$(TARGET_CFLAGS).

Since the current buildroot does not use $(TARGET_CFLAGS)
when compiling these package the optimization level and debug level
specified in the ".config" file gets ignored.

If this is correct behaviour, then I am confused.
Is there a golden rule, which packages should apply TARGET_CFLAGS 
and which packages should not?

Best Regards,
Ulf Samuelsson
