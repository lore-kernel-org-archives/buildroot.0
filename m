From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 22:55:09 +0200
Subject: [Buildroot] [PATCH] Add package libgeotiff
In-Reply-To: <BANLkTinABWL+chL8wDP3q=KYiKxjBf_daw@mail.gmail.com> (Murat
 Demirten's message of "Mon, 13 Jun 2011 13:18:56 +0300")
References: <BANLkTinABWL+chL8wDP3q=KYiKxjBf_daw@mail.gmail.com>
Message-ID: <87ei21retu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:

 Murat> Hi,
 Murat> Libgeotiff is an open source library normally hosted on top of libtiff for
 Murat> reading, and writing GeoTIFF information tags.

 Murat> Regards,

Thanks, a few comments:

 Murat> [master b7094a9] package: libgeotiff added.
 Murat> ?3 files changed, 26 insertions(+), 0 deletions(-)
 Murat> ?create mode 100644 package/libgeotiff/Config.in
 Murat> ?create mode 100644 package/libgeotiff/libgeotiff.mk

Your mailer seems to corrupt the patch, so I cannot apply it with git
am. Please consider sending patches with git send-email in the future.

 Murat> ---
 Murat> ?package/Config.in ? ? ? ? ? ? ? ?| ? ?1 +
 Murat> ?package/libgeotiff/Config.in ? ? | ? ?7 +++++++
 Murat> ?package/libgeotiff/libgeotiff.mk | ? 18 ++++++++++++++++++
 Murat> ?3 files changed, 26 insertions(+), 0 deletions(-)
 Murat> ?create mode 100644 package/libgeotiff/Config.in
 Murat> ?create mode 100644 package/libgeotiff/libgeotiff.mk

 Murat> diff --git a/package/Config.in b/package/Config.in
 Murat> index 81701d8..7b43143 100644
 Murat> --- a/package/Config.in
 Murat> +++ b/package/Config.in
 Murat> @@ -280,6 +280,7 @@ source "package/libart/Config.in"
 Murat> ?source "package/libdrm/Config.in"
 Murat> ?source "package/libexif/Config.in"
 Murat> ?source "package/libgail/Config.in"
 Murat> +source "package/libgeotiff/Config.in"
 Murat> ?source "package/libglade/Config.in"
 Murat> ?source "package/gdk-pixbuf/Config.in"
 Murat> ?source "package/libgtk2/Config.in"
 Murat> diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
 Murat> new file mode 100644
 Murat> index 0000000..47420fd
 Murat> --- /dev/null
 Murat> +++ b/package/libgeotiff/Config.in
 Murat> @@ -0,0 +1,7 @@
 Murat> +config BR2_PACKAGE_LIBGEOTIFF
 Murat> + ? ? ? bool "libgeotiff"
 Murat> + ? ? ? select BR2_PACKAGE_TIFF
 Murat> + ? ? ? help
 Murat> + ? ? ? ?Libgeotiff is an open source library normally hosted on top of libtiff
 Murat> for reading, and writing GeoTIFF information tags.?

Please keep help text lines < 70 chars.

 Murat> +
 Murat> + ? ? ? ?http://geotiff.osgeo.org/
 Murat> diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/
 Murat> libgeotiff.mk
 Murat> new file mode 100644
 Murat> index 0000000..742fd75
 Murat> --- /dev/null
 Murat> +++ b/package/libgeotiff/libgeotiff.mk
 Murat> @@ -0,0 +1,18 @@
 Murat> +#############################################################
 Murat> +#
 Murat> +# libgeotiff
 Murat> +#
 Murat> +#############################################################
 Murat> +LIBGEOTIFF_VERSION = 1.3.0
 Murat> +LIBGEOTIFF_SOURCE = libgeotiff-$(LIBGEOTIFF_VERSION).tar.gz
 Murat> +LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 Murat> +LIBGEOTIFF_DEPENDENCIES = tiff
 Murat> +LIBGEOTIFF_INSTALL_STAGING = YES
 Murat> +LIBGEOTIFF_INSTALL_TARGET = YES

Minor detail, the _SOURCE and INSTALL_TARGET lines can be removed as
this is their default value.

 Murat> +
 Murat> +define LIBGEOTIFF_INSTALL_TARGET_CMDS
 Murat> + ? ? ? mkdir -p $(TARGET_DIR)/usr/lib
 Murat> + ? ? ? cp -dpf $(@D)/.libs/libgeotiff.so* $(TARGET_DIR)/usr/lib/
 Murat> +endef

Why not just use make install like you do for the staging install.

 Murat> +
 Murat> +$(eval $(call AUTOTARGETS,package,libgeotiff))

Other than that it looks fine. Please fix these minor issues and resend
(with git send-email or as an attachment if that isn't possible).

-- 
Bye, Peter Korsgaard
