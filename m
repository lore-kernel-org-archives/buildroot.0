From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 18:40:56 +0200
Subject: [Buildroot] [PATCH 1/1] python-ipy: new package
In-Reply-To: <1380318149-22696-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1380318149-22696-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <524AFB18.1000203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/13 23:42, Matt Weber wrote:
>
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
>   package/Config.in                |    1 +
>   package/python-ipy/Config.in     |    8 ++++++++
>   package/python-ipy/python-ipy.mk |   30 ++++++++++++++++++++++++++++++
>   3 files changed, 39 insertions(+), 0 deletions(-)
>   create mode 100644 package/python-ipy/Config.in
>   create mode 100644 package/python-ipy/python-ipy.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index c6ea66b..2d05560 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -389,6 +389,7 @@ source "package/python-bottle/Config.in"
>   source "package/python-crc16/Config.in"
>   source "package/python-dpkt/Config.in"
>   source "package/python-id3/Config.in"
> +source "package/python-ipy/Config.in"
>   source "package/python-mad/Config.in"
>   source "package/python-meld3/Config.in"
>   source "package/python-netifaces/Config.in"
> diff --git a/package/python-ipy/Config.in b/package/python-ipy/Config.in
> new file mode 100644
> index 0000000..bead932
> --- /dev/null
> +++ b/package/python-ipy/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_IPY
> +	bool "python-ipy"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +	  IPy - class and tools for handling of IPv4 and
> +	  IPv6 addresses and networks.
> +
> +	  https://github.com/haypo/python-ipy/
> diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
> new file mode 100644
> index 0000000..9e09762
> --- /dev/null
> +++ b/package/python-ipy/python-ipy.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# python-ipy
> +#
> +################################################################################
> +
> +PYTHON_IPY_VERSION = 0.75-0-g58006fb
> +PYTHON_IPY_SOURCE  = haypo-python-ipy-IPy-$(PYTHON_IPY_VERSION).tar.gz
> +PYTHON_IPY_SITE    = https://github.com/haypo/python-ipy/tarball/IPy-0.75
> +PYTHON_IPY_DEPENDENCIES = host-python python
> +PYTHON_IPY_LICENSE = BSD-3c
> +PYTHON_IPY_LICENSE_FILES = COPYING
> +
> +define PYTHON_IPY_BUILD_CMDS
> +	(cd $(@D); \
> +		CC="$(TARGET_CC)" \
> +		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
> +		LDSHARED="$(TARGET_CC) -shared" \
> +		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \

  The -I and -L shouldn't be needed - if they are, something else must be 
wrong...

  I realize the other python packages don't do it, but why not use 
TARGET_CONFIGURE_OPTS?

  Regards,
  Arnout

> +		$(HOST_DIR)/usr/bin/python setup.py build_ext \
> +		--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
> +	)
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> +endef
> +
> +define PYTHON_IPY_INSTALL_TARGET_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef
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
