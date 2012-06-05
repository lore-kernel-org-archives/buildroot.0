From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 05 Jun 2012 21:35:24 +0200
Subject: [Buildroot] [PATCH 2 of 2 v5-resend] build: add option to exclude
 executables/dirs from being stripped
In-Reply-To: <patchbomb.1338924922@beantl019720>
References: <patchbomb.1338924922@beantl019720>
Message-ID: <ede6e8b24d6f06f26b68.1338924924@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes it may be desirable to keep debug symbols for some binaries and
libraries on the target. This commit introduces the config option
BR2_STRIP_EXCLUDE_FILES, which is interpreted as a list of such binaries
and libraries, and the option BR2_STRIP_EXCLUDE_DIRS, which indicates
directories excluded from stripping entirely.
These exclusions are passed to the find command in the target-finalize step.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v5: line up with latest git
v4: whitespace changes
v3: merge with redundant patch 'stripping: use findfileclauses utility function'
v2: add the possibility to exclude entire directories

 Config.in |  19 +++++++++++++++++++
 Makefile  |  10 ++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -283,6 +283,25 @@ config BR2_STRIP_none
 	  filesystem.
 endchoice
 
+config BR2_STRIP_EXCLUDE_FILES
+	string "executables that should not be stripped"
+	depends on !BR2_STRIP_none
+	default ""
+	help
+	  You may specify a space-separated list of binaries and libraries
+	  here that should not be stripped on the target.
+
+config BR2_STRIP_EXCLUDE_DIRS
+	string "directories that should be skipped when stripping"
+	depends on !BR2_STRIP_none
+	default ""
+	help
+	  You may specify a space-separated list of directories that should
+	  be skipped when stripping. Binaries and libraries in these
+	  directories will not be touched.
+	  The directories should be specified relative to the target directory,
+	  without leading slash.
+
 choice
 	prompt "gcc optimization level"
 	default BR2_OPTIMIZE_S
diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -386,6 +386,13 @@ endif
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
 
+STRIP_FIND_CMD = find $(TARGET_DIR)
+ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
+STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
+endif
+STRIP_FIND_CMD += -type f -perm +111
+STRIP_FIND_CMD += -not \( $(call findfileclauses,libthread_db*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
+
 target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
@@ -410,8 +417,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
-	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
-		xargs $(STRIPCMD) 2>/dev/null || true
+	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(KSTRIPCMD) || true
 
