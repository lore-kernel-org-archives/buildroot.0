From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 23:34:25 +0200
Subject: [Buildroot] [git commit branch/2013.08.x] Makefile: make
	$(BUILD_DIR)/.root rule idempotent
Message-ID: <20130915213410.84CF79B76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63344acefaa31b713a1811e5b0ba66217bd596d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2013.08.x

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e2454a7..819a597 100644
--- a/Makefile
+++ b/Makefile
@@ -451,9 +451,9 @@ $(BUILD_DIR)/.root:
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
