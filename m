From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 23:16:45 +0100
Subject: [Buildroot] [git commit] package/wireshark: fix build with uclibc
Message-ID: <20190307221415.A41B68E99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e68fdaf4146000c5bf331171c719e353e3385aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...et-gtp-c-remove-unneeded-named-structures.patch | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/package/wireshark/0001-packet-gtp-c-remove-unneeded-named-structures.patch b/package/wireshark/0001-packet-gtp-c-remove-unneeded-named-structures.patch
new file mode 100644
index 0000000000..0a894a282e
--- /dev/null
+++ b/package/wireshark/0001-packet-gtp-c-remove-unneeded-named-structures.patch
@@ -0,0 +1,75 @@
+From 020e25b660250c97c8085e64cf85074ccfcdd06b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Mar 2019 20:59:49 +0100
+Subject: [PATCH] packet-gtp.c: remove unneeded named structures
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
+To fix this issue, transform _header and other named structures (with
+the exception of gtp_conv_info_t) into unnamed structures
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2
+
+Change-Id: I78116233c2a8dd7c54723b7cb558254bd5143bd2
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-on: https://code.wireshark.org/review/32335
+Petri-Dish: Guy Harris <guy@alum.mit.edu>
+Tested-by: Petri Dish Buildbot
+Reviewed-by: Guy Harris <guy@alum.mit.edu>
+[Retrieved from:
+https://github.com/wireshark/wireshark/commit/020e25b660250c97c8085e64cf85074ccfcdd06b]
+---
+ epan/dissectors/packet-gtp.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/epan/dissectors/packet-gtp.c b/epan/dissectors/packet-gtp.c
+index 4c40e7aa54..971197e4ae 100644
+--- a/epan/dissectors/packet-gtp.c
++++ b/epan/dissectors/packet-gtp.c
+@@ -2170,7 +2170,7 @@ GHashTable* session_table;
+ /* Relation between <teid,ip> -> frame */
+ wmem_tree_t* frame_tree;
+ 
+-typedef struct gtp_info {
++typedef struct {
+     guint32 teid;
+     guint32 frame;
+ } gtp_info_t;
+@@ -2482,7 +2482,7 @@ static int decode_gtp_node_addr(tvbuff_t * tvb, int offset, packet_info * pinfo,
+ static int decode_gtp_priv_ext(tvbuff_t * tvb, int offset, packet_info * pinfo, proto_tree * tree, session_args_t * args _U_);
+ static int decode_gtp_unknown(tvbuff_t * tvb, int offset, packet_info * pinfo, proto_tree * tree, session_args_t * args _U_);
+ 
+-typedef struct _gtp_opt {
++typedef struct {
+     int optcode;
+     int (*decode) (tvbuff_t *, int, packet_info *, proto_tree *, session_args_t *);
+ } gtp_opt_t;
+@@ -2661,12 +2661,12 @@ id_to_str(tvbuff_t *tvb, gint offset)
+ /* Next definitions and function check_field_presence checks if given field
+  * in GTP packet is compliant with ETSI
+  */
+-typedef struct _header {
++typedef struct {
+     guint8 code;
+     guint8 presence;
+ } ext_header;
+ 
+-typedef struct _message {
++typedef struct {
+     guint8 code;
+     ext_header fields[32];
+ } _gtp_mess_items;
