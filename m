From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Apr 2020 10:42:50 +0200
Subject: [Buildroot] [PATCH v5 1/3] package/environment-setup: new
 package
In-Reply-To: <ec7f659f-bda5-7590-3078-2c72287f9aca@bitdefender.com>
References: <20200427203657.77392-1-angelo@amarulasolutions.com>
 <ec7f659f-bda5-7590-3078-2c72287f9aca@bitdefender.com>
Message-ID: <CA+_SqVbXKvcK=kRYiycrzr1hDJ5EnLJ5UG3sKuQDZPcRJC81rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 28, 2020 at 9:42 AM Mircea GLIGA <mgliga@bitdefender.com> wrote:
>
> Hi Angelo,
>
> Thanks for applying my suggestions, see my comments below.
> Order of the `sed` expressions is important, changing the order broke the
> usage of the CROSS_COMPILE variable. The AR, AS, CC etc are not using
> that variable anymore.
> Order should be:
> * replace TARGET_CROSS with $CROSS_COMPILE
> * make use of the PATH variable, remove paths already in PATH
> * replace HOST_DIR with $SDK_PATH

I don't think it's strictly necessary to have ${CROSS_COMPILE}
everywhere. I prefer to have the executable name in $AR, $AS and so
on.

Anyway, for CROSS_COMPILE, only the prefix is used to compose the
executable name, so

$ which ${CROSS_COMPILE}gcc
/FULLPATH/host/bin/arm-linux-gnueabihf-gcc
$ which ${CC}
/FULLPATH/host/bin/arm-linux-gnueabihf-gcc

