From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 15 Dec 2018 20:56:04 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: fix build with pkgconf 1.5.3
In-Reply-To: <20181215130613.18112-1-fontaine.fabrice@gmail.com>
References: <20181215130613.18112-1-fontaine.fabrice@gmail.com>
Message-ID: <874lbebovv.fsf@tkos.co.il>
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
> fwts uses the completionsdir variable from bash-completions.pc to decide

fwts?

> where to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
>
> Until a better solution is found in pkgconf, pass the appdefaultdir to
> use explicitly instead of relying on bash-completions.pc.
>
> Fixes:
>  - http://autobuild.buildroot.org/results/caf352a66aa5bd94b93aac39a90b4fa33b39a708
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/util-linux/util-linux.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index c176d364ce..edbb10d1c8 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -229,6 +229,10 @@ else
>  UTIL_LINUX_CONF_OPTS += --without-audit
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +UTIL_LINUX_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
> +endif
> +
>  # Install PAM configuration files
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
>  define UTIL_LINUX_INSTALL_PAMFILES

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
