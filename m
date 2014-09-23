From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:02:20 +0200
Subject: [Buildroot] [PATCH 1/1] ympd: new package
In-Reply-To: <1411502012-13553-1-git-send-email-limpens@gmail.com>
References: <1411502012-13553-1-git-send-email-limpens@gmail.com>
Message-ID: <20140923220220.435839a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Limpens,

Thanks for your contribution! Below a few comments. Could you take them
into account and resend an updated version? Thanks!

On Tue, 23 Sep 2014 21:53:32 +0200, Eric Limpens wrote:

> diff --git a/package/ympd/Config.in b/package/ympd/Config.in
> new file mode 100644
> index 0000000..53f128e
> --- /dev/null
> +++ b/package/ympd/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_YMPD
> +	bool "ympd"
> +	select BR2_PACKAGE_LIBMPDCLIENT #libmpdclient

Comment not needed.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  ympd, Standalone MPD Web GUI written in C, utilizing Websockets and Bootstrap/JS

Help text should be wrapped to a short length, and maybe made more
explicit, like:

	  ympd is a standalone MPD Web GUI written in C, using
	  Websockets and Bootstrap/JS.

> diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
> new file mode 100644
> index 0000000..55a29ee
> --- /dev/null
> +++ b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
> @@ -0,0 +1,12 @@

All patches must have a Signed-off-by line and a description. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> +--- ympd-a98d760dddff4b0dd595d977c9077f34beff05c5/CMakeLists.txt	2014-05-24 15:25:47.000000000 +0200
> ++++ ympd-a98d760dddff4b0dd595d977c9077f34beff05c5-1/CMakeLists.txt	2014-09-23 20:04:55.491997850 +0200
> +@@ -29,6 +29,7 @@
> + )
> + 
> +-add_executable(mkdata htdocs/mkdata.c)
> +-get_target_property(MKDATA_EXE mkdata LOCATION)
> ++#add_executable(mkdata htdocs/mkdata.c)
> ++#get_target_property(MKDATA_EXE mkdata LOCATION)

We generally like to have a solution that can potentially be submitted
upstream.

> ++set(MKDATA_EXE "./mkdata")
> + 
> + add_custom_command(OUTPUT ${PROJECT_BINARY_DIR}/assets.c
> diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
> new file mode 100644
> index 0000000..22727a9
> --- /dev/null
> +++ b/package/ympd/ympd.mk
> @@ -0,0 +1,10 @@

Missing comment header like all other packages have.

> +YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
> +YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
> +
> +define YMPD_MAKE_HOST_TOOL
> +        $(CC) -O2 $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
> +endef

Use $(HOSTCC) $(HOST_CFLAGS) $(@D)/htdocs/mkdata.c -o $(@D)/mkdata

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