>
> Best regards
> Mircea
>
> See the output diff:
>
> --- environment-setup   2020-04-28 09:55:19.927381470 +0300
> +++ environment-setup_v5        2020-04-28 10:01:45.387944589 +0300
> @@ -14,23 +14,22 @@
>
>   EOF
>   SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> -export "CROSS_COMPILE=armeb-buildroot-linux-uclibcgnueabi-"
>   export
> "PATH=$SDK_PATH/bin:$SDK_PATH/sbin:/home/mgliga/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
> -export "AR=${CROSS_COMPILE}ar"
> -export "AS=${CROSS_COMPILE}as"
> -export "LD=${CROSS_COMPILE}ld"
> -export "NM=${CROSS_COMPILE}nm"
> -export "CC=${CROSS_COMPILE}gcc"
> -export "GCC=${CROSS_COMPILE}gcc"
> -export "CPP=${CROSS_COMPILE}cpp"
> -export "CXX=${CROSS_COMPILE}g++"
> -export "FC=${CROSS_COMPILE}gfortran"
> -export "F77=${CROSS_COMPILE}gfortran"
> -export "RANLIB=${CROSS_COMPILE}ranlib"
> -export "READELF=${CROSS_COMPILE}readelf"
> -export "STRIP=${CROSS_COMPILE}strip"
> -export "OBJCOPY=${CROSS_COMPILE}objcopy"
> -export "OBJDUMP=${CROSS_COMPILE}objdump"
> +export "AR=armeb-buildroot-linux-uclibcgnueabi-ar"
> +export "AS=armeb-buildroot-linux-uclibcgnueabi-as"
> +export "LD=armeb-buildroot-linux-uclibcgnueabi-ld"
> +export "NM=armeb-buildroot-linux-uclibcgnueabi-nm"
> +export "CC=armeb-buildroot-linux-uclibcgnueabi-gcc"
> +export "GCC=armeb-buildroot-linux-uclibcgnueabi-gcc"
> +export "CPP=armeb-buildroot-linux-uclibcgnueabi-cpp"
> +export "CXX=armeb-buildroot-linux-uclibcgnueabi-g++"
> +export "FC=armeb-buildroot-linux-uclibcgnueabi-gfortran"
> +export "F77=armeb-buildroot-linux-uclibcgnueabi-gfortran"
> +export "RANLIB=armeb-buildroot-linux-uclibcgnueabi-ranlib"
> +export "READELF=armeb-buildroot-linux-uclibcgnueabi-readelf"
> +export "STRIP=armeb-buildroot-linux-uclibcgnueabi-strip"
> +export "OBJCOPY=armeb-buildroot-linux-uclibcgnueabi-objcopy"
> +export "OBJDUMP=armeb-buildroot-linux-uclibcgnueabi-objdump"
>   export "AR_FOR_BUILD=/usr/bin/ar"
>   export "AS_FOR_BUILD=/usr/bin/as"
>   export "CC_FOR_BUILD=ccache /usr/bin/gcc"
> @@ -42,8 +41,8 @@
>   export "CXXFLAGS_FOR_BUILD=-O2 -I$SDK_PATH/include"
>   export "LDFLAGS_FOR_BUILD=-L$SDK_PATH/lib -Wl,-rpath,$SDK_PATH/lib"
>   export "FCFLAGS_FOR_BUILD="
> -export "DEFAULT_ASSEMBLER=${CROSS_COMPILE}as"
> -export "DEFAULT_LINKER=${CROSS_COMPILE}ld"
> +export "DEFAULT_ASSEMBLER=armeb-buildroot-linux-uclibcgnueabi-as"
> +export "DEFAULT_LINKER=armeb-buildroot-linux-uclibcgnueabi-ld"
>   export "CPPFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64"
>   export "CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os  "
>   export "CXXFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os  "
> @@ -53,5 +52,6 @@
>   export "PKG_CONFIG=pkg-config"
>   export "STAGING_DIR=$SDK_PATH/armeb-buildroot-linux-uclibcgnueabi/sysroot"
>   export "INTLTOOL_PERL=/usr/bin/perl"
> +export "CROSS_COMPILE=armeb-buildroot-linux-uclibcgnueabi-"
>   export "CONFIGURE_FLAGS=--target=armeb-buildroot-linux-uclibcgnueabi
> --host=armeb-buildroot-linux-uclibcgnueabi --build=x86_64-pc-linux-gnu
> --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var
> --program-prefix="
>   PS1="\[\]buildroot-2020.02\[\]:\[\]\w\[\]$ "
>
>
>
> On 4/27/20 11:36 PM, Angelo Compagnucci wrote:
> > From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> >
> > Install an helper script to setup a build environment based on buildroot.
> > It's useful when a developer wants to use a buildroot generated sdk to
> > build an external project.
> > Due to the nature of the intrusiveness of this script, a new PS1 is
> > installed to let the user understand that the current running shell is
> > not a normal shell.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> > Changelog:
> > v1->v2:
> >   * Moved from echo to printf (Yann)
> >   * removed sh extension (Yann)
> >   * Adding missing script
> > v2->v3:
> >   * Split the patch
> > v3->v4:
> >   * Better handling of SDK_PATH dir (Mircea Gliga)
> > v4->v5:
> >   * Cleaning the script using SDK_PATH where possible (Mircea Gliga)
> >
> > Some of the reason I kept several things the way I originally planned:
> >
> >   * I kept it being a package because it doesn't fit in any other tool:
> >     indeed this script changes your curent PATH and exports some variables
> >     that can be used for anything. Think of qmake or cmake or a package
> >     that doesn't have any build system at all. It has some features geared
> >     also towards autotools software but I keep planning others.
> >   * I kept the script being installed in host root: other build system does that
> >     and I want this script to mimic other build systems.
> >   * I kept looping in TARGET_CONFIGURE_OPTS, indeed it produces a more clean
> >     environment script at the end. For the problem arised by Yann: variables in
> >     TARGET_CONFIGURE_OPTS _are_ properly escaped, indeed if not, they were a
> >     big source of problems on each ./configure invocation due to the fact they
> >     are injected on the ./configure commandline invocation.
> >   * I kept the PS1: this script heavily mess with the path, it is expected by the
> >     user running it, but it can be very confusing being on a shell that
> >     doesn't behaves like your normal shell. So having a different PS1 helps
> >     remembering you are running into the buildroot shell and not into an ordinary
> >     one (other build systems does the same).
> >   * I kept the manual entry: I think that the most documentation the better.
> >
> >   docs/manual/using-buildroot-toolchain.txt     |  7 ++++
> >   package/Config.in                             |  1 +
> >   package/environment-setup/Config.in           |  6 ++++
> >   package/environment-setup/environment-setup   | 16 +++++++++
> >   .../environment-setup/environment-setup.mk    | 34 +++++++++++++++++++
> >   5 files changed, 64 insertions(+)
> >   create mode 100644 package/environment-setup/Config.in
> >   create mode 100644 package/environment-setup/environment-setup
> >   create mode 100644 package/environment-setup/environment-setup.mk
> >
> > diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
> > index 0c0c35fced..7b2de4bdfa 100644
> > --- a/docs/manual/using-buildroot-toolchain.txt
> > +++ b/docs/manual/using-buildroot-toolchain.txt
> > @@ -27,6 +27,13 @@ Upon extracting the SDK tarball, the user must run the script
> >   +relocate-sdk.sh+ (located at the top directory of the SDK), to make
> >   sure all paths are updated with the new location.
> >
> > +For your convenience, by selecting the package BR2_PACKAGE_ENVIRONMENT_SETUP,
> > +you can have a +setup-environment+ script installed in +output/host/+.
> > +This script can be sourced with +. your/sdk/path/environment-setup+ to launch
> > +the buildroot shell. Inside this shell, you will find an environment already
> > +set up with the correct PATH and the complete list of +target configure
> > +options+.
> > +
> >   Alternatively, if you just want to prepare the SDK without generating
> >   the tarball (e.g. because you will just be moving the +host+ directory,
> >   or will be generating the tarball on your own), Buildroot also allows
> > diff --git a/package/Config.in b/package/Config.in
> > index bf02870ea2..b698d6f184 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1955,6 +1955,7 @@ menu "Miscellaneous"
> >       source "package/collectl/Config.in"
> >       source "package/domoticz/Config.in"
> >       source "package/empty/Config.in"
> > +     source "package/environment-setup/Config.in"
> >       source "package/gnuradio/Config.in"
> >       source "package/googlefontdirectory/Config.in"
> >       source "package/gqrx/Config.in"
> > diff --git a/package/environment-setup/Config.in b/package/environment-setup/Config.in
> > new file mode 100644
> > index 0000000000..f0fcc7d0f8
> > --- /dev/null
> > +++ b/package/environment-setup/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_ENVIRONMENT_SETUP
> > +     bool "Environment setup"
> > +     help
> > +       Install an helper script to setup a build environment
> > +       based on buildroot. It's useful when you export an sdk
> > +       and want to use buildroot to build an external project
> > diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
> > new file mode 100644
> > index 0000000000..b48f1979d6
> > --- /dev/null
> > +++ b/package/environment-setup/environment-setup
> > @@ -0,0 +1,16 @@
> > +cat <<'EOF'
> > + _           _ _     _                 _
> > +| |__  _   _(_) | __| |_ __ ___   ___ | |_
> > +| '_ \| | | | | |/ _` | '__/ _ \ / _ \| __|
> > +| |_) | |_| | | | (_| | | | (_) | (_) | |_
> > +|_.__/ \__,_|_|_|\__,_|_|  \___/ \___/ \__| shell
> > +
> > +       Making embedded Linux easy!
> > +
> > +Some tips:
> > +* PATH is now pointing to the HOST_DIR path
> > +* Target configure options are already exported
> > +* To configure do "./configure $CONFIGURE_FLAGS"
> > +
> > +EOF
> > +SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> > diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> > new file mode 100644
> > index 0000000000..7c6e352bde
> > --- /dev/null
> > +++ b/package/environment-setup/environment-setup.mk
> > @@ -0,0 +1,34 @@
> > +################################################################################
> > +#
> > +# environment-setup
> > +#
> > +################################################################################
> > +
> > +ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
> > +ENVIRONMENT_SETUP_HOST_DIR_SED_EXP = 's+$(HOST_DIR)+\$$SDK_PATH+g'
> > +ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP = 's+$(HOST_DIR)/bin/++g'
> > +ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP = 's+$(TARGET_CROSS)+\$${CROSS_COMPILE}+g'
> > +
> > +define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
> > +     cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
> > +     for var in $(TARGET_CONFIGURE_OPTS); do \
> > +             printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
> > +     done
> > +     printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> > +     printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
> > +             --host=$(GNU_TARGET_NAME) \
> > +             --build=$(GNU_HOST_NAME) \
> > +             --prefix=/usr \
> > +             --exec-prefix=/usr \
> > +             --sysconfdir=/etc \
> > +             --localstatedir=/var \
> > +             --program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> > +     $(SED) $(ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP) \
> > +             -e $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) \
> > +             -e $(ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP) \
> > +             $(ENVIRONMENT_SETUP_FILE)
> > +     printf "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"\n" \
> > +             >> $(ENVIRONMENT_SETUP_FILE)
> > +endef
> > +
> > +$(eval $(generic-package))
> >
