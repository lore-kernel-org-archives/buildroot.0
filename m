From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 21:47:16 +0200
Subject: [Buildroot] [git commit] gdb: install gdbserver into the SDK
Message-ID: <20130411211022.4B2FB9B5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=483fdd6bb73492979f67b6b6bc68e6e2ad3c89fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for a Buildroot toolchain to be usable as an external
toolchain, we should copy the target gdbserver somewhere into
$(HOST_DIR). In order to match what Crosstool-NG does (and therefore
to match something the external toolchain logic already understands),
we install gdbserver in
$(HOST_DIR)/usr/<tuple>/debug-root/usr/bin/gdbserver.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdb/gdb.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 24ce9bf..cec64d5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -78,6 +78,20 @@ endef
 
 GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
 
+# This installs the gdbserver somewhere into the $(HOST_DIR) so that
+# it becomes an integral part of the SDK, if the toolchain generated
+# by Buildroot is later used as an external toolchain. We install it
+# in debug-root/usr/bin/gdbserver so that it matches what Crosstool-NG
+# does.
+define GDB_SDK_INSTALL_GDBSERVER
+	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/gdbserver \
+		$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
+endef
+
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+GDB_POST_INSTALL_TARGET_HOOKS += GDB_SDK_INSTALL_GDBSERVER
+endif
+
 # A few notes:
 #  * --target, because we're doing a cross build rather than a real
 #    host build.
