From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:35:40 +0100
Subject: [Buildroot] [RFC PATCH 1/3] Add package tegrarcm
In-Reply-To: <1455203110-16759-2-git-send-email-julian@jusst.de>
References: <1455203110-16759-1-git-send-email-julian@jusst.de>
 <1455203110-16759-2-git-send-email-julian@jusst.de>
Message-ID: <20160302213540.013e087b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julian,

Thanks for this contribution!

On Thu, 11 Feb 2016 10:05:08 -0500, Julian Scheel wrote:

> diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
> new file mode 100644
> index 0000000..fb28d2a
> --- /dev/null
> +++ b/package/tegrarcm/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_TEGRARCM
> +	bool "host tegrarcm"

I think you can add a "depends on BR2_arm || BR2_armeb" here.

While tegracrm is a host tool and therefore can be built regardless of
the selected target architecture, it doesn't make sense to build it if
the target architecture is something else than ARM.

> +	help
> +	  This program is used to send code to a Tegra device in recovery
> +	  mode.
> +
> +	  https://github.com/NVIDIA/tegrarcm

> diff --git a/package/tegrarcm/tegrarcm.hash b/package/tegrarcm/tegrarcm.hash
> new file mode 100644
> index 0000000..965c9ac
> --- /dev/null
> +++ b/package/tegrarcm/tegrarcm.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  538cb0af237ab33e070d3aeb6cc828cd7ef453753ba2ccc21b87ed43faac51bd  v1.7.tar.gz
> diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
> new file mode 100644
> index 0000000..9f8f017
> --- /dev/null
> +++ b/package/tegrarcm/tegrarcm.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# tegrarcm
> +#
> +################################################################################
> +
> +TEGRARCM_VERSION = 1.7
> +TEGRARCM_SOURCE = v$(TEGRARCM_VERSION).tar.gz
> +TEGRARCM_SITE = https://github.com/NVIDIA/tegrarcm/archive

Please use the github helper function.

> +TEGRARCM_LICENSE = NVIDIA Software License
> +TEGRARCM_LICENSE_FILE = LICENSE

The license is actually BSD-3c + NVIDIA Software License it seems.

> +TEGRARCM_AUTORECONF = YES
> +HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf

Are you sure this is sufficient? The configure.ac script checks for the
cryptopp library. The build might have worked on your system if you had
the cryptopp library installed system-wide.

Also, src/Makefile.am is doing the following nasty thing:

  AM_CPPFLAGS = -isystem /usr/include/$(CRYPTOLIB)

Such an hardcoded reference to /usr/include/$(CRYPTOLIB) is not going
to work if the cryptopp library gets built by Buildroot, since the
library headers will be in $(HOST_DIR)/usr/include and not
in /usr/include.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
