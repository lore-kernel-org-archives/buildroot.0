From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 15 Oct 2015 16:16:19 +0200
Subject: [Buildroot] [PATCH 1/1] bridge-utils: add upstream patch fixing
	sysfs writes
Message-ID: <1444918579-30926-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Add upstream patch that fixes a sysfs path in br_set.
The patch is on top of the latest release 1.5, which already dates from
2011.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/bridge-utils/0003-sysfs-write-fixes.patch | 79 +++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/bridge-utils/0003-sysfs-write-fixes.patch

diff --git a/package/bridge-utils/0003-sysfs-write-fixes.patch b/package/bridge-utils/0003-sysfs-write-fixes.patch
new file mode 100644
index 0000000..2f36209
--- /dev/null
+++ b/package/bridge-utils/0003-sysfs-write-fixes.patch
@@ -0,0 +1,79 @@
+commit bb9970a9df95837e39d680021b1f73d231e85406
+Author: Stephen Hemminger <shemminger@vyatta.com>
+Date:   Tue May 3 09:52:43 2011 -0700
+
+    Check error returns from write to sysfs
+    
+    Add helper function to check write to sysfs files.
+
+
+[tdescham: this patch also fixes an incorrect path in br_set]
+
+diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
+index aa8bc36..1e83925 100644
+--- a/libbridge/libbridge_devif.c
++++ b/libbridge/libbridge_devif.c
+@@ -280,25 +280,38 @@ fallback:
+ 	return old_get_port_info(brname, port, info);
+ }
+ 
++static int set_sysfs(const char *path, unsigned long value)
++{
++	int fd, ret = 0, cc;
++	char buf[32];
++
++	fd = open(path, O_WRONLY);
++	if (fd < 0)
++		return -1;
++
++	cc = snprintf(buf, sizeof(buf), "%lu\n", value);
++	if (write(fd, buf, cc) < 0)
++		ret = -1;
++	close(fd);
++
++	return ret;
++}
++
+ 
+ static int br_set(const char *bridge, const char *name,
+ 		  unsigned long value, unsigned long oldcode)
+ {
+ 	int ret;
+ 	char path[SYSFS_PATH_MAX];
+-	FILE *f;
+ 
+-	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/%s", bridge, name);
++	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/bridge/%s",
++		 bridge, name);
+ 
+-	f = fopen(path, "w");
+-	if (f) {
+-		ret = fprintf(f, "%ld\n", value);
+-		fclose(f);
+-	} else {
++	if ((ret = set_sysfs(path, value)) < 0) {
+ 		/* fallback to old ioctl */
+ 		struct ifreq ifr;
+ 		unsigned long args[4] = { oldcode, value, 0, 0 };
+-		
++
+ 		strncpy(ifr.ifr_name, bridge, IFNAMSIZ);
+ 		ifr.ifr_data = (char *) &args;
+ 		ret = ioctl(br_socket_fd, SIOCDEVPRIVATE, &ifr);
+@@ -348,14 +361,10 @@ static int port_set(const char *bridge, const char *ifname,
+ {
+ 	int ret;
+ 	char path[SYSFS_PATH_MAX];
+-	FILE *f;
+ 
+ 	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/brport/%s", ifname, name);
+-	f = fopen(path, "w");
+-	if (f) {
+-		ret = fprintf(f, "%ld\n", value);
+-		fclose(f);
+-	} else {
++
++	if ((ret = set_sysfs(path, value)) < 0) {
+ 		int index = get_portno(bridge, ifname);
+ 
+ 		if (index < 0)
-- 
1.9.5
