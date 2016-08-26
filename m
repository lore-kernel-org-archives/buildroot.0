From: Matthew Weber <matt@thewebers.ws>
Date: Thu, 25 Aug 2016 20:35:59 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/libgpg-error: optionally
	depends on gettext
In-Reply-To: <20160825201336.6751-1-arnout@mind.be>
References: <20160825201336.6751-1-arnout@mind.be>
Message-ID: <CAFt09wPz7RkPCK8wd1u5d2L0zHXLXSOZZ-7B2PT7FKcGYEEhzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, Aug 25, 2016 at 3:13 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> configure.ac has AM_GNU_GETTEXT(), which will enable i18n if a gettext
> library is found. For uClibc, it is found if the gettext package has
> been built, and it will add -lintl to the link flags. For musl and
> glibc, it is always found, in libc itself so nothing is added to the
> link flags.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Matthew Weber <matt@thewebers.ws>

Using http://autobuild.buildroot.net/results/e59247f73ba4af4cd5d7ef285c4d359b4c930def,
tested the uclibc autobuilder failure case where a "make clean
iputils" would build but "make clean all" would not because of the
gettext dependency not forcing gettext to build before libgpg-error in
the successful case.  These two cases now both build successfully.

Successfully tested (qemu_x86_64_defconfig) updated to be a glibc
x86_64 target with iputils enabled.  ie no gettext enabled.

Tested-by: Matthew Weber <matt@thewebers.ws>

> ---
> Discovered while investigating
> http://autobuild.buildroot.net/results/f81/f81eabb37788aa6dcdadf4034889c84bef78b876/
>
> v2: use BR2_PACKAGE_GETTEXT condition instead of BR2_NEEDS_GETTEXT
> ---
>  package/libgpg-error/libgpg-error.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index e081b36..1945673 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -11,6 +11,10 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
>  LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>
> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +LIBGPG_ERROR_DEPENDENCIES += gettext
> +endif
> +
>  define LIBGPG_ERROR_FIX_CROSS_COMPILATION
>         cd $(@D)/src/syscfg && \
>         ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
> --
> 2.9.3
>



-- 
Thanks,
Matt
