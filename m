From: Chih-Min Chao <cmchao@gmail.com>
Date: Wed, 6 Oct 2010 11:42:34 +0800
Subject: [Buildroot] [PATCH 09/10] mplayer: convert to gentargets
In-Reply-To: <1286266963-23413-9-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-9-git-send-email-Martin.Banky@gmail.com>
Message-ID: <AANLkTinB19PdEHHv7zfV9p2RwKoCv5_syOZDWQ4wBLhu@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 5, 2010 at 4:22 PM, Martin Banky <martin.banky@gmail.com> wrote:
> Would have bumped the version, but someone smarter than me is going to have to
> do it.
>
> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
> ---
> ?package/multimedia/mplayer/mplayer.mk | ? 88 +++++++++++---------------------
> ?1 files changed, 30 insertions(+), 58 deletions(-)
>
> diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
> index ac3a67e..a53c687 100644
> --- a/package/multimedia/mplayer/mplayer.mk
> +++ b/package/multimedia/mplayer/mplayer.mk
> @@ -3,67 +3,54 @@
> ?# mplayer
> ?#
> ?#############################################################
> -MPLAYER_VERSION:=1.0rc2
> -MPLAYER_SOURCE:=MPlayer-$(MPLAYER_VERSION).tar.bz2
> -MPLAYER_SITE:=http://www7.mplayerhq.hu/MPlayer/releases
> -MPLAYER_DIR:=$(BUILD_DIR)/MPlayer-$(MPLAYER_VERSION)
> -MPLAYER_CAT:=$(BZCAT)
> -MPLAYER_BINARY:=mplayer
> -MPLAYER_TARGET_BINARY:=usr/bin/$(MPLAYER_BINARY)
> +MPLAYER_VERSION = 1.0rc2
> +MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.bz2
> +MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
>
> ?MPLAYER_DEPENDENCIES = \
> ? ? ? ?$(if $(BR2_PACKAGE_LIBMAD),libmad) \
> ? ? ? ?$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)
>
> ?ifeq ($(BR2_ENDIAN),"BIG")
> -MPLAYER_ENDIAN:=--enable-big-endian
> +MPLAYER_CONF_OPTS += --enable-big-endian
> ?else
> -MPLAYER_ENDIAN:=--disable-big-endian
> +MPLAYER_CONF_OPTS += --disable-big-endian
> ?endif

