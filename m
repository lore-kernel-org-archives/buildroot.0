From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 17:22:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/dhcpcd: Fix ipv6-related build error
In-Reply-To: <1429456975-17889-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429456975-17889-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429456975-17889-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/5ff/5ffd15ab4b866e8c0187667ace305202514bdab9/
http://autobuild.buildroot.net/results/a58/a583eea465a7bae8969665c76c695a6b394ce7fd/
http://autobuild.buildroot.net/results/98b/98b5aa1a8fa664e8e977ccb8a49d9906d633c057/
http://autobuild.buildroot.net/results/dc1/dc12251f206672840347c36f5347fcba86e2c874/
http://autobuild.buildroot.net/results/0e1/0e15f71d6992b68df57baa69b034b4001aca7a21/
http://autobuild.buildroot.net/results/e00/e0093101ae636a693744c040710e68a90d1e6aa1/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dhcpcd/0001-gnu_source.patch |   35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/dhcpcd/0001-gnu_source.patch

diff --git a/package/dhcpcd/0001-gnu_source.patch b/package/dhcpcd/0001-gnu_source.patch
new file mode 100644
index 0000000..2c6f4ee
--- /dev/null
+++ b/package/dhcpcd/0001-gnu_source.patch
@@ -0,0 +1,35 @@
+Fix ipv6-related build error
+
+/home/br/br2/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -std=c99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_DEFAULT_SOURCE -DINET -DINET6 -I./crypt -c dhcpcd.c -o dhcpcd.o
+In file included from /home/br/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:40:0,
+                 from dhcpcd.c:33:
+ipv6.h:213:41: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
+  unsigned char sndbuf[CMSG_SPACE(sizeof(struct in6_pktinfo))];
+                                         ^
+ipv6.h:197:38: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
+ #define IP6BUFLEN (CMSG_SPACE(sizeof(struct in6_pktinfo)) + \
+                                      ^
+ipv6.h:216:23: note: in expansion of macro 'IP6BUFLEN'
+  unsigned char rcvbuf[IP6BUFLEN];
+                       ^
+dhcpcd.c: In function 'write_pid':
+dhcpcd.c:108:2: warning: implicit declaration of function 'dprintf' [-Wimplicit-function-declaration]
+  return dprintf(fd, "%d\n", (int)pid);
+  ^
+make: *** [dhcpcd.o] Error 1
+make: Leaving directory `/home/br/br2/output/build/dhcpcd-6.8.1'
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr dhcpcd-6.8.1.org/configure dhcpcd-6.8.1/configure
+--- dhcpcd-6.8.1.org/configure	2015-03-27 12:17:28.000000000 +0100
++++ dhcpcd-6.8.1/configure	2015-04-19 17:16:49.256616146 +0200
+@@ -365,7 +365,7 @@
+ 	echo "DHCPCD_SRCS+=	if-bsd.c" >>$CONFIG_MK
+ 	;;
+ linux*)
+-	echo "CPPFLAGS+=	-D_BSD_SOURCE -D_XOPEN_SOURCE=700" >>$CONFIG_MK
++	echo "CPPFLAGS+=	-D_GNU_SOURCE -D_XOPEN_SOURCE=700" >>$CONFIG_MK
+ 	# Large File Support, should be fine for 32-bit systems.
+ 	# But if this is the case, why is it not set by default?
+ 	echo "CPPFLAGS+=	-D_FILE_OFFSET_BITS=64" >>$CONFIG_MK
-- 
1.7.10.4
