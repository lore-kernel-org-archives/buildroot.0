From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 17:21:24 +0200
Subject: [Buildroot] [PATCH v2] p7zip-light: new package
In-Reply-To: <1344753877-30117-1-git-send-email-net147@gmail.com>
References: <1344753877-30117-1-git-send-email-net147@gmail.com>
Message-ID: <20120812172124.1ed97077@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 16:44:37 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> +if BR2_PACKAGE_P7ZIP_LIGHT
> +
> +config BR2_PACKAGE_P7ZIP_LIGHT_SFX
> +	bool "SFX support"
> +	default n
> +	help
> +	  Enable support for creating self-extracting archives.
> +
> +config BR2_PACKAGE_P7ZIP_LIGHT_7Z
> +	bool "7z"
> +	default n
> +	help
> +	  Build 7z executable. Uses plugins to handle archives.
> +
> +config BR2_PACKAGE_P7ZIP_LIGHT_7ZR
> +	bool "7zr"
> +	default n
> +	help
> +	  Build 7zr executable. Only supports 7z archives.
> +
> +endif

No need for the "default n", it's the default.

Also, does the package builds and installs something even if all these
suboptions are disabled?

> diff --git a/package/p7zip-light/p7zip-light-disable-rar.patch b/package/p7zip-light/p7zip-light-disable-rar.patch
> new file mode 100644
> index 0000000..3d5144b
> --- /dev/null
> +++ b/package/p7zip-light/p7zip-light-disable-rar.patch

Patch missing description + Signed-off-by.

> diff --git a/package/p7zip-light/p7zip-light-trim-install.patch b/package/p7zip-light/p7zip-light-trim-install.patch
> new file mode 100644
> index 0000000..884e57c
> --- /dev/null
> +++ b/package/p7zip-light/p7zip-light-trim-install.patch

Ditto.

> diff --git a/package/p7zip-light/p7zip-light.mk b/package/p7zip-light/p7zip-light.mk
> new file mode 100644
> index 0000000..844a1db
> --- /dev/null
> +++ b/package/p7zip-light/p7zip-light.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# p7zip-light
> +#
> +#############################################################
> +P7ZIP_LIGHT_VERSION = 9.20.1
> +P7ZIP_LIGHT_SOURCE = p7zip_$(P7ZIP_LIGHT_VERSION)_src_all.tar.bz2
> +P7ZIP_LIGHT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/p7zip
> +P7ZIP_LIGHT_LICENSE = LGPLv2.1+
> +P7ZIP_LIGHT_TARGETS = 7za

This is not used anywhere.

> +define P7ZIP_LIGHT_BUILD_CMDS
> +	sed -i -e "s|CC=.*|CC=$(TARGET_CC) \$$(ALLFLAGS)|" -e "s|CXX=.*|CXX=$(TARGET_CXX) \$$(ALLFLAGS)|" $(@D)/makefile.machine

Isn't it easier/more readable to implement a patch that allows passing
CC/CXX/CFLAGS/CXXFLAGS on the make command line?

> +	$(MAKE) -C $(@D) 7za \
> +		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_SFX),sfx,) \
> +		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_7Z),7z,) \
> +		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_7ZR),7zr,)

You can remove the last comma:

$(if $(BR2_FOO),foo)

Otherwise, looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
