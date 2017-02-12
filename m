From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Feb 2017 22:39:58 +0100
Subject: [Buildroot] [PATCHv3] package/ccache: do not force colored
 diagnostics
In-Reply-To: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
References: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <04456b76-8eed-f7e8-0bf8-b649bee98bcb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-02-17 14:30, Yann E. MORIN wrote:
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

 Actually, if the user sets GCC_COLORS in his environment while his host
compiler is too old to support that option, then he's just plain stupid, no?

 But anyway, I would tend to say, let's simplify things and do a global
"unexport GCC_COLORS" like we already do for a few other options. IMHO
colourized output is not so useful in Buildroot context. A global unexport is a
lot simpler.


 Regards,
 Arnout

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
> +endif
> +
>  define HOST_CCACHE_MAKE_CACHE_DIR
>  	mkdir -p $(BR_CACHE_DIR)
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
