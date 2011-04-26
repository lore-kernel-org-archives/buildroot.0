From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 10:05:47 +0200
Subject: [Buildroot] [PATCH] Add libexif to buildroot
In-Reply-To: <4D4BC30B.1040500@free.fr> (Guillaume Gardet's message of "Fri,
	04 Feb 2011 10:12:43 +0100")
References: <4D4BC30B.1040500@free.fr>
Message-ID: <87vcy15tes.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Gardet <guillaume.gardet@free.fr> writes:

 Guillaume> Attached patch add support to libexif in Buildroot.
 Guillaume> Cheers,

Sorry for slow response - Committed with some tweaks, thanks.

It would be very good if you could use 'git format-patch' /
'git send-email' for patches in the future.

 Guillaume> diff --git a/package/Config.in b/package/Config.in
 Guillaume> index 16a9e8f..ee6cd3b 100644
 Guillaume> --- a/package/Config.in
 Guillaume> +++ b/package/Config.in
 Guillaume> @@ -274,6 +275,7 @@ source "package/gtk2-themes/Config.in"
 Guillaume>  source "package/jpeg/Config.in"
 Guillaume>  source "package/libart/Config.in"
 Guillaume>  source "package/libdrm/Config.in"
 Guillaume> +source "package/libexif/Config.in"
 Guillaume>  source "package/libgail/Config.in"
 Guillaume>  source "package/libglade/Config.in"
 Guillaume>  source "package/gdk-pixbuf/Config.in"
 Guillaume> diff --git a/package/libexif/Config.in b/package/libexif/Config.in
 Guillaume> new file mode 100644
 Guillaume> index 0000000..c4b3bd5
 Guillaume> --- /dev/null
 Guillaume> +++ b/package/libexif/Config.in
 Guillaume> @@ -0,0 +1,7 @@
 Guillaume> +config??BR2_PACKAGE_LIBEXIF
 Guillaume> +	bool??"libexif - EXIF Tag Parsing Library"

Your mailer seems to have replaced spaces with funky underscores.

 Guillaume> +	help
 Guillaume> +		Most digital cameras produce EXIF files, which are JPEG files with extra tags that contain information about the image. 
 Guillaume> +		The EXIF library allows you to parse an EXIF file and read the data from those tags.

help text should be indented with <tab><space><space> and not exceed ~70
chars.

 Guillaume> +++ b/package/libexif/libexif.mk
 Guillaume> @@ -0,0 +1,15 @@
 Guillaume> +#############################################################
 Guillaume> +#
 Guillaume> +# libexif
 Guillaume> +#
 Guillaume> +#############################################################
 Guillaume> +
 Guillaume> +LIBEXIF_VERSION = 0.6.20
 Guillaume> +LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.gz

Upstream has a .bz2 as well, which is smaller/faster to download.

 Guillaume> +LIBEXIF_SITE = http://sourceforge.net/projects/libexif/files/libexif/$(LIBEXIF_VERSION)

That doesn't look like a normal sourceforge URL - Normally we have
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/... (see haserl.mk
as example).

 Guillaume> +LIBEXIF_INSTALL_STAGING = YES
 Guillaume> +LIBEXIF_INSTALL_TARGET = YES

INSTALL_TARGET is default, so that's not needed.

 Guillaume> +LIBEXIF_CONF_OPT = --disable-docs
 Guillaume> +LIBEXIF_DEPENDENCIES = host-pkg-config
 Guillaume> +
 Guillaume> +$(eval $(call AUTOTARGETS,package,libexif))

-- 
Bye, Peter Korsgaard
