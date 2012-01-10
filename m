From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Jan 2012 20:20:17 +0100
Subject: [Buildroot] [PATCH v2] Add pygame package
In-Reply-To: <1326218264-6286-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Tue, 10 Jan 2012 18:57:44 +0100")
References: <1326218264-6286-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <871ur7cqku.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

Hi,

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> ---
 julien>  Changes since v1:
 julien>  - moved pygame to package/python-pygame and to "external python modules" menu
 julien>    as requested by Yegor Yefremov

 julien>  package/Config.in                      |    1 +
 julien>  package/python-pygame/Config.in        |   55 ++++++++++++++++
 julien>  package/python-pygame/python-pygame.mk |  107 ++++++++++++++++++++++++++++++++
 julien>  3 files changed, 163 insertions(+), 0 deletions(-)
 julien>  create mode 100644 package/python-pygame/Config.in
 julien>  create mode 100644 package/python-pygame/python-pygame.mk

 julien> diff --git a/package/Config.in b/package/Config.in
 julien> index a82c658..c45cf56 100644
 julien> --- a/package/Config.in
 julien> +++ b/package/Config.in
 julien> @@ -242,6 +242,7 @@ menu "external python modules"
 julien>  source "package/python-dpkt/Config.in"
 julien>  source "package/python-mad/Config.in"
 julien>  source "package/python-netifaces/Config.in"
 julien> +source "package/python-pygame/Config.in"
 julien>  source "package/python-serial/Config.in"
 julien>  source "package/python-setuptools/Config.in"
 julien>  endmenu
 julien> diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
 julien> new file mode 100644
 julien> index 0000000..47a1792
 julien> --- /dev/null
 julien> +++ b/package/python-pygame/Config.in
 julien> @@ -0,0 +1,55 @@
 julien> +config BR2_PACKAGE_PYTHON_PYGAME
 julien> +	bool "pygame"
 julien> +	depends on BR2_PACKAGE_PYTHON
 julien> +	select BR2_PACKAGE_SDL
 julien> +	help
 julien> +	  Pygame is a cross-platfrom library designed to make it easy to write
 julien> +	  multimedia software, such as games, in Python. Pygame requires the
 julien> +	  Python language and SDL multimedia library.
 julien> +	  It can also make use of several other popular libraries.
 julien> +
 julien> +	  http://www.pygame.org/
 julien> +
 julien> +menu "pygame optional modules selection"
 julien> +	depends on BR2_PACKAGE_PYTHON_PYGAME
 julien> +
 julien> +config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
 julien> +	bool "pygame.image"
 julien> +	depends on BR2_PACKAGE_SDL_IMAGE_PNG && BR2_PACKAGE_SDL_IMAGE_JPEG

SDL_IMAGE is a library, so just select it instead of depends on.

 julien> +	help
 julien> +	  pygame module for loading, saving and transfering images
 julien> +
 julien> +comment "pygame.image requires sdl_image with png and jpeg support"
 julien> +	depends on !BR2_PACKAGE_SDL_IMAGE_PNG || !BR2_PACKAGE_SDL_IMAGE_JPEG

And then drop this comment.

 julien> +
 julien> +config BR2_PACKAGE_PYTHON_PYGAME_FONT
 julien> +	bool "pygame.font"
 julien> +	depends on BR2_PACKAGE_SDL_TTF
 julien> +	help
 julien> +	  pygame module for loading and rendering fonts
 julien> +
 julien> +comment "pygame.font requires sdl_ttf"
 julien> +	depends on !BR2_PACKAGE_SDL_TTF

Same here.

 julien> +
 julien> +config BR2_PACKAGE_PYTHON_PYGAME_MIXER
 julien> +	bool "pygame.mixer"
 julien> +	depends on BR2_PACKAGE_SDL_MIXER
 julien> +	help
 julien> +	  pygame module for loading and playing sounds
 julien> +
 julien> +comment "pygame.mixer requires sdl_mixer"
 julien> +	depends on !BR2_PACKAGE_SDL_MIXER

