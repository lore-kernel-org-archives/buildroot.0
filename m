From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2020 17:09:59 +0100
Subject: [Buildroot] [PATCHv3] toolchain/external: allow custom
 toolchains to use newer headers
In-Reply-To: <20200107205429.11726-1-yann.morin.1998@free.fr>
References: <20200107205429.11726-1-yann.morin.1998@free.fr>
Message-ID: <20200113170959.1c7a901a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch. I just needed it for an internal toolchain that
I'm building with Buildroot 2019.02 (which supported headers 5.0
maximum), but using Linux 5.4. So, the commit title that starts with
"toolchain/external" is a bit incorrect as your implementation, as the
commit log states, also addresses the case of internal toolchain.

Some more comments below.

On Tue,  7 Jan 2020 21:54:29 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> +	  If your kernel headers are more recent than the latest version
> +	  in the choice, then select the latest version.
> +
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
>  	bool "5.4.x"

We should probably change the prompt here to:

	bool "5.4.x or later"

and make it an habit of moving this "or later" statement to the most
recent kernel headers option. This is IMO clearer than just the
additional statement in the help text.


>  BUILDDIR="${1}"
>  SYSROOT="${2}"
>  # Make sure we have enough version components
>  HDR_VER="${3}.0.0"
> +CHECK="${4}"  # 'strict' or 'loose'
>  
>  HDR_M="${HDR_VER%%.*}"
>  HDR_V="${HDR_VER#*.}"
> @@ -32,16 +48,19 @@ ${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
>  int main(int argc __attribute__((unused)),
>           char** argv __attribute__((unused)))
>  {
> -    if((LINUX_VERSION_CODE & ~0xFF)
> -        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
> +    int ret = 0;
> +    int l = LINUX_VERSION_CODE & ~0xFF;
> +    int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
> +
> +    if(l != h)
>      {
>          printf("Incorrect selection of kernel headers: ");
>          printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
>                 ((LINUX_VERSION_CODE>>16) & 0xFF),
>                 ((LINUX_VERSION_CODE>>8) & 0xFF));  
> -        return 1;
> +        ret = ((l >= h ) && ("${CHECK}"[0] == 'l')) ? 0 : 1;

No space before the parenthesis after "h". Also, checking just the
first letter of ${CHECK} seems like a hack. Why not:

	ret = ((l >= h) && !strcmp("${CHECK}", "loose")) ? 0 : 1;

> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 665765a104..d7a40e457b 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -109,6 +109,9 @@ choice
>  	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
>  	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
>  
> +	  If your toolchain uses headers newer than the latest version
> +	  in the choice, then select the latest version.
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
>  	bool "5.4.x"

So here as well:

	bool "5.4.x or later"

>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
