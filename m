From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:26:20 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mjpg-streamer: New package
In-Reply-To: <1422196772-17463-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422196772-17463-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150125182620.29d8efc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 25 Jan 2015 15:39:32 +0100, Bernd Kuhls wrote:

> diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
> new file mode 100644
> index 0000000..0c61d7f
> --- /dev/null
> +++ b/package/mjpg-streamer/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_MJPG_STREAMER
> +	bool "mjpg-streamer"
> +	# linux/uvcvideo.h was added in kernel 2.6.40

2.6.40 never existed.

> +	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)

Why not use dependencies on BR2_TOOLCHAIN_HEADERS_AT_LEAST_XX ?

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_JPEG
> +	help
> +	  MJPG-streamer takes JPGs from Linux-UVC compatible webcams, filesystem
> +	  or other input plugins and streams them as M-JPEG via HTTP to
> +	  webbrowsers, VLC and other software.
> +
> +	  http://mjpg-streamer.sourceforge.net
> +
> +comment "mjpg-streamer needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

You must add a:

	depends on BR2_USE_MMU

here so that the comment doesn't show up on MMU-less systems.

> +define MJPG_STREAMER_FIX_MAKEFILE
> +	cd $(@D); \
> +	for i in `find -iname Makefile`; do \
> +		$(SED) "s/^CC = gcc/#CC = gcc/g" $$i; \
> +	done
> +endef

This is not needed if you pass CC= as a make option rather than in the
environment.

> +MJPG_STREAMER_PRE_CONFIGURE_HOOKS = MJPG_STREAMER_FIX_MAKEFILE
> +
> +define MJPG_STREAMER_BUILD_CMDS
> +	CC=$(TARGET_CC) \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	$(MAKE) -C $(@D)
> +endef

Can you use:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

instead ?

This will pass CC=$(TARGET_CC) *after* $(MAKE), so that it takes
precedence over the CC defined in the mjpg-streamer Makefile.

However, note that doing this will also override the CFLAGS defined by
the mjpg-streamer Makefile. If you want to keep the CFLAGS from the
mjpg-streamer Makefile, then the lines CFLAGS += ... should be changed
to "override CFLAGS += ...".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
