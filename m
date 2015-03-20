From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:46:02 +0100
Subject: [Buildroot] [git commit] target-finalize: Use NULL deliminators
	when stripping the target directory.
Message-ID: <20150320215042.3F36181883@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26f215d13756b0356c2aaa6d6bfc71ae99d6c1e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Special characters in files or directories in the rootfs can cause
problems when stripping files.  For example "target/some song.mp3"
gets treated as two entries. "target/some" and "song.mp3" are both
passed to $(STRIPCMD). This then errors saying files don't exist.

Additionally a ' and possibly other special characters in a file path
causes xargs to give the error: "xargs: unmatched single quote; by
default quotes are special to xargs unless you use the -0
option". This also has the effect of removing this entry and further
entries from the list of files to strip.  This can be demonstrated by
having a test directory with the files: "cat" "rabbit's"
"elephant". then running the command: "find -name "*" -print | xargs"

To fix this we pass -print0 to find which seperates entries with a
NULL character, and we pass -0 to xargs to tell it to only use NULL
characters as the deliminator.

Signed-off-by: Andrew Parlane <andrewp@carallon.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index af043a3..33a89b1 100644
--- a/Makefile
+++ b/Makefile
@@ -500,7 +500,7 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 #   applications and libraries. Normally kernel modules are already excluded
 #   by the executable permission check above, so the explicit exclusion is only
 #   done for kernel modules with incorrect permissions.
-STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
+STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
 
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
 define TOOLCHAIN_ECLIPSE_REGISTER
@@ -579,7 +579,7 @@ endif
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
-	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
+	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(KSTRIPCMD); fi
