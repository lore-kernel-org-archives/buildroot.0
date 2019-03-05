From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Mar 2019 22:05:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: fix build with uclibc
Message-ID: <20190305210546.9200-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...acket-gtp.c-rename-_header-to-_ext_header.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/wireshark/0001-packet-gtp.c-rename-_header-to-_ext_header.patch

diff --git a/package/wireshark/0001-packet-gtp.c-rename-_header-to-_ext_header.patch b/package/wireshark/0001-packet-gtp.c-rename-_header-to-_ext_header.patch
new file mode 100644
index 0000000000..8f4e945cf8
--- /dev/null
+++ b/package/wireshark/0001-packet-gtp.c-rename-_header-to-_ext_header.patch
@@ -0,0 +1,46 @@
+From 76ff5f9ffa1807aa2bf37a565e583e6c18bd3017 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Mar 2019 21:32:17 +0100
+Subject: [PATCH] packet-gtp.c: rename _header to _ext_header
+
+In uclibc, _header is already in sigcontext.h:
+
+packet-gtp.c:2361:16: error: redefinition of 'struct _header'
+ typedef struct _header {
+                ^~~~~~~
+In file included from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/bits/sigcontext.h:30:0,
+                 from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/signal.h:311,
+                 from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
+                 from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:34,
+                 from ../../epan/proto.h:28,
+                 from ../../epan/packet.h:14,
+                 from packet-gtp.c:43:
+/home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/asm/sigcontext.h:173:8: note: originally defined here
+ struct _header {
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2
+
+Change-Id: I78116233c2a8dd7c54723b7cb558254bd5143bd2
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://code.wireshark.org/review/#/c/32335/]
+---
+ epan/dissectors/packet-gtp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-gtp.c b/epan/dissectors/packet-gtp.c
+index 4c40e7aa54..2ff31d6573 100644
+--- a/epan/dissectors/packet-gtp.c
++++ b/epan/dissectors/packet-gtp.c
+@@ -2661,7 +2661,7 @@ id_to_str(tvbuff_t *tvb, gint offset)
+ /* Next definitions and function check_field_presence checks if given field
+  * in GTP packet is compliant with ETSI
+  */
+-typedef struct _header {
++typedef struct _ext_header {
+     guint8 code;
+     guint8 presence;
+ } ext_header;
+-- 
+2.14.1
+
-- 
2.14.1
