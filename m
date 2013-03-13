From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 21:35:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-thrift: new package
In-Reply-To: <1363185808-14279-1-git-send-email-viniciustinti@gmail.com>
References: <1363185808-14279-1-git-send-email-viniciustinti@gmail.com>
Message-ID: <5140E302.4020500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/13 15:43, Vinicius Tinti wrote:
> Add Python bindings for the Apache Thrift RPC.
>
> Thrift is an interface definition language that is used to define and create
> services for numerous languages using remote procedure calls (RPC).
>
> This patch does not include the Thrift code generator. It only includes the
> Thrift libraries used at runtime.
>
> Signed-off-by: Tiago Maluta <tiagomaluta@gmail.com>
> Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>

  When you post a v2 of a patch, it is nice if you can add a changelog 
below your signed-off-by line (separated by ---).

> ---
>   package/Config.in                      |    1 +
>   package/python-thrift/Config.in        |    7 +++++++
>   package/python-thrift/python-thrift.mk |   23 +++++++++++++++++++++++
>   3 files changed, 31 insertions(+)
>   create mode 100644 package/python-thrift/Config.in
>   create mode 100644 package/python-thrift/python-thrift.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a65054c..8467735 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -334,6 +334,7 @@ source "package/python-pygame/Config.in"
>   source "package/python-pyparsing/Config.in"
>   source "package/python-serial/Config.in"
>   source "package/python-setuptools/Config.in"
> +source "package/python-thrift/Config.in"
>   endmenu
>   endif
>   source "package/ruby/Config.in"
> diff --git a/package/python-thrift/Config.in b/package/python-thrift/Config.in
> new file mode 100644
> index 0000000..f4ad4ba
> --- /dev/null
> +++ b/package/python-thrift/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_THRIFT
> +	bool "python-thrift"
> +	help
> +	  python-thrift is a Python bindings for the Apache Thrift RPC system.
> +
> +	  http://thrift.apache.org/
> +

  Redundant empty line at end of file.

> diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
> new file mode 100644
> index 0000000..40ae57b
> --- /dev/null
> +++ b/package/python-thrift/python-thrift.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# python-thrift
> +#
> +#############################################################
> +
> +PYTHON_THRIFT_VERSION = 0.9.0
> +PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz

  This is the default, so can be removed.

> +PYTHON_THRIFT_SITE = https://pypi.python.org/packages/source/t/thrift/
> +PYTHON_THRIFT_LICENSE = Apache v2.0

  We currently have Apache-v2 (ImageMagick), Apache-2.0 (lua-msgpack) and 
Apache v2.0 (zxing). I personally prefer Apache-2.0.


> +PYTHON_THRIFT_LICENSE_FILES = README
> +
> +PYTHON_THRIFT_DEPENDENCIES = python
> +
> +define PYTHON_THRIFT_BUILD_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> +endef
> +
> +define PYTHON_THRIFT_INSTALL_TARGET_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef

  Unfortunately, installation fails when host-python-distutilscross has 
been installed already (by python-protobuf or python-netifaces).


------
running install
Checking .pth file support in $(TARGET_DIR)/usr/lib/python2.7/site-packages/
$(HOST_DIR)/usr/bin/python -E -c pass
TEST FAILED: $(TARGET_DIR)/usr/lib/python2.7/site-packages/ does NOT 
support .pth files
error: bad install directory or PYTHONPATH

You are attempting to install a package to a directory that is not
on PYTHONPATH and which Python does not read ".pth" files from.  The
installation directory you specified (via --install-dir, --prefix, or
the distutils default setting) was:

     $(TARGET_DIR)/usr/lib/python2.7/site-packages/
------

  What happens is very clear: we're installing using the host-python, 
which doesn't look at TARGET_DIR to load packages. I would expect that 
distutilscross knows how to deal with that, but haven't found how...

  Regards,
  Arnout

> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
