From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:33:28 +0200
Subject: [Buildroot] [PATCH] new package: libqmi
In-Reply-To: <1361144807-22896-1-git-send-email-shawn7400@gmail.com>
References: <1361144807-22896-1-git-send-email-shawn7400@gmail.com>
Message-ID: <20130407223328.5dc46d58@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shawn,

Thanks a lot for your contribution. Some comments below.

On Sun, 17 Feb 2013 18:46:47 -0500, shawn7400 at gmail.com wrote:
> From: "Shawn J. Goff" <shawn.goff@accelecon.com>
> 
> libqmi includes a library and command line interface for interacting with
> modems that speak the QMI protocol.
> ---
>  package/libqmi/Config.in                           |   5 +
>  .../libqmi-Add-files-created-by-autogen.patch      |  29 ++
>  .../libqmi-Add-files-created-by-gtkdocize.patch    | 309 +++++++++++++++++++++

I think we prefer lower-case filenames for patches.

>  package/libqmi/libqmi.mk                           |  21 ++

Your patch lacks the change to package/Config.in. For now, your
package doesn't appear anywhere in menuconfig.

>  4 files changed, 364 insertions(+)
>  create mode 100644 package/libqmi/Config.in
>  create mode 100644 package/libqmi/libqmi-Add-files-created-by-autogen.patch
>  create mode 100644 package/libqmi/libqmi-Add-files-created-by-gtkdocize.patch
>  create mode 100644 package/libqmi/libqmi.mk
> 
> diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
> new file mode 100644
> index 0000000..6cb1b81
> --- /dev/null
> +++ b/package/libqmi/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_LIBQMI
> +	bool "libqmi"
> +	depends on BR2_PACKAGE_LIBGLIB2

This should be:

	select BR2_PACKAGE_LIBGLIB2
	depends on BR2_USE_WCHAR # libglib2 -> gettext

> +	help
> +    libqmi is a library for interacting with devices that use Qualcomm's QMI protocol.

Indentation of the help text should be one tab plus two spaces. This
line should also be wrapped at around ~72 columns. And you should add
an empty new line, and the URL of the upstream project.

> diff --git a/package/libqmi/libqmi-Add-files-created-by-autogen.patch b/package/libqmi/libqmi-Add-files-created-by-autogen.patch
> new file mode 100644
> index 0000000..55ac746
> --- /dev/null
> +++ b/package/libqmi/libqmi-Add-files-created-by-autogen.patch
> @@ -0,0 +1,29 @@
> +From 6d4db1bde5f9f0883468dbead27a41ac98430e9a Mon Sep 17 00:00:00 2001
> +From: "Shawn J. Goff" <shawnjgoff@gmail.com>
> +Date: Wed, 26 Sep 2012 15:21:48 -0400
> +Subject: [PATCH 2/2] Add files created by autogen
> +

I think we generally prefer a hook in POST_PATCH_HOOKS to create those
files using 'touch'.

> diff --git a/package/libqmi/libqmi-Add-files-created-by-gtkdocize.patch b/package/libqmi/libqmi-Add-files-created-by-gtkdocize.patch
> new file mode 100644
> index 0000000..bae0dee
> --- /dev/null
> +++ b/package/libqmi/libqmi-Add-files-created-by-gtkdocize.patch
> @@ -0,0 +1,309 @@
> +From 5fd915fb74d35bc67b007b5f7659109954daa837 Mon Sep 17 00:00:00 2001
> +From: "Shawn J. Goff" <shawnjgoff@gmail.com>
> +Date: Wed, 26 Sep 2012 15:20:23 -0400
> +Subject: [PATCH 1/2] Add files created by gtkdocize
> +
> +---
> + gtk-doc.make  | 280 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + m4/gtk-doc.m4 |   1 +
> + 2 files changed, 281 insertions(+)
> + create mode 100644 gtk-doc.make
> + create mode 100644 m4/gtk-doc.m4

Hum, there's really no other way? I.e the package doesn't build at all
if you don't do this?

> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> new file mode 100644
> index 0000000..6ae6b64
> --- /dev/null
> +++ b/package/libqmi/libqmi.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# libqmi
> +#
> +#############################################################

One empty new line between the header and the first variable.

> +LIBQMI_VERSION = 9e60ef6c0f3e6ac579fb360481488c5ed00382cc

I see that this project has some tags for versions, the latest being
1.2.0. Any reason for using an apparently 'random' Git commit? The
1.2.0 has been tagged 3 weeks ago, so it's not very old.

> +LIBQMI_SITE = git://anongit.freedesktop.org/libqmi
> +LIBQMI_SITE_METHOD = git

I think the site method is not needed here since your site starts with
git://.

> +LIBQMI_AUTORECONF = YES
> +LIBQMI_AUTORECONF_OPT = --force --install --verbose
> +LIBQMI_INSTALL_STAGING = YES
> +LIBQMI_CONF_OPT = --with-docs=no\
> +                  --enable-gtk-doc-html=no\
> +                  --enable-gtk-doc=no\
> +                  --enable-gtk-doc-pdf=no\
> +                  --with-tests=no\
> +                  --with-traces=no

Once space before each backslash please.

> +LIBQMI_DEPENDENCIES = libglib2
> +
> +$(eval $(autotools-package))

It would be good to add the licensing informations:

LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
LIBQMI_LICENSE_FILES = COPYING

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
