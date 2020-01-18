From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 18:37:35 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: fix libvpx build
In-Reply-To: <20200115210154.1431967-1-bernd.kuhls@t-online.de>
References: <20200115210154.1431967-1-bernd.kuhls@t-online.de>
Message-ID: <20200118173735.GB32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-01-15 22:01 +0100, Bernd Kuhls spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Fixes:
> http://autobuild.buildroot.net/results/4be/4be6df27f33e4fd6955e47892e1650a9d5ebbded/
> 
> Removed old patch.
> 
> Source of the new patch:
> http://lists.busybox.net/pipermail/buildroot/2020-January/270707.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

BTW, I just noticed you assigned that patch to me as author, and I'm not
sure why (yeah, I provided the blurb, but you applied it and tested it
and submitted it). Anyway, too late now.

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
> v2: using FREESWITCH_PRE_BUILD_HOOKS we are building libvpx ourselves
>     (Yann)
> 
>  .../0001-Fix-cross-compiling-libvpx.patch     | 29 ----------------
>  package/freeswitch/freeswitch.mk              | 33 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 29 deletions(-)
>  delete mode 100644 package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> 
> diff --git a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> deleted file mode 100644
> index 63fa33b93a..0000000000
> --- a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fix cross-compiling libvpx
> -
> -Freeswitch since version 1.6.7 only uses an in-tree-version of libvpx:
> -https://freeswitch.org/fisheye/changelog/freeswitch?cs=febe0f8dacea2d2a31902b3dc469be757f8c3c4d
> -
> -It is not possible to use an external version of libvpx anymore.
> -Unfortunately the freeswitch build system has no support for cross-
> -compiling libvpx so we need to patch Makefile to pass CROSS from
> -package/freeswitch/freeswitch.mk and add target=generic-gnu as
> -configure parameter:
> -https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/libs/libvpx/README#110
> -
> -And yes, autoreconf is also broken, so we patch Makefile.in instead
> -of Makefile.am.
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -
> -diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
> ---- freeswitch-1.6.7.org/Makefile.in	2016-04-01 18:09:54.000000000 +0200
> -+++ freeswitch-1.6.7/Makefile.in	2016-04-22 20:11:37.938961730 +0200
> -@@ -4182,7 +4182,7 @@
> - 	cd libs/libzrtp && $(MAKE)
> - 
> - libs/libvpx/Makefile: libs/libvpx/.update
> --	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
> -+	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
> - 
> - libs/libvpx/libvpx.a: libs/libvpx/Makefile libs/libvpx/.update
> - 	@cd libs/libvpx && $(MAKE)
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index d743e60f1c..5985df4a6e 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -309,6 +309,39 @@ FREESWITCH_CONF_OPTS += --enable-libvpx --enable-libyuv
>  FREESWITCH_DEPENDENCIES += host-yasm ffmpeg
>  FREESWITCH_ENABLED_MODULES += applications/mod_av applications/mod_fsv
>  FREESWITCH_MAKE_ENV += CROSS=$(TARGET_CROSS)
> +
> +# Freeswitch's buildsystem forgets to pass important environment
> +# variables and config options when it configures libvpx, so
> +# pre-build libvpx manually, so Freeswitch does not attempt to run
> +# its flawed commands...
> +# Freeswitch only ever uses the static libtrary, that's hard-coded,
> +# we can't do anything about that...
> +# From package/libvpx/libvpx.mk:
> +# - this is not a true autotools package.  It is based on the ffmpeg
> +#   build system.
> +# - ld is being used with cc options. therefore, pretend ld is cc.
> +define FREESWITCH_BUILD_LIBVPX
> +	cd $(@D)/libs/libvpx && \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(TARGET_CONFIGURE_ARGS) \
> +	LD="$(TARGET_CC)" \
> +	CROSS=$(GNU_TARGET_NAME) \
> +	./configure \
> +		--target=generic-gnu \
> +		--enable-pic \
> +		--prefix=/usr \
> +		--disable-shared --enable-static \
> +		--disable-examples \
> +		--disable-docs \
> +		--disable-unit-tests && \
> +	$(TARGET_MAKE_ENV) \
> +	$(LIBVPX_MAKE_ENV) \
> +	$(MAKE) \
> +		-C $(@D)/libs/libvpx \
> +		all
> +endef
> +FREESWITCH_PRE_BUILD_HOOKS += FREESWITCH_BUILD_LIBVPX
> +
>  else
>  FREESWITCH_CONF_OPTS += --disable-libvpx --disable-libyuv
>  endif
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
