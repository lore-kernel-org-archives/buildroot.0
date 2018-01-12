From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 11:52:28 +0100
Subject: [Buildroot] [PATCH 1/1] Added lldpad (LLDP Agent Daemon)
 package.
In-Reply-To: <20180112103508.17334-1-laurent_pubs@yahoo.com>
References: <20180112103508.17334-1-laurent_pubs@yahoo.com>
Message-ID: <20180112115228.31ac9bf5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurent,

Thanks for this new version! Much easier to review.

First minor comment, the commit title should be:

	open-lldp: new package

On Fri, 12 Jan 2018 11:35:08 +0100, Laurent Charpentier wrote:
> The lldpad package comes with utilities to manage an LLDP interface with
> support for reading and configuring TLVs. TLVs and interfaces are individual
> controlled allowing flexible configuration for TX only, RX only, or TX/RX
> modes per TLV.
> 
> http://open-lldp.org/
> 
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> ---
>  package/Config.in                                  |  1 +
>  .../open-lldp/0001-lldpad-vdptool-getline.patch    | 10 +++++++++
>  package/open-lldp/Config.in                        | 11 +++++++++
>  package/open-lldp/open-lldp.hash                   |  2 ++
>  package/open-lldp/open-lldp.mk                     | 26 ++++++++++++++++++++++

Please add an entry in the DEVELOPERS file for this package. This will
allow you to be notified when patches are submitted for this package,
and when there are build failures occurring due to this package.

> diff --git a/package/open-lldp/0001-lldpad-vdptool-getline.patch b/package/open-lldp/0001-lldpad-vdptool-getline.patch
> new file mode 100644
> index 0000000000..ac2e62ff16
> --- /dev/null
> +++ b/package/open-lldp/0001-lldpad-vdptool-getline.patch

All patches should have a description and a Signed-off-by line. In
addition, since this project is hosted in Git upstream, we would like
patches to be formatted with "git format-patch -N".

> diff --git a/package/open-lldp/Config.in b/package/open-lldp/Config.in
> new file mode 100644
> index 0000000000..84b24702c7
> --- /dev/null
> +++ b/package/open-lldp/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_OPEN_LLDP
> +        bool "open-lldp"
> +        select BR2_PACKAGE_LIBCONFIG
> +        select BR2_PACKAGE_LIBNL

libnl depends on threads, so you need to replicate the threads
dependency, and add a Config.in comment about it.

> +        select BR2_PACKAGE_LIBTOOL

Not needed, you don't need libtool for the target.

> +        select BR2_PACKAGE_READLINE
> +        help
> +	  This package contains the Linux user space daemon and configuration
> +	  tool for Intel LLDP Agent with Enhanced Ethernet support for the
> +	  Data Center.

Indentation for the help text is one tab + two spaces. Also, we like to
have the URL to the upstream project in the help text, after one blank
line.

These minor details are verified by the ./utils/check-package. I would
recommend you to run this script on your package.

> +OPEN_LLDP_VERSION = 036e314

Please use a full hash.

> +OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git<
> +OPEN_LLDP_SITE_METHOD = git
> +OPEN_LLDP_DEPENDENCIES = libconfig host-pkgconf libtool

I'm pretty sure libtool is not needed on the target.

What about readline? You select it in the Config.in, but you don't
depend on it. Is it just a runtime dependency (seems unlikely).

> +OPEN_LLDP_LICENSE = GPL-2.0
> +OPEN_LLDP_LICENSE_FILES = README

COPYING is a better license file.

> +OPEN_LLDP_AUTORECONF = YES

We like to have a comment above autoreconf to explain why it is needed.
In your case, something like:

# Fetching from git, need to generate configure/Makefile.in

> +OPEN_LLDP_INSTALL_STAGING = YES
> +
> +OPEN_LLDP_CONF_OPTS = \
> +        --disable-static

This should not be needed, the autotools-package infrastructure is
already passing --{enable,disable}-{shared,static} depending on the
Buildroot configuration.

> +define OPEN_LLDP_BOOTSTRAP
> +        (cd $(@D) && ./bootstrap.sh)
> +endef
> +
> +OPEN_LLDP_PRE_CONFIGURE_HOOKS += OPEN_LLDP_BOOTSTRAP

Why do you need this? <pkg>_AUTORECONF should be sufficient.

Also, could you test your package with ./utils/test-pkg ? This would
test it with a wide variety of toolchains/architectures, which will
allow to detect build issues before they arrive on our autobuilder
infrastructure.

Could you take into account those comments (most of them are really
trivial) and submit an updated version?

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
