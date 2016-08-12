From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Fri, 12 Aug 2016 23:45:02 +0530
Subject: [Buildroot] [PATCH 2/2] wayland: fix musl build issue
In-Reply-To: <1471025702-6945-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471025702-6945-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1471025702-6945-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With musl C library, we see following build failure.

  src/scanner.c: In function 'find_enumeration':
  src/scanner.c:811:2: error: unknown type name 'uint'
    uint idx = 0, j;
    ^

uint is defined in <sys/types.h> header. It is usually included by <stdlib.h>
but in musl stdlib.h doesn't include it.

In scanner.c, <expat.h> includes <stdlib.h> then it includes <sys/types.h> in
case of other C libraries. <sys/types.h> from musl defines uint only if
_GNU_SOURCE or _BSD_SOURCE is defined. Instead of including <sys/types.h> and
defining either _GNU_SOURCE or _BSD_SOURCE, use unsigned int instead of uint.

Fixes:

  http://autobuild.buildroot.net/results/fcf/fcf6dd3bd31f92eadbcae17338e5887a23e43ff9/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../0002-use-unsigned-int-instead-of-uint.patch    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/wayland/0002-use-unsigned-int-instead-of-uint.patch

diff --git a/package/wayland/0002-use-unsigned-int-instead-of-uint.patch b/package/wayland/0002-use-unsigned-int-instead-of-uint.patch
new file mode 100644
index 0000000..0f649e2
--- /dev/null
+++ b/package/wayland/0002-use-unsigned-int-instead-of-uint.patch
@@ -0,0 +1,33 @@
+scanner: use unsigned int instead of uint
+
+With musl C library, we see following build failure.
+
+src/scanner.c: In function 'find_enumeration':
+src/scanner.c:811:2: error: unknown type name 'uint'
+  uint idx = 0, j;
+  ^
+
+uint is defined in <sys/types.h> header. It is usually included by <stdlib.h>
+but in musl stdlib.h doesn't include it.
+
+In scanner.c, <expat.h> includes <stdlib.h> then it includes <sys/types.h> in
+case of other C libraries. <sys/types.h> from musl defines uint only if
+_GNU_SOURCE or _BSD_SOURCE is defined. Instead of including <sys/types.h> and
+defining either _GNU_SOURCE or _BSD_SOURCE, use unsigned int instead of uint.
+
+This build issue is found by Buildroot autobuilder
+http://autobuild.buildroot.net/results/fcf/fcf6dd3bd31f92eadbcae17338e5887a23e43ff9/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+
+--- wayland-1.11.0/src/scanner.c.old	2016-08-12 23:19:39.944279494 +0530
++++ wayland-1.11.0/src/scanner.c	2016-08-12 23:19:57.236279457 +0530
+@@ -808,7 +808,7 @@ find_enumeration(struct protocol *protoc
+ 	struct interface *i;
+ 	struct enumeration *e;
+ 	char *enum_name;
+-	uint idx = 0, j;
++	unsigned int idx = 0, j;
+ 
+ 	for (j = 0; j + 1 < strlen(enum_attribute); j++) {
+ 		if (enum_attribute[j] == '.') {
-- 
2.6.2
