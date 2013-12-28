From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 17:24:28 +0100
Subject: [Buildroot] [PATCH] fswebcam: Add package
In-Reply-To: <1388235639-3008-1-git-send-email-lucas.de.marchi@gmail.com>
References: <1388235639-3008-1-git-send-email-lucas.de.marchi@gmail.com>
Message-ID: <20131228172428.0c240f8c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lucas De Marchi,

On Sat, 28 Dec 2013 11:00:39 -0200, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/fswebcam/Config.in   | 15 +++++++++++++++
>  package/fswebcam/fswebcam.mk | 40 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 package/fswebcam/Config.in
>  create mode 100644 package/fswebcam/fswebcam.mk

Thanks applied. However, I've made a number of changes, see below.


> @@ -167,6 +167,7 @@ comment "Graphic applications"
>  source "package/gnuplot/Config.in"
>  source "package/jhead/Config.in"
>  source "package/rrdtool/Config.in"
> +source "package/fswebcam/Config.in"

Packages should be sorted alphabetically.


> +	  fswebcam is a neat and simple webcam app. It captures images from a
> +	  V4L1/V4L2 compatible device or file, averages them to reduce noise
> +	  and draws a caption using the GD Graphics Library which also handles
> +	  compressing the image to PNG or JPEG. The resulting image is saved to
> +	  a file or sent to stdio where it can be piped to something like
> +	  ncftpput or scp.

These lines were slightly too long, so I rewrap this help text.

> +FSWEBCAM_VERSION = 20110717
> +FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files/
> +FSWEBCAM_LICENSE = GPLv2
> +FSWEBCAM_LICENSE_FILES = LICENSE
> +
> +FSWEBCAM_DEPENDENCIES += freetype \
> +			 jpeg \
> +			 libpng \
> +			 gd

I've used a single line.

> +define FSWEBCAM_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		./configure --prefix=/usr \
> +	)
> +endef

This was the major mistake of your package. Since fswebcam uses an
autoconf generated configure script, you should have used
autotools-package instead of generic-package. Here, you were calling
the configure script with the host compiler: on my machine, I did not
have the "gd" library installed in my distro, so the configure script
was failing. And anyway, running the configure script with the host
compiler and configuration is just plain wrong.

> +define FSWEBCAM_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -DHAVE_CONFIG_H" \
> +	LFLAGS="$(TARGET_LDFLAGS) $(FSWEBCAM_LDFLAGS)" -C $(@D)
> +endef
> +
> +define FSWEBCAM_INSTALL_TARGET_CMDS
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef

With autotools-package, both the configure, build and install target
steps are automatically handled by Buildroot.

> +define FSWEBCAM_UNINSTALL_TARGET_CMDS
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
> +endef
> +
> +define FSWEBCAM_CLEAN_CMDS
> +	-$(MAKE) -C $(@D) clean
> +endef

See two are no longer needed in Buildroot, we removed them from all
packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
