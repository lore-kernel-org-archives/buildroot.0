From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 15 Aug 2014 08:56:13 +0300
Subject: [Buildroot] [PATCH 1/1] qt: add postgresql driver support
In-Reply-To: <1407938742-25932-2-git-send-email-bos@je-eigen-domein.nl>
References: <1407938742-25932-1-git-send-email-bos@je-eigen-domein.nl>
 <1407938742-25932-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <201408150856.13522.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 13 August 2014 17:05:42 Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Reviewed-by: Fatih A??c? <fatih.asici@gmail.com>

> ---
>  package/qt/Config.sql.in | 6 +++++-
>  package/qt/qt.mk         | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
> index 259a574..fd62657 100644
> --- a/package/qt/Config.sql.in
> +++ b/package/qt/Config.sql.in
> @@ -30,11 +30,15 @@ config BR2_PACKAGE_QT_ODBC
> 
>  config BR2_PACKAGE_QT_PSQL
>  	bool "PostgreSQL Driver"
> -	depends on BROKEN # libpgsql not in BR
> +	select BR2_PACKAGE_POSTGRESQL
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Build PostgreSQL driver
>  	  If unsure, say n.
> 
> +comment "PostgreSQL needs an (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
>  choice
>  	prompt "SQLite 3 support"
>  	default BR2_PACKAGE_QT_SQLITE_NONE
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 880e835..92a090f 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -343,6 +343,8 @@ QT_CONFIGURE_OPTS += -qt-sql-odbc
>  endif
>  ifeq ($(BR2_PACKAGE_QT_PSQL),y)
>  QT_CONFIGURE_OPTS += -qt-sql-psql
> +QT_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
> +QT_DEPENDENCIES   += postgresql
>  endif
>  ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
>  QT_CONFIGURE_OPTS += -qt-sql-sqlite
> @@ -503,6 +505,7 @@ define QT_CONFIGURE_CMDS
>  		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
> +		$(QT_CONFIGURE_ENV) \
>  		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
>  		$(if $(VERBOSE),-verbose,-silent) \
>  		-force-pkg-config \
