From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 09:32:18 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: Tweak TARGET_ABI for
 MPC8548
In-Reply-To: <20170712024737.21578-1-andrew.smirnov@gmail.com>
References: <20170712024737.21578-1-andrew.smirnov@gmail.com>
Message-ID: <20170712093218.5a6a20ff@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 19:47:37 -0700, Andrey Smirnov wrote:
> From: Mark Hinds <mhinds@spaceflightindustries.com>
> 
> Add -mcpu=8548 -mhard-float to TARGET_ABI so that hardware FP is used
> to build all of the package in the system.
> 
> Signed-off-by: Mark Hinds <zoronic@gmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index b95e5e3..958d72c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -78,7 +78,7 @@ ifeq ($(BR2_powerpc_8540),y)
>  TARGET_ABI += -mabi=spe -mfloat-gprs=single -Wa,-me500
>  endif
>  ifeq ($(BR2_powerpc_8548),y)
> -TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2
> +TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -mcpu=8548 -mhard-float

Adding the -mcpu is useless, because it's already passed thanks to
BR2_GCC_TARGET_CPU, defined to 8548 when BR2_powerpc_8548=y in
arch/Config.in.powerpc.

Unconditionally passing -mhard-float here is wrong, because people may
want to use soft-float, which can be selected using the
BR2_POWERPC_SOFT_FLOAT option.

When BR2_SOFT_FLOAT=y (which is selected by BR2_POWERPC_SOFT_FLOAT), we:

 * Pass --with-float=soft when building gcc (see package/gcc/gcc.mk).
   This solves the case of internal toolchain being used.

 * Add -msoft-float in the toolchain wrapper when an external toolchain
   is used (toolchain/toolchain-external/pkg-toolchain-external.mk).

However, we indeed never explicitly pass --with-float=hard (when
building gcc) or -mhard-float (for external toolchains).

Could you describe more precisely the problem you're seeing? Are you
using the internal toolchain backend, or an external toolchain? In the
latter case, which external toolchain are you using?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
