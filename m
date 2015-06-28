From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 22:39:29 +0200
Subject: [Buildroot] [PATCH 3/3] python-magic: new package
In-Reply-To: <1434362765-1074-4-git-send-email-denis.thulin@openwide.fr>
References: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
 <1434362765-1074-4-git-send-email-denis.thulin@openwide.fr>
Message-ID: <20150628223929.1c9bbf68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Denis,

On Mon, 15 Jun 2015 12:06:05 +0200, Denis THULIN wrote:

> diff --git a/package/python-magic/Config.in b/package/python-magic/Config.in
> new file mode 100644
> index 0000000..e6c06b9
> --- /dev/null
> +++ b/package/python-magic/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_MAGIC
> +	depends on BR2_PACKAGE_PYTHON

According to https://pypi.python.org/pypi/python-magic and my own
tests, it seems that python-magic works with Python 3, so this
dependency is not needed.

However, you're missing the runtime dependency on libmagic, which is
provided in Buildroot with the file package. Indeed python-magic is
just a small wrapper around the libmagic C library: all what
python-magic does is open/use libmagic through the ctypes module.

So, you need something like:

> +	bool "python-magic"

	# libmagic is needed at runtime
	select BR2_PACKAGE_FILE

However, even with that, python-magic unfortunately does not work: it
uses ctypes.util.find_library() to find libmagic, and this function
doesn't seem to behave properly in a cross-compilation context (it
tries to use gcc/objdump on the target, which are obviously not
available). So maybe patching Python is needed here.

> diff --git a/package/python-magic/python-magic.hash b/package/python-magic/python-magic.hash
> new file mode 100644
> index 0000000..36ffd02
> --- /dev/null
> +++ b/package/python-magic/python-magic.hash
> @@ -0,0 +1,2 @@
> +# sha356 calculated by scanpypi
> +sha356	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855  python-magic-0.4.6.tar.gz

This hash didn't work for me. And Pypi provides a md5. So your .hash
file should be:

# md5 from https://pypi.python.org/pypi/python-magic
md5 07e7a0fea78dd81ed609414c3484df58 python-magic-0.4.6.tar.gz
# sha256 calculated by scanpypi
sha256 903d3d3c676e2b1244892954e2bbbe27871a633385a9bfe81f1a81a7032df2fe python-magic-0.4.6.tar.gz

> diff --git a/package/python-magic/python-magic.mk b/package/python-magic/python-magic.mk
> new file mode 100644
> index 0000000..fad3056
> --- /dev/null
> +++ b/package/python-magic/python-magic.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-magic
> +#
> +################################################################################
> +
> +PYTHON_MAGIC_VERSION = 0.4.6
> +PYTHON_MAGIC_SOURCE = python-magic-$(PYTHON_MAGIC_VERSION).tar.gz
> +PYTHON_MAGIC_SITE = https://pypi.python.org/packages/source/p/python-magic/
> +PYTHON_MAGIC_SETUP_TYPE = setuptools
> +PYTHON_MAGIC_LICENSE = PSF
> +PYTHON_MAGIC_LICENSE_FILES =

Empty variables are quite useless, so you get rid of
PYTHON_MAGIC_LICENSE_FILES entirely.

I'll mark your patch as Changes Requested in patchwork, so could you
resend an updated version with the above issues fixed?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
