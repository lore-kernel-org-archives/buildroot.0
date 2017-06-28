From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 28 Jun 2017 10:37:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gnuradio: link with
 libatomic when needed
In-Reply-To: <20170625084806.27166-1-bernd.kuhls@t-online.de>
References: <20170625084806.27166-1-bernd.kuhls@t-online.de>
Message-ID: <20170628103731.7da8859a@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Jun 2017 10:48:06 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> http://autobuild.buildroot.net/results/528/52825918bf65b23241cd68d99513350703469294/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Regards,

Gwen

> ---
> v2: fix typo CMAKE_CXX_FLAGS -> CMAKE_C_FLAGS (Thomas)
> 
>  package/gnuradio/gnuradio.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnuradio/gnuradio.mk
> b/package/gnuradio/gnuradio.mk index 6407dd4f8..60b0ce3d9 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -22,6 +22,7 @@ GNURADIO_DEPENDENCIES += orc
>  endif
>  
>  GNURADIO_CONF_OPTS = \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(GNURADIO_CFLAGS)" \
>  	-DENABLE_DEFAULT=OFF \
>  	-DENABLE_VOLK=ON \
>  	-DENABLE_GNURADIO_RUNTIME=ON
> @@ -30,13 +31,17 @@ GNURADIO_CONF_OPTS = \
>  # compile time.
>  GNURADIO_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GNURADIO_CFLAGS += -latomic
> +endif
> +
>  # Yes, this is silly, because -march is already known by the compiler
>  # with the internal toolchain, and passed by the external wrapper for
>  # external toolchains. Nonetheless, gnuradio does some matching on
> the # CFLAGS to decide whether to build the NEON functions or not, and
>  # wants to see the string 'armv7' in the CFLAGS.
>  ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
> -GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS)
> -march=armv7-a" +GNURADIO_CFLAGS += -march=armv7-a
>  endif
>  
>  # As soon as -mfpu=neon is supported by the compiler, gnuradio will
> try -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
