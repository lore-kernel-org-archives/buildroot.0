From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 18:58:52 +0100
Subject: [Buildroot] [PATCH v3 1/2] python-libconfig: new package
In-Reply-To: <1393952027-21201-1-git-send-email-johan.derycke@barco.com>
References: <1393952027-21201-1-git-send-email-johan.derycke@barco.com>
Message-ID: <20140304185852.5d5430f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Derycke,

On Tue,  4 Mar 2014 17:53:46 +0100, Johan Derycke wrote:
> Python bindings to the C++ library libconfig
> https://github.com/cnangel/python-libconfig
> 
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>
> ---
> Changes v2 -> v3:
>   -Avoid line-wrap using "git send-email"

Unfortunately, even though you have used "git send-email" this time,
the patches are still line-wrapped. I strongly suspect that your
company SMTP server, while adding the useless "DISCLAIMER" at the end
of each e-mail, takes the freedom to rewrap the entire e-mail.

Solutions are:

 *) Complain to your IT people.

 *) Send using another SMTP server.

 *) Let us fix up the patches manually. This is OK for small patches,
    but is quickly going to be horrible if the patches become large.

> diff --git a/package/python-libconfig/Config.in 
> b/package/python-libconfig/Config.in
> new file mode 100644
> index 0000000..170926d
> --- /dev/null
> +++ b/package/python-libconfig/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_LIBCONFIG
> +	bool "python-libconfig"
> +	depends on BR2_PACKAGE_PYTHON

Ok, so this package only builds with Python 2, correct?

> +	select BR2_PACKAGE_BOOST_PYTHON

I must say it's really horrible to need something as large as Boost
just to have a Python interface to a library as simple as libconfig.
But oh well, that's not your fault.

> +	select BR2_PACKAGE_LIBCONFIG
> +	help
> +	  Python bindings to the C++ library libconfig
> +
> +	  https://github.com/cnangel/python-libconfig
> diff --git a/package/python-libconfig/python-libconfig.mk 
> b/package/python-libconfig/python-libconfig.mk
> new file mode 100644
> index 0000000..3f5984b
> --- /dev/null
> +++ b/package/python-libconfig/python-libconfig.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-libconfig
> +#
> +################################################################################
> +
> +PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
> +PYTHON_LIBCONFIG_SITE = $(call 
> github,cnangel,python-libconfig,$(PYTHON_LIBCONFIG_VERSION))
> +
> +PYTHON_LIBCONFIG_LICENSE = BSD
> +PYTHON_LIBCONFIG_LICENSE_FILES = README
> +
> +PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
> +
> +PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
> +
> +$(eval $(python-package))

This looks good, but since this patch actually depends on the next
patch, they should be inverted in the patch series: the boost patch
first, and then the python-libconfig patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
