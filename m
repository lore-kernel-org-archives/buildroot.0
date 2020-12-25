From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 23:38:39 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] toolchain/toolchain-wrapper: fix gcc -v with relro
In-Reply-To: <20201224101840.3428243-1-fontaine.fabrice@gmail.com>
References: <20201224101840.3428243-1-fontaine.fabrice@gmail.com>
Message-ID: <20201225223839.GI1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-12-24 11:18 +0100, Fabrice Fontaine spake thusly:
> rhash in version 1.4.0 with relro fails to build because gcc -v raises
> the following build failure:
> 
> /data/buildroot-test/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/soft-float/el/usr/lib64/Scrt1.o: In function `__start':
> (.text+0x20): undefined reference to `main'
> collect2: error: ld returned 1 exit status
> Run result: 1
> 
> This build failure is raised because the toolchain-wrapper calls gcc with
> -Wl,-z,relro and as a result gcc wrongly assumes that some linking must
> be done.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20

I have applied a tweaked version of your previous rhash fix, now.

I still believe this change in the toolchain wrapper to be missing extra
safeguards, as calling -v to do an actual link step is still valid. With
your patch, the link would thus be done without -z relro, which is not
correct.

But since the rhash build has now been fixed with a patch in rhash, I
don;t think we need to investigate further in our toolchain wrapper for
the time being. If there are more packages impacted, we can revisit
later.

Thanks you! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Fix typos in commit log and update comment in source code
> 
>  toolchain/toolchain-wrapper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 0fb6064b1c..2a7dd61729 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -453,10 +453,11 @@ int main(int argc, char **argv)
>  			*cur++ = "-pie";
>  	}
>  #endif
> -	/* Are we building the Linux Kernel or U-Boot? */
> +	/* Are we building the Linux Kernel or U-Boot or displaying the programs invoked by the compiler? */
>  	for (i = 1; i < argc; i++) {
>  		if (!strcmp(argv[i], "-D__KERNEL__") ||
> -		    !strcmp(argv[i], "-D__UBOOT__"))
> +		    !strcmp(argv[i], "-D__UBOOT__") ||
> +		    !strcmp(argv[i], "-v"))
>  			break;
>  	}
>  	if (i == argc) {
> -- 
> 2.29.2
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