How about using  MPLAYER_CONF_OPT += --disable-sdl  rather than
creating new var ?
>
> -# mplayer unfortunately uses --disable-largefileS, so we cannot use
> +# mplayer unfortunately uses --disable-largefiles, so we cannot use
> ?# DISABLE_LARGEFILE
> ?ifeq ($(BR2_LARGEFILE),y)
> -MPLAYER_LARGEFILE:=--enable-largefiles
> +MPLAYER_CONF_OPTS += --enable-largefiles
> ?else
> ?# dvdread/dvdcss requires largefile support
> -MPLAYER_LARGEFILE:=--disable-largefiles \
> +MPLAYER_CONF_OPTS += --disable-largefiles \
> ? ? ? ? ? ? ? ? ? --disable-dvdread-internal \
> ? ? ? ? ? ? ? ? ? --disable-libdvdcss-internal
> ?endif
>
> ?ifeq ($(BR2_PACKAGE_SDL),y)
> -MPLAYER_SDL:=--enable-sdl --with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config
> +MPLAYER_CONF_OPTS += --enable-sdl --with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config
> ?MPLAYER_DEPENDENCIES += sdl
> ?else
> -MPLAYER_SDL:=--disable-sdl
> +MPLAYER_CONF_OPTS += --disable-sdl
> ?endif
>
> ?ifeq ($(BR2_PACKAGE_FREETYPE),y)
> -MPLAYER_FREETYPE:= \
> +MPLAYER_CONF_OPTS += ?\
> ? ? ? ?--enable-freetype \
> ? ? ? ?--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
> ?MPLAYER_DEPENDENCIES += freetype
> ?else
> -MPLAYER_FREETYPE:=--disable-freetype
> +MPLAYER_CONF_OPTS += --disable-freetype
> ?endif
>
> ?ifeq ($(BR2_i386),y)
> ?# This seems to be required to compile some of the inline asm
> -MPLAYER_CFLAGS:=-fomit-frame-pointer
> +MPLAYER_CFLAGS = -fomit-frame-pointer
> ?endif
>
> -$(DL_DIR)/$(MPLAYER_SOURCE):
> - ? ? ? $(call DOWNLOAD,$(MPLAYER_SITE),$(MPLAYER_SOURCE))
> -
> -$(MPLAYER_DIR)/.unpacked: $(DL_DIR)/$(MPLAYER_SOURCE)
> - ? ? ? $(MPLAYER_CAT) $(DL_DIR)/$(MPLAYER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> - ? ? ? toolchain/patch-kernel.sh $(MPLAYER_DIR) package/multimedia/mplayer/ mplayer-$(MPLAYER_VERSION)\*.patch\*
> - ? ? ? $(CONFIG_UPDATE) $(MPLAYER_DIR)
> - ? ? ? touch $@
> -
> -$(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
> - ? ? ? (cd $(MPLAYER_DIR); rm -rf config.cache; \
> +define MPLAYER_CONFIGURE_CMDS
> + ? ? ? (cd $(@D); rm -rf config.cache; \
> ? ? ? ? ? ? ? ?$(TARGET_CONFIGURE_OPTS) \
> ? ? ? ? ? ? ? ?$(TARGET_CONFIGURE_ARGS) \
> ? ? ? ? ? ? ? ?CFLAGS="$(TARGET_CFLAGS) $(MPLAYER_CFLAGS)" \
> @@ -80,44 +67,29 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
> ? ? ? ? ? ? ? ?--charset=UTF-8 \
> ? ? ? ? ? ? ? ?--enable-mad \
> ? ? ? ? ? ? ? ?--enable-fbdev \
> - ? ? ? ? ? ? ? $(MPLAYER_ENDIAN) \
> - ? ? ? ? ? ? ? $(MPLAYER_LARGEFILE) \
> - ? ? ? ? ? ? ? $(MPLAYER_SDL) \
> - ? ? ? ? ? ? ? $(MPLAYER_FREETYPE) \
> + ? ? ? ? ? ? ? $(MPLAYER_CONF_OPTS) \
> ? ? ? ? ? ? ? ?--enable-cross-compile \
> ? ? ? ? ? ? ? ?--disable-ivtv \
> ? ? ? ? ? ? ? ?--disable-tv \
> ? ? ? ? ? ? ? ?--disable-live \
> ? ? ? ? ? ? ? ?--enable-dynamic-plugins \
> ? ? ? ?)
> - ? ? ? touch $@
> -
> -$(MPLAYER_DIR)/$(MPLAYER_BINARY): $(MPLAYER_DIR)/.configured
> - ? ? ? $(MAKE1) -C $(MPLAYER_DIR)
> - ? ? ? touch -c $@
> +endef
merge target option to (PKG)_CONF_OPT and defining CONFIGURE_CMDS   is
not necessary

>
> -$(TARGET_DIR)/$(MPLAYER_TARGET_BINARY): $(MPLAYER_DIR)/$(MPLAYER_BINARY)
> - ? ? ? $(INSTALL) -m 0755 -D $(MPLAYER_DIR)/$(MPLAYER_BINARY) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
> - ? ? ? -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
> - ? ? ? touch -c $@
> +define MPLAYER_BUILD_CMDS
> + ? ? ? $(MAKE1) -C $(@D)
> +endef

is it necessary ?
>
> -mplayer: $(MPLAYER_DEPENDENCIES) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
> +define MPLAYER_INSTALL_TARGET_CMDS
> + ? ? ? $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
>
> -mplayer-source: $(DL_DIR)/$(MPLAYER_SOURCE)
> +define MPLAYER_UNINSTALL_TARGET_CMDS
> + ? ? ? $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
> +endef
>
> -mplayer-unpacked: $(MPLAYER_DIR)/.unpacked
> +define MPLAYER_CLEAN_CMDS
> + ? ? ? $(MAKE) -C $(@D) clean
> +endef
>
> -mplayer-clean:
> - ? ? ? rm -f $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
> - ? ? ? -$(MAKE) -C $(MPLAYER_DIR) clean
> -
> -mplayer-dirclean:
> - ? ? ? rm -rf $(MPLAYER_DIR)
> -#############################################################
> -#
> -# Toplevel Makefile options
> -#
> -#############################################################
> -ifeq ($(BR2_PACKAGE_MPLAYER),y)
> -TARGETS+=mplayer
> -endif
> +$(eval $(call GENTARGETS,package/multimedia,mplayer))
> --
> 1.7.3.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
