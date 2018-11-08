From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 9 Nov 2018 00:49:33 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: Support configure option
 --with-linker-hash-style
In-Reply-To: <05e7f492-8a32-5f93-701d-377442ccd2b9@petroprogram.com>
References: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
 <20171216162337.667a30da@windsurf>
 <05e7f492-8a32-5f93-701d-377442ccd2b9@petroprogram.com>
Message-ID: <25d8acce-eb03-0e2c-8f4d-e854b45a613c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I'm looking at this oldest patch in the patchwork...

So, at the moment we use both hash (sysv and gnu) by default for toolchains with
binutils >= 2.30, except for mips architecure which still use sysv hash.

See [1]:
  # Enable gnu hash only on GNU targets, but not mips
  mips*-*-*) enable_default_hash_style=sysv ;;
  *-*-gnu* | *-*-linux* | *-*-nacl*) enable_default_hash_style=both ;;
  *) enable_default_hash_style=sysv ;;

gnu hash style was introduced by [2] (binutils 2.18)

The gnu hash style is enabled by default since binutils 2.30 [3] along with sysv
hash style.

If --hash-style option is supported by the compiler, glibc use both hash (sysv
and gnu) [4]. But this doesn't mean that all binaries will be build with gnu
style hash if binutils < 2.30.

So, I'm not sure we want to enable only gnu style for all binaries on the target
(especially the libc). Binaries that contains only gnu hash style are
incompatible with binaries that contains only sysv hash style.

The default for the choice should be BR2_GCC_HASH_STYLE_BOTH instead of
BR2_GCC_HASH_STYLE_GNU if we want to make this option configurable.

Best regards,
Romain

[1]
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=ld/configure;h=e46248cd089e71323ed20bc33ab0efdde526a2bc;hb=refs/heads/binutils-2_31-branch#l15884
[2]
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=fdc90cb46b0f96dd4444ec3d126c87de75fb6e6b
[3]
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2760f24c4942853eac7b921e4b8843d57a602654
[4]
https://sourceware.org/git/?p=glibc.git;a=commit;h=871b91589bf4f6dfe19d5987b0a05bd7cf936ecc

Le 17/12/2017 ? 15:30, Stefan Fr?berg a ?crit?:
> Hi Thomas
> 
> Well, I was just worried that if setting the linking hash style to stone
> (aka "gnu") then could
> it maybe break builds in some other archs than x86, x86_64 and ARM ?
> 
> So I played carefull and made it configurable by choice.
> 
> Im not sure but I think that option has been hiding in GCC since 4.x and
> buildroot lowest is 4.9.
> So if it's okay I can cook another patch where it just set's it in stone
> without choice ?
> 
> -S-
> 
> Thomas Petazzoni kirjoitti 16.12.2017 klo 17:23:
>> Hello,
>>
>> On Sat, 16 Dec 2017 01:25:30 +0200, Stefan Fr?berg wrote:
>>> This will set the default hash style that GCC will 
>>> always use during linking.
>>>
>>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>> Could you explain the motivation for configuring the default hash
>> style? If "gnu" gives the best application startup time, why would we
>> use a different one?
>>
>> Generally, the commit log lacks a bit of background, i.e the "why" we
>> would want such a change.
>>
>> Thanks!
>>
>> Thomas
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
