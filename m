From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Oct 2019 14:15:04 +0200
Subject: [Buildroot] [PATCH v2 5/9] package/libnetconf2: add package
In-Reply-To: <20191009112656.21232-6-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-6-heiko.thiery@gmail.com>
Message-ID: <20191009141504.37bf7928@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Wed,  9 Oct 2019 13:26:52 +0200
heiko.thiery at gmail.com wrote:

> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
> new file mode 100644
> index 0000000000..986e49fac5
> --- /dev/null
> +++ b/package/libnetconf2/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_LIBNETCONF2
> +	bool "libnetconf2"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_LIBSSH
> +	select BR2_PACKAGE_LIBSSH_SERVER

I thought libssh was now an optional dependency ?

> +	help
> +	  libnetconf2 is a NETCONF library in C intended for building
> +	  NETCONF clients and servers.
> +
> +	  https://github.com/CESNET/libnetconf2
> +
> +config BR2_PACKAGE_LIBNETCONF2_SSH
> +	bool
> +	help
> +	  SSH support for libnetconf2
> +
> +config BR2_PACKAGE_LIBNETCONF2_TLS
> +	bool
> +	help
> +	  TLS support for libnetconf2

Do we need configurable options for this ? In general, we prefer to
have automatic dependencies, i.e just rely on whether a dependent
package is enabled or not. This would give in your .mk file:

+ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
+LIBNETCONF2_DEPENDENCIES += libssh
+else
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
+endif

> +config BR2_PACKAGE_HOST_LIBNETCONF2_SSH
> +	bool
> +	help
> +	  SSH support for host-libnetconf2
> +
> +config BR2_PACKAGE_HOST_LIBNETCONF2_TLS
> +	bool
> +	help
> +	  TLS support for host-libnetconf2

We generally don't make host packages configurable, and if they are,
certainly not with options in Config.in, but in Config.in.host. Do you
really need the host variant of libnetconf2 to have SSL/TLS support ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
