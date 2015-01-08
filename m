From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 23:06:39 +0100
Subject: [Buildroot] [PATCH v2 02/28] sepolgen: new package
In-Reply-To: <1420650663-49350-3-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420650663-49350-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150108230639.1f195b21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed,  7 Jan 2015 11:10:37 -0600, Matt Weber wrote:

> diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
> new file mode 100644
> index 0000000..f1e8898
> --- /dev/null
> +++ b/package/sepolgen/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SEPOLGEN
> +	bool "sepolgen"
> +	help
> +	  sepolgen is a python module/library that forms the core
> +	  of the modern audit2allow (a rewrite).
> +
> +	  http://selinuxproject.org/page/Main_Page

So we have a Config.in entry to enable a target package...

> diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
> new file mode 100644
> index 0000000..a377c66
> --- /dev/null
> +++ b/package/sepolgen/sepolgen.hash
> @@ -0,0 +1,2 @@
> +# https://github.com/SELinuxProject/selinux/wiki/Releases
> +sha256 8a1c6d3a78c9b6ad3555c74def555f65a62950bf21c111c585bfc382fec3a645  sepolgen-1.1.9.tar.gz
> diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
> new file mode 100644
> index 0000000..7c95866
> --- /dev/null
> +++ b/package/sepolgen/sepolgen.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# sepolgen
> +#
> +################################################################################
> +
> +SEPOLGEN_VERSION = 1.1.9
> +SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +SEPOLGEN_LICENSE = GPLv2
> +SEPOLGEN_LICENSE_FILES = COPYING
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_SEPOLGEN_DEPENDENCIES = host-python3
> +HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
> +	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> +else
> +HOST_SEPOLGEN_DEPENDENCIES = host-python
> +HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
> +	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> +endif
> +
> +define HOST_SEPOLGEN_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
> +endef
> +
> +define HOST_SEPOLGEN_INSTALL_CMDS
> +	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
> +endef
> +
> +$(eval $(host-generic-package))

But this only creates a host package.

I'm confused :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
