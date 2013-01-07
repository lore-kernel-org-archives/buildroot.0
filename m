From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:37:57 +0100
Subject: [Buildroot] [git commit] perf: new package
Message-ID: <20130107212530.E0ADB9A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d82f5cb94a163774eb9e0c689d246e2a7e15ca62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package that allows to build the 'perf'
userspace tool that comes in the tools/perf directory of the kernel
sources.

It is an alternative proposal to the one done by Kaiwan Billimoria
<kaiwan.billimoria@gmail.com>, in that it creates the package in
package/perf/. It therefore properly integrates with the Buildroot
package infrastructure.

Of course, the package depends on the Linux kernel to be built by
Buildroot, in order to get Perf sources matching the version of the
kernel that will be executed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/perf/Config.in |   22 ++++++++++++++++++++++
 package/perf/perf.mk   |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d9255ab..49db380 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
+source "package/perf/Config.in"
 source "package/ramspeed/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
diff --git a/package/perf/Config.in b/package/perf/Config.in
new file mode 100644
index 0000000..54b24fe
--- /dev/null
+++ b/package/perf/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PERF
+	bool "perf"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_LARGEFILE
+	help
+	  perf (sometimes "Perf Events" or perf tools, originally
+	  "Performance Counters for Linux") - is a performance
+	  analyzing tool in Linux, available from kernel version
+	  2.6.31. User-space controlling utility, called 'perf' has
+	  git-like interface with subcommands. It is capable of
+	  statistical profiling of entire system (both kernel and user
+	  code), single CPU or severals threads.
+
+	  This package builds and install the userspace 'perf'
+	  command. It is up to the user to ensure that the kernel
+	  configuration has all suitable options enable to allow a
+	  proper operation of 'perf'.
+
+	  https://perf.wiki.kernel.org/
+
+comment "perf only available if Linux kernel is enabled, and requires largefile support"
+	depends on !BR2_LINUX_KERNEL || !BR2_LARGEFILE
diff --git a/package/perf/perf.mk b/package/perf/perf.mk
new file mode 100644
index 0000000..2aef900
--- /dev/null
+++ b/package/perf/perf.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# perf
+#
+#############################################################
+
+# Source taken from the Linux kernel tree
+PERF_SOURCE =
+PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+
+PERF_DEPENDENCIES = linux
+
+PERF_MAKE_FLAGS = \
+	$(LINUX_MAKE_FLAGS) \
+	NO_LIBELF=1 \
+	NO_DWARF=1 \
+	NO_LIBAUDIT=1 \
+	NO_NEWT=1 \
+	NO_GTK2=1 \
+	NO_LIBPERL=1 \
+	NO_LIBPYTHON=1 \
+	DESTDIR=$(TARGET_DIR) \
+	prefix=/usr \
+	WERROR=0
+
+define PERF_BUILD_CMDS
+	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+		$(PERF_MAKE_FLAGS) O=$(@D)
+endef
+
+# After installation, we remove the Perl and Python scripts from the
+# target.
+define PERF_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+		$(PERF_MAKE_FLAGS) O=$(@D) install
+	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+endef
+
+$(eval $(generic-package))
