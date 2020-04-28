From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 28 Apr 2020 17:10:18 -0500
Subject: [Buildroot] [PATCH] package/cunit: switch to maintain fork version
 3.2.6
Message-ID: <20200428221018.1317-1-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CUnit project on Sourgeforce has not been maintained since 2014.
Switch to forked version on Gitlab which is under active development
at:

  https://gitlab.com/cunity/cunit#new-releases-of-cunit-2018-08-onwards

Changes which were made to the package include:

 * Switch to CMake build system
 * Requires BR2_USE_MMU for '-rdynamic' (CMake test)
 * Requires C++ for CUnit/Sources/wxWidget/wxWidget.cpp
 * Update hash format to two spaces
 * Add patch to resolve issue with unused variable with assert to
   allow compiling with GCC 8
 * Add patch to optionally build test and examples (turn off for
   buildroot)
 * Add myself to DEVELOPERS for this package

Tested with ./utils/test-pkg -c cunit.config -p cunit:

                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

Checked with check-package:

$ ./utils/check-package package/cunit/*
192 lines processed
0 warnings generated

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 DEVELOPERS                                    |   1 +
 ...n-remove-variable-only-used-in-asser.patch |  45 +++++++
 ...dd-optional-builds-of-tests-examples.patch | 114 ++++++++++++++++++
 package/cunit/Config.in                       |  10 +-
 package/cunit/cunit.hash                      |   4 +-
 package/cunit/cunit.mk                        |  15 +--
 6 files changed, 178 insertions(+), 11 deletions(-)
 create mode 100644 package/cunit/0001-Framework-TestRun-remove-variable-only-used-in-asser.patch
 create mode 100644 package/cunit/0002-CMakeLists-add-optional-builds-of-tests-examples.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 8000b6b0f3..476fc74645 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2250,6 +2250,7 @@ F:	package/davfs2/
 
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
+F:	package/cunit/
 F:	package/miraclecast/
 F:	package/python-pycrypto/
 F:	package/python-pysnmp/
diff --git a/package/cunit/0001-Framework-TestRun-remove-variable-only-used-in-asser.patch b/package/cunit/0001-Framework-TestRun-remove-variable-only-used-in-asser.patch
new file mode 100644
index 0000000000..841510451f
--- /dev/null
+++ b/package/cunit/0001-Framework-TestRun-remove-variable-only-used-in-asser.patch
@@ -0,0 +1,45 @@
+From 7f5b697867b8245f1527c95626855e262c6cad46 Mon Sep 17 00:00:00 2001
+From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
+Date: Tue, 28 Apr 2020 13:02:07 -0500
+Subject: [PATCH] Framework/TestRun: remove variable only used in 'assert'
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While compiling with GCC 8 the following compiling error occurs:
+
+  cunit-3.2.6/CUnit/Sources/Framework/TestRun.c: In function ???CU_get_run_results_string???:
+  cunit-3.2.6/CUnit/Sources/Framework/TestRun.c:688:20: error: unused variable ???r??? [-Werror=unused-variable]
+     CU_pTestRegistry r = CU_get_registry();
+
+Remove the unused 'r' variable from CU_get_run_results_string to fix
+and move function call of CU_get_registry() to the assert function.
+
+Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
+---
+Upstream: https://gitlab.com/cunity/cunit/-/merge_requests/57
+---
+ CUnit/Sources/Framework/TestRun.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CUnit/Sources/Framework/TestRun.c b/CUnit/Sources/Framework/TestRun.c
+index 9fe0b3e..a9bd02f 100644
+--- a/CUnit/Sources/Framework/TestRun.c
++++ b/CUnit/Sources/Framework/TestRun.c
+@@ -685,12 +685,11 @@ CU_EXPORT char * CU_get_run_results_string(void)
+ 
+ {
+   CU_pRunSummary s = &f_run_summary;
+-  CU_pTestRegistry r = CU_get_registry();
+   size_t max_result_len = 8192;
+   char *result;
+ 
+   assert(NULL != s);
+-  assert(NULL != r);
++  assert(NULL != CU_get_registry());
+ 
+   result = CU_MALLOC(max_result_len);
+   if (result) {
+-- 
+2.17.1
+
diff --git a/package/cunit/0002-CMakeLists-add-optional-builds-of-tests-examples.patch b/package/cunit/0002-CMakeLists-add-optional-builds-of-tests-examples.patch
new file mode 100644
index 0000000000..2bcb9368f6
--- /dev/null
+++ b/package/cunit/0002-CMakeLists-add-optional-builds-of-tests-examples.patch
@@ -0,0 +1,114 @@
+From bd4ecc7de28e6c2082073febd8dac7e88fdc9e15 Mon Sep 17 00:00:00 2001
+From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
+Date: Tue, 28 Apr 2020 13:46:13 -0500
+Subject: [PATCH] CMakeLists: add optional builds of tests/examples
+
+Introduce BUILD_TESTS and BUILD_EXAMPLES CMake variable to optionally
+build Tests and Examples. This allows the CUnit library to be built
+for more architecture platforms as the Tests and Examples do not align
+with compiling on platforms which require -fPIC or -pie.
+
+Update .gitlab-ci.yml to allow for building of Tests and Examples on
+the CI platforms. Also remove trailing whitespace with VIM macro.
+
+Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
+---
+Upstream: https://gitlab.com/cunity/cunit/-/merge_requests/58
+---
+ .gitlab-ci.yml | 18 +++++++++---------
+ CMakeLists.txt |  8 ++++++++
+ 2 files changed, 17 insertions(+), 9 deletions(-)
+
+diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
+index 7562e27..4df95eb 100644
+--- a/.gitlab-ci.yml
++++ b/.gitlab-ci.yml
+@@ -13,9 +13,9 @@ stages:
+     - git clean -f -d -x
+     - mkdir build-${CI_JOB_NAME}
+     - cd build-${CI_JOB_NAME}
+-    - cmake -G "Unix Makefiles" ..
++    - cmake -G "Unix Makefiles" .. -DBUILD_TESTS=ON -DBUILD_EXAMPLES=ON
+     - cmake --build . -- -j2
+-    - ctest --output-on-failure    
++    - ctest --output-on-failure
+     - ./Examples/CI/cicd-pass-plain
+     - ./Examples/CI/cicd-pass-setupfuncs
+     - junit2html --summary-matrix Examples/CI/*-Results.xml
+@@ -47,7 +47,7 @@ cunit-ubuntu-18.04:
+   stage: build
+   image: registry.gitlab.com/cunity/linux-cmake-builders/ubuntu-18.04:master
+ 
+-cunit-ubuntu-17.10: 
++cunit-ubuntu-17.10:
+   <<: *cunit-build
+   stage: build
+   image: registry.gitlab.com/cunity/linux-cmake-builders/ubuntu-17.10:master
+@@ -89,7 +89,7 @@ cmake-direxample-ubuntu-18.04:
+   - ln -s ../../. cunit-x.y.z
+   - mkdir bld
+   - cd bld
+-  - cmake ..
++  - cmake .. -DBUILD_TESTS=ON -DBUILD_EXAMPLES=ON
+   - cmake --build .
+   - ./test-program
+   dependencies:
+@@ -107,7 +107,7 @@ cmake-pkgexample-ubuntu-18.04:
+     - cd CMakeExamples/CMakeFindPackage
+     - mkdir bld
+     - cd bld
+-    - cmake .. -DCUnit_DIR=$(pwd)/../../../packages/cunit/CUnit/share/cmake
++    - cmake .. -DBUILD_TESTS=ON -DBUILD_EXAMPLES=ON -DCUnit_DIR=$(pwd)/../../../packages/cunit/CUnit/share/cmake
+     - cmake --build .
+     - ./test-program
+   dependencies:
+@@ -121,8 +121,8 @@ cunit-win2019-vs2015:
+   script:
+     - mkdir build-win2019-vs2015
+     - cd build-win2019-vs2015
+-    - cmake -G "Visual Studio 14 2015 Win64" .. 
+-    - cmake --build . --config Release 
++    - cmake -G "Visual Studio 14 2015 Win64" .. -DBUILD_TESTS=ON -DBUILD_EXAMPLES=ON
++    - cmake --build . --config Release
+     - ctest -C Release
+   artifacts:
+     paths:
+@@ -132,7 +132,7 @@ cunit-win2019-vs2015:
+       junit:
+         - build-win2019-vs2015\\Examples\\CI\\*-Results.xml
+         - build-win2019-vs2015\\Tests\\*-Results.xml
+-  except: 
++  except:
+     - schedules
+   only:
+     variables:
+@@ -141,7 +141,7 @@ cunit-win2019-vs2015:
+ results:
+   stage: results
+   image: registry.gitlab.com/cunity/linux-cmake-builders/ubuntu-18.04:master
+-  script:    
++  script:
+     - sh merge-results.sh
+     - junit2html --summary-matrix *-Results.xml
+ 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c69d14e..c7c107a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,5 +13,13 @@ if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
+ endif()
+ 
+ add_subdirectory(CUnit)
++
++# Tests
++if (BUILD_TESTS)
+ add_subdirectory(Tests)
++endif()
++
++# Examples
++if (BUILD_EXAMPLES)
+ add_subdirectory(Examples)
++endif()
+-- 
+2.17.1
+
diff --git a/package/cunit/Config.in b/package/cunit/Config.in
index 8bcfa2a4ec..53d8be2307 100644
--- a/package/cunit/Config.in
+++ b/package/cunit/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_CUNIT
 	bool "cunit"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
 	help
-	  An automated testing framework in 'C'.
+	  An automated testing framework in 'C' forked from the
+	  Sourceforge CUnit which is currently unmaintained.
 
-	  http://cunit.sourceforge.net/
+	  https://gitlab.com/cunity/cunit
+
+comment "cunit needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cunit/cunit.hash b/package/cunit/cunit.hash
index bbd43a78ca..606ce20015 100644
--- a/package/cunit/cunit.hash
+++ b/package/cunit/cunit.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214  CUnit-2.1-3.tar.bz2
-sha256 5d9d73d41a57dd2f34487ef3978a2c13cdb97294baeeb81fcd274796399eb15f  COPYING
+sha256  4f59094ff602489a0a88fc4960df9c860e46343183eb59475b02062d3121e1f2  cunit-3.2.6.tar.gz
+sha256  5d9d73d41a57dd2f34487ef3978a2c13cdb97294baeeb81fcd274796399eb15f  COPYING
diff --git a/package/cunit/cunit.mk b/package/cunit/cunit.mk
index 9fc3b96141..776fa7753b 100644
--- a/package/cunit/cunit.mk
+++ b/package/cunit/cunit.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-CUNIT_VERSION = 2.1-3
-CUNIT_SITE = http://downloads.sourceforge.net/project/cunit/CUnit/$(CUNIT_VERSION)
-CUNIT_SOURCE = CUnit-$(CUNIT_VERSION).tar.bz2
-CUNIT_INSTALL_STAGING = YES
+CUNIT_VERSION = 3.2.6
+CUNIT_SITE = https://gitlab.com/cunity/cunit/-/archive/$(CUNIT_VERSION)
 CUNIT_LICENSE = LGPL-2.0+
 CUNIT_LICENSE_FILES = COPYING
 
-# The source archive does not have the autoconf/automake material generated.
-CUNIT_AUTORECONF = YES
+# Static library for unit testing
+CUNIT_INSTALL_STAGING = YES
+CUNIT_INSTALL_TARGET = NO
+
+CUNIT_CONF_OPTS +=-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -fPIC -pie "
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.17.1
