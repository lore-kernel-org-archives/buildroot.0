From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 23:01:11 +0100
Subject: [Buildroot] [git commit branch/next] package/optee-benchmark: new
 package
Message-ID: <20190217215934.9B63581499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fc4790e672f7455c24767791db48584fde88eed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

OP-TEE performance benchmark tools for the OP-TEE project.

This packages generates embedded Linux based OS materials used
to retrieve execution timing information on invocation of the
OP-TEE secure services.

It is added next to the OP-TEE client package in BR configuration.

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.4.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas:
 - drop version selection
 - propagate the dependency of optee-client]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/optee-benchmark/Config.in            | 15 +++++++++++++++
 package/optee-benchmark/optee-benchmark.hash |  2 ++
 package/optee-benchmark/optee-benchmark.mk   | 13 +++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ea307ddcbb..44de17aba1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -689,6 +689,7 @@ F:	package/szip/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
+F:	package/optee-benchmark/
 F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
diff --git a/package/Config.in b/package/Config.in
index cb81180faa..420e6e95a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
new file mode 100644
index 0000000000..0e36549c94
--- /dev/null
+++ b/package/optee-benchmark/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_OPTEE_BENCHMARK
+	bool "optee-benchmark"
+	depends on !BR2_STATIC_LIBS # optee-client
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
+comment "optee-benchmark needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
new file mode 100644
index 0000000000..c3c41b69da
--- /dev/null
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -0,0 +1,2 @@
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.4.0.tar.gz
+sha256 e5e868a06a9dcc8cc444b3e72c65f57670b0811091be62edbe0d03d13c75e716 optee-benchmark-3.4.0.tar.gz
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
new file mode 100644
index 0000000000..4ebab4498e
--- /dev/null
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# optee-benchmark
+#
+################################################################################
+
+OPTEE_BENCHMARK_VERSION = 3.4.0
+OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
+OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
+
+OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
+
+$(eval $(cmake-package))
