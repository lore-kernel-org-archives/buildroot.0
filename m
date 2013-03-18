From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Mar 2013 07:57:28 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-thrift: new package
In-Reply-To: <1363297640-2321-1-git-send-email-viniciustinti@gmail.com>
References: <CALD9WKwqdDxRH5ZSQfLMeuj=C7JTGsseQZUEYRXoRhik32ab2w@mail.gmail.com>
 <1363297640-2321-1-git-send-email-viniciustinti@gmail.com>
Message-ID: <5146BAD8.90208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/13 22:47, Vinicius Tinti wrote:
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

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Still some remarks below, up to Peter to decide if they need to be 
fixed before committing.

[snip]
> diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
> new file mode 100644
> index 0000000..5d9831e
> --- /dev/null
> +++ b/package/python-thrift/python-thrift.mk
> @@ -0,0 +1,27 @@
> +#############################################################
> +#
> +# python-thrift
> +#
> +#############################################################
> +
> +PYTHON_THRIFT_VERSION = 0.9.0
> +PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz

  Redundant.

> +PYTHON_THRIFT_SITE = https://pypi.python.org/packages/source/t/thrift/

  Should be http rather than https, and the final / is redundant.

> +PYTHON_THRIFT_LICENSE = Apache-2.0
> +PYTHON_THRIFT_LICENSE_FILES = README
> +
> +PYTHON_THRIFT_DEPENDENCIES = python
> +
> +define PYTHON_THRIFT_BUILD_CMDS
> +	(cd $(@D); \
> +		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
> +		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
> +	$(HOST_DIR)/usr/bin/python setup.py build)

  This should be indented one tab more.

> +endef
> +

  Missing comment:

# host-distutilscross, if it has been installed before, will check that
# the installation directory is in python's load path. For host-python,
# it is not, so add it explicitly while installing to target.
> +define PYTHON_THRIFT_INSTALL_TARGET_CMDS
> +	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(generic-package))
>


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
