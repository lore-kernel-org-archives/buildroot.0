From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 14 May 2021 22:11:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxslt: fix build with latest
 libxml2
In-Reply-To: <20210514194639.2217578-1-fontaine.fabrice@gmail.com>
References: <20210514194639.2217578-1-fontaine.fabrice@gmail.com>
Message-ID: <20210514221110.41f0e60f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 14 May 2021 21:46:39 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build is broken since bump of libxml2 to version 2.9.11 in commit
> a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04 because libxslt calls the
> following command "${XML_CONFIG} --libs print" which will return an
> error code since
> https://github.com/GNOME/libxml2/commit/2a357ab99e6f5c9196384b11cd91dd993f93014c
>
> To fix this build failure, drop --with-libxml-prefix to prefer
> pkg-config
>
> Fixes:
>  - http://autobuild.buildroot.org/results/47ceb8c24c9ead8a450b7fea3266f760d6b77b4f
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libxslt/libxslt.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index 3c603ad9f6..149e1d8972 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -14,8 +14,7 @@ LIBXSLT_CPE_ID_VENDOR = xmlsoft
>  LIBXSLT_CONF_OPTS = \
>  	--with-gnu-ld \
>  	--without-debug \
> -	--without-python \
> -	--with-libxml-prefix=$(STAGING_DIR)/usr

This line was introduced with commit f8f8ff33472 ([1]):

    libxslt: point to the correct xml2-config location

    Currently libxslt configure finds native /usr/bin/xml2-config.

Are you sure libxslt configure does not use (wrong) native/local
xml2-config again without this line?

Regards,
Peter


[1] https://git.buildroot.net/buildroot/commit/?id=f8f8ff33472641f9192a5e1ca65ebc614821665a

> +	--without-python
>  LIBXSLT_CONFIG_SCRIPTS = xslt-config
>  LIBXSLT_DEPENDENCIES = host-pkgconf libxml2
>
