From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 18 Oct 2016 23:33:07 +0530
Subject: [Buildroot] [PATCH] libglib2: fix static linking with libgio
Message-ID: <1476813787-9672-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When statically linking with libgio, application needs to link with all
internal libraries that libgio uses. This commit adds patch which
includes libmount as Libs.private.

Fixes:
  http://autobuild.buildroot.net/results/fdf/fdf26abbed0014606a7788ce5d60828a0e871186
  http://autobuild.buildroot.net/results/1d6/1d69b8ea34cf57255be54de0c87fc83590fb1337

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 ...o-2.0.pc-include-libmount-in-Libs.private.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch

diff --git a/package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch b/package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch
new file mode 100644
index 0000000..364e179
--- /dev/null
+++ b/package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch
@@ -0,0 +1,32 @@
+From ee32416dec8462ee27c3c254100cf980b0889ce0 Mon Sep 17 00:00:00 2001
+From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Date: Tue, 18 Oct 2016 23:04:50 +0530
+Subject: [PATCH] gio-2.0.pc: include libmount in Libs.private
+
+This helps with static linking. When application statically links with
+libgio, it needs to link against libmount explicitly. When it is
+mentioned in Libs.private, build system can figure out with which extra
+libs to link against with help of pkg-config.
+
+This build failure is detected by Buildroot autobuilder:
+http://autobuild.buildroot.net/results/fdf/fdf26abbed0014606a7788ce5d60828a0e871186
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ gio-2.0.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio-2.0.pc.in b/gio-2.0.pc.in
+index 899af0c..7574eb7 100644
+--- a/gio-2.0.pc.in
++++ b/gio-2.0.pc.in
+@@ -14,5 +14,5 @@ Version: @VERSION@
+ Requires: glib-2.0 gobject-2.0
+ Requires.private: gmodule-no-export-2.0
+ Libs: -L${libdir} -lgio-2.0
+-Libs.private: @ZLIB_LIBS@ @NETWORK_LIBS@ @SELINUX_LIBS@ @COCOA_LIBS@ @CARBON_LIBS@
++Libs.private: @ZLIB_LIBS@ @NETWORK_LIBS@ @SELINUX_LIBS@ @COCOA_LIBS@ @CARBON_LIBS@ @LIBMOUNT_LIBS@
+ Cflags:
+-- 
+2.6.2
+
-- 
2.6.2
