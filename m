From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 21:54:12 +0200
Subject: [Buildroot] [git commit] bridge-utils: bump to version 1.6
Message-ID: <20161027195417.8AF3A802B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c740bf9c5937cc93746ac0300cb33b8aeb6abf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Change download and homepage to kernel.org, and use .xz tarball.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-fix-for-kernel-headers-3.8+.patch         | 30 --------
 package/bridge-utils/0003-sysfs-write-fixes.patch  | 81 ----------------------
 package/bridge-utils/Config.in                     |  2 +-
 package/bridge-utils/bridge-utils.hash             |  5 +-
 package/bridge-utils/bridge-utils.mk               |  5 +-
 5 files changed, 6 insertions(+), 117 deletions(-)

diff --git a/package/bridge-utils/0002-fix-for-kernel-headers-3.8+.patch b/package/bridge-utils/0002-fix-for-kernel-headers-3.8+.patch
deleted file mode 100644
index 0455a90..0000000
--- a/package/bridge-utils/0002-fix-for-kernel-headers-3.8+.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-commit 5eebb7f9288b7881ffb929b1fd494fe3ac3be27d
-Author: Russell Senior <russell@personaltelco.net>
-Date:   Wed Mar 6 12:49:42 2013 -0800
-
-    bridge-utils: Fix compile against linux-3.8.x
-    
-    Linux 3.8 has a header, include/uapi/linux/if_bridge.h that uses a
-    struct in6_addr but doesn't define it.  The trivial seeming fix of
-    including the header that does define it causes more problems.  The
-    problem was discussed on mailing lists in January 2013.  The final
-    suggestion I found was here:
-    
-          http://www.redhat.com/archives/libvir-list/2013-January/msg01253.html
-    
-    This is intended to implement that suggestion.
-    
-    Signed-off-by: Russell Senior <russell@personaltelco.net>
-
-diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
-index 39964f2..dd14bae 100644
---- a/libbridge/libbridge.h
-+++ b/libbridge/libbridge.h
-@@ -20,6 +20,7 @@
- #define _LIBBRIDGE_H
- 
- #include <sys/socket.h>
-+#include <netinet/in.h>
- #include <linux/if.h>
- #include <linux/if_bridge.h>
- 
diff --git a/package/bridge-utils/0003-sysfs-write-fixes.patch b/package/bridge-utils/0003-sysfs-write-fixes.patch
deleted file mode 100644
index a7ff197..0000000
--- a/package/bridge-utils/0003-sysfs-write-fixes.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-commit bb9970a9df95837e39d680021b1f73d231e85406
-Author: Stephen Hemminger <shemminger@vyatta.com>
-Date:   Tue May 3 09:52:43 2011 -0700
-
-    Check error returns from write to sysfs
-
-    Add helper function to check write to sysfs files.
-
-    Fix incorrect sysfs path in br_set.
-
-[Thomas De Schampheleire: update commit message only]
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
-diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
-index aa8bc36..1e83925 100644
---- a/libbridge/libbridge_devif.c
-+++ b/libbridge/libbridge_devif.c
-@@ -280,25 +280,38 @@ fallback:
- 	return old_get_port_info(brname, port, info);
- }
- 
-+static int set_sysfs(const char *path, unsigned long value)
-+{
-+	int fd, ret = 0, cc;
-+	char buf[32];
-+
-+	fd = open(path, O_WRONLY);
-+	if (fd < 0)
-+		return -1;
-+
-+	cc = snprintf(buf, sizeof(buf), "%lu\n", value);
-+	if (write(fd, buf, cc) < 0)
-+		ret = -1;
-+	close(fd);
-+
-+	return ret;
-+}
-+
- 
- static int br_set(const char *bridge, const char *name,
- 		  unsigned long value, unsigned long oldcode)
- {
- 	int ret;
- 	char path[SYSFS_PATH_MAX];
--	FILE *f;
- 
--	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/%s", bridge, name);
-+	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/bridge/%s",
-+		 bridge, name);
- 
--	f = fopen(path, "w");
--	if (f) {
--		ret = fprintf(f, "%ld\n", value);
--		fclose(f);
--	} else {
-+	if ((ret = set_sysfs(path, value)) < 0) {
- 		/* fallback to old ioctl */
- 		struct ifreq ifr;
- 		unsigned long args[4] = { oldcode, value, 0, 0 };
--		
-+
- 		strncpy(ifr.ifr_name, bridge, IFNAMSIZ);
- 		ifr.ifr_data = (char *) &args;
- 		ret = ioctl(br_socket_fd, SIOCDEVPRIVATE, &ifr);
-@@ -348,14 +361,10 @@ static int port_set(const char *bridge, const char *ifname,
- {
- 	int ret;
- 	char path[SYSFS_PATH_MAX];
--	FILE *f;
- 
- 	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/brport/%s", ifname, name);
--	f = fopen(path, "w");
--	if (f) {
--		ret = fprintf(f, "%ld\n", value);
--		fclose(f);
--	} else {
-+
-+	if ((ret = set_sysfs(path, value)) < 0) {
- 		int index = get_portno(bridge, ifname);
- 
- 		if (index < 0)
diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index 537eb1f..fb9c7df 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_BRIDGE_UTILS
 	  Manage ethernet bridging; a way to connect networks together to
 	  form a larger network.
 
-	  http://linux-net.osdl.org/index.php/Bridge
+	  https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
diff --git a/package/bridge-utils/bridge-utils.hash b/package/bridge-utils/bridge-utils.hash
index c85fd04..e699b24 100644
--- a/package/bridge-utils/bridge-utils.hash
+++ b/package/bridge-utils/bridge-utils.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/bridge/files/bridge/
-md5	ec7b381160b340648dede58c31bb2238	bridge-utils-1.5.tar.gz
-sha1	19d2a58cd3a70f971aa931b40256174a847e60d6	bridge-utils-1.5.tar.gz
+# From https://www.kernel.org/pub/linux/utils/net/bridge-utils/sha256sums.asc
+sha256 cc67efb5d5fb8928a6569b3fade2b4042ec17da04678dab127d96b46489e26c8 bridge-utils-1.6.tar.xz
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index ae4c419..efe57cd 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-BRIDGE_UTILS_VERSION = 1.5
-BRIDGE_UTILS_SITE = http://downloads.sourceforge.net/project/bridge/bridge
+BRIDGE_UTILS_VERSION = 1.6
+BRIDGE_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/bridge-utils
+BRIDGE_UTILS_SOURCE = bridge-utils-1.6.tar.xz
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_CONF_OPTS = --with-linux-headers=$(LINUX_HEADERS_DIR)
 BRIDGE_UTILS_LICENSE = GPLv2+
