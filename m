From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 11:17:39 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/libglib2: bump to version
 2.60.2
In-Reply-To: <20190508194602.94266-1-aduskett@gmail.com>
References: <20190508194602.94266-1-aduskett@gmail.com>
Message-ID: <20190527111739.1923a1ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Wed,  8 May 2019 15:46:02 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Changes include:
>   - Moving to the meson build system, as autoconf is no longer supported.
>   - Add 0002-add-option-to-build-tests.patch
>   - Add 0003-remove-cpp-requirement.patch because c++ is not needed.
>   - Add 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch to prevent
>     a false error when compiling against older gcc versions.
>     (https://gitlab.gnome.org/GNOME/glib/issues/1744)
>   - Remove 0004-Do-not-hardcode-python-path-into-various-tools.patch as the
>     switch to meson makes this obsolete.
>   - Remove LIBGLIB2_AUTORECONF = YES from libglib2.mk
>   - Remove LIBGLIB2_INSTALL_STAGING_OPTS from libglib2.mk
> 
> All tests pass:
> ./utils/test-pkg -c ./defconfig
>            br-arm-full [1/6]: OK
> br-arm-cortex-a9-glibc [2/6]: OK
>  br-arm-cortex-m4-full [3/6]: SKIPPED
>         br-x86-64-musl [4/6]: OK
>     br-arm-full-static [5/6]: OK
>           sourcery-arm [6/6]: OK
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks for this new iteration. libglib2 now builds fine for me, but
dbus-glib no longer builds properly after this patch. It fails like
this:

Making all in statemachine
make[6]: Entering directory `/home/test/buildroot/output/build/dbus-glib-0.110/dbus/examples/statemachine'
/bin/bash ../../../libtool --mode=execute /home/test/buildroot/output/host/bin/dbus-binding-tool --prefix=sm_server --mode=glib-server --output=statemachine-server-glue.h statemachine-server.xml
/bin/bash ../../../libtool --mode=execute /home/test/buildroot/output/host/bin/dbus-binding-tool --prefix=sm_object --mode=glib-server --output=statemachine-glue.h statemachine.xml
echo "#include <config.h>" > sm-marshal.c.tmp
/usr/bin/glib-genmarshal --prefix=sm_marshal ./sm-marshal.list --header > sm-marshal.h.tmp && mv sm-marshal.h.tmp sm-marshal.h
/bin/bash: /usr/bin/glib-genmarshal: No such file or directory
/usr/bin/glib-genmarshal --prefix=sm_marshal ./sm-marshal.list --header --body >> sm-marshal.c.tmp
make[6]: *** [sm-marshal.h] Error 127
make[6]: *** Waiting for unfinished jobs....
/bin/bash: /usr/bin/glib-genmarshal: No such file or directory
make[6]: *** [sm-marshal.c] Error 127
WARNING: Using --header and --body at the same time is deprecated; use --body --prototypes instead
INFO: Reading /tmp/dbus-binding-tool-c-marshallers.A90E2Z...
WARNING: Using --header and --body at the same time is deprecated; use --body --prototypes instead
INFO: Reading /tmp/dbus-binding-tool-c-marshallers.ZX3B2Z...
make[6]: Leaving directory `/home/test/buildroot/output/build/dbus-glib-0.110/dbus/examples/statemachine'
make[5]: *** [all-recursive] Error 1
make[5]: Leaving directory `/home/test/buildroot/output/build/dbus-glib-0.110/dbus/examples'
make[4]: *** [all] Error 2
make[4]: Leaving directory `/home/test/buildroot/output/build/dbus-glib-0.110/dbus/examples'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/home/test/buildroot/output/build/dbus-glib-0.110/dbus'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/test/buildroot/output/build/dbus-glib-0.110'

With the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.02-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LATENCYTOP=y
BR2_PACKAGE_DBUS_GLIB=y
BR2_PACKAGE_NEARD=y
BR2_PACKAGE_NEARD_TOOLS=y
BR2_PACKAGE_LENSFUN=y
BR2_PACKAGE_LIBCROCO=y
# BR2_TARGET_ROOTFS_TAR is not set

while it builds fine without your libglib2 bump :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
