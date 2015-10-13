From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 13 Oct 2015 09:50:02 -0400
Subject: [Buildroot] [PATCH v4] systemd: Bump version and change hosting
In-Reply-To: <1443864014-29055-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443864014-29055-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CANPyyuOSU0R-_LqdS7c98y0kfuXJRVM2UKesJDEpWJUnL2R_XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Mike Williams <mike@mikebwilliams.com>

Also, I bumped the version to 227 and tested it too, it also works fine.

On Sat, Oct 3, 2015 at 5:20 AM, Maxime Hadjinlian <
maxime.hadjinlian@gmail.com> wrote:

> systemd seems to do its release using their github repository up from
> the 221 version.
>
> Since they use the auto generated release, we can't have a hash file.
>
> They don't provide the Makefile.in file in the 'po' directory.
> We need to run intltoolize so it's created for us.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v3 -> v4:
>     - Don't use autogen.sh (run some tests that applies on the host
>       machine), instead call intltoolize alone.
> ---
>  package/systemd/systemd.hash |  2 --
>  package/systemd/systemd.mk   | 10 +++++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  delete mode 100644 package/systemd/systemd.hash
>
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> deleted file mode 100644
> index f746051..0000000
> --- a/package/systemd/systemd.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  085e088650afbfc688ccb13459aedb1fbc7c8810358605b076301f472d51cc4f
> systemd-221.tar.xz
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b62fc08..6b9ce3f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,9 +4,8 @@
>  #
>
>  ################################################################################
>
> -SYSTEMD_VERSION = 221
> -SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
> -SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
> +SYSTEMD_VERSION = 226
> +SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source
> files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
>  SYSTEMD_INSTALL_STAGING = YES
> @@ -51,6 +50,11 @@ SYSTEMD_CONF_ENV = \
>         CFLAGS="$(SYSTEMD_CFLAGS)" \
>         ac_cv_path_KMOD=/usr/bin/kmod
>
> +define SYSTEMD_RUN_INTLTOOLIZE
> +       cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
> +endef
> +SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_INTLTOOLIZE
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
>  SYSTEMD_CONF_OPTS += --enable-compat-libs
>  else
> --
> 2.5.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151013/99793b1b/attachment.html>
