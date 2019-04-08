From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Apr 2019 08:09:16 -0500
Subject: [Buildroot] [PATCH 1/1] package/fstrcmp: new package
In-Reply-To: <20190407170941.19461-1-bernd.kuhls@t-online.de>
References: <20190407170941.19461-1-bernd.kuhls@t-online.de>
Message-ID: <CANQCQpaSfczRHwznRVUJ=w_FNBVZRePKbd20Rw3XgX+LnBPMrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, Apr 7, 2019 at 12:09 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Needed for Kodi >= 18.0
> https://github.com/xbmc/xbmc/commit/c79fb23a7d7b8550f236ecbc9d3f0af4e57365e4
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> utils/test-pkg passed all tests:
>
>                              arm-aarch64 [ 1/43]: OK
>                         br-aarch64-glibc [ 2/43]: OK
>                            br-arcle-hs38 [ 3/43]: OK
>                             br-arm-basic [ 4/43]: SKIPPED
>                   br-arm-cortex-a9-glibc [ 5/43]: OK
>                    br-arm-cortex-a9-musl [ 6/43]: OK
>                    br-arm-cortex-m4-full [ 7/43]: OK
>                              br-arm-full [ 8/43]: OK
>                     br-arm-full-nothread [ 9/43]: OK
>                       br-arm-full-static [10/43]: OK
>                    br-i386-pentium4-full [11/43]: OK
>                 br-i386-pentium-mmx-musl [12/43]: OK
>                        br-m68k-5208-full [13/43]: OK
>                       br-m68k-68040-full [14/43]: OK
>                     br-microblazeel-full [15/43]: OK
>                  br-mips32r6-el-hf-glibc [16/43]: OK
>                       br-mips64-n64-full [17/43]: OK
>                  br-mips64r6-el-hf-glibc [18/43]: OK
>                       br-mipsel-o32-full [19/43]: OK
>                           br-nios2-glibc [20/43]: OK
>                       br-openrisc-uclibc [21/43]: OK
>                br-powerpc-603e-basic-cpp [22/43]: SKIPPED
>              br-powerpc64le-power8-glibc [23/43]: OK
>                br-powerpc64-power7-glibc [24/43]: OK
>                   br-powerpc-e500mc-full [25/43]: OK
>                               br-riscv32 [26/43]: OK
>                               br-riscv64 [27/43]: OK
>                              br-sh4-full [28/43]: OK
>                         br-sparc64-glibc [29/43]: OK
>                          br-sparc-uclibc [30/43]: OK
>                     br-x86-64-core2-full [31/43]: OK
>                           br-x86-64-musl [32/43]: OK
>                           br-xtensa-full [33/43]: OK
>                        linaro-aarch64-be [34/43]: OK
>                           linaro-aarch64 [35/43]: OK
>                               linaro-arm [36/43]: OK
>                      sourcery-arm-armv4t [37/43]: OK
>                             sourcery-arm [38/43]: OK
>                      sourcery-arm-thumb2 [39/43]: OK
>                          sourcery-mips64 [40/43]: OK
>                            sourcery-mips [41/43]: OK
>                           sourcery-nios2 [42/43]: OK
>                          sourcery-x86-64 [43/43]: OK
> 43 builds, 2 skipped, 0 build failed, 0 legal-info failed

