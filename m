From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:26 -0000
Subject: [Buildroot] [git commit branch/next] toolchain: reinstate
	host/usr/bin/$arch-linux-* symlinks for gcc/gdb binaries
Message-ID: <20120802195242.7D3F48E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f487ef72845965b578002b2f9c0a37eff47e97a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As people might be using them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 toolchain/gdb/gdb.mk            |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 57f4f8a..e29d797 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -482,6 +482,10 @@ endif
 	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
 		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
 	fi
+	# arch-linux-* symlinks
+	cd $(HOST_DIR)/usr/bin; for i in $(GNU_TARGET_NAME)-*; do \
+		ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
+	done
 
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 5673cf1..f5af454 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -203,6 +203,7 @@ $(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
 
 $(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
 	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
+	ln -snf $(@F) $(HOST_DIR)/usr/bin/$(ARCH)-linux-gdb
 
 gdbhost: host-expat $(TARGET_CROSS)gdb
 
