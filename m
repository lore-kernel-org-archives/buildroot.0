From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 15 Dec 2018 20:52:41 +0200
Subject: [Buildroot] [PATCH 1/1] keepalived: fix systemd build with
 pkgconf 1.5.3
In-Reply-To: <20181215105337.19589-1-fontaine.fabrice@gmail.com>
References: <20181215105337.19589-1-fontaine.fabrice@gmail.com>
Message-ID: <875zvubp1i.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Fabrice Fontaine writes:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
>
> alsa-utils uses the systemdsystemunitdir variable from systemd.pc to

alsa-utils?

> decide where to install things. Since DESTDIR is prepended to the
> install destination, this will end up in the wrong location.
>
> Until a better solution is found in pkgconf, pass the
> systemdsystemunitdir to use explicitly instead of relying on systemd.pc.
>
> Fixes:
>  - http://autobuild.buildroot.org/results/34690fd724332c154971d5363a4c84e97a5e9ae9
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/keepalived.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
> index 584da6bb48..10711cac49 100644
> --- a/package/keepalived/keepalived.mk
> +++ b/package/keepalived/keepalived.mk
> @@ -46,4 +46,10 @@ else
>  KEEPALIVED_CONF_OPTS += --disable-libiptc
>  endif
>  
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +KEEPALIVED_CONF_OPTS += \
> +	--with-init=systemd \
> +	--with-systemdsystemunitdir=/usr/lib/systemd/system
> +endif
> +
>  $(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
