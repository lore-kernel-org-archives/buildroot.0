From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2011 00:26:11 +0200
Subject: [Buildroot] [PATCH v4 3/3] New package: feh
In-Reply-To: <1318420506-25398-3-git-send-email-yegorslists@googlemail.com>
References: <1318420506-25398-1-git-send-email-yegorslists@googlemail.com>
 <1318420506-25398-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110140026.11671.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 12 October 2011 13:55:06, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in     |    1 +
>  package/feh/Config.in |   11 +++++++++++
>  package/feh/feh.mk    |   22 ++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 package/feh/Config.in
>  create mode 100644 package/feh/feh.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7f82934..b39f41b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -133,6 +133,7 @@ source "package/fluxbox/Config.in"
>  comment "X applications"
>  source "package/alsamixergui/Config.in"
>  source "package/docker/Config.in"
> +source "package/feh/Config.in"
>  source "package/gqview/Config.in"
>  source "package/gmpc/Config.in"
>  source "package/gob2/Config.in"
> diff --git a/package/feh/Config.in b/package/feh/Config.in
> new file mode 100644
> index 0000000..09bbfb2
> --- /dev/null
> +++ b/package/feh/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_FEH
> +	bool "feh"
> +	depends on BR2_PACKAGE_XLIB_LIBXINERAMA
> +	depends on BR2_PACKAGE_XLIB_LIBXT

 Should be select, as well as depends on BR2_PACKAGE_XORG7.

 Regards,
 Arnout

> +	select BR2_PACKAGE_IMLIB2_PNG
> +	select BR2_PACKAGE_GIBLIB
> +	select BR2_PACKAGE_LIBCURL
> +	help
> +	  feh is an X11 image viewer aimed mostly at console users.
> +
> +	  http://feh.finalrewind.org/
> diff --git a/package/feh/feh.mk b/package/feh/feh.mk
> new file mode 100644
> index 0000000..b59bb2f
> --- /dev/null
> +++ b/package/feh/feh.mk
> @@ -0,0 +1,22 @@
> +FEH_VERSION = 2.0
> +FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
> +FEH_SITE = http://feh.finalrewind.org/
> +FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
> +
> +define FEH_BUILD_CMDS
> +	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> +		-C $(@D) all
> +endef
> +
> +define FEH_INSTALL_TARGET_CMDS
> +	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
> +		DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +define FEH_UNINSTALL_TARGET_CMDS
> +	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
> +		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
> +endef
> +
> +$(eval $(call GENTARGETS))
> +
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111014/996afd24/attachment.html>
