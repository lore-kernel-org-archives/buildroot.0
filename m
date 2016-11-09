From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:14:17 +0100
Subject: [Buildroot] [git commit] Makefile: fix stripping of ld.so and
	libpthread for merged /usr
Message-ID: <20161109221554.0BA9180767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=179c5f1b87a46ac272d66a947fddbf7c0fdeb442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If 'lib' is a symlink (as is the case when BR2_ROOTFS_MERGED_USR=y),
'find lib' does not return the correct result. So, until now,
libpthread*.so* and ld-*.so* were not stripped when 'lib' was a symlink.

We fix this by using 'find lib/' instead of 'find lib'. For consistency
reason, we also do the same change for the 'find' that removes .a and
.la files.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
[Thomas: slightly improved the commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4ea64b3..925e9c6 100644
--- a/Makefile
+++ b/Makefile
@@ -641,7 +641,7 @@ target-finalize: $(PACKAGES)
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/libexec \
+	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
 		\( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
@@ -663,13 +663,13 @@ endif
 # besides the one in which crash occurred; or SIGTRAP kills my program when
 # I set a breakpoint"
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	find $(TARGET_DIR)/lib -type f -name 'libpthread*.so*' | \
+	find $(TARGET_DIR)/lib/ -type f -name 'libpthread*.so*' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 endif
 
 # Valgrind needs ld.so with enough information, so only strip
 # debugging symbols.
-	find $(TARGET_DIR)/lib -type f -name 'ld-*.so*' | \
+	find $(TARGET_DIR)/lib/ -type f -name 'ld-*.so*' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 	test -f $(TARGET_DIR)/etc/ld.so.conf && \
 		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
