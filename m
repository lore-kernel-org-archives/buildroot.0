From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Oct 2015 07:32:06 +0200
Subject: [Buildroot] [PATCH 1/3] package/git: Add needed library for
 static compilation
In-Reply-To: <1445893962-13338-2-git-send-email-repk@triplefau.lt>
References: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
 <1445893962-13338-2-git-send-email-repk@triplefau.lt>
Message-ID: <20151027053206.GH2229@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Remi,

On Mon, Oct 26, 2015 at 10:12:40PM +0100, Remi Pommarel wrote:
> Add missing ssl, zlib and gettext library for static compilation support.
> 
> A statically compiled libcurl need to be linked with some libraries to get all
> its undefined symbols resolved. Indeed when libcurl supports openssl it needs
> -lssl to satisfy all its dependencies, the same goes for gettext and zlib
> symbols.
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  package/git/git.mk | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 2bd6a01..942f29f 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -14,7 +14,7 @@ GIT_DEPENDENCIES = zlib host-gettext
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  GIT_DEPENDENCIES += openssl
>  GIT_CONF_OPTS += --with-openssl
> -GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
> +GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lssl -lcrypto)

zlib is always selected. You should not remove it.

Also, since you seem to fix the libcurl issue in later patches is this still 
needed at all?

>  else
>  GIT_CONF_OPTS += --without-openssl
>  endif
> @@ -55,9 +55,20 @@ else
>  GIT_CONF_OPTS += --without-tcltk
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +GIT_DEPENDENCIES += gettext
> +GIT_CONF_ENV += ac_cv_lib_c_gettext=no
> +endif

Are you sure this fixes a static build issue? If not, please make a separate 
patch for this part.

> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +GIT_DEPENDENCIES += zlib
> +GIT_CONF_ENV_LIBS += -lz
> +endif

This part should not be needed. zlib is already in GIT_DEPENDENCIES (above), 
-lz should be in GIT_CONF_ENV_LIBS for static build, and BR2_PACKAGE_ZLIB is 
always selected.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
