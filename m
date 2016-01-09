From: Doug Kehn <rdkehn@yahoo.com>
Date: Sat,  9 Jan 2016 15:59:45 -0600
Subject: [Buildroot] [RFC PATCH 3/3] package/dhcp: ensure host cc is used
	for compiling gen
In-Reply-To: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
References: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1452376785-31174-4-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is derived from:
http://wiki.beyondlogic.org/patches/dhcp-4.3.0b1.bind_arm-linux-gnueabi.patch

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/dhcp/0002-dhcp-bind-host-gen.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/dhcp/0002-dhcp-bind-host-gen.patch

diff --git a/package/dhcp/0002-dhcp-bind-host-gen.patch b/package/dhcp/0002-dhcp-bind-host-gen.patch
new file mode 100644
index 0000000..0a33693
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
+Index: dhcp-4.3.3/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
+===================================================================
+--- dhcp-4.3.3.orig/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
++++ dhcp-4.3.3/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
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
2.6.4
