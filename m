From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2015 23:04:29 +0200
Subject: [Buildroot] [PATCH] package/libwebsock: fix incorrect inline
	function
Message-ID: <1440277469-15130-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/c02/c0243afc26202cbea98a1a75ddb9e37d8e2e08de/
    http://autobuild.buildroot.org/results/8a0/8a0f34da29fdfb2807aaa7280759e324a3874851/
    http://autobuild.buildroot.org/results/3da/3dac7b3504349e06c05fa0170a033e7828a9ab55/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libwebsock/0003-fix-incorrect-inline.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/libwebsock/0003-fix-incorrect-inline.patch

diff --git a/package/libwebsock/0003-fix-incorrect-inline.patch b/package/libwebsock/0003-fix-incorrect-inline.patch
new file mode 100644
index 0000000..043df45
--- /dev/null
+++ b/package/libwebsock/0003-fix-incorrect-inline.patch
@@ -0,0 +1,66 @@
+utf: do not define decode() to be inline
+
+Currently, decode() is prototyped in utf.h, its body is in utf.c and it
+is called from util.c.
+
+However, decode() is defined to be inline, which can not work since,
+when compiling util.c, the body of decode() is out-of-scope for that
+compilation unit.
+
+Furthermore, decode() uses a utf8d, which is a static defined in utf.c .
+So utf8d is not visible when compiling util.c either.
+
+This means that the definition of decode() along with utf8d is basically
+wrong, and is now failing with gcc-5.x, with warnings like so:
+
+    libtool: compile:  /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wmissing-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c utf.c  -fPIC -DPIC -o .libs/libwebsock_la-utf.o
+    utf.c:36:12: warning: ?utf8d? is static but used in inline function ?decode? which is not static
+       *state = utf8d[256 + *state*16 + type];
+                ^
+    utf.c:30:19: warning: ?utf8d? is static but used in inline function ?decode? which is not static
+       uint32_t type = utf8d[byte];
+                       ^
+    libtool: compile:  /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wmissing-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c util.c  -fPIC -DPIC -o .libs/libwebsock_la-util.o
+    In file included from websock.h:73:0,
+                     from util.c:20:
+    utf.h:25:17: warning: inline function ?decode? declared but never defined
+     uint32_t inline decode(uint32_t *state, uint32_t *codep, uint32_t byte);
+                     ^
+
+This results in decode() to be omitted from libwebsock.so, and thus link
+failures when another program wants to link with -lwebsock.
+
+The simplest solution is to not inline decode() at all.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Note: an alternative would be to move both decode() and utf8d into
+decode.h nad ditch decode.c if decode really must be inline. This is
+left as an execise for an interested party. But since upstream hasn't
+seen a single commit in more than a year now... :-(
+
+diff -durN a/src/utf.c b/src/utf.c
+--- a/src/utf.c	2014-07-15 01:43:20.000000000 +0200
++++ b/src/utf.c	2015-08-22 22:29:38.667393786 +0200
+@@ -24,7 +24,7 @@
+   1,3,1,1,1,1,1,3,1,3,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1, // s7..s8
+ };
+ 
+-uint32_t inline
++uint32_t
+ decode(uint32_t* state, uint32_t* codep, uint32_t byte)
+ {
+   uint32_t type = utf8d[byte];
+diff -durN a/src/utf.h b/src/utf.h
+--- a/src/utf.h	2014-07-15 01:43:20.000000000 +0200
++++ b/src/utf.h	2015-08-22 22:29:10.439227396 +0200
+@@ -22,7 +22,7 @@
+ 
+ #include <stdint.h>
+ 
+-uint32_t inline decode(uint32_t *state, uint32_t *codep, uint32_t byte);
++uint32_t decode(uint32_t *state, uint32_t *codep, uint32_t byte);
+ 
+ 
+ #endif /* UTF_H_ */
-- 
1.9.1
