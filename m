From: Nathaniel Roach <nroach44@gmail.com>
Date: Tue, 29 Jul 2014 11:49:58 +0800
Subject: [Buildroot] [PATCH v2] bandwidthd: new package
In-Reply-To: <1406604825-1048-1-git-send-email-nroach44@gmail.com>
References: <1406604825-1048-1-git-send-email-nroach44@gmail.com>
Message-ID: <53D719E6.8040801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/07/14 11:33, Nathaniel Roach wrote:
> ---
>  package/Config.in                |  1 +
>  package/bandwidthd/Config.in     | 48 ++++++++++++++++++++++++++++++++++++++++
>  package/bandwidthd/bandwidthd.mk | 32 +++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 package/bandwidthd/Config.in
>  create mode 100644 package/bandwidthd/bandwidthd.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 11087da..0d7e1e8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -938,6 +938,7 @@ menu "Networking applications"
>  	source "package/autossh/Config.in"
>  	source "package/avahi/Config.in"
>  	source "package/axel/Config.in"
> +	source "package/bandwidthd/Config.in"
>  	source "package/bcusdk/Config.in"
>  	source "package/bind/Config.in"
>  	source "package/bluez_utils/Config.in"
> diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
> new file mode 100644
> index 0000000..a536c5d
> --- /dev/null
> +++ b/package/bandwidthd/Config.in
> @@ -0,0 +1,48 @@
> +config BR2_PACKAGE_BANDWIDTHD
> +	bool "bandwidthd"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_GD
> +	help
> +	  BandwidthD - Bandwidth monitoring
> +
> +	  Provides a method to measure the bandwidth that travels through the
> +	  machine, grouped by subnet and IP. This information can be stored
> +	  locally in /var/lib/bandwidthd and can be configured to generate
> +	  static HTML pages which can be hosted by a web server.
> +
> +	  It is highly recommended that the target has some way of retaining the
> +	  time between reboots. (e.g. NTP on boot or an RTC)
> +	  
> +	  It is suggested to use sqlite for logfile storage but works fine
> +	  without, and can be completely ignored if the postgresql portion
> +	  is used. 
> +
> +	  As upstream is no longer actively maintained, a fork is available
> +	  on github that works on making BandwidthD's build process more
> +	  compatible with buildroot's.
> +
> +	  Upstream: http://bandwidthd.sourceforge.net/
> +	  Github fork: http://github.com/nroach44/bandwidthd
> +
> +if BR2_PACKAGE_BANDWIDTHD
> +
> +config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
> +	bool "enable postgresql log target support"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # postgresql
> +	select BR2_PACKAGE_POSTGRESQL
> +	help
> +	  Enable support for logging the bandwidthd data to a remote (or local)
> +	  postgresql server. This data can then be viewed through a php site. See 
> +	  README in the source code (github.com/nroach44/bandwidthd) for more
> +	  information.
> +
> +config BR2_PACKAGE_BANDWIDTHD_SQLITE3
> +	bool "enable sqlite3 log storage"
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Enable support for storing the aggregated data in an sqlite db instead
> +	  of a plain text file.
> +
> +endif
> diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
> new file mode 100644
> index 0000000..8ad634e
> --- /dev/null
> +++ b/package/bandwidthd/bandwidthd.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# bandwidthd
> +#
> +################################################################################
> +
> +BANDWIDTHD_VERSION = v2.0.1-auto-r06
> +BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
> +
> +#Specified as "any version of the GPL that is current as of your download."
> +# by upstream.
> +BANDWIDTHD_LICENSE = GPL
> +
> +BANDWIDTHD_DEPENDENCIES += gd libpng libpcap
> +
> +BANDWIDTHD_AUTORECONF = YES
> +
> +ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
> +BANDWIDTHD_DEPENDENCIES += postgresql 
> +BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
> +else
> +BANDWIDTHD_CONF_OPT += --with-postgresql-logging=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BANDWIDTHD_SQLITE3),y)
> +BANDWIDTHD_DEPENDENCIES += sqlite
> +BANDWIDTHD_CONF_OPT += --with-sqlite-storage=true
> +else
> +BANDWIDTHD_CONF_OPT += --with-sqlite-storage=false
> +endif
> +
> +$(eval $(autotools-package))
> 

Whelp, forgot to add the changelog in, I can resubmit if needed, but
otherwise, here it is:

Changes v1 to v2

     - Fixed writing style (as recommended by Thomas Petazzoni)
     - Added sqlite toggle
     - Bump version
