From: Doug Kehn <rdkehn@yahoo.com>
Date: Mon, 18 Jan 2016 09:42:20 -0600
Subject: [Buildroot] [PATCH v3 3/4] package/dhcp: ensure host cc is used for
	compiling gen
In-Reply-To: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1453131741-1613-4-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch has been submitted upstream.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
Changes v2 -> v3
  - removed RFC tag
Changes v1 -> v2
  - no changes
---
 package/dhcp/0002-dhcp-bind-host-gen.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/dhcp/0002-dhcp-bind-host-gen.patch

diff --git a/package/dhcp/0002-dhcp-bind-host-gen.patch b/package/dhcp/0002-dhcp-bind-host-gen.patch
new file mode 100644
index 0000000..9db8a06
--- /dev/null
+++ b/package/dhcp/0002-dhcp-bind-host-gen.patch
@@ -0,0 +1,22 @@
+ensure host cc is used for compiling gen
+
+This patch is derived from:
+http://wiki.beyondlogic.org/patches/dhcp-4.3.0b1.bind_arm-linux-gnueabi.patch
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: dhcp-4.3.3-P1/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
++++ dhcp-4.3.3-P1/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
+@@ -168,7 +168,9 @@ code.h:	gen
+ 	./gen -s ${srcdir} > code.h
+ 
+ gen: ${srcdir}/gen.c
+-	${CC} ${ALL_CFLAGS} ${LDFLAGS} -o $@ ${srcdir}/gen.c ${LIBS}
++	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
++		${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
++		${BUILD_LIBS}
+ 
+ #We don't need rbtdb64 for this library
+ #rbtdb64. at O@: rbtdb.c
-- 
2.7.0
