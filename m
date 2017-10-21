From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 22:19:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] libcpprestsdk: new package
In-Reply-To: <20171017205308.28529-1-Adamduskett@outlook.com>
References: <20171017205308.28529-1-Adamduskett@outlook.com>
Message-ID: <20171021221907.4f29e5da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 16:53:08 -0400, Adam Duskett wrote:
> The C++ REST SDK is a Microsoft project for cloud-based client-server
> communication in native code using a modern asynchronous C++ API design.
> This project aims to help C++ developers connect to and interact with
> services.
> 
> This package is licensed under the MIT package and depends on BOOST
> and OpenSSL (although it is compatible with LibreSSL.)
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

It fails to build here, with:

/home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.9.0/Release/include/cpprest/astreambuf.h: In member function ?pplx::task<_InternalReturnType> Concurrency::streams::details::streambuf_state_manager<_CharType>::create_exception_checked_value_task(const _CharType1&) const [with _CharType1 = int; _CharType = unsigned char]?:
/home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.9.0/Release/include/cpprest/astreambuf.h:748:9: error: control reaches end of non-void function [-Werror=return-type]
         }
         ^
/home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.9.0/Release/include/cpprest/astreambuf.h: In member function ?pplx::task<_InternalReturnType> Concurrency::streams::details::streambuf_state_manager<_CharType>::create_exception_checked_value_task(const _CharType1&) const [with _CharType1 = unsigned int; _CharType = char]?:
/home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.9.0/Release/include/cpprest/astreambuf.h:748:9: error: control reaches end of non-void function [-Werror=return-type]
         }
         ^

[... many more instances of that ...]

Using this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_LIBCPPRESTSDK=y
# BR2_TARGET_ROOTFS_TAR is not set

You can catch such issues by using ./utils/test-pkg.

Note that I slightly adjusted your patch to accommodate the recent
openssl changes. Here is the diff that I have:

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index 91ef1648c8..e4cafe4063 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
        select BR2_PACKAGE_BOOST_THREAD
        select BR2_PACKAGE_BOOST_REGEX
        select BR2_PACKAGE_BOOST_FILESYSTEM
-       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
+       select BR2_PACKAGE_OPENSSL
        help
          The C++ REST SDK is a Microsoft project for cloud-based
          client-server communication in native code using a modern
@@ -19,5 +19,5 @@ config BR2_PACKAGE_LIBCPPRESTSDK
          https://github.com/Microsoft/cpprestsdk
 
 comment "libcpprestsdk needs a toolchain w/ C++, wchar, threads"
-       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-       || !BR2_USE_WCHAR
+       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+               !BR2_USE_WCHAR
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 9b9b594016..d8b79710d4 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -11,9 +11,7 @@ LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
 
-ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-LIBCPPRESTSDK_DEPENDENCIES += libressl
-else
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCPPRESTSDK_DEPENDENCIES += openssl
 endif

Could you include it in your next submission ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
