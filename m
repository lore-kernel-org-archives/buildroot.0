From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 May 2013 23:15:29 +0200
Subject: [Buildroot] [PATCH 1/1] libcec: add the libcec for HDMI device
 Control
In-Reply-To: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130506231529.4a7b2b57@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri,  3 May 2013 17:08:07 -0500, Spenser Gilliland wrote:
> This package adds libcec for HDMI device control.  It enables Raspberry Pi support if the rpi-userland package is installed.

Commit messages should be wrapped at 80 columns.

> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in        |    1 +
>  package/libcec/Config.in |    8 ++++++++
>  package/libcec/libcec.mk |   21 +++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/libcec/Config.in
>  create mode 100644 package/libcec/libcec.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 06bcdef..06b9226 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -456,6 +456,7 @@ source "package/imx-lib/Config.in"
>  source "package/lcdapi/Config.in"
>  source "package/libaio/Config.in"
>  source "package/libatasmart/Config.in"
> +source "package/libcec/Config.in"
>  source "package/libraw1394/Config.in"
>  source "package/tslib/Config.in"
>  source "package/libfreefare/Config.in"
> diff --git a/package/libcec/Config.in b/package/libcec/Config.in
> new file mode 100644
> index 0000000..2104a2b
> --- /dev/null
> +++ b/package/libcec/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBCEC
> +	bool "libCEC"

The label should be in lower-case, i.e "libcec".

> +	help
> +	  libCEC allows you in combination with the right hardware to control your
> +	  home theater devices with your TV remote control utilizing existing HDMI
> +	  cabling.
> +
> +	  http://libcec.pulse-eight.com
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> new file mode 100644
> index 0000000..803e105
> --- /dev/null
> +++ b/package/libcec/libcec.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# libcec
> +#
> +#############################################################
> +
> +LIBCEC_VERSION = libcec-2.1.1
> +LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
> +LIBCEC_SITE_METHOD = git

Apparently, there is a tag in the git repo, so github provides a
tarball. See
http://buildroot.org/downloads/manual/manual.html#github-download-url.

> +LIBCEC_LICENSE = GPLv2+
> +LIBCEC_LICENSE_FILE = COPYING
> +
> +LIBCEC_AUTORECONF = YES
> +LIBCEC_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)
> +LIBCEC_CONF_OPT = --enable-rpi \
> +   --with-rpi-include-path=$(STAGING_DIR)/usr/include
> +endif

So the package builds and works fine without the RPi libraries, and
those are just adding some optional features?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
