From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Mar 2012 14:08:27 +0100
Subject: [Buildroot] [PATCHv2 1/1] vlc: New package
In-Reply-To: <1330923026-1917-2-git-send-email-ismael.luceno@gmail.com>
References: <1330923026-1917-1-git-send-email-ismael.luceno@gmail.com>
 <1330923026-1917-2-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203111408.28171.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 March 2012 05:50:26 Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>

 Impressive!

 BTW, the changelog is normally put under the commit message and three 
dashes, like this:

---
Changes since v1:
  * Added a description for the package
  * Described and signed-off the patch
  * Added configuration knobs for all available dependencies and other
    build options.


[snip]
> +comment "CODECs"

 I wouldn't spell codecs in all caps.  But that's a minor detail.

[snip]
> +VLC_CONF_OPTS += \
> +	--$(if $(BR2_PACKAGE_VLC_LOWMEM),en,dis}able-optimize-memory	\
> +	--$(if $(BR2_PACKAGE_VLC_SOUT),en,dis)able-sout			\
> +	--$(if $(BR2_PACKAGE_VLC_HTTPD),en,dis)able-httpd		\
> +	--$(if $(BR2_PACKAGE_VLC_VLM),en,dis)able-vlm			\
> +	--$(if $(BR2_PACKAGE_VLC_SCREEN),en,dis)able-screen		\
> +	--$(if $(BR2_PACKAGE_VLC_VCD),en,dis)able-vcd			\
> +	--$(if $(BR2_PACKAGE_VLC_VISUAL),en,dis)able-visual		\
> +	--$(if $(BR2_PACKAGE_VLC_ATMO),en,dis)able-atmo			\
> +	--$(if $(BR2_PACKAGE_VLC_OSS),en,dis)able-oss			\
> +	--$(if $(BR2_PACKAGE_VLC_FRONTEND),en,dis)able-vlc		\
> +	--$(if $(BR2_PACKAGE_VLC_XOSD),en,dis)able-xosd			\
> +	--$(if $(BR2_PACKAGE_VLC_FBOSD),en,dis)able-fbosd		\
> +	--$(if $(BR2_PACKAGE_VLC_PVR),en,dis)able-pvr			\
> +	--$(if $(BR2_PACKAGE_VLC_MEDIALIB),en,dis)able-media-library

 I would write this as
VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_LOWMEM),en,dis}able-optimize-memory
VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_SOUT),en,dis}able-sout
...
because it makes for cleaner patches.

> +
> +ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
> +VLC_CONF_OPTS += --enable-neon

 Is armv7-a the only architecture with Neon support?

 More generally, maybe we should have an architecture symbol for neon on
which this type of package can rely.

> +else
> +VLC_CONF_OPTS += --disable-neon
> +endif
> +
> +define VLC_CONFIGURE_CMDS
> +	echo $(VLC_VERSION) > $(@D)/src/revision.txt
> +	(cd $(@D); rm -rf config.cache; \
> +		test -x configure || ./bootstrap; \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		./configure \
> +		--prefix=/usr \
> +		--sysconfdir=/etc \
> +		--build=$(GNU_HOST_NAME) \
> +		--host=$(GNU_TARGET_NAME) \
> +		--disable-rpath \
> +		--enable-run-as-root \
> +		$(VLC_CONF_OPTS) \
> +		CXXFLAGS="$(TARGET_CXXFLAGS)"; \
> +	)
> +	$(SED) '1i#define HAVE_VASPRINTF 1' $(@D)/config.h
> +endef

 Why do the normal configure commands not work?

 The revision.txt could be done in POST_PATCH_HOOKS.

 The bootstrap can be done in PRE_CONFIGURE_HOOKS.  However, isn't vlc
distributed with a configure script?  So the bootstrap will never be
executed, right?

 The configure arguments can be added to VLC_CONF_OPTS.

 The vasprintf can be done in POST_CONFIGURE_HOOKS.

 For all of these, there should be a comment explaining why it is needed.
This will help later for version bumpers to remove it again, when it is
no longer needed because of upstream updates.

> +
> +define VLC_INSTALL_TARGET_CMDS
> +	find $(@D) -name '*.la' -exec $(SED) '/^relink_command=/d' '{}' +
> +	touch $(@D)/modules/access/zip/libzip_plugin.la \
> +		$(@D)/modules/misc/liblogger_plugin.la

 Again, I would put these in the POST_BUILD_HOOKS and use the normal
install commands.

> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(call AUTOTARGETS))
> 


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
