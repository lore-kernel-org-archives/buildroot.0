From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 22:16:34 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <d0ce7b4624a0a4fc886c8fcbc9c6730e7a931981.1317636624.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 3 Oct 2011 12:10:34 +0200")
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <d0ce7b4624a0a4fc886c8fcbc9c6730e7a931981.1317636624.git.maxime.ripard@free-electrons.com>
Message-ID: <871uurnqhp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> From: Maxime Ripard <maxime@free-electrons.com>
 Maxime> +config BR2_PACKAGE_LIBPLAYER
 Maxime> +	depends on BR2_LARGEFILE
 Maxime> +	bool "libplayer"
 Maxime> +	help
 Maxime> +	  libplayer provides a generic A/V API that relies on various multimedia
 Maxime> +	  player for Linux systems. It currently supports MPlayer, xine VLC and
 Maxime> +	  GStreamer only
 Maxime> +
 Maxime> +	  http://libplayer.geexbox.org/
 Maxime> +
 Maxime> +comment "Libplayer requires a toolchain with LARGEFILE support"
 Maxime> +	depends on !BR2_LARGEFILE
 Maxime> +

This should go under the 'if BR2_PACKAGE_LIBPLAYER' conditional.

 Maxime> +if BR2_PACKAGE_LIBPLAYER
 Maxime> +config BR2_PACKAGE_LIBPLAYER_MPLAYER
 Maxime> +	depends on BR2_PACKAGE_MPLAYER
 Maxime> +	bool "Libplayer mplayer backend"
 Maxime> +
 Maxime> +config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 Maxime> +	depends on BR2_PACKAGE_GSTREAMER
 Maxime> +	bool "Libplayer GStreamer backend"
 Maxime> +
 Maxime> +config BR2_PACKAGE_LIBPLAYER_PYTHON
 Maxime> +	depends on BR2_PACKAGE_PYTHON
 Maxime> +	bool "Libplayer python bindings"
 Maxime> +endif
 Maxime> +

Empty line.

Does libplayer do anything sensible with both backends disabled or do we
need to depend on BR2_PACKAGE_MPLAYER || BR2_PACKAGE_GSTREAMER?

Does it need any specific gstreamer plugins (like playbin2)?

 Maxime> diff --git a/package/multimedia/libplayer/libplayer.mk b/package/multimedia/libplayer/libplayer.mk
 Maxime> new file mode 100644
 Maxime> index 0000000..1552431
 Maxime> --- /dev/null
 Maxime> +++ b/package/multimedia/libplayer/libplayer.mk
 Maxime> @@ -0,0 +1,44 @@
 Maxime> +#############################################################
 Maxime> +#
 Maxime> +# libplayer
 Maxime> +#
 Maxime> +#############################################################
 Maxime> +LIBPLAYER_VERSION = 2.0.1
 Maxime> +LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
 Maxime> +LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
 Maxime> +
 Maxime> +# When passing the standard buildroot configure arguments, the configure script
 Maxime> +# breaks on --target and --host options. Thus we need to define a configure cmd
 Maxime> +# ourselves.
 Maxime> +define LIBPLAYER_CONFIGURE_CMDS
 Maxime> +	(cd $(@D) && rm -rf config.cache && \
 Maxime> +	$(TARGET_CONFIGURE_OPTS) \
 Maxime> +	$(TARGET_CONFIGURE_ARGS) \
 Maxime> +	./configure \
 Maxime> +		--prefix=/usr \
 Maxime> +		--cross-compile \
 Maxime> +		$(SHARED_STATIC_LIBS_OPTS) \
 Maxime> +		$(QUIET) $(LIBPLAYER_CONF_OPT) \

Is that $(QUIET) correct?

./configure -q          ~/source/buildroot/test/build/libplayer-2.0.1
Unknown option "-q".
See ./configure --help for available options.

It doesn't look like it.

I did a test build, but configure dies right away:

Checking for compiler available...
Error, can't find pthread_mutex_init !
See file "config.log" produced by configure for more details.

config.log contains:

/home/peko/source/buildroot/test/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_REENTRANT -pipe -Os -W -Wall -E 
-o /tmp/libplayer-6047-14742-29987.o /tmp/libplayer-6150-14742-15899.c
In file included from /home/peko/source/buildroot/test/host/usr/arm-unknown-linu
x-uclibcgnueabi/sysroot/usr/include/pthread.h:23,
                 from /tmp/libplayer-6150-14742-15899.c:1:
/home/peko/source/buildroot/test/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.

So it seems you need to depend on BR2_LARGEFILE.

-- 
Bye, Peter Korsgaard
