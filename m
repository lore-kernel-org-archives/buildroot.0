From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 17:29:21 +0200
Subject: [Buildroot] [PATCH] package/efl/libevas: remove unsafe paths
In-Reply-To: <1441723349-31061-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441723349-31061-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55EEFED1.7010700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 16:42, Vicente Olivert Riera wrote:
> Fixes:
> 
>   http://autobuild.buildroot.net/results/7f2/7f2baef97c4ff3b9111becc1e0b79780c6e9db6f/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/efl/libevas/libevas.mk |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
> index 8113162..9ffedce 100644
> --- a/package/efl/libevas/libevas.mk
> +++ b/package/efl/libevas/libevas.mk
> @@ -17,6 +17,13 @@ LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
>  HOST_LIBEVAS_DEPENDENCIES = \
>  	host-pkgconf host-zlib host-libeina \
>  	host-freetype host-libpng host-libjpeg
> +
> +define LIBEVAS_REMOVE_UNSAFE_PATHS
> +$(SED) 's#-I/usr/include##g' $(@D)/configure

 We currently have 1 package using #, 2 packages using ^, and 11 packages using
%. So let's stick to %.

> +endef
> +LIBEVAS_POST_PATCH_HOOKS += LIBEVAS_REMOVE_UNSAFE_PATHS
> +HOST_LIBEVAS_POST_PATCH_HOOKS += LIBEVAS_REMOVE_UNSAFE_PATHS

 For the host it's not unsafe... Useless, but not unsafe.


 Regards,
 Arnout

> +
>  HOST_LIBEVAS_CONF_OPTS += \
>  	--enable-image-loader-png \
>  	--enable-image-loader-jpeg \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
