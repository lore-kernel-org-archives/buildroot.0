From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 14 Dec 2018 06:40:40 +0200
Subject: [Buildroot] [PATCH 1/2] alsa-utils: add udev optional dependency
In-Reply-To: <20181213214802.7730-1-fontaine.fabrice@gmail.com>
References: <20181213214802.7730-1-fontaine.fabrice@gmail.com>
Message-ID: <87mup867qv.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Fabrice Fontaine writes:
> Add udev optional dependency and fix build with pkgconf 1.5.3
>
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
>
> alsa-utils uses the udevdir variable from udev.pc to decide where to
> install things. Since DESTDIR is prepended to the install destination,
> this will end up in the wrong location.
>
> Until a better solution is found in pkgconf, pass the udevrulesdir to
> use explicitly instead of relying on udev.pc.
>
> Fixes:
>  - http://autobuild.buildroot.org/results/d8ad140ae52b4fe8e153de3835f3f17e92b58e53
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/alsa-utils/alsa-utils.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 0bf2b432bd..422318796f 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -28,6 +28,11 @@ ALSA_UTILS_CONF_OPTS = \
>  	--disable-rst2man \
>  	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
>  
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +ALSA_UTILS_CONF_OPTS += --with-udev-rules-dir=/usr/lib/udev/rules.d
> +ALSA_UTILS_DEPENDENCIES += udev

Is there a build time dependency of alsa-utils on udev? As far as I can
see alsa-utils only installs the .rules file, so the order of build
should not matter.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
>  ALSA_UTILS_CONF_OPTS += --enable-alsaloop
>  else

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
