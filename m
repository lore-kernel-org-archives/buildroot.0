From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 23:53:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-augeas: new package
In-Reply-To: <20210621203456.361929-1-thomas.petazzoni@bootlin.com>
References: <20210621203456.361929-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210624215353.GI2852@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 22:34 +0200, Thomas Petazzoni spake thusly:
> We backport an upstream patch that fixes the loading of the native
> library by the FFI logic. Without this, "import augeas" doesn't work
> as it goes into the ctypes.utils.find_library() logic that tries to
> use a compiler on the target to find the augeas native library.
> 
> Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

A new package with a runtime test? Applied to master, thanks.

[--SNIP--]
> diff --git a/package/python-augeas/python-augeas.mk b/package/python-augeas/python-augeas.mk
> new file mode 100644
> index 0000000000..7adaa84f49
> --- /dev/null
> +++ b/package/python-augeas/python-augeas.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# python-augeas
> +#
> +################################################################################
> +
> +PYTHON_AUGEAS_VERSION = 1.1.0
> +PYTHON_AUGEAS_SITE = $(call github,hercules-team,python-augeas,v$(PYTHON_AUGEAS_VERSION))
> +PYTHON_AUGEAS_SETUP_TYPE = setuptools
> +PYTHON_AUGEAS_LICENSE = LGPL-2.1+
> +PYTHON_AUGEAS_LICENSE_FILES = COPYING
> +PYTHON_AUGEAS_DEPENDENCIES = augeas host-python-cffi host-pkgconf
> +# This will tell python-augeas to not call xml2-config, and instead
> +# use pkg-config to find libxml2. libxml2 is an indirect dependency of
> +# augeas, which is why it's not in our dependencies. It's odd that
> +# python-augeas searches for libxml2, but that's what it
> +# does. Question asked in the pull request at
> +# https://github.com/hercules-team/python-augeas/pull/49.

They've now replied, and I am not sure I followed... Augeas' .pc does
not yield libxml2' CFLAGS, because it is a Requires.Private.

So, why does python-augeas need the CFLAGS from libxml2?

Anyway...

Regards,
Yann E. MORIN.

> +PYTHON_AUGEAS_ENV = XML2_CONFIG=/bin/false
> +
> +$(eval $(python-package))
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
