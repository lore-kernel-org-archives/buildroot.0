From: Matt Weber <Matthew.Weber@collins.com>
Date: Mon, 26 Nov 2018 22:10:09 -0600
Subject: [Buildroot] [NEXT] infra: add force build flag for host dependencies
Message-ID: <20181127041009.11728-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

This commit adds a config option which will force buildroot to
build all host dependencies even if they are already present on the
host system. This may be a desirable option if different hosts are
used to build the same source. In this case, some packages will be
built on one host that are not built on another. This is problematic
if build source archives are cached afterwards for offline builds.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 Config.in                            | 10 ++++++++++
 support/dependencies/dependencies.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/Config.in b/Config.in
index 6b5b2b043c..0096ef389f 100644
--- a/Config.in
+++ b/Config.in
@@ -678,6 +678,16 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  and external toolchain backends (through the toolchain
 	  wrapper).
 
+config BR2_FORCE_HOST_BUILD
+	bool "Force the building of host dependencies"
+	help
+	  This option forces Buildroot to build all available host
+	  dependencies, even if they are already installed on the
+	  system.
+	  This option can be used to ensure that the download cache of
+	  source archives for packages remain consistent between
+	  different build hosts. This option will increase build time.
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 563574d6ad..a0d857ce6b 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -9,9 +9,15 @@
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
 # script should use 'which' to find a candidate. The script should return
 # the path to the suitable host tool, or nothing if no suitable tool was found.
+ifeq ($(BR2_FORCE_HOST_BUILD),y)
+define suitable-host-package
+$(shell exit 1)
+endef
+else
 define suitable-host-package
 $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
+endif
 # host utilities needs host-tar to extract the source code tarballs, so
 # ensure check-host-tar.mk is included before the rest
 include support/dependencies/check-host-tar.mk
-- 
2.18.0
