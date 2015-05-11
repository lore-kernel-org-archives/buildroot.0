From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 12 May 2015 00:17:24 +0200
Subject: [Buildroot] [PATCH] libmemcached: don't use -fPIE and -pie with
 FLAT binaries
In-Reply-To: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55512A74.9010809@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 11/05/2015 22:55, Thomas Petazzoni a ?crit :
> FLAT binaries cannot use -fPIE and -pie code, so let's teach
> libmemcached to not use such flags when BR2_BINFMT_FLAT=y.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/8cb/8cbf57f9136cb42be31c88e0f1f32d3d2353e5ff/
>   and many previous similar build failures
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I "build" tested your patch an get another error during the man build.
See http://patchwork.ozlabs.org/patch/471050/
With that fixed, libmemcached build fine on bfin.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
> ---
>  package/libmemcached/libmemcached.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
> index d442b3c..f32963d 100644
> --- a/package/libmemcached/libmemcached.mk
> +++ b/package/libmemcached/libmemcached.mk
> @@ -18,4 +18,15 @@ LIBMEMCACHED_AUTORECONF = YES
>  LIBMEMCACHED_LICENSE = BSD-3c
>  LIBMEMCACHED_LICENSE_FILES = COPYING
>  
> +# Help libmemcached to understand that -fPIE and -pie should not be
> +# used when FLAT binaries are used (shared libraries are not
> +# supported).
> +ifeq ($(BR2_BINFMT_FLAT),y)
> +LIBMEMCACHED_CONF_ENV += \
> +	ax_cv_check_cflags__Werror__fPIE=no \
> +	ax_cv_check_cflags__Werror__pie=no \
> +	ax_cv_check_cxxflags__Werror__fPIE=no \
> +	ax_cv_check_cxxflags__Werror__pie=no
> +endif
> +
>  $(eval $(autotools-package))
> 
