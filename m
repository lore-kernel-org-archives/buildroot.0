From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Jan 2015 17:39:04 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: fix build on old toolchains
	(sa_family_t)
Message-ID: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes error such as:
  .../sysroot/usr/include/linux/netlink.h:31:2: error: unknown type name 'sa_family_t'
  .../sysroot/usr/include/linux/netlink.h:31:2: error: expected specifier-qualifier-list before 'sa_family_t'

And autobuild failures:
  http://autobuild.buildroot.net/results/d92/d92e7f2af0e64bc40f7b5c9ea081471de98bf8e8/
  http://autobuild.buildroot.net/results/e97/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
  http://autobuild.buildroot.net/results/ca3/ca32c4de8b645c96cedb80b6270a792e9601ad84/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ix-missing-sa_familiy_t-on-old-toolchains.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/dhcpcd/0001-Fix-missing-sa_familiy_t-on-old-toolchains.patch

diff --git a/package/dhcpcd/0001-Fix-missing-sa_familiy_t-on-old-toolchains.patch b/package/dhcpcd/0001-Fix-missing-sa_familiy_t-on-old-toolchains.patch
new file mode 100644
index 0000000..f518711
--- /dev/null
+++ b/package/dhcpcd/0001-Fix-missing-sa_familiy_t-on-old-toolchains.patch
@@ -0,0 +1,35 @@
+From da2b6a5180a9620e1011f52143512b69cd518bad Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Tue, 30 Dec 2014 16:08:05 +0100
+Subject: [PATCH] Fix missing sa_familiy_t on old toolchains
+
+Fixes error such as:
+  .../sysroot/usr/include/linux/netlink.h:31:2: error: unknown type name 'sa_family_t'
+  .../sysroot/usr/include/linux/netlink.h:31:2: error: expected specifier-qualifier-list before 'sa_family_t'
+
+And autobuild failures:
+  http://autobuild.buildroot.net/results/d92/d92e7f2af0e64bc40f7b5c9ea081471de98bf8e8/
+  http://autobuild.buildroot.net/results/e97/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
+  http://autobuild.buildroot.net/results/ca3/ca32c4de8b645c96cedb80b6270a792e9601ad84/
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index f250d01..93919df 100755
+--- a/configure
++++ b/configure
+@@ -368,6 +368,7 @@ linux*)
+ 	echo "DHCPCD_SRCS+=	if-linux.c" >>$CONFIG_MK
+ 	# for RTM_NEWADDR and friends
+ 	echo "#include <asm/types.h> /* fix broken headers */" >>$CONFIG_H
++	echo "#include <sys/socket.h> /* for sa_family_t on old toolchains */" >>$CONFIG_H
+ 	echo "#include <linux/rtnetlink.h>" >>$CONFIG_H
+ 	;;
+ kfreebsd*)
+-- 
+1.9.1
+
-- 
1.9.1
