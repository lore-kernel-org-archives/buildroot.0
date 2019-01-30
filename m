From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 30 Jan 2019 11:47:27 +0100
Subject: [Buildroot] [PATCH v4 5/7] optee-benchmark: new package
In-Reply-To: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1548845249-28201-5-git-send-email-etienne.carriere@linaro.org>
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
revision release tagged 3.4.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

---
Changes v3 -> v4:
  - Upgrade from OP-TEE release 3.3.0 to 3.4.0. No local patch required.

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
 package/optee-benchmark/3.4.0/optee-benchmark.hash |  2 +
 package/optee-benchmark/Config.in                  | 55 ++++++++++++++++++++++
 package/optee-benchmark/optee-benchmark.mk         | 22 +++++++++
 5 files changed, 81 insertions(+)
 create mode 100644 package/optee-benchmark/3.4.0/optee-benchmark.hash
 create mode 100644 package/optee-benchmark/Config.in
 create mode 100644 package/optee-benchmark/optee-benchmark.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f572224..ef359c9 100644
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
index fb71fe7..c9b1178 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2077,6 +2077,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/optee-benchmark/3.4.0/optee-benchmark.hash b/package/optee-benchmark/3.4.0/optee-benchmark.hash
new file mode 100644
index 0000000..c3c41b6
--- /dev/null
+++ b/package/optee-benchmark/3.4.0/optee-benchmark.hash
@@ -0,0 +1,2 @@
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.4.0.tar.gz
+sha256 e5e868a06a9dcc8cc444b3e72c65f57670b0811091be62edbe0d03d13c75e716 optee-benchmark-3.4.0.tar.gz
diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
new file mode 100644
index 0000000..b3a598e
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
+	bool "3.4.0"
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
+	default "3.4.0"	if BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
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
