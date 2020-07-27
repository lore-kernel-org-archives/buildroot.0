From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 18:21:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/alac: new package
In-Reply-To: <20200727152720.8427-1-marc.chalain@gmail.com>
References: <20200727152720.8427-1-marc.chalain@gmail.com>
Message-ID: <5f13e688-783b-40ef-fe4d-e8483b135fa4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marc,

Le 27/07/2020 ? 17:27, Marc Chalain a ?crit?:
> From: Marc Chalain <marc.chalain@smile.fr>
> 
> The Apple Lossless Audio Codec (ALAC) is an audio codec developed by Apple and supported on iPhone, iPad, most iPods, Mac and iTunes. ALAC is a data compression method which reduces the size of audio files with no loss of information. A decoded ALAC stream is bit-for-bit identical to the original uncompressed audio file.
> 
> https://macosforge.github.io/alac/
> 
> A patch fix problem to link the convert utility with libalac.a

Did you try with the alac library provided by libaudiofile package ?
It's seems libaudiofile provide the same functionality.

Best regards,
Romain

> 
> Signed-off-by: Marc Chalain <marc.chalain@smile.fr>
> ---
>  package/Config.in                             |  1 +
>  ...rary-and-objects-to-link-all-symbols.patch | 26 ++++++++++++++
>  package/alac/Config.in                        | 16 +++++++++
>  package/alac/alac.hash                        |  2 ++
>  package/alac/alac.mk                          | 35 +++++++++++++++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch
>  create mode 100644 package/alac/Config.in
>  create mode 100644 package/alac/alac.hash
>  create mode 100644 package/alac/alac.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5c30d27b7a..4a03a67a0d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1239,6 +1239,7 @@ endmenu
>  menu "Libraries"
>  
>  menu "Audio/Sound"
> +	source "package/alac/Config.in"
>  	source "package/alsa-lib/Config.in"
>  	source "package/alure/Config.in"
>  	source "package/aubio/Config.in"
> diff --git a/package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch b/package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch
> new file mode 100644
> index 0000000000..580a18d3a6
> --- /dev/null
> +++ b/package/alac/0001-reorder-library-and-objects-to-link-all-symbols.patch
> @@ -0,0 +1,26 @@
> +convert-utility: reorder library and objects to link all symbols
> +
> +Signed-off-by: Marc Chalain <marc.chalain@smile.fr>
> +
> +--- a/convert-utility/makefile
> ++++ b/convert-utility/makefile
> +@@ -1,7 +1,8 @@
> + # alacconvert make
> + 
> + CFLAGS = -g -O3 -c
> +-LFLAGS = -Wall -L$(CODECDIR) -lalac
> ++LFLAGS = -Wall -L$(CODECDIR)
> ++LIBS = -lalac
> + CC = g++
> + 
> + SRCDIR = .
> +@@ -30,7 +31,7 @@ CAFFileALAC.o
> + 
> + alacconvert:	$(OBJS)
> + 	(cd $(CODECDIR); $(MAKE))
> +-	$(CC) $(LFLAGS) $(OBJS) -o alacconvert
> ++	$(CC) $(LFLAGS) $(OBJS) $(LIBS) -o alacconvert
> + 
> + main.o : main.cpp
> + 	$(CC) -I $(INCLUDES) $(CFLAGS) main.cpp
> +
> diff --git a/package/alac/Config.in b/package/alac/Config.in
> new file mode 100644
> index 0000000000..2f1d4a1077
> --- /dev/null
> +++ b/package/alac/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_ALAC
> +	bool "Apple Lossless Audio Codec"
> +	help
> +	  Alac is an audio codec developed by Apple and
> +	  supported on iPhone, iPad, most iPods, Mac and
> +	  iTunes. ALAC is a data compression method which
> +	  reduces the size of audio files with no loss
> +	  of information. A decoded ALAC stream is bit-for-bit
> +	  identical to the original uncompressed audio file
> +
> +	  https://macosforge.github.io/alac/
> +
> +
> +config BR2_PACKAGE_ALAC_CONVERT
> +	bool "binary converter"
> +	depends on BR2_PACKAGE_ALAC
> diff --git a/package/alac/alac.hash b/package/alac/alac.hash
> new file mode 100644
> index 0000000000..9477916558
> --- /dev/null
> +++ b/package/alac/alac.hash
> @@ -0,0 +1,2 @@
> +sha256 98635ece42fb1c3fceb75eaa4b5164d866e09f0195b3e7ec4085f1123c5e272f  alac-c38887c5c5e64a4b31108733bd79ca9b2496d987.tar.gz
> +sha256 a337314dd82d26791112c1e5a85725b2eb92f5b7e6f9102fa4eaa2903f77518f  LICENSE
> diff --git a/package/alac/alac.mk b/package/alac/alac.mk
> new file mode 100644
> index 0000000000..64227eaa2e
> --- /dev/null
> +++ b/package/alac/alac.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# alac
> +#
> +################################################################################
> +
> +ALAC_VERSION = c38887c5c5e64a4b31108733bd79ca9b2496d987
> +ALAC_SITE =$(call github,macosforge,alac,$(ALAC_VERSION))
> +ALAC_LICENSE = APACHE
> +ALAC_LICENSE_FILES = LICENSE
> +ALAC_INSTALL_STAGING = YES
> +
> +ALAC_MAKE_OPTS =  CC=$(TARGET_CXX)
> +
> +ifeq ($(BR2_PACKAGE_ALAC_CONVERT),y)
> +define ALACCONVERT_BUILD_CMDS
> +	$(MAKE) $(ALAC_MAKE_OPTS) -C $(@D)/convert-utility
> +endef
> +define ALAC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/convert-utility/alacconvert $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +define ALAC_BUILD_CMDS
> +	$(MAKE) $(ALAC_MAKE_OPTS) -C $(@D)/codec
> +	$(ALACCONVERT_BUILD_CMDS)
> +endef
> +
> +define ALAC_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/codec/libalac.a      $(STAGING_DIR)/usr/lib/libalac.a
> +	$(INSTALL) -D -m 644 $(@D)/codec/ALACDecoder.h  $(STAGING_DIR)/usr/include/ALACDecoder.h
> +	$(INSTALL) -D -m 644 $(@D)/codec/ALACEncoder.h  $(STAGING_DIR)/usr/include/ALACEncoder.h
> +endef
> +
> +$(eval $(generic-package))
> 
