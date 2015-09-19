From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:59:46 +0200
Subject: [Buildroot] [git commit] target-finalize: remove extra
	/usr/libexec/{*.a, *.la} files
Message-ID: <20150919130115.49B95817E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87f3edecc65975085982515f3618c81bcfd9c023
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages, sudo for instance, install .a and .la files in
$(TARGET_DIR)/usr/libexec. These files are not needed on target.

This patch refactors the existing "find" invocations in
target-finalize into a single one removing all .a and .la files from
lib, usr/lib and usr/libexec.

[Thomas: rework to use a single "find" invocation, and adjusted the
commit log accordingly.]

Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 23e2ee6..fdbca02 100644
--- a/Makefile
+++ b/Makefile
@@ -563,8 +563,8 @@ target-finalize: $(PACKAGES)
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/libexec \
+		\( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
