From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Apr 2017 12:41:24 +0200
Subject: [Buildroot] [PATCH] package/expedite: fix build issue with C89
In-Reply-To: <20170422144236.49b73b04@free-electrons.com>
References: <20170421213104.1477-1-romain.naour@gmail.com>
 <20170422144236.49b73b04@free-electrons.com>
Message-ID: <5b4e38bc-bbac-8699-9c1f-4bb8eb32ae88@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/04/2017 ? 14:42, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Fri, 21 Apr 2017 23:31:04 +0200, Romain Naour wrote:
> 
>> +# The code use for loop initial declarations which are only allowed in
>> +# C99 mode. Use the default compiler version (gnu99) used by gcc 5+ to
>> +# workaround some build issues with C99.
>> +EXPEDITE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> 
> What is the full command line used by expedite to build its C files?
> Gcc 5.x uses -std=c11 by default, and C11 apparently accepts definition
> of variables inside the initialization part of for() loops. So it seems
> like expedite is overriding the default -std= GCC option with its
> own...
> 
> Or maybe it's the configure.ac AC_PROG_CC that does this by default?
> Anyway, it's worth checking and doing something upstreamable rather
> than working around in the .mk file.

The build system doesn't override the default C language version, it just use
the one used by default by the compiler.
The definition of variables inside the initialization part of for() loops was
added by the latest commit without adding c99 or gnu99 in the cflags.

I used a gcc5 based toolchain while I tested this version of expedite, that's
why I didn't had any issue.

Another easy solution is to not use definition of variables inside the
initialization part of for() loops.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