Did checkpackage find anything on package/fstrcmp/*?

>
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/fstrcmp/0001-disable-rpath.patch | 25 +++++++++++++++++
>  package/fstrcmp/Config.in                | 12 ++++++++
>  package/fstrcmp/fstrcmp.hash             |  6 ++++
>  package/fstrcmp/fstrcmp.mk               | 35 ++++++++++++++++++++++++
>  6 files changed, 80 insertions(+)
>  create mode 100644 package/fstrcmp/0001-disable-rpath.patch
>  create mode 100644 package/fstrcmp/Config.in
>  create mode 100644 package/fstrcmp/fstrcmp.hash
>  create mode 100644 package/fstrcmp/fstrcmp.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 00d578b73f..5a406619f0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -293,6 +293,7 @@ F:  package/fetchmail/
>  F:     package/ffmpeg/
>  F:     package/freeswitch/
>  F:     package/freeswitch-mod-bcg729/
> +F:     package/fstrcmp/
>  F:     package/ghostscript/
>  F:     package/giflib/
>  F:     package/glmark2/
> diff --git a/package/Config.in b/package/Config.in
> index 9b5e300c0a..2e92418e49 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1762,6 +1762,7 @@ menu "Text and terminal handling"
>         source "package/augeas/Config.in"
>         source "package/enchant/Config.in"
>         source "package/fmt/Config.in"
> +       source "package/fstrcmp/Config.in"
>         source "package/icu/Config.in"
>         source "package/libcli/Config.in"
>         source "package/libedit/Config.in"
> diff --git a/package/fstrcmp/0001-disable-rpath.patch b/package/fstrcmp/0001-disable-rpath.patch
> new file mode 100644
> index 0000000000..cec57e7e94
> --- /dev/null
> +++ b/package/fstrcmp/0001-disable-rpath.patch
> @@ -0,0 +1,25 @@
> +Remove rpath from linking command
> +
> +Fixes build error:
> +
> +lib/.libs/libfstrcmp.so: undefined reference to `__ctype_b_loc at GLIBC_2.3'
> +lib/.libs/libfstrcmp.so: undefined reference to `mbstowcs at GLIBC_2.2.5'
> +lib/.libs/libfstrcmp.so: undefined reference to `printf at GLIBC_2.2.5'
> +lib/.libs/libfstrcmp.so: undefined reference to `readlink at GLIBC_2.2.5'
> +lib/.libs/libfstrcmp.so: undefined reference to `malloc at GLIBC_2.2.5'
> +lib/.libs/libfstrcmp.so: undefined reference to `memcmp at GLIBC_2.2.5'
> +lib/.libs/libfstrcmp.so: undefined reference to `wcslen at GLIBC_2.2.5'
> +

Any upstream bug worth mentioning?

> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- fstrcmp-0.7.D001/Makefile.in.orig  2014-03-05 01:13:45.000000000 +0100
> ++++ fstrcmp-0.7.D001/Makefile.in       2019-04-07 13:55:07.817689231 +0200
> +@@ -507,7 +507,7 @@
> + lib/libfstrcmp.la: $(lib_obj)
> +       rm -f $@
> +       $(LIBTOOL) --mode=link --tag=CC $(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) \
> +-              -o $@ $(lib_obj) $(LIBS) -rpath $(libdir) -version-info 6:0:6
> ++              -o $@ $(lib_obj) $(LIBS) -version-info 6:0:6
> +
> + #
> + # The install of the *.la file automatically causes "$(LIBTOOL) --mode=install"
> diff --git a/package/fstrcmp/Config.in b/package/fstrcmp/Config.in
> new file mode 100644
> index 0000000000..04f11b0f97
> --- /dev/null
> +++ b/package/fstrcmp/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_FSTRCMP
> +       bool "fstrcmp"
> +       depends on BR2_USE_WCHAR
> +       help
> +         The fstrcmp project provides a library that is used to make
> +         fuzzy comparisons of strings and byte arrays, including multi-
> +         byte character strings.
> +
> +         http://fstrcmp.sourceforge.net/
> +
> +comment "fstrcmp needs a toolchain w/ wchar"
> +       depends on !BR2_USE_WCHAR
> diff --git a/package/fstrcmp/fstrcmp.hash b/package/fstrcmp/fstrcmp.hash
> new file mode 100644
> index 0000000000..9a43c59c09
> --- /dev/null
> +++ b/package/fstrcmp/fstrcmp.hash
> @@ -0,0 +1,6 @@
> +# From https://sourceforge.net/projects/fstrcmp/files/fstrcmp/0.7/
> +md5 9c440bbdfcad9fd22e38f2388715b0cc  fstrcmp-0.7.D001.tar.gz
> +sha1 bb848118fb157dc624ae9fac0566a64cc85f2ef2  fstrcmp-0.7.D001.tar.gz
> +# Locally computed
> +sha256 e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476  fstrcmp-0.7.D001.tar.gz
> +sha256 5352e426b563eda9252d76be92337b49f7b5cfdd1302a1e8d99389840c0e46be  LICENSE
> diff --git a/package/fstrcmp/fstrcmp.mk b/package/fstrcmp/fstrcmp.mk
> new file mode 100644
> index 0000000000..2ed387fff7
> --- /dev/null
> +++ b/package/fstrcmp/fstrcmp.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# fstrcmp
> +#
> +################################################################################
> +
> +FSTRCMP_VERSION_MAJOR = 0.7
> +FSTRCMP_VERSION = $(FSTRCMP_VERSION_MAJOR).D001
> +FSTRCMP_SITE = https://sourceforge.net/projects/fstrcmp/files/fstrcmp/$(FSTRCMP_VERSION_MAJOR)
> +FSTRCMP_LICENSE = GPL-3.0+
> +FSTRCMP_LICENSE_FILES = LICENSE
> +FSTRCMP_INSTALL_STAGING = YES
> +FSTRCMP_DEPENDENCIES = host-libtool
> +FSTRCMP_CONF_ENV = LIBTOOL="$(HOST_DIR)/bin/libtool"
> +
> +FSTRCMP_MAKE_OPTS = all-bin libdir/pkgconfig/fstrcmp.pc
> +
> +# We need to install the package files ourselves due to upstream trying
> +# to install a .lai file which is missing because of rpath removal
> +define FSTRCMP_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install-include
> +       $(INSTALL) -D -m 755 $(@D)/bin/fstrcmp $(STAGING_DIR)/usr/bin/fstrcmp

Is the fstrcmp binary really needed in staging or is it a cut paste
err from FSTRCMP_INSTALL_TARGET_CMDS?

> +       $(INSTALL) -D -m 755 $(@D)/lib/.libs/libfstrcmp.a $(STAGING_DIR)/usr/lib/libfstrcmp.a
> +       $(INSTALL) -D -m 755 $(@D)/lib/libfstrcmp.la $(STAGING_DIR)/usr/lib/libfstrcmp.la
> +       $(INSTALL) -D -m 755 $(@D)/libdir/pkgconfig/fstrcmp.pc $(STAGING_DIR)/usr/lib/pkgconfig/fstrcmp.pc
> +endef
> +
> +define FSTRCMP_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 755 $(@D)/bin/fstrcmp $(TARGET_DIR)/usr/bin/fstrcmp
> +       $(INSTALL) -D -m 755 $(@D)/lib/.libs/libfstrcmp.a $(TARGET_DIR)/usr/lib/libfstrcmp.a
> +       $(INSTALL) -D -m 755 $(@D)/lib/libfstrcmp.la $(TARGET_DIR)/usr/lib/libfstrcmp.la
> +       $(INSTALL) -D -m 755 $(@D)/libdir/pkgconfig/fstrcmp.pc $(TARGET_DIR)/usr/lib/pkgconfig/fstrcmp.pc

Probably can drop the static lib and .pc installs from your
FSTRCMP_INSTALL_TARGET_CMDS?

Looks like a useful tool!
Matt
