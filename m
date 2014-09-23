From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 23 Sep 2014 23:02:17 +0200
Subject: [Buildroot] [PATCH 1/1] ympd: new package
In-Reply-To: <1411502012-13553-1-git-send-email-limpens@gmail.com>
References: <1411502012-13553-1-git-send-email-limpens@gmail.com>
Message-ID: <CAHXCMMKg5wKZWwvxVSYyi-0-ZdDSbH0GSmZRG+J3jjn2eivsUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Tue, Sep 23, 2014 at 9:53 PM, Eric Limpens <limpens@gmail.com> wrote:
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> ---
>  package/Config.in                                       |  1 +
>  package/ympd/Config.in                                  |  9 +++++++++
>  package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch | 12 ++++++++++++
>  package/ympd/ympd.mk                                    | 10 ++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/ympd/Config.in
>  create mode 100644 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
>  create mode 100644 package/ympd/ympd.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2eefc3f..1578404 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -35,6 +35,7 @@ menu "Audio and video applications"
>         source "package/wavpack/Config.in"
>         source "package/xbmc/Config.in"
>         source "package/yavta/Config.in"
> +       source "package/ympd/Config.in"
>  endmenu
>
>  menu "Compressors and decompressors"
> diff --git a/package/ympd/Config.in b/package/ympd/Config.in
> new file mode 100644
> index 0000000..53f128e
> --- /dev/null
> +++ b/package/ympd/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_YMPD
> +       bool "ympd"
> +       select BR2_PACKAGE_LIBMPDCLIENT #libmpdclient
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         ympd, Standalone MPD Web GUI written in C, utilizing Websockets and Bootstrap/JS
> +
> +comment "ympd needs a toolchain w/ threads"
> +       depends on !(BR2_TOOLCHAIN_HAS_THREADS)
> diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
> new file mode 100644
> index 0000000..55a29ee
> --- /dev/null
> +++ b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
> @@ -0,0 +1,12 @@
> +--- ympd-a98d760dddff4b0dd595d977c9077f34beff05c5/CMakeLists.txt       2014-05-24 15:25:47.000000000 +0200
> ++++ ympd-a98d760dddff4b0dd595d977c9077f34beff05c5-1/CMakeLists.txt     2014-09-23 20:04:55.491997850 +0200
> +@@ -29,6 +29,7 @@
> + )
> +
> +-add_executable(mkdata htdocs/mkdata.c)
> +-get_target_property(MKDATA_EXE mkdata LOCATION)
> ++#add_executable(mkdata htdocs/mkdata.c)
> ++#get_target_property(MKDATA_EXE mkdata LOCATION)
> ++set(MKDATA_EXE "./mkdata")

This usually won't work.
The tricky thing is that the tool comes with the project itself, and
is used during the build process of the project itself.

This kind of programs is usually not necessary on the target, but
useful to generate source code and/or data for the target.

Building a tool, then trying to using it in the same build is a common
mistake when the developers do not have cross-development in mind.
So, this is not an issue specific to CMake (or any orther build-system).

To workaround this, there is a couple of solutions, depending on
whether you can acheive the same job using standard programs (e.g.:
zip, dd ... whatever is needed/done) or not:
1) if the job can be done somehow else using standard programs, then
you can try doing the job using these standard tools. It may require
writing a script;
2) if the (host-)tool is simple enough, so that it can easily be built
for the host, then you can build it manually (i.e. by by-passing the
original build-system), before configuring the project for the target
build, and feed its path in the configure phase of the target build;
3) otherwise, you can build a the package for the host, so you'll get
the host tools installed in the Buildroot host directory, and feed its
path in the configure phase of the target build.

In case you choose option 3), you may want to limit the host-build of
the project to the needed host-tools. This may require patching the
build system to support that, and/or patching the build-system to use
a predefined tool when cross-compiling.


> +
> + add_custom_command(OUTPUT ${PROJECT_BINARY_DIR}/assets.c
> diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
> new file mode 100644
> index 0000000..22727a9
> --- /dev/null
> +++ b/package/ympd/ympd.mk
> @@ -0,0 +1,10 @@
> +YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
> +YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
> +
> +define YMPD_MAKE_HOST_TOOL
> +        $(CC) -O2 $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
> +endef
> +

Instead of adding a set(MKDATA_EXE "....") in the cmake code itself,
you can override it through the command line:

YMPD_CONF_OPT += -DMKDATA_EXE="$(@D)/mkdata"

(But you'll still need to disable the mkdata add_executable call).

> +YMPD_PRE_BUILD_HOOKS += YMPD_MAKE_HOST_TOOL
> +
> +$(eval $(cmake-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
