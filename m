From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sat, 26 Oct 2013 01:09:39 +0200
Subject: [Buildroot] [PATCH 1/1] Package python-pyusb added.
In-Reply-To: <1382742325-11435-1-git-send-email-wzab01@gmail.com>
References: <1382742325-11435-1-git-send-email-wzab01@gmail.com>
Message-ID: <CAMduVEegwCNSu2cBGbTOjUhBUtD5kv1F14eViyj+y9M29wwngQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ooops, sorry, I have sent not-edited version...


On Sat, Oct 26, 2013 at 1:05 AM, Wojciech M. Zabolotny <wzab01@gmail.com> wrote:
> Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-pyusb/Config.in       | 10 ++++++++++
>  package/python-pyusb/python-pyusb.mk | 37 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 package/python-pyusb/Config.in
>  create mode 100644 package/python-pyusb/python-pyusb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 0e6f86c..40dba0c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -400,6 +400,7 @@ source "package/python-protobuf/Config.in"
>  source "package/python-pygame/Config.in"
>  source "package/python-pyparsing/Config.in"
>  source "package/python-pyro/Config.in"
> +source "package/python-pyusb/Config.in"
>  source "package/python-pyzmq/Config.in"
>  source "package/python-serial/Config.in"
>  source "package/python-setuptools/Config.in"
> diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
> new file mode 100644
> index 0000000..3a1242a
> --- /dev/null
> +++ b/package/python-pyusb/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_PYUSB
> +       bool "python-pyusb"
> +       depends on BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_LIBUSB
> +       help
> +         The PyUSB module provides for Python easy access to the host
> +         machine's Universal Serial Bus (USB) system.
> +
> +         http://sourceforge.net/apps/trac/pyusb/
> +
> diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
> new file mode 100644
> index 0000000..80609af
> --- /dev/null
> +++ b/package/python-pyusb/python-pyusb.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# python-pyusb
> +#
> +################################################################################
> +
> +PYTHON_PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
> +PYTHON_PYUSB_SITE = http://github.com/walac/pyusb/tarball/$(PYTHON_PYUSB_VERSION)
> +PYTHON_PYUSB_LICENSE = BSD-3c
> +PYTHON_PYUSB_LICENSE_FILES = LICENSE
> +
> +PYTHON_PYUSB_DEPENDENCIES = python libusb
> +
> +# Copied from python-pyparsing, based on python-pygame
> +define PYTHON_PYUSB_BUILD_CMDS
> +       (cd $(@D);                                              \
> +        CC="$(TARGET_CC)"                                      \
> +        CFLAGS="$(TARGET_CFLAGS)"                              \
> +        LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
> +        CROSS_COMPILING=yes                                    \
> +        _python_sysroot=$(STAGING_DIR)                         \
> +        _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
> +        _python_prefix=/usr                                    \
> +        _python_exec_prefix=/usr                               \
> +        $(HOST_DIR)/usr/bin/python setup.py build              \
> +       )
> +endef
> +
> +# Copied from python-pyparsing, based on python-pygame
> +define PYTHON_PYUSB_INSTALL_TARGET_CMDS
> +       (cd $(@D);                                              \
> +        $(HOST_DIR)/usr/bin/python setup.py install            \
> +                                   --prefix=$(TARGET_DIR)/usr  \
> +       )
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.8.4.rc3
>
