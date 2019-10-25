From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 23:23:07 +0200
Subject: [Buildroot] [PATCH vX 2/5] package/sysrepo: add package
In-Reply-To: <20191024074644.10442-3-heiko.thiery@gmail.com>
References: <20191024074644.10442-1-heiko.thiery@gmail.com>
 <20191024074644.10442-3-heiko.thiery@gmail.com>
Message-ID: <20191025232307.4ca9357e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Thu, 24 Oct 2019 09:46:43 +0200
heiko.thiery at gmail.com wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> sysrepo is a YANG-based configuration and operational state
> data store for Unix/Linux applications. It is a dependency
> of Netopeer, a NETCONF server.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

I gave this a try, but unfortunately, host-sysrepo causes an
installation failure here.

I'm building this configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SYSREPO=y
# BR2_TARGET_ROOTFS_TAR is not set

which fails with:

-- Installing: /home/thomas/projets/buildroot/output/host/lib64/pkgconfig/libSysrepo-cpp.pc
-- Installing: /usr/lib/python2.7/site-packages/_sysrepo.so
CMake Error at swig/python/cmake_install.cmake:49 (file):
  file INSTALL cannot copy file
  "/home/thomas/projets/buildroot/output/build/host-sysrepo-v0.7.8/swig/python/_sysrepo.so"
  to "/usr/lib/python2.7/site-packages/_sysrepo.so".
Call Stack (most recent call first):
  swig/cmake_install.cmake:112 (include)
  cmake_install.cmake:173 (include)

It tries to install stuff in /usr/lib/python2.7/, which of course is
not allowed.

Another issue is that the host-sysrepo installation installs stuff to
$(TARGET_DIR) which really isn't good for a host package:

[100%] Built target _sysrepo
Install the project...
-- Install configuration: "debug"
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo/yang/
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo/data/
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo/data/internal/
-- Installing: /home/thomas/projets/buildroot/output/host/var/run/sysrepo-subscriptions
-- Installing: /home/thomas/projets/buildroot/output/host/lib64/sysrepo/plugins
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo/yang/internal/sysrepo-persistent-data.yang
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo/yang/internal/sysrepo-module-dependencies.yang
-- Installing: /home/thomas/projets/buildroot/output/target/etc/sysrepo/yang/internal/sysrepo-notification-store.yang
-- Installing: /home/thomas/projets/buildroot/output/host/lib64/pkgconfig/libsysrepo.pc
-- Installing: /home/thomas/projets/buildroot/output/host/share/man/man1/sysrepoctl.1

See some other review comments below.

> diff --git a/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch b/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
> new file mode 100644
> index 0000000000..5cb3606475
> --- /dev/null
> +++ b/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
> @@ -0,0 +1,33 @@
> +From c4a2195febbd5d436f8de79d8391d8da9aa60ac4 Mon Sep 17 00:00:00 2001
> +From: Michael Walle <michael@walle.cc>
> +Date: Thu, 10 Oct 2019 14:58:16 +0200
> +Subject: [PATCH 1/2] CMakeLists.txt: respect CMAKE_INSTALL_PREFIX and DESTDIR

Patches should be generated with git format-patch -N so that they don't
have the 1/2, 2/2 statements.
> diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
> new file mode 100644
> index 0000000000..a93e314535
> --- /dev/null
> +++ b/package/sysrepo/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_SYSREPO
> +	bool "sysrepo"
> +	depends on BR2_USE_MMU # libnetconf2
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protbuf
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
> +	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_LIBNETCONF2
> +	select BR2_PACKAGE_LIBAVL

Alphabetic sorting: should be before select BR2_PACKAGE_LIBEV.

> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_PROTOBUF_C
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE_UCP

Ditto alphabetic sorting: pcre before protobuf.



> +	help
> +	  Sysrepo is an YANG-based configuration and operational state
> +	  data store for Unix/Linux applications.
> +
> +	  https://github.com/sysrepo
> +
> +comment "sysrepo needs a toolchain w/ C++, threads, dynamic libraray, host gcc >= 4.8"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_HOST_GCC_AT_LEAST_4_8
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

Put the comment at the end of the Config.in file, otherwise the
"sysrepo examples" option is not intended properly when looked at in
menuconfig.

> +
> +if BR2_PACKAGE_SYSREPO
> +
> +config BR2_PACKAGE_SYSREPO_EXAMPLES
> +	bool "sysrepo examples"

When it will be intended under sysrepo, repeating sysrepo is not very
useful, so maybe just:

	bool "enable examples"

> diff --git a/package/sysrepo/S50sysrepod b/package/sysrepo/S50sysrepod
> new file mode 100644
> index 0000000000..05ca627fb7
> --- /dev/null
> +++ b/package/sysrepo/S50sysrepod
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +
> +DAEMON="sysrepod"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +SYSREPOD_ARGS=""
> +
> +start() {
> +    printf 'Starting %s: ' "$DAEMON"
> +    start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
> +        -- $SYSREPOD_ARGS
> +    status=$?

Indentation if four spaces until this line.

> +	if [ "$status" -eq 0 ]; then

And then one tab starting from this line. Please check the reference
init script in package/busybox/, and try to be consistent with what
they do in terms of indentation. Note: this problem is also below in
the same init script, as well as in the other init script.

> +SYSREPO_VERSION = v0.7.8

The v should be in SYSREPO_SITE, not SYSREPO_VERSION.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
