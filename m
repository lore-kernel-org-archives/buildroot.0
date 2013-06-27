From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 13:55:27 +0200
Subject: [Buildroot] [git commit] package: add tinymembench
Message-ID: <20130627115740.77BD69AD50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e0676c4848c03c7a25a99699d1c0390387d9d1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/tinymembench/Config.in       |   11 +++++++++++
 package/tinymembench/tinymembench.mk |   22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0eb6a9c..81b26be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -44,6 +44,7 @@ source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
 source "package/stress/Config.in"
 source "package/sysprof/Config.in"
+source "package/tinymembench/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 source "package/pv/Config.in"
diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
new file mode 100644
index 0000000..0d45532
--- /dev/null
+++ b/package/tinymembench/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TINYMEMBENCH
+	bool "tinymembench"
+	help
+	  Tinymembench is a simple memory benchmark program, which
+	  tries to measure the peak bandwidth of sequential memory
+	  accesses and the latency of random memory accesses.
+	  Bandwidth is measured by running different assembly code for
+	  the aligned memory blocks and attempting different prefetch
+	  strategies.
+
+	  https://github.com/ssvb/tinymembench
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
new file mode 100644
index 0000000..285d1fd
--- /dev/null
+++ b/package/tinymembench/tinymembench.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tinymembench
+#
+################################################################################
+
+TINYMEMBENCH_VERSION = v0.2
+TINYMEMBENCH_SITE = http://github.com/ssvb/tinymembench/tarball/$(TINYMEMBENCH_VERSION)
+TINYMEMBENCH_LICENSE = MIT
+TINYMEMBENCH_LICENSE_FILES = main.c
+
+define TINYMEMBENCH_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define TINYMEMBENCH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/tinymembench \
+		$(TARGET_DIR)/usr/bin/tinymembench
+endef
+
+$(eval $(generic-package))
+
