From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Feb 2017 17:58:20 +0100
Subject: [Buildroot] [V2 2/2] b2g: new package
In-Reply-To: <1468698548-23876-2-git-send-email-francois.perrad@gadz.org>
References: <1468698548-23876-1-git-send-email-francois.perrad@gadz.org>
 <1468698548-23876-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <889cbc19-5a2d-0586-2c7d-53aa197eb875@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francois,

 Sorry that it took so long to review this package, but obviously it is because
it's complicated.

 I've marked it as Changes Requested in patchwork. See my comments below. Or, if
you are no longer interested in this package, just drop it. I don't think it's a
big loss if Buildroot doesn't have it.


On 16-07-16 21:49, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Since this is a complicated package, a more extensive commit log would be
appropriate. For example, you should explain why you choose to implement things
this way. Cfr. the answers you gave to Thomas's review - if you need to give
such answers, it probably means they should have been in the commit log.

* Mozilla will stay with autoconf2.13.
* boot2gecko would be more descriptive, but upstream calls it B2G.
* The AudioChannelService.cpp patch is just a quick and dirty fix as a first
step to make things working.

 It would also be good to explain how you use this package, since it is actually
supposed to be installed on Android phones as far as I understand. Well,
obviously it's not that since it depends on Xorg...

 You should also include a changelog in your commit message to explain what
changed between v1 and v2 (or now between v2 and v3).

[snip]
> diff --git a/package/b2g/Config.in b/package/b2g/Config.in
> new file mode 100644
> index 0000000..ecf0fa0
> --- /dev/null
> +++ b/package/b2g/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_B2G
> +	bool "b2g"
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PDF
> +	select BR2_PACKAGE_CAIRO_TEE
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LIBFFI
> +	select BR2_PACKAGE_LIBGTK2
> +	select BR2_PACKAGE_LIBVPX
> +	select BR2_PACKAGE_OPENSSL # libcurl4-openssl
> +	select BR2_PACKAGE_XLIB_LIBXT
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2, libvpx
> +	depends on BR2_USE_MMU # libgtk2
> +	depends on BR2_USE_WCHAR # libgtk2
> +	help
> +	  B2G (Boot 2 Gecko), the Firefox OS desktop client.

 Can you explain a little more what it is? Is it just the GUI part, or an entire
OS (which B2G is supposed to be), or what?

> +
> +	  https://developer.mozilla.org/en-US/Firefox_OS
> +
> +comment "b2g needs a toolchain w/ wchar, threads, C++"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/b2g/b2g.mk b/package/b2g/b2g.mk
> new file mode 100644
> index 0000000..d872065
> --- /dev/null
> +++ b/package/b2g/b2g.mk
> @@ -0,0 +1,93 @@
> +################################################################################
> +#
> +# b2g
> +#
> +################################################################################
> +
> +B2G_VERSION = 2_5_20160125
> +B2G_SITE = https://hg.mozilla.org/releases/mozilla-b2g44_v2_5/archive

 It looks like the project (since it's been kicked out of Mozilla) has now moved
to https://github.com/mozilla-b2g. It would be nice if you could use that as an
upstream instead. If you decide to stick to this version, please explain why in
the commit message.

> +B2G_SOURCE = B2G_$(B2G_VERSION)_MERGEDAY.tar.gz
> +B2G_LICENSE = MPLv2.0

 I don't buy it. The license.html file lists almost 50 licenses, I don't believe
that none of these are actually used in the Buildroot build...

> +B2G_LICENSE_FILES = toolkit/content/license.html
> +
> +B2G_DEPENDENCIES = host-autoconf2-13 host-python jpeg libcurl libevent libgtk2 libvpx xlib_libXt

 Since this line is pretty long, please split in one per line.

 host-python3 isn't supported?

 It would be great if we could get rid of the autoconf2.13 dependency... But I
can imagine that it's tricky. Maybe the new upstream is more prepared to get rid
of it?

 You really need to add some explanation of how the build system works. This is
all very vague...

> +B2G_AC_OPTS = \
> +	--prefix=/usr \
> +	--target=$(GNU_TARGET_NAME) \
> +	--host=$(GNU_HOST_NAME) \
> +	--build=$(GNU_HOST_NAME) \
> +	--enable-application=b2g \
> +	--enable-xterm-updates \

 Explain what this option does.

> +	--disable-debug \
> +	--disable-tests \
> +	--enable-optimize \
> +	--enable-mobile-optimize \
> +	--disable-strip \
> +	--disable-install-strip \
> +	--disable-gconf \
> +	--with-system-bz2 \
> +	--with-system-jpeg \
> +	--with-system-libevent \
> +	--with-system-libvpx \
> +	--with-system-zlib \
> +	--enable-system-cairo \
> +	--enable-system-ffi \
> +	--enable-system-pixman \

 Weird to have this mix of with and enable options.

> +	--enable-default-toolkit=cairo-gtk2 \
> +	--disable-webrtc
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +B2G_DEPENDENCIES += alsa-lib
> +B2G_AC_OPTS += --enable-alsa
> +else
> +B2G_AC_OPTS += --disable-alsa
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
> +B2G_DEPENDENCIES += dbus-glib
> +B2G_AC_OPTS += --enable-dbus
> +else
> +B2G_AC_OPTS += --disable-dbus --disable-gamepad --disable-necko-wifi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
> +B2G_DEPENDENCIES += gst1-plugins-base
> +B2G_AC_OPTS += --enable-gstreamer=1.0
> +else ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
> +B2G_DEPENDENCIES += gst-plugins-base
> +B2G_AC_OPTS += --enable-gstreamer=0.10
> +else
> +B2G_AC_OPTS += --disable-gstreamer
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ICU),y)
> +B2G_DEPENDENCIES += icu
> +B2G_AC_OPTS += --with-intl-api --with-system-icu
> +else
> +B2G_AC_OPTS += --without-intl-api
> +endif
> +
> +B2G_CONF_ENV = \
> +	MOZ_OBJDIR=$(@D)/obj-b2g \
> +	CROSS_COMPILE=1 \
> +	AUTOCONF=$(HOST_DIR)/usr/bin/autoconf2.13 \
> +	PYTHON=$(HOST_DIR)/usr/bin/python
> +
> +define B2G_CONFIGURE_CMDS
> +	echo -e $(foreach opt,$(B2G_AC_OPTS),"\nac_add_options $(opt)") > $(@D)/mozconfig

 Better:

 	printf 'ac_add_options %s\n' $(B2G_AC_OPTS) > $(@D)/mozconfig

> +	$(TARGET_CONFIGURE_OPTS) $(B2G_CONF_ENV) \
> +		$(MAKE1) -C $(@D) -f client.mk configure
> +endef
> +
> +define B2G_BUILD_CMDS
> +	$(MAKE1) -C $(@D) -f client.mk build_all \

 TARGET_CONFIGURE_OPTS is no longer needed?

 Explain somewhere why MAKE1 is required.

> +		MOZ_OBJDIR=$(@D)/obj-b2g
> +	$(MAKE1) -C $(@D)/obj-b2g package
> +endef
> +
> +define B2G_INSTALL_TARGET_CMDS
> +	tar xfj $(@D)/obj-b2g/dist/b2g-*.tar.bz2 -C $(TARGET_DIR)/usr/lib

 Ouch, what a horrible way of installing stuff...

 Regards,
 Arnout

> +	ln -sf ../lib/b2g/b2g $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
