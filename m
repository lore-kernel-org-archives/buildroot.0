From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Feb 2017 15:34:58 +0200
Subject: [Buildroot] [PATCHv3] package/ccache: do not force colored
 diagnostics
In-Reply-To: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
References: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170212133458.ifd7augu7zet3kv4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Feb 12, 2017 at 02:30:27PM +0100, Yann E. MORIN wrote:
> When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> this flag requires GCC v4.9 or later. Older versions complain about the
> unrecognized command line option.
> 
> We could override GCC_COLORS in the environment, but this would not be
> enough since some packages may call directly $(CC) or $(HOSTCC) (like
> makedevs do, as spotted by Thomas).
> 
> Since we use the same ccache build for both host and target, we disable
> that behaviour when either the host or target compiler is tool old to
> support this, at the cost of nol onger colorising output diagnostics for
> the one that is recent enough.
> 
> Reported-by: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v2 -> v2: (Yann)
>   - drop the environment variable override  (Yann)
>   - directly patch ccache  (Thomas)
> 
> Changes v1->v2  (Carlos)
>   Fix indentation, use positive logic and improve the commit message,
>   acording to comments from Thomas Petazzoni and Yann E. MORIN.
> ---
>  package/ccache/ccache.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index f174a5d..a4c2d9f 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -35,6 +35,16 @@ endef
>  
>  HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
>  
> +# Further patch ccache if either the host or target compilers is
> +# too old to support colored output diagnostics.
> +ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),yy)
> +define CCACHE_NO_GCC_COLORS
> +	sed -i  '/if (getenv("GCC_COLORS")/,+3d' $(@D)/ccache.c
> +endef
> +
> +#HOST_CCACHE_POST_PATCH_HOOKS += CCACHE_NO_GCC_COLORS

Are you sure?

> +endif
> +
>  define HOST_CCACHE_MAKE_CACHE_DIR
>  	mkdir -p $(BR_CACHE_DIR)
>  endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
