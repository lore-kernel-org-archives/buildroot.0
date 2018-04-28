From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:17:53 +0200
Subject: [Buildroot] [git commit] linux-tools: perf: add option to build TUI
Message-ID: <20180428132001.5FDD288F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94caf400b2c7387bbcaf18bd66bd7ad55d299f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Linux 3.10, perf's NO_NEWT configuration option simply sets
NO_SLANG=1 and there is no dependency on libnewt.

We already handle NO_SLANG correctly based on whether or not
BR2_PACKAGE_SLANG is selected, so all we accomplish by setting NO_NEWT=1
is disabling perf's TUI when all of the dependencies are available.

To simplify all of this, introduce a new config option to enable the
perf TUI which depends on slang and add a check to prevent building the
TUI on versions which are too old.  The check for NO_SLANG is equivalent
to checking if NO_NEWT is required as NO_SLANG was added in the same
commit that removed the libnewt dependency and deprecated NO_NEWT
(6692c262df4f, "perf tools: Remove dependency on libnewt", 2013-03-28).

Signed-off-by: John Keeping <john@metanate.com>
[Thomas: add missing BR2_USE_MMU dependency, coming from the slang
package. Noticed by Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/Config.in             | 13 +++++++++++++
 package/linux-tools/linux-tool-perf.mk.in | 12 +++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 5c5148af17..2527c90257 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -53,6 +53,19 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 
 	  https://perf.wiki.kernel.org/
 
+if BR2_PACKAGE_LINUX_TOOLS_PERF
+
+config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
+	bool "enable perf TUI"
+	depends on BR2_USE_MMU # slang
+	select BR2_PACKAGE_SLANG
+	help
+	  Enable the TUI interface for perf which requires a TTY and
+	  enables zooming into DSOs and threads as well as other
+	  features.
+
+endif
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 69492ba8da..80e00c3c56 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -22,7 +22,6 @@ PERF_MAKE_FLAGS = \
 	prefix=/usr \
 	WERROR=0 \
 	NO_LIBAUDIT=1 \
-	NO_NEWT=1 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
@@ -59,10 +58,10 @@ ifeq ($(BR2_arc),y)
 PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
-ifeq ($(BR2_PACKAGE_SLANG),y)
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_TUI),y)
 PERF_DEPENDENCIES += slang
 else
-PERF_MAKE_FLAGS += NO_SLANG=1
+PERF_MAKE_FLAGS += NO_NEWT=1 NO_SLANG=1
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
@@ -128,6 +127,13 @@ define PERF_BUILD_CMDS
 			fi \
 		fi \
 	fi
+	$(Q)if test "$(BR2_PACKAGE_LINUX_TOOLS_PERF_TUI)" = "y" ; then \
+		if ! grep -q NO_SLANG $(LINUX_DIR)/tools/perf/Makefile* ; then \
+			echo "The perf tool in your kernel cannot be build with the TUI." ; \
+			echo "Either upgrade your kernel to >= 3.10, or disable the TUI." ; \
+			exit 1 ; \
+		fi \
+	fi
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/
 endef
