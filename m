From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 22:18:50 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: -fstack-protector-all needs
 PIE
In-Reply-To: <20191029095736.16586-1-fontaine.fabrice@gmail.com>
References: <20191029095736.16586-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905201850.GY14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

Sorry for coming back so late on that patch...

It is true that the patch was tested-by Matt, but I was not entirely
convinced (call it gut-feeling or whatever), and was always a bit uneasy
with this patch, because there are so many other packages thanjpeg-turbo
that build correctly with SSP-all and without PIC/PIE. SO I always
skipped it when looking at the patch backlog...

Recent events made me look more in details.

On 2019-10-29 10:57 +0100, Fabrice Fontaine spake thusly:
> jpeg-turbo fails to build with BR2_SSP_ALL on:
> 
> /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld: ../CMakeFiles/simd.dir/jsimd_none.c.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against external symbol `__stack_chk_guard@@GLIBC_2.17' can not be used when making a shared object; recompile with -fPIC
> 
> Fix this issue by selecting BR2_PIC_PIE (if possible) with BR2_SSP_ALL

So, since commit 37f3d09d46a7 (package/jpeg-turbo: force PIC for shared
libraries), the issue no longer happens...

Indeed, jpeg-turbo is slightly broken in this respect: it has some code
to deal with CMAKE_POSITION_INDEPENDENT_CODE, but only if it is already
set; it never tries to set it when building shared libs, whether SSP is
enabled or not.

So it's jpeg-turbo's build system that is at fault here, SSP-all does
not require that *everything* be build with PIC/PIE.

Indeed, BR2_PIC_PIE is the option that decides whether *everything* is
build with PIC/PIE, and most notably that executables be build with PIE.
This is orthogonal to whether SSP is enabled or not (although they both
are security features, and are often enabler together).

Of course, I'm no expert in the field, so anyone is welcome to correct
me if the above is wrong.

So now I've marked that patch as rejected.

Sorry it took so long, I should realy have overcome my angst with that
patch way earlier, and spend those two-hours-or-so doing the diging of
that information, and doing various tests...

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.net/results/51459f3f26aa2e2a038ee717548266aaec05bafc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 010b0774e3..3efa171405 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -751,11 +751,18 @@ config BR2_SSP_STRONG
>  
>  config BR2_SSP_ALL
>  	bool "-fstack-protector-all"
> +	depends on BR2_SHARED_LIBS
> +	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
> +	select BR2_PIC_PIE
>  	help
>  	  Like -fstack-protector except that all functions are
>  	  protected. This option might have a significant performance
>  	  impact on the compiled binaries.
>  
> +comment "-fstack-protector-all needs a toolchain w/ PIE"
> +	depends on BR2_SHARED_LIBS
> +	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
> +
>  endchoice
>  
>  config BR2_SSP_OPTION
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
