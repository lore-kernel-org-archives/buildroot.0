From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 12 Mar 2015 23:13:53 +0100
Subject: [Buildroot] [PATCH] package/gdb: disable shared build for host-gdb
Message-ID: <1426198433-26427-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shared libraries build have been enabled with the
ARV32 removal. But it's still useful for arc gdb.

Fixes:
http://autobuild.buildroot.net/results/204/2043888410baaf9d22338b48b4caab4a4363f777/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
"Should fixe" the issue.
I'm not able to reproduce the issue.
---
 package/gdb/gdb.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6a192fb..2a6b3d4 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -125,9 +125,12 @@ endif
 #  * --target, because we're doing a cross build rather than a real
 #    host build.
 #  * --enable-static because gdb really wants to use libbfd.a
+#  * --disable-shared, otherwise the gdb-2014.12 version specific to ARC
+#    doesn't build because it wants to link a shared libbfd.so against
+#    non-PIC liberty.a.
 HOST_GDB_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
-	--enable-static \
+	--enable-static --disable-shared \
 	--without-uiout \
 	--disable-gdbtk \
 	--without-x \
-- 
1.9.3
