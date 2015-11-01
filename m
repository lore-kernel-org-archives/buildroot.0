From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2015 19:55:36 +0100
Subject: [Buildroot] [PATCH v2] package/swupdate: fix build issue with
	some toolchains
In-Reply-To: <1446403650-21177-1-git-send-email-joerg.krause@embedded.rocks>
References: <1446403650-21177-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151101185536.GC3535@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2015-11-01 19:47 +0100, J?rg Krause spake thusly:
> Add patch from upstream to fix build issue with some toolchains.
> 
> For some toolchains used in Buildroot (x86_64 and mips64) partial linking using
> 'ld' directly doesn't work well, as the 'ld' default emulation may not
> necessarily be the correct one. Note, that the default emulation depends upon
> how the linker was configured at build time. The leads to different kind of
> build errors, like:
> 
>   * /usr/bin/i686-pc-linux-gnu-ld: Relocatable linking with relocations from
>     format elf64-x86-64 (core/swupdate.o) to format elf32-i386 (core/built-in.o)
>     is not supported.
> 
>   * /usr/bin/mips-linux-gnu-ld: handlers/raw_handler.o: endianness incompatible
>     with that of the selected emulation
> 
>   * /usr/bin/mips64el-linux-ld: core/swupdate.o: ABI is incompatible with that
>     of the selected
> 
> Linking with gcc will pass all the appropriate linker flags to the linker.
> '-nostdlib' has to be added to ldflags-y to link properly without pulling in GCC
> libs during partial linking. Note, for Kbuild ldflags-y is prefered over the
> deprecated EXTRA_LDFLAGS.
> 
> Build config for x86_64:
>   BR2_x86_64=y
>   BR2_x86_corei7=y
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209=y
> 
> Runtime test:
>   $ output/build/swupdate-2015.07/swupdate -v
>   Swupdate v2015.07.0
> 
>   Licensed under GPLv2. See source distribution for detailed copyright notices.
> 
>   Registered handlers:
>   	rawfile
> 	raw
> 
> Note, that a previous patch [1] had to be reverted [2] because ld does not take
> gcc's constructor functions into account and so none of the handlers have been
> registered at runtime.
> 
> Fixes:
> http://autobuild.buildroot.net/results/de9/de920298075d32f3de83a0cfb7417846eb833425/
> http://autobuild.buildroot.net/results/975/975915aa33005806e78260bae385cd4b3e359ca8/
> http://autobuild.buildroot.net/results/c54/c54e7a2ea353d95d41a1e966de0dffa7b6ac432e/
> http://autobuild.buildroot.net/results/019/0198596ebfed05ab86552b628da2274d55bf42ae/
> 
> and many more.
> 
> [1] https://patchwork.ozlabs.org/patch/532542/
> [2] https://patchwork.ozlabs.org/patch/535408/
> 
> Cc: Bj?rn Forsman <bjorn.forsman@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Note: my review is only to check that the patch is indeed the one that
was applied upstream, that it *looks* sane, and that the hash matches.

Regards,
Yann E. MORIN.

> ---
> Changes v2:
>  - convince upstream to accept patch (Thomas Petazzoni)
>  - adapt commit message
> ---
>  package/swupdate/swupdate.hash | 1 +
>  package/swupdate/swupdate.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index eb7722c..c57ab89 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
>  sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
> +sha256	b97a107a0e4625337485b9bb118bc9a33fa0f2bfcb80475cff017940b5261238  f26577423eb65728fcd10f78f9978dd07d51dcb9.patch
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index bcdc764..e22bc08 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -9,7 +9,8 @@ SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>  SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
>  SWUPDATE_LICENSE_FILES = COPYING
>  SWUPDATE_PATCH = \
> -	https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
> +	https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch \
> +	https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10f78f9978dd07d51dcb9.patch
>  
>  # swupdate bundles its own version of mongoose (version 3.8) and
>  # lsqlite3 (version 0.8)
> -- 
> 2.6.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
