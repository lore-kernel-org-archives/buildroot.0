From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:56:47 +0200
Subject: [Buildroot] [PATCH v5] python-pyxml: new package
In-Reply-To: <1423083501-3477-1-git-send-email-yegorslists@googlemail.com>
References: <1423083501-3477-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150427235647.2a9770b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed,  4 Feb 2015 21:58:21 +0100, Yegor Yefremov wrote:

> diff --git a/package/Config.in b/package/Config.in
> index fe3d3d0..581bc56 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -561,6 +561,7 @@ menu "external python modules"
>  	source "package/python-pysnmp-mibs/Config.in"
>  	source "package/python-pyusb/Config.in"
>  	source "package/python-pyxb/Config.in"
> ++	source "package/python-pyxml/Config.in"

This seems weird, why are there two '+' signs here?

>  	source "package/python-pyzmq/Config.in"
>  	source "package/python-requests/Config.in"
>  	source "package/python-rtslib-fb/Config.in"
> diff --git a/package/python-pyxml/Config.in b/package/python-pyxml/Config.in
> new file mode 100644
> index 0000000..420f3ad
> --- /dev/null
> +++ b/package/python-pyxml/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PYXML
> +	bool "python-pyxml"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +	  This is the Python XML package.  The distribution contains a
> +	  validating XML parser, an implementation of the SAX and DOM
> +	  programming interfaces, an interface to the Expat parser (and the
> +	  Expat parser itself), and a C helper module that can speed up
> +	  xmllib.py by a factor of 5.  There's even documentation!
> +
> +	  http://pyxml.sourceforge.net/topics/index.html
> diff --git a/package/python-pyxml/python-xml.hash b/package/python-pyxml/python-xml.hash
> new file mode 100644
> index 0000000..47fa4c1
> --- /dev/null
> +++ b/package/python-pyxml/python-xml.hash
> @@ -0,0 +1,2 @@
> +#Locally computed

Nit: space between # and Locally.

> +sha256 9fab66f9584fb8e67aebd8745a5c97bf1c5a2e2e461adf68862bcec64e448c13  PyXML-0.8.4.tar.gz
> diff --git a/package/python-pyxml/python-xml.mk b/package/python-pyxml/python-xml.mk
> new file mode 100644
> index 0000000..59bdc06
> --- /dev/null
> +++ b/package/python-pyxml/python-xml.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# python-pyxml
> +#
> +################################################################################
> +
> +PYTHON_PYXML_VERSION = 0.8.4
> +PYTHON_PYXML_SOURCE  = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
> +PYTHON_PYXML_SITE    = http://downloads.sourceforge.net/project/pyxml/pyxml/0.8.4/

Please don't align '=' signs. I know we used to do it years ago, but
we've stopped doing that, and fixed this all over the tree.

> +PYTHON_PYXML_LICENSE = BSD-3c
> +PYTHON_PYXML_LICENSE_FILES = LICENSE
> +PYTHON_PYXML_SETUP_TYPE = distutils
> +PYTHON_PYXML_DEPENDENCIES = host-python python expat

host-python and python not needed here, the python-package
infrastructure takes care of that.

> +PYTHON_PYXML_INSTALL_STAGING = NO

Why?

> +
> +define PYTHON_PYXML_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(HOST_DIR)/usr/bin/python setup.py \
> +		config --with-libexpat=$(STAGING_DIR)/usr)
> +endef

Since this is a bit unconventional, it would be good to have a comment
above to explain why there is a configure step.

> +
> +HOST_PYTHON_PYXML_DEPENDENCIES = host-python host-expat
> +
> +define HOST_PYTHON_PYXML_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(HOST_DIR)/usr/bin/python setup.py \
> +		config --with-libexpat=$(HOST_DIR)/usr)
> +endef
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))

Why do we want host-python-pyxml? What other package is using it?
Please mention that in the commit log at least.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
