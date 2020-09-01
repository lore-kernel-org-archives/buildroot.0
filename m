From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue,  1 Sep 2020 11:37:28 +0200
Subject: [Buildroot] [PATCH] package/uhd: boost-thread needs a toolchain
 without bug 64735
Message-ID: <20200901093729.544094-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

boost-thread needs std::current_exception since version 1.71.0 and
https://github.com/boostorg/exception/commit/386f5507cb8ec99c03ca535bea4f8bd61e0de910

std::current_exception depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as a
result, uhd fails to build on:
In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/uhd-3.15.0.0/host/include/uhd/error.h:74:0,
                 from /home/buildroot/autobuild/run/instance-2/output-1/build/uhd-3.15.0.0/host/include/uhd/types/metadata.h:12,
                 from /home/buildroot/autobuild/run/instance-2/output-1/build/uhd-3.15.0.0/host/lib/types/metadata_c.cpp:8:
/home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp: In function 'std::__cxx11::string boost::current_exception_diagnostic_information(bool)':
/home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp:54:26: error: 'current_exception' is not a member of 'std'
         else if (auto* p=std::current_exception().__cxa_exception_type())
                          ^
In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/uhd-3.15.0.0/host/include/uhd/error.h:74:0,
                 from /home/buildroot/autobuild/run/instance-2/output-1/build/uhd-3.15.0.0/host/include/uhd/types/ranges.h:12,
                 from /home/buildroot/autobuild/run/instance-2/output-1/build/uhd-3.15.0.0/host/lib/types/ranges_c.cpp:8:
/home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp: In function 'std::__cxx11::string boost::current_exception_diagnostic_information(bool)':
/home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp:54:26: error: 'current_exception' is not a member of 'std'
         else if (auto* p=std::current_exception().__cxa_exception_type())

So add a dependency to !BR2_TOOLCHAIN_HAS_GCC_BUG_64735

Fix:
 - http://autobuild.buildroot.net/results/0cdbf01df174648cf0dfb34d9506eb80570e99c0/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/uhd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 21b10210ab..32cb4cf89d 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -3,10 +3,14 @@ comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
+comment "uhd needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_UHD
 	bool "uhd"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-- 
2.20.1
