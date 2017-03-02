From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 2 Mar 2017 09:29:33 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-pylibftdi: new package
In-Reply-To: <1488385119-14452-1-git-send-email-christian.kellermann@solectrix.de>
References: <20170301153428.00513b95@free-electrons.com>
 <1488385119-14452-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <CAGm1_ktiGDPvU4kyuBy8caOPQMfDcib1hk_8kgFkvd+C1a0OkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 1, 2017 at 5:18 PM, Christian Kellermann
<christian.kellermann@solectrix.de> wrote:
> Adds the python binding for libftdi to buildroot.
>
> Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Changes:
>
> v2 -> v3:
>   - Style fixes
>   - Patch description added
>   - added myself to DEVELOPERS
>
> v1 -> v2:
>   - Formatting
>   - Removed unneeded dependency
>   - Use setuptools as SETUP_TYPE
> ---
>  DEVELOPERS                                         |  3 +++
>  package/Config.in                                  |  1 +
>  .../0001-do-not-use-find-library.patch             | 31 ++++++++++++++++++++++
>  package/python-pylibftdi/Config.in                 | 11 ++++++++
>  package/python-pylibftdi/python-libftdi.hash       |  3 +++
>  package/python-pylibftdi/python-libftdi.mk         | 15 +++++++++++
>  6 files changed, 64 insertions(+)
>  create mode 100644 package/python-pylibftdi/0001-do-not-use-find-library.patch
>  create mode 100644 package/python-pylibftdi/Config.in
>  create mode 100644 package/python-pylibftdi/python-libftdi.hash
>  create mode 100644 package/python-pylibftdi/python-libftdi.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 09a0a6e..8cb2b5a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -305,6 +305,9 @@ F:  package/micropython/
>  F:     package/micropython-lib/
>  F:     package/syslog-ng/
>
> +N:     Christian Kellermann <christian.kellermann@solectrix.de>
> +F:     package/python-pylibftdi/
> +
>  N:     Christian Stewart <christian@paral.in>
>  F:     linux/linux-ext-aufs.mk
>  F:     package/aufs/
> diff --git a/package/Config.in b/package/Config.in
> index 26893e5..8248331 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -769,6 +769,7 @@ menu "External python modules"
>         source "package/python-pygments/Config.in"
>         source "package/python-pyicu/Config.in"
>         source "package/python-pyinotify/Config.in"
> +       source "package/python-pylibftdi/Config.in"
>         source "package/python-pylru/Config.in"
>         source "package/python-pymysql/Config.in"
>         source "package/python-pynacl/Config.in"
> diff --git a/package/python-pylibftdi/0001-do-not-use-find-library.patch b/package/python-pylibftdi/0001-do-not-use-find-library.patch
> new file mode 100644
> index 0000000..ae8fe2d
> --- /dev/null
> +++ b/package/python-pylibftdi/0001-do-not-use-find-library.patch
> @@ -0,0 +1,31 @@
> +Hard code library loading
> +
> +Shortcut the search for the libraries in case the built in
> +find_library is broken.
> +
> +As buildroot does not ship any of the external programs that the core
> +procedure use to find libraries use the canonical name of the shared
> +object and load it.
> +
> +In this case this affects loading libftdi and libusb.
> +
> +This should be reliable as we specify said libs as dependencies of
> +this package.
> +
> +Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
> +
> +---
> +diff -purN pylibftdi-0.15.0.orig/pylibftdi/driver.py pylibftdi-0.15.0/pylibftdi/driver.py
> +--- pylibftdi-0.15.0.orig/pylibftdi/driver.py  2015-04-26 22:41:39.000000000 +0200
> ++++ pylibftdi-0.15.0/pylibftdi/driver.py       2017-02-27 13:08:56.502958000 +0100
> +@@ -121,8 +121,8 @@ class Driver(object):
> +                     lib = getattr(cdll, lib_path)
> +                     break
> +         if lib is None:
> +-            raise LibraryMissingError('{} library not found (search: {})'.format(
> +-                name, search_list))
> ++              return cdll.LoadLibrary(name + '.so')
> ++
> +         return lib
> +
> +     @property
> diff --git a/package/python-pylibftdi/Config.in b/package/python-pylibftdi/Config.in
> new file mode 100644
> index 0000000..f829071
> --- /dev/null
> +++ b/package/python-pylibftdi/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PYLIBFTDI
> +       bool "python-pylibftdi"
> +       select BR2_PACKAGE_LIBFTDI
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +       help
> +         This package contains the python language binding libftdi.
> +
> +         https://pypi.python.org/pypi/pylibftdi
> +
> +comment "python-pylibftdi needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/python-pylibftdi/python-libftdi.hash b/package/python-pylibftdi/python-libftdi.hash
> new file mode 100644
> index 0000000..54b33a1
> --- /dev/null
> +++ b/package/python-pylibftdi/python-libftdi.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/pylibftdi/json, sha256 locally computed
> +md5  eaee7fb3a67f33a35a164a9628daaafe pylibftdi-0.15.0.tar.gz
> +sha256  51ef08ebcc4ec3eaec2366e9648d3f8fa1b737ea507a7f3a374ac58abf148e77 pylibftdi-0.15.0.tar.gz
> diff --git a/package/python-pylibftdi/python-libftdi.mk b/package/python-pylibftdi/python-libftdi.mk
> new file mode 100644
> index 0000000..b375abb
> --- /dev/null
> +++ b/package/python-pylibftdi/python-libftdi.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-libftdi
> +#
> +################################################################################
> +
> +PYTHON_PYLIBFTDI_VERSION = 0.15.0
> +PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
> +PYTHON_PYLIBFTDI_SITE = https://pypi.python.org/packages/e5/bb/d7a86dbd7685e3866ea75d21c6c726d01706fdc0aa5dc9051ce18ae65693
> +PYTHON_PYLIBFTDI_LICENSE = MIT
> +PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
> +PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
> +PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
