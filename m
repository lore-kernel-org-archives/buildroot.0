From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 23 Nov 2018 17:33:35 +0100
Subject: [Buildroot] [PATCH v2 3/5] optee-benchmark: new package
In-Reply-To: <1542990817-28362-1-git-send-email-etienne.carriere@linaro.org>
References: <1542900177-17343>
 <1542990817-28362-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1542990817-28362-3-git-send-email-etienne.carriere@linaro.org>
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

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - Add dependency on OP-TEE client.
  - Add option BR2_PACKAGE_OPTEE_BENCHMARK_SYNCED_VERSION to ensure
    OP-TEE benchmark version is synced with OP-TEE client version.
  - Remove useless OPTEE_BENCHMARK_INSTALL_STAGING and
    OPTEE_BENCHMARK_INSTALL_IMAGES.
  - Remove unused BR2_PACKAGE_OPTEE_BENCHMARK_GIT_REFERENCE. 
  - Remove useless _INSTALL_STAGING/_INSTALL_IMAGES=YES.

---
 package/Config.in                            |  1 +
 package/optee-benchmark/Config.in            | 69 ++++++++++++++++++++++++++++
 package/optee-benchmark/optee-benchmark.hash |  2 +
 package/optee-benchmark/optee-benchmark.mk   | 22 +++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 package/optee-benchmark/Config.in
 create mode 100644 package/optee-benchmark/optee-benchmark.hash
 create mode 100644 package/optee-benchmark/optee-benchmark.mk

diff --git a/package/Config.in b/package/Config.in
index 8c3b1bf..38200af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2047,6 +2047,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
new file mode 100644
index 0000000..2d56a7e
--- /dev/null
+++ b/package/optee-benchmark/Config.in
@@ -0,0 +1,69 @@
+config BR2_PACKAGE_OPTEE_BENCHMARK
+	bool "Embed OP-TEE benchmark support"
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
+	prompt "OP-TEE Benchmark version"
+	default BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	help
+	  Select the version of OP-TEE benchmark you want to use
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	bool "sync with latest release tag"
+	help
+	  Sync on latest release tag. This currently fetches the
+	  latest registered release tag from the OP-TEE official
+	  Git repository.
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
+	bool "sync with a specific Git"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_SYNCED_VERSION
+	bool "use same version ref for OP-TEE components"
+	depends on BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	default true
+	help
+	  When enabled package version must match the version set for
+	  OP-TEE client.
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_VERSION
+	string
+	default BR2_PACKAGE_OPTEE_CLIENT_VERSION \
+			if BR2_PACKAGE_OPTEE_BENCHMARK_SYNCED_VERSION
+	default "3.3.0"	if BR2_PACKAGE_OPTEE_BENCHMARK_LATEST
+	default BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_VERSION \
+			if BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
+	help
+	  Reference in the target Git repository to sync with.
+
+if BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_URL
+	string "Git repository site"
+	help
+	  Specific location of the reference source tree Git repository.
+
+config BR2_PACKAGE_OPTEE_BENCHMARK_CUSTOM_REPO_VERSION
+	string "target reference to pull in the Git repository"
+	help
+	  Package version reference to sync with. As source file
+	  reference is a Git repository, the version reference can be
+	  any Git reference as a tag or a sha1.
+
+endif
+
+endif #BR2_PACKAGE_OPTEE_BENCHMARK
diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
new file mode 100644
index 0000000..d93c26c
--- /dev/null
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -0,0 +1,2 @@
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.3.0.tar.gz
+sha256 bfba3749ac8b37628550696f0625452ae8aef060eff5b3b1c4283a5dad8a3383 optee-benchmark-3.3.0.tar.gz
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
