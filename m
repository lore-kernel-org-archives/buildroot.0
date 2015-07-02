From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jul 2015 22:55:23 +0200
Subject: [Buildroot] [PATCH] Disable gcc-4.8.x + binutils-2.25 + MIPS
 combination
In-Reply-To: <1435850348-19416-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435850348-19416-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150702205523.GF3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-07-02 17:19 +0200, Vicente Olivert Riera spake thusly:
> This combination causes a compilation failure of the host-gcc-final
> recipe like this one:
> 
> /br/output/host/usr/mips-buildroot-linux-gnu/bin/ld:
> .libs/gload.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not
> be used when making a shared object; recompile with -fPIC
> 
> The problem is the file 'libatomic/gload.c' is compiled without -fPIC
> when using binutils-2.25. All gcc (with libatomic) versions below 4.9.3
> are affected by this issue.
> 
> Here is a summary of affected/unaffected versions in Buildroot:
> 
> 4.7.x: unaffected (doesn't have libatomic)
> 4.8.x: affected
> 4.9.x: unaffected (we have 4.9.3 which is fixed)
> 5.1.x: unaffected
> 
> The fix can be found here:
> 
>   https://github.com/gcc-mirror/gcc/commit/57f5c0954f95cb37f995d60167ddde06c7d6e697
> 
> However, given the following reasons...
> 
> - Upstream gcc 4.8 branch is closed.
> - The fix is very hard to backport from 4.9 to 4.8.
> - This stuff is insanely sensitive and not working at all could be
>   better than looking like it works but not quite.
> 
> ...I think the best choice is to disable that combination in Buildroot.

So do I.

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/Config.in.host | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 1fc0b83..4501b32 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -60,6 +60,8 @@ choice
>  		depends on !BR2_cortex_a12
>  		# Broken or unsupported PPC cores
>  		depends on !BR2_powerpc_power8
> +		# gcc-4.8.x + binutils-2.25 is broken for MIPS
> +		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25)
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
>  
> -- 
> 2.3.6
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
