From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 16 Feb 2018 15:00:31 -0800
Subject: [Buildroot] [RFC 0/6] Support 32-bit binaries on a 64-bit
 architecture
In-Reply-To: <20180216215928.4ada222c@windsurf.lan>
References: <20180216005612.69593-1-mmayer@broadcom.com>
 <20180216064557.d6zfemlr7c2zj4x3@tarshish>
 <20180216215928.4ada222c@windsurf.lan>
Message-ID: <71d93c8c-3a75-aa9b-2dd9-283ab9c6178a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/16/2018 12:59 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 16 Feb 2018 08:45:57 +0200, Baruch Siach wrote:
> 
>> On Thu, Feb 15, 2018 at 04:56:06PM -0800, Markus Mayer wrote:
>>> This series contains a proposal for supporting 32-bit libraries and
>>> binaries on a 64-bit platform.
>>>
>>> There are some limitations and prerequisites as to the scope this has
>>> been tested.
>>>
>>> - It has only been tested on ARM/ARM64.
>>> - It has only been tested with an external toolchain
>>>   (https://github.com/Broadcom/stbgcc-6.3/releases).
>>> - It requires that the Aarch64 compiler be compiled with "multi-lib"
>>>   enabled. This ensures that the sysroot doesn't contain a lib64 ->
>>>   lib symlink. Instead, lib and lib64 are separate directories.
>>> - It has only been tested with a fairly limited number of packages.
>>>   There might be other packages that don't correctly pass --libdir,
>>>   similar to bzip2 as mentioned below.  
>>
>> There is one thing I am missing here. AFAICS, this series does not add support 
>> for building 32-bit libraries in addition to their 64-bit versions. So the 
>> 32-bit binaries that are to run on target must have their dependencies 
>> satisfied from the toolchain provided libraries. Is that correct?
> 
> Yes, indeed, I'm interested in understanding that part as well. It
> seems like the assumption is that the external toolchain has a 32-bit
> sysroot, and only the libraries from this sysroot are necessary.

Correct, that is what the stbgcc-6.3 toolchain contains.

> 
> This feels very limited/restricted to very specific use cases and
> therefore not very usable in a broader context.

I suppose it could be reasonably easy to extend on that and either
require a second toolchain to be built or just point to a different
location?

> 
> And extending that to building packages is really difficult with
> Buildroot:
> 
>  (1) Kconfig has no way to easily allow to select for each and every
>      package whether it should be built 32-bit, 64-bit or both.
> 
>  (2) Our package infrastructure is entirely based on the fact that a
>      given package is built only once. So if you assume that you
>      solved problem (1) by adding gazillions of Config.in options to
>      each and every package, there is still no way the zlib package
>      will be built two times, once 32-bit and 64-bit. No without major
>      changes to the package infrastructure.
> 
> So supporting multilib has already been discussed several times, but
> nobody ever came up with a proposal that could reasonably solve
> problems (1) and (2). Unfortunately, unless there are some proposals to
> solve those problems, I don't think we want to have some very limited
> and highly specific multilib support, that only works with external
> toolchains and that only works for 32-bit libraries provided by the
> external toolchain.

Would you recommend that this logic be sort of done using a two pass
build, by that I mean something like an external top-level Makefile
would be controlling the buildroot build process and do something like:

- build all relevant packages for the 32-bit architecture (that could
include the toolchain as well)

- build all relevant packages for the 64-bit architecture, and copy the
32-bit binaries and libraries of interest from the previously build
32-bit environment?

I suppose such a thing could be done, it has the advantage of not
tweaking buildroot too much, although we still need to teach the 64-bit
variant to accept seeing "foreign" binaries.
-- 
Florian
