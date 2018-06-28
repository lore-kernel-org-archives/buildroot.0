From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 23:36:12 +0200
Subject: [Buildroot] [PATCH v2 4/5] grpc: new package
In-Reply-To: <20180521175310.18563-5-charles.hardin@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-5-charles.hardin@storagecraft.com>
Message-ID: <20180628233612.26e24014@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Mon, 21 May 2018 10:53:09 -0700, charles.hardin at storagecraft.com
wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> add the gRPC package from Google's github repo. This is
> currently just installing the C and C++ libraries on the
> target installation for now. Some effort could be made
> to add the python bindings as a subsequent patch.
> 
> This also adds a patch to specify the protoc to use since
> that is provided by buildroot and not the host in addition
> to overriding the ldconfig command since that doesn't apply
> to the buildroot compile.
> 
> NOTE: This doesn't add the python or any other bindings
> 
> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>

I tried this here, and unfortunately it doesn't build.

First, the CFLAGS/CXXFLAGS/LDFLAGS passed as make options were
completely overriding the ones from GRPC makefile, causing a build
failure. I fixed that with:

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 738cd7f851..da5def4ceb 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -15,7 +15,8 @@ HOST_GRPC_DEPENDENCIES = host-c-ares host-protobuf host-openssl
 
 GRPC_INSTALL_STAGING = YES
 
-GRPC_CROSS_MAKE_OPTS_BASE = \
+GRPC_MAKE_ENV = \
+       $(TARGET_MAKE_ENV) \
        GRPC_CROSS_COMPILE="true" \
        LDCONFIG=/bin/true \
        HOST_CC="$(HOSTCC)" \
@@ -34,15 +35,12 @@ GRPC_CROSS_MAKE_OPTS_BASE = \
        STRIP=/bin/true
 
 GRPC_MAKE_OPTS = \
-       $(GRPC_CROSS_MAKE_OPTS_BASE) \
        PROTOC="$(HOST_DIR)/usr/bin/protoc"
 
 GRPC_INSTALL_TARGET_OPTS = \
-       $(GRPC_CROSS_MAKE_OPTS_BASE) \
        prefix="$(TARGET_DIR)/usr"
 
 GRPC_INSTALL_STAGING_OPTS = \
-       $(GRPC_CROSS_MAKE_OPTS_BASE) \
        prefix="$(STAGING_DIR)/usr"
 
 ifeq ($(BR2_SHARED_LIBS),y)
@@ -60,17 +58,17 @@ GRPC_INSTALL_TARGETS = install-shared_c install-shared_cxx
 endif
 
 define GRPC_BUILD_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) \
+       $(GRPC_MAKE_ENV) $(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) \
                $(GRPC_BUILD_TARGETS)
 endef
 
 define GRPC_INSTALL_STAGING_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_STAGING_OPTS) -C $(@D) \
+       $(GRPC_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_STAGING_OPTS) -C $(@D) \
                $(GRPC_STAGING_TARGETS)
 endef
 
 define GRPC_INSTALL_TARGET_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_TARGET_OPTS) -C $(@D) \
+       $(GRPC_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_TARGET_OPTS) -C $(@D) \
                $(GRPC_INSTALL_TARGETS)
 endef

With that in place, the GRPC build moved on, but failed at a later point, with:

[HOSTCXX] Compiling src/compiler/cpp_generator.cc
[HOSTCXX] Compiling src/compiler/csharp_generator.cc
[HOSTCXX] Compiling src/compiler/node_generator.cc
In file included from /usr/include/c++/7/ext/string_conversions.h:41:0,
                 from /usr/include/c++/7/bits/basic_string.h:6349,
                 from /usr/include/c++/7/string:52,
                 from /usr/include/c++/7/stdexcept:39,
                 from /usr/include/c++/7/array:39,
                 from /usr/include/c++/7/tuple:39,
                 from /usr/include/c++/7/bits/stl_map.h:63,
                 from /usr/include/c++/7/map:61,
                 from src/compiler/cpp_generator.cc:19:
/usr/include/c++/7/cstdlib:131:11: error: ?::at_quick_exit? has not been declared
   using ::at_quick_exit;
           ^~~~~~~~~~~~~
/usr/include/c++/7/cstdlib:154:11: error: ?::quick_exit? has not been declared
   using ::quick_exit;
           ^~~~~~~~~~
[HOSTCXX] Compiling src/compiler/objective_c_generator.cc
In file included from /usr/include/c++/7/ext/string_conversions.h:41:0,
                 from /usr/include/c++/7/bits/basic_string.h:6349,
                 from /usr/include/c++/7/string:52,
                 from /usr/include/c++/7/stdexcept:39,
                 from /usr/include/c++/7/array:39,
                 from /usr/include/c++/7/tuple:39,
                 from /usr/include/c++/7/bits/stl_map.h:63,
                 from /usr/include/c++/7/map:61,
                 from src/compiler/csharp_generator.cc:20:
/usr/include/c++/7/cstdlib:131:11: error: ?::at_quick_exit? has not been declared
   using ::at_quick_exit;
           ^~~~~~~~~~~~~
/usr/include/c++/7/cstdlib:154:11: error: ?::quick_exit? has not been declared
   using ::quick_exit;
           ^~~~~~~~~~
In file included from ./src/compiler/cpp_generator.h:26:0,
                 from src/compiler/cpp_generator.cc:21:
/usr/include/c++/7/memory: In function ?void* std::align(std::size_t, std::size_t, void*&, std::size_t&)?:
/usr/include/c++/7/memory:116:58: error: cast from ?void*? to ?uintptr_t {aka unsigned int}? loses precision [-fpermissive]
   const auto __intptr = reinterpret_cast<uintptr_t>(__ptr);

And more of those issues. Here is the defconfig I have used:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.02-891-g046c5e2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GRPC=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look ?

I'll also do a regular review of the package in a separate e-mail, so
that you can take into account other comments at the same time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
