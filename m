From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Oct 2019 14:12:35 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <20191009112656.21232-8-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
Message-ID: <20191009141235.016e4b23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

Sorry I didn't had the chance to review the remainder of your first
iteration, but there was one main issue about the netopeer2 package.
See below.

On Wed,  9 Oct 2019 13:26:54 +0200
heiko.thiery at gmail.com wrote:

> +	select BR2_PACKAGE_SYSREPO
> +	select BR2_PACKAGE_SYSREPO

Duplicate select.

Also, sysrepo has plenty of "depends on". They *all* need to be
replicated in the netopeer2 package.

> diff --git a/package/netopeer2-keystored/netopeer2-keystored.mk b/package/netopeer2-keystored/netopeer2-keystored.mk
> new file mode 100644
> index 0000000000..8160c53867
> --- /dev/null
> +++ b/package/netopeer2-keystored/netopeer2-keystored.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# netopeer2-keystored
> +#
> +################################################################################
> +
> +NETOPEER2_KEYSTORED_VERSION = v0.7-r2
> +NETOPEER2_KEYSTORED_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_KEYSTORED_VERSION))

This is the exact same source code you are fetching in
netopeer2-keystored, netopeer2-server and netopeer2-cli. We do not want
3 separate Buildroot packages, but only one. Of course, it can have
sub-options in the Config.in file so that the user can selectively
enable keystored, cli and/or server.

But generally speaking in Buildroot, the rule is one upstream project
== one package. We do have a few exceptions to this rule for various
reasons, but unless there's a good and strong justification, we like to
keep this one upstream project == one package rule in place.

> +NETOPEER2_KEYSTORED_LICENSE = BSD-3-Clause
> +NETOPEER2_KEYSTORED_LICENSE_FILES = LICENSE
> +NETOPEER2_KEYSTORED_SUBDIR = keystored
> +NETOPEER2_KEYSTORED_DEPENDENCIES += host-sysrepo sysrepo

Just = for unconditional assignments.

> +
> +NETOPEER2_KEYSTORED_CONF_OPTS += \

Ditto.

> +	-DKEYSTORED_DEFER_SSH_KEY=ON \
> +	-DSSH_KEY_INSTALL=ON \
> +	-DMODEL_INSTALL=ON \
> +	-DSYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl \
> +	-DSYSREPOCFG_EXECUTABLE=$(HOST_DIR)/bin/sysrepocfg
> +
> +define NETOPEER2_KEYSTORED_PERMISSIONS
> +	/etc/sysrepo/data/ietf-keystore.persist f 600 0 0 - - - - -
> +	/etc/sysrepo/data/ietf-keystore.running f 600 0 0 - - - - -
> +	/etc/sysrepo/data/ietf-keystore.running.lock f 600 0 0 - - - - -
> +	/etc/sysrepo/data/ietf-keystore.startup f 600 0 0 - - - - -
> +	/etc/sysrepo/data/ietf-keystore.startup.lock f 600 0 0 - - - - -
> +endef
> +
> +$(eval $(cmake-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
