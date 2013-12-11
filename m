From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Dec 2013 11:46:59 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
References: <52A730B0.3020104@orange.com>
 <1386702439-10093-1-git-send-email-yann.morin.1998@free.fr>
 <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <52A842A3.3010302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/12/13 20:07, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Because some GLES providers may be in BR2_EXTERNAL, $(LIBGLES_DEPENDENCIES)
> might be empty hwen we test it.
>
> So, we can't rely on it to define LIBGLES_CONFIGURE_CMDS, and we must
> postpone the check until later, ie. at runtime.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   package/opengl/libgles/libgles.mk | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
> index ec157ac..c2e1acf 100644
> --- a/package/opengl/libgles/libgles.mk
> +++ b/package/opengl/libgles/libgles.mk
> @@ -22,11 +22,16 @@ ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
>   LIBGLES_DEPENDENCIES += gpu-viv-bin-mx6q
>   endif
>
> -ifeq ($(LIBGLES_DEPENDENCIES),)
> +# Because some GLES providers may be in BR2_EXTERNAL,
> +# $(LIBGLES_DEPENDENCIES) might be empty right here.
> +# So, we can't rely on it to define LIBGLES_CONFIGURE_CMDS
> +# right now, and we must postpone the check until later,
> +# ie. at runtime.
>   define LIBGLES_CONFIGURE_CMDS
> -	echo "No libGLES implementation selected. Configuration error."
> -	exit 1
> +	if [ -z "$${LIBGLES_DEPENDENCIES}" ]; then \

  This should be "$(LIBGLES_DEPENDENCIES)", but otherwise it looks like 
it would work.

  Regards,
  Arnout

> +		echo "No libGLES implementation selected. Configuration error."; \
> +		exit 1; \
> +	fi
>   endef
> -endif
>
>   $(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
