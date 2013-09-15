From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 21:28:45 +0200
Subject: [Buildroot] [PATCHv2] Makefile: make $(BUILD_DIR)/.root rule
	idempotent
Message-ID: <1379273325-5933-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The $(BUILD_DIR)/.root rule is executed as part of the 'dirs'
target. The 'dirs' target is re-executed at every execution of 'make
external-deps', and make external-deps explicitly tells make to ignore
targets that have already been made (through the -B option). This
means that the $(BUILD_DIR)/.root rule has to be idempotant, which was
not the case this the introduction of the lib32/lib64 symbolic link.

Running 'make external-deps' three times in a row was sufficient to
trigger an error due to symbolic links being incorrectly created. This
patch fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This should probably be taken for 2013.08.1 as a fix of 'make
external-deps'.

Changes since v1:

 * Posted separately from the toolchain source patch set
 * Use ln -snf instead of if tests.
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8610592..2163e95 100644
--- a/Makefile
+++ b/Makefile
@@ -448,9 +448,9 @@ $(BUILD_DIR)/.root:
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
-	@ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK)
+	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
 	@mkdir -p $(TARGET_DIR)/usr
-	@ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
 	touch $@
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
-- 
1.8.1.2
