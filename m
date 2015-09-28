From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 23:03:37 +0200
Subject: [Buildroot] [PATCH v13 1/1] squeezelite: new package
In-Reply-To: <201509281246.t8SCktDe022277@ms-omx02.plus.so-net.ne.jp>
References: <201509281246.t8SCktDe022277@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20150928230337.105c6648@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Sep 2015 21:46:54 +0900, kei-k at ca2.so-net.ne.jp wrote:
> Dear, all.
> 
> Please review attached patch.
> 
> I've fixed SQUEEZELITE_BUILD_CMDS issue.
> I hope this will be the final version, and be pulled up.

Unfortunately you are still not following the good comments from
Vicente. Your commit log should *not* contain any "personal" messages.
All "personal" messages should go below the "---" sign.

> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
> new file mode 100644
> index 0000000..b4af3c8
> --- /dev/null
> +++ b/package/squeezelite/Config.in
> @@ -0,0 +1,46 @@
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
> +config BR2_PACKAGE_SQUEEZELITE_FF

Option should be suffixed _FFMPEG

> 	bool "Enable wma, alac decoding (by ffmpeg)"

"(by ffmpeg)" part not needed.

Also, please use:

	Enable WMA and ALAC decoding

> +	default y
> +	select BR2_PACKAGE_FFMPEG
> +	help
> +	  Enable wma, alac decoding

The help is useless here, so get rid of it.

> +
> +config BR2_PACKAGE_SQUEEZELITE_DSD
> +	bool "Enable dsd decoding"

Please use:

	"Enable Direct Speech Decoding"

or at least put DSD in capital letters.

> +	help
> +	  Enable built-in DSD decoder
> +
> +config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
> +	bool "Enable resampling function"

Rather than "function" use "support"

> +	select BR2_PACKAGE_LIBSOXR
> +	help
> +	  Enable resampling function

Again help text useless if it's just copy/pasting the prompt of the
option.

> +
> +config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
> +	bool "Enable Visualiser support"

	"Enable visualiser support"

(no need for a capital V)

> +	help
> +	  Enable Visualiser support

Useless help, should be removed.

> +
> +endif
> +
> +comment "squeezelite needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
> new file mode 100644
> index 0000000..f64da6a
> --- /dev/null
> +++ b/package/squeezelite/squeezelite.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# squeezelite
> +#
> +################################################################################
> +
> +SQUEEZELITE_VERSION = v1.8
> +SQUEEZELITE_SITE = https://github.com/robadenshi/squeezelite
> +SQUEEZELITE_SITE_METHOD = git
> +SQUEEZELITE_LICENSE = GPLv3
> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
> +SQUEEZELITE_MAKE_OPTS = -DLINKALL
> +SQUEEZELITE_MAKEFILE  = Makefile.buildroot
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_FF),y)
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
> +define SQUEEZELITE_CONFIGURE_CMDS
> +	sed -e '1aoverride CFLAGS += $$(OPTS)' \
> +		-e 's/LDFLAGS +=/override LDFLAGS +=/' \
> +		-e 's/LDFLAGS ?=/override LDFLAGS +=/' \
> +		$(@D)/Makefile >$(@D)/$(SQUEEZELITE_MAKEFILE)
> +endef

Don't do this. Create a patch for the Makefile that does the necessary
changes.

> +
> +define SQUEEZELITE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
> +		-f $(SQUEEZELITE_MAKEFILE) -C $(@D) all
> +endef
> +
> +define SQUEEZELITE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin

You must use a full path as the destination, i.e:

	$(TARGET_DIR)/usr/bin/squeezelite

Can you fix the above issues and send an updated version? Please be
careful to take into account all the comments. If you have some doubts
about certain comments, simply ask questions as a reply to this e-mail
rather than sending many iterations of the patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
