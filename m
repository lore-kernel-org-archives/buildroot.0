From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 22:22:44 +0200
Subject: [Buildroot] [PATCH 1/1] simicsfs: new package
In-Reply-To: <1402412534-24929-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1402412534-24929-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20140610222244.1bb0858e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Tue, 10 Jun 2014 08:02:14 -0700, Matt Weber wrote:

> --- /dev/null
> +++ b/package/simicsfs/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SIMICSFS
> +	bool "simicsfs"

We need a "depends on BR2_LINUX_KERNEL" here.

> +	help
> +	  A kernel driver that provides access to a host computer's local
> +	  filesystem when the target is executing within a SIMICS simulation.
> +
> +	  http://www.cs.sfu.ca/~fedorova/Tech/simics-guides-3.0.26/simics-user-guide-unix/topic33.html
> diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
> new file mode 100644
> index 0000000..c266f68
> --- /dev/null
> +++ b/package/simicsfs/simicsfs.mk
> @@ -0,0 +1,21 @@
> +###############################################################################
> +#
> +# simicsfs
> +#
> +###############################################################################
> +
> +SIMICSFS_VERSION = 1.17
> +SIMICSFS_SITE = https://download.simics.net/pub/
> +SIMICSFS_LICENSE = GPLv2+
> +SIMICSFS_LICENSE_FILES = hostfs.h
> +SIMICSFS_DEPENDENCIES = linux
> +
> +define SIMICSFS_BUILD_CMDS
> +        $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> +endef
> +
> +define SIMICSFS_INSTALL_TARGET_CMDS
> +        $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
> +endef
> +
> +$(eval $(generic-package))

Other than that, looks good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
