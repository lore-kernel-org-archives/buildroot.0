From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 12 Apr 2015 15:39:48 +0200
Subject: [Buildroot] [PATCH] package/gdb: force libiberty path
Message-ID: <1428845988-9846-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When shared libraries are enabled, gdb will try to link a shared
libbfd.so against non-PIC libiberty.a found in $(HOST_DIR).
This non-PIC libiberty.a come from the Buildroot's internal toolchain.

But gdb build it's own version with PIC enabled which is linked to
libbfd.so.

Help gdb to find the right libiberty.a by setting the path in LDFLAGS.

Fixes:
http://autobuild.buildroot.net/results/204/2043888410baaf9d22338b48b4caab4a4363f777/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
This is an alternative to the path:
https://patchwork.ozlabs.org/patch/449686/
---
 package/gdb/gdb.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9818320..7b2dcfa 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -124,6 +124,9 @@ endif
 #  * --target, because we're doing a cross build rather than a real
 #    host build.
 #  * --enable-static because gdb really wants to use libbfd.a
+#  * Force libiberty library path to use the one builded internally by
+#    gdb (libiberty/pic), and avoid a conflict with the one builded by
+#    the Buildroot's integral toolchain which is installed in $(HOST_DIR).
 HOST_GDB_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-static \
@@ -134,7 +137,8 @@ HOST_GDB_CONF_OPTS = \
 	--disable-werror \
 	--without-included-gettext \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
-	--disable-sim
+	--disable-sim \
+	LDFLAGS="-L$(@D)/libiberty/pic $(HOST_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
 HOST_GDB_CONF_OPTS += --enable-tui
-- 
1.9.3
