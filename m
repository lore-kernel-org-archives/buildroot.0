From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2016 21:27:00 +0100
Subject: [Buildroot] [PATCH V3] Adding support for NVME utils
In-Reply-To: <20160112054917.5859.13862.stgit@localhost.localdomain>
References: <20160112054917.5859.13862.stgit@localhost.localdomain>
Message-ID: <20160112212700.01ce8859@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mamatha,

Thanks for your contribution!

On Tue, 12 Jan 2016 11:22:06 +0530, Mamatha wrote:
> Add support for building NVME utility - a utility for interacting with
> standard NVM Express (optimized PCI Express SSD interface) devices.

For all patches on packages, we prefer to have the title of the commit
comply with the following format:

	<package>: <description>

So in your case, it should be:

	nvme: new package

> Signed-off-by: Mamatha <mamatha4@linux.vnet.ibm.com>

Sorry if I'm not familiar with naming practices in your part of the
world, but we require a full name (i.e first name + last name). Is
Mamatha your full name ?

> ---
>  package/Config.in      |    1 +
>  package/nvme/Config.in |    6 ++++++
>  package/nvme/nvme.mk   |   23 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100755 package/nvme/Config.in
>  create mode 100755 package/nvme/nvme.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..014debd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1399,6 +1399,7 @@ endif
>  	source "package/openvmtools/Config.in"
>  	source "package/polkit/Config.in"
>  	source "package/powerpc-utils/Config.in"
> +	source "package/nvme/Config.in"

You should respect alphabetic ordering here when including
nvme/Config.in. Also I believe this package better belongs to the
"Hardware handling" menu rather than "System tools".

>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/procps-ng/Config.in"
>  	source "package/psmisc/Config.in"
> diff --git a/package/nvme/Config.in b/package/nvme/Config.in
> new file mode 100755
> index 0000000..a3c8ada
> --- /dev/null
> +++ b/package/nvme/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_NVME
> +	bool "nvme"
> +	help
> +	  System utilities for standard NVME Express devices
> +
> +	  https://github.com/linux-nvme/nvme-cli
> diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
> new file mode 100755
> index 0000000..43bec67
> --- /dev/null
> +++ b/package/nvme/nvme.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# nvme
> +#
> +################################################################################
> +
> +NVME_VERSION = 0.1
> +NVME_SITE = https://github.com/linux-nvme/nvme-cli.git
> +NVME_SITE_METHOD = git

You should use the github helper. See also
https://buildroot.org/downloads/manual/manual.html#github-download-url.

> +NVME_LICENSE = GPLv2

The license is GPLv2+

> +NVME_LICENSE_FILES = COPYING
> +
> +define NVME_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +		INCLUDEDIR="-I." all

Why do you explicitly specify "all" here ? It is going to build the
documentation, while if you leave it out, it will only build the first
target, which is named "default" in nvme's Makefile, and it will only
build the nvme binary.

Also, when calling $(MAKE), please pass $(TARGET_MAKE_ENV) in the
environment:

	$(TARGET_MAKE_ENV) $(MAKE) ...

> +endef
> +
> +define NVME_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/nvme $(TARGET_DIR)/sbin/nvme

Why you don't you use the install-bin target ? Like this:

	$(TARGET_MAKE_ENV) $(MAKE) -C (@D) DESTDIR=$(TARGET_DIR) install-bin

Also, could you add a hash file, as explained in
https://buildroot.org/downloads/manual/manual.html#adding-packages-hash ?

Could you rework your patch to take into account those comments and
send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
