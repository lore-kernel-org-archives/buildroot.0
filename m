From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 27 Mar 2019 15:01:53 +0100
Subject: [Buildroot] [PATCH] package/mtd: backport patch to remove errors
 for devices without ecc support
Message-ID: <20190327140153.1332-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Since the introduction of mtd-utils 2.0.2, following error can appear on
e.g. flash_erase calls:

    libmtd: error!: ECCGETLAYOUT ioctl request failed
            error 122 (Operation not supported)

The error should only be printed if there was an actual error in the
ECCGETLAYOUT ioctl call, not when the ioctl is not supported.

Backport an upstream patch that fixes this issue.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...nt-an-error-message-for-devices-with.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/mtd/0002-libmtd-don-t-print-an-error-message-for-devices-with.patch

diff --git a/package/mtd/0002-libmtd-don-t-print-an-error-message-for-devices-with.patch b/package/mtd/0002-libmtd-don-t-print-an-error-message-for-devices-with.patch
new file mode 100644
index 0000000000..55de2bf0a8
--- /dev/null
+++ b/package/mtd/0002-libmtd-don-t-print-an-error-message-for-devices-with.patch
@@ -0,0 +1,43 @@
+From a63a209d8ee8f21722a3b07d01d904bca5dbbc31 Mon Sep 17 00:00:00 2001
+From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+Date: Wed, 12 Sep 2018 09:40:34 +0200
+Subject: [PATCH] libmtd: don't print an error message for devices without ecc
+ support
+
+The libmtd library tries to obtain the available OOB size via the sysfs
+with a fallback to the ECCGETLAYOUT ioctl. For some devices (e.g. plat-ram),
+the fallback path is always taken and prints an error message to stderr
+since the ioctl fails.
+
+This patch fixes the fallback path by suppressing the error message if
+errno is set to EOPNOTSUPP (i.e. the device simply doesn't support that).
+
+Fixes: a10353584f93 ("libmtd: Add support to access OOB available size")
+Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
+Reviewed-by: Xiaolei Li <xiaolei.li@mediatek.com>
+Tested-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+[For inclusion in Buildroot:]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+
+---
+ lib/libmtd_legacy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
+index 97fef04..2b7f65f 100644
+--- a/lib/libmtd_legacy.c
++++ b/lib/libmtd_legacy.c
+@@ -235,6 +235,8 @@ int legacy_get_mtd_oobavail(const char *node)
+ 
+ 	ret = ioctl(fd, ECCGETLAYOUT, &usrlay);
+ 	if (ret < 0) {
++		if (errno == EOPNOTSUPP)
++			goto out_close;
+ 		sys_errmsg("ECCGETLAYOUT ioctl request failed");
+ 		goto out_close;
+ 	}
+-- 
+2.19.2
+
-- 
2.19.2
