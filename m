From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 11:24:50 +0100
Subject: [Buildroot] [PATCH 1/1] flatbuffers: new package
In-Reply-To: <20171217181231.13634-1-fontaine.fabrice@gmail.com>
References: <20171217181231.13634-1-fontaine.fabrice@gmail.com>
Message-ID: <20171218112450.5b864717@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A similar patch adding this package was proposed recently:

From: Erik Tideman <erik.tideman@faltcom.se>
Subject: [Buildroot] [PATCH] flatbuffers: new package
Date: Mon, 18 Sep 2017 12:35:18 +0200

However, they were some comments, so it was marked as Changes Requested
and the submitter never posted a new version. So it's nice to see you
picking it up.

On Sun, 17 Dec 2017 19:12:31 +0100, Fabrice Fontaine wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index e3f464aba6..ce48b117a3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -620,6 +620,7 @@ F:	package/alljoyn-tcl/
>  F:	package/alljoyn-tcl-base/
>  F:	package/boinc/
>  F:	package/duktape/
> +F:	package/flatbuffers/

Nit: this doesn't apply to master, we don't have duktape (yet).

But more importantly, it doesn't build here. Use the following
defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FLATBUFFERS=y
# BR2_TARGET_ROOTFS_TAR is not set

Will fail to build with:

>>> flatbuffers v1.8.0 Building
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5  -C /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/
Scanning dependencies of target flathash
Scanning dependencies of target flatbuffers_shared
Scanning dependencies of target flatbuffers
Scanning dependencies of target flatc
[  3%] Building CXX object CMakeFiles/flathash.dir/src/flathash.cpp.o
[  6%] Building CXX object CMakeFiles/flatbuffers.dir/src/code_generators.cpp.o
[  9%] Building CXX object CMakeFiles/flatbuffers.dir/src/idl_parser.cpp.o
[ 15%] Building CXX object CMakeFiles/flatbuffers_shared.dir/src/code_generators.cpp.o
[ 15%] Building CXX object CMakeFiles/flatc.dir/src/code_generators.cpp.o
In file included from /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/cstdint:35:0,
                 from /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/include/flatbuffers/hash.h:20,
                 from /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/src/flathash.cpp:20:
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support for the \
  ^
In file included from /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/cstdint:35:0,
                 from /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/include/flatbuffers/base.h:12,
                 from /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/include/flatbuffers/idl.h:24,
                 from /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/include/flatbuffers/code_generators.h:22,
                 from /home/thomas/projets/buildroot/output/build/flatbuffers-v1.8.0/src/code_generators.cpp:17:
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support for the \
  ^

And approximately 10 more screens of other errors. Looking at these
errors, it also feels like it's using some amount of C++, so a
dependency on BR2_INSTALL_LIBSTDCPP would be appropriate.

Don't you use test-pkg to test your package submissions ? It would be
good to do so.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
