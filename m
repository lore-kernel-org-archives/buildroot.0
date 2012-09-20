From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 22:34:39 +0200
Subject: [Buildroot] [PATCHv2][RESEND] python-protobuf: Add support for
 Python implementation of Google's Protocol Buffers
In-Reply-To: <20120917105103.GA17573@localhost.comm5.com.br>
References: <20120917105103.GA17573@localhost.comm5.com.br>
Message-ID: <20120920223439.6480353a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thiago A. Correa,

On Mon, 17 Sep 2012 07:51:03 -0300, Thiago A. Correa wrote:
> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
> ---
>  package/Config.in                          |    1 +
>  package/python-protobuf/Config.in          |   11 +++++++++++
>  package/python-protobuf/python-protobuf.mk |   28 ++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 0 deletions(-)
>  create mode 100644 package/python-protobuf/Config.in
>  create mode 100644 package/python-protobuf/python-protobuf.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e129522..3aff270 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -276,6 +276,7 @@ source "package/python-mad/Config.in"
>  source "package/python-meld3/Config.in"
>  source "package/python-netifaces/Config.in"
>  source "package/python-nfc/Config.in"
> +source "package/python-protobuf/Config.in"
>  source "package/python-pygame/Config.in"
>  source "package/python-serial/Config.in"
>  source "package/python-setuptools/Config.in"
> diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
> new file mode 100644
> index 0000000..d2bf70d
> --- /dev/null
> +++ b/package/python-protobuf/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PROTOBUF
> +	bool "python-protobuf"
> +	depends on BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS

Is this select really needed? python-setuptools for the target is not
amongst the dependencies of your package. It seems you only need
host-python-setuptools, in which case this select is not necessary.

> +	help
> +	  Python implementation of the Google Protocol Buffers.
> +
> +	  Protocol buffers are Google's language-neutral, platform-neutral,
> +	  extensible mechanism for serializing structured data.
> +
> +	  http://code.google.com/p/protobuf/
> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> new file mode 100644
> index 0000000..d632e00
> --- /dev/null
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -0,0 +1,28 @@
> +#############################################################
> +#
> +# python-protobuf
> +#
> +#############################################################
> +
> +PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> +PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
> +PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)

So the source tarball is the same? So what you're doing here in fact is
having two separate Buildroot packages for the same source tarball,
something that we generally don't do. But in this case, it seems like
logical to do it this way.

What do others think about this strategy?

> +PYTHON_PROTOBUF_LICENSE = BSD-3c
> +PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
> +
> +PYTHON_PROTOBUF_DEPENDENCIES = python host-python-setuptools host-python-distutilscross host-protobuf

Using \ to cut the line width would be nice.

> +define PYTHON_PROTOBUF_BUILD_CMDS
> +	(cd $(@D)/python; \
> +		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
> +		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \

And you sure those LDFLAGS are necessary? Our cross-compiler already
has its sysroot set so that it finds libraries in the staging directory.

> +		PATH=$(HOST_PATH) \
> +	$(HOST_DIR)/usr/bin/python setup.py build -x)
> +endef
> +
> +define PYTHON_PROTOBUF_INSTALL_TARGET_CMDS
> +	(cd $(@D)/python; PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(generic-package))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
