From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Jun 2014 23:46:05 +0200
Subject: [Buildroot] [RFCv1 2/4] pkg-generic: add step_pkg_size global
	instrumentation hook
In-Reply-To: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a global instrumentation hook that collects the list
of files installed in $(TARGET_DIR) by each package, and stores this
list into a file called $(BUILD_DIR)/<pkgname>.filelist. It can later
be used to determine the size contribution of each package to the
target root filesystem.

The only limitation is that if a file is installed by a package A, and
then overriden by a file from package B, the file will only be listed
in $(BUILD_DIR)/A.filelist as it is the first time we will see the
file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5116ed9..069653e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -55,6 +55,30 @@ define step_time
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
+# Package size steps
+define step_pkg_size_start
+	echo "PKG SIZE START $(1)"
+	(cd $(TARGET_DIR) ; find . -type f) | sort > \
+		$(BUILD_DIR)/$(1).tmp_filelist_before
+endef
+
+define step_pkg_size_end
+	echo "PKG SIZE END $(1)"
+	(cd $(TARGET_DIR); find . -type f) | sort > \
+		$(BUILD_DIR)/$(1).tmp_filelist_after
+	diff -u $(BUILD_DIR)/$(1).tmp_filelist_before $(BUILD_DIR)/$(1).tmp_filelist_after | \
+		grep '^\+\./' | sed 's%^\+%%' > $(BUILD_DIR)/$(1).filelist
+	$(RM) -f $(BUILD_DIR)/$(1).tmp_filelist_before \
+		$(BUILD_DIR)/$(1).tmp_filelist_after
+endef
+
+define step_pkg_size
+	$(if $(filter install-target,$(2)),\
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
+
 # User-supplied script
 define step_user
 	@$(foreach user_hook, $(BR2_INSTRUMENTATION_SCRIPTS), \
-- 
2.0.0
