From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:43:41 +0100
Subject: [Buildroot] [PATCH] gnupg2: fix linking with intl
In-Reply-To: <1418215302-31208-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418215302-31208-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210214341.7032787d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Dec 2014 12:41:42 +0000, Vicente Olivert Riera wrote:
> gnupg2 needs to link with intl if the toolchain needs gettext and
> locale is set. Otherwise we will see an error like this one:
> 
> libgpg-error.a(libgpg_error_la-strsource.o): In function
> `gpg_strsource':
> strsource.c:(.text+0x4c): undefined reference to `libintl_dgettext'
> 
> Fixes:
>   http://autobuild.buildroot.net/results/9aa/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/gnupg2/Config.in |    1 +
>  package/gnupg2/gnupg2.mk |    5 +++++
>  2 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
> index d24eaae..92125d1 100644
> --- a/package/gnupg2/Config.in
> +++ b/package/gnupg2/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_GNUPG2
>  	select BR2_PACKAGE_LIBPTHSEM
>  	select BR2_PACKAGE_LIBPTHSEM_COMPAT
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	depends on BR2_USE_MMU # libassuan
>  	help
>  	  GnuPG is the GNU project's complete and free implementation
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 2d133aa..aabebd7 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -20,6 +20,11 @@ GNUPG2_CONF_OPTS = \
>  	--with-pth-prefix=$(STAGING_DIR)/usr
>  GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
>  
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +GNUPG2_DEPENDENCIES += gettext
> +GNUPG2_CONF_ENV += LIBS=-lintl
> +endif
> +

While this patch indeed fixes the problem, I am not too happy with it,
for two reasons:

 1) gettext is not *needed* to build gnupg2, even when locales are
    enabled. So the "select BR2_PACKAGE_GETTEXT if
    BR2_NEEDS_GETTEXT_IF_LOCALE" is not needed, and the ifeq
    ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y) should be replaced by an ifeq
    ($(BR2_PACKAGE_GETTEXT),y).

 2) because it's actually libgpg-error that is linked against libintl,
    and gnupg2 shouldn't have to worry about this, and just ask
    libgpg-error the linker flags to use to link against it. But oh
    well, the handling of static linking is such a mess that this is
    not something we can really fix.

So can you fix (1) at least ?

For (2), I don't think you can fix it easily. But I'm a bit worried
about all those -l<foo> being added all over the place: how are we
going to notice when those manually added -l<foo> are no longer needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
