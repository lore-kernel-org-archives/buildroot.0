From: Gergely Imreh <imrehg@gmail.com>
Date: Wed, 13 May 2015 15:44:53 +0800
Subject: [Buildroot] [PATCH 1/2] postgresql: avoid AC_TRY_RUN when
	testing snprintf()
In-Reply-To: <e2f2e9591f74058025374bfeb2f41de5b6d4c47d.1431461407.git.baruch@tkos.co.il>
References: <e2f2e9591f74058025374bfeb2f41de5b6d4c47d.1431461407.git.baruch@tkos.co.il>
Message-ID: <CAJ3iQcr8QU_2-X1vGWujLnbbSVW5V_2et7Ud8R8kCBuze9Hi0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 May 2015 at 04:10, Baruch Siach <baruch@tkos.co.il> wrote:
> A few snprintf() compatibility tests in config/c-library.m4 use AC_TRY_RUN
> that doesn't work for cross compilation. As a result configure.in decides to
> build a bundled implementation of snprintf(). This implementation calls
> isnan(), but -lm is missing. This breaks link with libpq.so. Preseed the
> correct values to make the configure script happy, and fix rsyslog build.
>
> Fixes:
> http://autobuild.buildroot.net/results/e76/e769982e3131581b38698c109c9bc5215e3d5b11/
> http://autobuild.buildroot.net/results/2b9/2b9d3edc8341675455bc3b74d1e84c8c0c24c521/
> http://autobuild.buildroot.net/results/2a8/2a80357237ed7225823a008b5ff02bab01269814/
>
> and many more.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Tested-by: Gergely Imreh <imrehg@gmail.com>
 by build testing with `make rsyslog` reproducing the first listed
autobuild crash, and applying the patch to see it finish correctly

> ---
>  package/postgresql/postgresql.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 1a6aa880286f..eda547c18023 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -11,7 +11,9 @@ POSTGRESQL_LICENSE = PostgreSQL
>  POSTGRESQL_LICENSE_FILES = COPYRIGHT
>  POSTGRESQL_INSTALL_STAGING = YES
>  POSTGRESQL_CONFIG_SCRIPTS = pg_config
> -POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes
> +POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
> +                     pgac_cv_snprintf_long_long_int_format="%lld" \
> +                     pgac_cv_snprintf_size_t_support=yes
>  POSTGRESQL_AUTORECONF = YES
>
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
