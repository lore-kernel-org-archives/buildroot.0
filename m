From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed,  4 Mar 2020 11:53:04 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix special cases of
 symlinks
Message-ID: <20200304105304.986863-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some symlinks were not created correctly when installing the
Linux-firmware package. This patch fixes the support for all symlinks of
the form:

  a/foo -> bar
  a/foo -> b/bar
  a/foo -> ../b/bar

With this patch all forms of symlinks described in the WHENCE file
should be supported, whether they are in nested directories, or in
non-existing ones.

As some symlinks could be in directories that do not exist, we must
make sure those directories are created before testing the presence of
the target firmwares, as we'll end up testing files like:

  a/foo -> ../b/foo : test -f a/../b/foo

where a/ did not exist prior to our symlink creation logic. We then
remove the created directories, if they're empty (that would mean the
target firmware wasn't installed). As we could have nested empty
directories (think of the following link: a/b/c/foo -> ../../../foo), we
need to also remove empty parent directories. To avoid removing more
than we created, we change directory to $(TARGET_DIR)/lib/firmware/
before doing anything.

I compared the symlinks installed pre-20200122 to what we have now, and
it seems we're handling all of them with this patch.

Fixes: 55df4059d24b ("package/linux-firmware: fix symlink support")
Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 009202d604d4..e367d4c5e7b8 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -609,13 +609,24 @@ endif
 # automatically by its copy-firmware.sh script during the installation, which
 # parses the WHENCE file where symlinks are described. We follow the same logic
 # here, adding symlink only for firmwares installed in the target directory.
-# The grep/sed parsing is taken from the script mentioned before.
+#
+# For testing the presence of firmwares in the target directory we first make
+# sure the directories under which the symlinks could be created exist, to
+# handle symlinks of the form a/foo -> ../b/foo where a/ doesn't exist. We then
+# remove any previously created empty directory. As the symlinks could be in
+# nested (empty) directories, we use the --parents option of rmdir; this is why
+# we're changing the current directory to $(TARGET_DIR)/lib/firmware/ before
+# doing anything.
 define LINUX_FIRMWARE_CREATE_SYMLINKS
+	cd $(TARGET_DIR)/lib/firmware/ ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
-		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
-			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f || exit 1; \
+		dir=$$(dirname $$f) ; \
+		mkdir -p $$dir ; \
+		if test -f $$dir/$$d; then \
+			ln -sf $$d $$f || exit 1; \
 		fi ; \
+		test "$$dir" != "." && rmdir --parents --ignore-fail-on-non-empty $$dir ; \
 	done
 endef
 
-- 
2.24.1
