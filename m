From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 22:38:35 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libsoil: new package
In-Reply-To: <1446241953-14139-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446241953-14139-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151102223835.0a25cb1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 30 Oct 2015 22:52:33 +0100, Bernd Kuhls wrote:

>     - moved -fPIC from 0001-fix-makefile.patch to LIBSOIL_CFLAGS
> Because this library will be used in at least five packages I decided
> against using the other upstream makefile providing a static-only
> library.

I don't see the relation between this, and not patching the makefile
that you are already patching.

> diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
> new file mode 100644
> index 0000000..0ed8723
> --- /dev/null
> +++ b/package/libsoil/libsoil.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# libsoil
> +#
> +################################################################################
> +
> +LIBSOIL_VERSION = 20080707
> +LIBSOIL_SOURCE = soil.zip

Argh, a non-versioned file name. But oh well, our hash checking
mechanism will verify this, and delete the file if it no longer matches
with the hash.

> +LIBSOIL_SITE = http://www.lonesock.net/files
> +LIBSOIL_INSTALL_STAGING = YES
> +LIBSOIL_DEPENDENCIES = libgl
> +LIBSOIL_LICENSE = Public Domain, MIT
> +LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
> +
> +LIBSOIL_CFLAGS = "$(TARGET_CFLAGS) -c -fPIC"

Why would we need the -c here? It generally shouldn't be part of
CFLAGS. What about patching the Makefile %.o: %.c rule instead ?

> +define LIBSOIL_EXTRACT_CMDS
> +	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBSOIL_SOURCE)

Please move all the code from the "Simple OpenGL Image Library" subdir
into $(@D) directory, and remove the "Simple OpenGL Image Library"
subdir. This way you don't have to repeat $(@D)/Simple\ OpenGL\ Image\
Library everywhere.

> +endef
> +
> +define LIBSOIL_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS=$(LIBSOIL_CFLAGS) \
> +		-f ../projects/makefile/alternate\ Makefile.txt \

Can you put ../projects/makefile/alternate\ Makefile.txt in some
variable called LIBSOIL_MAKEFILE for example ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
