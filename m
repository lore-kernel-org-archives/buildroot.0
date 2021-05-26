From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 May 2021 22:10:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pymupdf: new package.
In-Reply-To: <20200207093705.32687-3-raphael.melotte@essensium.com>
References: <20200207093705.32687-1-raphael.melotte@essensium.com>
 <20200207093705.32687-3-raphael.melotte@essensium.com>
Message-ID: <35bbf68f-af88-52ee-c803-262d2b9f4bf9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Applied to next, again with changes.

On 07/02/2020 10:37, Rapha?l M?lotte wrote:
> Python bindings for the PDF rendering library MuPDF.
> 
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-pymupdf/Config.in           | 12 +++++++++++
>  package/python-pymupdf/python-pymupdf.hash |  3 +++
>  package/python-pymupdf/python-pymupdf.mk   | 25 ++++++++++++++++++++++
>  5 files changed, 42 insertions(+)
>  create mode 100644 package/python-pymupdf/Config.in
>  create mode 100644 package/python-pymupdf/python-pymupdf.hash
>  create mode 100644 package/python-pymupdf/python-pymupdf.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9c527c3625..0c67165f4a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1931,6 +1931,7 @@ F:	package/paho-mqtt-cpp/
>  N:	Rapha?l M?lotte <raphael.melotte@essensium.com>
>  F:	package/jbig2dec/
>  F:	package/mupdf/
> +F:  package/python-pymupdf/

 This should have been a tab.


>  N:	R?mi R?rolle <remi.rerolle@gmail.com>
>  F:	package/libfreeimage/
> diff --git a/package/Config.in b/package/Config.in
> index df29673221..ffe1013e82 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1013,6 +1013,7 @@ menu "External python modules"
>  	source "package/python-pylibftdi/Config.in"
>  	source "package/python-pylru/Config.in"
>  	source "package/python-pymodbus/Config.in"
> +	source "package/python-pymupdf/Config.in"
>  	source "package/python-pymysql/Config.in"
>  	source "package/python-pynacl/Config.in"
>  	source "package/python-pyopenssl/Config.in"
> diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
> new file mode 100644
> index 0000000000..2d95423e95
> --- /dev/null
> +++ b/package/python-pymupdf/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PYTHON_PYMUPDF
> +	bool "python-pymupdf"
> +	depends on BR2_PACKAGE_XORG7

 Again, harfbuzz dependencies need to be propagated.

> +	select BR2_PACKAGE_MUPDF
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Python bindings for the PDF rendering library MuPDF.
> +
> +	  https://github.com/pymupdf/PyMuPDF
> +
> +comment "python-pymupdf needs Xorg"
> +	depends on !BR2_PACKAGE_XORG7
> diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
> new file mode 100644
> index 0000000000..6729c6b91b
> --- /dev/null
> +++ b/package/python-pymupdf/python-pymupdf.hash
> @@ -0,0 +1,3 @@
> +# md5, sha256 from https://pypi.org/pypi/pymupdf/json
> +md5	0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
> +sha256	1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  python-pymupdf-1.16.0.tar.gz
> diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
> new file mode 100644
> index 0000000000..e0f03dc2cf
> --- /dev/null
> +++ b/package/python-pymupdf/python-pymupdf.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# python-pymupdf
> +#
> +################################################################################
> +
> +PYTHON_PYMUPDF_VERSION = 1.16.0
> +# python-pymupdf's version must match exactly mupdf's version

 I've added a similar comment to mupdf itself.

> +PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
> +PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/d2/da/692102b6e6868a57d1dc7f98d07413116a02493b3b49a798dcd6f676d368
> +PYTHON_PYMUPDF_SETUP_TYPE = distutils
> +PYTHON_PYMUPDF_LICENSE = GPL-3.0

 Actually, it's also AGPL-3.0+, because the swig-generated files are under the
mupdf license as well. This is explained in the README on github.

 I also added a comment about the lack of license files.

> +PYTHON_PYMUPDF_DEPENDENCIES = mupdf zlib
> +
> +PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf"
> +
> +# We need to remove the original paths as we provide them in the CFLAGS:
> +define PYTHON_PYMUPDF_REMOVE_PATHS
> +	sed -i "s:\/usr\/include\/mupdf::g" $(@D)/setup.py
> +	sed -i "s:\/usr\/local\/include\/mupdf::g" $(@D)/setup.py
> +endef
> +
> +PYTHON_PYMUPDF_POST_PATCH_HOOKS = PYTHON_PYMUPDF_REMOVE_PATHS

 See, you *knew* that it had to be post-patch :-)

 Regards,
 Arnout

> +
> +$(eval $(python-package))
> 
