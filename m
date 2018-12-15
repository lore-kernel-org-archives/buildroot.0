From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Dec 2018 15:14:25 +0100
Subject: [Buildroot] WG: [PATCH] package/vsomeip: new package
In-Reply-To: <AM6PR0302MB3349E33E85C8C02FD8BE1B31A0A70@AM6PR0302MB3349.eurprd03.prod.outlook.com>
References: <20181211181825.5733-1-maik.brenke@mail.de>
 <AM6PR0302MB3349E33E85C8C02FD8BE1B31A0A70@AM6PR0302MB3349.eurprd03.prod.outlook.com>
Message-ID: <20181215151425.220494ce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maik,

On Wed, 12 Dec 2018 07:53:11 +0000, Brenke, Maik wrote:
> From: Maik Brenke <maik.brenke@continental-corporation.com>
> 
> Signed-off-by: Maik Brenke <maik.brenke@continental-corporation.com>

Thanks for this new iteration. There are still some formatting issues,
but the most important issue is that it doesn't build.

The following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_VSOMEIP=y
# BR2_TARGET_ROOTFS_TAR is not set

Causes the following build failure:

>>> vsomeip 2.10.21 Building
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/projets/git-wrappers/"  /usr/bin/make -j5  -C /home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/
Scanning dependencies of target vsomeip
[  1%] Building CXX object CMakeFiles/vsomeip.dir/implementation/endpoints/src/credentials.cpp.o
[  2%] Building CXX object CMakeFiles/vsomeip.dir/implementation/endpoints/src/client_endpoint_impl.cpp.o
[  4%] Building CXX object CMakeFiles/vsomeip.dir/implementation/endpoints/src/endpoint_definition.cpp.o
[  5%] Building CXX object CMakeFiles/vsomeip.dir/implementation/endpoints/src/local_client_endpoint_impl.cpp.o
[  7%] Building CXX object CMakeFiles/vsomeip.dir/implementation/endpoints/src/endpoint_impl.cpp.o
In file included from /home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/helper/boost/asio/datagram_socket_service_ext.hpp:33:0,
                 from /home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/helper/boost/asio/basic_datagram_socket_ext.hpp:24,
                 from /home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/helper/boost/asio/ip/udp_ext.hpp:20,
                 from /home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/endpoints/src/endpoint_impl.cpp:8:
/home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/helper/boost/asio/detail/reactive_socket_service_ext.hpp:29:43: fatal error: boost/asio/detail/addressof.hpp: No such file or directory
 #include <boost/asio/detail/addressof.hpp>
                                           ^
compilation terminated.
make[4]: *** [CMakeFiles/vsomeip.dir/build.make:102: CMakeFiles/vsomeip.dir/implementation/endpoints/src/endpoint_impl.cpp.o] Error 1
make[4]: *** Waiting for unfinished jobs....
/home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/endpoints/src/local_client_endpoint_impl.cpp: In member function ?virtual void vsomeip::local_client_endpoint_impl::connect()?:
/home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/implementation/endpoints/src/local_client_endpoint_impl.cpp:128:64: error: ?class boost::asio::basic_stream_socket<boost::asio::local::stream_protocol>? has no member named ?native?
                         credentials::send_credentials(socket_->native(),
                                                                ^
make[4]: *** [CMakeFiles/vsomeip.dir/build.make:115: CMakeFiles/vsomeip.dir/implementation/endpoints/src/local_client_endpoint_impl.cpp.o] Error 1
make[3]: *** [CMakeFiles/Makefile2:214: CMakeFiles/vsomeip.dir/all] Error 2
make[2]: *** [Makefile:130: all] Error 2
make[1]: *** [package/pkg-generic.mk:233: /home/thomas/projets/buildroot/output/build/vsomeip-2.10.21/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

I'll comment below some more issues.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8d5ed19..54a0331 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1258,6 +1258,9 @@ F:        package/mpv/
>  F:      package/rpi-firmware/
>  F:      package/rpi-userland/
> 
> +N:     Maik Brenke, <maik.brenke@continental-corporation.com>
> +F:     package/vsomeip/

Indentation is wrong: one tab should be used between the field name and
their values.

> +
>  N:      Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
>  F:      package/nvme/
> 
> diff --git a/package/Config.in b/package/Config.in
> index 712e360..7ebb739 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1582,6 +1582,7 @@ menu "Networking"
>          source "package/sofia-sip/Config.in"
>          source "package/thrift/Config.in"
>          source "package/usbredir/Config.in"
> +       source "package/vsomeip/Config.in"

Indentation is wrong: use one tab. Perhaps it's because you didn't send
your patch with "git send-email".

> diff --git a/package/vsomeip/Config.in b/package/vsomeip/Config.in
> new file mode 100644
> index 0000000..7244c26
> --- /dev/null
> +++ b/package/vsomeip/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_VSOMEIP
> +       bool "vsomeip"

All over this file, the indentation is wrong: one need to use one tab.

> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +       depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS

This option doesn't exist, so with dependency, the vsomeip package can
never be selected. I'm wondering how you tested it.

> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_SYSTEM
> +       select BR2_PACKAGE_BOOST_THREAD
> +       select BR2_PACKAGE_BOOST_LOG
> +       help
> +         The vsomeip stack implements the Scalable service-Oriented
> +         MiddlewarE over IP (SOME/IP)) protocol (http://some-ip.com/).
> +         The stack consists out of:
> +          * a shared library for SOME/IP (`libvsomeip.so`)
> +          * a second shared library for SOME/IP's service discovery
> +            (`libvsomeip-sd.so`) which is loaded during runtime if
> +            the service discovery is enabled.

One blank line needed here.

> +         https://github.com/GENIVI/vsomeip

And another one here.

> +comment "vsomeip needs a toolchain w/ C++, threads, gcc >= 4.8"
> +       depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS

Again, this option doesn't exist.

> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

Please split this long line.

> diff --git a/package/vsomeip/vsomeip.mk b/package/vsomeip/vsomeip.mk
> new file mode 100644
> index 0000000..aebf707
> --- /dev/null
> +++ b/package/vsomeip/vsomeip.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# vsomeip
> +#
> +################################################################################

Please add one blank line here.

> +VSOMEIP_VERSION = 2.10.21
> +VSOMEIP_SITE = $(call github,GENIVI,vsomeip,$(VSOMEIP_VERSION))
> +VSOMEIP_LICENSE = MPL-2.0
> +VSOMEIP_LICENSE_FILES = LICENSE
> +
> +VSOMEIP_DEPENDENCIES = boost
> +
> +$(eval $(cmake-package))

I had fixed all the formatting issues, but then stumbled across the
build failure, so I gave up. Could you fix those issues, and send an
updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
