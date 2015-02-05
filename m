From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Feb 2015 22:19:57 +0100
Subject: [Buildroot] [PATCHv3 2/5] pkg-generic: add step_pkg_size global
	instrumentation hook
In-Reply-To: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1423171200-24583-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a global instrumentation hook that collects the list
of files installed in $(TARGET_DIR) by each package, and stores this
list into a file called $(BUILD_DIR)/packages-file-list.txt. It can
later be used to determine the size contribution of each package to
the target root filesystem.

Note that in order to detect if a file installed by one package is
later overriden by another package, we calculate the md5 of installed
files and compare them at each installation of a new package.

This commit also adds a Config.in option to enable the collection of
this data, as calculating the md5 of all installed files at the
beginning and end of the installation of each package can be
considered a time-consuming process which maybe some users will not be
willing to suffer from.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in              |  9 +++++++++
 package/pkg-generic.mk | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/Config.in b/Config.in
index f5b6c73..58a5085 100644
--- a/Config.in
+++ b/Config.in
@@ -613,6 +613,15 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  toolchain (through gcc and binutils patches) and external
 	  toolchain backends (through the external toolchain wrapper).
 
+config BR2_COLLECT_FILE_SIZE_STATS
+	bool "collect statistics about installed file size"
+	help
+	  Enable this option to let Buildroot collect data about the
+	  installed files. When this option is enabled, you will be
+	  able to use the 'size-stats' make target, which will
+	  generate a graph and CSV files giving statistics about the
+	  installed size of each file and each package.
+
 endmenu
 
 endmenu
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b09955..db35a87 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -55,6 +55,42 @@ define step_time
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
+# Hooks to collect statistics about installed files
+ifeq ($(BR2_COLLECT_FILE_SIZE_STATS),y)
+
+# This hook will be called before the target installation of a
+# package. We store in a file named $(1).filelist_before the list of
+# files currently installed in the target. Note that the MD5 is also
+# stored, in order to identify if the files are overwritten.
+define step_pkg_size_start
+	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
+		$(BUILD_DIR)/$(1).filelist_before
+endef
+
+# This hook will be called after the target installation of a
+# package. We store in a file named $(1).filelist_after the list
+# of files (and their MD5) currently installed in the target. We then
+# do a diff with the $(1).filelist_before to compute the list of
+# files installed by this package.
+define step_pkg_size_end
+	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
+		$(BUILD_DIR)/$(1).filelist_after
+	comm -13 $(BUILD_DIR)/$(1).filelist_before $(BUILD_DIR)/$(1).filelist_after | \
+		while read hash file ; do \
+			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
+		done
+	$(RM) -f $(BUILD_DIR)/$(1).filelist_before \
+		$(BUILD_DIR)/$(1).filelist_after
+endef
+
+define step_pkg_size
+	$(if $(filter install-target,$(2)),\
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
+endif
+
 # User-supplied script
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 define step_user
-- 
2.1.0