And here.

 julien> +
 julien> +config BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
 julien> +	bool "pygame.mixer.music"
 julien> +	depends on BR2_PACKAGE_PYTHON_PYGAME_MIXER
 julien> +	help
 julien> +	  pygame module for controlling streamed audio
 julien> +
 julien> +config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
 julien> +	bool "pygame.scrap"
 julien> +	depends on BR2_PACKAGE_SDL_X11
 julien> +	help
 julien> +	  pygame module for clipboard support (X11 needed)
 julien> +
 julien> +endmenu
 julien> diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
 julien> new file mode 100644
 julien> index 0000000..8fb52ff
 julien> --- /dev/null
 julien> +++ b/package/python-pygame/python-pygame.mk
 julien> @@ -0,0 +1,107 @@
 julien> +#############################################################
 julien> +#
 julien> +# Pygame
 julien> +#
 julien> +#############################################################
 julien> +# stable 1.9.1 release requires V4L which has been wiped out of recent Linux
 julien> +# kernels, so use latest mercurial revision until next stable release is out.
 julien> +PYTHON_PYGAME_VERSION = f0bb4a4b365d
 julien> +PYTHON_PYGAME_SOURCE  = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 julien> +PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 julien> +PYTHON_PYGAME_SITE_METHOD = hg
 julien> +
 julien> +ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
 julien> +PYTHON_PYGAME_OPT_DEPENDS += sdl_image
 julien> +endif
 julien> +
 julien> +ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
 julien> +PYTHON_PYGAME_OPT_DEPENDS += sdl_ttf
 julien> +endif
 julien> +
 julien> +ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
 julien> +PYTHON_PYGAME_OPT_DEPENDS += sdl_mixer
 julien> +endif
 julien> +
 julien> +ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MOVIE),y)
 julien> +PYTHON_PYGAME_OPT_DEPENDS += smpeg
 julien> +endif

Hmm, I didn't see any PYGAME_MOVIE in Config.in?

 julien> +
 julien> +PYTHON_PYGAME_DEPENDENCIES = python sdl $(PYTHON_PYGAME_OPT_DEPENDS)
 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_IMAGE
 julien> +	$(SED) 's/^imageext/#imageext/' $(@D)/Setup
 julien> +endef
 julien> +endif
 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_FONT
 julien> +	$(SED) 's/^font/#font/' $(@D)/Setup
 julien> +endef
 julien> +endif
 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_MIXER
 julien> +	$(SED) 's/^mixer/#mixer/g' $(@D)/Setup
 julien> +endef
 julien> +endif
 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SNDARRAY),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_SNDARRAY
 julien> +	$(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
 julien> +endef
 julien> +endif

This one neither.

 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SURFARRAY),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_SURFARRAY
 julien> +	$(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
 julien> +endef
 julien> +endif

Or this one.

 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MOVIE),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_MOVIE
 julien> +	$(SED) 's/^movie/#movie/' $(@D)/Setup
 julien> +endef
 julien> +endif
 julien> +
 julien> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)
 julien> +define PYTHON_PYGAME_CONFIGURE_SCRAP
 julien> +	$(SED) 's/^scrap/#scrap/' $(@D)/Setup
 julien> +endef
 julien> +endif
 julien> +
 julien> +PYTHON_PYGAME_SDL_FLAGS = $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
 julien> +PYTHON_PYGAME_SDL_FLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)
 julien> +
 julien> +# Pygame needs a Setup file where options should be commented out if
 julien> +# dependencies are not available
 julien> +define PYTHON_PYGAME_CONFIGURE_CMDS
 julien> +	cp -f $(@D)/Setup.in $(@D)/Setup
 julien> +	$(SED) 's<^SDL = <SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#<' $(@D)/Setup

Minor: We normally use '/' as seperator, and '~' if slashes are possible
in value (like here).

 julien> +	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
 julien> +	$(PYTHON_PYGAME_CONFIGURE_IMAGE)
 julien> +	$(PYTHON_PYGAME_CONFIGURE_FONT)
 julien> +	$(PYTHON_PYGAME_CONFIGURE_MIXER)
 julien> +	$(PYTHON_PYGAME_CONFIGURE_SNDARRAY)
 julien> +	$(PYTHON_PYGAME_CONFIGURE_SURFARRAY)
 julien> +	$(PYTHON_PYGAME_CONFIGURE_MOVIE)
 julien> +	$(PYTHON_PYGAME_CONFIGURE_SCRAP)
 julien> +endef
 julien> +
 julien> +define PYTHON_PYGAME_BUILD_CMDS
 julien> +	(cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 julien> +		LDSHARED="$(TARGET_CROSS)gcc -shared" \
 julien> +		$(HOST_DIR)/usr/bin/python setup.py build)
 julien> +endef
 julien> +
 julien> +define PYTHON_PYGAME_INSTALL_TARGET_CMDS
 julien> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr && \
 julien> +	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs && \
 julien> +	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests)
 julien> +endef

docs should only get removed if !BR2_HAVE_DOCUMENTATION.

Otherwise it looks good. Care to fix and resubmit?

-- 
Bye, Peter Korsgaard
