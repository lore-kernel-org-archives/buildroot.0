From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:21:53 +0100
Subject: [Buildroot] [git commit] Makefile: fix ignored trace at
	target-finalize
Message-ID: <20161201222139.7460F81DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b7013c4ae3c4b183303204710a4bb3d717a4558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make may throw an error (but ignored) trace when cleaning up the
rootfs.

The target-finalize rule intends to remove the folder
`$(TARGET_DIR)/usr/share' but this directory may still contain items
(such as the `udhcpc' helper script) and causes the rmdir to fail.

The stderr output is redirected to /dev/null but it returns and error
which is escaped by the leading `-'; but make reports an ignored-error.

See the log below:
$ make
(...)
rm -rf (...)/target/usr/share/gtk-doc
rmdir (...)/target/usr/share
rmdir: failed to remove '(...)/target/usr/share': Directory not empty
make[1]: [Makefile:650: target-finalize] Error 1 (ignored)
find /(...)/target -type f \( -perm /111 -o -name '*.so*' \) -not \( -name 'libpthread*.so*' -o -name 'ld-*.so*' -o -name '*.ko' \) -print0 | xargs -0 (...)/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip --remove-section=.comment --remove-section=.note 2>/dev/null || true

This patch apply the same rule at the instruction immediately after:
* redirecting stderr to /dev/null (already done) and
* executing true if the `rmdir' instruction fails.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7c582e5..4f6269f 100644
--- a/Makefile
+++ b/Makefile
@@ -668,7 +668,7 @@ endif
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
-	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
+	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
 
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
