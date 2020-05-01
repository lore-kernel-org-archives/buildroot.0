From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 14:37:15 +0200
Subject: [Buildroot] [PATCH v8 1/5] package/python-numpy: Bump to
 version 1.18.2
In-Reply-To: <20200407111515.21131-2-jagan@amarulasolutions.com>
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
 <20200407111515.21131-2-jagan@amarulasolutions.com>
Message-ID: <20200501143715.316f5bb5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after doing some fixes. See below.

On Tue,  7 Apr 2020 16:45:11 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> Bump the python-numpy version to 1.18.2, this version
> of python-numpy will support python3 only, not python2.

Why "will" ? It does only support Python 3, today.

Also, you forgot to explain why host-python-cython was needed.

I've reworded the commit log to fix those details.

> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index 41d4619f72..ab5b79e3e5 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -13,7 +13,7 @@ GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  # host-python-mako and host-python-six are needed for volk to compile
>  GNURADIO_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
> +	host-python3 \

This wasn't good. Indeed, gnuradio, when its python support is not
enabled, can still build with host-python.

It would in fact not even use host-python3 here if BR2_PACKAGE_PYTHON=y.

So I simply dropped this line.


> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index 5b9ee5803b..507d52c4d8 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  
>  config BR2_PACKAGE_PYTHON_NUMPY
>  	bool "python-numpy"
> +	depends on BR2_PACKAGE_PYTHON3

You forgot to propagate this dependency to the Config.in comment in the
same file, so I fixed that.

> +PYTHON_NUMPY_DEPENDENCIES += host-python-cython
> +HOST_PYTHON_NUMPY_DEPENDENCIES += host-python-cython

= signs were enough here.

Applied with those various issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
