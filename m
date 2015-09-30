From: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
Date: Wed, 30 Sep 2015 23:34:12 +0900
Subject: [Buildroot] [PATCH v14 1/1] squeezelite: new package
In-Reply-To: Your message of Tue, 29 Sep 2015 20:08:13 +0900.
 <201509291108.t8TB8DpA019446@ms-omx02.plus.so-net.ne.jp>
Message-ID: <201509301434.t8UEYCh2003625@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all.

I will appreciate if you point out anything I should improve for
following patch.

Thanks,
Kawashima

> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
> Changelog
> v13 -> v14
> - change to use patch file insted of using sed to generate Makefile.
> - change BR2_PACKAGE_SQUEEZELITE_FF -> BR2_PACKAGE_SQUEEZELITE_FFMPEG.
> - improve prompt message for configuration options.
> - change installation destination path to fullpath.
> - remove useless help string.
> 
> v12 -> v13
> - change SQUEEZELITE_SITE to github (mine), cloned from original
>   google code site (original site is unstable to fetch).
> - change to use $(TARGET_CONFIGURE_OPTS) on SQUEEZELITE_BUILD_CMDS to
>   be suitable for buildroot make system.
> - to accomplish above, change to generate buildroot suitable Makefile from
>   original squeezelite's Makefile (using 'override' directive for CFLAGS,
>   LDFLAGS).
> 
> v11 -> v12
> - remove -DRESAMPLE_MP, because libsoxr is compiled without
>   openMP support in buildroot, so meaningless for now.
> - add -DLINKALL to resolve symbols in optional libraries (libsoxr, etc).
> - add more configuration options : ffmpeg, DSD, Visualizer.
>   lirc support is not included for now, because more work will be
>   necessary to use it (eg: modifying package/lirc-tools to add
>   LIRC_TOOLS_INSTALL_STAGING = YES).
> ---
>  package/Config.in                                |    1 +
>  package/squeezelite/0001-Makefile-override.patch |   42 ++++++++++++++++++++
> +
>  package/squeezelite/Config.in                    |   38 +++++++++++++++++++
>  package/squeezelite/squeezelite.mk               |   43 ++++++++++++++++++++
> ++
>  4 files changed, 124 insertions(+), 0 deletions(-)
>  create mode 100644 package/squeezelite/0001-Makefile-override.patch
>  create mode 100644 package/squeezelite/Config.in
>  create mode 100644 package/squeezelite/squeezelite.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 0e0c5cd..7c5a43a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -33,6 +33,7 @@ menu "Audio and video applications"
>  	source "package/opus-tools/Config.in"
>  	source "package/pulseaudio/Config.in"
>  	source "package/sox/Config.in"
> +	source "package/squeezelite/Config.in"
>  	source "package/tidsp-binaries/Config.in"
>  	source "package/tovid/Config.in"
>  	source "package/tstools/Config.in"
> diff --git a/package/squeezelite/0001-Makefile-override.patch b/package/squee
> zelite/0001-Makefile-override.patch
> new file mode 100644
> index 0000000..5897e0b
> --- /dev/null
> +++ b/package/squeezelite/0001-Makefile-override.patch
> @@ -0,0 +1,42 @@
> +This patch is applied to squeezelite Makefile to add override
> +directive for CFLAGS and LDFLAGS assignment.
> +This enables adding flags to CFLAGS and LDFLAGS in Makefile.
> +
> +Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> +
> +diff -ruN a/Makefile b/Makefile
> +--- a/Makefile	2015-02-01 23:56:21.000000000 +0900
> ++++ b/Makefile	2015-09-29 20:06:52.268069187 +0900
> +@@ -1,4 +1,6 @@
> + # Cross compile support - create a Makefile which defines these three varia
> bles and then includes this Makefile...
> ++override CFLAGS += $(OPTS)
> ++override LDFLAGS += -lasound -lpthread -lm -lrt
> + CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
> + LDFLAGS ?= -lasound -lpthread -lm -lrt
> + EXECUTABLE ?= squeezelite
> +@@ -52,20 +54,20 @@
> + 
> + # add optional link options
> + ifneq (,$(findstring $(OPT_LINKALL), $(CFLAGS)))
> +-	LDFLAGS += $(LINKALL)
> ++	override LDFLAGS += $(LINKALL)
> + ifneq (,$(findstring $(OPT_FF), $(CFLAGS)))
> +-	LDFLAGS += $(LINKALL_FF)
> ++	override LDFLAGS += $(LINKALL_FF)
> + endif
> + ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
> +-	LDFLAGS += $(LINKALL_RESAMPLE)
> ++	override LDFLAGS += $(LINKALL_RESAMPLE)
> + endif
> + ifneq (,$(findstring $(OPT_IR), $(CFLAGS)))
> +-	LDFLAGS += $(LINKALL_IR)
> ++	override LDFLAGS += $(LINKALL_IR)
> + endif
> + else
> + # if not LINKALL and linux add LINK_LINUX
> + ifeq ($(UNAME), Linux)
> +-	LDFLAGS += $(LINK_LINUX)
> ++	override LDFLAGS += $(LINK_LINUX)
> + endif
> + endif
> + 
> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
> new file mode 100644
> index 0000000..bbf536b
> --- /dev/null
> +++ b/package/squeezelite/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_SQUEEZELITE
> +	bool "squeezelite"
> +	depends on BR2_USE_WCHAR # flac
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +	depends on BR2_USE_MMU # mpg123
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_FLAC
> +	select BR2_PACKAGE_LIBMAD
> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_FAAD2
> +	select BR2_PACKAGE_MPG123
> +	help
> +	  Logitech Media Server client
> +
> +	  https://code.google.com/p/squeezelite/
> +
> +if BR2_PACKAGE_SQUEEZELITE
> +
> +config BR2_PACKAGE_SQUEEZELITE_FFMPEG
> +	bool "Enable WMA and ALAC decoding"
> +	default y
> +	select BR2_PACKAGE_FFMPEG
> +
> +config BR2_PACKAGE_SQUEEZELITE_DSD
> +	bool "Enable DSD decoding"
> +
> +config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
> +	bool "Enable resampling support"
> +	select BR2_PACKAGE_LIBSOXR
> +
> +config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
> +	bool "Enable visualiser support"
> +
> +endif
> +
> +comment "squeezelite needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeeze
> lite.mk
> new file mode 100644
> index 0000000..cf9e151
> --- /dev/null
> +++ b/package/squeezelite/squeezelite.mk
> @@ -0,0 +1,43 @@
> +############################################################################
> ####
> +#
> +# squeezelite
> +#
> +############################################################################
> ####
> +
> +SQUEEZELITE_VERSION = v1.8
> +SQUEEZELITE_SITE = https://github.com/robadenshi/squeezelite
> +SQUEEZELITE_SITE_METHOD = git
> +SQUEEZELITE_LICENSE = GPLv3
> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
> +SQUEEZELITE_MAKE_OPTS = -DLINKALL
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_FFMPEG),y)
> +SQUEEZELITE_DEPENDENCIES += ffmpeg
> +SQUEEZELITE_MAKE_OPTS += -DFFMPEG
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_DSD),y)
> +SQUEEZELITE_MAKE_OPTS += -DDSD
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
> +SQUEEZELITE_DEPENDENCIES += libsoxr
> +SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_VISEXPORT),y)
> +SQUEEZELITE_MAKE_OPTS += -DVISEXPORT
> +endif
> +
> +define SQUEEZELITE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
> +endef
> +
> +define SQUEEZELITE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/squeezelite \
> +		$(TARGET_DIR)/usr/bin/squeezelite
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.7.1
> 
> ============================================================
>     Hiroshi Kawashima
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
============================================================
    Hiroshi Kawashima
