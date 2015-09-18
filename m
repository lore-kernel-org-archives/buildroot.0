From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Sep 2015 15:59:03 +0100
Subject: [Buildroot] squeezelite: new package
In-Reply-To: <201509181337.t8IDbRNo011752@ms-omx03.plus.so-net.ne.jp>
References: <201509181337.t8IDbRNo011752@ms-omx03.plus.so-net.ne.jp>
Message-ID: <55FC26B7.8090501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

first of all, thanks for your contribution. I'm not the maintainer but
please allow me to reply.

Could you please send your patches in git format? Which means, clone the
Buildroot repository:

git clone git://git.buildroot.net/buildroot

Do all the changes you need to do. Add the modified files:

git add package/Config.in
git add package/squeezelite/Config.in
git add squeezelite/squeezelite.mk

Commit your changes:

git commit -s

And then send your commit by email using git:

git send-email --to=buildroot at buildroot.org -1

There is more information here:

http://buildroot.org/manual.html#submitting-patches

I also noticed that this project is hosted on Google code, which has
archived the project. And there are lots of forks on GitHub. Is one of
them the new official one? Because this problem will not receive more
updates on Google code, so any fixes that need to be done upstream will
need to go somewhere.

Regards,

Vincent.

On 09/18/2015 02:37 PM, kei-k at ca2.so-net.ne.jp wrote:
> Dear, maintener.
> 
> squeezelite is very famous and attractive sound client for
> Logitech Media Server.
> 
> I deeply appreciate if you pull this patch.
> 
> Thank you.
> 
> ==============================================================================
> diff -ruN buildroot/package/Config.in buildroot-new/package/Config.in
> --- buildroot/package/Config.in	2015-09-18 15:02:07.865545530 +0900
> +++ buildroot-new/package/Config.in	2015-09-18 22:02:46.293517263 +0900
> @@ -33,6 +33,7 @@
>  	source "package/opus-tools/Config.in"
>  	source "package/pulseaudio/Config.in"
>  	source "package/sox/Config.in"
> +	source "package/squeezelite/Config.in"
>  	source "package/tidsp-binaries/Config.in"
>  	source "package/tovid/Config.in"
>  	source "package/tstools/Config.in"
> diff -ruN buildroot/package/squeezelite/Config.in buildroot-new/package/squeezelite/Config.in
> --- buildroot/package/squeezelite/Config.in	1970-01-01 09:00:00.000000000 +0900
> +++ buildroot-new/package/squeezelite/Config.in	2015-09-18 16:07:51.000000000 +0900
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_SQUEEZELITE
> +	bool "squeezelite"
> +	depends on BR2_USE_WCHAR	# flac
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_FLAC
> +	select BR2_PACKAGE_LIBMAD
> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_FAAD2
> +	select BR2_PACKAGE_MPG123
> +	select BR2_PACKAGE_LIBSOXR
> +	help
> +	  Logitech Media Server client
> +	  https://code.google.com/p/squeezelite/
> +
> +config BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
> +	bool "Enable resampling function"
> +	default y
> +	depends on BR2_PACKAGE_SQUEEZELITE
> +	help
> +	  Enable resampling function
> +
> +config BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP
> +	bool "Use OpenMP for resampling"
> +	default y
> +	depends on BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
> +	help
> +	  Enable OpenMP support for resampling
> +
> +comment "squeezelite needs a toolchain w/ wchar (incur from flac)"
> +	depends on !BR2_USE_WCHAR
> diff -ruN buildroot/package/squeezelite/squeezelite.mk buildroot-new/package/squeezelite/squeezelite.mk
> --- buildroot/package/squeezelite/squeezelite.mk	1970-01-01 09:00:00.000000000 +0900
> +++ buildroot-new/package/squeezelite/squeezelite.mk	2015-09-18 22:28:22.290163636 +0900
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# squeezelite -- Logitech Media Server client
> +#
> +################################################################################
> +
> +SQUEEZELITE_VERSION = v1.8
> +SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
> +SQUEEZELITE_SITE_METHOD = git
> +SQUEEZELITE_LICENSE = GPLv3
> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
> +SQUEEZELITE_INSTALL_STAGING = NO
> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123 libsoxr
> +
> +#SQUEEZELITE_OPTS = "-DLINKALL"
> +SQUEEZELITE_OPTS = ""
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE),y)
> +	SQUEEZELITE_OPTS += -DRESAMPLE
> +	ifeq ($(BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP),y)
> +		SQUEEZELITE_OPTS += -DRESAMPLE_MP
> +	endif
> +endif
> +
> +define SQUEEZELITE_BUILD_CMDS
> +    $(MAKE) OPTS="$(SQUEEZELITE_OPTS)" \
> +	CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +define SQUEEZELITE_INSTALL_TARGET_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))
> 
> ==============================================================================
> ============================================================
>     Hiroshi Kawashima
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
