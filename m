From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 22:35:04 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: Support configure option
 --with-linker-hash-style
In-Reply-To: <25d8acce-eb03-0e2c-8f4d-e854b45a613c@gmail.com>
References: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
 <20171216162337.667a30da@windsurf>
 <05e7f492-8a32-5f93-701d-377442ccd2b9@petroprogram.com>
 <25d8acce-eb03-0e2c-8f4d-e854b45a613c@gmail.com>
Message-ID: <7ab6713b-7f14-31dc-672b-dbbcaa2f42f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/11/2018 00:49, Romain Naour wrote:
> Hi Thomas,
> 
> I'm looking at this oldest patch in the patchwork...

 Great!

> 
> So, at the moment we use both hash (sysv and gnu) by default for toolchains with
> binutils >= 2.30, except for mips architecure which still use sysv hash.
> 
> See [1]:
>   # Enable gnu hash only on GNU targets, but not mips
>   mips*-*-*) enable_default_hash_style=sysv ;;
>   *-*-gnu* | *-*-linux* | *-*-nacl*) enable_default_hash_style=both ;;
>   *) enable_default_hash_style=sysv ;;
> 
> gnu hash style was introduced by [2] (binutils 2.18)
> 
> The gnu hash style is enabled by default since binutils 2.30 [3] along with sysv
> hash style.

 To be exact: since 2.30, binutils has an option for the default hash style, and
that default is "both" (except for mips), while before the default was "sysv".


> If --hash-style option is supported by the compiler, 

 ... which it is for all gcc versions we support...

> glibc use both hash (sysv
> and gnu) [4]. But this doesn't mean that all binaries will be build with gnu
> style hash if binutils < 2.30.

 ... or if it is mips.

 However, if GCC is configured with --with-linker-hash-style=foo, then all
binaries *will* actually be built with that hash style, no?


> So, I'm not sure we want to enable only gnu style for all binaries on the target
> (especially the libc). 

 But if I understand correctly, glibc overrides it anyway and always sets
"both"? So for glibc, at least, there shouldn't be a problem?


 As far as I understand, there shouldn't be a problem because all libraries and
executables *will* be built with the same hash style. There may be three
problems though:

1. If binutils defaults to "sysv" for mips, perhaps the GNU hash style is broken
there? So perhaps we should disable the option for mips?

2. Some packages may (actually do) override the default hash style. So if you
select hash style sysv in gcc, and use a libc which doesn't override it, and
then try to link a program that itself overrides to hash style gnu, it will fail.

3. Similar for binary packages: we don't build them, so we don't control the
hash style. Probably, though, binary packages will use hash style both.


> Binaries that contains only gnu hash style are
> incompatible with binaries that contains only sysv hash style.
> 
> The default for the choice should be BR2_GCC_HASH_STYLE_BOTH instead of
> BR2_GCC_HASH_STYLE_GNU if we want to make this option configurable.

 Or we could just bite the bullet and see how it goes wrong :-)

 It makes some kind of sense to make it configurable for now, so that there is a
way out if there are a few packages that fail with the wrong hash style. But
then at least we should randomize the options in the autobuilders. The good
thing is that any problems will be immediately visible at link time (I think at
least that that's the case; I hope it's not at dynamic load time that the
problem occurs... And of course, dlopen()'ed libraries will only have runtime
problems.)


 Regards,
 Arnout


> 
> Best regards,
> Romain
> 
> [1]
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=ld/configure;h=e46248cd089e71323ed20bc33ab0efdde526a2bc;hb=refs/heads/binutils-2_31-branch#l15884
> [2]
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=fdc90cb46b0f96dd4444ec3d126c87de75fb6e6b
> [3]
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2760f24c4942853eac7b921e4b8843d57a602654
> [4]
> https://sourceware.org/git/?p=glibc.git;a=commit;h=871b91589bf4f6dfe19d5987b0a05bd7cf936ecc
> 
> Le 17/12/2017 ? 15:30, Stefan Fr?berg a ?crit?:
>> Hi Thomas
>>
>> Well, I was just worried that if setting the linking hash style to stone
>> (aka "gnu") then could
>> it maybe break builds in some other archs than x86, x86_64 and ARM ?
>>
>> So I played carefull and made it configurable by choice.
>>
>> Im not sure but I think that option has been hiding in GCC since 4.x and
>> buildroot lowest is 4.9.
>> So if it's okay I can cook another patch where it just set's it in stone
>> without choice ?
>>
>> -S-
>>
>> Thomas Petazzoni kirjoitti 16.12.2017 klo 17:23:
>>> Hello,
>>>
>>> On Sat, 16 Dec 2017 01:25:30 +0200, Stefan Fr?berg wrote:
>>>> This will set the default hash style that GCC will 
>>>> always use during linking.
>>>>
>>>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>>> Could you explain the motivation for configuring the default hash
>>> style? If "gnu" gives the best application startup time, why would we
>>> use a different one?
>>>
>>> Generally, the commit log lacks a bit of background, i.e the "why" we
>>> would want such a change.
>>>
>>> Thanks!
>>>
>>> Thomas
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
