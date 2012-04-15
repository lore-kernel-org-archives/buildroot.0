From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 09:15:17 +0200
Subject: [Buildroot] [git commit] polarssl: new package
Message-ID: <20120415081618.2583996AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31993b329ee676d9f0bece894eee39b1243cfd90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/polarssl/Config.in                         |   28 +++++++++++
 package/polarssl/polarssl-no-programs.patch        |   26 ++++++++++
 package/polarssl/polarssl-no-test-suite.patch      |   26 ++++++++++
 .../polarssl-shared-and-static-library.patch       |   52 ++++++++++++++++++++
 package/polarssl/polarssl.mk                       |   13 +++++
 6 files changed, 146 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4c6d4d8..bcace09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -276,6 +276,7 @@ source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
 source "package/openssl/Config.in"
+source "package/polarssl/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
new file mode 100644
index 0000000..3414a7f
--- /dev/null
+++ b/package/polarssl/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_POLARSSL
+	bool "polarssl"
+	help
+	  PolarSSL is an SSL library written in ANSI C. PolarSSL makes
+	  it easy for developers to include cryptographic and SSL/TLS
+	  capabilities in their (embedded) products with as little
+	  hassle as possible. It is designed to be readable,
+	  documented, tested, loosely coupled and portable.
+
+	  Warning: PolarSSL is licensed under the GPL. If you want to
+	  use it in your own proprietary applications, you have to
+	  purchase a commercial license.
+
+	  http://polarssl.org/
+
+config BR2_PACKAGE_POLARSSL_PROGRAMS
+	bool "polarssl programs"
+	depends on BR2_PACKAGE_POLARSSL
+	help
+	  This option enables the installation and the build of
+	  PolarSSL companion programs: aescrypt2, benchmark, cert_app,
+	  crl_app, crypt_and_hash, dh_client, dh_genprime, dh_server,
+	  gen_entropy, generic_sum, gen_random_ctr_drbg,
+	  gen_random_havege, hello, key_app, md5sum, mpi_demo,
+	  rsa_decrypt, rsa_encrypt, rsa_genkey, rsa_sign, rsa_verify,
+	  selftest, sha1sum, sha2sum, ssi-cgi, ssl_cert_test,
+	  ssl_client1, ssl_client2, ssl_fork_server, ssl_mail_client,
+	  ssl_server, ssl_test
diff --git a/package/polarssl/polarssl-no-programs.patch b/package/polarssl/polarssl-no-programs.patch
new file mode 100644
index 0000000..f118871
--- /dev/null
+++ b/package/polarssl/polarssl-no-programs.patch
@@ -0,0 +1,26 @@
+Add the BUILD_PROGRAMS option to disable programs build
+
+By default, PolarSSL builds and installs a large set of companions
+programs, which in some cases are not useful. This patch adds the
+BUILD_PROGRAMS option which allows to disable the build and
+installation of such programs when not needed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: polarssl-1.1.1/CMakeLists.txt
+===================================================================
+--- polarssl-1.1.1.orig/CMakeLists.txt
++++ polarssl-1.1.1/CMakeLists.txt
+@@ -33,7 +33,11 @@
+   add_subdirectory(tests)
+ endif(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
+ 
+-add_subdirectory(programs)
++option(BUILD_PROGRAMS "Build programs." ON)
++
++if(BUILD_PROGRAMS)
++  add_subdirectory(programs)
++endif(BUILD_PROGRAMS)
+ 
+ ADD_CUSTOM_TARGET(apidoc
+                   COMMAND doxygen doxygen/polarssl.doxyfile
diff --git a/package/polarssl/polarssl-no-test-suite.patch b/package/polarssl/polarssl-no-test-suite.patch
new file mode 100644
index 0000000..7e07441
--- /dev/null
+++ b/package/polarssl/polarssl-no-test-suite.patch
@@ -0,0 +1,26 @@
+Add BUILD_TESTS option to disable test suite
+
+By default, PolarSSL builds a fairly extensive test suite to validate
+the library. In the context of Buildroot, building this test suite is
+not really useful, so we add a BUILD_TESTS to disable its build.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: polarssl-1.1.1/CMakeLists.txt
+===================================================================
+--- polarssl-1.1.1.orig/CMakeLists.txt
++++ polarssl-1.1.1/CMakeLists.txt
+@@ -27,9 +27,11 @@
+ add_subdirectory(library)
+ add_subdirectory(include)
+ 
+-if(CMAKE_COMPILER_IS_GNUCC)
++option(BUILD_TESTS "Build tests." ON)
++
++if(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
+   add_subdirectory(tests)
+-endif(CMAKE_COMPILER_IS_GNUCC)
++endif(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
+ 
+ add_subdirectory(programs)
+ 
diff --git a/package/polarssl/polarssl-shared-and-static-library.patch b/package/polarssl/polarssl-shared-and-static-library.patch
new file mode 100644
index 0000000..3ad3334
--- /dev/null
+++ b/package/polarssl/polarssl-shared-and-static-library.patch
@@ -0,0 +1,52 @@
+Allow both shared and static PolarSSL library
+
+By default, PolarSSL is built as a static library. If the option
+USE_SHARED_POLARSSL_LIBRARY is set, then it is build as a shared
+library. But there is no way of building both the shared and static
+versions.
+
+This patch adds the USE_STATIC_POLARSSL_LIBRARY (which defaults to ON)
+in addition to the existing USE_SHARED_POLARSSL_LIBRARY (which
+defaults to OFF). Both options can be manipulated independently.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: polarssl-1.1.1/library/CMakeLists.txt
+===================================================================
+--- polarssl-1.1.1.orig/library/CMakeLists.txt
++++ polarssl-1.1.1/library/CMakeLists.txt
+@@ -1,4 +1,5 @@
+ option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL as a shared library." OFF)
++option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL as a static library." ON)
+ 
+ set(src
+      aes.c
+@@ -40,17 +41,21 @@
+      xtea.c
+ )
+ 
+-if(NOT USE_SHARED_POLARSSL_LIBRARY)
+-
+-add_library(polarssl STATIC ${src})
+-
+-else(NOT USE_SHARED_POLARSSL_LIBRARY)
++if(USE_SHARED_POLARSSL_LIBRARY)
+ 
+ add_library(polarssl SHARED ${src})
+ set_target_properties(polarssl PROPERTIES VERSION 1.1.1 SOVERSION 1)
++set_target_properties(polarssl PROPERTIES OUTPUT_NAME polarssl)
++
++endif(USE_SHARED_POLARSSL_LIBRARY)
++
++if(USE_STATIC_POLARSSL_LIBRARY)
++
++add_library(polarssl-static STATIC ${src})
++set_target_properties(polarssl-static PROPERTIES OUTPUT_NAME polarssl)
+ 
+-endif(NOT USE_SHARED_POLARSSL_LIBRARY)
++endif(USE_STATIC_POLARSSL_LIBRARY)
+ 
+-install(TARGETS polarssl
++install(TARGETS polarssl polarssl-static
+         DESTINATION ${LIB_INSTALL_DIR}
+         PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
new file mode 100644
index 0000000..0d8574c
--- /dev/null
+++ b/package/polarssl/polarssl.mk
@@ -0,0 +1,13 @@
+POLARSSL_SITE = http://polarssl.org/code/releases/
+POLARSSL_VERSION = 1.1.1
+POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
+POLARSSL_CONF_OPT = \
+	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
+	-DUSE_STATIC_POLARSSL_LIBRARY=ON \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
+
+POLARSSL_INSTALL_STAGING = YES
+
+$(eval $(call CMAKETARGETS))
+
