From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 23:36:10 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external wrapper: don't pass
 march/mcpu if mtune is on cmdline
In-Reply-To: <1437747278-6331-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437747278-6331-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150725213610.GE1847@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-24 16:14 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Before commit 5715d2dcf48a39c16a3f3e41c97109613fed121d, the external
> toolchain wrapper would not pass its own march/mcpu/mtune flags to the real
> compiler if at least one of them was passed on the wrapper command-line.
> 
> The mentioned commit intended to remove the passing of an mtune parameter
> coming from Buildroot, which was always empty after some other refactoring,
> but the changes have the side-effect that march/mcpu is now also passed when
> mtune is already given on the command-line. In that case, only mtune should
> be passed to the real compiler.
> 
> Restore part of the original toolchain wrapper code to check the presence of
> mtune on the command-line.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I do agree on principle, yet...

> ---
>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index e2d01dc..f84b840 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -35,9 +35,10 @@ static char sysroot[PATH_MAX];
>   * Currently, we have:
>   * 	-mfloat-abi=
>   * 	-march=
> + * 	-mtune=
>   * 	-mcpu=
>   */
> -#define EXCLUSIVE_ARGS	3
> +#define EXCLUSIVE_ARGS	4

We're never passing -mtune anymore, so why do you want to reserver space
for it?

As far as I understand, the code you resotred is only checking for an
already-present -mtune, and if so, does not append -march/-mcpu. So we
do not need to reseerve more space than for the three args we may
append. Unless I mised something?

Regards,
Yann E. MORIN.

>  static char *predef_args[] = {
>  	path,
> @@ -177,11 +178,12 @@ int main(int argc, char **argv)
>  
>  #if defined(BR_ARCH) || \
>      defined(BR_CPU)
> -	/* Add our -march/cpu/abi flags, but only if none are
> -	 * already specified on the commandline
> +	/* Add our -march/cpu flags, but only if none of
> +	 * -march/mtune/mcpu are already specified on the commandline
>  	 */
>  	for (i = 1; i < argc; i++) {
>  		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
> +		    !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
>  		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
>  			break;
>  	}
> -- 
> 1.8.5.1
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
