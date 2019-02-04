From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 15:52:44 +0100
Subject: [Buildroot] [git commit] infra: add force build flag for host
 dependencies
Message-ID: <20190204145126.ED66483722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f1b965bc36c64f83c962e373f7b5fe1245e3355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a config option which will force buildroot to
build all host dependencies even if they are already present on the
host system. This may be a desirable option if different hosts are
used to build the same source. In this case, some packages will be
built on one host that are not built on another. This is problematic
if build source archives are cached afterwards for offline builds.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Peter: reword, drop exit 1, reshuffle]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            | 12 ++++++++++++
 support/dependencies/dependencies.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/Config.in b/Config.in
index f965e9d6d8..d58d8dc04a 100644
--- a/Config.in
+++ b/Config.in
@@ -677,6 +677,18 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  and external toolchain backends (through the toolchain
 	  wrapper).
 
+config BR2_FORCE_HOST_BUILD
+	bool "Force the building of host dependencies"
+	help
+	  Build all available host dependencies, even if they are
+	  already installed on the system.
+
+	  This option can be used to ensure that the download cache of
+	  source archives for packages remain consistent between
+	  different build hosts.
+
+	  This option will increase build time.
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 563574d6ad..4fac5c731b 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -5,6 +5,11 @@
 #
 ################################################################################
 
+ifeq ($(BR2_FORCE_HOST_BUILD),y)
+# ignore all available host packages
+define suitable-host-package
+endef
+else
 # suitable-host-pkg: calls check-host-$(1).sh shell script. Parameter (2)
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
 # script should use 'which' to find a candidate. The script should return
@@ -12,6 +17,7 @@
 define suitable-host-package
 $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
+endif
 # host utilities needs host-tar to extract the source code tarballs, so
 # ensure check-host-tar.mk is included before the rest
 include support/dependencies/check-host-tar.mk
