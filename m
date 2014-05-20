From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 09:44:50 +0200
Subject: [Buildroot] [PATCH 3/3] python: new module cffi
In-Reply-To: <1400550780-16669-3-git-send-email-oli.vogt.pub01@gmail.com>
References: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
 <1400550780-16669-3-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <20140520094450.2d8ba0e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear oli vogt,

On Tue, 20 May 2014 13:53:00 +1200, oli vogt wrote:
> Foreign Function Interface for Python calling C code.
> 
> Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>

Thanks also for this contribution. I'm wondering what's the difference
between this Python module and the standard 'ctypes' module at
https://docs.python.org/2/library/ctypes.html, which also uses libffi ?

Some other cmoments below.


> diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
> new file mode 100644
> index 0000000..7967e8a
> --- /dev/null
> +++ b/package/python-cffi/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_CFFI
> +	bool "python-cffi"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +	  This is the Foreign Function Interface for Python calling C code.
> +	  The aim of this project is to provide a convenient and
> +	  reliable way of calling C code from Python.
> +
> +	  Not tested with Python-3

It does seem to support Python 3, so it would be good to give it a
quick test and enable that possibility.

> +
> +	  https://pypi.python.org/pypi/cffi
> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
> new file mode 100644
> index 0000000..10bf535
> --- /dev/null
> +++ b/package/python-cffi/python-cffi.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-cffi
> +#
> +################################################################################
> +
> +PYTHON_CFFI_VERSION = 0.8.2
> +PYTHON_CFFI_SOURCE  = cffi-$(PYTHON_CFFI_VERSION).tar.gz
> +PYTHON_CFFI_SITE    = https://pypi.python.org/packages/source/c/cffi/
> +PYTHON_CFFI_SETUP_TYPE = setuptools
> +PYTHON_CFFI_LICENSE = MIT

You could add:

PYTHON_CFFI_LICENSE_FILES = LICENSE

Also, from a quick look at the setup.py, it seems to be used
pkg-config, so I believe you want to add 'host-pkgconf' to
PYTHON_CFFI_DEPENDENCIES. And isn't this Python module linked against
libffi? If that's the case, it should depend on the libffi package, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
