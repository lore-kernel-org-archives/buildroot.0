From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2020 10:54:39 +0100
Subject: [Buildroot] [PATCH] package/uhd: fix build with ARM
In-Reply-To: <20201030142945.1190031-1-gwenj@trabucayre.com>
References: <20201030142945.1190031-1-gwenj@trabucayre.com>
Message-ID: <20201101095439.GB2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-10-30 15:29 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> UHD has two issues with ARM:
> 1/ NEON_SIMD_ENABLE is always enabled when architecture is ARM. But NEON isn't
>    necessarily support in the CPU
> 2/ when NEON is supported -mfpu=neon must be passed to the compiler (not
>    automatically done by UHD)
> 
> Fixes:
> - http://autobuild.buildroot.net/results/2519bd075b8c021b440677297b32f16b1c3cc3dd/
> - http://autobuild.buildroot.net/results/99d9979be4f37c42390c87b1afd4cd33bac07f5e/
> - http://autobuild.buildroot.net/results/cabc7a87ee869d6bac7d092c1a4fcfcdac22a96e/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks (I just slightly reworded the comment).

Regards,
Yann E. MORIN.

> ---
>  package/uhd/uhd.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
> index ec0ec03e9f..17d0dd569b 100644
> --- a/package/uhd/uhd.mk
> +++ b/package/uhd/uhd.mk
> @@ -38,6 +38,18 @@ UHD_CONF_OPTS = \
>  	-DENABLE_UTILS=OFF \
>  	-DENABLE_X300=OFF
>  
> +# As soon as architecture is ARM, uhd will try
> +# to use it. But this doesn't necessarily
> +# mean we have NEON support in our CPU.
> +# When CPU support NEON -mfpu=neon must be added to CXX_FLAGS
> +ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> +UHD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -mfpu=neon"
> +UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=ON
> +else
> +UHD_CONF_OPTS += -Dhave_mfpu_neon=0
> +UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ORC),y)
>  UHD_DEPENDENCIES += orc
>  endif
> -- 
> 2.20.1
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
