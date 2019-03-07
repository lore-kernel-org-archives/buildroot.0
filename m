From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu,  7 Mar 2019 16:45:28 +0100
Subject: [Buildroot] [PATCH v3] package/optee-*: packages depend on thread
 support
In-Reply-To: <17603738bfac0de04a1de57a562dbde2a572d926.1551944208.git.etienne.carriere@linaro.org>
References: <17603738bfac0de04a1de57a562dbde2a572d926.1551944208.git.etienne.carriere@linaro.org>
Message-ID: <1551973528-5130-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_OPTEE_CLIENT depends on BR2_TOOLCHAIN_HAS_THREADS.
Library teec uses pthread support to protect clients state
management.

This change declares this dependency in package optee-client and
updates dependent packages accordingly: optee-benchmark,
optee-client, optee-examples and optee-test.

Fixes [1] and [2] where config selected an toolchain without thread
support and build failed with trace like:

  CMake Error at /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
    Could NOT find Threads (missing: Threads_FOUND)
  Call Stack (most recent call first):
    /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:377 (_FPHSA_FAILURE_MESSAGE)
    /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindThreads.cmake:212 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
    libteec/CMakeLists.txt:8 (find_package)

[1] http://autobuild.buildroot.net/results/ed6ffe2197da4f3a970bd3c5522291236396cc8e
[2] http://autobuild.buildroot.net/results/406f90048db097580b626ef889823132f8676ba1

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
  - Squash v2 series into a single patch.
  - Update config comment for unmet dependencies.

Changes v1 -> v2:
  - No change. v2 appends changes to this change to propagate the optee-client
    dependency on threads to packages dependent on optee-client.

---
 package/optee-benchmark/Config.in | 4 +++-
 package/optee-client/Config.in    | 4 +++-
 package/optee-examples/Config.in  | 4 +++-
 package/optee-test/Config.in      | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
index 0e36549..0023ac6 100644
--- a/package/optee-benchmark/Config.in
+++ b/package/optee-benchmark/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPTEE_BENCHMARK
 	bool "optee-benchmark"
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_PACKAGE_LIBYAML
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 
 	  http://github.com/linaro-swg/optee_benchmark
 
-comment "optee-benchmark needs a toolchain w/ dynamic library"
+comment "optee-benchmark needs a toolchain w/ dynamic library and threads"
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index db0b7b7..3a8efb5 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Enable the OP-TEE client package that brings non-secure
 	  client application resources for OP-TEE support. OP-TEE
@@ -13,5 +14,6 @@ config BR2_PACKAGE_OPTEE_CLIENT
 
 	  https://github.com/OP-TEE/optee_client
 
-comment "optee-client needs a toolchain w/ dynamic library"
+comment "optee-client needs a toolchain w/ dynamic library and threads"
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 479f920..2064d5d 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 	bool "optee-examples"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -18,6 +19,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 
 	  https://github.com/linaro-swg/optee_examples
 
-comment "optee-examples needs a toolchain w/ dynamic library"
+comment "optee-examples needs a toolchain w/ dynamic library and threads"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 575790b..2cd2dc8 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_TEST
 	bool "optee-test"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -22,6 +23,7 @@ config BR2_PACKAGE_OPTEE_TEST
 
 	  http://github.com/OP-TEE/optee_test
 
-comment "optee-test needs a toolchain w/ dynamic library"
+comment "optee-test needs a toolchain w/ dynamic library and threads"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
