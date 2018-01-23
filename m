From: James Knight <james.knight@rockwellcollins.com>
Date: Tue, 23 Jan 2018 13:24:43 -0500
Subject: [Buildroot] [PATCH 1/1] libpqxx: needs at least gcc 4.8 for c++11
 features
Message-ID: <20180123182443.3088-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses autoconf (AX_CXX_COMPILE_STDCXX_11) to validate C++11
support. The test code uses an auto static data member for validation;
however, support for this only exists in GCC 4.8+ [1]. This causes the
configuration script to generated the following errors:

    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ accepts -g... yes
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features by default... no
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -std=c++11... no
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with +std=c++11... no
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -h std=c++11... no
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -std=c++0x... no
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with +std=c++0x... no
    checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -h std=c++0x... no

Bumping the required GCC version of this package to at least v4.8.

Fixes:

    http://autobuild.buildroot.net/results/fae9ccc37c31c6d1852d0dc11d43f9c6ecbf1fe4/

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=55003

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
See also:

    https://git.buildroot.net/buildroot/commit/?id=7ef807aba7a74ef57d6db7f5c3718d21df9db03e
---
 package/libpqxx/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index 18f905b3780beeac9731e9ea24db971e3a4ddeb9..9553d7903c331900f8b6b354fe02e2ba9a5aea46 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++, gcc >= 4.7, threads"
+comment "libpqxx needs toolchain w/ C++, gcc >= 4.8, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.13.3.windows.1
