From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 18:49:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/postgresql: allow to select
 postgresql version
In-Reply-To: <20201229095255.183687-2-fido_max@inbox.ru>
References: <20201229095255.183687-1-fido_max@inbox.ru>
 <20201229095255.183687-2-fido_max@inbox.ru>
Message-ID: <20201229174914.GU1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim, All,

On 2020-12-29 12:52 +0300, Maxim Kochetkov via buildroot spake thusly:
> Some packages (like timescaledb) needs older version of PostgreSQL.

As replied to the cover letter: what about bumping tiemscaledb?

> Another use case is supporting older database format. PostgreSQL can't
> automatically upgrade database to next major version.

There are a lot of other packages that may require migrating data when
upgrading; we can't have a version choice for all those.

So, I've marked this patch, and follosing, as Changes Requested in our
patchwork.

Regards,
Yann E. MORIN.

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/Config.in       | 24 ++++++++++++++++++++++++
>  package/postgresql/postgresql.hash |  3 +++
>  package/postgresql/postgresql.mk   |  2 +-
>  3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index 2f677daf5b..aa9b28dcb3 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -22,3 +22,27 @@ config BR2_PACKAGE_POSTGRESQL
>  comment "postgresql needs a toolchain w/ dynamic library, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +
> +if BR2_PACKAGE_POSTGRESQL
> +
> +choice
> +	prompt "PostgreSQL Version"
> +	default BR2_POSTGRESQL_VERSION_12
> +	help
> +	  Select the version of postgresql you wish to use.
> +
> +config BR2_POSTGRESQL_VERSION_12
> +	bool "postgresql 12"
> +
> +config BR2_POSTGRESQL_VERSION_13
> +	bool "postgresql 13"
> +
> +endchoice
> +
> +config BR2_POSTGRESQL_VERSION
> +	string
> +	default "12.5"    if BR2_POSTGRESQL_VERSION_12
> +	default "13.1"    if BR2_POSTGRESQL_VERSION_13
> +	depends on BR2_PACKAGE_POSTGRESQL
> +
> +endif
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index ef676cccc4..ed61e79a09 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,5 +1,8 @@
>  # From https://ftp.postgresql.org/pub/source/v13.1/postgresql-13.1.tar.bz2.sha256
>  sha256  12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f  postgresql-13.1.tar.bz2
>  
> +# From https://ftp.postgresql.org/pub/source/v13.1/postgresql-12.5.tar.bz2.sha256
> +sha256  bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95  postgresql-12.5.tar.bz2
> +
>  # License file, Locally calculated
>  sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 98361c00c8..09f226bd85 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 13.1
> +POSTGRESQL_VERSION = $(call qstrip,$(BR2_POSTGRESQL_VERSION))
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
