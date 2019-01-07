From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon,  7 Jan 2019 11:24:56 +0100
Subject: [Buildroot] [PATCH v3 5/7] optee-benchmark: new package
In-Reply-To: <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
References: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
 <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1546856698-20032-5-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OP-TEE performance benchmark tools for the OP-TEE project.

This packages generates embedded Linux based OS materials used
to retrieve execution timing information on invocation of the
OP-TEE secure services.

It is added next to the OP-TEE client package in BR configuration.

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.3.0 with an added patch to fix an issue
reported by recent GCC toolchains.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
  - Add an entry in file DEVELOPERS.
  - Clean Config.in layout and description sections.
  - Drop BR2_PACKAGE_OPTEE_BENCHMARK_SYNCED_VERSION.
  - Clean optee-benchmark.mk layout.
  - Replace common optee-benchmark.hash with per-version .hash files.
  - Add a patch on 3.3.0 to fix an issue reported through GCC warns.

Changes v1 -> v2:
  - Add dependency on OP-TEE client.
  - Add option BR2_PACKAGE_OPTEE_BENCHMARK_SYNCED_VERSION to ensure
    OP-TEE benchmark version is synced with OP-TEE client version.
  - Remove useless OPTEE_BENCHMARK_INSTALL_STAGING and
    OPTEE_BENCHMARK_INSTALL_IMAGES.
  - Remove unused BR2_PACKAGE_OPTEE_BENCHMARK_GIT_REFERENCE.
  - Remove useless _INSTALL_STAGING/_INSTALL_IMAGES=YES.

---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ix-format-specifier-in-call-to-INFO-macro.patch | 30 ++++++++++++
 package/optee-benchmark/3.3.0/optee-benchmark.hash |  2 +
 package/optee-benchmark/Config.in                  | 55 ++++++++++++++++++++++
 package/optee-benchmark/optee-benchmark.mk         | 22 +++++++++
 6 files changed, 111 insertions(+)
 create mode 100644 package/optee-benchmark/3.3.0/0001-Fix-format-specifier-in-call-to-INFO-macro.patch
 create mode 100644 package/optee-benchmark/3.3.0/optee-benchmark.hash
 create mode 100644 package/optee-benchmark/Config.in
 create mode 100644 package/optee-benchmark/optee-benchmark.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 28ba658..4dd7f4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -683,6 +683,7 @@ F:	package/szip/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
+F:	package/optee-benchmark/
 F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
diff --git a/package/Config.in b/package/Config.in
index e5b6dad..cdee281 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2076,6 +2076,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/optee-benchmark/3.3.0/0001-Fix-format-specifier-in-call-to-INFO-macro.patch b/package/optee-benchmark/3.3.0/0001-Fix-format-specifier-in-call-to-INFO-macro.patch
new file mode 100644
index 0000000..6a2cd37
--- /dev/null
+++ b/package/optee-benchmark/3.3.0/0001-Fix-format-specifier-in-call-to-INFO-macro.patch
@@ -0,0 +1,30 @@
+commit ecba70dd88f33f3c770a4c564b49d7e872eab34e
+Author: ChrisG55 <christian_g_55@msn.com>
+Date:   Thu Dec 6 11:52:29 2018 +0100
+
+    Fix format specifier in call to INFO macro
+    
+    Improper use of format specifiers for arguments of type intptr_t and size_t
+    raises warnings at compile time. Compilation breaks when GCC's -Werror flag is
+    set, which is the default. By using the appropriate format specifiers, no
+    warnings are raised and compilation succeeds.
+    
+    Reported-by: ChrisG55 <christian_g_55@msn.com>
+    Tested-by: ChrisG55 <christian_g_55@msn.com>
+    Fixes: 55fcc4ae0de4b9a2f7253562f8083694e69a8e33
+    Signed-off-by: ChrisG55 <christian_g_55@msn.com>
+    Reviewed-by: Joakim Bech <joakim.bech@linaro.org>
+
+diff --git a/main.c b/main.c
+index 3d53dca..86225bd 100644
+--- a/main.c
++++ b/main.c
+@@ -106,7 +106,7 @@ static void alloc_bench_buf(uint32_t cores)
+ 	paddr_ts_buf = op.params[0].value.a;
+ 	size = op.params[0].value.b;
+ 
+-	INFO("ts buffer paddr = %x, size = %d\n", paddr_ts_buf, size);
++	INFO("ts buffer paddr = %" PRIiPTR ", size = %zu\n", paddr_ts_buf, size);
+ 	if (paddr_ts_buf) {
+ 
+ 		bench_ts_global = mmap_paddr(paddr_ts_buf, size);
diff --git a/package/optee-benchmark/3.3.0/optee-benchmark.hash b/package/optee-benchmark/3.3.0/optee-benchmark.hash
new file mode 100644
index 0000000..d93c26c
--- /dev/null
+++ b/package/optee-benchmark/3.3.0/optee-benchmark.hash
@@ -0,0 +1,2 @@
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.3.0.tar.gz
+sha256 bfba3749ac8b37628550696f0625452ae8aef060eff5b3b1c4283a5dad8a3383 optee-benchmark-3.3.0.tar.gz
diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
new file mode 100644
index 0000000..99794c3
--- /dev/null
+++ b/package/optee-benchmark/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_OPTEE_BENCHMARK
+	bool "optee-benchmark"
+	select BR2_PACKAGE_OPTEE_CLIENT
+	select BR2_PACKAGE_LIBYAML
+	help
+	  Enable the OP-TEE benchmark package that brings facilities
+	  for profiling traversal and execution timings when
+	  invoking OP-TEE. OP-TEE benchmark is a component delivered
+	  by the OP-TEE project.
+
+	  http://github.com/linaro-swg/optee_benchmark
+
+if BR2_PACKAGE_OPTEE_BENCHMARK
+
+choice
+	prompt "version"
+	default BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	help
+	  Select the version of OP-TEE benchmark you want to use
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	bool "3.3.0"
+	help
+	  This fetches the registered release tag from the
+	  OP-TEE official Git repository.
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_URL
+	string "URL of custom repository"
+	help
+	  Specific location of the reference source tree Git repository.
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_VERSION
+	string
+	default "3.3.0"	if BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	default BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_VERSION \
+			if BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
+
+endif #BR2_PACKAGE_OPTEE_BENCHMARK
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
new file mode 100644
index 0000000..8eef0f6
--- /dev/null
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# optee-benchmarch
+#
+################################################################################
+
+OPTEE_BENCHMARK_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_BENCHMARK_VERSION))
+OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
+
+OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
+
+ifeq ($(BR2_PACKAGE_OPTEE_BENCHMARK_LATEST),y)
+OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT),y)
+OPTEE_BENCHMARK_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_URL))
+OPTEE_BENCHMARK_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_BENCHMARK_SOURCE)
+endif
+
+$(eval $(cmake-package))
-- 
1.9.1
