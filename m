From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 19:54:03 +0200
Subject: [Buildroot] [git commit] busybox: add 1.20.0 patch for mdev and
	update buildsys patch
Message-ID: <20120520180450.CE78F96D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a41ddd3fb670f5c59a4e8db605874951c56d756
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.20.0/busybox-1.20.0-buildsys.patch   |    9 +++
 .../busybox-1.20.0/busybox-1.20.0-mdev.patch       |   72 ++++++++++++++++++++
 2 files changed, 81 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
index b9d2a5e..ae9ea5c 100644
--- a/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
@@ -1,5 +1,14 @@
 --- busybox-1.20.0/archival/libarchive/Kbuild.src
 +++ busybox-1.20.0-buildsys/archival/libarchive/Kbuild.src
+@@ -45,7 +45,7 @@ lib-$(CONFIG_UNXZ)
+ lib-$(CONFIG_CPIO)                      += get_header_cpio.o
+ lib-$(CONFIG_DPKG)                      += $(DPKG_FILES)
+ lib-$(CONFIG_DPKG_DEB)                  += $(DPKG_FILES)
+-lib-$(CONFIG_GUNZIP)                    += decompress_gunzip.o
++lib-$(CONFIG_GUNZIP)                    += open_transformer.o decompress_gunzip.o
+ lib-$(CONFIG_RPM2CPIO)                  += decompress_gunzip.o get_header_cpio.o
+ lib-$(CONFIG_RPM)                       += open_transformer.o decompress_gunzip.o get_header_cpio.o
+ lib-$(CONFIG_TAR)                       += get_header_tar.o
 @@ -60,7 +60,7 @@ lib-$(CONFIG_FEATURE_SEAMLESS_GZ)
  lib-$(CONFIG_FEATURE_SEAMLESS_BZ2)      += open_transformer.o decompress_bunzip2.o
  lib-$(CONFIG_FEATURE_SEAMLESS_LZMA)     += open_transformer.o decompress_unlzma.o
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-mdev.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-mdev.patch
new file mode 100644
index 0000000..8a36c53
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-mdev.patch
@@ -0,0 +1,72 @@
+--- busybox-1.20.0/util-linux/mdev.c
++++ busybox-1.20.0-mdev/util-linux/mdev.c
+@@ -661,37 +661,45 @@ static int FAST_FUNC dirAction(const cha
+ static void load_firmware(const char *firmware, const char *sysfs_path)
+ {
+ 	int cnt;
+-	int firmware_fd, loading_fd, data_fd;
++	int firmware_fd, loading_fd;
+ 
+ 	/* check for /lib/firmware/$FIRMWARE */
+ 	xchdir("/lib/firmware");
+-	firmware_fd = xopen(firmware, O_RDONLY);
+-
+-	/* in case we goto out ... */
+-	data_fd = -1;
++	firmware_fd = open(firmware, O_RDONLY); /* can fail */
+ 
+ 	/* check for /sys/$DEVPATH/loading ... give 30 seconds to appear */
+ 	xchdir(sysfs_path);
+ 	for (cnt = 0; cnt < 30; ++cnt) {
+ 		loading_fd = open("loading", O_WRONLY);
+-		if (loading_fd != -1)
++		if (loading_fd >= 0)
+ 			goto loading;
+ 		sleep(1);
+ 	}
+ 	goto out;
+ 
+  loading:
+-	/* tell kernel we're loading by "echo 1 > /sys/$DEVPATH/loading" */
+-	if (full_write(loading_fd, "1", 1) != 1)
+-		goto out;
+-
+-	/* load firmware into /sys/$DEVPATH/data */
+-	data_fd = open("data", O_WRONLY);
+-	if (data_fd == -1)
+-		goto out;
+-	cnt = bb_copyfd_eof(firmware_fd, data_fd);
++	cnt = 0;
++	if (firmware_fd >= 0) {
++		int data_fd;
++
++		/* tell kernel we're loading by "echo 1 > /sys/$DEVPATH/loading" */
++		if (full_write(loading_fd, "1", 1) != 1)
++			goto out;
++
++		/* load firmware into /sys/$DEVPATH/data */
++		data_fd = open("data", O_WRONLY);
++		if (data_fd < 0)
++			goto out;
++		cnt = bb_copyfd_eof(firmware_fd, data_fd);
++		if (ENABLE_FEATURE_CLEAN_UP)
++			close(data_fd);
++	}
+ 
+-	/* tell kernel result by "echo [0|-1] > /sys/$DEVPATH/loading" */
++	/* Tell kernel result by "echo [0|-1] > /sys/$DEVPATH/loading"
++	 * Note: we emit -1 if firmware file wasn't found.
++	 * There are cases when otherwise kernel would wait for minutes
++	 * before timing out.
++	 */
+ 	if (cnt > 0)
+ 		full_write(loading_fd, "0", 1);
+ 	else
+@@ -701,7 +709,6 @@ static void load_firmware(const char *fi
+ 	if (ENABLE_FEATURE_CLEAN_UP) {
+ 		close(firmware_fd);
+ 		close(loading_fd);
+-		close(data_fd);
+ 	}
+ }
+ 
