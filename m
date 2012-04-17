From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 13:39:32 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <1334660370-19506-2-git-send-email-bachmann@tofwerk.com>
References: <Re:[PATCH] Add libapr-package>
 <1334660370-19506-2-git-send-email-bachmann@tofwerk.com>
Message-ID: <20120417133932.4552d886@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rico,

Thanks for this contribution!

Le Tue, 17 Apr 2012 12:59:30 +0200,
Rico Bachmann <bachmann@tofwerk.com> a ?crit :

> +++ b/package/libapr/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBAPR
> +

Remove this blank line.

> +	bool "libapr"
> +	help
> +	  The mission of the Apache Portable Runtime (APR) project is to create and maintain software libraries that provide a predictable and consistent interface to underlying platform-specific implementations

This text should be wrapped at ~80 columns.

> new file mode 100644
> index 0000000..57da8ef
> --- /dev/null
> +++ b/package/libapr/libapr.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# libapr
> +#
> +#############################################################
> +LIBAPR_VERSION = 1.4.6
> +LIBAPR_SOURCE = apr-$(LIBAPR_VERSION).tar.gz

Yegor's suggestion didn't work because by default we download
<package-name>-<package-version>.tar.gz. However here you decided to
name the Buildroot package "libapr", while the upstream package is
"apr". Maybe we should use the "apr" name like upstream?

> +LIBAPR_SITE = http://mirror.switch.ch/mirror/apache/dist/apr
> +LIBAPR_INSTALL_STAGING = YES
> +LIBAPR_CONF_OPT = ac_cv_file__dev_zero=yes ac_cv_func_setpgrp_void=yes apr_cv_process_shared_works=yes apr_cv_mutex_robust_shared=no apr_cv_tcp_nodelay_with_cork=yes ac_cv_sizeof_struct_iovec=8 apr_cv_mutex_recursive=yes --enable-shared

Please wrap this this way:

LIBAPR_CONF_OPT = \
	ac_cv_file__dev_zero=yes \
	ac_cv_func_setgrp_void=yes \
	...

And remove --enable-shared since it is already passed by default, and
tuned when BR2_PREFER_STATIC is used.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
