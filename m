From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 13 Dec 2017 10:05:40 +0100
Subject: [Buildroot] [PATCH 4/4] python-keyring: bump to version 10.5.0
In-Reply-To: <20171213090424.11172-4-yegorslists@googlemail.com>
References: <20171213090424.11172-1-yegorslists@googlemail.com>
 <20171213090424.11172-4-yegorslists@googlemail.com>
Message-ID: <CAGm1_ktZELWBk0yJNOG3+SuX+Jqx9QMmX_z4oox10C5cj7HxSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 13, 2017 at 10:04 AM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Fix licence information and add licence checksum.

Forgot to add

Fixes:
http://autobuild.buildroot.net/results/f7322f19303daa3d403f2c0f13379d947431300d/

Yegor

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-keyring/Config.in           |  6 +++++-
>  package/python-keyring/python-keyring.hash |  6 ++++--
>  package/python-keyring/python-keyring.mk   | 16 ++++++----------
>  3 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
> index a6eacf52a5..23d86a4822 100644
> --- a/package/python-keyring/Config.in
> +++ b/package/python-keyring/Config.in
> @@ -1,8 +1,12 @@
>  config BR2_PACKAGE_PYTHON_KEYRING
>         bool "python-keyring"
> -       depends on BR2_PACKAGE_PYTHON
> +       depends on BR2_INSTALL_LIBSTDCPP # python-secretstorage
> +       select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
>         help
>           The Python keyring lib provides a easy way to access the
>           system keyring service from Python.
>
>           https://pypi.python.org/pypi/keyring
> +
> +comment "python-keyring needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
> index cd1683a7d1..a57419039e 100644
> --- a/package/python-keyring/python-keyring.hash
> +++ b/package/python-keyring/python-keyring.hash
> @@ -1,2 +1,4 @@
> -# locally computed
> -sha256  c3f0665ee2d969170dcd6b9e83e76cc7fca2be5a40943700ce2624a0a02f9658  keyring-3.0.5.zip
> +# md5 from https://pypi.python.org/pypi/keyring/json, sha256 locally computed
> +md5    9c53e4f2427ebaa59d304a826311fbcf  keyring-10.5.0.tar.gz
> +sha256 0e6129e8c5bc80da34cc1942d30daad79ed40419fcaaa538278c3b2ff235b313  keyring-10.5.0.tar.gz
> +sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
> diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
> index c1ac15f28b..27db2802ed 100644
> --- a/package/python-keyring/python-keyring.mk
> +++ b/package/python-keyring/python-keyring.mk
> @@ -4,16 +4,12 @@
>  #
>  ################################################################################
>
> -PYTHON_KEYRING_VERSION = 3.0.5
> -PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).zip
> -PYTHON_KEYRING_SITE = https://pypi.python.org/packages/source/k/keyring
> +PYTHON_KEYRING_VERSION = 10.5.0
> +PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
> +PYTHON_KEYRING_SITE = https://pypi.python.org/packages/42/2e/51bd1739fe335095a2174db3f2f230346762e7e572471059540146a521f6
>  PYTHON_KEYRING_SETUP_TYPE = setuptools
> -PYTHON_KEYRING_LICENSE = python software foundation license
> -
> -define PYTHON_KEYRING_EXTRACT_CMDS
> -       $(UNZIP) -d $(@D) $(DL_DIR)/$(PYTHON_KEYRING_SOURCE)
> -       mv $(@D)/keyring-$(PYTHON_KEYRING_VERSION)/* $(@D)
> -       $(RM) -r $(@D)/keyring-$(PYTHON_KEYRING_VERSION)
> -endef
> +PYTHON_KEYRING_LICENSE = MIT
> +PYTHON_KEYRING_LICENSE_FILES = LICENSE
> +PYTHON_KEYRING_DEPENDENCIES = host-python-setuptools-scm
>
>  $(eval $(python-package))
> --
> 2.11.0
>
