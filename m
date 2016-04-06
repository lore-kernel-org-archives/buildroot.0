From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 00:20:51 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/radlib: kconfig and makefile
In-Reply-To: <1459948770-2769-2-git-send-email-ray.kinsella@intel.com>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-2-git-send-email-ray.kinsella@intel.com>
Message-ID: <57058BC3.1070105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Very quick feedback, not a detailed review.

  First of all, the three patches should be squashed into one, because all three 
are needed to have a functional package. Otherwise, the build would be broken 
between the patches.

On 04/06/16 15:19, ray.kinsella at intel.com wrote:
> From: Ray Kinsella <ray.kinsella@intel.com>
>
> Add new package for radlib including kconfig and makefile. The makefile
> includes a choice depending on which database backends are enabled.
>
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>   package/Config.in          |  1 +
>   package/radlib/Config.in   | 37 +++++++++++++++++++++++++++++++++++++
>   package/radlib/radlib.hash |  2 ++
>   package/radlib/radlib.mk   | 28 ++++++++++++++++++++++++++++
>   4 files changed, 68 insertions(+)
>   create mode 100644 package/radlib/Config.in
>   create mode 100644 package/radlib/radlib.hash
>   create mode 100644 package/radlib/radlib.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 64822bf..6c59556 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1262,6 +1262,7 @@ endif
>   	source "package/protobuf-c/Config.in"
>   	source "package/qhull/Config.in"
>   	source "package/qlibc/Config.in"
> +	source "package/radlib/Config.in"
>   	source "package/startup-notification/Config.in"
>   	source "package/tz/Config.in"
>   	source "package/tzdata/Config.in"
> diff --git a/package/radlib/Config.in b/package/radlib/Config.in
> new file mode 100644
> index 0000000..e77e03c
> --- /dev/null
> +++ b/package/radlib/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_RADLIB
> +	bool "radlib"
> +	help
> +	  radlib is a rapid application development library for unix
> +	  multi-process applications. It uses SYS V IPC facilities and
> +	  FIFOs to provide an RTOS-like, event-driven, distributed framework.
> +	  Processes may be run as daemons or have a controlling terminal.
> +	
> +	  http://sourceforge.net/projects/radlib/
> +
> +choice
> +	prompt "radlib database backend"
> +	depends on BR2_PACKAGE_RADLIB

  We generally prefer to have a big if...endif construct, because that is easier 
to extend with additional options.

  However, do we really need this choice? Isn't it possible to build radlib with 
support for multiple databases?

> +	depends on BR2_PACKAGE_SQLITE \
> +		|| BR2_PACKAGE_MYSQL \
> +		|| BR2_PACKAGE_POSTGRESQL
> +	help$

  Stray $

> +		Selects the backend database: sqlite, mysql or postgresql

  Indentation should be one tab + 2 spaces; same below.

> +
> +config BR2_PACKAGE_RADLIB_SQLITE
> +	bool "sqlite"
> +	depends on BR2_PACKAGE_SQLITE
> +	help
> +		Configure radlib to use a sqlite database backend
> +
> +config BR2_PACKAGE_RADLIB_MYSQL
> +	bool "mysql"
> +	depends on BR2_PACKAGE_MYSQL
> +	help
> +		Configure radlib to use a mysql database backend
> +
> +config BR2_PACKAGE_RADLIB_POSTGRESQL
> +	bool "postgresql"
> +	depends on BR2_PACKAGE_POSTGRESQL
> +	help
> +		Configure radlib to use a postgresql database backend

  Add an empty line here.

> +endchoice
> diff --git a/package/radlib/radlib.hash b/package/radlib/radlib.hash
> new file mode 100644
> index 0000000..2fbfbba
> --- /dev/null
> +++ b/package/radlib/radlib.hash
> @@ -0,0 +1,2 @@
> +# From http://sourceforge.net/projects/radlib/files/
> +sha256  82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66  radlib-2.12.0.tar.gz
> diff --git a/package/radlib/radlib.mk b/package/radlib/radlib.mk
> new file mode 100644
> index 0000000..5ff55ac
> --- /dev/null
> +++ b/package/radlib/radlib.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# radlib
> +#
> +################################################################################
> +
> +RADLIB_VERSION = 2.12.0
> +RADLIB_SITE = http://downloads.sourceforge.net/radlib
> +RADLIB_INSTALL_STAGING = YES
> +RADLIB_LICENSE = BSD-2c
> +RADLIB_LICENSE_FILES = COPYING
> +RADLIB_AUTORECONF = YES
> +RADLIB_DEPENDENCIES = host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_RADLIB_SQLITE),y)
> +	RADLIB_CONF_OPTS += --with-sqlite

  Don't indent.

  Shouldn't there also be a RADLIB_DEPENDENCIES += sqlite ?

  Also add

else
RADLIB_CONF_OPTS += --without-sqlite

(unless if that doesn't work of course; it if doesn't, mention it in the commit 
message).


  Regards,
  Arnout

> +endif
> +
> +ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
> +	RADLIB_CONF_ENV=ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
> +	RADLIB_CONF_OPTS += --with-mysql
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RADLIB_POSTGRESQL),y)
> +	RADLIB_CONF_OPTS += --with-postgresql
> +endif
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
