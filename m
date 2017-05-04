From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:57:29 +0200
Subject: [Buildroot] [PATCH v2 02/10] package/python-traitlets: New
 package
In-Reply-To: <20170427213340.26917-3-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
 <20170427213340.26917-3-andrew.smirnov@gmail.com>
Message-ID: <20170504215729.7c270248@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Apr 2017 14:33:32 -0700, Andrey Smirnov wrote:

> +config BR2_PACKAGE_PYTHON_TRAITLETS
> +	bool "python-traitlets"
> +	select BR2_PACKAGE_PYTHON_DECORATOR
> +	select BR2_PACKAGE_PYTHON_ENUM if BR2_PACKAGE_PYTHON

Are you sure?

According to https://pypi.python.org/pypi/traitlets/json:

        "requires_dist": [
            "mock; python_version==\"2.7\" and extra == 'test'", 
            "pytest; extra == 'test'", 
            "enum34; python_version==\"3.3\"", 
            "enum34; python_version==\"2.7\"", 
            "six", 
            "ipython-genutils", 
            "decorator"
        ], 

So it needs python-enum34, not python-enum it seems. It also needs
ipython-genutils apparently.

Generally, make sure that if you enable *ONLY* this package, and do a
build, you can "import traitlets" without error on the target.

> diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
> new file mode 100644
> index 0000000..3b14991
> --- /dev/null
> +++ b/package/python-traitlets/python-traitlets.hash
> @@ -0,0 +1,2 @@
> +# sha256 locally computed
> +sha256 370f938ad730d52272ef74f96f831cb21138f6168e46fe582fe256c35cc656ce python-traitlets-4.3.2.tar.gz

Please also add md5 from https://pypi.python.org/pypi/traitlets/json.

> diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
> new file mode 100644
> index 0000000..45f393d
> --- /dev/null
> +++ b/package/python-traitlets/python-traitlets.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-traitlets
> +#
> +################################################################################
> +
> +PYTHON_TRAITLETS_VERSION = 4.3.2
> +PYTHON_TRAITLETS_SOURCE = python-traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
> +PYTHON_TRAITLETS_SITE = $(call github,ipython,traitlets,$(PYTHON_TRAITLETS_VERSION))

Please use the tarball from https://pypi.python.org/pypi/traitlets/json.

And add an entry to the DEVELOPERS file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
