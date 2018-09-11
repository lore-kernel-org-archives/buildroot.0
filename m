From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 15:42:42 +0200
Subject: [Buildroot] [PATCH 02/18] perl-dbd-mysql: new package
In-Reply-To: <20180820115519.24046-3-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-3-chrismcc@gmail.com>
Message-ID: <20180911154242.6d46b475@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:03 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/perl-dbd-mysql/Config.in           | 12 ++++++++++++
>  package/perl-dbd-mysql/perl-dbd-mysql.hash |  6 ++++++
>  package/perl-dbd-mysql/perl-dbd-mysql.mk   | 15 +++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/perl-dbd-mysql/Config.in
>  create mode 100644 package/perl-dbd-mysql/perl-dbd-mysql.hash
>  create mode 100644 package/perl-dbd-mysql/perl-dbd-mysql.mk

I've applied, but there was a mistake in the patch, see below.

> diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
> new file mode 100644
> index 0000000000..49e7ff99d6
> --- /dev/null
> +++ b/package/perl-dbd-mysql/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PERL_DBD_MYSQL
> +	bool "perl-dbd-mysql"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_PERL_DBI
> +	select BR2_PACKAGE_MYSQL

You select BR2_PACKAGE_MYSQL without replicating its dependencies:
BR2_USE_MMU, BR2_TOOLCHAIN_HAS_THREADS and BR2_INSTALL_LIBSTDCPP. While
BR2_USE_MMU is guaranteed to be true because perl itself cannot be
enabled if !BR2_USE_MMU, there is nothing that guarantees
BR2_INSTALL_LIBSTDCPP and BR2_TOOLCHAIN_HAS_THREADS are true.

I fixed that by adding the appropriate dependencies, and adjusting the
Config.in comment accordingly.

> +PERL_DBD_MYSQL_VERSION = 4.046
> +PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
> +PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
> +PERL_DBD_MYSQL_DEPENDENCIES = host-perl-dbi perl-dbi mysql
> +PERL_DBD_MYSQL_CONF_OPTS += --mysql_config=$(STAGING_DIR)/usr/bin/mysql_config

Minor nit: the += here isn't really needed, a = was sufficient.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
